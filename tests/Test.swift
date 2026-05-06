@main
struct TestRunner {
    static func main() {
        let signalcase_1 = Signal(demand: 80, capacity: 76, latency: 23, risk: 15, weight: 11)
        precondition(Policy.score(signalcase_1) == 163)
        precondition(Policy.classify(signalcase_1) == "accept")
        let signalcase_2 = Signal(demand: 79, capacity: 94, latency: 21, risk: 25, weight: 12)
        precondition(Policy.score(signalcase_2) == 146)
        precondition(Policy.classify(signalcase_2) == "review")
        let signalcase_3 = Signal(demand: 97, capacity: 100, latency: 22, risk: 15, weight: 6)
        precondition(Policy.score(signalcase_3) == 208)
        precondition(Policy.classify(signalcase_3) == "accept")
        let domainReview = DomainReview(signal: 74, slack: 46, drag: 9, confidence: 73)
        precondition(DomainReviewLens.score(domainReview) == 240)
        precondition(DomainReviewLens.lane(domainReview) == "ship")
    }
}
