'use client'
import React, { useState, ChangeEvent } from 'react'
import { Button, buttonVariants } from '@/components/ui/Button'
import { Input } from '@/components/ui/Input'
import Link from 'next/link'
import { motion } from 'framer-motion'

export function InputWithButton(): JSX.Element {
  const [inputValue, setInputValue] = useState<string>('')

  const handleInputChange = (event: ChangeEvent<HTMLInputElement>): void => {
    setInputValue(event.target.value)
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
          className="group bg-white px-7 py-3 flex items-center gap-2 rounded-full outline-none focus:scale-100
        hover:scale-100 active:scale-110 transition cursor-pointer borderBlack dark:bg-white/10"
        />

        <Button
          asChild
          className="group bg-white px-7 py-3 flex items-center gap-2 rounded-full outline-none focus:scale-105 hover:scale-105 active:scale-105 transition cursor-pointer borderBlack dark:bg-white/10"
        >
          <Link href={`/restaurants?search=${encodeURIComponent(inputValue)}`}>
            search
          </Link>
        </Button>
      </motion.div>
    </div>
  )
}
