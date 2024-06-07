import { Cart } from './cart'

export type PostOrderResponse = {
  id: number
  userId: number
  carts: Cart[]
  status: string
}
