import { Menu } from '@/app/types/menu'
import MenuCard from './MenuCard'
import { ScrollArea } from './ui/scroll-area'
import { Table, TableBody, TableHead, TableHeader, TableRow } from './ui/table'

interface MenuTableProps {
  menus: Menu[]
}

export default function MenuTable({ menus }: MenuTableProps) {
  return (
    <ScrollArea className="h-[50rem]">
      <Table>
        <TableHeader>
          <TableRow>
            <TableHead className="w-[80px]">Menu</TableHead>
            <TableHead className="w-[80px]">Price</TableHead>
            <TableHead className="w-[100px]" />
          </TableRow>
        </TableHeader>
        <TableBody>
          {menus.map((menu) => {
            return <MenuCard key={menu.id} menu={menu} />
          })}
        </TableBody>
      </Table>
    </ScrollArea>
  )
}
