import { BASE_API_URL } from '../constants'
import getSessionFromClient from '../next-auth/getSessionFromClient'

export const getStoreMenus = async (storeId: number): Promise<Response> => {
  const session = await getSessionFromClient()
  const res = await fetch(`${BASE_API_URL}/v1/stores/${storeId}/menus`, {
    headers: {
      'Content-Type': 'application/json',
      Authorization: 'Bearer ' + session.formData['accessToken'],
    },
    credentials: 'include',
  })

  return res
}
