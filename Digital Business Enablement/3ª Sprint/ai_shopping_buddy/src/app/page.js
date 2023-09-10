import SideBar from "@/components/SideBar";
import React from "react";


export default function Home() {
	return (
		<div className="flex">
			<div className="w-1/5">
				<SideBar />
			</div>

			<div className="w-4/5 p-4">
				<h1 className="text-2xl font-bold mb-4">Welcome to the AI Shopping Buddy</h1>
				<p>
					This is where the content of your main page goes.
				</p>
			</div>
		</div>
	)
}
