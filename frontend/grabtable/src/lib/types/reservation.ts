import { Order } from './order'
import { SharedOrder } from './sharedOrder'
import { UserCartsInfo } from './userCartsInfo'

export type Reservation = {
  id: number
  storeId: number
  host: UserCartsInfo
  invitees: UserCartsInfo[]
  inviteCode: string
  sharedOrder: SharedOrder
  orders: Order[]
}
