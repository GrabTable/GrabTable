import { BASE_API_URL } from '../constants'
import getSessionFromClient from '../next-auth/getSessionFromClient'

export async function postJoinReservation(inviteCode: string) {
  const session = await getSessionFromClient()

  await fetch(`${BASE_API_URL}/v1/reservations/${inviteCode}`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      Authorization: 'Bearer ' + session.formData['accessToken'],
    },
    credentials: 'include',
  })
}
