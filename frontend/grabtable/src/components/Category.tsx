'use client'
import Image from 'next/image'
import { Button } from './ui/button'
import Link from 'next/link'
import { BsArrowRight } from 'react-icons/bs'
import CategoryLink from './ui/CategoryLink'
import { motion } from 'framer-motion'

export default function Category() {
  return (
    <>
      <div className="flex flex-row space-x-4">
        <motion.div
          className="flex w-full items-center space-x-2"
          initial={{ opacity: 0, y: 100 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.125 }}
        >
          <CategoryLink categoryName="Western" />
          <CategoryLink categoryName="Japanese" />
          <CategoryLink categoryName="Chinese" />
          <CategoryLink categoryName="Korean" />
        </motion.div>
      </div>
    </>
  )
}
