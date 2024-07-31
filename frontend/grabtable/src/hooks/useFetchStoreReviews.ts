'use client'

import { getStoreReviews } from '@/lib/api/getStoreReviews'
import { QueryFunctionContext, useInfiniteQuery } from 'react-query'

export const reviewKeys = {
  all: ['reviews'] as const,
  lists: () => [...reviewKeys.all, 'list'] as const,
  list: (filters: string) => [...reviewKeys.lists(), { filters }] as const,
  details: () => [...reviewKeys.all, 'detail'] as const,
  detail: (id: number) => [...reviewKeys.details(), id] as const,
}

export const useFetchStoreReviews = ({ storeId, size }: any) =>
  useInfiniteQuery(
    reviewKeys.lists(),
    ({ pageParam = 0 }: QueryFunctionContext) =>
      getStoreReviews(storeId, pageParam, size),
    {
      getNextPageParam: ({ isLastPage, pageNumber }: any) =>
        isLastPage ? undefined : pageNumber + 1,
    },
  )
