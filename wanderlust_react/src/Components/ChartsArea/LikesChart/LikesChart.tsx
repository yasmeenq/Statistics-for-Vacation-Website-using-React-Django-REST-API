// src/components/LikesChart.tsx
import "./LikesChart.css";
import React from "react";
import { BarChart, Bar, XAxis, YAxis, Tooltip, ResponsiveContainer } from "recharts";

interface LikesChartProps {
  totalLikes: number; // Accept total likes as a prop
}


export function LikesChart({ totalLikes }: LikesChartProps) {
  const data = [
    { name: "Total Likes", value: totalLikes } // Use the totalLikes prop
  ];

  return (
    <ResponsiveContainer width="100%" height={300}>
      <BarChart data={data}>
        <XAxis dataKey="name" />
        <YAxis />
        <Tooltip />
        <Bar dataKey="value" fill="#2F4F4F" />
      </BarChart>
    </ResponsiveContainer>
  );
}
