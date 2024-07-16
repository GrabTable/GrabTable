import { BASE_API_URL } from '../constants'
import getSessionFromClient from '../next-auth/getSessionFromClient'

export const postConfirmReservation = async () => {
  const session = await getSessionFromClient()
  const res = await fetch(`${BASE_API_URL}/v1/reservations/confirm`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      Authorization: 'Bearer ' + session.formData['accessToken'],
    },
    credentials: 'include',
  })

  return res
}
