
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        image,
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                mainTitle,
                style: text16.copyWith(fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                subTitle,
                style: text14.copyWith(color: Colors.grey),
              ),
              SizedBox(
                height: 15,
              ),
              bottomWidget,
            ],
          ),
        )
      ],
    );
  }
}