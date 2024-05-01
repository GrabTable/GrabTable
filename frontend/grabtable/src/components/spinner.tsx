import React from 'react';

function Spinner() {
  return (
    <div className="spinner-overlay">
      <div className="spinner"></div>

      <style jsx>{`
        .spinner-overlay {
          position: fixed;
          top: 0;
          left: 0;
          width: 100%;
          height: 100%;
          display: flex;
          justify-content: center; /* 가로 중앙 정렬 */
          align-items: center; /* 세로 중앙 정렬 */
          background-color: rgba(255, 255, 255, 0.5); /* 흐린 배경 */
          z-index: 1000; /* 화면 최상단에 표시 */
        }

        .spinner {
          border: 4px solid rgba(0, 0, 0, 0.1);
          width: 36px;
          height: 36px;
          border-radius: 50%;
          border-top-color: #09f;
          animation: spin 1s ease infinite;
        }

        @keyframes spin {
          0% {
            transform: rotate(0deg);
          }
          100% {
            transform: rotate(360deg);
          }
        }
      `}</style>
    </div>
  );
}

export default Spinner;
