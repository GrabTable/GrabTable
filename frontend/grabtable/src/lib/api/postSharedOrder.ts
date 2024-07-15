import { BASE_API_URL } from '../constants'
import getSessionFromClient from '../next-auth/getSessionFromClient'

export const postSharedOrder = async (payload: any) => {
  const session = await getSessionFromClient()
  const res = await fetch(`${BASE_API_URL}/v1/shared-orders`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      Authorization: 'Bearer ' + session.formData['accessToken'],
    },
    credentials: 'include',
    body: JSON.stringify(payload),
  })

  return res
}
