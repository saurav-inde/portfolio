// web/load_wasm.js
async function loadWasm() {
  const response = await fetch('your_wasm_file.wasm');
  const bytes = await response.arrayBuffer();
  const wasmModule = await WebAssembly.instantiate(bytes);
  return wasmModule.instance;
}
