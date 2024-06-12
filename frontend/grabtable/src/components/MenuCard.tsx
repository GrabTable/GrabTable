import { Cart } from '@/app/types/cart'
import { Menu } from '@/app/types/menu'
import Image from 'next/image'
import { useEffect, useState } from 'react'
import { Input } from './ui/Input'
import { Button } from './ui/button'
import { TableCell, TableRow } from './ui/table'

interface MenuCardProps {
  menu: Menu
  cartItem: Cart | undefined
  addCart: (menuId: number, quantity: number) => void
  editCart: (cartId: number, quantity: number) => void
}

export default function MenuCard(props: MenuCardProps) {
  const { menu, cartItem, addCart, editCart } = props

  const getInitialQuantity = () => {
    return cartItem?.quantity ? cartItem?.quantity : 0
  }

  const [quantity, setQuantity] = useState(getInitialQuantity)
  useEffect(() => {
    setQuantity(cartItem?.quantity || 0)
  }, [cartItem?.quantity || 0])

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
        <p className="font-bold">{menu.menuName}</p>₩{menu.price}
      </TableCell>
      <TableCell className="w-fit">
        <div className="flex justify-end">
          <div className="flex items-center justify-center space-x-2">
            {cartItem ? (
              <>
                <Input
                  type="number"
                  min={0}
                  value={quantity}
                  onChange={(e) => {
                    setQuantity(parseInt(e.target.value))
                  }}
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
                  onChange={(e) => {
                    setQuantity(parseInt(e.target.value))
                  }}
                  className="w-[4rem]"
                />
                <Button
                  className="bg-green-400 hover:bg-green-600 rounded-full"
                  onClick={() => addCart(menu.id, quantity)}
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
}
