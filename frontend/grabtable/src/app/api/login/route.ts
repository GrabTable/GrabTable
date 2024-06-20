import { BASE_API_URL, BASE_URL } from '@/lib/constants'
import { login } from '@/lib/next-auth/session'
import { parseCookie } from 'next/dist/compiled/@edge-runtime/cookies'
import { cookies } from 'next/headers'
import { NextRequest, NextResponse } from 'next/server'

async function sendPostRequest(body_code: string | null) {
  const url = `${BASE_API_URL}/v1/auth/login/kakao` // 요청할 URL

  const data = {
    code: body_code, // 실제 코드 값으로 변경 필요
  }

  const response = await fetch(url, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify(data),
  })

  const refresh_token =
    parseCookie(response.headers.get('set-cookie') || '').get(
      'refresh-token',
    ) || ''
  cookies().set('refresh-token', refresh_token, {
    httpOnly: true,
    secure: !!process.env.NEXT_PUBLIC_BASE_URL,
    sameSite: !!process.env.NEXT_PUBLIC_BASE_URL ? 'none' : 'lax',
    domain: !!process.env.NEXT_PUBLIC_BASE_URL ? '.grabtable.net' : 'localhost',
  })

  return await response.json()
}

export async function GET(req: NextRequest, res: NextResponse) {
  const url: URL = new URL(req.url)
  const code: string | null = url.searchParams.get('code')

  const userSession = await sendPostRequest(code)

  await login(userSession)

  return NextResponse.redirect(`${BASE_URL}/mypage`) 
}
