import { CartResponse } from './cartResponse'

export type UserCartsInfoResponse = {
  id: number
  username: string
  profileImageUrl: string
  currentCarts: CartResponse[]
}
