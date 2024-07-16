import { BASE_API_URL } from '@/lib/constants'
import getSessionFromClient from '@/lib/next-auth/getSessionFromClient'
import { Cart } from '@/lib/types/cart'

export const getMyCart = async (): Promise<Cart[]> => {
  const session = await getSessionFromClient()
  const response = await fetch(`${BASE_API_URL}/v1/carts/me`, {
    method: 'GET',
    headers: {
      'Content-Type': 'application/json',
      Authorization: 'Bearer ' + session.formData['accessToken'],
    },
    credentials: 'include',
  })

  if (!response.ok) throw new Error('Failed to fetch Mycart')
  return response.json()
}
