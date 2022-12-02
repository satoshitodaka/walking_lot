module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],
  plugins: [require("@tailwindcss/typography"), require("daisyui")],
  theme: {
    extend: {
      colors: {
        'twitter': "rgb(29,161,242)",
        'twitter-hover': "rgb(26,140,216)",
        'line': "rgb(6, 197, 117)",
        'line-hover': "rgb(5, 153, 91)"
      },
    },
  },
}
