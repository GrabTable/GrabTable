import { Menu } from '@/app/types/menu'
import { postAddCart } from '@/lib/api/postAddCart'
import { postAddCartInSharedOrder } from '@/lib/api/postAddCartInSharedOrder'
import { Button } from './ui/button'
import { TableCell, TableRow } from './ui/table'
import { useToast } from './ui/use-toast'

interface MenuCardProps {
  menu: Menu
}

export default function MenuCard({ menu }: MenuCardProps) {
  const { toast } = useToast()

  const addCart = async (menuId: number, quantity: number) => {
    const res = await postAddCart(menu.id, 1)
    if (res === undefined) return

    if (res.ok) {
      toast({
        title: 'Successfully added!',
        description: 'grab more!',
        duration: 1000,
      })
      return
    }

    const data = await res.json()

    if (data.code === 5005) {
      toast({
        title: '이미 결제를 완료했습니다.',
        description: 'You cannot modify cart after payment',
        duration: 1000,
      })
      return
    }
  }

  const addCartInsharedOrder = async (menuId: number, quantity: number) => {
    const res = await postAddCartInSharedOrder(menuId, quantity)
    if (res === undefined) return

    if (res.ok) {
      toast({
        title: 'Successfully added!',
        description: 'grab more!',
        duration: 1000,
      })
      return
    }

    const data = await res.json()

    if (data.code === 5006) {
      toast({
        title: data.message,
        description: 'You cannot modify cart after payment',
        duration: 1000,
      })
      return
    }
  }

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
                onClick={() => addCartInsharedOrder(menu.id, 1)}
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
