import { OrderResponse } from './orderResponse'
import { SharedOrderResponse } from './sharedOrderResponse'
import { UserCartsInfoResponse } from './userCartsInfoResponse'

export type ReservationDetailResponse = {
  id: number
  storeId: number
  host: UserCartsInfoResponse
  invitees: UserCartsInfoResponse[]
  inviteCode: string
  sharedOrder: SharedOrderResponse
  orders: OrderResponse[]
}
