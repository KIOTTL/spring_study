package com.sist.news;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class NewsVO {
	private String title;
	private String description;
	private String author;
	private String regdate;
}
