$rootparams = @{
    DnsName = "Sitecore Development Root"
    KeyExportPolicy = 'Exportable'
    NotAfter = (Get-Date).AddYears(10)
    CertStoreLocation = 'Cert:\LocalMachine\My'
    KeyUsage = 'CertSign','CRLSign'
}

$rootCA = New-SelfSignedCertificate @rootparams

$webparams = @{
    DnsName = "sc101.dev.local"
    FriendlyName = "Sitecore Website"
    Signer = $rootCA
    KeyExportPolicy = 'Exportable'
    NotAfter = (Get-date).AddYears(10)
    CertStoreLocation = 'Cert:\LocalMachine\My'
}

$webCert = New-SelfSignedCertificate @webparams
Write-Host -Object "Website: $($webCert.Thumbnail)"

$identityparams = @{
    DnsName = "sc101.identityserver"
    FriendlyName = "Sitecore Commerce and Identity Server"
    Signer = $rootCA
    KeyExportPolicy = 'Exportable'
    KeySpec = 'Signature'
    NotAfter = (Get-date).AddYears(10)
    CertStoreLocation = 'Cert:\LocalMachine\My'
}

$identityCert = New-SelfSignedCertificate @identityparams
Write-Host -Object "Identity: $($identityCert.Thumbnail)"

$connectparams = @{
    DnsName = "sc101.xconnect"
    FriendlyName = "Sitecore xConnect"
    Signer = $rootCA
    KeyExportPolicy = 'Exportable'
    NotAfter = (Get-date).AddYears(10)
    CertStoreLocation = 'Cert:\LocalMachine\My'
}

$connectCert = New-SelfSignedCertificate @connectparams
Write-Host -Object "xConnect: $($connectCert.Thumbnail)"