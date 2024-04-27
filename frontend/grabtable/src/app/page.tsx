import Category from "@/components/Category";
import { InputWithButton } from "@/components/Inputwithbutton";
import Image from "next/image";
import About from "./about";
import SectionDivider from "./section-divider";
import Contact from "./contact";

export default function Home() {
  return (
    <main className="flex min-h-screen flex-col items-center justify-between p-24">
        <Image src="/big-icon.svg" alt={"no image"}       
          width={500}
          height={500}
        ></Image>
      <section id="home" className="scroll-mt-[100rem] w-full" style={{maxWidth: '50rem'}}>
        <div className="pb-10"/>
        <InputWithButton />
        <div className="pb-16"/>
      </section>

      <Category />
      <div className="pb-48"/>
      <SectionDivider/>
      <section id="about" className="scroll-mt-28">
        <About/>
      </section>
      <section id="contact" className="scroll-mt-28">
        <Contact />
      </section>
    </main> 
  );
}
