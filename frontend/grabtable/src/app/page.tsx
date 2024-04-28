import Category from "@/components/Category";
import { Input } from "@/components/ui/Input";
import Image from "next/image";

export default function Home() {
  return (
    <main className="flex min-h-screen flex-col items-center justify-between p-24">
      <Image src="/big-icon.svg" alt={"no image"}       
        width={500}
        height={500}
      ></Image>
      <Input />
      <Category />
    </main> 
  );
}
