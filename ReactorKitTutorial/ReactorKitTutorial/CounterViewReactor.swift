//
//  CounterViewReactor.swift
//  ReactorKitTutorial
//
//  Created by yoonyeosong on 2023/11/01.
//

import Foundation
import ReactorKit

class CounterViewReactor: Reactor {
    enum Action { //사용자가 플러스 버튼 또는 마이너스 버튼을 누를경우 Reactor에 increase, decrease가 전달
        case increase
        case decrease
    }
    enum Mutation {// Action과 State의 중간다리 increase라는 Action이 들어왔을 때는 value를 1증가. ->increaseValue
        case increaseValue
        case decreaseValue
        
    }
    struct State { //현재 값을 정의하는 value
        var value: Int = 0
    }
    let initialState = State()
    
    func mutate(action: CounterViewReactor.Action) -> Observable<CounterViewReactor.Mutation> {
        switch action {
        case .increase: //increase라는 action이 들어오면 increaseValue라는 mutation의 Observable 리턴
            return Observable.just(Mutation.increaseValue)
        case .decrease:
            return Observable.just(Mutation.decreaseValue)
        }
    }
    
    func reduce(state: CounterViewReactor.State, mutation: CounterViewReactor.Mutation) -> CounterViewReactor.State {
        var newState = state
        switch mutation {
        case .increaseValue:
            newState.value += 1
        case .decreaseValue:
            newState.value -= 1
        }
        return newState
    }
}
