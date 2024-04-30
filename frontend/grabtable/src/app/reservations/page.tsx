'use client'
import { useState } from 'react'
import { InputWithButton } from './Inputwithbutton'
import { UserListView } from './UserListView'

export default function Home() {
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
    <main className="flex min-h-screen flex-col items-center justify-between p-24">
      <section
        className="scroll-mt-[100rem] w-full"
        style={{ maxWidth: '50rem' }}
      >
        <div className="text-4xl font-bold mb-4">
          초대 코드로 예약에 참여하세요.
        </div>
        <InputWithButton
          inputValue={inviteCode}
          onInputChange={handleInviteCodeChange}
          onClick={handleJoinReservation}
        />
        <UserListView></UserListView>
      </section>
    </main>
  )
}
