//
//  AtomicVariable.swift
//  iMindLib
//
//  Created by Peter Kovacs on 2017. 02. 14..
//  Copyright © 2017. iMind. All rights reserved.
//

import Foundation

/// Atomic (synchronized) variable access
/// - warning: The class shares one queue for synchronizing in every instance,
///     so don't access an atomic variable from another's atomically sync closure.
final class AtomicVariable<A> {
    let queue = DispatchQueue(label: "AtomicVariable")
    
    private var atomicValue: A
    
    /// Get the current value of the variable.
    var value: A {
        return queue.sync {
            return atomicValue
        }
    }
    
    /// Create an AtomicVariable
    /// - parameter value: the initial value.
    init(_ value: A) {
        atomicValue = value
    }
    
    /// Get an atomic (synchronized) closure with the variable as a parameter
    /// - parameter sync: the closure with the variable as a parameter.
    /// - example: increase an int variable by one
    ///
    /// `x.atomically { value in value += 1 }`
    func atomically<T>(_ sync: @escaping (inout A) -> (T)) -> T {
        return queue.sync {
            return sync(&self.atomicValue)
        }
    }
}
