// src/app/page.js
import React from "react";
import SideBar from "@/components/SideBar";
import { AuthProvider } from "@/contexts/AuthContext";


export default function HomePage() {
    return (
        <>
            <div className="flex">
                <div className="w-64 mr-4">
                    <SideBar />
                </div>
                <main>
                    Home
                </main>
            </div>
        </>
    )
}
