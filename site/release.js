fetch('release.json', {cache:'no-store'}).then(r => {if (!r.ok) throw Error('release'); return r.json();}).then(r => {
 const link=document.querySelector('#download');
 link.href=r.url; link.textContent='Download update · '+r.version+' ↓';
 document.querySelector('#status').textContent='Android test build · '+(r.bytes/1000000).toFixed(1)+' MB · Install over your existing app to keep progress';
}).catch(() => {});
