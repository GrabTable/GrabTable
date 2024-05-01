import { redirect } from 'next/navigation'
import { getSession, logout } from '@/lib/next-auth/session'
import Image from 'next/image'
import SectionDivider from '../section-divider'
import { Button } from '@/components/ui/button'

export default async function Page() {
  const session = await getSession()

  return (
    <main className="flex min-h-screen flex-col items-center justify-between p-24">
      <Image
        src="/big-icon.svg"
        alt={'no image'}
        width={500}
        height={500}
      />
      {session ? (
        <form
          action={async () => {
            'use server'
            await logout()
            redirect('/')
          }}
        >
          <Button type="submit" variant="default" className='bg-purple-300 hover:bg-purple-500 text-primary'>
            <Image src="/logout.png" alt="Logout" width={20} height={20} />Logout
          </Button>
        </form>
      ) : (
        <form
          action={async (formData) => {
            'use server'
            redirect(
              `https://kauth.kakao.com/oauth/authorize?client_id=${process.env.KAKAO_CLIENT_ID}&redirect_uri=${process.env.KAKAO_REDIRECT_URI}`,
            )
          }}
        >
          <br />
          <button type="submit" style={{ border: 'none', background: 'none' }}>
            <Image src="/kakao_login_logo.png" alt="Login" width={200} height={200} />
          </button>
        </form>
      )}
      {/* <pre>{JSON.stringify(session, null, 2)}</pre> */}
      <SectionDivider/>
    </main>
  )
}
