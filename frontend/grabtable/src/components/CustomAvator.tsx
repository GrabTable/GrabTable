'use client'

import { getMyInfo } from '@/lib/api/getMyInfo'
import { User } from '@/lib/types/user'
import { motion } from 'framer-motion'
import Image from 'next/image'
import { useEffect, useState } from 'react'

export default function CustomAvatar() {
  const [myInfo, setMyInfo] = useState<User | null>(null)

  useEffect(() => {
    const res = getMyInfo()
    res.then((data) => {
      setMyInfo(data)
    })
  }, [])

  const profileImageUrl = myInfo?.profileImageUrl || ''

  const formatUsername = (username: string | undefined) => {
    if (!username) return ''
    const [name, number] = username.split('#')
    const shortNumber = number ? number.slice(0, 4) : ''
    return `${name}#${shortNumber}님`
  }

  return (
    <>
      <div className="flex items-center justify-center">
        <div className="relative">
          <motion.div
            initial={{ opacity: 0, scale: 0 }}
            animate={{ opacity: 1, scale: 1 }}
            transition={{
              type: 'tween',
              duration: 0.2,
            }}
          >
            {profileImageUrl ? (
              <Image
                src={profileImageUrl}
                alt="Profile image"
                width="192"
                height="192"
                quality="95"
                priority={true}
                className="h-24 w-24 rounded-full object-cover border-[0.35rem] border-white shadow-xl"
              />
            ) : (
              <div className="h-24 w-24 rounded-full object-cover border-[0.35rem] border-white shadow-xl bg-gray-200 flex items-center justify-center">
                <span>No Image</span>
              </div>
            )}
          </motion.div>
          <motion.span
            className="absolute bottom-0 right-0 text-4xl"
            initial={{ opacity: 0, scale: 0 }}
            animate={{ opacity: 1, scale: 1 }}
            transition={{
              type: 'spring',
              stiffness: 125,
              delay: 0.1,
              duration: 0.7,
            }}
          >
            👋
          </motion.span>
        </div>
      </div>
      <motion.h1
        className="mb-10 mt-4 px-4 text-2xl font-medium !leading-[1.5] sm:text-4xl"
        initial={{ opacity: 0, y: 100 }}
        animate={{ opacity: 1, y: 0 }}
      >
        <span className="font-bold">
          Hello, {formatUsername(myInfo?.username)}!
        </span>
      </motion.h1>
    </>
  )
}
