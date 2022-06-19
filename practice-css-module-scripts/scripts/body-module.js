console.log(new Date().toISOString(), document.readyState, !!document.getElementById('test'), 'body 要素内の <script type="module" src=""> 要素 (外部 JS)');
document.addEventListener('DOMContentLoaded', () => {
  console.log(new Date().toISOString(), document.readyState, !!document.getElementById('test'), 'DOMContentLoaded : body 要素内の <script type="module" src=""> 要素 (外部 JS)');
});

import styles from '../styles/body-src.css' assert { type: 'css' };
document.adoptedStyleSheets.push(styles);
console.log(new Date().toISOString(), document.readyState, !!document.getElementById('test'), 'body 要素内の <script type="module" src=""> 要素 (外部 JS) : ↑CSS 設定↑');
