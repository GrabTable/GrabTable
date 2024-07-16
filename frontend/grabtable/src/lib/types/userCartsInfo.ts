import { Cart } from './cart'

export type UserCartsInfo = {
  id: number
  username: string
  profileImageUrl: string
  currentCarts: Cart[]
}
