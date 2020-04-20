
### AVFoundation Framework
- AVAudioPlayer Class 

***
#### 핵심 키워드
1. **에셋 카탈로그(Asset Catalog)**
    - 프로젝트를 생성하면 **Asstes.xcassets** 폴더가 자동생성 됨
    - 애플리케이션 리소스에 쉽게 접근할 수 있도록 도와줌(이미지, 음악파일 등)
    - [참고사이트](https://help.apple.com/xcode/mac/current/#/dev10510b1f7)
    
    - 에셋 카탈로그(Asset Catalog)의 3가지의 콘텐츠 타입
        1. **Folders**: 다른 그룹 폴더나 에셋 폴더를 포함할 수 있으며, 폴더 이름에 해당 에셋타입의 확장자가 자동으로 붙음
        2. **JSON Files**: .json 확장자 파일로, 속성에 대한 정보를 포함하고 있음
        3. **Content files**: 콘텐츠 파일은 리소스 파일을 나타냄
    
    ##### 에셋(폴더)의 이름은 반드시 고유해야 함
    
    - 에셋 카탈로그(Asset Catalog) 타입

    | **폴더 타입**      | **확장자**    | **설명**                           |
    | :---------------- | :----------- | :--------------------------------- |
    | App Icon Type     | .appiconset  | 애플리케이션의 아이콘                |
    | Catalog Type      | .xcassets    | 에셋 카탈로그의 최상위 폴더          |
    | Image Set Type    | .imageset    | 객체들이 사용하는 이미지             |
    | Data Set Type     | .dataset     | 애플리케이션에서 사용하는 데이터 파일 |
    | Launch Image Type | .launchimage | 애플리케이션의 실행화면 이미지       |
    
        1. App Icon Type: 다양한 크기와 해상도의 아이콘 원본 이미지
        2. Catalog Type: 한 개의 에셋 카탈로그에 하나만 존재 할 수 있음
        3. Image Set Type: UIImage, NSImage의 인스턴스에 사용되는 이미지 파일
        4. Data Set Type: 장치 실행 가능 코드(device-executable code)를 제외한 생성된 모든 종류의 데이터를 포함하는 파일들의 집합
        5. Launch Image Type: iOS 8.0 버전 이상은 기본적으로 실행화면 스토리보드(launch screen storyboard)를 사용(iOS 7.0 이하만 필요)
        
2. **앱 시닝(App Thinning)**
    - 애플리케이션이 디바이스에 설치될 때 앱스토어와 운영체제가 그 디바이스의 특성에 맞게 설치하도록 하는 **설치 최적화 기술**을 의미함
    - 앱의 설치 용량을 최소화하고 다운로드 속도를 향상 시킬 수 있음
    - 기술 구성요소: 슬라이싱(slicing), 비트코드(bitcode), 주문형 리소스(on-demand resource)
    

3. **앱 슬라이싱(App Slicing)**
    - 애플리케이션이 지원하는 다양한 디바이스에 대한 여러 조각의 애플리케이션 번들(app bundle)을 생성하고 **디바이스에 알맞은 조각을 전달하는 기술**
    - 사용자가 애플리케이션을 설치 할 때 전체 버전이 아닌 슬라싱(slicing)된 조각들 중 적합한 조각으로 다운로드 되어 설치됨
    - 에셋 카탈로그에서 관리하는 이미지들은 자동으로 적용이 됨
    
4. **iTunes Connect**
    - 개발자가 앱 스토어에 판매할 애플리케이션을 제출하고 관리할 수 있도록 도와주는 웹 기반 도구
    
* [애플 공식문서 - Asset Catalogs](https://help.apple.com/xcode/mac/current/#/dev10510b1f7)
* [애플 공식문서 - Types Reference](https://developer.apple.com/library/archive/documentation/Xcode/Reference/xcode_ref-Asset_Catalog_Format/AssetTypes.html)


***
###### 참조&강의내용: [커넥트재단](https://www.edwith.org/boostcamp_ios/)
***
