import { UserListView } from '@/components/UserListView'
import { Input } from '@/components/ui/Input'
import { Button } from '@/components/ui/button'
import Image from 'next/image'
import { RiKakaoTalkFill } from "react-icons/ri"
import { ScrollArea } from '@/components/ui/scroll-area'
import { Separator } from '@/components/ui/separator'
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from '@/components/ui/table'
import { useState } from 'react'

interface CartItem {
  menuName: string
  quantity: number
  unitPrice: number
}

interface User {
  username: string
  orderCompleted: boolean
  cartItems: CartItem[]
}

interface MyReservationProps {
  store_id: number
  host: User
  invitees: User[]
}

const defaultHost: User = {
  username: '호스트',
  orderCompleted: true,
  cartItems: [
    {
      menuName: '치킨',
      quantity: 1,
      unitPrice: 10000,
    },
    {
      menuName: '삼다수',
      quantity: 1,
      unitPrice: 5000,
    },
  ],
}
const defaultUsers: User[] = [
  {
    username: '참여자1',
    orderCompleted: false,
    cartItems: [
      {
        menuName: '버거',
        quantity: 2,
        unitPrice: 10000,
      },
      {
        menuName: '감튀',
        quantity: 1,
        unitPrice: 5000,
      },
    ],
  },
  {
    username: '참여자2',
    orderCompleted: true,
    cartItems: [
      {
        menuName: '피자',
        quantity: 3,
        unitPrice: 15000,
      },
      {
        menuName: 'Salad',
        quantity: 1,
        unitPrice: 8000,
      },
    ],
  },
]

type Menu = {
  id: number
  menuName: string
  price: number
  menuPictureUrl: string
}

const defaultMenus: Menu[] = [
  {
    id: 1,
    menuName: '수육나베',
    price: 20000,
    menuPictureUrl: '',
  },
  {
    id: 2,
    menuName: '수육튀김',
    price: 10000,
    menuPictureUrl: '',
  },
  {
    id: 3,
    menuName: '수육튀김',
    price: 10000,
    menuPictureUrl: '',
  },
  {
    id: 4,
    menuName: '수육튀김',
    price: 10000,
    menuPictureUrl: '',
  },
  {
    id: 5,
    menuName: '수육튀김',
    price: 10000,
    menuPictureUrl: '',
  },
  {
    id: 6,
    menuName: '수육튀김',
    price: 10000,
    menuPictureUrl: '',
  },
  {
    id: 7,
    menuName: '수육나베',
    price: 10000,
    menuPictureUrl: '',
  },
  {
    id: 8,
    menuName: '수육튀김',
    price: 10000,
    menuPictureUrl: '',
  },
  {
    id: 9,
    menuName: '수육튀김',
    price: 10000,
    menuPictureUrl: '',
  },
  {
    id: 10,
    menuName: '수육튀김',
    price: 10000,
    menuPictureUrl: '',
  },
]

type Cart = {
  id: number
  user: null
  menuName: string
  price: number
  order: any
  sharedOrder: any
  quantity: number
}

const MyCart: Cart[] = [
  {
    id: 1,
    user: null,
    menuName: '수육나베',
    price: 10000,
    order: null,
    sharedOrder: null,
    quantity: 1,
  },
  {
    id: 2,
    user: null,
    menuName: 'menuName',
    price: 10000,
    order: null,
    sharedOrder: null,
    quantity: 1,
  },
]

type MenuQuantity = {
  menuId: number
  quantity: number
}

export default function MyReservation() {
  const addCart = (body: MenuQuantity) => {
    console.log('Add Cart', body)
  }

  const editCart = (cartId: number, quantity: number) => {
    console.log('Edit Cart', cartId, quantity)
  }

  return (
    <div className="flex justify-between">
      <div className='w-full mr-4 '>
        <ScrollArea className="h-[50rem]">
          <Table>
            <TableHeader>
              <TableRow>
                <TableHead className='w-[300px]'>Image</TableHead>
                <TableHead className="w-[80px]">Menu</TableHead>
                <TableHead className="w-[100px]"/>
              </TableRow>
            </TableHeader>
            <TableBody>
              {defaultMenus.map((menu) => {
                const cartItem: Cart | undefined = MyCart.find(
                  (cart) => cart.menuName === menu.menuName,
                )
                const [quantity, setQuantity] = useState(cartItem?.quantity || 0)

                return (
                  <TableRow key={menu.id}>
                    <TableCell>
                      <Image
                        src={'/Western.jpeg'}
                        alt="No Restaurant Image"
                        width={300}
                        height={200}
                      />
                    </TableCell>
                    <TableCell className="text-right">  
                      <p className="font-medium">{menu.menuName}</p>
                      ₩{menu.price} 
                    </TableCell>
                    <TableCell className="w-fit">
                      <div className="flex justify-end">
                      <div className="flex items-center justify-center space-x-2">
                        <Input
                          type="number"
                          min={0}
                          defaultValue={quantity}
                          onChange={(e) =>
                            setQuantity(parseInt(e.target.value))
                          }
                          className="w-[4rem]"
                        />
                        {cartItem ? (
                            <Button
                              className="bg-yellow-300 hover:bg-yellow-500 text-black rounded-full"
                              onClick={() => editCart(cartItem.id, quantity)}
                            >
                              Edit
                            </Button>
                          
                        ) : (
                          <Button
                            className="bg-green-400 hover:bg-green-600 rounded-full"
                            onClick={() =>
                              addCart({ menuId: menu.id, quantity: quantity })
                            }
                          >
                            Add
                          </Button>
                        )}
                        </div>
                      </div>
                    </TableCell>
                  </TableRow>
                )
              })}
            </TableBody>
          </Table>
        </ScrollArea>
        <Button className='w-full mt-4 bg-yellow-300 hover:bg-yellow-400 text-black text-xl'>
          <RiKakaoTalkFill className='mr-2'/> Pay
        </Button>
      </div>

      <div className='w-[50rem] p-4'>
        <div className="border-2 bg-white/50 dark:bg-black/50 rounded-xl p-4 h-fit">
          <div className="text-xl font-bold mb-4">Group Order</div>
          <Separator className="mb-4 h-[2px]" />
          <UserListView />
          <div className='flex justify-end mt-4'>
            <Button className='w-full bg-violet-500'>Order</Button>
          </div>
        </div>
      </div>
    </div>
  )
}
