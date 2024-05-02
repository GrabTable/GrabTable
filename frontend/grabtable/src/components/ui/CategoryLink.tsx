'use client'
import React from 'react'
import Link from 'next/link'
import { BsArrowRight } from 'react-icons/bs'

interface CategoryLinkProps {
  categoryName: string
}

const CategoryLink: React.FC<CategoryLinkProps> = ({ categoryName }) => {
  return (
    <Link
      href={`/restaurants?category=${categoryName}`}
      className="group bg-gray-900 text-white px-7 py-3 flex items-center justify-center gap-2 rounded-full outline-none transition transform hover:scale-110 active:scale-105"
      style={{
        width: '5cm',
        height: '5cm',
        backgroundImage: `url(/${categoryName}.jpeg)`,
        backgroundSize: 'cover',
        backgroundPosition: 'center',
        backgroundRepeat: 'no-repeat',
        backgroundColor: 'rgba(0, 0, 0, 0.5)',
        backgroundBlendMode: 'darken',
      }}
      onMouseEnter={(e) => {
        e.currentTarget.style.backgroundColor = 'rgba(0, 0, 0, 0)'
        e.currentTarget.style.color = 'black'
      }}
      onMouseLeave={(e) => {
        e.currentTarget.style.backgroundColor = 'rgba(0, 0, 0, 0.5)'
        e.currentTarget.style.color = 'white'
      }}
      onClick={() => {}}
    >
      {categoryName}{' '}
      <BsArrowRight className="opacity-70 group-hover:translate-x-1 transition" />
    </Link>
  )
}

export default CategoryLink
