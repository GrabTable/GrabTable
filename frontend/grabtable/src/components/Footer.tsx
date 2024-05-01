import { FaGithub } from 'react-icons/fa6'
import { FaRegCopyright } from 'react-icons/fa6'

export default function Footer() {
  return (
    <footer className="w-full h-24 bg-gray-light dark:bg-black/30 p-4 flex items-center">
      <div className="w-full flex justify-end items-center gap-2 text-gray-500">
        <FaRegCopyright />
        <p className="text-center text-medium font-bold">Grab Table</p>
        <a
          rel="noreferrer noopener"
          target="_blank"
          href="https://github.com/GrabTable/GrabTable"
        >
          <FaGithub className="cursor-pointer hover:opacity-70" size={32} />
        </a>
      </div>
    </footer>
  )
}
