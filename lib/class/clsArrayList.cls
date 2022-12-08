VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "clsArrayList"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

'************************************************************************************
' �@�@�\    :ArrayList�N���X
' ��  ��    :�v�f�ԍ����P����n�܂铮�I�Ȕz��N���X
' Ver       :1.0.00
' -----------------------------------------------------------------------------------
' ���@���@�@:2020/04/10  J.Tamura  Ver.1.0.00  �V�K�쐬
'************************************************************************************

'�z��
Private pItem As Variant

'************************************************************************************
' �@�@�\    :�f�X�g���N�^
' -----------------------------------------------------------------------------------
' ���@���@�@:2020/04/10  J.Tamura  Ver.1.0.00  �V�K�쐬
'************************************************************************************
Private Sub Class_Terminate()
    If Not IsEmpty(pItem) Then
        Erase pItem
    End If
End Sub

'************************************************************************************
' �@�@�\    :�Z�b�^�[�i�f�[�^�^�j
' -----------------------------------------------------------------------------------
' ���@���@�@:2020/04/10  J.Tamura  Ver.1.0.00  �V�K�쐬
'************************************************************************************
Public Property Let item(ByVal aryNum As Long, ByVal elem As Variant)
    pItem(aryNum) = elem
End Property

'************************************************************************************
' �@�@�\    :�Z�b�^�[�i�I�u�W�F�N�g�^�j
' -----------------------------------------------------------------------------------
' ���@���@�@:2020/04/10  J.Tamura  Ver.1.0.00  �V�K�쐬
'************************************************************************************
Public Property Set item(ByVal aryNum As Long, ByRef elem As Variant)
    Set pItem(aryNum) = elem
End Property

'************************************************************************************
' �@�@�\    :�Q�b�^�[
' -----------------------------------------------------------------------------------
' ���@���@�@:2020/04/10  J.Tamura  Ver.1.0.00  �V�K�쐬
'************************************************************************************
Public Property Get item(ByVal aryNum As Long) As Variant
Attribute item.VB_UserMemId = 0
    If IsObject(pItem(aryNum)) Then
        Set item = pItem(aryNum)
    Else
        item = pItem(aryNum)
    End If
End Property

'************************************************************************************
' �@�@�\    :�v�f��ǉ�
' ��  ��    :in  elem                            �v�f
' -----------------------------------------------------------------------------------
' ���@���@�@:2020/04/10  J.Tamura  Ver.1.0.00  �V�K�쐬
'************************************************************************************
Public Sub add(ByRef elem As Variant)

    '�z�񂪖������Ă̏ꍇ
    If Me.IsAryEmpty Then
        
        '�z����Ē�`
        ReDim pItem(1 To 1) As Variant

    Else
        
        '�z��̓��e��ێ������܂܍Ē�`
        ReDim Preserve pItem(1 To UBound(pItem) + 1) As Variant

    End If

    '�ǉ�����v�f�̃`�F�b�N
    If IsObject(elem) Then
        
        '�I�u�W�F�N�g�^�ł���ꍇ
        Set pItem(UBound(pItem)) = elem

    Else
    
        '��{�^�ł���ꍇ
        pItem(UBound(pItem)) = elem

    End If

End Sub

'************************************************************************************
' �@�@�\    :�S�Ă̗v�f��ǉ�
' ��  ��    :in  ary                             �z��
' -----------------------------------------------------------------------------------
' ���@���@�@:2020/04/10  J.Tamura  Ver.1.0.00  �V�K�쐬
'************************************************************************************
Public Sub addAll(ByRef ary As clsArrayList)

    Dim iter As clsIterator

    '�ǉ�����v�f����ł���ꍇ
    If ary.IsAryEmpty Then
        Exit Sub
    End If

    '�z�񂪖������Ă̏ꍇ
    If Me.IsAryEmpty Then
        
        '�z����Ē�`
        ReDim pItem(1 To 1) As Variant

    End If
        
    '�z��̗v�f��S�Ēǉ�
    Set iter = ary.iterator
    While iter.hasNext
        Me.add iter.toNext
    Wend
        
    Set iter = Nothing

End Sub

'************************************************************************************
' �@�@�\    :�v�f�����擾
' -----------------------------------------------------------------------------------
' ���@���@�@:2020/04/10  J.Tamura  Ver.1.0.00  �V�K�쐬
'************************************************************************************
Public Function count() As Long

    '�v�f�����݂���ꍇ
    If Not Me.IsAryEmpty Then
        '�ő�̗v�f�ԍ���ԋp
        count = UBound(pItem)
    End If

End Function

'************************************************************************************
' �@�@�\    :�z�񂪑��݂��邩
' -----------------------------------------------------------------------------------
' ���@���@�@:2020/04/10  J.Tamura  Ver.1.0.00  �V�K�쐬
'************************************************************************************
Public Function IsAryEmpty() As Boolean
    IsAryEmpty = IsEmpty(pItem)
End Function

'************************************************************************************
' �@�@�\    :�w�肵���v�f���폜
' ��  ��    :in  aryNum                          �v�f�ԍ�
' -----------------------------------------------------------------------------------
' ���@���@�@:2020/04/10  J.Tamura  Ver.1.0.00  �V�K�쐬
'************************************************************************************
Public Sub remove(ByVal aryNum As Long)

    '�w�肵���v�f�ԍ����珇�ɗv�f���l�߂čĔz�u
    Dim i As Long
    For i = aryNum To UBound(pItem) - 1
        item(i) = item(i + 1)
    Next

    '�z����팸�����v�f���ōĒ�`
    ReDim Preserve pItem(1 To UBound(pItem) - 1) As Variant

End Sub

'************************************************************************************
' �@�@�\    :�v�f��S�č폜
' -----------------------------------------------------------------------------------
' ���@���@�@:2020/04/10  J.Tamura  Ver.1.0.00  �V�K�쐬
'************************************************************************************
Public Sub removeAll()
    If Not Me.IsAryEmpty Then
        Erase pItem
    End If
End Sub

'************************************************************************************
' �@�@�\    :�w�肳�ꂽ�v�f���z����ōŏ��Ɉ�v����v�f�ԍ���ԋp
' ��  ��    :in  idxBgn                          �����J�n�ʒu
'           :in  elem                            �����l
'           :in  isPart                          ������v�����ł��邩
'           :in  rtnIdx                          �����ڂ̈�v��ԋp���邩
' ��  �l    :�ŏ��Ɉ�v�����v�f�ԍ�
' -----------------------------------------------------------------------------------
' ���@���@�@:2020/04/10  J.Tamura  Ver.1.0.00  �V�K�쐬
'************************************************************************************
Public Function indexOf( _
      ByVal elem As Variant _
    , Optional ByVal idxBgn As Long = 1 _
    , Optional ByVal isPart As Boolean = False _
    , Optional ByVal rtnIdx As Long = 1 _
) As Long

    Dim isMatch As Boolean

    '�߂�l���N���A
    indexOf = 0

    On Error GoTo ErrorHandler

    '�z�񂪋�ł���ꍇ
    If Me.IsAryEmpty Then
        GoTo Fin
    End If

    Dim hitCnt As Long
    hitCnt = 0

    '�擪�̗v�f���珇�ɍŌ�̗v�f�܂ő���
    Dim aryIdx As Long
    For aryIdx = idxBgn To UBound(pItem)
    
        If isPart Then
            '������v����ꍇ
            isMatch = pItem(aryIdx) Like "*" & elem & "*"
        Else
            '���S��v����ꍇ
            isMatch = pItem(aryIdx) = elem
        End If
        
        If isMatch Then

            hitCnt = hitCnt + 1
        
            If hitCnt = rtnIdx Then

                '�v�f�ԍ���ԋp
                indexOf = aryIdx
                Exit Function
            
            End If
            
        End If

    Next

    '�v�f�����݂��Ȃ�
    indexOf = 0
    GoTo Fin

ErrorHandler:
    '************************************************************
    ' �G���[����
    '************************************************************
    
    '�v�f�����݂��Ȃ�
    indexOf = 0
    
    Resume Fin
Fin:

End Function

'************************************************************************************
' �@�@�\    :�w�肳�ꂽ�v�f���z����ōŌ�Ɉ�v����v�f�ԍ���ԋp
' ��  ��    :in  idxBgn                          �����J�n�ʒu
'           :in  elem                            �����l
'           :in  isPart                          ������v�����ł��邩
'           :in  rtnIdx                          �����ڂ̈�v��ԋp���邩
' ��  �l    :�ŏ��Ɉ�v�����v�f�ԍ�
' -----------------------------------------------------------------------------------
' ���@���@�@:2020/04/10  J.Tamura  Ver.1.0.00  �V�K�쐬
'************************************************************************************
Public Function lastIndexOf( _
      ByVal elem As Variant _
    , Optional ByVal idxBgn As Long = 1 _
    , Optional ByVal isPart As Boolean = False _
    , Optional ByVal rtnIdx As Long = 1 _
) As Long

    Dim isMatch As Boolean

    '�߂�l���N���A
    lastIndexOf = 0

    On Error GoTo ErrorHandler

    '�z�񂪋�ł���ꍇ
    If Me.IsAryEmpty Then
        GoTo Fin
    End If

    Dim hitCnt As Long
    hitCnt = 0

    '�擪�̗v�f���珇�ɍŌ�̗v�f�܂ő���
    Dim aryIdx As Long
    For aryIdx = idxBgn To LBound(pItem) Step -1
    
        If isPart Then
            '������v����ꍇ
            isMatch = pItem(aryIdx) Like "*" & elem & "*"
        Else
            '���S��v����ꍇ
            isMatch = pItem(aryIdx) = elem
        End If
        
        If isMatch Then
        
            hitCnt = hitCnt + 1
        
            If hitCnt = rtnIdx Then
        
                '�v�f�ԍ���ԋp
                lastIndexOf = aryIdx
                Exit Function
            
            End If
            
        End If

    Next

    '�v�f�����݂��Ȃ�
    lastIndexOf = 0
    GoTo Fin

ErrorHandler:
    '************************************************************
    ' �G���[����
    '************************************************************
    
    '�v�f�����݂��Ȃ�
    lastIndexOf = 0
    
    Resume Fin
Fin:

End Function

'************************************************************************************
' �@�@�\    :�w�肳�ꂽ�v�f���z����ɑ��݂��邩
' ��  ��    :in  elem                            �����l
' ��  �l    :True/���݂���  �F  False/���݂��Ȃ�
' -----------------------------------------------------------------------------------
' ���@���@�@:2020/04/10  J.Tamura  Ver.1.0.00  �V�K�쐬
'************************************************************************************
Public Function contains(ByVal elem As Variant) As Boolean

    '�߂�l���N���A
    contains = False

    '�v�f�̑��݃`�F�b�N
    If Me.indexOf(elem) <> 0 Then
        contains = True
    End If

End Function

'************************************************************************************
' �@�@�\    :�C�e���[�^���擾
' -----------------------------------------------------------------------------------
' ���@���@�@:2020/04/10  J.Tamura  Ver.1.0.00  �V�K�쐬
'************************************************************************************
Public Function iterator() As clsIterator

    Dim iter As New clsIterator

    '�z�񂪋�ł���ꍇ
    If Me.IsAryEmpty Then
        Set iterator = iter
        GoTo Fin
    End If

    '�C�e���[�^�ɔz���ݒ�
    iter.setAry = pItem

    '�ݒ肵���C�e���[�^��ԋp
    Set iterator = iter
    
Fin:

    Set iter = Nothing

End Function