'use client'
import Image from 'next/image'
import { Input } from "@/components/ui/Input";
import { InputWithButton } from "@/components/Inputwithbutton";
import { useSearchParams } from 'next/navigation';
export default function Home() {
  const params = useSearchParams();
  console.log(params)
  return (
    <main className="flex min-h-screen flex-col items-center justify-between p-24">
      {/* <InputWithButton/> */}
    </main>
  )
}