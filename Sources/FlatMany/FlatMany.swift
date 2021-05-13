import Combine

public extension Publisher where Output: Sequence {
    func flatMany<MappedOutput>(
        map: @escaping (Output.Element) -> AnyPublisher<MappedOutput, Failure>
    ) -> AnyPublisher<[MappedOutput], Failure> {
        flatMap { data in
            Publishers.MergeMany(
                data.map(map)
            )
            .collect()
        }
        .eraseToAnyPublisher()
    }
    
    func flatMany<MappedOutput>(
        compactMap: @escaping (Output.Element) -> AnyPublisher<MappedOutput, Failure>?
    ) -> AnyPublisher<[MappedOutput], Failure> {
        flatMap { data in
            Publishers.MergeMany(
                data.compactMap(compactMap)
            )
            .collect()
        }
        .eraseToAnyPublisher()
    }
}

