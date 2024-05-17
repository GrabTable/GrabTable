import { NextRequest, NextResponse } from 'next/server'
import { cookies } from 'next/headers'
import { parseCookie } from 'next/dist/compiled/@edge-runtime/cookies'
import { login } from '@/lib/next-auth/session'

async function sendPostRequest(body_code: string | null) {
  const url = 'http://localhost:8000/v1/auth/login/kakao' // 요청할 URL
  const data = {
    code: body_code, // 실제 코드 값으로 변경 필요
  }

  try {
    const response = await fetch(url, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(data),
    })

    if (!response.ok) {
      throw new Error(`HTTP error! status: ${response.status}`)
    }

    const refresh_token =
      parseCookie(response.headers.get('set-cookie') || '').get(
        'refresh-token',
      ) || ''
    cookies().set('refresh-token', refresh_token)

    const access_token = (await response.json())?.accessToken
    const res = await fetch('http://localhost:8000/v1/user/me', {
      method: 'GET',
      headers: {
        'Content-Type': 'application/json',
        Cookie: cookies().toString(),
        Authorization: 'Bearer ' + access_token,
      },
      credentials: 'include',
    })
    const userInfo = await res.json()
    const input = {
      access_token: access_token,
      cookie: cookies().toString(),
      userInfo: userInfo,
    }

    return input
  } catch (error) {
    console.error('Error during the fetch operation:', error)
  }
}

export async function GET(req: NextRequest, res: NextResponse) {
  const url = new URL(req.url)
  const code = url.searchParams.get('code')

  const userSession = await sendPostRequest(code)

  await login(userSession)

  return NextResponse.redirect('http://localhost:3000')
}
