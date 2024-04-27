// pages/api/auth/[...nextauth].js
import NextAuth from "next-auth"
import CredentialsProvider from "next-auth/providers/credentials"

export default NextAuth({
  providers: [
    CredentialsProvider({
      name: "Credentials",
      credentials: {
        token: { label: "Token", type: "text" }
      },
      authorize: async (credentials) => {
        
        return { id: 1, name: "User", email: "user@example.com", token: credentials.token }
      }
    }),
  ],
  session: {
    strategy: "jwt"
  },
  callbacks: {
    jwt: async ({ token, user }) => {
      // 로그인 시 user가 설정되며, 이를 token에 반영
      if (user) {
        token.accessToken = user.token;
      }
      return token;
    },
    session: async ({ session, token }) => {
      // JWT 토큰 정보를 세션에 반영
      session.accessToken = token.accessToken;
      return session;
    }
  }
});
