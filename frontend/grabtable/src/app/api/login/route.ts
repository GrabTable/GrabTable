import { NextRequest, NextResponse } from "next/server";


async function sendPostRequest(body_code: String | null) {
    const url = 'http://localhost:8000/v1/auth/login/kakao'; // 요청할 URL
    const data = {
      code: body_code // 실제 코드 값으로 변경 필요
    };
  
    try {
      const response = await fetch(url, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify(data) 
      });
  
      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }

      const responseData = await response.json();
      console.log('Response:', responseData);
    } catch (error) {
      console.error('Error during the fetch operation:', error);
    }
  }
  

export async function GET(req: NextRequest, res: NextResponse){
   
    const url = new URL(req.url)
    const code = url.searchParams.get('code')
    console.log(code)

    await sendPostRequest(code);
    
    return NextResponse.redirect("http://localhost:3000");
}