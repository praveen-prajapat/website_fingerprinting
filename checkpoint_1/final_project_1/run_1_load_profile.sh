CSV_FILE="single_load_espncricinfo.csv"
echo "RAPL Difference (W), Elapsed Time (ms)" > "$CSV_FILE"

echo "Measuring power for ~10 seconds..."

output_offset=$(sudo ./measure.out)
rapl_readout_initial=$(echo "$output_offset" | grep -oP "RAPL_READOUT: \K[\d\.]+")

start_time=$(date +%s%3N)
GTK_MODULES= ./website.out &

for i in {1..20}; do
    output=$(sudo ./measure.out)
    rapl_readout=$(echo "$output" | grep -oP "RAPL_READOUT: \K[\d\.]+")
    rapl_diff=$(echo "$rapl_readout - $rapl_readout_initial" | bc)
    echo "$rapl_diff" >> "$CSV_FILE"
done

echo "Measurement completed. Power consumption readings saved to $CSV_FILE"
