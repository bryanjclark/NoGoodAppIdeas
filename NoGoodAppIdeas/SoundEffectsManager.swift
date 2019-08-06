//
//  SoundEffectsManager.swift
//  NoGoodAppIdeas
//
//  Created by Bryan Clark on 6/14/19.
//  Copyright © 2019 Bryan Clark. All rights reserved.
//

import Foundation
import AVFoundation

public enum SoundEffects: String, CaseIterable {
	case AGoodSteeringWheel
	case AGreatSteeringWheel
	case BestAtThis
	case HeAdmitIt
	case ICannotThink
	case ImSorry
	case ImToast
	case IThinkItsAGoodIdea
	case NoGoodCarIdeas
	case NoSpaceForMother
	case NowYouHaveToMarry
	case OhNice
	case ShutUpPaul
	case Stinky
	case TeachersPet
	case ThatIsAGoodIdea
	case TooSmall
	case TooSmaller
	case WhatAboutIfItsStinky
	case YourMotherInLaw
	case YouSuck
	
	fileprivate var url: URL {
		let base = "https://www.mfrederickson.com/ithinkyoushouldleave/"
		return URL(string: base)!.appendingPathComponent(self.rawValue + ".wav")
	}

	fileprivate var filename: String {
		return self.rawValue
	}

	static var validFiles: [SoundEffects] {
		return allCases.filter { 
			if let _ = Bundle.main.url(forResource: $0.rawValue, withExtension: "wav") {
				return true
			} else {
				return false
			}
		}
	}
}

public class SoundEffectsManager: NSObject {
	static let shared = SoundEffectsManager()

	var soundID: SystemSoundID = 0

	fileprivate var currentEffect: AVPlayer? = nil {
		didSet {
			oldValue?.pause()
		}
	}

	private override init() {
		super.init()
	}

	func play(soundEffect: SoundEffects) {
		do {
			try AVAudioSession.sharedInstance().setMode(.moviePlayback)
		} catch {
			print("Error setting audio playback mode: \(error)")
		}
		let url = Bundle.main.url(forResource: soundEffect.rawValue, withExtension: "wav")!
		let item = AVPlayerItem(url: url)
		let player = AVPlayer(playerItem: item)
		self.currentEffect = player
		player.play()
	}
}
