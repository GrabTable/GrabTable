'use client'
import { Cart } from '@/app/types/cart'
import { Reservation } from '@/app/types/reservation'
import { User } from '@/app/types/user'
import { UserCartsInfo } from '@/app/types/userCartsInfo'
import { Button } from '@/components/ui/button'
import { Separator } from '@/components/ui/separator'
import { toast } from '@/components/ui/use-toast'
import { BASE_API_URL } from '@/lib/constants'
import getSessionFromClient from '@/lib/next-auth/getSessionFromClient'
import { useRouter } from 'next/navigation'
import SharedCartTable from './SharedCartTable'
import UserOrderList from './UserOrderList'

interface OrderCardProps {
  reservationInfo: Reservation
  myInfo: User
  myCarts: Cart[]
}

type UserCartsWithPaidStatus = {
  userCarts: UserCartsInfo
  isPaid: boolean
}

export default function OrderCard({
  reservationInfo,
  myInfo,
  myCarts,
}: OrderCardProps) {
  const router = useRouter()

  const deleteCart = async (cartId: number, accessToken: string) => {
    await fetch(`${BASE_API_URL}/v1/carts/${cartId}`, {
      method: 'DELETE',
      headers: {
        'Content-Type': 'application/json',
        Authorization: 'Bearer ' + accessToken,
      },
      credentials: 'include',
    })
      .then(() => {
        toast({
          title: 'Successfully deleted!',
          duration: 1000,
        })
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

  const editCart = async (
    cartId: number,
    quantity: number,
    accessToken: string,
  ) => {
    if (quantity === 0) {
      deleteCart(cartId, accessToken)
      return
    }

    await fetch(`${BASE_API_URL}/v1/carts/${cartId}`, {
      method: 'PATCH',
      body: JSON.stringify({
        quantity: quantity,
      }),
      headers: {
        'Content-Type': 'application/json',
        Authorization: 'Bearer ' + accessToken,
      },
      credentials: 'include',
    })
      .then(() => {
        toast({
          title: 'Successfully updated!',
          duration: 1000,
        })
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

  const onQuantityChange = async (cartId: number, quantity: number) => {
    const session = await getSessionFromClient()
    const accessToken = session.formData['accessToken']

    if (quantity === 0) {
      deleteCart(cartId, accessToken)
      return
    }

    editCart(cartId, quantity, accessToken)
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
    const otherUserCarts: UserCartsInfo[] = [
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

  const confirmReservation = async () => {
    const session = await getSessionFromClient()
    await fetch(`${BASE_API_URL}/v1/reservations/confirm`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        Authorization: 'Bearer ' + session.formData['accessToken'],
      },
      credentials: 'include',
    }).then(async (res) => {
      if (res.status !== 201) {
        const data = await res.json()
        toast({
          title: data.message,
          description: 'Please try again',
          duration: 1000,
        })
      } else {
        toast({
          title: 'Confirmed',
          description: 'Enjoy!',
          duration: 1000,
        })
        router.push('/')
      }
    })
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
            isHost={
              reservationInfo.host.id === myUserCartsWithPaidStatus.userCarts.id
            }
            onQuantityChange={onQuantityChange}
            viewOnly={false}
            payable={true}
          />

          <p className="text-lg font-semibold mt-4">Members Order</p>
          {getOtherOrdersWithPaidStatus().map((otherOrderWithPaidStatus) => (
            <UserOrderList
              data={otherOrderWithPaidStatus.userCarts}
              isPaid={otherOrderWithPaidStatus.isPaid}
              isHost={
                reservationInfo.host.id ===
                myUserCartsWithPaidStatus.userCarts.id
              }
              viewOnly={true}
            />
          ))}

          <SharedCartTable data={reservationInfo} />

          <div className="mt-4">
            <Button
              className=" bg-violet-500 rounded-full"
              onClick={confirmReservation}
            >
              Confirm Reservation
            </Button>
          </div>
        </div>
      </div>
    </>
  )
}
