<template>
  <div id="app">
    <router-view/>
  </div>
</template>

<style lang="scss">
*,
*:before,
*:after {
  box-sizing: border-box;
  -webkit-tap-highlight-color: transparent;
}

html,
body,
div,
span,
h1,
h2,
h3,
h4,
h5,
h6,
p,
a,
img,
ul,
li,
article,
header,
menu,
section,
time,
video {
  margin: 0;
  padding: 0;
  border: 0;
  font-size: 100%;
  font-weight: normal;

  font: inherit;
  vertical-align: baseline;
}

/* HTML5 display-role reset for older browsers */
div,
article,
aside,
header,
section {
  display: block;
}

html,
body {
  width: 100%;
  padding: 0;
  margin: 0;
}

ul {
  list-style: none;
}

figure {
  margin-block-start: 0;
  margin-block-end: 0;
  margin-inline-start: 0;
  margin-inline-end: 0;
}

.hidden,
[hidden] {
  display: none !important;
}

a {
  text-decoration: none;
}

button {
  &:focus {
    outline: none;
  }
}

@-webkit-keyframes autofill {
  to {
    color: #666666;
    background: transparent;
  }
}

input:-webkit-autofill {
  -webkit-animation-name: autofill;
  -webkit-animation-fill-mode: both;
}

body {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  background: #EEEEEE;
  margin: 0;
  line-height: 1;
}
</style>
