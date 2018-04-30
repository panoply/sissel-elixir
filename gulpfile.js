const gulp = require('gulp');
const svgSprite = require('gulp-svg-sprite');

/**
 * SVG Icon Sprite
 * @return {[type]} [description]
 */
gulp.task('icons', function() {
  return gulp.src('./src/icons/*.svg')
    .pipe(svgSprite({
      mode: {
        symbol: { // symbol mode to build the SVG
          dest: 'dist', // destination foldeer
          sprite: 'icons.svg', //sprite name
          example: false // Build sample page
        }
      },
      svg: {
        xmlDeclaration: false, // strip out the XML attribute
        doctypeDeclaration: false // don't include the !DOCTYPE declaration
      }
    }))
    .pipe(gulp.dest('.'));
});
