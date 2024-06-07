import { useEffect } from "react";
import "react-kakao-maps-sdk";

type Restaurant = {
  address: string;
  averageRating: number;
  category: string;
  id: number;
  storeName: string;
  storePictureUrl: string;
  latitude: number;
  longitude: number;
};

const KakaoMap = ({ stores }: { stores: Restaurant[] }) => {
  useEffect(() => {
    const kakaoMapScript = document.createElement("script");
    kakaoMapScript.async = false;
    kakaoMapScript.src = `//dapi.kakao.com/v2/maps/sdk.js?appkey=${process.env.NEXT_PUBLIC_KAKAO_MAP_KEY}&autoload=false`;
    document.head.appendChild(kakaoMapScript);

    
    const onLoadKakaoAPI = () => {
      window.kakao.maps.load(() => {
        var container = document.getElementById("map");
        if (!container) return;
        var options = {
          center: new window.kakao.maps.LatLng(37.2987099, 126.9713822),
          level: 4,
        };

        var map = new window.kakao.maps.Map(container, options);

        let markers: any[] = [];
        let overlays: any[] = [];

        stores.forEach((store) => {
          const markerPosition = new window.kakao.maps.LatLng(
            store.latitude,
            store.longitude
          );
          const marker = new window.kakao.maps.Marker({
            position: markerPosition,
          });
          marker.setMap(map);
          markers.push(marker);

          const infowindowContent = `
            <div class="wrap">
              <div class="info">
                <div class="title">
                  ${store.storeName}
                  <div class="close" title="닫기"></div>
                </div>
                <div class="body">
                  <div class="img">
                    <img src="${store.storePictureUrl}" width="50" height="50" alt="No image">
                  </div>
                  <div class="desc">
                    <div class="ellipsis">${store.address}</div>
                    <div class="jibun ellipsis">${store.averageRating.toFixed(1)} ★</div>
                    <div><a href="/restaurants/${store.id}" target="_blank" class="link">자세히 보기</a></div>
                  </div>
                </div>
              </div>
            </div>`;

          const overlay = new window.kakao.maps.CustomOverlay({
            content: infowindowContent,
            position: markerPosition
          });

          overlays.push(overlay);

          window.kakao.maps.event.addListener(marker, "click", () => {
            overlays.forEach(ov => ov.setMap(null));
            overlay.setMap(map);
          });

          document.addEventListener('click', (e) => {
            if ((e.target as HTMLElement).matches('.close')) {
              overlay.setMap(null);
            }
          });
        });

        return () => {
          markers.forEach((marker) => marker.setMap(null));
          overlays.forEach((overlay) => overlay.setMap(null));
        };
      });
    };

    kakaoMapScript.addEventListener("load", onLoadKakaoAPI);
  }, [stores]);

  return (
    <div>
      <div className="flex items-center justify-center pt-2">
        <div id="map" className="w-[95%] h-[400px]" />
        <div id="clickLating"></div>
      </div>
    </div>
  );
};

export default KakaoMap;