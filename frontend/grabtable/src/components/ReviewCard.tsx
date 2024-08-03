import { Review } from '@/lib/types/review'
import { StarRating } from './StarRating'
import { TableCell, TableRow } from './ui/table'

interface ReviewCardProps {
  review: Review
}

export default function ReviewCard({ review }: ReviewCardProps) {
  return (
    <TableRow key={review.id}>
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
  )
}
