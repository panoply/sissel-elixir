import resolve from 'rollup-plugin-node-resolve';
import serve from 'rollup-plugin-serve';
import livereload from 'rollup-plugin-livereload';
import commonjs from 'rollup-plugin-commonjs';
import uglify from 'rollup-plugin-uglify';
import buble from 'rollup-plugin-buble';
import postcss from 'rollup-plugin-postcss';
import fileSize from 'rollup-plugin-filesize';
import progress from 'rollup-plugin-progress';
import includePaths from 'rollup-plugin-includepaths';
import autoprefixer from 'autoprefixer';

const production = !process.env.ROLLUP_WATCH;

export default {
  input: 'src/bundle.js',
  output: {
    file: 'dist/bundle.js',
    format: 'iife',
    sourcemap: true
  },
  plugins: [
    progress({
      clearLine: true // default: true
    }),
    postcss({
      extract: true,
      minimize: production && true,
      use: ['sass'],
      plugins: [
        autoprefixer({
          browsers: [
            'Android >= 4.4',
            'BlackBerry >= 11',
            'Chrome >= 4',
            'Firefox >= 4',
            'Explorer >= 10',
            'iOS >= 4.1',
            'Opera >= 15',
            'Safari >= 4',
            'OperaMini >= 6',
            'ChromeAndroid >= 10',
            'FirefoxAndroid >= 4',
            'ExplorerMobile >= 10'
          ]
        })
      ]
    }),
    resolve(), // tells Rollup how to find date-fns in node_modules
    commonjs(), // converts date-fns to ES modules
    includePaths({
      paths: ['./src/site'],
      extensions: ['.js']
    }),
    buble(),
    fileSize(),
    production && uglify(), // minify, but only in production
    !production && serve('dist'),      // index.html should be in root of project
    !production && livereload()
  ]
};
