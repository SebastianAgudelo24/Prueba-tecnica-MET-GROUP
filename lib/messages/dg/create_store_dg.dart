part of '../messages.dart';

class _CreateStoreDg extends StatefulWidget {
  final VoidCallback onPressed;
  final TextEditingController name;

  const _CreateStoreDg({
    super.key,
    required this.onPressed,
    required this.name,
  });

  @override
  State<_CreateStoreDg> createState() => _CreateStoreDgState();
}

class _CreateStoreDgState extends State<_CreateStoreDg> {
  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context)
        .textTheme
        .bodyMedium
        ?.copyWith(fontSize: 25, fontWeight: FontWeight.w400);
    return Container(
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              contentPadding: const EdgeInsetsDirectional.all(0),
              title: Text('Creación de tienda', style: titleStyle),
              trailing: const Icon(Icons.store_mall_directory_outlined),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Form(
                child: Column(
                  children: [
                    TffGeneral(labelText: 'Nombre', controller: widget.name),
                    const SizedBox(height: 15),
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.35),
                    BtnGeneral(
                      text: 'Crear tienda',
                      fullWidth: true,
                      color: AppColors.primary,
                      onPressed: widget.onPressed,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
