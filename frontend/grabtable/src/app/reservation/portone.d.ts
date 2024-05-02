// portone.d.ts
// 참고한 링크들
// https://github.com/junhoyeo/iamport-typings
// 공식문서
export interface RequestPayAdditionalParams {
  /**
   * ### 디지털 구분자
   * - 휴대폰 결제수단인 경우 필수 항목
   * - 결제제품이 실물이 아닌 경우 true
   * - 실물/디지털 여부에 따라 수수로율이 상이하게 측정됨
   */
  digital?: boolean
  /**
   * ### 가상계좌 입금기한
   * - 결제수단이 가상계좌인 경우 입금기한을 설정할 수 있습니다.
   * @example
   * - YYYY-MM-DD
   * - YYYYMMDD
   * - YYYY-MM-DD HH:mm:ss
   * - YYYYMMDDHHmmss
   */
  vbank_due?: string
  /**
   * ### 결제완료이후 이동될 EndPoint URL 주소
   * - 결제창이 새로운 창으로 리다이렉트 되어 결제가 진행되는 결제 방식인 경우 필수 설정 항목 입니다.
   * - 대부분의 모바일 결제환경에서 결제창 호출시 필수 항목입니다.
   * - 리다이렉트 환경에서 해당 필드 누락시 결제 결과를 수신 받지 못합니다.
   */
  m_redirect_url?: string
  /**
   * ### 모바일 앱 결제중 가맹점 앱복귀를 위한 URL scheme
   * - WebView 환경 결제시 필수설정 항목 입니다.
   * - ISP/앱카드 앱에서 결제정보인증 후 기존 앱으로 복귀할 때 사용합니다.
   */
  app_scheme?: string
  /**
   * ### 사업자등록번호
   * - 다날-가상계좌 결제수단 사용시 필수 항목
   */
  biz_num?: string
}

/**
 * Interface for Display configurations.
 *
 * @property {number[]} [card_quota] - 할부결제는 5만원 이상 결제 요청시에만 이용 가능합니다.
 *
 * @example
 * // 일시불만 결제 가능
 * { card_quota: [] }
 *
 * @example
 * // 일시불을 포함한 2, 3, 4, 5, 6개월까지 할부개월 선택 가능
 * { card_quota: [2,3,4,5,6] }
 */
export interface Display {
  card_quota?: number[]
}

// TODO: 다시 확인 필요, 공식문서에서 페이지마다 다른 정보를 알려주고있음
type PG =
  | 'html5_inicis'
  | 'inicis'
  | 'kcp'
  | 'kcp_billing'
  | 'uplus'
  | 'nice'
  | 'kicc'
  | 'bluewalnut'
  | 'kakaopay'
  | 'danal'
  | 'danal_tpay'
  | 'mobilians'
  | 'payco'
  | 'paypal'
  | 'eximbay'
  | 'naverpay'
  | 'naverco'
  | 'smilepay'
  | 'alipay'
  | 'paymentwall'
  | 'tosspay'
  | 'smartro'
  | 'settle'
  | 'settle_acc'
  | 'daou'
  | 'tosspayments'
  | 'paypal_v2'
  | 'nice_v2'
  | 'smartro_v2'
  | 'ksnet'

type PaymentMethod =
  | 'card'
  | 'trans'
  | 'vbank'
  | 'phone'
  | 'paypal'
  | 'applepay'
  | 'naverpay'
  | 'samsung'
  | 'kpay'
  | 'kakaopay'
  | 'payco'
  | 'lpay'
  | 'ssgpay'
  | 'tosspay'
  | 'cultureland'
  | 'smartculture'
  | 'happymoney'
  | 'booknlife'
  | 'point'
  | 'wechat'
  | 'alipay'
  | 'unionpay'
  | 'tenpay'

interface EscrowProduct {
  id: string
  /** 상품명 */
  name: string
  /** 상품 코드 */
  code: string
  /** 상품 단위 가격 */
  unitPrice: number
  /** 수량 */
  quantity: number
}

interface Card {
  /**
   * - 현재 KG이니시스, KCP, 토스페이먼츠, 나이스페이먼츠, KICC, 다날 6개 PG사에 대해서만 카드사 결제창 direct 호출이 가능합니다.
   * - 일부 PG사의 경우, 모든 상점아이디에 대하여 카드사 결제창 direct 노출 기능을 지원하지 않습니다. 반드시 포트원을 통해 현재 사용중인 상점아이디가 카드사 결제창 direct 호출이 가능하도록 설정이 되어있는지 PG사에 확인이 필요합니다.
   */
  direct?: {
    /** 카드사 금융결제원 표준 코드.  {@link https://chaifinance.notion.site/53589280bbc94fab938d93257d452216?v=eb405baf52134b3f90d438e3bf763630 링크} 참조 */
    code: string
    /** 할부 개월 수. 일시불일 시 0 으로 지정. */
    quota: number
  }
  detail?: {
    /** 금결원 카드사 코드 {@link https://chaifinance.notion.site/53589280bbc94fab938d93257d452216?v=eb405baf52134b3f90d438e3bf763630 링크} 참조 */
    card_code: string
    /** 해당카드 활성화 여부 */
    enabled: boolean
  }[]
}

export interface RequestPayParams extends RequestPayAdditionalParams {
  /**
   * ### PG사 구분코드
   *
   * @example
   * PG사코드.{상점ID}
   */
  pg?: string
  /**
   * ### 결제수단 구분코드
   * - PG사별 지원되는 결제수단이 모두 상이합니다.
   */
  pay_method: PaymentMethod
  /**
   * ### 에스크로 결제창 활성화 여부
   * - 일부 PG사만 지원됩니다.
   * - 에스크로 설정은 PG사와 협의 이후 진행되어야 하는점 주의하세요
   */
  escrow?: boolean
  /**
   * ### 에스크로 결제 정보
   * - 에스크로 결제(escrow: true)시에만 유효하고, 필수 값은 아닙니다.
   * - 토스페이먼츠 신모듈 (pg: tosspayments.~)시에만 유효합니다
   */
  escrowProducts?: EscrowProduct[]
  /**
   * ### 가맹점 주문번호
   * - 주문번호는 매 결제 요청시 고유하게 채번 되어야 합니다.
   * - 40Byte 이내로 작성해주세요
   * - 결제 승인완료 처리된 주문번호를 동일하게 재 설정시 사전거절 처리 됩니다.
   */
  merchant_uid: string
  /**
   * ### 결제대상 제품명
   * - 16byte 이내로 작성해주세요
   */
  name?: string
  /**
   * 결제금액
   */
  amount: number
  /**
   * ### 사용자 정의 데이타
   * - 결제 응답시 echo 로 받아보실수 있는 필드 입니다.
   * - JSON notation(string)으로 저장됩니다.
   * - 주문 건에 대해 부가정보를 저장할 공간이 필요할 때 사용합니다
   */
  custom_data?: Record<any, any>
  /**
   * ### 면세금액
   * - 결제 금액 중 면세금액에 해당하는 금액을 입력합니다.
   */
  tax_free?: number
  /**
   * ### 부가세
   * - 결제 금액 중 부가세(기본값: null)
   * - 지원되는 PG사
   *   - 나이스페이먼츠
   */
  vat_amount?: number | null
  /**
   * ### 결제통화 구분코드
   * - PayPal은 원화(KRW) 미 지원으로 USD가 기본
   * - PayPal에서 지원하는 통화는 {@link https://developer.paypal.com/docs/reports/reference/paypal-supported-currencies/ PayPal 지원 통화} 참조
   */
  currency?: string
  /** ### 결제창 언어 설정 (지원되지 않은 일부 PG사 존재) */
  language?: 'en' | 'ko'
  /** ### 주문자명 */
  buyer_name?: string
  /**
   * ### 주문자 연락처
   * - 일부 PG사에서 해당 필드 누락시 오류 발생
   */
  buyer_tel?: string
  /**
   * ### 주문자 이메일
   * - 일부 PG사에서 해당 필드 누락시 오류 발생(페이먼트월)
   */
  buyer_email?: string
  /**
   * ### 주문자 주소
   */
  buyer_addr?: string
  /**
   * ### 주문자 우편번호
   */
  buyer_postcode?: string
  /**
   * ### confirm_process 사용 시 가맹점 endpoint url 설정
   * - 기술지원 메일로 별도 요청이 필요합니다. (support@portone.io)
   */
  confirm_url?: string
  /**
   * ### 웹훅(Webhook) 수신 주소
   * - 포트원 관리자 콘솔에 설정한 웹훅 주소대신 사용할 웹훅 주소를 결제시마다 설정할 수 있습니다.
   * - 해당 값 설정시 관리자 콘솔에 설정한 주소로는 웹훅발송이 되지 않는점 유의하시기 바랍니다.
   */
  notice_url?: string | string[]
  /**
   * ### 가맹점 정의 빌링키
   * - 비인증 결제 이용시 빌링키와 1:1로 맵핑되는 가맹점 정의 고객 빌링키입니다.
   */
  customer_uid?: string
  display?: Display
  card?: Card
}

export interface RequestPayAdditionalResponse {
  /**
   * ### 신용카드 승인번호
   * - 신용카드 결제수단에 한하여 제공
   */
  apply_num?: string
  /**
   * ### 가상계좌 입금 계좌번호
   * - PG사로부터 전달된 정보 그대로 제공에 따라 숫자 외 dash(-) 또는 기타 기호가 포함되어 있을 수 있음
   */
  vbank_num?: string
  /**
   * ### 가상계좌 입금은행 명
   */
  vbank_name?: string
  /**
   * ### 가상계좌 예금주
   * - 계약된 사업자명으로 표시됨, 단, 일부 PG사의 경우 null 을 반환하므로 자체 처리 필요
   */
  vbank_holder?: string | null
  /**
   * ### 가상계좌 입금기한 (UNIX timestamp)
   */
  vbank_date?: string
}

export interface RequestPayResponse extends RequestPayAdditionalResponse {
  /**
   * ### 결제 성공여부
   * - 결제승인 혹은 가상계좌 발급이 성공한 경우, True\
   * - PG사/결제수단에 따라 imp_success로 반환됨
   */
  success?: boolean
  /**
   * ### 결제 실패코드
   * - 결제가 실패하는 경우 PG사 원천코드가 내려갑니다.
   */
  error_code?: string
  /**
   * ### 결제 실패메세지
   * - 결제가 실패하는 경우 PG사 원천메세지가 내려갑니다.
   */
  error_msg?: string
  /**
   * ### 포트원 고유 결제번호
   * - success가 false이고 사전 validation에 실패한 경우, imp_uid는 null일 수 있음
   */
  imp_uid?: string | null
  /** ### 주문번호 */
  merchant_uid: string
  /** ### 결제수단 구분코드 */
  pay_method?: PaymentMethod
  /** 결제금액 */
  paid_amount?: number
  /** 결제상태 */
  status?: string
  /** 주문자명 */
  name?: string
  /** PG사 구분코드 */
  pg_provider?: PG
  /**
   * ### 간편결제 구분코드
   * - 결제창에서 간편결제 호출시 결제 승인된 PG사 구분코드
   * - 일부 PG사 또는 간편결제로 결제가 발생되지 않은 경우 해당 파라미터는 생략됩니다.
   */
  embb_pg_provider?:
    | 'naverpay'
    | 'kakaopay'
    | 'payco'
    | 'samsungpay'
    | 'ssgpay'
    | 'lpay'
  /**
   * ### PG사 거래번호
   * - PG사에서 거래당 고유하게 부여하는 거래번호입니다.
   */
  pg_tid?: string
  /** ### 주문자명 */
  buyer_name?: string
  /** ### 주문자 이메일 */
  buyer_email?: string
  /** ### 주문자 연락처 */
  buyer_tel?: string
  /** ### 주문자 주소 */
  buyer_addr?: string
  /** ### 주문자 우편번호 */
  buyer_postcode?: string
  /** ### 가맹점 임의 지정 데이터 */
  custom_data?: string
  /** ### 결제승인시각 (UNIX timestamp) */
  paid_at?: string
  /** ### 거래 매출전표 URL */
  receipt_url?: string
}

export type RequestPayResponseCallback = (response: RequestPayResponse) => void

type PaypalUI = 'paypal-spb' | 'paypal-rt'

export interface PaypalRequestPayParams extends RequestPayParams {
  pg: string
  pay_method: 'paypal'
  /**
   * ### 국가코드
   * - 주의: 페이팔 일반결제 테스트 모드시에만 유효
   */
  country?: string
  /**
   * ### 구매자 이름 주의:
   * - 페이팔에서만 유효하며 buyer_name이 아닌 buyer_first_name과 buyer_last_name 입력을 권장
   */
  buyer_first_name?: string
  /**
   * ### 구매자 이름 주의:
   * - 페이팔에서만 유효하며 buyer_name이 아닌 buyer_first_name과 buyer_last_name 입력을 권장
   */
  buyer_last_name?: string
  /**
   * ### 결제 상품 정보
   * - 구매 상품 상세 정보를 의미하며 전달 한 값 중 name(상품 명), quantity(상품 수량), unitPrice(상품 단위 금액)만 결제창에 표기됩니다.
   * - 페이팔은 해당 파라미터 입력을 강력 권장하고 있으니, 되도록 입력해주시기 바랍니다.
   * - 각 상품의 수량 * 단위 가격의 총 합이 주문 총 금액과 반드시 일치해야합니다. 일치하지 않는 경우 에러 메시지가 리턴되면서 결제창이 호출되지 않습니다.
   */
  products?: {
    id?: string
    name?: string
    code?: string
    unitPrice?: number
    quantity?: number
    tag?: string
  }[]
  /**
   * ### 결제 통화
   * @default USD
   */
  currency?: string
}

export interface Iamport {
  init: (accountID: string) => void
  request_pay: (
    params: RequestPayParams,
    callback?: RequestPayResponseCallback,
  ) => void
  loadUI: (
    type: PaypalUI,
    params: PaypalRequestPayParams,
    callback?: RequestPayResponseCallback,
  ) => void
  updateLoadUIRequest: (type: PaypalUI, params: PaypalRequestPayParams) => void
}

declare global {
  interface Window {
    IMP?: Iamport
  }
}
