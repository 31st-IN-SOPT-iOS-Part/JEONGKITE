//
//  MusicListViewController.swift
//  Seminar-3rd
//
//  Created by 양정연 on 2022/10/15.
//

import UIKit

import SnapKit
import SwiftyColor
import Moya

// MARK: - MusicListViewController

final class MusicListViewController: UIViewController {
    
    // MARK: - UI Components
    
    private lazy var musicTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .black.withAlphaComponent(0.1)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    // MARK: - Variables
    let musicProvider = MoyaProvider<MusicRouter>(plugins: [NetworkLoggerPlugin(verbose: true)])
    
    var musicList: [MusicModel] = [
        MusicModel(albumImage: "albumImage1", title: "Eleven", singer: "IVE(아이브)"),
        MusicModel(albumImage: "albumImage2", title: "After LIKE", singer: "IVE(아이브)"),
        MusicModel(albumImage: "albumImage3", title: "Attention", singer: "New Jeans"),
        MusicModel(albumImage: "albumImage4", title: "Shut Down", singer: "BLACKPINK"),
        MusicModel(albumImage: "albumImage5", title: "Hype Boy", singer: "New Jeans"),
        MusicModel(albumImage: "albumImage6", title: "LOVE DIVE", singer: "IVE(아이브)"),
        MusicModel(albumImage: "albumImage7", title: "Pink Venom", singer: "BLACKPINK"),
        MusicModel(albumImage: "albumImage8", title: "Rush Hour (feat. j-hope of ...", singer: "Crush"),
        MusicModel(albumImage: "albumImage1", title: "Monologue", singer: "테이")
    ]
    
    // MARK: - Server Helpers
    private func fetchMusicList() {
        musicProvider.request(.fetchSongs) { response in
            switch response {
            case .success(let result):
                let status = result.statusCode
                if status == 200 {
                    do {
                        let response = try result.map(FetchMusicResponseDto.self)
                        for dto in response.data {
                            self.musicList.append(dto.convertToMusic())
                        }
                        self.musicTableView.reloadData()
                    }
                    catch(let error) {
                        print(error.localizedDescription)
                    }
                }
                if status >= 400 {
                    print("error")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    // MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        register()
        layout()
        fetchMusicList()
    }
}

// MARK: - Extensions

extension MusicListViewController {
    
    // MARK: - Layout Helpers
    
    private func layout() {
        view.backgroundColor = .white
        view.addSubview(musicTableView)
        musicTableView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(70 * musicList.count)
        }
    }
    
    // MARK: - General Helpers
    
    private func register() {
        musicTableView.register(MusicTableViewCell.self,
                                forCellReuseIdentifier: MusicTableViewCell.identifier
        )
    }
}

// MARK: - UITableViewDelegate

extension MusicListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}

// MARK: - UITableViewDataSource

extension MusicListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musicList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let musicCell = tableView.dequeueReusableCell(
            withIdentifier: MusicTableViewCell.identifier, for: indexPath)
                as? MusicTableViewCell else { return UITableViewCell() }
        
        musicCell.dataBind(model: musicList[indexPath.row])
        return musicCell
    }
    
}
