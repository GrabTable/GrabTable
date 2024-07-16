import { BASE_API_URL } from '../constants'

export const getStoreReviews = async (storeId: string) => {
  const res = await fetch(`${BASE_API_URL}/v1/reviews/stores/${storeId}`)
  return res
}
