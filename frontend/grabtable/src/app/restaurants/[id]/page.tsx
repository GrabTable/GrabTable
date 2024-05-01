'use client'

import { useEffect, useRef, useState } from 'react'
import Image from 'next/image'
import { motion, useScroll, useTransform } from 'framer-motion'
import { Button } from '@/components/ui/button'
import {
  Dialog,
  DialogContent,
  DialogDescription,
  DialogHeader,
  DialogFooter,
  DialogTitle,
  DialogTrigger,
} from '@/components/ui/dialog'
import {
  Table,
  TableBody,
  TableCaption,
  TableCell,
  TableRow,
} from '@/components/ui/table'
import { StarRating } from '@/components/StarRating'
import { Input } from '@/components/ui/Input'
import * as React from 'react'
import {
  redirect,
  useParams,
  useRouter,
} from 'next/navigation'
import { Badge } from '@/components/ui/badge'
import { PiHandGrabbingDuotone } from "react-icons/pi";
import { getSession } from '@/lib/next-auth/session'
import getSessionFromClient from '@/lib/next-auth/getSessionFromClient'
import { Toaster } from '@/components/ui/toaster'
import { useToast } from '@/components/ui/use-toast'
import Spinner from '@/components/spinner'

const restaurant_mock = {
  id: 1,
  name: '봉수육',
  address: '수원시 장안구 서부로 2066',
  picture_url: '/restaurant.png',
  phone: '0311231234',
  description: '율전동 맛집',
  status: 1,
  category: '한식',
}

const reviews_mock = [
  {
    id: 1,
    profile_image: '/favicon.ico',
    username: '율전이1',
    review_platform: 'naver',
    rating: 1,
    message: '맛있어요 따봉',
  },
  {
    id: 2,
    profile_image: '/favicon.ico',
    username: '율전이2',
    review_platform: 'naver',
    rating: 2,
    message: '맛있어요 따봉',
  },
  {
    id: 3,
    profile_image: '/favicon.ico',
    username: '율전이3',
    review_platform: 'naver',
    rating: 3,
    message: '맛있어요 따봉',
  },
  {
    id: 4,
    profile_image: '/favicon.ico',
    username: '율전이4',
    review_platform: 'naver',
    rating: 4,
    message: '맛있어요 따봉',
  },
  {
    id: 5,
    profile_image: '/favicon.ico',
    username: '율전이5',
    review_platform: 'naver',
    rating: 5,
    message: '맛있어요 따봉',
  },
]

type Category = 'KOREAN' | 'ASIAN' | 'WESTERN' | 'CHINESE' | 'JAPANESE'

type Restaurant = {
  id: number
  storeName: string
  address: string
  storePictureUrl: string
  phone: string
  description: string
  category: Category
}

type Review = {
  id: string
  username: string
  storeName: string
  reviewPlatform: string
  message: string
  rating: number
}

type Reviews = Review[]

export default function Restaurant() {
  const ref = useRef<HTMLDivElement>(null)
  const { scrollYProgress } = useScroll({
    target: ref,
    offset: ['0 1', '1.33 1'],
  })
  const scaleProgess = useTransform(scrollYProgress, [0, 1], [0.8, 1])
  const opacityProgess = useTransform(scrollYProgress, [0, 1], [0.6, 1])
  const [date, setDate] = React.useState<Date>()
  const router = useRouter()
  const store_id = useParams<{ id: string }>()['id']
  const { toast } = useToast() 
  const [ loading, setLoading] = useState(false)
  const [restaurant, setRestaurant] = useState<Restaurant>()
  const fetchStore = async () => {
    try {
      const response = await fetch(
        `http://localhost:8000/v1/stores/${store_id}`,
      )
      if (!response.ok) {
        throw new Error('error')
      }
      const data: Restaurant = await response.json()
      setRestaurant(data)
    } catch (error) {
      console.error('error', error)
    }
  }

  const [reviews, setReviews] = useState<Reviews>([])
  const fetchReview = async () => {
    try {
      const response = await fetch(
        `http://localhost:8000/v1/reviews/stores/${store_id}`,
      )
      if (!response.ok) {
        throw new Error('error')
      }
      const data = await response.json()
      setReviews(data.slice(0, 10))
    } catch (error) {
      console.error('error', error)
    }
  }

  useEffect(() => {
    fetchStore()
    fetchReview()
  }, [])

  const makeReservation = async () => {
    setLoading(true)
    const session = await getSessionFromClient()
    console.log("session:", session)
    setTimeout(async () => {
      setLoading(false); // 스피너 종료
  
      if (!session) {
        // 스피너 종료 후 토스트 메시지 표시
        toast({
          title: "Login first",
          description: "You need to log in to continue.",
          duration: 1000, // 1초 동안 토스트 띄우기
        });
  
        // 토스트 메시지가 끝나고 0.3초 뒤에 페이지 리다이렉션
        setTimeout(() => {
          router.push('/mypage');
          return
        }, 1300);
      }
      const body = JSON.stringify({
        storeId: store_id,
      })
      console.log("session access token:",session.formData['access_token'])
      try { 
        const response = await fetch(`http://localhost:8000/v1/reservations`, {
          method: "POST",
          body: body,
          mode: "cors",
          headers: {
            "Access-Control-Allow-Origin": 'http://localhost:3000',
            "Access-Control-Allow-Methods": "POST",
            "Access-Control-Allow-Headers": "Content-Type, Authorization",
            "Access-Control-Allow-Credentials": "true",
            "Access-Control-Expose-Headers":
              "date, etag, access-control-allow-origin, access-control-allow-credentials, access-control-allow-headers",
            'Content-Type': 'application/json',
            Cookie: session.formData['cookie'],
            
            Authorization: "Bearer " + session.formData['access_token'],
          },
          credentials: 'include',
        })
        console.log()
        if (!response.ok) {
          throw new Error('error')
        }
        toast({
          title: "Reservation",
          description: "You need to log in to continue.",
          duration: 1000
        });setTimeout(() => {
          router.push('/reservation');
        }, 1300); 
      } catch (error) {
        console.error('error', error)
      }
    }, 500);

    
  }

  if (!restaurant) {
    return <></>
  }
  return (
    <>
    {loading && <Spinner/>}
    <motion.div
      ref={ref}
      style={{
        scale: scaleProgess,
        opacity: opacityProgess,
      }}
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

      {/* <Popover>
      <PopoverTrigger asChild>
        <Button
          variant={"outline"}
          className={cn(
            "w-[280px] justify-start text-left font-normal",
            !date && "text-muted-foreground"
          )}
        >
          <FaHand className="mr-2 h-4 w-4" />
          {date ? format(date, "PPP") : <span>Pick a date</span>}
        </Button>
      </PopoverTrigger>
      <PopoverContent className="w-auto p-0">
        <Calendar
          mode="single"
          selected={date}
          onSelect={setDate}
          initialFocus
        />
      </PopoverContent>
    </Popover> */}

      <Table>
        <TableBody>
          {reviews.map((review: Review) => (
            <TableRow key={review.id}>
              {/* <TableCell className='w-[10rem]'>
                <Image src={review.profile_image ? review.profile_image : ''} width={100} height={100} alt={''} className='rounded-full' />
              </TableCell> */}
              <TableCell className="flex items-start flex-col">
                <div className="flex items-center mt-4">
                  <div>{review.username || 'anonymous user'}</div>
                  <div>
                    <StarRating rating={review.rating} />
                  </div>
                </div>
                <p className="mt-2">{review.message}</p>
                <p className="mt-4 text-xs">
                  This review was written on {review.reviewPlatform}.
                </p>
              </TableCell>
            </TableRow>
          ))}
        </TableBody>
      </Table>
    </motion.div>
    <Toaster/>
    </>
  )
}
