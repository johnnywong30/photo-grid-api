export default () => ({
  port: parseInt(process.env.PORT || "3000", 10),
  cloudflareConfig: {
    apiToken: process.env.CLOUDFLARE_API_TOKEN,
  },
});
