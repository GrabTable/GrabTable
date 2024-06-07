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
  const [hasReservation, setHasReservation] = useState(false)
  const [inviteCode, setInviteCode] = useState('')
  const [storeID, setStoreID] = useState(0)
  const [menus, setMenus] = useState([])
  const [isHost, setisHost] = useState(false)

  const { toast } = useToast()

  useEffect(() => {
    ;(async () => {
      const session = await getSessionFromClient()
      if (!session) {
        toast({
          title: 'Login first',
          description: 'You need to log in to continue.',
          duration: 1000,
        })
        setTimeout(() => {
          router.push('/mypage')
        }, 1300)
        return
      }

      try {
        const response = await fetch(`${BASE_URL}/v1/reservations/me`, {
          headers: {
            'Content-Type': 'application/json',
            Authorization: 'Bearer ' + session.formData['access_token'],
          },
          credentials: 'include',
        })
        const data = await response.json()
        if (response.ok) {
          setInviteCode(data.inviteCode)
          setStoreID(data.storeId)
          if (data.host.id === session.formData['userInfo'].id) {
            setisHost(true)
          }
          const response2 = await fetch(
            `${BASE_URL}/v1/stores/${data.storeId}/menus`,
            {
              headers: {
                'Content-Type': 'application/json',
                Authorization: 'Bearer ' + session.formData['access_token'],
              },
              credentials: 'include',
            },
          )
          const data2 = await response2.json()
          setMenus(data2)
          setHasReservation(true)
        }
      } catch (error) {
        console.error('error', error)
      }
    })()
  }, [router, toast])

  return (
    <div className="flex min-h-screen flex-col items-center justify-between p-8">
      <Suspense fallback={<div>Loading...</div>}>
        <ReactQueryProvider>
          {hasReservation ? (
            <div>
              <InviteCode inviteCode={inviteCode} />
              <MyReservation menus={menus} storeID={storeID} isHost={isHost} />
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
