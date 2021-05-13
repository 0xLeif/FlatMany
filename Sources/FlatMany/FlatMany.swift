import Combine

public extension Publisher where Output: Sequence {
    func flatMany<MappedOutput: Sequence>(
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
}
