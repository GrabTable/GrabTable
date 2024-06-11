'use client'
import { Separator } from '@/components/ui/separator'
import UserOrderList from './UserOrderList'
import { Button } from '@/components/ui/button'
import { Cart, Reservation, User, UserCart } from '../_types/type'
import MyCartTable from './MyCartTable'
import { useEffect, useState } from 'react'
import SharedCartTable from './SharedCartTable'
import UserOrderTable from './UserOrderTable'
import { RiKakaoTalkFill } from 'react-icons/ri'
import { FaWonSign } from 'react-icons/fa6'
import { useToast } from '@/components/ui/use-toast'

async function getReservation(): Promise<Reservation> {
  // TODO: fetch data from API
  return {
    id: 1,
    storeId: 1,
    host: {
      id: 1,
      username: 'host',
      profileImageUrl: '/favicon.ico',
      currentCarts: [],
    },
    invitees: [
      {
        id: 1,
        username: 'me',
        profileImageUrl: '/favicon.ico',
        currentCarts: [
          {
            id: 101,
            menuName: 'cake',
            price: 1000,
            quantity: 2,
            totalPrice: 2000,
          },
        ],
      },
      {
        id: 2,
        username: 'user2',
        profileImageUrl: '',
        currentCarts: [
          {
            id: 102,
            quantity: 2,
            menuName: 'cake',
            price: 1000,
            totalPrice: 2000,
          },
        ],
      },
    ],
    inviteCode: 'invite-code',
    sharedOrder: [
      {
        id: 103,
        menuName: 'orange',
        price: 1500,
        quantity: 2,
        totalPrice: 2000,
      },
    ],
    orders: [
      {
        id: 1,
        username: 'me',
        profileImageUrl: '/favicon.ico',
        currentCarts: [
          {
            id: 104,
            menuName: 'orange',
            price: 1500,
            quantity: 2,
            totalPrice: 2000,
          },
        ],
      },
      {
        id: 2,
        username: 'user2',
        profileImageUrl: '',
        currentCarts: [
          {
            id: 105,
            quantity: 2,
            menuName: 'orange',
            price: 1500,
            totalPrice: 2000,
          },
        ],
      },
      {
        id: 3,
        username: 'user3',
        profileImageUrl: '',
        currentCarts: [
          {
            id: 106,
            quantity: 2,
            menuName: 'orange',
            price: 1500,
            totalPrice: 2000,
          },
        ],
      },
    ],
  }
}

async function getMe(): Promise<User> {
  // TODO: fetch data from API
  return {
    id: 1,
    socialLoginId: '',
    profileImageUrl: '',
    username: 'me',
    email: 'email@gmail.com',
    phone: '12312341234',
  }
}

async function getMyCart(): Promise<Cart[]> {
  return [
    {
      id: 7,
      menuName: 'cake',
      price: 1000,
      quantity: 2,
      totalPrice: 2000,
    },
  ]
}

export default function OrderCard() {
  const [reservation, setReservation] = useState<Reservation>({
    id: 1,
    storeId: 1,
    host: {
      id: 1,
      username: 'host',
      profileImageUrl: '/favicon.ico',
      currentCarts: [],
    },
    invitees: [],
    inviteCode: 'invite-code',
    sharedOrder: [],
    orders: [],
  })
  const [me, setMe] = useState<User>({
    id: 1,
    socialLoginId: '',
    profileImageUrl: '',
    username: 'none',
    email: 'none',
    phone: 'none',
  })
  const [myCart, setMyCart] = useState<Cart[]>([])
  const [myOrder, setMyOrder] = useState<UserCart>({
    id: me.id,
    username: me.username,
    profileImageUrl: me.profileImageUrl,
    currentCarts: [],
  })
  const [sharedOrder, setSharedOrder] = useState<Cart[]>([])
  const [membersOrder, setMembersOrder] = useState<UserCart[]>([])
  const [isPaid, setIsPaid] = useState(false)

  const { toast } = useToast()

  useEffect(() => {
    const fetchData = async () => {
      const reservationData = await getReservation()
      const meData = await getMe()
      const myCartData = await getMyCart()

      setReservation(reservationData)
      setMe(meData)
      setMyCart(myCartData)
    }
    fetchData()
  }, [])

  useEffect(() => {
    setMyOrder(
      reservation.orders.find((order) => order.id === me?.id) || {
        id: me.id,
        username: me.username,
        profileImageUrl: me.profileImageUrl,
        currentCarts: [],
      },
    )
    setSharedOrder(reservation.sharedOrder)
    setMembersOrder(reservation?.orders.filter((order) => order.id !== me?.id))
  }, [reservation, me])

  const handleShare = (id: number) => {
    const cartItem = myCart.find((cart) => cart.id == id)
    setMyCart(myCart.filter((cart) => cart.id !== id))
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

  return (
    <>
      <div className="w-full mt-4">
        <div className="border-2 bg-white/50 dark:bg-black/50 rounded-xl p-4 h-fit">
          <div className="text-xl font-bold mb-4">Order Information</div>
          <Separator className="mb-4 h-[2px]" />

          <p className="text-lg font-semibold mt-4">My Order</p>
          <UserOrderList data={myOrder}>
            <p className="text-base font-medium my-1">Cart</p>
            <MyCartTable
              data={myCart}
              share={(id: number) => handleShare(id)}
            />
          </UserOrderList>

          <p className="text-lg font-semibold mt-4">Shared Order</p>
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
          <UserOrderTable data={[]} />

          <p className="text-lg font-semibold mt-4">Members Order</p>
          {membersOrder.map((memberOrder) => (
            <UserOrderList key={memberOrder.id} data={memberOrder} />
          ))}

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
