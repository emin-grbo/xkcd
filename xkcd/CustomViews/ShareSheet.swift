import SwiftUI

struct ShareSheet: UIViewControllerRepresentable {
    @Binding var isPresented: Bool

    let data: [Any]

    func makeUIViewController(context: Context) -> UIViewController {
        UIViewController()
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        let activityViewController = UIActivityViewController(
            activityItems: data,
            applicationActivities: nil
        )

        if isPresented && uiViewController.presentedViewController == nil {
            uiViewController.present(activityViewController, animated: true)
        }

        activityViewController.completionWithItemsHandler = { (_, _, _, _) in
            isPresented = false
        }
    }
}
