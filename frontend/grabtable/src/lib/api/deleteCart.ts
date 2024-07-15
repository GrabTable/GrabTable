import { BASE_API_URL } from '../constants'

export const deleteCart = async (cartId: number, accessToken: string) => {
  const res = await fetch(`${BASE_API_URL}/v1/carts/${cartId}`, {
    method: 'DELETE',
    headers: {
      'Content-Type': 'application/json',
      Authorization: 'Bearer ' + accessToken,
    },
    credentials: 'include',
  })

  return res
}
