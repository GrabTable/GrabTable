import { InvitationInput } from '@/components/InvitationInput'
import { postJoinReservation } from '@/lib/api/postJoinReservation'
import { useState } from 'react'

export default function NoReservation() {
  const [inviteCode, setInviteCode] = useState('')
  const handleInviteCodeChange = (
    event: React.ChangeEvent<HTMLInputElement>,
  ) => {
    setInviteCode(event.target.value)
  }

  const handleJoinReservation = async () => {
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
