// ==UserScript==
// @name          Solarized Everything: Wikipedia
// @namespace     http://userstyles.org
// @description	  The Solarized theme for Wikipedia, in dark and light variants.  From the solarized-everything-css project.
// @author        alphapapa
// @homepage      https://userstyles.org/styles/140962
// @include       http://wikipedia.org/*
// @include       https://wikipedia.org/*
// @include       http://*.wikipedia.org/*
// @include       https://*.wikipedia.org/*
// @run-at        document-start
// @version       0.20170405130144
// ==/UserScript==
(function() {var css = [
	"* {",
	"  border-color: #657b83 !important;",
	"}",
	"a {",
	"  color: #268bd2 !important;",
	"}",
	"a:visited {",
	"  color: #6c71c4 !important;",
	"}",
	"body {",
	"  background-color: #002b36 !important;",
	"  color: #839496 !important;",
	"}",
	"html {",
	"  background-color: #002b36 !important;",
	"}",
	"input,",
	"textarea {",
	"  background-color: #073642 !important;",
	"  color: #839496 !important;",
	"}",
	"blockquote,",
	"pre {",
	"  background-color: #073642 !important;",
	"  color: #839496 !important;",
	"}",
	"body * {",
	"  border-color: #094352 !important;",
	"}",
	"#content {",
	"  background-color: #002b36 !important;",
	"  color: #839496 !important;",
	"}",
	"#mw-head,",
	"#mw-panel {",
	"  background-color: #073642 !important;",
	"  color: #93a1a1 !important;",
	"}",
	"#mw-head div.portal,",
	"#mw-panel div.portal {",
	"  background-image: none !important;",
	"}",
	"#mw-head {",
	"  background-color: #073642 !important;",
	"  background-image: linear-gradient(to bottom, #002b36, #073642) !important;",
	"}",
	"#mw-panel,",
	"#p-logo {",
	"  background-image: linear-gradient(to right, #002b36, #073642) !important;",
	"}",
	"div.vectorTabs {",
	"  background-image: linear-gradient(to bottom, #002b36, #073642) !important;",
	"}",
	"div.vectorTabs ul {",
	"  background-image: linear-gradient(to bottom, #002b36, #073642) !important;",
	"}",
	"div.vectorTabs ul li {",
	"  background-color: #073642 !important;",
	"  background-image: none !important;",
	"  padding: 0px 1px 0px 1px !important;",
	"}",
	"div.vectorTabs span {",
	"  background-color: #073642 !important;",
	"  background-image: linear-gradient(to bottom, #002b36, #073642) !important;",
	"}",
	"div.vectorTabs li.selected,",
	"div.vectorTabs li.selected span {",
	"  background-color: transparent !important;",
	"  background-image: linear-gradient(to bottom, #073642, #002b36) !important;",
	"}",
	".mw-wiki-logo {",
	"  filter: opacity(50%);",
	"}",
	"div#simpleSearch #searchInput {",
	"  background-color: #002b36 !important;",
	"  padding: 0.05em 0px 0.2em 0.2em !important;",
	"}",
	".ambox,",
	".infobox,",
	"#toc,",
	"#toctitle,",
	".toclevel-1 {",
	"  background-color: #073642 !important;",
	"  border-color: #094352 !important;",
	"  color: #93a1a1 !important;",
	"}",
	".catlinks {",
	"  background-color: #073642 !important;",
	"  border-color: #094352 !important;",
	"  color: #93a1a1 !important;",
	"}",
	".navbox {",
	"  background-color: #073642 !important;",
	"  border-color: #094352 !important;",
	"  color: #93a1a1 !important;",
	"}",
	".navbox .th,",
	".navbox .navbox-title {",
	"  background-color: #094352 !important;",
	"}",
	".navbox-abovebelow,",
	"th.navbox-group,",
	".navbox-subgroup,",
	".navbox-title {",
	"  background-color: #083c4a !important;",
	"}",
	".navbox-even {",
	"  background-color: #002b36 !important;",
	"}",
	"h1,",
	"h2,",
	"h3,",
	"h4,",
	"h5,",
	"h6 {",
	"  border-color: #094352 !important;",
	"  color: #93a1a1 !important;",
	"}",
	"code {",
	"  background-color: #094352 !important;",
	"  border-color: #094352 !important;",
	"  color: #93a1a1 !important;",
	"}",
	"div.thumbinner {",
	"  background-color: #073642 !important;",
	"  border-color: #094352 !important;",
	"}",
	"img {",
	"  filter: opacity(75%);",
	"}",
	"img.thumbimage {",
	"  border-color: #094352 !important;",
	"}",
	".mw-body .external {",
	"  opacity: 0.5 !important;",
	"}",
	"table.wikitable {",
	"  background-color: #002b36 !important;",
	"  border-color: #094352 !important;",
	"  color: #839496 !important;",
	"}",
	"table.wikitable > * > tr > th {",
	"  background-color: #073642 !important;",
	"}"
].join("\n");
if (typeof GM_addStyle != "undefined") {
	GM_addStyle(css);
} else if (typeof PRO_addStyle != "undefined") {
	PRO_addStyle(css);
} else if (typeof addStyle != "undefined") {
	addStyle(css);
} else {
	var node = document.createElement("style");
	node.type = "text/css";
	node.appendChild(document.createTextNode(css));
	var heads = document.getElementsByTagName("head");
	if (heads.length > 0) {
		heads[0].appendChild(node);
	} else {
		// no head yet, stick it whereever
		document.documentElement.appendChild(node);
	}
}
})();
