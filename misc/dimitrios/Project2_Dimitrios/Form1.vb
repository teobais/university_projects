Public Class Form1
    Dim counter As Integer = 0
    Dim lista As New List(Of Double)
    Dim largest As Double = Double.MinValue
    Dim smallest As Double = Double.MaxValue

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        
        'ελεγχοι
        If (TextBox1.Text = String.Empty OrElse TextBox1.Text = " ") Then
            MsgBox("Εισάγετε μη κενό αλφαριθμητικό κωδικό.", MsgBoxStyle.Critical, "Λάθος Εισαγωγής Κωδικού Δήμου")
            Exit Sub
        End If

        If (TextBox3.Text = String.Empty OrElse TextBox1.Text = " ") Then
            MsgBox("Εισάγετε μη κενό αλφαριθμητικό όνομα.", MsgBoxStyle.Critical, "Λάθος Εισαγωγής Ονόματος Δήμου")
            Exit Sub
        End If

        Try
            Decimal.Parse(TextBox4.Text)
            If (Val(TextBox4.Text) <= 0) Then
                MsgBox("Παρακαλώ εισάγετε δεκαδικό ακέραιο αριθμός έκτασης.", MsgBoxStyle.Critical, "Λάθος Εισαγωγής Έκτασης Δήμου")
                Exit Sub
            End If
        Catch ex As Exception
            MsgBox("Παρακαλώ εισάγετε δεκαδικό ακέραιο αριθμό έκτασης.", MsgBoxStyle.Critical, "Λάθος Εισαγωγής Έκτασης Δήμου")
            Exit Sub
        End Try

        Try
            Integer.Parse(TextBox5.Text)
            If (Val(TextBox5.Text) <= 0) Then
                MsgBox("Παρακαλώ εισάγετε ακέραιο αριθμό πληθυσμού.", MsgBoxStyle.Critical, "Λάθος Εισαγωγής Πληθυσμού Δήμου")
                Exit Sub
            End If
        Catch ex As Exception
            MsgBox("Παρακαλώ εισάγετε ακέραιο αριθμό πληθυσμού.", MsgBoxStyle.Critical, "Λάθος Εισαγωγής Πληθυσμού Δήμου")
            Exit Sub
        End Try
        'τελος ελεγχων

        Dim acc = New Dhmos(TextBox1.Text, TextBox3.Text, TextBox4.Text, TextBox5.Text)

        lista.Add(acc.getPP())
        TextBox2.Text = acc.getInfo()

        For Each pp As Double In lista
            largest = Math.Max(largest, pp)
            smallest = Math.Min(smallest, pp)
        Next

        TextBox6.Text = FormatNumber(Double.Parse(smallest), 2)
        TextBox7.Text = FormatNumber(Double.Parse(largest), 2)

    End Sub



   
End Class
