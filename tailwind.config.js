module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],
  theme: {
    colors: {
      'line': '#06C575',
      'twitter': '#1DA1F2',
    },
  },
  plugins: [require("@tailwindcss/typography"), require("daisyui")],
}
