import { Menu } from '@/app/types/menu'
import { Button } from './ui/button'
import { TableCell, TableRow } from './ui/table'

interface MenuCardProps {
  menu: Menu
  addCart: (menuId: number, quantity: number) => void
  addCartInSharedOrder: (menuId: number, quantity: number) => void
}

export default function MenuCard({
  menu,
  addCart,
  addCartInSharedOrder,
}: MenuCardProps) {
  return (
    <TableRow key={menu.id}>
      <TableCell className="w-48">
        <p className="font-bold">{menu.menuName}</p>
      </TableCell>
      <TableCell className="text-right">
        <p className="font-bold">₩{menu.price}</p>
      </TableCell>
      <TableCell className="w-fit">
        <div className="flex justify-end">
          <div className="flex items-center justify-center space-x-2">
            <>
              <Button
                className="bg-green-400 hover:bg-green-600 rounded-full"
                onClick={() => addCart(menu.id, 1)}
              >
                Add to My Cart
              </Button>
              <Button
                className="bg-blue-400 hover:bg-blue-600 rounded-full"
                onClick={() => addCartInSharedOrder(menu.id, 1)}
              >
                Add to Shared Cart
              </Button>
            </>
          </div>
        </div>
      </TableCell>
    </TableRow>
  )
}
