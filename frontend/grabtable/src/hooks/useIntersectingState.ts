import type { RefObject } from 'react'
import { useEffect, useRef, useState } from 'react'

function useIntersectingState<TElement extends Element>(): [
  boolean,
  RefObject<TElement>,
]

function useIntersectingState<TElement extends Element>(
  initialState: null,
): [boolean | null, RefObject<TElement>]

function useIntersectingState<TElement extends Element>(
  initialState?: null,
): [boolean | (boolean | null), RefObject<TElement>] {
  const [isIntersecting, setIsIntersecting] = useState(
    initialState === null ? null : false,
  )
  const ref = useRef<TElement>(null)

  useEffect(() => {
    const observer = new IntersectionObserver(([entry]) => {
      setIsIntersecting(entry.isIntersecting)
    })

    if (ref.current) {
      observer.observe(ref.current)
    }

    return () => {
      if (ref.current) {
        observer.unobserve(ref.current)
      }
    }
  }, [])

  return [isIntersecting, ref]
}

export default useIntersectingState
