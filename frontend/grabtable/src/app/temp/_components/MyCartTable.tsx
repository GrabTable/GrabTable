import { DataTable } from '@/components/DataTable'
import { ColumnDef } from '@tanstack/react-table'
import { Cart } from '../_types/type'
import { FaCircleXmark } from 'react-icons/fa6'
import { FaWonSign } from 'react-icons/fa6'
import { FaShare } from 'react-icons/fa6'
import { FaEquals } from 'react-icons/fa'
import { useEffect, useState } from 'react'
import { Button } from '@/components/ui/button'

interface MyCartTableProps {
  data: Cart[]
  share: (id: number) => void
}

export default function MyCartTable({ data, share }: MyCartTableProps) {
  const handleShare = (id: number) => share(id)
  const columns: ColumnDef<Cart>[] = [
    {
      accessorKey: 'id',
      header: '#',
    },
    {
      accessorKey: 'menuName',
      header: '',
    },
    {
      accessorKey: 'price',
      header: '',
      cell: ({ row }) => (
        <div className="flex items-center gap-1">
          <FaWonSign />
          {row.original.price}
        </div>
      ),
    },
    {
      accessorKey: 'quantity',
      header: '',
      cell: ({ row }) => (
        <div className="flex items-center gap-1">
          <FaCircleXmark className="text-blue-900" /> {row.original.quantity}
        </div>
      ),
    },
    {
      accessorKey: 'totalPrice',
      header: '',
      cell: ({ row }) => (
        <div className="flex items-center gap-1">
          <FaEquals /> <FaWonSign />
          {row.original.totalPrice}
        </div>
      ),
    },
    {
      accessorKey: '',
      header: 'Share',
      cell: ({ row }) => (
        <>
          <Button
            className="bg-violet-400 dark:bg-violet-800"
            onClick={() => handleShare(row.original.id)}
          >
            <FaShare />
          </Button>
        </>
      ),
    },
  ]

  const [total, setTotal] = useState<number>(0)
  useEffect(() => {
    setTotal(data.reduce((prev: number, cur: Cart) => prev + cur.totalPrice, 0))
  })

  return (
    <>
      <DataTable columns={columns} data={data} />
      <div className="flex items-center gap-1 justify-end my-2 mr-2">
        TOTAL: <FaWonSign />
        {total}
      </div>
    </>
  )
}
