'use client'

import ReviewList from '@/components/ReviewList'
import Spinner from '@/components/Spinner'
import { Input } from '@/components/ui/Input'
import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
import {
  Dialog,
  DialogContent,
  DialogDescription,
  DialogFooter,
  DialogHeader,
  DialogTitle,
  DialogTrigger,
} from '@/components/ui/dialog'
import { Toaster } from '@/components/ui/toaster'
import { useToast } from '@/components/ui/use-toast'
import { getStoreDetail } from '@/lib/api/getStoreDetail'
import { getStoreReviews } from '@/lib/api/getStoreReviews'
import { postCreateReservation } from '@/lib/api/postCreateReservation'
import getSessionFromClient from '@/lib/next-auth/getSessionFromClient'
import { Review } from '@/lib/types/review'
import { Store } from '@/lib/types/store'
import { motion } from 'framer-motion'
import Image from 'next/image'
import { useParams, useRouter } from 'next/navigation'
import { useEffect, useState } from 'react'
import { PiHandGrabbingDuotone } from 'react-icons/pi'
import { useInView } from 'react-intersection-observer'

export default function Restaurant() {
  // const scrollRef = useRef<HTMLDivElement>(null)
  // const { scrollYProgress } = useScroll({
  //   target: scrollRef,
  //   offset: ['0 1', '1.33 1'],
  // })
  // const scaleProgess = useTransform(scrollYProgress, [0.7, 1], [0.9, 1])
  // const opacityProgess = useTransform(scrollYProgress, [0.6, 1], [0.9, 1])
  const router = useRouter()
  const storeId = useParams<{ id: string }>()['id']
  const { toast } = useToast()
  const [loading, setLoading] = useState(false)
  const [restaurant, setRestaurant] = useState<Store>()
  const [reviews, setReviews] = useState<Review[]>([])
  const [cursor, setCursor] = useState(undefined)
  const [hasNext, setHasNext] = useState(true)
  const { ref, inView } = useInView()

  const fetchStore = async () => {
    const response = await getStoreDetail(storeId)
    const data: Store = await response.json()
    setRestaurant(data)
  }

  const fetchReview = async () => {
    const response = await getStoreReviews(storeId, cursor)
    const data = await response.json()
    console.log(data)
    setCursor(data.cursor)
    setHasNext(data.hasNext)
    setReviews([...reviews, ...data.values])
  }

  const loadMoreReviews = async () => {
    if (!hasNext) {
      return
    }
    await fetchReview()
  }

  useEffect(() => {
    if (inView) {
      loadMoreReviews()
    }
  }, [inView])

  useEffect(() => {
    fetchStore()
    fetchReview()
  }, [])

  const makeReservation = async () => {
    setLoading(true)
    const session = await getSessionFromClient()
    setTimeout(async () => {
      setLoading(false) // 스피너 종료

      if (!session) {
        // 스피너 종료 후 토스트 메시지 표시
        toast({
          title: 'Login first',
          description: 'You need to log in to continue.',
          duration: 1000, // 1초 동안 토스트 띄우기
        })

        // 토스트 메시지가 끝나고 0.3초 뒤에 페이지 리다이렉션
        setTimeout(() => {
          router.push('/mypage')
        }, 1300)
        return
      }

      const res = await postCreateReservation(parseInt(storeId))
      if (res.ok) {
        toast({
          title: 'You have successfully grab!',
          description: 'Invite your friends and order some food!',
          duration: 1000, // 1초 동안 토스트 띄우기
        })
        setTimeout(() => {
          router.push('/reservation')
        }, 1300)
        return
      } else {
        toast({
          title: 'There is an ongoing reservation',
          description: 'Please continue with your order!',
          duration: 1000, // 1초 동안 토스트 띄우기
        })

        // 토스트 메시지가 끝나고 0.3초 뒤에 페이지 리다이렉션
        setTimeout(() => {
          router.push('/reservation')
        }, 1300)
      }
    }, 500)
  }

  if (!restaurant) {
    return <Spinner />
  }

  return (
    <>
      {loading && <Spinner />}
      <motion.div
        // ref={scrollRef}
        // style={{
        //   scale: scaleProgess,
        //   opacity: opacityProgess,
        // }}
        className="group mb-3 sm:mb-8 last:mb-0 mx-4"
      >
        <section className="bg-gray-100 border border-black/5 rounded-lg overflow-hidden sm:pr-8 relative sm:h-[20rem] hover:bg-gray-200 transition sm:group-even:pl-8 dark:text-white dark:bg-white/10 dark:hover:bg-white/20">
          <div className="pt-4 pb-7 px-5 sm:pl-10 sm:pr-2 sm:pt-10 sm:max-w-[50%] flex flex-col h-full">
            <Badge className="w-fit mb-2">{restaurant.category}</Badge>
            <h3 className="text-2xl font-semibold">{restaurant.storeName}</h3>
            <p>{restaurant.address}</p>
            <p className="mt-2 leading-relaxed text-gray-700 dark:text-white/70">
              {restaurant.description}
            </p>
            <p>{restaurant.phone}</p>
          </div>

          <Image
            src={restaurant.storePictureUrl || '/restaurant.png'}
            alt="No Restaurant Image"
            width={500}
            height={500}
            quality={95}
            className="absolute hidden sm:block top-6 -right-10 w-[20rem] rounded-t-lg shadow-2xl
        transition 
        group-hover:scale-[1.04]
        group-hover:-translate-x-3
        group-hover:translate-y-3
        group-hover:-rotate-2"
          />
        </section>

        <div className="flex justify-end">
          <Dialog>
            <DialogTrigger asChild>
              <Button className="bg-violet-500 dark:text-white flex items-end rounded-full">
                GRAB <PiHandGrabbingDuotone size={25} />
              </Button>
            </DialogTrigger>
            <DialogContent>
              <DialogHeader>
                <DialogTitle>Grab Table</DialogTitle>
                <DialogDescription>
                  How many people are in your party?
                </DialogDescription>
              </DialogHeader>
              <div className="flex items-center justify-center space-x-2">
                <Input
                  type="number"
                  min={0}
                  defaultValue={1}
                  className="w-[10rem]"
                />
              </div>
              <DialogFooter>
                <Button
                  className="bg-violet-400"
                  type="submit"
                  onClick={makeReservation}
                >
                  Confirm
                </Button>
              </DialogFooter>
            </DialogContent>
          </Dialog>
        </div>
        <ReviewList reviews={reviews} />
        <div ref={ref}></div>
      </motion.div>
      <Toaster />
    </>
  )
}
