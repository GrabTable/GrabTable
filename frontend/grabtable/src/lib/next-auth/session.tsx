import { SignJWT, jwtVerify } from 'jose'
import { nanoid } from 'nanoid'
import { cookies } from 'next/headers'

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
  const expires = new Date(Date.now() + 60 * 60 * 1000)
  const session = await encrypt({ formData, expires })

  // Save the session in a cookie
  cookies().set('session', session, {
    expires,
    httpOnly: true,
    secure: !!process.env.NEXT_PUBLIC_BASE_URL,
    sameSite: !!process.env.NEXT_PUBLIC_BASE_URL ? 'none' : 'lax',
    domain: !!process.env.NEXT_PUBLIC_BASE_URL ? '.grabtable.net' : 'localhost',
  })
}

export async function logout() {
  // Destroy the session
  cookies().set('session', '', { expires: new Date(0) })
  cookies().set('refresh-token', '', { expires: new Date(0) })
}

export async function getSession() {
  const session = cookies().get('session')?.value
  if (!session) return null
  return await decrypt(session)
}
