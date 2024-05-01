import { InvitationInput } from '@/components/InvitationInput'
import { useState } from 'react'

export default function NoReservation() {
  const [inviteCode, setInviteCode] = useState('')

  const handleInviteCodeChange = (
    event: React.ChangeEvent<HTMLInputElement>,
  ) => {
    setInviteCode(event.target.value)
  }

  const handleJoinReservation = () => {
    // TODO: Implement logic to join reservation using invite code
    console.log('Joining reservation with invite code:', inviteCode)
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
