// 'use client'
// import React, { useEffect, useState } from 'react';
// import { Button } from '@/components/ui/Button';

// export default function Page() {
//   const [session, setSession] = useState(null);

//   useEffect(() => {
//     const fetchData = async () => {
//       const sessionData = await fetchSessionData();
//       if (sessionData) {
//         setSession(JSON.parse(sessionData)); // 세션 데이터 파싱
//       }
//     };

//     fetchData();
//   }, []);

//   const handleLogin = () => {
//     window.location.href =
//       'https://kauth.kakao.com/oauth/authorize?client_id=bae0a9c1f20dfbc7d5f6776116a24ba4&redirect_uri=http://localhost:3000/api/login&response_type=code';
//   };
//   const logout = () => {
//     console.log("logout!")
//   }
//   return (
//     <div>
//       {session ? (
//         <div>
//           <p>Welcome, {session}!</p>
//           <Button onClick={() => logout()}>Logout</Button>
//         </div>
//       ) : (
//         <Button onClick={handleLogin}>Login</Button>
//       )}
//     </div>
//   );
// }

// async function fetchSessionData() {
//   console.log("fetchSession")
//   const response = await fetch('http://localhost:3000/api/auth');
//   if (response.ok) {
//     console.log("session")
//     return await response.text();
//   }
//   return null;
// }

// import { Button } from '@/components/ui/Button'
// import React from 'react'

// export default async function Page() {
//   // 버튼 클릭 시 호출될 함수
//   const session = await getSession();

//   const handleLogin = () => {
//     window.location.href =
//       'https://kauth.kakao.com/oauth/authorize?client_id=bae0a9c1f20dfbc7d5f6776116a24ba4&redirect_uri=http://localhost:3000/api/login&response_type=code'
//   }

//   return (
//     <div>
//       <Button onClick={handleLogin}>로그인</Button>
//     </div>
//   )
// }
// 'use client'
// // import { verifyAuth } from "@/lib/next-auth/session";
// import { redirect } from "next/navigation";
// async function checkUserStatus() {
//   try {
//     const response = await fetch('http://localhost:3000/api/verify');
//     if (!response.ok) {
//       throw new Error('Network response was not ok');
//     }

//     const data = await response.json();

//     if (data.status) {
//       console.log("User is verified");
//     } else {
//       console.log("User is not verified");
//     }
//   } catch (error) {
//     console.error("Error fetching user status:", error);
//   }
// }

// export default async function Page() {
//   checkUserStatus()

//   return (
//     <section>
//       <form
//         action={async (formData) => {
//           await fetch('http://localhost:3000/api/auth', { method: 'POST' })

//           redirect("https://kauth.kakao.com/oauth/authorize?client_id=bae0a9c1f20dfbc7d5f6776116a24ba4&redirect_uri=http://localhost:3000/api/login&response_type=code");

//         }}
//       >
//         <input type="email" placeholder="Email" />
//         <br />
//         <button type="submit">Login</button>
//       </form>
//       <form
//         // action={async () => {
//         //   // "use server";
//         //   // await logout();
//         //   // redirect("/");
//         // }}
//       >
//         <button type="submit">Logout</button>
//       </form>
//       {/* <pre>{JSON.stringify(session, null, 2)}</pre> */}
//     </section>
//   );
// }

import { redirect } from 'next/navigation'
import { getSession, login, logout } from '@/lib/next-auth/session'

export default async function Page() {
  const session = await getSession()
  return (
    <section>
      <form
        action={async (formData) => {
          'use server'
          redirect(
            `https://kauth.kakao.com/oauth/authorize?client_id=${process.env.KAKAO_CLIENT_ID}&redirect_uri=${process.env.KAKAO_REDIRECT_URI}`,
          )
        }}
      >
        <input type="email" placeholder="Email" />
        <br />
        <button type="submit">Login</button>
      </form>
      <form
        action={async () => {
          'use server'
          await logout()
          redirect('/')
        }}
      >
        <button type="submit">Logout</button>
      </form>
      <pre>{JSON.stringify(session, null, 2)}</pre>
    </section>
  )
}
