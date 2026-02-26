// Vibe coded by co-pilot
// Linear_extrude breaks FreeCAD when imported, so instead unfold into 
// polyhedrons for generating solids from points
//
// Robust prism() module for OpenSCAD
// - auto-corrects polygon winding
// - generates manifold polyhedron
//
// prism(points, height)
// Robust polyhedron-based prism generator for OpenSCAD.
// - No sum()
// - No reverse()
// - Auto-corrects polygon winding
// - Produces manifold geometry
//

module prism(points, height, center=false) {

    // Compute signed area manually (shoelace formula)
    function signed_area(pts, i = 0, acc = 0) =
        i == len(pts)
        ? acc / 2
        : let(
            j = (i + 1) % len(pts),
            term = pts[i][0] * pts[j][1] - pts[j][0] * pts[i][1]
        )
        signed_area(pts, i + 1, acc + term);

    // Ensure CCW winding
    ccw = signed_area(points) > 0;
    pts = ccw ? points : [ for (i = [len(points)-1 : -1 : 0]) points[i] ];

    n = len(pts);

    // Build bottom and top vertices
    bottom = [ for (p = pts) [p[0], p[1], 0] ];
    top    = [ for (p = pts) [p[0], p[1], height] ];

    verts = concat(bottom, top);

    // Bottom face (CCW)
    bottom_face = [ for (i = [0 : n-1]) i ];

    // Top face (CCW when viewed from above)
    top_face = [ for (i = [0 : n-1]) (2*n - 1 - i) ];

    // Side faces (quads)
    side_faces = [
        for (i = [0 : n-1]) [
            i,
            (i+1) % n,
            n + (i+1) % n,
            n + i
        ]
    ];
    if(center) translate([0,0,-height/2])
    polyhedron(
        points = verts,
        faces = concat(
            [bottom_face],
            [top_face],
            side_faces
        )
    );
    else 
    polyhedron(
        points = verts,
        faces = concat(
            [bottom_face],
            [top_face],
            side_faces
        )
    );
}