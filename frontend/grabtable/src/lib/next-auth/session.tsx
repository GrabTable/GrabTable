import { nanoid } from 'nanoid'
import { SignJWT, jwtVerify } from 'jose'
import { cookies } from 'next/headers'

const secretKey = 'secret'
const key = new TextEncoder().encode(secretKey)

export async function encrypt(payload: any) {
  const token = await new SignJWT(payload)
    .setProtectedHeader({ alg: 'HS256' })
    .setJti(nanoid())
    .setIssuedAt()
    .setExpirationTime('2h')
    .sign(new TextEncoder().encode(process.env.SESSION_SECRET))
  return token
}

export async function decrypt(input: string): Promise<any> {
  const verified = await jwtVerify(
    input,
    new TextEncoder().encode(process.env.SESSION_SECRET),
  )
  return verified.payload
}

export async function login(formData: any) {
  // Verify credentials && get the user

  // Create the session
  const expires = new Date(Date.now() + 10 * 1000)
  const session = await encrypt({ formData, expires })

  // Save the session in a cookie
  cookies().set('refresh-token', session, { expires, httpOnly: true })
}

export async function logout() {
  // Destroy the session
  cookies().set('refresh-token', '', { expires: new Date(0) })
}

export async function getSession() {
  const session = cookies().get('refresh-token')?.value
  if (!session) return null
  return await decrypt(session)
}
