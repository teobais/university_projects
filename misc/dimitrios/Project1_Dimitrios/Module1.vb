Module Module1

    Sub Main()
        Console.WriteLine("++++++++++++First VB Project++++++++++++")
        Console.WriteLine("+                                      +")
        Console.WriteLine("+   -----  }   {           @ @ @       +")
        Console.WriteLine("+     |    }___{  -----  @      @      +")
        Console.WriteLine("+     |    }   {  |--    @      @      +")
        Console.WriteLine("+     |    }   {  -----   @ @ @        +")
        Console.WriteLine("+                                      +")
        Console.WriteLine("++++++++++++++++++++++++++++++++++++++++")
        Console.WriteLine()
        Dim days() As Integer
        Dim temperature() As Double
        Dim humidity() As Double

        Dim i As Integer
        Dim numberOfDays As String
        Dim nextTemperature As String, nextHumidity As String


        'dilwsi metavlitwn pou 9a xrisimopoii9oun wscounters
        ' kai oi opoioi xreiazontai pou xreiazontai gia ton upologismo
        'mesou orou 9ermokrasias kai ugrasias, antistoixa.
        Dim sumOfTemperatures As Double
        Dim sumOfHumidities As Double

        'dilwsi metavlitwn tessarwn katigoriwn
        'xaraktirismou imerwn
        Dim division1Counter As Integer
        Dim division2Counter As Integer
        Dim division3Counter As Integer
        Dim division4Counter As Integer


        Do
            Console.Write("Input number of days:")
            numberOfDays = Console.ReadLine()

        Loop Until IsNumeric(numberOfDays) = True AndAlso numberOfDays - Int(numberOfDays) = 0 _
            AndAlso numberOfDays > 0

        'emfanisi kenis grammis
        Console.WriteLine()

        ReDim days(numberOfDays)
        ReDim temperature(numberOfDays)
        ReDim humidity(numberOfDays)

        For i = 1 To numberOfDays
            Do
                Console.Write("Give temperature for day " & i & ": ")
                nextTemperature = Console.ReadLine()
            Loop Until IsNumeric(nextTemperature) = True AndAlso (nextTemperature >= -80 And nextTemperature <= 100)
            temperature(i) = nextTemperature
            sumOfTemperatures = sumOfTemperatures + temperature(i)

            Do
                Console.Write("Give humidity for day " & i & ": ")
                nextHumidity = Console.ReadLine()
            Loop Until IsNumeric(nextTemperature) = True AndAlso (nextHumidity - Int(nextHumidity) = 0) _
                AndAlso (nextHumidity >= 0 And nextHumidity <= 100)
            humidity(i) = nextHumidity
            sumOfHumidities = sumOfHumidities + humidity(i)

            If temperature(i) >= 20 AndAlso humidity(i) >= 50 Then
                division1Counter = division1Counter + 1
            ElseIf temperature(i) < 20 AndAlso humidity(i) >= 50 Then
                division2Counter = division2Counter + 1
            ElseIf temperature(i) >= 20 AndAlso humidity(i) < 50 Then
                division3Counter = division3Counter + 1
            ElseIf temperature(i) < 20 AndAlso humidity(i) < 50 Then
                division4Counter = division4Counter + 1

            End If

            'emfanisi kenis grammis prin apo tin allagi imeras
            Console.WriteLine()
        Next

        For i = 1 To numberOfDays
            Console.WriteLine("Day " & i & ": Temperature: " & temperature(i) & ", Humidity: " & humidity(i))
        Next


        Dim minTemperature As Double
        Dim minHumidity As Integer
        Dim maxTemperature As Double
        Dim maxHumidity As Integer


        'evresis elaxistis kai megistis 9ermokrasias
        minTemperature = 100
        maxTemperature = -80
        For i = 1 To numberOfDays
            If temperature(i) < minTemperature Then
                minTemperature = temperature(i)
            End If

            If temperature(i) > maxTemperature Then
                maxTemperature = temperature(i)
            End If

        Next


        'evresi elaxistis kai megistis ugrasias
        minHumidity = 100
        maxHumidity = 0
        For i = 1 To numberOfDays
            If humidity(i) < minHumidity Then
                minHumidity = temperature(i)
            End If

            If humidity(i) > maxHumidity Then
                maxHumidity = humidity(i)
            End If

        Next

        'emfanisi megistis & elaxistis 9ermokrasias kai ugrasias
        Console.WriteLine()
        Console.WriteLine("Minimum Temperature: " & minTemperature)
        Console.WriteLine("Minimum Humidity: " & minHumidity)
        Console.WriteLine("Maximum Temperature: " & maxTemperature)
        Console.WriteLine("Maximum Humidity: " & maxHumidity)

        'emfanisi diaforas megistis kai elaxistis timis 9ermokrasias kai ugrasias
        Console.WriteLine("Subtraction Result Between Maximum Temperature & Minimum Temperature is " & (maxTemperature - minTemperature))
        Console.WriteLine("Subtraction Result Between Maximum Humidity & Minimum Humidity is " & (maxHumidity - minHumidity))

        Console.WriteLine() 'emfanisi mias kenis grammis

        'emfanisi meswn orwn 9ermokrasias kai ugrasias
        Console.WriteLine("Average Temperature for " & numberOfDays & " days : " & sumOfTemperatures / numberOfDays)
        Console.WriteLine("Average Humidity for " & numberOfDays & " days : " & sumOfHumidities / numberOfDays)

        Console.WriteLine()

        Console.WriteLine("There are " & division1Counter & " days that correspond to Division 1")
        Console.WriteLine("There are " & division2Counter & " days that correspond to Division 2")
        Console.WriteLine("There are " & division3Counter & " days that correspond to Division 3")
        Console.WriteLine("There are " & division4Counter & " days that correspond to Division 4")

        'anamenontas eisodo apo to xristi
        'ousiastika i VB afora Windows efarmoges,
        'opote einai san na exoume brosta mas ena command line
        'opote dinontas apla exit, termatizoume to programma kai ti diadikasia tis konsolas
        Console.ReadLine()

    End Sub

End Module
