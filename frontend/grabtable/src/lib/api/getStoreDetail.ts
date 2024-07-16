import { BASE_API_URL } from '../constants'

export const getStoreDetail = async (storeId: string): Promise<Response> => {
  const res = await fetch(`${BASE_API_URL}/v1/stores/${storeId}`)
  return res
}
