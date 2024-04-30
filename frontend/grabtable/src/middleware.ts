import { NextRequest, NextResponse } from 'next/server'
import { getSession } from './lib/next-auth/session'
// import { updateSession } from './lib/next-auth/session'
export const config = {
  matcher: ['/reservation'],
}
export async function middleware(req: NextRequest) {
  const session = await getSession()

  // // validate the user is authenticated
  // const verifiedToken = await verifyAuth(req).catch((err) => {
  //   console.error(err.message)
  // })

  // if (!verifiedToken) {
  //   // if this an API request, respond with JSON
  //   if (req.nextUrl.pathname.startsWith('/api/')) {
  //     return new NextResponse(
  //       JSON.stringify({ 'error': { message: 'authentication required' } }),
  //       { status: 401 });
  //   }
  //   // otherwise, redirect to the set token page
  //   else {
  //     return NextResponse.redirect(new URL('/', req.url))
  //   }
  // }
}
