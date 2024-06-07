import {
  CartResponse,
  ReservationDetailResponse,
} from '@/app/reservation/MyReservation'
import { BASE_URL } from '@/lib/constants'
import getSessionFromClient from '@/lib/next-auth/getSessionFromClient'
import { motion } from 'framer-motion'
import { useEffect, useState } from 'react'
import { FaMinus, FaPlus } from 'react-icons/fa6'
import { Avatar, AvatarFallback, AvatarImage } from './ui/avatar'

interface CartItem {
  menuName: string
  quantity: number
  unitPrice: number
  totalPrice: number
}

interface User {
  username: any
  profileImageUrl: any
  id: any
  cartItems: any
}

interface UserCardProps {
  user: User
}
type Cart = {
  id: number
  user: null
  menuName: string
  price: number
  order: any
  sharedOrder: any
  quantity: number
}

type UserCartsInfo = {
  id: number
  username: string
  profileImageUrl: string
  currentCarts: Cart[]
}

type Orders = {
  id: number
  storeId: number
  host: UserCartsInfo
  invitees: UserCartsInfo[]
  inviteCode: string
  orders: {
    id: number
    userId: number
    carts: CartItem[]
  }[]
}
export function UserCard({ user }: UserCardProps): JSX.Element {
  const [isOpen, setIsOpen] = useState(false)
  const [orderCompleted, setOrderCompleted] = useState(false)
  const [paidOrderCarts, setPaidOrderCarts] = useState<CartResponse[]>([])
  const toggleCard = () => {
    setIsOpen(!isOpen)
  }

  const calculateTotalPrice = () => {
    return user.cartItems.reduce(
      (total: any, item: any) => total + item.quantity * item.unitPrice,
      0,
    )
  }
  useEffect(() => {
    async function checkOrderStatus() {
      const session = await getSessionFromClient()
      const response = await fetch(`${BASE_URL}/v1/reservations/me`, {
        headers: {
          'Content-Type': 'application/json',
          Authorization: 'Bearer ' + session.formData['access_token'],
        },
        credentials: 'include',
      })
      const data: ReservationDetailResponse = await response.json()

      const isOrderCompleted = data.orders.some(
        (order) => order.userId === user.id,
      )

      setOrderCompleted(isOrderCompleted)
      if (isOrderCompleted) {
        setPaidOrderCarts(
          data.orders.find((order) => order.userId === user.id)!.carts,
        )
      }
    }
    checkOrderStatus()
  }, [])

  return (
    <div className="border p-4 mb-4 rounded shadow">
      <div
        onClick={toggleCard}
        className="flex justify-between items-center"
        style={{ cursor: 'pointer' }}
      >
        <Avatar>
          <AvatarImage src={user.profileImageUrl} alt="@shadcn" />
          <AvatarFallback>{user.username}</AvatarFallback>
        </Avatar>
        <h3>{user.username}</h3>
        <p>{orderCompleted ? 'Order Completed' : 'Order Incompleted'}</p>

        <motion.button
          onClick={toggleCard}
          className="text-lg font-bold p-1 rounded-full bg-gray-200 dark:bg-gray-600 hover:bg-gray-300 transition duration-150 ease-in-out"
          initial={{ rotate: 0 }}
          animate={{ rotate: isOpen ? 180 : 0 }}
          transition={{ duration: 0.1 }}
        >
          {isOpen ? <FaMinus /> : <FaPlus />}
        </motion.button>
      </div>
      <motion.div
        className="mt-2"
        initial={{ maxHeight: 0, opacity: 0, overflow: 'hidden' }}
        animate={{
          maxHeight: isOpen ? 1000 : 0,
          opacity: isOpen ? 1 : 0,
          overflow: 'hidden',
        }}
        transition={{ duration: 0.3 }}
      >
        <h4>Cart Items:</h4>
        <ul>
          {!orderCompleted ? (
            <>
              {user.cartItems.map((item: any, index: any) => (
                <>
                  <li
                    key={index}
                  >{`${item.menuName}: ${item.quantity} x ₩${item.unitPrice} = ₩${item.quantity * item.unitPrice}`}</li>
                </>
              ))}
              <p>
                Total Price: ₩
                {user.cartItems.reduce(
                  (total: any, item: any) =>
                    total + item.quantity * item.unitPrice,
                  0,
                )}
              </p>
            </>
          ) : (
            <>
              {paidOrderCarts.map((item: CartResponse, index: number) => (
                <>
                  <li
                    key={index}
                  >{`${item.menuName}: ${item.quantity} x ₩${item.price} = ₩${item.price * item.quantity}`}</li>
                </>
              ))}
              <p>
                Total Price: ₩
                {paidOrderCarts.reduce(
                  (total: any, item: any) => total + item.totalPrice,
                  0,
                )}
              </p>
            </>
          )}
        </ul>
      </motion.div>
    </div>
  )
}
