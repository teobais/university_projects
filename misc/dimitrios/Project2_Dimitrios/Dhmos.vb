Public Class Dhmos



    Private id As String
    Public name As String
    Public area As Decimal
    Public population As Integer

    Public Sub New(ByVal idi As String, ByVal onoma As String, ByVal ektasi As Decimal, ByVal plu9ismos As Integer)
        id = idi
        name = onoma
        area = ektasi
        population = plu9ismos
    End Sub

    Public Function getId() As String
        Return id
    End Function

    Public Function getName() As String
        Return name
    End Function

    Public Function getArea() As Decimal
        Return area
    End Function

    Public Function getPopulation() As Integer
        Return population
    End Function

    Public Function getPP() As Double
        Return Double.Parse(getPopulation() / getArea())
    End Function

    Public Function getInfo() As String
        Return "Κωδικός: " & getId() & vbCrLf & "Όνομα: " & getName() & vbCrLf & "Έκταση: " & getArea() & " τχ" & vbCrLf & "Πληθυσμός: " & getPopulation()
    End Function

End Class
