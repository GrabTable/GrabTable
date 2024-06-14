import { Cart } from './cart'

export type Order = {
  id: number
  userId: number
  paidAmount: number
  carts: Cart[]
  status: string
}
