'use client'
import { Cart } from '@/app/types/cart'
import { ReservationDetailResponse } from '@/app/types/reservationDetailResponse'
import { User } from '@/app/types/user'
import { UserCartsInfoResponse } from '@/app/types/userCartsInfoResponse'
import { Button } from '@/components/ui/button'
import { Separator } from '@/components/ui/separator'
import { useToast } from '@/components/ui/use-toast'
import { useState } from 'react'
import UserOrderList from './UserOrderList'

interface OrderCardProps {
  reservationInfo: ReservationDetailResponse | undefined
  myInfo: User | undefined
  myCarts: Cart[]
}

type UserCartsWithPaidStatus = {
  userCarts: UserCartsInfoResponse
  isPaid: boolean
}

export default function OrderCard(props: OrderCardProps) {
  const { reservationInfo, myInfo, myCarts } = props
  const [sharedOrder, setSharedOrder] = useState<Cart[]>([])
  const [isPaid, setIsPaid] = useState(false)

  const { toast } = useToast()

  const handleShare = (id: number) => {
    const cartItem = myCarts.find((cart) => cart.id == id)
    if (cartItem) {
      setSharedOrder([...sharedOrder, cartItem])
    }
  }

  const handleSave = (id: number, quantity: number) => {
    setSharedOrder((prev) => {
      return prev.map((orderItem) => {
        if (orderItem.id == id) return { ...orderItem, quantity: quantity }
        return orderItem
      })
    })
  }

  const myUserCartsWithPaidStatus: UserCartsWithPaidStatus = {
    userCarts: {
      id: myInfo?.id || 0,
      username: myInfo?.username || '',
      profileImageUrl: myInfo?.profileImageUrl || '',
      currentCarts:
        myCarts.length > 0
          ? myCarts
          : reservationInfo?.orders.find((order) => order.userId === myInfo?.id)
              ?.carts || [],
    },
    isPaid: !!reservationInfo?.orders.find(
      (order) => order.userId === myInfo?.id,
    ),
  }

  const getOtherOrdersWithPaidStatus = (): UserCartsWithPaidStatus[] => {
    const otherUserCarts: UserCartsInfoResponse[] = [
      ...(reservationInfo?.invitees.filter(
        (invitee) => invitee.id !== myInfo?.id,
      ) || []),
    ]

    if (reservationInfo?.host.id !== myInfo?.id) {
      otherUserCarts.push({
        id: reservationInfo?.host.id || 0,
        username: reservationInfo?.host.username || '',
        profileImageUrl: reservationInfo?.host.profileImageUrl || '',
        currentCarts: reservationInfo?.host.currentCarts || [],
      })
    }

    const otherUserCartsWithPaidStatus = otherUserCarts.map((otherUserCart) => {
      const foundOrder = reservationInfo?.orders.find(
        (o) => o.userId === otherUserCart.id,
      )

      if (foundOrder) {
        return {
          userCarts: {
            ...otherUserCart,
            currentCarts: foundOrder.carts,
          },
          isPaid: true,
        }
      } else {
        return { userCarts: { ...otherUserCart }, isPaid: false }
      }
    })

    return otherUserCartsWithPaidStatus
  }

  return (
    <>
      <div className="w-full mt-4">
        <div className="border-2 bg-white/50 dark:bg-black/50 rounded-xl p-4 h-fit">
          <div className="text-xl font-bold mb-4">Order Information</div>
          <Separator className="mb-4 h-[2px]" />

          <p className="text-lg font-semibold mt-4">My Order</p>
          <UserOrderList
            data={myUserCartsWithPaidStatus.userCarts}
            isPaid={myUserCartsWithPaidStatus.isPaid}
          />

          <p className="text-lg font-semibold mt-4">Members Order</p>
          {getOtherOrdersWithPaidStatus().map((otherOrderWithPaidStatus) => (
            <UserOrderList
              key={otherOrderWithPaidStatus.userCarts.id}
              data={otherOrderWithPaidStatus.userCarts}
              isPaid={otherOrderWithPaidStatus.isPaid}
            />
          ))}

          {/* <p className="text-lg font-semibold mt-4">Shared Order</p>
          <p className="text-base font-medium my-1">Cart</p>
          {isPaid ? (
            <div className="flex justify-end my-4">Already paid!</div>
          ) : (
            <div className="flex justify-end items-center text-lg gap-2 m-4">
              <FaWonSign />
              1000
              <Button
                className="bg-yellow-300 hover:bg-yellow-400 text-black text-lg"
                onClick={() => {
                  setIsPaid(true)
                  setSharedOrder([])
                }}
              >
                <RiKakaoTalkFill className="mr-2" /> Pay
              </Button>
            </div>
          )}

          <SharedCartTable
            data={sharedOrder}
            save={(id: number, quantity: number) => handleSave(id, quantity)}
          />
          <p className="text-base font-medium my-1">Paid</p>
          <UserOrderTable data={[]} /> */}

          <div className="flex justify-end mt-4">
            <Button
              className=" bg-violet-500 rounded-full"
              onClick={() => console.log('add cart')}
            >
              Confirm Reservation
            </Button>
          </div>
        </div>
      </div>
    </>
  )
}
