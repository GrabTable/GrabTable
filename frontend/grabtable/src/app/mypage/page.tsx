'use client'
import { Button } from '@/components/ui/button'
import React from 'react'

export default function Page() {
  // 버튼 클릭 시 호출될 함수
  const handleLogin = () => {
    window.location.href =
      'https://kauth.kakao.com/oauth/authorize?client_id=bae0a9c1f20dfbc7d5f6776116a24ba4&redirect_uri=http://localhost:3000/api/login&response_type=code'
  }

  return (
    <div>
      <Button onClick={handleLogin}>로그인</Button>
    </div>
  )
}
