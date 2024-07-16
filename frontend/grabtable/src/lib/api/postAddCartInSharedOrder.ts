import { BASE_API_URL } from '@/lib/constants'
import getSessionFromClient from '@/lib/next-auth/getSessionFromClient'

export const postAddCartInSharedOrder = async (
  menuId: number,
  quantity: number,
) => {
  const session = await getSessionFromClient()

  if (quantity === 0) {
    return
  }

  const res = await fetch(`${BASE_API_URL}/v1/carts/shared`, {
    method: 'POST',
    body: JSON.stringify({
      menuId: menuId,
      quantity: quantity,
    }),
    headers: {
      'Content-Type': 'application/json',
      Authorization: 'Bearer ' + session.formData['accessToken'],
    },
    credentials: 'include',
  })

  return res
}
