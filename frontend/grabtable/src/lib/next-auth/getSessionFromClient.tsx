import { BASE_URL } from '../constants'

export default async function getSessionFromClient() {
  const response = await fetch(BASE_URL + '/api/session')
  const session = await response.json()

  if (session.error) return null
  return session
}
