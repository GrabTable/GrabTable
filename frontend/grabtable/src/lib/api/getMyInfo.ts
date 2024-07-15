import { BASE_API_URL } from '@/lib/constants'
import { User } from '@/lib/types/user'
import getSessionFromClient from '../next-auth/getSessionFromClient'

export const getMyInfo = async (): Promise<User | null> => {
  const session = await getSessionFromClient()
  if (!session) return null
  const response = await fetch(`${BASE_API_URL}/v1/users/me`, {
    method: 'GET',
    headers: {
      'Content-Type': 'application/json',
      Authorization: 'Bearer ' + session.formData['accessToken'],
    },
    credentials: 'include',
  })

  return response.json()
}
