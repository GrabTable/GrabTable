import { Cart } from '@/app/types/cart'
import { Menu } from '@/app/types/menu'
import MenuCard from './MenuCard'
import { ScrollArea } from './ui/scroll-area'
import { Table, TableBody, TableHead, TableHeader, TableRow } from './ui/table'

interface MenuTableProps {
  menus: Menu[]
  carts: Cart[]
  addCart: (menuId: number, quantity: number) => void
  editCart: (cartId: number, quantity: number) => void
}

export default function MenuTable(props: MenuTableProps) {
  const { menus, carts, addCart, editCart } = props
  return (
    <ScrollArea className="h-[50rem]">
      <Table>
        <TableHeader>
          <TableRow>
            <TableHead className="w-[300px]">Image</TableHead>
            <TableHead className="w-[80px]">Menu</TableHead>
            <TableHead className="w-[100px]" />
          </TableRow>
        </TableHeader>
        <TableBody>
          {menus.map((menu) => {
            const cartItem: Cart | undefined = carts?.find((cart: Cart) => {
              console.log(`Comparing ${menu.menuName} with ${cart.menuName}`)
              return cart.menuName === menu.menuName
            })
            return (
              <MenuCard
                key={menu.id}
                menu={menu}
                cartItem={cartItem}
                addCart={addCart}
                editCart={editCart}
              />
            )
          })}
        </TableBody>
      </Table>
    </ScrollArea>
  )
}
