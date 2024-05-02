'use client'

import { useSectionInView } from '@/lib/hooks'
import { motion } from 'framer-motion'
import SectionHeading from './section-heading'

export default function Contact() {
  const { ref } = useSectionInView('About', 0.5)

  return (
    <section id="contact">
      <motion.section
        ref={ref}
        className="mb-28 max-w-[45rem] text-center leading-8 sm:mb-40 scroll-mt-28"
        initial={{ opacity: 0, y: 100 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ delay: 0.175 }}
      >
        <SectionHeading>Contact</SectionHeading>
        <p className="mb-3">
          GrabTable에서는 새로운 식당과 카페의 정보 등록을 적극 환영합니다!
          여러분의 매장을 GrabTable 애플리케이션에 등록함으로써 더 많은 고객과의
          만남을 가질 수 있습니다. 저희 플랫폼을 통해 매장을 홍보하고, 새로운
          고객층을 끌어들이세요. 등록 절차는 간단하며, 매장 정보, 메뉴, 위치,
          사진 등을 포함하여 상세히 소개할 수 있습니다. GrabTable은 매장의
          가시성을 높이고, 고객들에게 새로운 식사 경험을 제공할 수 있는 기회를
          제공합니다. 지금 바로 <b>grabtable@gmail.com</b>으로 연락하여 매장을
          등록하세요. 여러분의 매장이 GrabTable 커뮤니티의 일원이 되길
          기대합니다!
        </p>

        <p>
          GrabTable warmly welcomes the registration of new restaurants and
          cafes! By listing your establishment on the GrabTable app, you can
          connect with more customers. Promote your business through our
          platform and attract a new clientele. The registration process is
          simple, allowing you to comprehensively showcase your establishment
          with details such as menu, location, photos, and more. GrabTable
          enhances the visibility of your restaurant and offers an opportunity
          to provide new dining experiences to customers. Contact us now at
          <b> grabtable@gmail.com</b> to register your establishment. We look
          forward to seeing your restaurant become a part of the GrabTable
          community!
        </p>
      </motion.section>
    </section>
  )
}
