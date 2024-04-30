/** @type {import('next').NextConfig} */
const nextConfig = {
    env: {
    	SESSION_SECRET: process.env.SESSION_SECRET,
    }
}

export default nextConfig
