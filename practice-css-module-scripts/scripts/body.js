console.log(new Date().toISOString(), document.readyState, !!document.getElementById('test'), 'body 要素内の <script src=""> 要素 (外部 JS)');
document.addEventListener('DOMContentLoaded', () => {
  console.log(new Date().toISOString(), document.readyState, !!document.getElementById('test'), 'DOMContentLoaded : body 要素内の <script src=""> 要素 (外部 JS)');
});
