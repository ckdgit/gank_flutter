class TempBeanEntity {
	List<String> category;
	bool error;
	TempBeanResults results;

	TempBeanEntity({this.category, this.error, this.results});

	TempBeanEntity.fromJson(Map<String, dynamic> json) {
		category = json['category']?.cast<String>();
		error = json['error'];
		results = json['results'] != null ? new TempBeanResults.fromJson(json['results']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['category'] = this.category;
		data['error'] = this.error;
		if (this.results != null) {
			data['results'] = this.results.toJson();
		}
		return data;
	}
}

class TempBeanResults {
	List<TempItemBeanResults> android;

	TempBeanResults({this.android});

	TempBeanResults.fromJson(Map<String, dynamic> json) {
		if (json['Android'] != null) {
			android = new List<TempItemBeanResults>();(json['Android'] as List).forEach((v) { android.add(new TempItemBeanResults.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.android != null) {
			data['Android'] =  this.android.map((v) => v.toJson()).toList();
		}
		return data;
	}
}

class TempItemBeanResults {
	String createdAt;
	List<String> images;
	String publishedAt;
	String sId;
	String source;
	bool used;
	String type;
	String url;
	String desc;
	String who;

	TempItemBeanResults({this.createdAt, this.images, this.publishedAt, this.sId, this.source, this.used, this.type, this.url, this.desc, this.who});

	TempItemBeanResults.fromJson(Map<String, dynamic> json) {
		createdAt = json['createdAt'];
		images = json['images']?.cast<String>();
		publishedAt = json['publishedAt'];
		sId = json['_id'];
		source = json['source'];
		used = json['used'];
		type = json['type'];
		url = json['url'];
		desc = json['desc'];
		who = json['who'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['createdAt'] = this.createdAt;
		data['images'] = this.images;
		data['publishedAt'] = this.publishedAt;
		data['_id'] = this.sId;
		data['source'] = this.source;
		data['used'] = this.used;
		data['type'] = this.type;
		data['url'] = this.url;
		data['desc'] = this.desc;
		data['who'] = this.who;
		return data;
	}
}
