'use client'
import { DataTable } from '@/components/DataTable'
import { ColumnDef } from '@tanstack/react-table'
import { Cart } from '../_types/type'
import { FaCircleXmark } from 'react-icons/fa6'
import { FaWonSign } from 'react-icons/fa6'
import { useEffect, useState } from 'react'

interface UserOrderTableProps {
  data: Cart[]
}

export default function UserOrderTable({ data }: UserOrderTableProps) {
  const columns: ColumnDef<Cart>[] = [
    {
      accessorKey: 'id',
      header: '#',
    },
    {
      accessorKey: 'menuName',
      header: 'Menu',
    },
    {
      accessorKey: 'price',
      header: 'Price',
      cell: ({ row }) => (
        <div className="flex items-center gap-1">
          <FaWonSign />
          {row.original.price}
        </div>
      ),
    },
    {
      accessorKey: 'quantity',
      header: 'Quantity',
      cell: ({ row }) => (
        <div className="flex items-center gap-1">
          <FaCircleXmark className="text-blue-900" /> {row.original.quantity}
        </div>
      ),
    },
    {
      accessorKey: 'totalPrice',
      header: 'Unit Price',
      cell: ({ row }) => (
        <div className="flex items-center gap-1">
          <FaWonSign />
          {row.original.totalPrice}
        </div>
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
