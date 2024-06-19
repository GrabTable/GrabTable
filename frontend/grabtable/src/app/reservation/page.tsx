'use client'
import Spinner from '@/components/spinner'
import { Toaster } from '@/components/ui/toaster'
import { useToast } from '@/components/ui/use-toast'
import { BASE_API_URL } from '@/lib/constants'
import getSessionFromClient from '@/lib/next-auth/getSessionFromClient'
import { ReactQueryProvider } from '@/lib/useReactQuery'
import { useRouter } from 'next/navigation'
import { Suspense, useEffect, useState } from 'react'
import InviteCode from './InvitateCode'
import MyReservation from './MyReservation'
import NoReservation from './NoReservation'

export default function Page() {
  const router = useRouter()
  const [hasReservation, setHasReservation] = useState(true)
  const [inviteCode, setInviteCode] = useState('')
  const [storeID, setStoreID] = useState(0)
  const [menus, setMenus] = useState([])
  const [loading, setLoading] = useState(true)
  const { toast } = useToast()

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

  const getMyReservation = async (session: any) => {
    await fetch(`${BASE_API_URL}/v1/reservations/me`, {
      headers: {
        'Content-Type': 'application/json',
        Authorization: 'Bearer ' + session.formData['accessToken'],
      },
      credentials: 'include',
    })
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

  const getMenus = async (session: any) => {
    await fetch(`${BASE_API_URL}/v1/stores/${storeID}/menus`, {
      headers: {
        'Content-Type': 'application/json',
        Authorization: 'Bearer ' + session.formData['accessToken'],
      },
      credentials: 'include',
    })
      .then((res) => res.json())
      .then((data) => {
        setMenus(data)
      })
      .catch((error) => {
        setHasReservation(false)
      })
  }

  const fetchData = async () => {
    const session = await getSessionFromClient()

    if (!session) {
      handleGuest()
      return
    }

    await getMyReservation(session)
    await getMenus(session)
    setLoading(false)
  }

  useEffect(() => {
    fetchData()
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
      <Suspense fallback={<div>Loading...</div>}>
        <ReactQueryProvider>
          {hasReservation ? (
            <div>
              <InviteCode inviteCode={inviteCode} />
              {menus.length && (
                <MyReservation menus={menus} storeID={storeID} />
              )}
            </div>
          ) : (
            <NoReservation />
          )}
        </ReactQueryProvider>
      </Suspense>
      <Toaster />
    </div>
  )
}
