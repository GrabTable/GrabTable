import {
  Accordion,
  AccordionContent,
  AccordionItem,
  AccordionTrigger,
} from '@/components/ui/accordion'
import { Avatar, AvatarFallback, AvatarImage } from '@/components/ui/avatar'
import { Badge } from '@/components/ui/badge'
import { UserCart } from '../_types/type'
import UserOrderTable from './UserOrderTable'

interface UserOrderListProps {
  data: UserCart
  children?: React.ReactNode
}

export default function UserOrderList({ data, children }: UserOrderListProps) {
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
            <Badge
              className="text-green-400 border-green-400"
              variant="outline"
            >
              Paid
            </Badge>
          </AccordionTrigger>
          <AccordionContent>
            {children}
            <p className="text-base font-medium my-1">Paid</p>
            <UserOrderTable data={data.currentCarts} />
          </AccordionContent>
        </AccordionItem>
      </Accordion>
    </>
  )
}
