var path = require("path");
module.exports = {
  entry: {
    app: ["./frontend/main.js"]
  },
  output: {
    path: path.resolve(__dirname, "build"), /* When running `webpack`, put bundle here */
    publicPath: "/build/", /* requests that go to this path... */
    filename: "bundle.js" /* ...and this filename will actually get the generated bundle, not a static file. */
  },
  devServer: {
    inline: true, /* auto reload */
    /*hot: true, /* hot module replacement */
    quiet: true, /* less webpack output */
    contentBase: "./static", /* Dev server will serve files from this dir */
    proxy: {
      '/api': {
        target: 'http://localhost:9292',
        secure: false
      }
    }
  }
};
