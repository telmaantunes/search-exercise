/* eslint-disable */
const path = require('path');

function resolveSrc(_path) {
  return path.join(__dirname, _path);
}

const aliases = {
  '@src': 'src',
  '@router': 'src/router',
  '@views': 'src/router/views',
  '@components': 'src/components',
  '@assets': 'src/assets',
};

module.exports = {
  webpack: {},
  jest: {},
};

for (const alias in aliases) {
  module.exports.webpack[alias] = resolveSrc(aliases[alias]);
  module.exports.jest[`^${alias}/(.*)$`] = `<rootDir>/${aliases[alias]}/$1`;
}
