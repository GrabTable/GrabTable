/** @type {import('next').NextConfig} */
const nextConfig = {
  env: {
    SESSION_SECRET: process.env.SESSION_SECRET,
  },
  images: {
    remotePatterns: [
      {
        protocol: 'https',
        hostname: 'search.pstatic.net',
        port: '',
        pathname: '/common/**',
      },
      {
        protocol: 'https',
        hostname: '*.kakaocdn.net',
        port: '',
        pathname: '/**',
      },
      {
        protocol: 'http',
        hostname: '*.kakaocdn.net',
        port: '',
        pathname: '/**',
      },
    ],
  },
}

export default nextConfig
