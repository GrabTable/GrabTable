'use client'

import Script from 'next/script'
import { RequestPayParams, RequestPayResponse } from './portone.d'

export default async function Page() {
  interface Cart {
    id: number
    menuName: string
    quantity: number
    price: number
    totalPrice: number
  }

  interface PostOrderResponse {
    id: number
    userId: number
    carts: Cart[]
    status: string
  }

  const onClickPayment = () => {
    if (!window.IMP) return

    const { IMP } = window
    IMP.init('imp67708454')

    const data: RequestPayParams = {
      pg: 'kakaopay', // PG사 : https://developers.portone.io/docs/ko/tip/pg-2 참고
      pay_method: 'card', // 결제수단
      merchant_uid: `mid_${new Date().getTime()}`, // 주문번호
      amount: 1000, // 결제금액
      name: 'GrabTable 결제', // 주문명
      buyer_name: '홍길동', // 구매자 이름
      buyer_tel: '01012341234', // 구매자 전화번호
      buyer_email: 'example@example.com', // 구매자 이메일
      buyer_addr: '신사동 661-16', // 구매자 주소
      buyer_postcode: '06018', // 구매자 우편번호
    }

    IMP.request_pay(data, callback)
  }

  async function callback(response: RequestPayResponse) {
    console.log(response)
    let request: any = {
      imp_uid: response.imp_uid,
      paid_amount: response.paid_amount,
    }

    const res = await fetch('http://localhost:8000/v1/orders', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        //access token & refresh token
      },
      body: JSON.stringify(request),
    })

    const postResponse: Promise<PostOrderResponse> = res.json()
    console.log(postResponse)
  }

  return (
    <main>
      <button
        onClick={onClickPayment}
        type="submit"
        className="bg-purple-300 hover:bg-purple-500 text-primary"
      >
        TestPay
      </button>
      <Script
        src="https://cdn.iamport.kr/v1/iamport.js"
        strategy="beforeInteractive"
      />
    </main>
  )
}
