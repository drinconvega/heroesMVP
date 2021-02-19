//
//  InjectManager.swift
//  HeroesMVP
//
//  Created by Daniel Rincon on 19/02/2021.
//

import Foundation
import Swinject

class InjectManager {
    static let container = Container()
    
    class func resolve<Service>(
        serviceType: Service.Type) -> Service?{
        return self.container.resolve(serviceType)
    }
    
    class func resolve<Service>(
        serviceType: Service.Type,
        name: String?) -> Service?
    {
        return self.container.resolve(serviceType, name:name)
    }
    
    class func register<Service>(
        serviceType: Service.Type,
        name: String? = nil,
        factory: @escaping (Resolver) -> Service) -> ServiceEntry<Service>
    {
        return self.container.register(serviceType, name: name, factory: factory).initCompleted({ (r, service) in })
    }
}
