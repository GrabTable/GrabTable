// import type { NextRequest, NextResponse } from 'next/server'
import { nanoid } from 'nanoid'
// import { SignJWT, jwtVerify } from 'jose'
// import { cookies } from "next/headers";

// interface UserJwtPayload {
//   jti: string
//   iat: number
// }

// const USER_TOKEN = process.env.USER_TOKEN
// export class AuthError extends Error {}

// export async function verifyAuth(req: NextRequest) {
//   if(!USER_TOKEN){
//     throw new AuthError('no user token')
//   }
//   const token = req.cookies.get(USER_TOKEN)?.value

//   if (!token) throw new AuthError('Missing user token')

//   try {
//     const verified = await jwtVerify(
//       token,
//       new TextEncoder().encode(process.env.SESSION_SECRET)
//     )
//     return verified.payload as UserJwtPayload
//   } catch (err) {
//     throw new AuthError('Your token has expired.')
//   }
// }

// export async function setUserCookie(res: NextResponse) {
//   if(!USER_TOKEN){
//     return;
//   }
//   const token = await new SignJWT({})
//     .setProtectedHeader({ alg: 'HS256' })
//     .setJti(nanoid())
//     .setIssuedAt()
//     .setExpirationTime('2h')
//     .sign(new TextEncoder().encode(process.env.SESSION_SECRET))

//   res.cookies.set(USER_TOKEN, token, {
//     httpOnly: true,
//     maxAge: 60 * 60 * 2, // 2 hours in seconds
//   })

//   return res
// }

// export function expireUserCookie(res: NextResponse) {
//   if(!USER_TOKEN){
//     return;
//   }
//   res.cookies.set(USER_TOKEN, '', { httpOnly: true, maxAge: 0 })
//   return res
// }

import { SignJWT, jwtVerify } from "jose";
import { cookies } from "next/headers";
import { NextRequest, NextResponse } from "next/server";

const secretKey = "secret";
const key = new TextEncoder().encode(secretKey);

export async function encrypt(payload: any) {
  const token = await new SignJWT(payload)
    .setProtectedHeader({ alg: 'HS256' })
    .setJti(nanoid())
    .setIssuedAt()
    .setExpirationTime('2h')
    .sign(new TextEncoder().encode(process.env.SESSION_SECRET))
  console.log("token is ",token)
  return token
}

export async function decrypt(input: string): Promise<any> {
  const verified = await jwtVerify(
    input,
    new TextEncoder().encode(process.env.SESSION_SECRET)
  )
  return verified.payload
}

export async function login(formData: any) {
  // Verify credentials && get the user

  const user = { email: "x2xgudwls@naver.com", name: "John" };
  
  // Create the session
  const expires = new Date(Date.now() + 10 * 1000);
  const session = await encrypt({ user, expires, formData });

  // Save the session in a cookie
  cookies().set("session", session, { expires, httpOnly: true });
}

export async function logout() {
  // Destroy the session
  cookies().set("session", "", { expires: new Date(0) });
}

export async function getSession() {
  const session = cookies().get("session")?.value;
  if (!session) return null;
  return await decrypt(session);
}

// export async function updateSession(request: NextRequest) {
//   const session = request.cookies.get("session")?.value;
//   if (!session) return;

//   // Refresh the session so it doesn't expire
//   const parsed = await decrypt(session);
//   parsed.expires = new Date(Date.now() + 10 * 1000);
//   const res = NextResponse.next();
//   res.cookies.set({
//     name: "session",
//     value: await encrypt(parsed),
//     httpOnly: true,
//     expires: parsed.expires,
//   });
//   return res;
// }