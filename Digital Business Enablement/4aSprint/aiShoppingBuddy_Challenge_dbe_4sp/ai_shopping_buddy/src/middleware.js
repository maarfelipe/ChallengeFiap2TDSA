import { NextResponse } from "next/server";

export function middleware(request) {
    if (!request.cookies.has("aishoppingbuddy_token")) {
        return NextResponse.redirect(new URL('/login', request.url))
    }
}

export const config = {
    matcher: [
        '/gerar_recomendacao/:path*',
        '/cadastrar_produtos/:path*',
        '/listar_produtos/:path*',
        '/cadastrar_usuario/:path*',
        '/buscar_usuario/:path*',
        '/ver_recomendacoes/:path*',
        '/recomendacoes_por_id/:path*',
        '/recomendacoes_por_data/:path*',
        '/recomendacoes_por_usuario/:path*',
    ]
}