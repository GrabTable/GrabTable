import { CartItem } from './cartItem'
import { UserCartsInfo } from './userCartsInfo'

export type Orders = {
  id: number
  storeId: number
  host: UserCartsInfo
  invitees: UserCartsInfo[]
  inviteCode: string
  orders: {
    id: number
    userId: number
    carts: CartItem[]
  }[]
}
