import MenuTable from './_components/MenuTable'
import OrderCard from './_components/OrderCard'

export default async function Page() {
  return (
    <div className="container mx-auto py-10">
      <div className="flex flex-col md:flex-row gap-4">
        <div className="md:w-2/3">
          <MenuTable />
        </div>
        <div className="md:w-1/3">
          <OrderCard />
        </div>
      </div>
    </div>
  )
}
