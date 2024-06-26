import { InvitationInput } from '@/components/InvitationInput'
import { BASE_API_URL } from '@/lib/constants'
import getSessionFromClient from '@/lib/next-auth/getSessionFromClient'
import { useState } from 'react'

export default function NoReservation() {
  const [inviteCode, setInviteCode] = useState('')
  const handleInviteCodeChange = (
    event: React.ChangeEvent<HTMLInputElement>,
  ) => {
    setInviteCode(event.target.value)
  }

  async function postJoinReservation(inviteCode: string) {
    const session = await getSessionFromClient()

    const response = await fetch(
      `${BASE_API_URL}/v1/reservations/${inviteCode}`,
      {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          Authorization: 'Bearer ' + session.formData['accessToken'],
        },
        credentials: 'include',
      },
    )
  }

  const handleJoinReservation = async () => {
    // TODO: Implement logic to join reservation using invite code
    console.log('Joining reservation with invite code:', inviteCode)
    await postJoinReservation(inviteCode)
    window.location.reload()
  }
  return (
    <section
      className="scroll-mt-[100rem] w-full"
      style={{ maxWidth: '50rem' }}
    >
      <div className="text-2xl font-bold mb-4">
        Join the reservation with Invitation Code!
      </div>
      <InvitationInput
        inputValue={inviteCode}
        onInputChange={handleInviteCodeChange}
        onClick={handleJoinReservation}
      />
    </section>
  )
}
