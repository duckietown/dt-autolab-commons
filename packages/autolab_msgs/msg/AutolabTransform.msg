# origin and target reference frames of this transformation
AutolabReferenceFrame       origin
AutolabReferenceFrame       target

# `is_fixed`: indicates transformations that are rigid and are not observed
# `is_static`: indicates transformations that are rigid but observed, so noisy
bool                        is_fixed
bool                        is_static

# `transform` is the transformation you would apply to a point to transform it
# from the `target` to the `origin` reference frames.
geometry_msgs/Transform     transform
float64                       variance

# NOTE: when one of `is_static` or `is_fixed` is set to `True`, the value of the field
#       `time` in both `origin` and `target` above should:
#           - not be set by publishers;
#           - ignored by subscribers;