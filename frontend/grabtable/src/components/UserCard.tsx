import { motion } from 'framer-motion'
import { useEffect, useState } from 'react'
import { Button } from './ui/button'
import { FaPlus, FaMinus } from 'react-icons/fa6'
import { Avatar, AvatarFallback, AvatarImage } from './ui/avatar'
import getSessionFromClient from '@/lib/next-auth/getSessionFromClient'

interface CartItem {
  menuName: string
  quantity: number
  unitPrice: number
  totalPrice: number
}

interface User {
  username: string
  profileImageUrl: string
  id: number
  cartItems: CartItem[]
}

interface UserCardProps {
  user: User
  isComplete: boolean
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
export function UserCard({ user, isComplete }: UserCardProps): JSX.Element {
  const [isOpen, setIsOpen] = useState(false)
  const [orderCompleted, setOrderCompleted] = useState(false)
  const toggleCard = () => {
    setIsOpen(!isOpen)
  }

  const calculateTotalPrice = () => {
    return user.cartItems.reduce(
      (total, item) => total + item.quantity * item.unitPrice,
      0,
    )
  }
  useEffect(() => {
    async function checkOrderStatus() {
      const session = await getSessionFromClient()
      const response = await fetch(`http://localhost:8000/v1/reservations/me`, {
        headers: {
          'Content-Type': 'application/json',
          Authorization: 'Bearer ' + session.formData['access_token'],
        },
        credentials: 'include',
      });
      const data = await response.json();

      const isOrderCompleted = data.orders.some((order: Orders) => order.id === user.id);
      setOrderCompleted(isOrderCompleted);
    }
    checkOrderStatus();
  }, []);
  
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
        <p>{isComplete ? 'Order Completed' : 'Order Incompleted'}</p>

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
          {user.cartItems && user.cartItems.map((item, index) => (
            <li
              key={index}
            >{`${item.menuName}: ${item.quantity} x ₩${item.unitPrice.toFixed(2)} = ₩${item.quantity * item.unitPrice}`}</li>
          ))}
        </ul>
        { user.cartItems && <p>Total Price: ₩{calculateTotalPrice()}</p>}
      </motion.div>
    </div>
  )
}
