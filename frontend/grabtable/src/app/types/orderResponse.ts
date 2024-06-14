import { CartResponse } from './cartResponse'

export type OrderResponse = {
  id: number
  userId: number
  paidAmount: number
  carts: CartResponse[]
  status: string
}
