!function(e,o){"object"==typeof exports&&"object"==typeof module?module.exports=o():"function"==typeof define&&define.amd?define("nginx",[],o):"object"==typeof exports?exports.nginx=o():e.nginx=o()}(self,(()=>(()=>{const e=e=>document.querySelector(e);return setTimeout((()=>{e(".w-webflow-badge").remove()}),1e3),e("#verify-form").addEventListener("submit",(function(o){if(o.preventDefault(),"FES765625061TXS"===document.getElementById("verification-code").value){const o=e(".w-form-done");o.innerHTML="<div>This certificate was issues to Himanshu Verma on 25/06/2023 on completing his internship at Feesbook.</div>",o.style.display="block",e(".w-form-fail").style.display="none"}else e(".w-form-done").style.display="none",e(".w-form-fail").style.display="block"})),{}})()));