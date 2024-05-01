import { getSession } from '@/lib/next-auth/session'
import React from 'react'

export default async function pages() {
    const session = await getSession()
    if(!session){
        return (
            <div>login first</div>
        )
    }
    return (
        <div>pages</div>
    )
}
