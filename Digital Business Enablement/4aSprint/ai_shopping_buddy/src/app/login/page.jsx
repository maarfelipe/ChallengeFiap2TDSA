"use client"

import Image from "next/image";
import loginimage from "@/images/login.jpg"
import InputText from "@/components/InputText";
import Button from "@/components/Button";
import { useForm } from "react-hook-form";
import { useRouter } from "next/navigation";
import toast from "react-hot-toast";
import { useToast } from "@/hooks/toast";
import { useContext } from "react";
import { AuthContext } from "@/contexts/AuthContext";
import InputTextLogin from "@/components/InputTextLogin";

export default function LoginPage() {
    const { register, handleSubmit } = useForm()
    const { push } = useRouter()
    const { error } = useToast()
    const { login } = useContext(AuthContext)

    async function onSubmit(data) {

        const resp = await login(data)

        console.log(resp)

        if (resp?.error) {
            error(resp.error)
            return
        }

        push("/")
    }

    return (
            <div className="flex h-screen">
                <aside className="">
                    <Image src={loginimage} alt="" className="h-full w-full object-cover" />
                </aside>

                <main className="flex flex-col items-center justify-center w-full">
                    <img src="/logo.png" alt="Logo" className="flex items-center justify-center mb-6 w-80" />

                    <form onSubmit={handleSubmit(onSubmit)} className="flex flex-col items-center justify-center">
                        <InputTextLogin
                            register={register}
                            name="email"
                            label="Email"
                            placeholder="Digite o seu email"
                        />
                        <InputTextLogin
                            register={register}
                            name="senha"
                            label="Senha"
                            type="password"
                            placeholder="************"
                        />
                        <Button type="button" variant="third">Login</Button>
                    </form>

                </main>
            </div>
    )
}