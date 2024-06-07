import { OrderResponse } from './orderResponse'
import { UserCartsInfoResponse } from './userCartsInfoResponse'

export type ReservationDetailResponse = {
  id: number
  storeId: number
  host: UserCartsInfoResponse
  invitees: UserCartsInfoResponse[]
  inviteCode: string
  orders: OrderResponse[]
}
