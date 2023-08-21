// @ts-check

/** @type {import('next').NextConfig} */
const nextConfig = {
  reactStrictMode: true,
  typescript: {
    ignoreBuildErrors: process.env.NEXT_PUBLIC_IGNORE_BUILD_ERROR === "true",
  },
  eslint: {
    ignoreDuringBuilds: process.env.NEXT_PUBLIC_IGNORE_BUILD_ERROR === "true",
  },
  images: {
    domains: ["bafybeicpfmbdpxum7itdparhqilo2rtiihe7zk4axigqgtmeerdj5kyara.ipfs.w3s.link"],
  },
};

module.exports = nextConfig;
