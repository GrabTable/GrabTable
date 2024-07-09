'use client'
import MenuTable from '@/components/MenuTable'
import Spinner from '@/components/spinner'
import { Toaster } from '@/components/ui/toaster'
import { useToast } from '@/components/ui/use-toast'
import { BASE_API_URL } from '@/lib/constants'
import getSessionFromClient from '@/lib/next-auth/getSessionFromClient'
import { EventSourcePolyfill } from 'event-source-polyfill'
import { useRouter } from 'next/navigation'
import { useEffect, useState } from 'react'
import OrderCard from '../../components/OrderCard'
import { Cart } from '../types/cart'
import { Menu } from '../types/menu'
import { Reservation } from '../types/reservation'
import { User } from '../types/user'

interface MyReservationProps {
  storeID: number
  menus: Menu[]
}

export default function MyReservation(props: MyReservationProps) {
  const { storeID, menus } = props
  const { toast } = useToast()
  const router = useRouter()
  const [orderConfirm, setOrderConfirm] = useState(false)
  const [loading, setLoading] = useState(false)
  const [myCarts, setMyCarts] = useState<Cart[]>([])
  const [myInfo, setMyInfo] = useState<User>()
  const [reservationInfo, setReservationInfo] = useState<Reservation>()

  useEffect(() => {
    const getReservationDetailWithSse = async () => {
      const session = await getSessionFromClient()
      const EventSource = EventSourcePolyfill || window.EventSource

      const eventSource = new EventSource(
        `${BASE_API_URL}/v1/reservations/me/subscribe`,
        {
          headers: {
            Authorization: 'Bearer ' + session.formData['accessToken'],
          },
          withCredentials: true,
        },
      )

      eventSource.addEventListener('reservation', (event: any) => {
        const data = JSON.parse(event.data) // 이벤트 데이터 파싱
        console.log(data)
        setReservationInfo(data)
        getMyCart().then((data) => setMyCarts(data))
        getMyInfo().then((data) => setMyInfo(data))
      })

      eventSource.onerror = (error) => {
        console.error('EventSource failed:', error)
        if (eventSource.readyState === EventSource.CLOSED) {
          console.log('Reconnecting SSE...')
          setTimeout(() => {
            getReservationDetailWithSse()
          }, 3000) // 3초 후에 재연결 시도
        }
      }

      return () => {
        eventSource.close() // 컴포넌트 언마운트 시 EventSource 닫기
      }
    }

    getReservationDetailWithSse()
  }, []) // 빈 배열을 의존성으로 사용하여 컴포넌트 마운트 시 한 번만 실행

  const addCart = async (menuId: number, quantity: number) => {
    const session = await getSessionFromClient()

    if (quantity === 0) {
      return
    }

    await fetch(`${BASE_API_URL}/v1/carts`, {
      method: 'POST',
      body: JSON.stringify({
        menuId: menuId,
        quantity: quantity,
      }),
      headers: {
        'Content-Type': 'application/json',
        Authorization: 'Bearer ' + session.formData['accessToken'],
      },
      credentials: 'include',
    }).then(async (res) => {
      if (res.ok) {
        toast({
          title: 'Successfully added!',
          description: 'grab more!',
          duration: 1000,
        })
        getMyCart().then((data) => setMyCarts(data))
        return
      }
      const data = await res.json()
      if (data.code === 5005) {
        toast({
          title: '이미 결제를 완료했습니다.',
          description: 'You cannot modify cart after payment',
          duration: 1000,
        })
        return
      }
    })
  }

  const addCartInSharedOrder = async (menuId: number, quantity: number) => {
    const session = await getSessionFromClient()

    if (quantity === 0) {
      return
    }

    await fetch(`${BASE_API_URL}/v1/carts/shared`, {
      method: 'POST',
      body: JSON.stringify({
        menuId: menuId,
        quantity: quantity,
      }),
      headers: {
        'Content-Type': 'application/json',
        Authorization: 'Bearer ' + session.formData['accessToken'],
      },
      credentials: 'include',
    }).then(async (res) => {
      const data = await res.json()
      if (data.code === 5006) {
        toast({
          title: data.message,
          description: 'You cannot modify cart after payment',
          duration: 1000,
        })
        return
      }
      toast({
        title: 'Successfully added!',
        description: 'grab more!',
        duration: 1000,
      })
    })
  }

  const getMyInfo = async (): Promise<User> => {
    const session = await getSessionFromClient()
    const response = await fetch(`${BASE_API_URL}/v1/user/me`, {
      method: 'GET',
      headers: {
        'Content-Type': 'application/json',
        Authorization: 'Bearer ' + session.formData['accessToken'],
      },
      credentials: 'include',
    })

    return response.json()
  }

  const getMyCart = async (): Promise<Cart[]> => {
    const session = await getSessionFromClient()
    const response = await fetch(`${BASE_API_URL}/v1/carts/me`, {
      method: 'GET',
      headers: {
        'Content-Type': 'application/json',
        Authorization: 'Bearer ' + session.formData['accessToken'],
      },
      credentials: 'include',
    })

    if (!response.ok) throw new Error('Failed to fetch Mycart')
    return response.json()
  }

  if (!reservationInfo || !myInfo) {
    return <Spinner />
  }

  return (
    <div className="flex flex-col md:flex-row justify-between">
      <div className="w-full mr-4 ">
        {loading && <Spinner />}
        <MenuTable
          menus={menus}
          addCart={addCart}
          addCartInSharedOrder={addCartInSharedOrder}
        />
      </div>
      <OrderCard
        reservationInfo={reservationInfo}
        myInfo={myInfo}
        myCarts={myCarts}
      />
      <Toaster />
    </div>
  )
}
