// src/components/VacationsChart.tsx
import React from "react";
import { PieChart, Pie, Cell, Tooltip, ResponsiveContainer } from "recharts";
import "./VacationsChart.css"; // For styling the pinpoints

interface VacationData {
  name: string;
  value: number;
}

interface VacationsChartProps {
  pastVacations: number;
  ongoingVacations: number;
  futureVacations: number;
}

const COLORS = ["#3a5fcd", "#00C49F", "#FFBB28"]; // Different colors for each vacation type

export function VacationsChart({ pastVacations, ongoingVacations, futureVacations }: VacationsChartProps) {
  const data: VacationData[] = [
    { name: "Past Vacations", value: pastVacations },
    { name: "Ongoing Vacations", value: ongoingVacations },
    { name: "Future Vacations", value: futureVacations }
  ];

  return (
    <div className="chart-container">
      {/* Pinpoint Legend */}
      <div className="legend">
        {data.map((entry, index) => (
          <div key={`legend-${index}`} className="legend-item">
            <div
              className="color-box"
              style={{ backgroundColor: COLORS[index % COLORS.length] }}
            ></div>
            <span>{entry.name}</span>
          </div>
        ))}
      </div>

      {/* Circular Chart */}
      <div className="chart">
        <ResponsiveContainer width="100%" height={300}>
          <PieChart>
            <Pie
              data={data}
              dataKey="value"
              nameKey="name"
              cx="50%"
              cy="50%"
              outerRadius={100}
              label
            >
              {data.map((entry, index) => (
                <Cell key={`cell-${index}`} fill={COLORS[index % COLORS.length]} />
              ))}
            </Pie>
            <Tooltip />
          </PieChart>
        </ResponsiveContainer>
      </div>
    </div>
  );
}
