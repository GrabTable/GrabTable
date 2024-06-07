'use client'
import { DataTable } from '@/components/DataTable'
import { ColumnDef } from '@tanstack/react-table'
import { Cart } from '../_types/type'
import { FaEdit } from 'react-icons/fa'
import { FaSave } from 'react-icons/fa'
import { FaWonSign } from 'react-icons/fa6'
import { useEffect, useState } from 'react'
import { Button } from '@/components/ui/button'
import { Input } from '@/components/ui/Input'

interface SharedCartTableProps {
  data: Cart[]
  save: (id: number, quantity: number) => void
}

export default function SharedCartTable({ data, save }: SharedCartTableProps) {
  const [editingRow, setEditingRow] = useState<Set<number>>(new Set())
  const [rowQuantity, setRowQuantity] = useState<{ [key: string]: number }>({})

  const handleSave = (id: number) => {
    if (rowQuantity[id]) save(id, rowQuantity[id])
  }

  const columns: ColumnDef<Cart>[] = [
    {
      accessorKey: '',
      header: '#',
      cell: ({ row }) => <>{row.index + 1}</>,
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
        <>
          {editingRow.has(row.original.id) ? (
            <Input
              type="number"
              min={0}
              defaultValue={
                rowQuantity[row.original.id]
                  ? rowQuantity[row.original.id]
                  : row.original.quantity
              }
              onChange={(e) => {
                setRowQuantity((prev) => ({
                  ...prev,
                  [row.original.id]: parseInt(e.target.value),
                }))
              }}
              className="w-[4rem]"
            />
          ) : (
            <div>{row.original.quantity}</div>
          )}
        </>
      ),
    },
    {
      accessorKey: 'id',
      header: 'Edit/Save',
      cell: ({ row }) => (
        <>
          <Button
            className={
              editingRow.has(row.original.id)
                ? 'bg-pink-500 hover:bg-pink-700 rounded-full'
                : 'bg-yellow-500 hover:bg-yellow-700 rounded-full'
            }
            onClick={() => {
              if (editingRow.has(row.original.id)) {
                setEditingRow((prev) => {
                  const newEditingRow = new Set(prev)
                  newEditingRow.delete(row.original.id)
                  return newEditingRow
                })
                handleSave(row.original.id)
              } else {
                setEditingRow((prev) => new Set(prev.add(row.original.id)))
              }
            }}
          >
            {editingRow.has(row.original.id) ? <FaSave /> : <FaEdit />}
          </Button>
        </>
      ),
    },
  ]

  const [total, setTotal] = useState<number>(0)
  useEffect(() => {
    setTotal(data.reduce((prev: number, cur: Cart) => prev + cur.totalPrice, 0))
  }, [])

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
