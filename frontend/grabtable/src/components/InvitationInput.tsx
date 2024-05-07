'use client'
import { Button } from '@/components/ui/button'
import { Input } from '@/components/ui/Input'
import { motion } from 'framer-motion'

interface InputWithButtonProps {
  inputValue: string
  onInputChange: (event: React.ChangeEvent<HTMLInputElement>) => void
  onClick: () => void
}

export function InvitationInput({
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
          placeholder="Enter the invitation code"
          value={inputValue}
          onChange={onInputChange}
          className="group bg-white px-7 py-3 flex items-center gap-2 rounded-full outline-none focus:scale-100
        hover:scale-100 active:scale-110 transition cursor-pointer borderBlack dark:bg-white/10"
        />

        <Button
          className="group bg-violet-400 px-7 py-3 flex items-center gap-2 rounded-full outline-none focus:scale-105 hover:scale-105 active:scale-105 transition cursor-pointer borderBlack"
          onClick={onClick}
        >
          Join
        </Button>
      </motion.div>
    </div>
  )
}
