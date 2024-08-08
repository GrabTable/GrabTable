import { Review } from '@/lib/types/review'
import ReviewCard from './ReviewCard'
import { Table, TableBody } from './ui/table'

export default function ReviewList({ reviews }: { reviews: Review[] }) {
  return (
    <Table>
      <TableBody>
        {reviews.map((review) => (
          <ReviewCard key={review.id} review={review} />
        ))}
      </TableBody>
    </Table>
  )
}
