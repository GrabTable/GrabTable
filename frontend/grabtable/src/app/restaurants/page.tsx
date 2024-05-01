'use client'
import { InputWithButton } from '@/components/Inputwithbutton'
import { useSearchParams } from 'next/navigation'
import { useState, useEffect } from 'react'
import Link from 'next/link'
import RestaurantCard from '@/components/RestaurantCard'

type Restaurant = {
  address: string
  averageRating: number
  category: string
  id: number
  storeName: string
  storePictureUrl: string
}

export default function Home() {
  const params = useSearchParams()
  const search = params.get('search')
  const category = params.get('category')

  const [stores, setStores] = useState<Restaurant[]>([])

  useEffect(() => {
    fetchStores()
  }, [search, category])

  if (!search && !category) {
    console.log('no search and no category!')
  }

  const filterStores = (stores: Restaurant[]) => {
    if (search) {
      setStores(stores.filter(store => store.storeName.toLowerCase().includes(search.toLowerCase())))
    } else if (category) {
      setStores(stores.filter(store => store.category === category.toUpperCase()))
    } else {
      setStores(stores)
    }
  }

  const fetchStores = async () => {
    try {
      const response = await fetch('http://localhost:8000/v1/stores')
      if (!response.ok) {
        throw new Error('Something went wrong')
      }
      const data = await response.json()
      filterStores(data)
    } catch (error) {
      console.error('Failed to fetch stores:', error)
    }
  }
  console.log(stores)
  return (
    <div className='mx-48'>
      <InputWithButton input={search || category || ''} />
      <section className="flex min-h-screen flex-col items-center justify-between scroll-mt-[0rem]">
        <div className='w-full'>
          {stores.map((store: Restaurant) => (
            <Link key={store.id} href={`/restaurants/${store['id']}`} className='hover:cursor-pointer'>
              <RestaurantCard key={store.id} {...store} />
            </Link>
          ))}
        </div>
      </section>
    </div>
  )
}
