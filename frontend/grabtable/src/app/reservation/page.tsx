'use client'
import { Toaster } from '@/components/ui/toaster'
import { useToast } from '@/components/ui/use-toast'
import { BASE_URL } from '@/lib/constants'
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
  const [isHost, setisHost] = useState(false)
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
    await fetch(`${BASE_URL}/v1/reservations/me`, {
      headers: {
        'Content-Type': 'application/json',
        Authorization: 'Bearer ' + session.formData['access_token'],
      },
      credentials: 'include',
    })
      .then((res) => res.json())
      .then((data) => {
        setHasReservation(true)
        setInviteCode(data.inviteCode)
        setStoreID(data.storeId)
        if (data.host.id === session.formData['userInfo'].id) {
          setisHost(true)
        }
      })
      .catch((error) => {
        setHasReservation(false)
      })
  }

  const getMenus = async (session: any) => {
    await fetch(`${BASE_URL}/v1/stores/${storeID}/menus`, {
      headers: {
        'Content-Type': 'application/json',
        Authorization: 'Bearer ' + session.formData['access_token'],
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
    }

    getMyReservation(session).then(() => {
      getMenus(session)
    })
  }

  useEffect(() => {
    fetchData()
  }, [hasReservation, storeID])

  return (
    <div className="flex min-h-screen flex-col items-center justify-between p-8">
      <Suspense fallback={<div>Loading...</div>}>
        <ReactQueryProvider>
          {hasReservation ? (
            <div>
              <InviteCode inviteCode={inviteCode} />
              {menus.length && (
                <MyReservation
                  menus={menus}
                  storeID={storeID}
                  isHost={isHost}
                />
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
