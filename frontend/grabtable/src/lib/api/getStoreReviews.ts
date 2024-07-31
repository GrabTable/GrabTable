import { BASE_API_URL } from '../constants'

export const getStoreReviews = async (
  storeId: string,
  cursor: number,
  size: number,
) => {
  const res = await fetch(
    `${BASE_API_URL}/v1/reviews/stores/${storeId}?cursor=${cursor}&size=${size}`,
  )
  return res
}
