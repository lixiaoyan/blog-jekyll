#!/bin/bash

lessc --strict-math=on --autoprefix ./styles/app.less ./styles/app.css

cat << EOF | node

const fs = require("fs");

const content = fs.readFileSync("./friends.md").toString().split("\n");
const prefix = content.slice(0, 4);
const postfix = content.slice(-2);

const list = content.slice(4, -2).join("\n").split("\n\n").map(group => group.split("\n"));
list.sort((left, right) => {
  return left[0].localeCompare(right[0], "en", { sensitivity: "base" });
});

const result = [
  prefix.join("\n"),
  list.map(group => group.join("\n")).join("\n\n"),
  postfix.join("\n"),
].join("\n");
fs.writeFileSync("./friends.md", result);

EOF
