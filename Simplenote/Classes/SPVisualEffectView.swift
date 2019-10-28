import Foundation
import UIKit


// MARK: - UIVisualEffectView: Reacts automatically to UserInterfaceStyle Changes
//
@objc
class SPVisualEffectView: UIVisualEffectView {

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    init() {
        super.init(effect: UIBlurEffect.simplenoteBlurEffect)
        startListeningToNotifications()
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


// MARK: - Private Methods
//
private extension SPVisualEffectView {

    /// Starts listening to Theme Notifications
    ///
    func startListeningToNotifications() {
        // No need to do this in iOS +13
        if #available(iOS 13, *) {
            return
        }

        let nc = NotificationCenter.default
        nc.addObserver(self, selector: #selector(refreshStyle), name: .VSThemeManagerThemeDidChange, object: nil)
    }

    /// Updates the VisualEffect Style
    ///
    @objc
    func refreshStyle() {
        effect = UIBlurEffect.simplenoteBlurEffect
    }
}
