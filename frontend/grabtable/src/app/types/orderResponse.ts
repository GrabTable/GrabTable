import { CartResponse } from './cartResponse'

export type OrderResponse = {
  id: number
  userId: number
  carts: CartResponse[]
  status: string
}
