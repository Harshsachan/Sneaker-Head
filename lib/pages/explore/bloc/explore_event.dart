abstract class ExplorePageEvent{}

class ExplorePageFetchProductEvent extends ExplorePageEvent{}





//class ExplorePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Explore Page'),
//       ),
//       body: BlocBuilder<ExploreBloc, ExplorePageState>(
//         builder: (context, state) {
//           if (state is ExplorePageLoadingState) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           } else if (state is ExplorePageLoadedState) {
//             return ListView.builder(
//               itemCount: state.productDetails.length,
//               itemBuilder: (context, index) {
//                 final product = state.productDetails[index];
//                 return ListTile(
//                   title: Text(product.name ?? ''),
//                   //subtitle: Text(product.description ?? ''),
//                 );
//               },
//             );
//           } else if (state is ExplorePageErrorState) {
//             return Center(
//               child: Text('Error: ${state.error}'),
//             );
//           } else {
//             return Center(
//               child: Text('Unknown state'),
//             );
//           }
//         },
//       ),
//     );
//   }
// }

// BlocBuilder<ExploreBloc, ExplorePageState>(
// builder: (context, state) {
// if (state is ExplorePageLoadingState)
// {
// return Center(child: CircularProgressIndicator(),);
// }
// else if(state is ExplorePageLoadedState)
// {
// print(("ExplorePageLoadedState"));
// List<ProductDetails> products = state.productDetails;
// return DataLoadWidget(productDetails: products);
// }
// else if(state is ExplorePageErrorState)
// {
//
// return  Center(
// child: Text("An error occurred ${state.error}"),);
// }
// else{
// return Center(
// child: Text('Unknown State '),
// );
// }
// },
// ),