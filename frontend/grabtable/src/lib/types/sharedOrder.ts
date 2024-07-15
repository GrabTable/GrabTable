import { Cart } from './cart'
import { Order } from './order'

export type SharedOrder = {
  id: number
  carts: Cart[]
  orders: Order[]
  totalAmount: number
  leftAmount: number
}
