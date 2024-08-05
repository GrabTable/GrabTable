import { BASE_API_URL } from '../constants'

export const getStoreReviews = async (
  storeId: string,
  cursor?: number,
  size?: number,
) => {
  const params = new URLSearchParams()

  if (cursor !== undefined) {
    params.append('cursor', cursor.toString())
  }

  if (size !== undefined) {
    params.append('size', size.toString())
  } else {
    params.append('size', '20')
  }

  const res = await fetch(
    `${BASE_API_URL}/v1/reviews/stores/${storeId}?${params.toString()}`,
  )

  return res
}
