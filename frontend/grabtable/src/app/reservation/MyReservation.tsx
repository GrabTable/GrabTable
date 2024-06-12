'use client'
import MenuTable from '@/components/MenuTable'
import Spinner from '@/components/spinner'
import { Button } from '@/components/ui/button'
import { Toaster } from '@/components/ui/toaster'
import { useToast } from '@/components/ui/use-toast'
import { BASE_URL } from '@/lib/constants'
import getSessionFromClient from '@/lib/next-auth/getSessionFromClient'
import { EventSourcePolyfill } from 'event-source-polyfill'
import { useRouter } from 'next/navigation'
import { useEffect, useState } from 'react'
import { RiKakaoTalkFill } from 'react-icons/ri'
import OrderCard from '../temp/_components/OrderCard'
import { Cart } from '../types/cart'
import { Menu } from '../types/menu'
import { ReservationDetailResponse } from '../types/reservationDetailResponse'
import { User } from '../types/user'

interface MyReservationProps {
  storeID: number
  menus: Menu[]
  isHost: boolean
}

export default function MyReservation(props: MyReservationProps) {
  const { menus, isHost } = props
  const { toast } = useToast()
  const router = useRouter()
  const [orderConfirm, setOrderConfirm] = useState(false)
  const [loading, setLoading] = useState(false)
  const [myCarts, setMyCarts] = useState<Cart[]>([])
  const [myInfo, setMyInfo] = useState<User>()
  const [reservationInfo, setReservationInfo] =
    useState<ReservationDetailResponse>()

  useEffect(() => {
    const getReservationDetailWithSse = async () => {
      const session = await getSessionFromClient()
      const EventSource = EventSourcePolyfill || window.EventSource

      const eventSource = new EventSource(
        `${BASE_URL}/v1/reservations/me/subscribe`,
        {
          headers: {
            Authorization: 'Bearer ' + session.formData['access_token'],
          },
          withCredentials: true,
        },
      )

      eventSource.addEventListener('reservation', (event: any) => {
        const data = JSON.parse(event.data) // 이벤트 데이터 파싱
        console.log(data)
        setReservationInfo(data)
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

  useEffect(() => {
    getMyCart().then((data) => setMyCarts(data))
    getMyInfo().then((data) => setMyInfo(data))
  }, [])

  const addCart = async (menuId: number, quantity: number) => {
    const session = await getSessionFromClient()

    if (quantity === 0) {
      return
    }

    await fetch(`${BASE_URL}/v1/carts`, {
      method: 'POST',
      body: JSON.stringify({
        menuId: menuId,
        quantity: quantity,
      }),
      headers: {
        'Content-Type': 'application/json',
        Authorization: 'Bearer ' + session.formData['access_token'],
      },
      credentials: 'include',
    })
      .then(() => {
        toast({
          title: 'Successfully added!',
          description: 'grab more!',
          duration: 1000,
        })
        getMyCart().then((data) => setMyCarts(data))
        return
      })
      .catch((error) => {
        toast({
          title: 'Failed to add',
          description: 'Please try again',
          duration: 1000,
        })
      })
  }

  const editCart = async (cartId: number, quantity: number) => {
    const session = await getSessionFromClient()
    if (quantity === 0) {
      await fetch(`${BASE_URL}/v1/carts/${cartId}`, {
        method: 'DELETE',
        headers: {
          'Content-Type': 'application/json',
          Authorization: 'Bearer ' + session.formData['access_token'],
        },
        credentials: 'include',
      })
        .then(() => {
          toast({
            title: 'Successfully deleted!',
            duration: 1000,
          })
          getMyCart().then((data) => setMyCarts(data))
          return
        })
        .catch((error) => {
          toast({
            title: 'Failed to delete',
            description: 'Please try again',
            duration: 1000,
          })
        })
    }

    // 0개가 아니라면, 수정
    await fetch(`${BASE_URL}/v1/carts/${cartId}`, {
      method: 'PATCH',
      body: JSON.stringify({
        quantity: quantity,
      }),
      headers: {
        'Content-Type': 'application/json',
        Authorization: 'Bearer ' + session.formData['access_token'],
      },
      credentials: 'include',
    })
      .then(() => {
        toast({
          title: 'Successfully updated!',
          duration: 1000,
        })
        getMyCart().then((data) => setMyCarts(data))
        return
      })
      .catch((error) => {
        toast({
          title: 'Failed to update',
          description: 'Please try again',
          duration: 1000,
        })
      })
  }

  const getMyInfo = async (): Promise<User> => {
    const session = await getSessionFromClient()
    const response = await fetch(`${BASE_URL}/v1/user/me`, {
      method: 'GET',
      headers: {
        'Content-Type': 'application/json',
        Authorization: 'Bearer ' + session.formData['access_token'],
      },
      credentials: 'include',
    })

    return response.json()
  }

  const getMyCart = async (): Promise<Cart[]> => {
    const session = await getSessionFromClient()
    const response = await fetch(`${BASE_URL}/v1/carts/me`, {
      method: 'GET',
      headers: {
        'Content-Type': 'application/json',
        Authorization: 'Bearer ' + session.formData['access_token'],
      },
      credentials: 'include',
    })

    if (!response.ok) throw new Error('Failed to fetch Mycart')
    return response.json()
  }

  const handlePayment = () => {
    window.location.href = '/reservation/payment'
  }

  const hostUser = {
    username: reservationInfo?.host.username,
    profileImageUrl: reservationInfo?.host.profileImageUrl,
    id: reservationInfo?.host.id,
    cartItems: reservationInfo?.host.currentCarts.map(
      (cart: {
        menuName: any
        quantity: any
        price: any
        totalPrice: any
      }) => ({
        menuName: cart.menuName,
        quantity: cart.quantity,
        unitPrice: cart.price,
        totalPrice: cart.totalPrice,
      }),
    ),
  }

  const inviteesUsers = reservationInfo?.invitees.map(
    (invitee: {
      username: any
      profileImageUrl: any
      id: number
      currentCarts: any[]
    }) => ({
      username: invitee.username,
      id: invitee.id,
      profileImageUrl: invitee.profileImageUrl,
      cartItems: invitee.currentCarts.map((cart) => ({
        menuName: cart.menuName,
        quantity: cart.quantity,
        unitPrice: cart.price,
        totalPrice: cart.totalPrice,
      })),
    }),
  )
  const confimation = async () => {
    setLoading(true)
    const session = await getSessionFromClient()
    const response = await fetch(`${BASE_URL}/v1/reservations/confirm`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        Authorization: 'Bearer ' + session.formData['access_token'],
      },
      credentials: 'include',
    })

    setTimeout(() => {
      toast({
        title: 'Confirmed',
        description: 'Enjoy!',
        duration: 1000,
      })

      setTimeout(() => {
        router.push('/')
      }, 1500)

      setLoading(false)
    }, 1000)
  }

  return (
    <div className="flex justify-between">
      <div className="w-full mr-4 ">
        {loading && <Spinner />}
        <MenuTable
          menus={menus}
          carts={myCarts}
          addCart={addCart}
          editCart={editCart}
        />
        <Button
          className="w-full mt-4 bg-yellow-300 hover:bg-yellow-400 text-black text-xl"
          onClick={handlePayment}
        >
          <RiKakaoTalkFill className="mr-2" /> Pay
        </Button>
        {/* <Page/> */}
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
