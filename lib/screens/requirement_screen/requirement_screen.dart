// ignore_for_file: unused_import, avoid_print, use_super_parameters
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lilac_infotech/core/models/vendor_model/vendor_model.dart';
import 'package:lilac_infotech/screens/bottom_bar/bottom_bar.dart';
import 'package:provider/provider.dart';
import 'package:lilac_infotech/core/colors/colors.dart';
import 'package:lilac_infotech/core/widgets/my_button/my_button.dart';
import 'package:lilac_infotech/provider/vendor_provider/vendor_provider.dart';
import 'package:lilac_infotech/screens/requirement_screen/car_or_bike_screen.dart';
import 'package:lilac_infotech/screens/vehicle_requirment/vehicle_requirment.dart';

class RequirementScreen extends StatefulWidget {
  const RequirementScreen({super.key});

  @override
  State<RequirementScreen> createState() => _RequirementScreenState();
}

class _RequirementScreenState extends State<RequirementScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<VendorProvider>(context, listen: false).getAllPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: white,
        leading: InkWell(
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return const BottomBarScreen();
            }));
          },
          child: const Image(image: AssetImage('assets/images/arrow-left.png')),
        ),
        title: Padding(
          padding: EdgeInsets.only(left: 45.w),
          child: Text(
            'Requirement List',
            style: TextStyle(
              color: black,
              fontFamily: 'Poppins',
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Consumer<VendorProvider>(
        builder: (context, vendorProvider, child) {
          if (vendorProvider.isloading) {
            return const Center(
              child: CircularProgressIndicator(
                color: maroon,
                strokeAlign: -5,
              ),
            );
          }

          final vendorData = vendorProvider.vendorModel.data;

          if (vendorData == null || vendorData.isEmpty) {
            return Center(
              child: Text(
                'No requirements available',
                style: TextStyle(
                  color: black,
                  fontFamily: 'Poppins',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }

          return Column(
            children: [
              Expanded(
                child: RefreshIndicator(
                  onRefresh: _refresh,
                  color: maroon,
                  backgroundColor: white,
                  child: ListView.builder(
                    itemCount: vendorData.length,
                    itemBuilder: (context, index) {
                      final data = vendorData[index];
                      return RequirementItem(data: data);
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: MyButton(
                  name: '+ Create A Requirement',
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const VehicleRequirment();
                    }));
                  },
                ),
              ),
              SizedBox(height: 15.h),
            ],
          );
        },
      ),
    );
  }

  Future<void> _refresh() async {
    await Provider.of<VendorProvider>(context, listen: false).getAllPosts();
  }
}

class RequirementItem extends StatefulWidget {
  final Data data;

  const RequirementItem({Key? key, required this.data}) : super(key: key);

  @override
  State<RequirementItem> createState() => _RequirementItemState();
}

class _RequirementItemState extends State<RequirementItem> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    final data = widget.data;

    return Center(
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20.h),
            width: 330.w,
            height: 110.h,
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(10.sp),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 10.h,
                    left: 10.w,
                    right: 10.w,
                    bottom: 3.h,
                  ),
                  child: Text(
                    '${data.brand?.name ?? 'Unknown'} ${data.vehicleModel?.name ?? ''} (${data.year ?? 'N/A'})',
                    style: TextStyle(
                      color: black,
                      fontFamily: 'Poppins',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                _buildRow(
                    'Transmission', data.transmission?.name ?? 'Automatic'),
                _buildRow('Fuel', data.fuelType?.name ?? 'Petrol'),
                _buildRow('Color', data.vehicleColor?.name ?? 'Black'),
                Padding(
                  padding: EdgeInsets.only(left: 10.w, top: 1.h),
                  child: Text(
                    'Active',
                    // data.status ?? 'Inactive',
                    style: TextStyle(
                      color: black,
                      // data.status == 'Active' ? Colors.green : Colors.red,
                      fontFamily: 'Poppins',
                      fontSize: 11.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 275.w,
            bottom: 0.h,
            child: Transform.scale(
              scale: 0.6.sp,
              child: Switch(
                value: isSwitched,
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                  });
                },
                activeColor: Colors.white,
                activeTrackColor: maroon,
                inactiveThumbColor: Colors.grey,
                inactiveTrackColor: Colors.grey[300],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 3.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: const Color(0xff6F6C7A),
              fontFamily: 'Poppins',
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: black,
              fontFamily: 'Poppins',
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
