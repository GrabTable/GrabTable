'use client'
import { UserListView } from '@/components/UserListView'
import { Input } from '@/components/ui/Input'
import { Button } from '@/components/ui/button'
import Image from 'next/image'
import { RiKakaoTalkFill } from "react-icons/ri"
import { ScrollArea } from '@/components/ui/scroll-area'
import { Separator } from '@/components/ui/separator'
import { useQuery } from "@tanstack/react-query";
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from '@/components/ui/table'
import { useEffect, useState } from 'react'
import getSessionFromClient from '@/lib/next-auth/getSessionFromClient'
import { useRouter } from 'next/navigation'
import Page from './payment/page'
import { UserCard } from '@/components/UserCard'
import { Toaster } from '@/components/ui/toaster'
import { useToast } from '@/components/ui/use-toast'

interface CartItem {
  menuName: string
  quantity: number
  unitPrice: number
}

type Menu = {
  id: number
  menuName: string
  price: number
  menuPictureUrl: string
}

type MyCart = {
  id: number
  quantity: number
  menuName : string
  price: number
  totalPrice: number
}
type Cart = {
  id: number
  user: null
  menuName: string
  price: number
  order: any
  sharedOrder: any
  quantity: number
}

interface CartItem {
  menuName: string
  quantity: number
  unitPrice: number
  totalPrice: number
}

type UserCartsInfo = {
  id: number
  username: string
  profileImageUrl: string
  currentCarts: Cart[]
}
type Orders = {
  id: number
  storeId: number
  host: UserCartsInfo
  invitees: UserCartsInfo[]
  inviteCode: string
  orders: string[]
}
type MenuQuantity = {
  menuId: number
  quantity: number
  menuName: string
}

interface MyReservationProps {
  storeID: number;
  menus: Menu[];
  isHost: boolean
}

export default function MyReservation(props: MyReservationProps) {
  const { menus,storeID,isHost } = props

  const { toast } = useToast()
  const router = useRouter()
  const addCart = async (body: MenuQuantity) => {
    const session = await getSessionFromClient()
    const {menuId, quantity, menuName } = body
  
    if(quantity === 0){ // 0개를 추가하면 그냥 무시
      return
    }
    const response = await fetch(`http://localhost:8000/v1/carts`, {
            method:"POST",
            body:JSON.stringify({            
              "menuId" : menuId,
              "quantity" : quantity
            }),
            headers: {
              'Content-Type': 'application/json',
              Authorization: "Bearer " + session.formData['access_token'],
            },
            credentials: 'include',
    })
    toast({
      title: "Successfully added!",
      description: "grab more!",
      duration: 1000,
    });
  }

  const editCart = async (cartId: number, quantity: number) => {

    const session = await getSessionFromClient()
    if(quantity === 0){ // 삭제하기
      const response = await fetch(`http://localhost:8000/v1/carts/${cartId}`, {
              method:"DELETE",
              headers: {
                'Content-Type': 'application/json',
                Authorization: "Bearer " + session.formData['access_token'],
              },
              credentials: 'include',
      })
      toast({
        variant: "destructive",
        description: "Successfully deleted!",
        duration: 1000,
      });
     return
    }

    // 0개가 아니라면, 수정
    const response = await fetch(`http://localhost:8000/v1/carts/${cartId}`, {
              method:"PATCH",
              body:JSON.stringify({
                quantity: quantity,
              }),
              headers: {
                'Content-Type': 'application/json',
                Authorization: "Bearer " + session.formData['access_token'],
              },
              credentials: 'include',
      })
      toast({
        title: "Successfully modified!",
        description: "grab more!",
        duration: 1000,
      });
     return
  }
  
  const getOrders = async () => {
    const session = await getSessionFromClient()
    const response = await fetch(`http://localhost:8000/v1/reservations/me`, {
          headers: {
            'Content-Type': 'application/json',
            Authorization: "Bearer " + session.formData['access_token'],
          },
          credentials: 'include',
        })
        const data = await response.json()
        if (!response.ok) throw new Error('Failed to fetch orders');
        return data
      };

  const getMyCart = async () => {
    const session = await getSessionFromClient()
    const response = await fetch(`http://localhost:8000/v1/carts/me`, {
            method:"GET",
            headers: {
              'Content-Type': 'application/json',
              Authorization: "Bearer " + session.formData['access_token'],
            },
            credentials: 'include',
    })

    if (!response.ok) throw new Error('Failed to fetch Mycart');
    return await response.json();
  }

  // 0.5초 마다 팀원 전체의 order를 폴링
  const { data: orders, isLoading, error } = useQuery<any>({
    queryKey: ['orders'],
    queryFn: getOrders, 
    refetchInterval: 500
  });

  const { data: myCart} = useQuery<MyCart[]>({
    queryKey: ['myCarts'],
    queryFn: getMyCart,
    refetchInterval:500
  })

  const handlePayment = () => {
    router.push('/reservation/payment');
  };
  const hostUser = {
    username: orders?.host.username,
    profileImageUrl: orders?.host.profileImageUrl,
    cartItems: orders?.host.currentCarts.map((cart: { menuName: any; quantity: any; price: any; totalPrice: any }) => ({
      menuName: cart.menuName,
      quantity: cart.quantity,
      unitPrice: cart.price,
      totalPrice: cart.totalPrice,
    })),
  };

  const inviteesUsers = orders?.invitees.map((invitee: { username: any; profileImageUrl: any; currentCarts: any[] }) => ({
    username: invitee.username,
    profileImageUrl: invitee.profileImageUrl,
    cartItems: invitee.currentCarts.map(cart => ({
      menuName: cart.menuName,
      quantity: cart.quantity,
      unitPrice: cart.price,
      totalPrice: cart.totalPrice,
    })),
  }));


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
              {menus.map((menu) => {
                const cartItem: MyCart | undefined = myCart?.find(
                  (cart: MyCart) => cart.menuName === menu.menuName,
                );
                const getInitialQuantity = () => {
                  return cartItem?.quantity ? cartItem?.quantity : 0;
                };
                
                const [quantity, setQuantity] = useState(getInitialQuantity);
                useEffect(() => {
                  setQuantity(cartItem?.quantity || 0);
                }, [cartItem?.quantity || 0]);
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
                        
                        {cartItem ? (<>
                            <Input
                            type="number"
                            min={0}
                            value={quantity}
                            onChange={(e) =>{
                              setQuantity(parseInt(e.target.value))
                            }
                            }
                            className="w-[4rem]"
                          />
                            <Button
                              className="bg-yellow-300 hover:bg-yellow-500 text-black rounded-full"
                              onClick={() => editCart(cartItem.id, quantity)}
                            >
                              Edit
                            </Button>
                          </>
                        ) : (
                          <>
                          <Input
                          type="number"
                          min={0}
                          defaultValue={0}
                          onChange={(e) =>{
                            setQuantity(parseInt(e.target.value))
                          }
                          }
                          className="w-[4rem]"
                        />
                          <Button
                            className="bg-green-400 hover:bg-green-600 rounded-full"
                            onClick={() =>
                              addCart({ menuId: menu.id, quantity: quantity, menuName: menu.menuName })
                            }
                          >
                            Add
                          </Button>
                          </>
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
        <Button className='w-full mt-4 bg-yellow-300 hover:bg-yellow-400 text-black text-xl' onClick={handlePayment}>
          <RiKakaoTalkFill className='mr-2' /> Pay
        </Button>
        {/* <Page/> */}
      </div>

      <div className='w-[50rem] p-4'>
        <div className="border-2 bg-white/50 dark:bg-black/50 rounded-xl p-4 h-fit">
          <div className="text-xl font-bold mb-4">Group Order</div>
          <Separator className="mb-4 h-[2px]" />
          {/* <UserListView orders={orders} /> */}
          <div className="flex flex-col space-y-4">
          {hostUser && inviteesUsers && (
              <UserCard key={hostUser.username} user={hostUser} />
            )}
            {(inviteesUsers || []).map((invitee: any, index: any) => (
            <UserCard key={invitee.username + index} user={invitee} />
          ))}
          </div>
          <div className='flex justify-end mt-4'>
            {isHost && (<Button className='w-full bg-violet-500'>Order</Button>)}
          </div>
        </div>
      </div>
      <Toaster/>
    </div>
  )
}
