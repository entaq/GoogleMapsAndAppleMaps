import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {
    @IBOutlet weak var googleMapView: GMSMapView!
    @IBOutlet weak var appleMapView: MKMapView!
    
    var manager : CLLocationManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager = CLLocationManager()
        manager?.requestAlwaysAuthorization()
        
        var googleCamera = GMSCameraPosition.cameraWithLatitude(-33.86,
            longitude: 151.20, zoom: 12)
        googleMapView.camera = googleCamera
        googleMapView.myLocationEnabled = true
        googleMapView.settings.myLocationButton = true
        
        var marker = GMSMarker()
        marker.position = CLLocationCoordinate2DMake(-33.86, 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = googleMapView
        
        appleMapView.setCenterCoordinate(CLLocationCoordinate2DMake(
            -33.86, 151.20), animated: true)
        
        var appleCamera = MKMapCamera(lookingAtCenterCoordinate: CLLocationCoordinate2DMake(
            -33.86, 151.20), fromEyeCoordinate: CLLocationCoordinate2DMake(
                -33.86, 151.20), eyeAltitude: 30000)!
        
        var point = MKPointAnnotation()
        point.coordinate = CLLocationCoordinate2DMake(-33.86, 151.20)
        point.title = "Sydney";
        point.subtitle = "Australia";
        appleMapView.showsUserLocation = true
        appleMapView.addAnnotation(point)
//        appleMapView.setCamera(appleCamera, animated: true)
    }

}

