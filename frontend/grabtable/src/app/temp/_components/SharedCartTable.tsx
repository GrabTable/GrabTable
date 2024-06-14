'use client'
import { RequestPayParams, RequestPayResponse } from '@/app/reservation/portone'
import { ReservationDetailResponse } from '@/app/types/reservationDetailResponse'
import { Button } from '@/components/ui/button'
import { useToast } from '@/components/ui/use-toast'
import { BASE_URL } from '@/lib/constants'
import getSessionFromClient from '@/lib/next-auth/getSessionFromClient'
import { useRouter } from 'next/navigation'
import Script from 'next/script'
import { useState } from 'react'
import { FaWonSign } from 'react-icons/fa6'
import { RiKakaoTalkFill } from 'react-icons/ri'
import UserOrderTable from './UserOrderTable'
import UserSharedOrderList from './UserSharedOrderList'

interface SharedCartTableProps {
  data: ReservationDetailResponse
}

export default function SharedCartTable({ data }: SharedCartTableProps) {
  const { toast } = useToast()

  const [amount, setAmount] = useState(data.sharedOrder.leftAmount || 0)

  const handleInputChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const value = parseInt(e.target.value, 10)
    setAmount(value)
  }

  const router = useRouter()
  const IMP_CODE = 'imp67708454'

  const onClickPayment = () => {
    if (amount <= 0 || amount > data.sharedOrder.leftAmount) {
      return
    }

    if (!window.IMP) {
      return
    }
    const { IMP } = window
    IMP.init(IMP_CODE)

    const payData: RequestPayParams = {
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

    IMP.request_pay(payData, callback)
  }

  async function callback(response: RequestPayResponse) {
    const request: any = {
      impUid: response.imp_uid,
      amount: response.paid_amount,
    }
    const session = await getSessionFromClient()
    const res = await fetch(`${BASE_URL}/v1/shared-orders`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        Authorization: 'Bearer ' + session.formData['access_token'],
      },
      credentials: 'include',
      body: JSON.stringify(request),
    }).then((res) => {
      if (res.status !== 200) {
        toast({
          title: 'Failed to pay',
          description: 'Please try again',
          duration: 1000,
        })
      }
      router.push('/reservation')
    })
  }

  const deleteCartInSharedOrder = async (
    cartId: number,
    accessToken: string,
  ) => {
    await fetch(`${BASE_URL}/v1/carts/shared/${cartId}`, {
      method: 'DELETE',
      headers: {
        'Content-Type': 'application/json',
        Authorization: 'Bearer ' + accessToken,
      },
      credentials: 'include',
    }).then(async (res) => {
      const resJson = await res.json()
      if (res.status === 200)
        toast({
          title: 'Successfully deleted!',
          duration: 1000,
        })
      else {
        toast({
          title: resJson.message,
          description: 'Please try again',
          duration: 1000,
        })
      }
    })
  }

  const editCartInSharedOrder = async (
    cartId: number,
    quantity: number,
    accessToken: string,
  ) => {
    await fetch(`${BASE_URL}/v1/carts/shared/${cartId}`, {
      method: 'PATCH',
      body: JSON.stringify({
        quantity: quantity,
      }),
      headers: {
        'Content-Type': 'application/json',
        Authorization: 'Bearer ' + accessToken,
      },
      credentials: 'include',
    })
      .then(() => {
        toast({
          title: 'Successfully updated!',
          duration: 1000,
        })
        return
      })
      .catch((error) => {
        toast({
          title: 'Failed to update',
          description: 'Please try again',
          duration: 1000,
        })
      })
  }

  const onQuantityChange = async (cartId: number, quantity: number) => {
    const session = await getSessionFromClient()
    const accessToken = session.formData['access_token']

    if (quantity === 0) {
      deleteCartInSharedOrder(cartId, accessToken)
      return
    }

    editCartInSharedOrder(cartId, quantity, accessToken)
  }

  return (
    <>
      <p className="text-lg font-semibold mt-4">Shared Order</p>
      <p className="text-base font-medium my-1">Cart</p>
      {data.orders.length === 0 ? (
        <UserOrderTable
          data={data.sharedOrder.carts}
          onQuantityChange={onQuantityChange}
        />
      ) : (
        <UserOrderTable
          data={data.sharedOrder.carts}
          onQuantityChange={onQuantityChange}
          faded={true}
        />
      )}

      <div className="flex items-center gap-1 justify-end my-2 mr-2">
        LEFT AMOUNT: <FaWonSign />
        {data.sharedOrder.leftAmount}
      </div>

      <div className="flex justify-end items-center text-lg gap-2 m-4">
        <FaWonSign />
        <input
          type="number"
          value={amount}
          onChange={handleInputChange}
          onWheel={(e) => e.currentTarget.blur()}
          className="border border-gray-300 rounded-md p-2 pl-8 text-lg focus:outline-none focus:ring-2 focus:ring-yellow-400 no-spinner"
          placeholder="Enter amount"
        />
        <Button
          onClick={onClickPayment}
          className="bg-yellow-300 hover:bg-yellow-400 text-black text-lg flex items-center"
        >
          <RiKakaoTalkFill className="mr-2" /> Pay
        </Button>
      </div>
      <p className="text-base font-medium my-1">Paid</p>
      <UserSharedOrderList data={data} />
      <Script
        src="https://cdn.iamport.kr/v1/iamport.js"
        strategy="lazyOnload"
      />
    </>
  )
}
