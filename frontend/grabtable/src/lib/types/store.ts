import { Category } from './category'

export type Store = {
  id: number
  storeName: string
  address: string
  storePictureUrl: string
  phone: string
  description: string
  category: Category
}
