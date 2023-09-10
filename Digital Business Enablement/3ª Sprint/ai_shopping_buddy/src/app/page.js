import React from "react";
import SideBar from "@/components/SideBar";

export default function HomePage() {
  return (
    <div className="flex">
      <div className="w-64">
        <SideBar />
      </div>
      <div className="flex-grow">
        Home
      </div>
    </div>
  );
}
