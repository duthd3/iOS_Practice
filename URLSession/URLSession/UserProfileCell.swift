//
//  UserProfileCell.swift
//  URLSession
//
//  Created by 픽셀로 on 2023/09/01.
//

import UIKit

class UserProfileCell: UITableViewCell {
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupView(user: User) {
        DispatchQueue.global(qos: .userInitiated).async {
            guard let imageURL = URL(string:user.picture.thumbnail) else {
                return
            }
            let request = URLRequest(url: imageURL)
            URLSession.shared.dataTask(with: request, completionHandler: {( data, response, error) in
                if let data = data, let response = response, ((response as? HTTPURLResponse)?.statusCode ?? 500) < 300, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.transition(toImage: image)
                    }
                }
            }).resume()
        }
        nameLabel.text = user.name.full
        emailLabel.text = user.email
    }
    func transition(toImage image: UIImage?){
        UIView.transition(with: self, duration: 0.3, options: [.transitionCrossDissolve], animations: {self.profileImageView.image = image}, completion: nil)
    }

}
