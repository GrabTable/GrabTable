import { BASE_API_URL } from '../constants'

export const getStores = async () => {
  const res = await fetch(`${BASE_API_URL}/v1/stores`)
  return res
}
