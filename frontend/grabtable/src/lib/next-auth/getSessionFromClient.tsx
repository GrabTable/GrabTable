import React from 'react'

export default async function getSessionFromClient() {
    const response = await fetch(
        'http://localhost:3000/api/session'
      )
    const session = await response.json()
    
    if(session.error) return null
    return session
}
