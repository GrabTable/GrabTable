import { AnimatePresence, motion } from 'framer-motion'
import { useState } from 'react'

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

interface UserListViewProps {
  host: User
  invitees: User[]
}

const defaultHost: User = {
  username: '호스트',
  orderCompleted: true,
  cartItems: [
    {
      menuName: '치킨',
      quantity: 1,
      unitPrice: 10000,
    },
    {
      menuName: '삼다수',
      quantity: 1,
      unitPrice: 5000,
    },
  ],
}
const defaultUsers: User[] = [
  {
    username: '참여자1',
    orderCompleted: false,
    cartItems: [
      {
        menuName: '버거',
        quantity: 2,
        unitPrice: 10000,
      },
      {
        menuName: '감튀',
        quantity: 1,
        unitPrice: 5000,
      },
    ],
  },
  {
    username: '참여자2',
    orderCompleted: true,
    cartItems: [
      {
        menuName: '피자',
        quantity: 3,
        unitPrice: 15000,
      },
      {
        menuName: 'Salad',
        quantity: 1,
        unitPrice: 8000,
      },
    ],
  },
]

export function UserListView({
  host = defaultHost,
  invitees = defaultUsers,
}: UserListViewProps): any {
  const [selectedId, setSelectedId] = useState<string | null>(null)

  {
    defaultUsers.map((item) => (
      <motion.div
        layoutId={item.username}
        onClick={() => setSelectedId(item.username)}
      >
        <motion.h5>{item.orderCompleted}</motion.h5>
        <motion.h2>{item.username}</motion.h2>
      </motion.div>
    ))
  }

  ;<AnimatePresence>
    {selectedId && (
      <motion.div layoutId={selectedId}>
        <motion.h5>123</motion.h5>
        <motion.h2>21</motion.h2>
        <motion.button onClick={() => setSelectedId(null)} />
      </motion.div>
    )}
  </AnimatePresence>

  // return (
  //   <div className="flex flex-col space-y-4">
  //     <UserCard user={host} />

  //     {invitees.map((invitee, index) => (
  //       <UserCard key={index} user={invitee} />
  //     ))}
  //   </div>
  // )
}
