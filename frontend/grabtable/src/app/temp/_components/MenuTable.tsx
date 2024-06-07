'use client'
import { DataTable } from '@/components/DataTable'
import { Input } from '@/components/ui/Input'
import { Button } from '@/components/ui/button'
import { ColumnDef } from '@tanstack/react-table'
import Image from 'next/image'
import { Menu } from '../_types/type'

async function getData(): Promise<Menu[]> {
  // Fetch data from your API here.
  return [
    {
      id: 1,
      menuName: 'menu',
      price: 1000,
      menuPrictureUrl: 'hahaha',
    },
    // ...
  ]
}

export default async function MenuTable() {
  const columns: ColumnDef<Menu>[] = [
    {
      accessorKey: 'menuPrictureUrl',
      header: 'Menu',
      cell: () => (
        <Image
          src={'/Western.jpeg'}
          alt="No Restaurant Image"
          width={300}
          height={200}
        />
      ),
    },
    {
      accessorKey: 'price',
      header: '',
      cell: ({ row }) => (
        <>
          <p className="font-medium">{row.original.menuName}</p>
          <p>₩{row.original.price}</p>
        </>
      ),
    },
    {
      accessorKey: 'amount',
      header: '',
      cell: () => (
        <div className="flex justify-end gap-x-2">
          <Input
            type="number"
            min={0}
            defaultValue={0}
            onChange={(e) => {
              console.log('hi')
            }}
            className="w-[4rem]"
          />
          <Button
            className="bg-green-400 hover:bg-green-600 rounded-full"
            onClick={() => console.log('add cart')}
          >
            Add
          </Button>
        </div>
      ),
    },
  ]
  const data = await getData()
  return (
    <>
      <DataTable columns={columns} data={data} />
    </>
  )
}
