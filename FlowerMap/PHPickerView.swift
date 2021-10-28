//
//  PHPickerView.swift
//  FlowerMap
//
//  Created by cmStudent on 2021/10/25.
//

import SwiftUI
import PhotosUI

struct PHPickerView: UIViewControllerRepresentable {
   //sheetが表示されているか
    @Binding var isShowAlbum: Bool
    //フォトライブラリーから読み込む写真
    @Binding var captureImage:UIImage?

    //Cordinatorでコントローラのdelegateを管理
    class Coordinator: NSObject,PHPickerViewControllerDelegate{
        //PHPickerView型の変数を用意
        var parent: PHPickerView
        //イニシャライザ
        init(parent:PHPickerView){
            self.parent = parent
        }
        //フォトライブラリーで写真を選択・キャンセルした時に実行される
        //delegateメソッド、必ず必要
        func picker(_ picker:PHPickerViewController,didFinishPicking results:[PHPickerResult]){
            //写真は一つだけ選べる設定なので最初の一件を指定
            if let result = results.first{
                //UIImage型の写真のみ非同期で取得
                result.itemProvider.loadObject(ofClass:UIImage.self){
                     (image, error) in
                    //写真が取得できたら
                    if let unwrapImage = image as? UIImage{
                        //選択された写真を追加する
                        self.parent.captureImage = unwrapImage
                    }else{
                        print("使用できる写真がないです")
                    }
                    
                }
                //sheetを閉じない
                parent.isShowAlbum = true
            }else{
                print("選択された写真はないです")
                //sheetを閉じる
                parent.isShowAlbum = false
            }
        }//picker
    }//cordinator
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    //viewを生成する時に実行
    func makeUIViewController(context:UIViewControllerRepresentableContext<PHPickerView>) -> PHPickerViewController{
        //PHPickerViewControllerのカスタマイズ
        var configuration = PHPickerConfiguration()
        //静止画を選択
        configuration.filter = .images
        //フォトライブラリーで選択できる枚数を一枚にする
        configuration.selectionLimit = 1
        //PHPickerViewControllerのインスタンスを作成
        let picker = PHPickerViewController(configuration: configuration)
        //delegate設定
        picker.delegate = context.coordinator
        //PHPickerViewControllerを返す
        return picker
    }
    
    //Viewが更新された時に実行
    func updateUIViewController
    (_ uiViewController: PHPickerViewController, context: UIViewControllerRepresentableContext<PHPickerView>) {
        //処理なし
    }

}
