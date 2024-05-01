import { motion } from 'framer-motion'
import { useState } from 'react'
import { Button } from './ui/button'
import { FaPlus, FaMinus } from 'react-icons/fa6'

interface CartItem {
  menuName: string
  quantity: number
  unitPrice: number
}

interface User {
  username: string
  orderCompleted: boolean
  cartItems: CartItem[]
}

interface UserCardProps {
  user: User
}

export function UserCard({ user }: UserCardProps): JSX.Element {
  const [isOpen, setIsOpen] = useState(false)

  const toggleCard = () => {
    setIsOpen(!isOpen)
  }

  const calculateTotalPrice = () => {
    return user.cartItems.reduce(
      (total, item) => total + item.quantity * item.unitPrice,
      0,
    )
  }

  return (
    <div className="border p-4 mb-4 rounded shadow">
      <div
        onClick={toggleCard}
        className="flex justify-between items-center"
        style={{ cursor: 'pointer' }}
      >
        <h3>{user.username}</h3>
        <p>{user.orderCompleted ? 'Order Completed' : 'Order Incompleted'}</p>

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
          {user.cartItems.map((item, index) => (
            <li
              key={index}
            >{`${item.menuName}: ${item.quantity} x ₩${item.unitPrice.toFixed(2)} = ₩${item.quantity * item.unitPrice}`}</li>
          ))}
        </ul>
        <p>Total Price: ₩{calculateTotalPrice()}</p>
      </motion.div>
    </div>
  )
}
