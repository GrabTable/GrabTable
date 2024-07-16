import { BASE_API_URL } from '../constants'

export const fetchCartInSharedOrder = async (
  cartId: number,
  quantity: number,
  accessToken: string,
) => {
  const res = await fetch(`${BASE_API_URL}/v1/carts/shared/${cartId}`, {
    method: 'PATCH',
    body: JSON.stringify({
      quantity: quantity,
    }),
    headers: {
      'Content-Type': 'application/json',
      Authorization: 'Bearer ' + accessToken,
    },
    credentials: 'include',
  })

  return res
}
