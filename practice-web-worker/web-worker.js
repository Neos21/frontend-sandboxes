self.addEventListener('message', event => {
  console.log('【Web Worker】メインスレッドからメッセージを受信', event, event.data);
  if(event.data === 'ERROR') throw new Error('【Web Worker】Web Worker からエラーをスローします');
  setTimeout(() => self.postMessage(`【${new Date().toISOString()}】Web Worker はこのメッセージを受け取りました → [${event.data}]`), 1000);
});

// 自身で終了するには `self.close();`
