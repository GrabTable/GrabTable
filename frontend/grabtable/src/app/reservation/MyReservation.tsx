'use client'
import MenuTable from '@/components/MenuTable'
import Spinner from '@/components/spinner'
import { Toaster } from '@/components/ui/toaster'
import { getMyCart } from '@/lib/api/getMyCart'
import { getMyInfo } from '@/lib/api/getMyInfo'
import { BASE_API_URL } from '@/lib/constants'
import getSessionFromClient from '@/lib/next-auth/getSessionFromClient'
import { EventSourcePolyfill } from 'event-source-polyfill'
import { useRouter } from 'next/navigation'
import { useEffect, useState } from 'react'
import OrderCard from '../../components/OrderCard'
import { Cart } from '../../lib/types/cart'
import { Menu } from '../../lib/types/menu'
import { Reservation } from '../../lib/types/reservation'
import { User } from '../../lib/types/user'

interface MyReservationProps {
  storeID: number
  menus: Menu[]
}

export default function MyReservation(props: MyReservationProps) {
  const { storeID, menus } = props
  const router = useRouter()
  const { toast } = useToast()
  const [loading, setLoading] = useState(false)
  const [myCarts, setMyCarts] = useState<Cart[]>([])
  const [myInfo, setMyInfo] = useState<User | null>()
  const [reservationInfo, setReservationInfo] = useState<Reservation>()

  const getReservationDetailWithSse = async () => {
    const session = await getSessionFromClient()
    const EventSource = EventSourcePolyfill || window.EventSource

    const eventSource = new EventSource(
      `${BASE_API_URL}/v1/reservations/me/subscribe`,
      {
        headers: {
          Authorization: 'Bearer ' + session.formData['accessToken'],
          Accept: 'text/event-stream',
          Cache: 'no-cache',
        },
        heartbeatTimeout: 1000 * 60 * 10,
        withCredentials: true,
      },
    )

    eventSource.addEventListener('reservationUpdate', (event: any) => {
      const data = JSON.parse(event.data) // 이벤트 데이터 파싱
      console.log(data)
      setReservationInfo(data.details)
      getMyCart().then((data) => setMyCarts(data))
      getMyInfo().then((data) => setMyInfo(data))
    })

    eventSource.addEventListener('reservationFinish', (event: any) => {
      const data = JSON.parse(event.data) // 이벤트 데이터 파싱
      console.log(data)
      toast({
        title: '예약이 종료되었습니다. 홈으로 이동합니다.',
        description: 'Current Reservation was confirmed or destroyed.',
        duration: 1500,
      })

      setTimeout(() => {
        router.push('/')
      }, 1500)
    })

    eventSource.onerror = (error) => {
      eventSource.close()
    }

    return () => {
      eventSource.close() // 컴포넌트 언마운트 시 EventSource 닫기
    }
  }

  useEffect(() => {
    getReservationDetailWithSse()
  }, []) // 빈 배열을 의존성으로 사용하여 컴포넌트 마운트 시 한 번만 실행

  if (!reservationInfo || !myInfo) {
    return <Spinner />
  }

  return (
    <div className="flex flex-col md:flex-row justify-between">
      <div className="w-full mr-4 ">
        {loading && <Spinner />}
        <MenuTable menus={menus} />
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
