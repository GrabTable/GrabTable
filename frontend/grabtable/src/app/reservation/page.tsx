'use client'
import Spinner from '@/components/spinner'
import { Toaster } from '@/components/ui/toaster'
import { useToast } from '@/components/ui/use-toast'
import { getMyReservation } from '@/lib/api/getMyReservation'
import getSessionFromClient from '@/lib/next-auth/getSessionFromClient'
import { ReactQueryProvider } from '@/lib/useReactQuery'
import { useRouter } from 'next/navigation'
import { useEffect, useState } from 'react'
import MyReservation from './MyReservation'
import NoReservation from './NoReservation'

export default function Page() {
  const router = useRouter()
  const [hasReservation, setHasReservation] = useState(false)
  const [inviteCode, setInviteCode] = useState('')
  const [storeID, setStoreID] = useState(0)
  const [loading, setLoading] = useState(true)
  const { toast } = useToast()

  const session = getSessionFromClient()

  const handleGuest = (): void => {
    toast({
      title: 'Login first',
      description: 'You need to log in to continue.',
      duration: 1000,
    })
    setTimeout(() => {
      router.push('/mypage')
    }, 1300)
  }

  const fetchMyReservation = async (session: any) => {
    await getMyReservation()
      .then((res) => {
        if (res.status === 200) {
          return res.json()
        } else {
          throw new Error('No reservation')
        }
      })
      .then((data) => {
        setHasReservation(true)
        setInviteCode(data.inviteCode)
        setStoreID(data.storeId)
      })
      .catch((error) => {
        setHasReservation(false)
      })
  }

  const fetchData = async (session: any) => {
    if (!session) {
      handleGuest()
      return
    }

    await fetchMyReservation(session)
    setLoading(false)
  }

  useEffect(() => {
    fetchData(session)
  }, [hasReservation, storeID])

  if (loading) {
    return (
      <>
        <Spinner />
        <Toaster />
      </>
    )
  }

  return (
    <div className="flex min-h-screen flex-col items-center justify-between p-8">
      <ReactQueryProvider>
        {hasReservation ? (
          <MyReservation inviteCode={inviteCode} storeID={storeID} />
        ) : (
          <NoReservation />
        )}
      </ReactQueryProvider>
      <Toaster />
    </div>
  )
}
