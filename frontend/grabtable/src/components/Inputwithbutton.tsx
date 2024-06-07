'use client'
import { Input } from '@/components/ui/Input'
import { Button } from '@/components/ui/button'
import { motion } from 'framer-motion'
import { useRouter } from 'next/navigation'
import React, { ChangeEvent, useState } from 'react'

type Props = {
  input: string
}

export function InputWithButton(props?: Props): JSX.Element {
  const [inputValue, setInputValue] = useState<string>(props?.input || '')
  const router = useRouter()

  const handleInputChange = (event: ChangeEvent<HTMLInputElement>): void => {
    setInputValue(event.target.value)
  }

  const handleEnter = (event: React.KeyboardEvent<HTMLInputElement>): void => {
    if (event.key === 'Enter') {
      router.push(`/restaurants?search=${encodeURIComponent(inputValue)}`)
    }
  }

  const handleClick = () => {
    router.push(`/restaurants?search=${encodeURIComponent(inputValue)}`)
  }

  return (
    <div
      className="flex w-full items-center space-x-2"
      style={{ maxWidth: '100rem' }}
    >
      <motion.div
        className="flex w-full items-center space-x-2"
        initial={{ opacity: 0, y: 100 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ delay: 0.125 }}
      >
        <Input
          placeholder="Search.."
          value={inputValue}
          onChange={handleInputChange}
          onKeyDown={handleEnter}
          className="group bg-white px-7 py-3 flex items-center gap-2 rounded-full outline-none focus:scale-100
        hover:scale-100 active:scale-110 transition cursor-pointer borderBlack dark:bg-white/10"
        />

        <Button
          asChild
          onClick={handleClick}
          className="group bg-violet-400 px-7 py-3 flex items-center gap-2 rounded-full outline-none focus:scale-105 hover:scale-105 active:scale-105 transition cursor-pointer borderBlack dark:bg-white/10"
        >
          search
        </Button>
      </motion.div>
    </div>
  )
}
