// src/components/LikesPerCountryChart.tsx
import "./LikesPerCountryChart.css";
import React from "react";
import { PieChart, Pie, Cell, Tooltip, ResponsiveContainer } from "recharts";

interface LikesPerCountryData {
  country: string;
  likes: number;
}

interface LikesPerCountryChartProps {
  data: LikesPerCountryData[];
}

// Function to generate random RGB color
const generateRandomColor = () => {
  const getRandomInt = (min: number, max: number) => Math.floor(Math.random() * (max - min + 1)) + min;
  const r = getRandomInt(0, 255);
  const g = getRandomInt(0, 255);
  const b = getRandomInt(0, 255);
  return `rgb(${r}, ${g}, ${b})`;
};


export function LikesPerCountryChart({ data }: LikesPerCountryChartProps) {
  // Generate random colors for each data entry
  const COLORS = data.map(() => generateRandomColor());

  return (
    <div className="chart-container">
      <div className="legend">
        {data.map((entry, index) => (
          <div key={`legend-${index}`} className="legend-item">
            <div
              className="color-box"
              style={{ backgroundColor: COLORS[index] }}
            ></div>
            <span>{entry.country}</span>
          </div>
        ))}
      </div>

      {/* Circular Chart */}
      <div className="chart">
        <ResponsiveContainer width="100%" height={300}>
          <PieChart>
            <Pie
              data={data}
              dataKey="likes"
              nameKey="country"
              cx="50%"
              cy="50%"
              outerRadius={100}
              label
            >
              {data.map((entry, index) => (
                <Cell key={`cell-${index}`} fill={COLORS[index]} />
              ))}
            </Pie>
            <Tooltip />
          </PieChart>
        </ResponsiveContainer>
      </div>
    </div>
  );
}
