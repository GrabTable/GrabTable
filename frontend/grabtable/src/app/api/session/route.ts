import { getSession } from '@/lib/next-auth/session'
import { NextRequest, NextResponse } from 'next/server'

export async function GET(req: NextRequest) {
  const userSession = await getSession() // getSession이 요청 객체를 인자로 받는다고 가정합니다.

  if (!userSession) {
    return new NextResponse(JSON.stringify({ error: 'No session found' }), {
      status: 200,
      headers: {
        'Content-Type': 'application/json',
      },
    })
  }

  return new NextResponse(JSON.stringify(userSession), {
    headers: {
      'Content-Type': 'application/json',
    },
  })
}
