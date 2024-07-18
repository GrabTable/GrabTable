<p align="middle">
    <img src="frontend/grabtable/public/big-icon.svg">
</p>
<p align="middle">
<img src="frontend/grabtable/public/grabtable-logo.png"
        width=150 height=150>
</p>
<h1 align="middle">GrabTable</h1>
<p align="middle">
당신의 귀한 시간을 위한 식당 공유주문 및 예약 서비스, GrabTable</p>

## 프로젝트 소개

사용자는 음식 선택, 주문, 결제, 예약을 모두 GrabTable에서 진행할 수 있습니다!

예약 생성 시 초대 코드가 발급되며, 해당 코드를 통해 다른 사용자를 예약에 초대하고 함께 주문할 수 있습니다.

## 프로젝트 아키텍처

<p align="middle">
    <img src="frontend/grabtable/public/service-architecture.png">
</p>

## 프로젝트 기술 스택

<p align="middle">
    <img src="frontend/grabtable/public/tech-stack.png">
</p>

## 팀원

|                              Backend & Frontend                               |                                Backend & Infra                                |                                    Frontend                                    |                               Frontend & Infra                                |                                    Backend                                     |
| :---------------------------------------------------------------------------: | :---------------------------------------------------------------------------: | :----------------------------------------------------------------------------: | :---------------------------------------------------------------------------: | :----------------------------------------------------------------------------: |
| <img src="https://avatars.githubusercontent.com/u/85350805?v=4" width=400px/> | <img src="https://avatars.githubusercontent.com/u/60565169?v=4" width=400px/> | <img src="https://avatars.githubusercontent.com/u/109865133?v=4" width=400px/> | <img src="https://avatars.githubusercontent.com/u/62930375?v=4" width=400px/> | <img src="https://avatars.githubusercontent.com/u/102043957?v=4" width=400px/> |
|                       [영섭](https://github.com/000sub)                       |                      [찬영](https://github.com/jcy0308)                       |                       [형진](https://github.com/gitFILO)                       |                       [성현](https://github.com/goo314)                       |                      [진수](https://github.com/jinsu868)                       |

## 팀 문화

- 주 1회 오프라인으로 만나 밥을 먹고 개발 진행 상황을 공유합니다~!

- 시간 약속을 준수합니다.

```
- 10분 늦을 때마다 저녁 1회 사기! 🥳
```

- 모르는 것을 배우고 서로 공유하며 성장하는 데 중점을 두고 있습니다.

```
- 질문을 두려워하지 말아요~~~✋
- 팀원의 질문에 성심껏 대답해주고 귀찮아하거나 이것도 모르니? 구박하지 않습니다. 설명하는 것도 실력이야.
```

- 열정을 중시하는 문화입니다.

```
- 침묵만 하지 않습니다.
- 자유롭게 이슈를 올리고 작업하는 문화입니다. 누가 시켜야 하지 않아요~~~
```

## 프로젝트 진행도 & 방향성

- 현재 grabtable은 다음의 기능을 가지고 있습니다.

```
- 식당 예약 참여자들이 실시간 더치페이를 할 수 있습니다.
    - SSE를 활용해 실시간 갱신 상태를 모든 참여자에게 전달합니다.
    - pubsub 모델로 다중 WAS 환경에서 안정적인 실시간 서비스를 구성했습니다.
- Oauth2 + JWT를 통한 인증/인가 처리를 할 수 있습니다.
    - 현재 카카오 소셜 로그인 기능을 제공합니다.
    - 성능 향상을 위한 별도의 캐시 서버를 도입했습니다.
- 제3자 결제 서비스를 활용하여 카카오페이 테스트 결제 기능을 제공합니다.
- 부하 테스트 시스템 및 모니터링 시스템을 제공합니다.
```

- 앞으로의 계획은 이렇습니다.

```
- 기능 추가
    - 식당 관리 서비스 (식당 예약 서비스와 상호작용 가능)
    - 알림 서비스 (SSE 활용)
    - 쿠폰 서비스 (Kafka를 활용한 동시성 보장)
- 마이크로서비스 아키텍처 도입
    - 트래픽이 높은 서비스 단위를 별도의 서버로 분리
    - 기존 모놀리식 아키텍처와 성능 비교
- 플랫폼 확장
    - 안드로이드, iOS, 웹앱
    - 플랫폼별 최적화된 UI/UX 제공
```
