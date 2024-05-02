// import { AnimatePresence, motion } from 'framer-motion'
// import { useState } from 'react'
// import { UserCard } from './UserCard'

// interface CartItem {
//   menuName: string
//   quantity: number
//   unitPrice: number
//   totalPrice: number
// }
// interface User {
//   username: string
//   profileImageUrl: string
//   orderCompleted: boolean
//   cartItems: CartItem[]
// }

// interface UserListViewProps {
//   host: User
//   invitees: User[]
// }

// type UserCartsInfo = {
//   id: number
//   username: string
//   profileImageUrl: string
//   currentCarts: Cart[]
// }

// type Cart = {
//   id: number
//   user: null
//   menuName: string
//   price: number
//   order: any
//   sharedOrder: any
//   quantity: number
// }
// interface CartItem {
//   menuName: string
//   quantity: number
//   unitPrice: number
//   totalPrice: number
// }
// interface Orders {
//   id: number
//   storeId: number
//   host: User
//   invitees: User[]
//   inviteCode: string
//   sharedOrder: null
//   order: []
// }

// export function UserListView(orders: any): any {
//   const hostUser: User = {
//     username: orders.host.username,
//     profileImageUrl: orders.host.profileImageUrl,
//     cartItems: orders.host.currentCarts.map(
//       (cart: {
//         menuName: any
//         quantity: any
//         price: any
//         totalPrice: any
//       }) => ({
//         menuName: cart.menuName,
//         quantity: cart.quantity,
//         unitPrice: cart.price,
//         totalPrice: cart.totalPrice,
//       }),
//     ),
//     orderCompleted: false,
//   }

//   // Parsing the invitees data
//   const inviteesUsers: User[] = orders.invitees.map(
//     (invitee: {
//       username: any
//       profileImageUrl: any
//       currentCarts: any[]
//     }) => ({
//       username: invitee.username,
//       profileImageUrl: invitee.profileImageUrl,
//       cartItems: invitee.currentCarts.map(
//         (cart: {
//           menuName: any
//           quantity: any
//           price: any
//           totalPrice: any
//         }) => ({
//           menuName: cart.menuName,
//           quantity: cart.quantity,
//           unitPrice: cart.price,
//           totalPrice: cart.totalPrice,
//         }),
//       ),
//     }),
//   )

//   return (
//     <div className="flex flex-col space-y-4">
//       <UserCard key={hostUser.username} user={hostUser} />

//       {inviteesUsers.map((invitee, index) => (
//         <UserCard key={invitee.username + index} user={invitee} />
//       ))}
//     </div>
//   )
// }
