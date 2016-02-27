class ResultHashStub

  attr_reader :api_hash_result

  def initialize
    @api_hash_result =
      {:safe_search_annotation =>
        {:medical => "POSSIBLE", :violence =>
            "VERY_UNLIKELY", :spoof => "VERY_UNLIKELY", :adult => "VERY_LIKELY"
        }, :face_annotations => [
        {:tilt_angle => -5.6747785,
          :under_exposed_likelihood => "VERY_UNLIKELY", :fd_bounding_poly =>
            {
              :vertices => [
              {:y => 66, :x => 212
              },
              {:y => 66, :x => 309
              },
              {:y => 162, :x => 309
              },
              {:y => 162, :x => 212
              }]
            }, :landmarking_confidence => 0.54256278, :joy_likelihood =>
            "UNLIKELY", :detection_confidence => 0.81811, :surprise_likelihood =>
            "VERY_UNLIKELY", :anger_likelihood => "VERY_UNLIKELY",
            :headwear_likelihood => "VERY_UNLIKELY", :bounding_poly =>
            {
              :vertices => [
              {:y => 15, :x => 181
              },
              {:y => 15, :x => 319
              },
              {:y => 176, :x => 319
              },
              {:y => 176, :x => 181
              }]
            }, :pan_angle => 21.601442, :landmarks => [
            {:position =>
              {:y =>
                  92.158325, :z => 0.00041507356, :x => 247.91048
              }, :type => "LEFT_EYE"
            },
            {:position =>
              {:y => 95.865105, :z => 14.610845, :x =>
                  284.24
              }, :type => "RIGHT_EYE"
            },
            {:position =>
              {:y => 80.607, :z => -2.5638669, :x =>
                  234.99283
              }, :type => "LEFT_OF_LEFT_EYEBROW"
            },
            {:position =>
              {:y => 84.722275, :z => -4.653347, :x =>
                  262.35208
              }, :type => "RIGHT_OF_LEFT_EYEBROW"
            },
            {:position =>
              {:y => 86.8425, :z => 2.8803124, :x =>
                  281.2482
              }, :type => "LEFT_OF_RIGHT_EYEBROW"
            },
            {:position =>
              {:y => 87.784157, :z => 23.202911, :x =>
                  300.01212
              }, :type => "RIGHT_OF_RIGHT_EYEBROW"
            },
            {:position =>
              {:y => 93.327347, :z => -0.74257189, :x =>
                  271.58786
              }, :type => "MIDPOINT_BETWEEN_EYES"
            },
            {:position =>
              {:y => 121.89613, :z => -9.7575331, :x =>
                  272.08487
              }, :type => "NOSE_TIP"
            },
            {:position =>
              {:y => 134.86389, :z => 1.2005523, :x =>
                  265.13113
              }, :type => "UPPER_LIP"
            },
            {:position =>
              {:y => 145.711, :z => 5.1032391, :x =>
                  262.22424
              }, :type => "LOWER_LIP"
            },
            {:position =>
              {:y => 132.93515, :z => 6.4996686, :x =>
                  241.32828
              }, :type => "MOUTH_LEFT"
            },
            {:position =>
              {:y => 139.00401, :z => 18.114491, :x =>
                  275.54007
              }, :type => "MOUTH_RIGHT"
            },
            {:position =>
              {:y => 139.32642, :z => 4.637207, :x =>
                  263.2186
              }, :type => "MOUTH_CENTER"
            },
            {:position =>
              {:y => 123.55997, :z => 10.26918, :x =>
                  276.53827
              }, :type => "NOSE_BOTTOM_RIGHT"
            },
            {:position =>
              {:y => 121.06685, :z => 1.5411681, :x =>
                  256.73715
              }, :type => "NOSE_BOTTOM_LEFT"
            },
            {:position =>
              {:y => 127.45449, :z => 0.13932635, :x =>
                  267.49707
              }, :type => "NOSE_BOTTOM_CENTER"
            },
            {:position =>
              {:y => 89.913605, :z => -2.8806689, :x =>
                  249.3102
              }, :type => "LEFT_EYE_TOP_BOUNDARY"
            },
            {:position =>
              {:y => 93.544769, :z => 3.4420719, :x =>
                  257.01355
              }, :type => "LEFT_EYE_RIGHT_CORNER"
            },
            {:position =>
              {:y => 94.753471, :z => -0.046903312, :x =>
                  247.54877
              }, :type => "LEFT_EYE_BOTTOM_BOUNDARY"
            },
            {:position =>
              {:y => 91.094345, :z => 0.55011082, :x =>
                  238.81487
              }, :type => "LEFT_EYE_LEFT_CORNER"
            },
            {:position =>
              {:y => 92.459457, :z => -1.2200928, :x =>
                  247.72058
              }, :type => "LEFT_EYE_PUPIL"
            },
            {:position =>
              {:y => 94.214386, :z => 12.550914, :x =>
                  288.2327
              }, :type => "RIGHT_EYE_TOP_BOUNDARY"
            },
            {:position =>
              {:y => 97.126755, :z => 22.092098, :x =>
                  293.21048
              }, :type => "RIGHT_EYE_RIGHT_CORNER"
            },
            {:position =>
              {:y => 99.567993, :z => 15.348606, :x =>
                  285.91495
              }, :type => "RIGHT_EYE_BOTTOM_BOUNDARY"
            },
            {:position =>
              {:y => 96.592667, :z => 12.590128, :x =>
                  278.9971
              }, :type => "RIGHT_EYE_LEFT_CORNER"
            },
            {:position =>
              {:y => 96.920578, :z => 14.648366, :x =>
                  287.66995
              }, :type => "RIGHT_EYE_PUPIL"
            },
            {:position =>
              {:y => 78.016655, :z => -6.7624264, :x =>
                  250.26114
              }, :type => "LEFT_EYEBROW_UPPER_MIDPOINT"
            },
            {:position =>
              {:y => 82.696075, :z => 9.9695559, :x =>
                  292.5242
              }, :type => "RIGHT_EYEBROW_UPPER_MIDPOINT"
            },
            {:position =>
              {:y => 102.3996, :z => 40.218388, :x =>
                  202.1022
              }, :type => "LEFT_EAR_TRAGION"
            },
            {:position =>
              {:y => 112.2905, :z => 75.182877, :x =>
                  290.25772
              }, :type => "RIGHT_EAR_TRAGION"
            },
            {:position =>
              {:y => 85.515747, :z => -2.4461775, :x =>
                  272.49033
              }, :type => "FOREHEAD_GLABELLA"
            },
            {:position =>
              {:y => 165.34473, :z => 12.695765, :x =>
                  257.7327
              }, :type => "CHIN_GNATHION"
            },
            {:position =>
              {:y => 133.05925, :z => 28.48736, :x =>
                  210.18437
              }, :type => "CHIN_LEFT_GONION"
            },
            {:position =>
              {:y => 140.82602, :z => 59.486729, :x =>
                  288.02194
              }, :type => "CHIN_RIGHT_GONION"
            }], :blurred_likelihood => "VERY_UNLIKELY", :roll_angle =>
            8.5247707, :sorrow_likelihood => "VERY_UNLIKELY"
        }]
      }
  end
end
