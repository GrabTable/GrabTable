import Image from 'next/image'

export default function Avatar() {
    return <>
        <Image
            src="/small-logo.png"
            width={100}
            height={100}
            alt="Picture of the author"
            />      
    </>
}