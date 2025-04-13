CSV_FILE="power_readings_espncricinfo.csv"
echo "RAPL Difference (W), Cycles" > $CSV_FILE

num_reloads=1

for (( i=1; i<=num_reloads; i++ ))
do
    echo "Reloading website ($i/$num_reloads)..."
    output_before=$(sudo ./measure.out)
    rapl_before=$(echo "$output_before" | grep -oP "RAPL_READOUT: \K[\d\.]+")
    timestamp_before=$(echo "$output_before" | grep -oP "TIMESTAMP: \K[\d\-:\s]+")

    echo "Timestamp before: $timestamp_before"
    echo "Opening website..."

    GTK_MODULES= ./website.out
    output_after=$(sudo ./measure.out)

    rapl_after=$(echo "$output_after" | grep -oP "RAPL_READOUT: \K[\d\.]+")
    timestamp_after=$(echo "$output_after" | grep -oP "TIMESTAMP: \K[\d\-:\s]+")
    rapl_diff=$(echo "$rapl_after - $rapl_before" | bc)
    cycles_diff=$(echo "$timestamp_after - $timestamp_before" | bc)
    echo "Timestamp after: $c"
    echo "cycles_diff: $cycles_diff"

    echo "$rapl_diff, $cycles_diff" >> $CSV_FILE
done

echo "Power consumption readings saved to $CSV_FILE"
