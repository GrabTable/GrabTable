'use client'

import { Button } from '@/components/ui/button'
import getSessionFromClient from '@/lib/next-auth/getSessionFromClient'
import Script from 'next/script'
import { useEffect, useState } from 'react'
import { RiKakaoTalkFill } from 'react-icons/ri'
import { RequestPayParams, RequestPayResponse } from '../portone'
import { useRouter } from 'next/navigation'

export default function Page() {
  const router = useRouter()
  type MyCart = {
    id: number
    quantity: number
    menuName: string
    price: number
    totalPrice: number
  }

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
    if (!window.IMP) {
      return
    }
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
    let request: any = {
      impUid: response.imp_uid,
      amount: response.paid_amount,
    }
    const session = await getSessionFromClient()
    const res = await fetch('http://localhost:8000/v1/orders', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        Authorization: 'Bearer ' + session.formData['access_token'],
      },
      credentials: 'include',
      body: JSON.stringify(request),
    })
    const postResponse: Promise<PostOrderResponse> = res.json()
    router.push('/reservation')
  }
  const [myCart, setMyCart] = useState<MyCart[]>([])

  const getMyCart = async () => {
    try {
      const session = await getSessionFromClient()
      const response = await fetch(`http://localhost:8000/v1/carts/me`, {
        method: 'GET',
        headers: {
          'Content-Type': 'application/json',
          Authorization: 'Bearer ' + session.formData['access_token'],
        },
        credentials: 'include',
      })

      if (!response.ok) throw new Error('Failed to fetch my cart')
      const cartData = await response.json()
      setMyCart(cartData)
    } catch (error) {
      console.error('Error fetching cart:', error)
    }
  }

  useEffect(() => {
    getMyCart()
  }, [])

  // useEffect(() => {
  //   // 페이지 로드 시 'alreadyRefreshed' 키를 확인
  //   if (!localStorage.getItem('alreadyRefreshed')) {
  //     // 'alreadyRefreshed' 키가 없다면 새로고침 수행
  //     localStorage.setItem('alreadyRefreshed', 'true'); // 새로고침 후 이 키를 설정
  //     window.location.reload();
  //   } else {
  //     // 새로고침 후에는 키를 제거하여 다음 방문 때 다시 새로고침 할 수 있도록 함
  //     localStorage.removeItem('alreadyRefreshed');
  //   }
  // }, []);

  return (
    <>
      <div>
        {myCart.length > 0 ? (
          <ul>
            {myCart.map((item) => (
              <li key={item.id}>
                {item.menuName} - Quantity: {item.quantity} - Price:{' '}
                {item.price} - Total Price: {item.totalPrice}
              </li>
            ))}
          </ul>
        ) : (
          <p>No items in your cart.</p>
        )}
      </div>
      {myCart.length > 0 ? (
        <Button
          className="w-full mt-4 bg-yellow-300 hover:bg-yellow-400 text-black text-xl"
          onClick={onClickPayment}
          type="submit"
        >
          <RiKakaoTalkFill className="mr-2" /> Pay
        </Button>
      ) : (
        ''
      )}
      <Script
        src="https://cdn.iamport.kr/v1/iamport.js"
        strategy="beforeInteractive"
      />
    </>
  )
}
