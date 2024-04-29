import React from 'react'
import { FaStar, FaStarHalfStroke, FaRegStar  } from "react-icons/fa6"

export function StarRating({rating}: {rating: number}) {
    const stars = []
    for (let i = 0; i < 5; i++) {
        if (i <= rating) {
            stars.push(<FaStar key={i}/>)
        } else if (i - 0.5 === rating) {
            stars.push(<FaStarHalfStroke key={i}/>)
        } else {
            stars.push(<FaRegStar key={i}/>)
        }
    }
    return (
        <div className='flex ml-4 text-amber-300'>
            {stars}
        </div>
    )
  }
  