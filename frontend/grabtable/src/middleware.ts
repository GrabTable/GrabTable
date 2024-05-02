import { NextRequest, NextResponse } from 'next/server'
import { getSession } from './lib/next-auth/session'
// import { updateSession } from './lib/next-auth/session'
export const config = {
  matcher: ['/reservation'],
}
export async function middleware(req: NextRequest) {
  const session = await getSession()
}
