import { useEffect } from "react";
import "react-kakao-maps-sdk";

const KakaoMap = () => {
    useEffect(() => {
        const kakaoMapScript = document.createElement('script')
        kakaoMapScript.async = false
        kakaoMapScript.src = `//dapi.kakao.com/v2/maps/sdk.js?appkey=${process.env.NEXT_PUBLIC_KAKAO_MAP_KEY}&autoload=false`
        document.head.appendChild(kakaoMapScript)
      
        const onLoadKakaoAPI = () => {
          window.kakao.maps.load(() => {
            var container = document.getElementById('map')
            if(!container) return;
            var options = {
              center: new window.kakao.maps.LatLng(33.450701, 126.570667),
              level: 3,
            }
      
            var map = new window.kakao.maps.Map(container, options)
          })
        }
      
        kakaoMapScript.addEventListener('load', onLoadKakaoAPI)
      }, [])
    return (
        <div>
            <div className="flex items-center justify-center pt-2">
                <div id="map" className="w-[95%] h-72" />
                <div id="clickLating"></div>
            </div>
        </div>
    )
}

export default KakaoMap;