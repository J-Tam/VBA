VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "exAutoFilter"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Private pAutoFIlter As AutoFilter

'************************************************************************************
' �@�@�\    :�R���X�g���N�^
' -----------------------------------------------------------------------------------
' ���@���@�@:2022/10/28  J-Tam  Ver.1.0.00  �V�K�쐬
'************************************************************************************
Private Sub Class_Initialize()
    Set pAutoFIlter = Nothing
End Sub

'************************************************************************************
' �@�@�\    :�f�X�g���N�^
' -----------------------------------------------------------------------------------
' ���@���@�@:2022/10/28  J-Tam  Ver.1.0.00  �V�K�쐬
'************************************************************************************
Private Sub Class_Terminate()
    Set pAutoFIlter = Nothing
End Sub
