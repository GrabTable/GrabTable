'use client'
import { UserCard } from '@/components/UserCard'
import Spinner from '@/components/spinner'
import { Input } from '@/components/ui/Input'
import { Button } from '@/components/ui/button'
import { ScrollArea } from '@/components/ui/scroll-area'
import { Separator } from '@/components/ui/separator'
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from '@/components/ui/table'
import { Toaster } from '@/components/ui/toaster'
import { useToast } from '@/components/ui/use-toast'
import { BASE_URL } from '@/lib/constants'
import getSessionFromClient from '@/lib/next-auth/getSessionFromClient'
import { EventSourcePolyfill } from 'event-source-polyfill'
import Image from 'next/image'
import { useRouter } from 'next/navigation'
import { useEffect, useState } from 'react'
import { RiKakaoTalkFill } from 'react-icons/ri'
import { Cart } from '../types/cart'
import { Menu } from '../types/menu'
import { OrderResponse } from '../types/orderResponse'
import { ReservationDetailResponse } from '../types/reservationDetailResponse'
import { UserCartsInfoResponse } from '../types/userCartsInfoResponse'

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
      .then(() =>
        toast({
          title: 'Successfully added!',
          description: 'grab more!',
          duration: 1000,
        }),
      )
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

  const getReservationDetail = async (): Promise<ReservationDetailResponse> => {
    const session = await getSessionFromClient()
    const response = await fetch(`${BASE_URL}/v1/reservations/me`, {
      headers: {
        'Content-Type': 'application/json',
        Authorization: 'Bearer ' + session.formData['access_token'],
      },
      credentials: 'include',
    })
    const data = await response.json()

    if (!response.ok) throw new Error('Failed to fetch orders')

    const orderedUserIds = data.orders.map(
      (order: OrderResponse) => order.userId,
    ) // 주문들의 ID 배열 생성

    const allParticipantIds = [
      data.host.id,
      ...data.invitees.map((invitee: UserCartsInfoResponse) => invitee.id),
    ]

    const allMatched = allParticipantIds.every((participantId) =>
      orderedUserIds.includes(participantId),
    )

    setOrderConfirm(allMatched)
    return data as ReservationDetailResponse
  }

  const getMyCart = async () => {
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
    return await response.json()
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
        <ScrollArea className="h-[50rem]">
          <Table>
            <TableHeader>
              <TableRow>
                <TableHead className="w-[300px]">Image</TableHead>
                <TableHead className="w-[80px]">Menu</TableHead>
                <TableHead className="w-[100px]" />
              </TableRow>
            </TableHeader>
            <TableBody>
              {menus.map((menu) => {
                const cartItem: Cart | undefined = myCarts?.find(
                  (cart: Cart) => cart.menuName === menu.menuName,
                )
                const getInitialQuantity = () => {
                  return cartItem?.quantity ? cartItem?.quantity : 0
                }

                const [quantity, setQuantity] = useState(getInitialQuantity)
                useEffect(() => {
                  setQuantity(cartItem?.quantity || 0)
                }, [cartItem?.quantity || 0])
                return (
                  <TableRow key={menu.id}>
                    <TableCell>
                      <Image
                        src={'/Western.jpeg'}
                        alt="No Restaurant Image"
                        width={300}
                        height={200}
                      />
                    </TableCell>
                    <TableCell className="text-right">
                      <p className="font-medium">{menu.menuName}</p>₩
                      {menu.price}
                    </TableCell>
                    <TableCell className="w-fit">
                      <div className="flex justify-end">
                        <div className="flex items-center justify-center space-x-2">
                          {cartItem ? (
                            <>
                              <Input
                                type="number"
                                min={0}
                                value={quantity}
                                onChange={(e) => {
                                  setQuantity(parseInt(e.target.value))
                                }}
                                className="w-[4rem]"
                              />
                              <Button
                                className="bg-yellow-300 hover:bg-yellow-500 text-black rounded-full"
                                onClick={() => editCart(cartItem.id, quantity)}
                              >
                                Edit
                              </Button>
                            </>
                          ) : (
                            <>
                              <Input
                                type="number"
                                min={0}
                                defaultValue={0}
                                onChange={(e) => {
                                  setQuantity(parseInt(e.target.value))
                                }}
                                className="w-[4rem]"
                              />
                              <Button
                                className="bg-green-400 hover:bg-green-600 rounded-full"
                                onClick={() => addCart(menu.id, quantity)}
                              >
                                Add
                              </Button>
                            </>
                          )}
                        </div>
                      </div>
                    </TableCell>
                  </TableRow>
                )
              })}
            </TableBody>
          </Table>
        </ScrollArea>
        <Button
          className="w-full mt-4 bg-yellow-300 hover:bg-yellow-400 text-black text-xl"
          onClick={handlePayment}
        >
          <RiKakaoTalkFill className="mr-2" /> Pay
        </Button>
        {/* <Page/> */}
      </div>

      <div className="w-[50rem] p-4">
        <div className="border-2 bg-white/50 dark:bg-black/50 rounded-xl p-4 h-fit">
          <div className="text-xl font-bold mb-4">Group Order</div>
          <Separator className="mb-4 h-[2px]" />
          {/* <UserListView orders={orders} /> */}
          <div className="flex flex-col space-y-4">
            {reservationInfo && hostUser && inviteesUsers && (
              <UserCard key={hostUser.username} user={hostUser} />
            )}
            {(inviteesUsers || []).map((invitee: any, index: any) => (
              <UserCard key={invitee.username + index} user={invitee} />
            ))}
          </div>
          <div className="flex justify-end mt-4">
            {isHost && orderConfirm && (
              <Button className="w-full bg-violet-500" onClick={confimation}>
                Reservation confirmation
              </Button>
            )}
          </div>
        </div>
      </div>
      <Toaster />
    </div>
  )
}
