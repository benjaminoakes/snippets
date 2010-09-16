#!/usr/bin/env node

var text = 'This is my number: 123-456-7890.';
var pattern = /\d\d\d-\d\d\d-\d\d\d\d/;

console.log('Hello');
console.log(pattern.test(text));
console.log(pattern.exec(text));
console.log('Goodbye');

