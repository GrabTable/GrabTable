'use client'

import { useSectionInView } from '@/lib/hooks'
import { motion } from 'framer-motion'
import SectionHeading from './section-heading'

export default function About() {
  const { ref } = useSectionInView('About', 0.5)

  return (
    <section id="about">
      <motion.section
        ref={ref}
        className="mb-28 max-w-[45rem] text-center leading-8 sm:mb-40 scroll-mt-28"
        initial={{ opacity: 0, y: 100 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ delay: 0.175 }}
      >
        <SectionHeading>About Grabtable</SectionHeading>
        <p className="mb-3">
          고민 중이신가요? 직장에서 메뉴 선택으로 고민하고 계시나요? 정산 문제로
          상사와 마찰을 겪고 계신가요? 높은 평점의 식당에서 실망스러운 경험을
          하셨나요? GrabTable은 이러한 문제를 해결해 드리는 단체 예약에 특화된
          애플리케이션입니다. 회사 점심 회의나 팀 빌딩 저녁 식사 등, 모든 단체
          식사 예약을 손쉽게 관리해드립니다. 맛집 정보와 리뷰 검증을 통해 신뢰할
          수 있는 식당 선택을 도와드리며, 예약부터 결제까지 한 번에 처리할 수
          있는 편리한 기능을 제공합니다. GrabTable과 함께라면 식사 계획이 한결
          간편해집니다.
        </p>

        <p>
          Are you wrestling with menu selections at work? Are you dealing with
          conflicts over payment issues with your boss? Have high-rated
          restaurants left you disappointed? Introducing GrabTable, the app
          designed to streamline your group dining experiences. Perfect for
          company lunch meetings or team-building dinners, GrabTable makes it
          easy to handle all your group reservations. With our curated selection
          of verified restaurant reviews, we guide you to trustworthy dining
          options. Our app simplifies your planning with features that manage
          everything from booking to payment in a single step. Simplify your
          dining plans with GrabTable, where good food meets convenience.
        </p>
      </motion.section>
    </section>
  )
}
