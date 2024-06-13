import { CartResponse } from './cartResponse'
import { OrderResponse } from './orderResponse'

export type SharedOrderResponse = {
  id: number
  carts: CartResponse[]
  orders: OrderResponse[]
  totalAmount: number
  leftAmount: number
}
