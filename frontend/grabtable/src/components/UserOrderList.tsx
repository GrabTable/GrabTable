import { RequestPayParams, RequestPayResponse } from '@/app/reservation/portone'
import { UserCartsInfo } from '@/app/types/userCartsInfo'
import {
  Accordion,
  AccordionContent,
  AccordionItem,
  AccordionTrigger,
} from '@/components/ui/accordion'
import { Avatar, AvatarFallback, AvatarImage } from '@/components/ui/avatar'
import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
import { BASE_API_URL } from '@/lib/constants'
import getSessionFromClient from '@/lib/next-auth/getSessionFromClient'
import { useRouter } from 'next/navigation'
import Script from 'next/script'
import { RiKakaoTalkFill } from 'react-icons/ri'
import UserOrderTable from './UserOrderTable'
import { useToast } from './ui/use-toast'

interface UserOrderListProps {
  data: UserCartsInfo
  isPaid: boolean
  onQuantityChange?: (id: number, quantity: number) => void
  viewOnly?: boolean
  payable?: boolean
}

export default function UserOrderList({
  data,
  isPaid,
  onQuantityChange = () => {},
  viewOnly = false,
  payable = false,
}: UserOrderListProps) {
  const { toast } = useToast()
  const router = useRouter()
  const IMP_CODE = 'imp67708454'

  const onClickPayment = () => {
    if (!window.IMP) {
      return
    }
    const { IMP } = window
    IMP.init(IMP_CODE)

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
    const request: any = {
      impUid: response.imp_uid,
      amount: response.paid_amount,
    }
    const session = await getSessionFromClient()
    const res = await fetch(`${BASE_API_URL}/v1/orders`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        Authorization: 'Bearer ' + session.formData['access_token'],
      },
      credentials: 'include',
      body: JSON.stringify(request),
    })

    if (!res.ok) {
      const resJson = await res.json()
      toast({
        title: resJson.message,
        description: 'Please try again',
        duration: 1000,
      })
      return
    }
    router.push('/reservation')
  }

  return (
    <>
      <Accordion type="single" collapsible>
        <AccordionItem value="item-1">
          <AccordionTrigger>
            <Avatar>
              <AvatarImage src={data.profileImageUrl} alt="@shadcn" />
              <AvatarFallback>{data.username}</AvatarFallback>
            </Avatar>
            <h3>{data.username}</h3>
            {isPaid ? (
              <Badge
                className="text-green-400 border-green-400"
                variant="outline"
              >
                Paid
              </Badge>
            ) : (
              <Badge className="text-red-400 border-red-400" variant="outline">
                Unpaid
              </Badge>
            )}
          </AccordionTrigger>
          <AccordionContent>
            <p className="text-base font-medium my-1">Cart</p>
            <UserOrderTable
              data={data.currentCarts}
              onQuantityChange={onQuantityChange}
            />
            {payable && (
              <Button
                className="w-full mt-4 bg-yellow-300 hover:bg-yellow-400 text-black text-xl"
                onClick={onClickPayment}
              >
                <RiKakaoTalkFill className="mr-2" /> Pay
              </Button>
            )}
          </AccordionContent>
        </AccordionItem>
      </Accordion>
      <Script
        src="https://cdn.iamport.kr/v1/iamport.js"
        strategy="lazyOnload"
      />
    </>
  )
}
