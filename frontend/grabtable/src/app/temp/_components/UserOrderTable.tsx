'use client'
import { DataTable } from '@/components/DataTable'
import { ColumnDef } from '@tanstack/react-table'
import { useEffect, useState } from 'react'
import { FaMinus, FaPlus, FaWonSign } from 'react-icons/fa6'
import { Cart } from '../_types/type'

interface UserOrderTableProps {
  data: Cart[]
  onQuantityChange?: (id: number, quantity: number) => void
  viewOnly?: boolean
  faded?: boolean
}

export default function UserOrderTable({
  data,
  onQuantityChange = () => {},
  viewOnly = false,
  faded = false,
}: UserOrderTableProps) {
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
      cell: ({ row }) =>
        !viewOnly ? (
          <div className="flex items-center gap-1">
            <button
              onClick={() =>
                onQuantityChange(row.original.id, row.original.quantity - 1)
              }
            >
              <FaMinus className="text-red-600 cursor-pointer" />
            </button>
            {row.original.quantity}
            <button
              onClick={() =>
                onQuantityChange(row.original.id, row.original.quantity + 1)
              }
            >
              <FaPlus className="text-green-600 cursor-pointer" />
            </button>
          </div>
        ) : (
          <div className="flex items-center gap-1">{row.original.quantity}</div>
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
    if (!data) return
    setTotal(data.reduce((prev: number, cur: Cart) => prev + cur.totalPrice, 0))
  })

  return (
    <div>
      <DataTable columns={columns} data={data} faded={faded} />
      <div className="flex items-center gap-1 justify-end my-2 mr-2">
        TOTAL: <FaWonSign />
        {total}
      </div>
    </div>
  )
}
