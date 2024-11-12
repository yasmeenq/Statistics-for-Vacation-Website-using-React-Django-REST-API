// src/components/VacationStats.tsx
import React, { useEffect, useState } from 'react';
import { fetchVacationStats } from '../../../Services/apiService';
import { VacationStatsType } from '../../../Services/types';
import { VacationsChart } from "../VacationStatsChart/VacationsChart"; // Import the updated chart component

export function VacationStats() {
    const [vacationStats, setVacationStats] = useState<VacationStatsType | null>(null);

    useEffect(() => {
        fetchVacationStats()
            .then(setVacationStats)
            .catch((error) => {
                console.error("Error in VacationStats component:", error);
            });
    }, []);

    return (
        <div>
            <h2>Vacation Stats:</h2>
            {vacationStats ? (
                <VacationsChart 
                    pastVacations={vacationStats.past_vacations} 
                    ongoingVacations={vacationStats.ongoing_vacations} 
                    futureVacations={vacationStats.future_vacations} 
                />
            ) : (
                <p>Loading...</p>
            )}
        </div>
    );
}
