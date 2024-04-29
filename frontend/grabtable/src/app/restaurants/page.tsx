'use client'
import Image from 'next/image'
import { Input } from '@/components/ui/Input'
import { InputWithButton } from '@/components/Inputwithbutton'
import { useSearchParams } from 'next/navigation'
import { useState, useEffect } from 'react'
import Link from 'next/link'

export default function Home() {
  const params = useSearchParams()
  const search = params.get('search')
  const category = params.get('category')

  const [stores, setStores] = useState([])

  useEffect(() => {
    fetchStores()
  }, [search, category])

  if (!search && !category) {
    console.log('no search and no category!')
  }

  const fetchStores = async () => {
    try {
      const response = await fetch('http://localhost:8000/v1/stores')
      if (!response.ok) {
        throw new Error('Something went wrong')
      }
      const data = await response.json()
      setStores(data)
    } catch (error) {
      console.error('Failed to fetch stores:', error)
    }
  }
  console.log(stores)
  return (
    <section className="flex min-h-screen flex-col items-center justify-between p-24 scroll-mt-[0rem]">
      {/* <InputWithButton/> */}
      <div>
        {stores.map((store) => (
          <Link key={store['id']} href={`/restaurants/${store['id']}`}>
            {store['id']} {store['storeName']} <div></div>
          </Link>
        ))}
      </div>
    </section>
  )
}
