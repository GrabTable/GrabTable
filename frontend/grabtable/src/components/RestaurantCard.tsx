'use client'

import { useRef } from 'react'
// import { projectsData } from '@/lib/data'
import { Badge } from '@/components/ui/badge'
import { Restaurant } from '@/lib/types/restaurant'
import { motion, useScroll, useTransform } from 'framer-motion'
import Image from 'next/image'

export default function Project({
  id,
  address,
  averageRating,
  category,
  storeName,
  storePictureUrl,
}: Restaurant) {
  const ref = useRef<HTMLDivElement>(null)
  const { scrollYProgress } = useScroll({
    target: ref,
    offset: ['0 1', '1.33 1'],
  })
  const scaleProgess = useTransform(scrollYProgress, [0, 1], [0.9, 1])
  const opacityProgess = useTransform(scrollYProgress, [0, 1], [0.6, 1])

  return (
    <motion.div
      ref={ref}
      style={{
        scale: scaleProgess,
        opacity: opacityProgess,
      }}
      className="group my-4 sm:mb-8 last:mb-0"
    >
      <section className="bg-gray-100 border border-black/5 rounded-lg overflow-hidden sm:pr-8 relative h-40 hover:bg-gray-200 transition sm:group-even:pl-8 dark:text-white dark:bg-white/10 dark:hover:bg-white/20">
        <div className="pt-4 pb-7 px-5 sm:pl-10 sm:pr-2 sm:pt-10 sm:max-w-[50%] flex flex-col h-full sm:group-even:ml-[18rem]">
          <h3 className="text-2xl font-semibold">{storeName}</h3>
          <p className="mt-2 leading-relaxed text-gray-700 dark:text-white/70">
            {address}
          </p>
          <div className="mt-4">
            <Badge>{category}</Badge>
          </div>
        </div>

        <Image
          src={storePictureUrl || '/Korean.jpeg'}
          alt=""
          width={100}
          height={100}
          quality={95}
          className="absolute hidden sm:block top-8 -right-40 w-[28.25rem] rounded-t-lg shadow-2xl
        transition "
        />
      </section>
    </motion.div>
  )
}
