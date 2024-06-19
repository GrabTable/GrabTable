import { Button } from '@/components/ui/button'
import { getSession, logout } from '@/lib/next-auth/session'
import Image from 'next/image'
import { redirect } from 'next/navigation'
import SectionDivider from '../section-divider'
import CustomAvatar from '@/components/CustomAvator'

export default async function KakaoPayment() {
  const session = await getSession()

  return (
    <main className="flex min-h-screen flex-col items-center justify-between p-24">
      <Image src="/big-icon.svg" alt={'no image'} width={500} height={500} />
      {session ? (
        <>
          <div>{session && <CustomAvatar />}</div>
          <form
            action={async () => {
              'use server'
              await logout()
              redirect('/')
            }}
          >
            <Button
              type="submit"
              variant="default"
              className="bg-purple-300 hover:bg-purple-500 text-primary"
            >
              <Image src="/logout.png" alt="Logout" width={20} height={20} />
              Logout
            </Button>
          </form>
        </>
      ) : (
        <form
          action={async (formData) => {
            'use server'
            redirect(
              `https://kauth.kakao.com/oauth/authorize?client_id=${process.env.NEXT_PUBLIC_KAKAO_CLIENT_ID}&redirect_uri=${process.env.NEXT_PUBLIC_KAKAO_REDIRECT_URI}`,
            )
          }}
        >
          <br />
          <button type="submit" style={{ border: 'none', background: 'none' }}>
            <Image
              src="/kakao_login_logo.png"
              alt="Login"
              width={200}
              height={200}
            />
          </button>
        </form>
      )}
      {/* <pre>{JSON.stringify(session, null, 2)}</pre> */}
      <SectionDivider />
    </main>
  )
}
