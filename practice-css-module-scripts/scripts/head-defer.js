console.log(new Date().toISOString(), document.readyState, !!document.getElementById('test'), 'head 要素内の <script defer src=""> 要素 (外部 JS)');
document.addEventListener('DOMContentLoaded', () => {
  console.log(new Date().toISOString(), document.readyState, !!document.getElementById('test'), 'DOMContentLoaded : head 要素内の <script defer src=""> 要素 (外部 JS)');
});
