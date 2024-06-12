import { Restaurant } from '@/app/types/restaurant'
import { useEffect } from 'react'
import 'react-kakao-maps-sdk'

const KakaoMap = ({ stores }: { stores: Restaurant[] }) => {
  useEffect(() => {
    const kakaoMapScript = document.createElement('script')
    kakaoMapScript.async = false
    kakaoMapScript.src = `//dapi.kakao.com/v2/maps/sdk.js?appkey=${process.env.NEXT_PUBLIC_KAKAO_MAP_KEY}&autoload=false`
    document.head.appendChild(kakaoMapScript)

    const styleTag = document.createElement('style')
    styleTag.innerHTML = `
      .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
      .wrap * {padding: 0;margin: 0;}
      .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
      .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
      .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
      .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
      .info .close:hover {cursor: pointer;}
      .info .body {position: relative;overflow: hidden;}
      .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
      .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
      .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
      .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
      .info .img img {width: 100%; height: 100%; object-fit: cover;} /* 이미지 크기를 컴포넌트 크기에 맞춤 */
      .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
      .info .link {color: #5085BB;}
    `
    document.head.appendChild(styleTag)

    const onLoadKakaoAPI = () => {
      window.kakao.maps.load(() => {
        const container = document.getElementById('map')
        if (!container) return
        const options = {
          center: new window.kakao.maps.LatLng(37.2987099, 126.9713822),
          level: 4,
        }

        const map = new window.kakao.maps.Map(container, options)

        const markers: any[] = []
        const overlays: any[] = []

        stores.forEach((store) => {
          const markerPosition = new window.kakao.maps.LatLng(
            store.latitude,
            store.longitude,
          )
          const marker = new window.kakao.maps.Marker({
            position: markerPosition,
          })
          marker.setMap(map)
          markers.push(marker)

          const infowindowContent = `
            <div class="wrap">
              <div class="info">
                <div class="title">
                  ${store.storeName}
                  <div class="close" title="닫기"></div>
                </div>
                <div class="body">
                  <div class="img">
                    <img src="${store.storePictureUrl}" alt="No image">
                  </div>
                  <div class="desc">
                    <div class="ellipsis">${store.address}</div>
                    <div class="jibun ellipsis">${store.averageRating.toFixed(1)} ★</div>
                    <div><a href="/restaurants/${store.id}" target="_blank" class="link">자세히 보기</a></div>
                  </div>
                </div>
              </div>
            </div>`

          const overlay = new window.kakao.maps.CustomOverlay({
            content: infowindowContent,
            position: markerPosition,
          })

          overlays.push(overlay)

          window.kakao.maps.event.addListener(marker, 'click', () => {
            overlays.forEach((ov) => ov.setMap(null))
            overlay.setMap(map)
          })

          document.addEventListener('click', (e) => {
            if ((e.target as HTMLElement).matches('.close')) {
              overlay.setMap(null)
            }
          })
        })

        return () => {
          markers.forEach((marker) => marker.setMap(null))
          overlays.forEach((overlay) => overlay.setMap(null))
        }
      })
    }

    kakaoMapScript.addEventListener('load', onLoadKakaoAPI)
  }, [stores])

  return (
    <div>
      <div className="flex items-center justify-center pt-2">
        <div id="map" className="w-[95%] h-[400px]" />
        <div id="clickLating"></div>
      </div>
    </div>
  )
}

export default KakaoMap
