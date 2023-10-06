import Link from "next/link"

export default function Button({ children, icon, variant = "primary", estilo = "", type = "link", name, register = () => { }, ...props }) {
    const styles = {
        primary: "bg-brown_800 text-black",
        secundary: "border-2 border-black text-black hover:text-white"
    }
    const variantClass = `flex items-center justify-center font-overlock hover:bg-pink-800 gap-2 px-10 py-1 mt-7 mb-4 rounded-3xl  ${styles[variant]}`

    return (
        <>
            {type === "link" ?
                <Link href="#" {...props} className={variantClass}>
                    {icon}
                    {children}
                </Link>
                :
                <button className={variantClass} {...props}>
                    {icon}
                    {children}
                </button>
            }
        </>
    )
}