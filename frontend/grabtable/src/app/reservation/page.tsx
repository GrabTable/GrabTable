'use client'
import { useEffect, useState } from 'react'
import MyReservation from './MyReservation'
import NoReservation from './NoReservation'

export default function Page() {
  const [hasReservation, setHasReservation] = useState(true)

  return (
    <div className="flex min-h-screen flex-col items-center justify-between p-8">
      {hasReservation ? <MyReservation /> : <NoReservation />}
    </div>
  )
}
