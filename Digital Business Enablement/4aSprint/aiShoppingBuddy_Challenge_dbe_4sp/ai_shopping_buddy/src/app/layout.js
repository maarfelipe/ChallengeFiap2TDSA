import { AuthProvider } from '@/contexts/AuthContext'
import './globals.css'
import { Inter } from 'next/font/google'

const inter = Inter({ subsets: ['latin'] })

export const metadata = {
	title: 'Ai Shopping Buddy',
	description: 'Generated by create next app',
}

export default function RootLayout({ children }) {
	return (
		<html lang="pt-br">
			<body className={inter.className}>
				<AuthProvider>
				{children}
				</AuthProvider>
			</body>
		</html>
	)
}
