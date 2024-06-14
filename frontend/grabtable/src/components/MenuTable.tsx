import { Menu } from '@/app/types/menu'
import MenuCard from './MenuCard'
import { ScrollArea } from './ui/scroll-area'
import { Table, TableBody, TableHead, TableHeader, TableRow } from './ui/table'

interface MenuTableProps {
  menus: Menu[]
  addCart: (menuId: number, quantity: number) => void
  addCartInSharedOrder: (menuId: number, quantity: number) => void
}

export default function MenuTable({
  menus,
  addCart,
  addCartInSharedOrder,
}: MenuTableProps) {
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
            return (
              <MenuCard
                key={menu.id}
                menu={menu}
                addCart={addCart}
                addCartInSharedOrder={addCartInSharedOrder}
              />
            )
          })}
        </TableBody>
      </Table>
    </ScrollArea>
  )
}
