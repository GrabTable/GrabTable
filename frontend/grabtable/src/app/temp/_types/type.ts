export interface Menu {
  id: number
  menuName: string
  price: number
  menuPrictureUrl: string
}

export interface User {
  id: number
  socialLoginId: string
  profileImageUrl: string
  username: string
  email: string
  phone: string
}

export interface Cart {
  id: number
  quantity: number
  menuName: string
  price: number
  totalPrice: number
}

export interface UserCart {
  username: any
  profileImageUrl: any
  id: any
  currentCarts: Cart[]
}

export interface Order extends UserCart {}

export interface Reservation {
  id: number
  storeId: number
  host: UserCart
  invitees: UserCart[]
  inviteCode: string
  sharedOrder: Cart[]
  orders: Order[]
}
