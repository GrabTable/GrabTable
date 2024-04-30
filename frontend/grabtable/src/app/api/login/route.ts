import { login } from '@/lib/next-auth/session'
import { NextRequest, NextResponse } from 'next/server'

async function sendPostRequest(body_code: String | null) {
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

    const responseData = await response.json()
    console.log('Response:', responseData)
    return responseData
  } catch (error) {
    console.error('Error during the fetch operation:', error)
  }
}

export async function GET(req: NextRequest, res: NextResponse) {
  const url = new URL(req.url)
  const code = url.searchParams.get('code')
  console.log(code)

  const responseData = await sendPostRequest(code)
  if (!responseData) {
    return new NextResponse('Error fetching access token', { status: 500 });
  }
  const input = {
    access_token: responseData
  }
  await login(input)
  
  
  return NextResponse.redirect('http://localhost:3000/')

}
