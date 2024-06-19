/**
 * The base URL for the API.
 * @constant
 */
export const BASE_API_URL = process.env.NEXT_PUBLIC_BASE_API_URL
  ? process.env.NEXT_PUBLIC_BASE_API_URL
  : 'http://localhost:8000'

export const BASE_URL = process.env.NEXT_PUBLIC_BASE_URL
  ? process.env.NEXT_PUBLIC_BASE_URL
  : 'http://localhost:3000'
