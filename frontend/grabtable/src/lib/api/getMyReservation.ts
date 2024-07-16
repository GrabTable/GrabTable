import { BASE_API_URL } from '../constants'
import getSessionFromClient from '../next-auth/getSessionFromClient'

export const getMyReservation = async (): Promise<Response> => {
  const session = await getSessionFromClient()
  if (!session) throw new Error('Session is not found')
  const res = await fetch(`${BASE_API_URL}/v1/reservations/me`, {
    headers: {
      'Content-Type': 'application/json',
      Authorization: 'Bearer ' + session.formData['accessToken'],
    },
    credentials: 'include',
  })

  return res
}
