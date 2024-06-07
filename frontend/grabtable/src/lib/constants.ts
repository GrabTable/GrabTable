/**
 * The base URL for the API.
 * @constant
 */
export const baseUrl = process.env.NEXT_PUBLIC_API_URL
  ? process.env.NEXT_PUBLIC_API_URL
  : 'http://localhost:8000'
