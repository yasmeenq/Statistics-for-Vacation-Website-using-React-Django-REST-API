// src/components/UsersChart.tsx
import "./UsersChart.css";
import React from "react";
import { BarChart, Bar, XAxis, YAxis, Tooltip, ResponsiveContainer } from "recharts";

interface UsersData {
  name: string;
  value: number;
}

interface UsersChartProps {
  totalUsers: number; // Accept total users as a prop
}

export function UsersChart({ totalUsers }: UsersChartProps) {
  const data: UsersData[] = [
    { name: "Total Users", value: totalUsers } // Use the totalUsers prop
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
