import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

export default defineConfig({
  base: '/static/', // <-- c'est ça qu'il faut ajouter
  plugins: [react()],
})
