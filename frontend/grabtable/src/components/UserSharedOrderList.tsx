import { Order } from '@/app/types/order'
import { Reservation } from '@/app/types/reservation'
import { UserCartsInfo } from '@/app/types/userCartsInfo'
import {
  Accordion,
  AccordionContent,
  AccordionItem,
  AccordionTrigger,
} from '@/components/ui/accordion'
import { Avatar, AvatarFallback, AvatarImage } from '@/components/ui/avatar'
import { Badge } from '@/components/ui/badge'
import { FaWonSign } from 'react-icons/fa6'

interface UserSharedOrderListProps {
  data: Reservation
}

export default function UserSharedOrderList({
  data,
}: UserSharedOrderListProps) {
  const users: UserCartsInfo[] = data.invitees.concat(data.host)
  const paidPartialOrders: Order[] = data.sharedOrder.orders

  const findPartialOrdersByUser = (userId: number) =>
    paidPartialOrders.filter((order) => order.userId === userId)

  return (
    <>
      {users.map((user) => (
        <Accordion key={user.id} type="single" collapsible>
          <AccordionItem value="item-1">
            <AccordionTrigger>
              <Avatar>
                <AvatarImage src={user.profileImageUrl} alt="@shadcn" />
                <AvatarFallback>{user.username}</AvatarFallback>
              </Avatar>
              <h3>{user.username}</h3>
              {findPartialOrdersByUser(user.id).length > 0 ? (
                <Badge
                  className="text-green-400 border-green-400"
                  variant="outline"
                >
                  Paid
                </Badge>
              ) : (
                <Badge
                  className="text-red-400 border-red-400"
                  variant="outline"
                >
                  Unpaid
                </Badge>
              )}
            </AccordionTrigger>
            <AccordionContent>
              {findPartialOrdersByUser(user.id).map((order) => (
                <div
                  key={order.id}
                  className="flex items-center gap-1 justify-end my-2 mr-2"
                >
                  <FaWonSign />
                  <p className="text-base font-medium my-1">
                    {order.paidAmount}
                  </p>
                </div>
              ))}
            </AccordionContent>
          </AccordionItem>
        </Accordion>
      ))}
    </>
  )
}
