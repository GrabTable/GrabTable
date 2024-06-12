import { UserCartsInfoResponse } from '@/app/types/userCartsInfoResponse'
import {
  Accordion,
  AccordionContent,
  AccordionItem,
  AccordionTrigger,
} from '@/components/ui/accordion'
import { Avatar, AvatarFallback, AvatarImage } from '@/components/ui/avatar'
import { Badge } from '@/components/ui/badge'
import UserOrderTable from './UserOrderTable'

interface UserOrderListProps {
  data: UserCartsInfoResponse
  isPaid: boolean
}

export default function UserOrderList(props: UserOrderListProps) {
  const { data, isPaid } = props

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
            <p className="text-base font-medium my-1">Paid</p>
            <UserOrderTable data={data.currentCarts} />
          </AccordionContent>
        </AccordionItem>
      </Accordion>
    </>
  )
}
