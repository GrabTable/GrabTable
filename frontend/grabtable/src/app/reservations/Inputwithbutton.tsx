'use client'
import { Button } from '@/components/ui/Button'
import { Input } from '@/components/ui/Input'
import { motion } from 'framer-motion'
import Link from 'next/link'

interface InputWithButtonProps {
  inputValue: string
  onInputChange: (event: React.ChangeEvent<HTMLInputElement>) => void
  onClick: () => void
}

export function InputWithButton({
  inputValue,
  onInputChange,
  onClick,
}: InputWithButtonProps): JSX.Element {
  return (
    <div
      className="flex w-full items-center space-x-2 mb-4"
      style={{ maxWidth: '100rem' }}
    >
      <motion.div
        className="flex w-full items-center space-x-2"
        initial={{ opacity: 0, y: 100 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ delay: 0.125 }}
      >
        <Input
          placeholder="초대 코드를 입력하세요."
          value={inputValue}
          onChange={onInputChange}
          className="group bg-white px-7 py-3 flex items-center gap-2 rounded-full outline-none focus:scale-100
        hover:scale-100 active:scale-110 transition cursor-pointer borderBlack dark:bg-white/10"
        />

        <Button
          asChild
          className="group bg-white px-7 py-3 flex items-center gap-2 rounded-full outline-none focus:scale-105 hover:scale-105 active:scale-105 transition cursor-pointer borderBlack dark:bg-white/10"
          onClick={onClick}
        >
          <Link
            href={`/reservations?inviteCode=${encodeURIComponent(inputValue)}`}
          >
            Join
          </Link>
        </Button>
      </motion.div>
    </div>
  )
}
