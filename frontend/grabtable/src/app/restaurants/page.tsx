'use client'
import { InputWithButton } from '@/components/Inputwithbutton'
import RestaurantCard from '@/components/RestaurantCard'
import KakaoMap from '@/components/kakaoMap'
import { BASE_URL } from '@/lib/constants'
import Link from 'next/link'
import { useSearchParams } from 'next/navigation'
import { useEffect, useState } from 'react'
import { Restaurant } from '../types/restaurant'

export default function Home() {
  const params = useSearchParams()
  const search = params.get('search')
  const category = params.get('category')

  const [stores, setStores] = useState<Restaurant[]>([])

  useEffect(() => {
    fetchStores()
  }, [search, category])

  const filterStores = (stores: Restaurant[]) => {
    if (search) {
      setStores(
        stores.filter((store) =>
          store.storeName.toLowerCase().includes(search.toLowerCase()),
        ),
      )
    } else if (category) {
      setStores(
        stores.filter((store) => store.category === category.toUpperCase()),
      )
    } else {
      setStores(stores)
    }
  }

  const fetchStores = async () => {
    await fetch(`${BASE_URL}/v1/stores`)
      .then(async (response) => {
        const body = await response.json()
        filterStores(body)
      })
      .catch((error) => {
        console.error('Failed to fetch stores:', error)
      })
  }

  return (
    <div className="mx-48">
      <InputWithButton input={search || category || ''} />
      <KakaoMap stores={stores} />
      <section className="flex min-h-screen flex-col items-center justify-between scroll-mt-[0rem]">
        <div className="w-full">
          {stores.map((store: Restaurant) => (
            <Link
              key={store.id}
              href={`/restaurants/${store['id']}`}
              className="hover:cursor-pointer"
            >
              <RestaurantCard key={store.id} {...store} />
            </Link>
          ))}
        </div>
      </section>
    </div>
  )
}
