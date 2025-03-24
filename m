Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7FBA6D298
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Mar 2025 01:47:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1twVyY-0007ot-5T;
	Mon, 24 Mar 2025 00:47:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nzzhao.sigma@gmail.com>) id 1twVyX-0007on-9s
 for Linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Mar 2025 00:47:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vQQKvP5R8luVRxbpNB9L+v+/4SSjmK/Mdr0BaGbE3hk=; b=Z4TtfOzimQTCnIRxhMM3HK9i/M
 RYdyBgU3jPoiFaIjSspKw2rMANyxK9Vt0MCQSIr2Z7s5qjJGx4lOqffCf4peqTwxmyayKglQ5IB2v
 ErvSgrN99I61ShGGk9LmR8edEGnxVUatkC9j1uq4B0eUEqbrEoeWaH0xPv+wwB+vp8kQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vQQKvP5R8luVRxbpNB9L+v+/4SSjmK/Mdr0BaGbE3hk=; b=mabKMdb+7qm9tJAgbU27oB2X15
 iuPUE7C7VH/90r5Bj6JuMb49kcWrZITisRZl796jB4YxXXI4bcV4ogd2x7GchAlgCCHoNGC0fKG1M
 QiwmDyb2XCKz0IJwnhmGnR4VwmYU423dhVeRaDKqM/RdLObCAhXmDfoRpAqjhldMnl40=;
Received: from mail-oa1-f67.google.com ([209.85.160.67])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1twVyR-0000CS-KI for Linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Mar 2025 00:47:33 +0000
Received: by mail-oa1-f67.google.com with SMTP id
 586e51a60fabf-2c12f9e9449so2016072fac.3
 for <Linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 23 Mar 2025 17:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742777237; x=1743382037; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vQQKvP5R8luVRxbpNB9L+v+/4SSjmK/Mdr0BaGbE3hk=;
 b=QH88YiWTWxr5XnU9c+S1pPDSy0Y3FGuTUmkqZXmQIR82bQqa6fI0qVnHGx+Fe8FLMa
 Ab0izhd7SplLgHEanL2yxLIze73rdM0TY7DgYx5YPOTAkwda2KWn6Gg5/jnwAqopqYA1
 lYcx5UAxVb39QX1PuWha+6UlH3+zvB5T9N80/sY+ABwNf9+ZeHhgcB2a9HXBDYdVsxBw
 l2HhRCzW1sz7DgOLLie7M5HxhzDwcRL9NbWpqIcPOuOqcQ0sJQSQJGGykArJAQpBzsnR
 Pa7BjYT0xkY1SrfAYFNrxsDlpfL+9xQPn5IlxhaD+LqN22ZCSLU9GUT+7TuzenWCBKJf
 TPug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742777237; x=1743382037;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vQQKvP5R8luVRxbpNB9L+v+/4SSjmK/Mdr0BaGbE3hk=;
 b=RWcmTYnn95kzL95t3vGo5jfbeD6DV2yoYr3b9yyAkuEoWMngtZCeofVJu/O2SofSZU
 O3DNGqaa+Wfk0fAjYDK25dgTpkmFBtfg12d9esNnix2kKaUq1a3RAd8GdnYxZ9UTfbHU
 9OZ+tAJugdPrW82A5eyxjlKg5ehmUCxrJy+4fJk0984WxOze3EvdFLbsv1WliuG+dS1O
 n8oGEwu9ud4CNRwRmkgeGGrK+ue+1S35cnmgQPUnzGKw7mNvSqpUBzQp0TGLaoVapPwc
 i9DiCYdnQsH9JWWH7MPD44ZzgoTs612ip9ZlBDkYYnfDPdXeZiVsQzBRFgzmSpRCfBr/
 7wng==
X-Gm-Message-State: AOJu0Yzj/wzghh5EIZn4cmqtCyXkiX2VZTJjjJTGpzNDB0ewTSfJRJMO
 5MeH5L1upd7dMAanb5o36pbFxW2UxOun0KqMZDDyO1aoUkgeoZ6tKAJSRQInjSk9BbXIYoQGlgk
 unNV6v8VCf87pOXFJZBrktNQGR7Ln1HwEKeWBtA==
X-Gm-Gg: ASbGncthqpWyJp7XTfWVXmLKh3XtIgp0CO/FnLixzPGqcijB8rhMjEWBl6BWHDgaj+t
 /Sx8ad1LFUY8Um72Fb9DUsuoKEELAbf8/knEWVolKWE1nD8DMDmAhnCNEo/OO+AZfoHF/RF+ztR
 UdJ9O80p6Em9qv0YW+EqDeGFUxJ/Y=
X-Google-Smtp-Source: AGHT+IHdn10GojP/SGSwOE4gTYXWjJduJ0jsS/ILcnm3mSJx+6n722jMETSN07CQDbzJqgqEmo2kgSUhRH4oNrrezsQ=
X-Received: by 2002:a05:6871:107:b0:2bc:9787:affe with SMTP id
 586e51a60fabf-2c78028974bmr6718394fac.10.1742777236756; Sun, 23 Mar 2025
 17:47:16 -0700 (PDT)
MIME-Version: 1.0
References: <CAMLCH1FEuoDxFFQ8HuUdBDMfzsyaS2LWyVh+eyGCpgxnKGa7rA@mail.gmail.com>
 <Z-Aai24gPXWQp8qi@casper.infradead.org>
In-Reply-To: <Z-Aai24gPXWQp8qi@casper.infradead.org>
From: Nanzhe Zhao <nzzhao.sigma@gmail.com>
Date: Mon, 24 Mar 2025 08:47:05 +0800
X-Gm-Features: AQ5f1Jo6dtgYXcwlTLKzS5eo5IWJmlCDJRYikRcngGTd0FIUnv2lA3JssssPxR4
Message-ID: <CAMLCH1HsT+AVZSXAh8Q7Zr9C3SzaegfMdE6fzKp0X0FDt9JSbA@mail.gmail.com>
To: Matthew Wilcox <willy@infradead.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Thank you very much for your prompt and insightful reply!
 I truly appreciate you taking the time to address my question so quickly.
 I understand now. It seems the kernel's flusher threads are indeed sufficient
 for handling dirty page writeback effectively. And I realize that they
 ultimately call `do_writepages` to execute the file [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [nzzhao.sigma[at]gmail.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.160.67 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.160.67 listed in sa-accredit.habeas.com]
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.67 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.160.67 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1twVyR-0000CS-KI
Subject: Re: [f2fs-dev] Inquiry regarding plans on vmscan pageout supporting
 fs writepages
X-BeenThere: linux-f2fs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-f2fs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=linux-f2fs-devel>
List-Post: <mailto:linux-f2fs-devel@lists.sourceforge.net>
List-Help: <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=subscribe>
Cc: Linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

VGhhbmsgeW91IHZlcnkgbXVjaCBmb3IgeW91ciBwcm9tcHQgYW5kIGluc2lnaHRmdWwgcmVwbHkh
IEkgdHJ1bHkKYXBwcmVjaWF0ZSB5b3UgdGFraW5nIHRoZSB0aW1lIHRvIGFkZHJlc3MgbXkgcXVl
c3Rpb24gc28gcXVpY2tseS4KCkkgdW5kZXJzdGFuZCBub3cuIEl0IHNlZW1zIHRoZSBrZXJuZWwn
cyBmbHVzaGVyIHRocmVhZHMgYXJlIGluZGVlZApzdWZmaWNpZW50IGZvciBoYW5kbGluZyBkaXJ0
eSBwYWdlIHdyaXRlYmFjayBlZmZlY3RpdmVseS4gQW5kIEkKcmVhbGl6ZSB0aGF0IHRoZXkgdWx0
aW1hdGVseSBjYWxsIGBkb193cml0ZXBhZ2VzYCB0byBleGVjdXRlIHRoZSBmaWxlCnN5c3RlbSdz
IHNwZWNpZmljIGB3cml0ZXBhZ2VzYCBpbXBsZW1lbnRhdGlvbi4gIEl0J3MgYWxzbyBjbGVhciB0
aGF0CnRoZSBzY2VuYXJpbyB3aGVyZSBga3N3YXBkYCBpbml0aWF0ZXMgZGlydHkgcGFnZSB3cml0
ZWJhY2sgaXMKcmVsYXRpdmVseSBpbmZyZXF1ZW50LgoKS25vd2luZyB0aGF0IHRoZSBGMkZTIGNv
bW11bml0eSBpcyBjdXJyZW50bHkgaGVhdmlseSBpbnZlc3RlZCBpbiB0aGUKZm9saW8gc3VwcG9y
dCBlZmZvcnQsIEkgd2FudGVkIHRvIGFsc28gYnJpbmcgdXAgc29tZSBvYnNlcnZhdGlvbnMgYW5k
CnF1ZXN0aW9ucyByZWdhcmRpbmcgZm9saW8gc3VwcG9ydCBpbiBGMkZTIGdhcmJhZ2UgY29sbGVj
dGlvbi4KU3BlY2lmaWNhbGx5LCBJJ20gY29uY2VybmVkIGFib3V0IHRoZSBjaGFsbGVuZ2Ugb2Yg
YWxsb2NhdGluZwpoaWdoLW9yZGVyIGZvbGlvcyBkdWUgdG8gbm9uLWNvbnRpZ3VvdXMgaW5kZXgg
cmFuZ2VzIGR1cmluZyB0aGUgR0MKcHJvY2Vzcy4gSSd2ZSBpbml0aWF0ZWQgYSBkaXNjdXNzaW9u
IGFib3V0IHRoaXMgaXNzdWUgb24gdGhlIGYyZnMKbWFpbGluZyBsaXN0IGluIGFuIGVtYWlsCnRo
cmVhZC5baHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtZjJmcy1kZXZlbC9DQU1MQ0gxRjhu
aXozcWlmdTlwdDZDM3lMaG9uYWREPWZlYVB0V0toQ2FSRDhGUEpoUmdAbWFpbC5nbWFpbC5jb20v
VC8jdV0KSSB3b3VsZCBiZSBncmF0ZWZ1bCBpZiB5b3UgYW5kIG90aGVyIGRldmVsb3BlcnMgY291
bGQgdGFrZSBhIGxvb2sgYW5kCnNoYXJlIHlvdXIgdGhvdWdodHMuCgpCZXN0IHJlZ2FyZHMsCgpN
YXR0aGV3IFdpbGNveCA8d2lsbHlAaW5mcmFkZWFkLm9yZz4g5LqOMjAyNeW5tDPmnIgyM+aXpeWR
qOaXpSAyMjoyOOWGmemBk++8mgo+Cj4gT24gU3VuLCBNYXIgMjMsIDIwMjUgYXQgMDc6MzQ6NTlQ
TSArMDgwMCwgTmFuemhlIFpoYW8gd3JvdGU6Cj4gPiBJJ3ZlIHJlY2VudGx5IGJlZW4gc3R1ZHlp
bmcgeW91ciBwYXRjaCAnZjJmczogUmVtb3ZlIHVzZXMgb2YKPiA+IHdyaXRlcGFnZScuICBJIHVu
ZGVyc3RhbmQgdGhlIHJhdGlvbmFsZSBiZWhpbmQgaXQsIGVzcGVjaWFsbHkgd2l0aCB0aGUKPiA+
IHBhZ2UgY2FjaGUgYW5kIGZpbGUgSS9PIGluY3JlYXNpbmdseSBhZG9wdGluZyBmb2xpb3MgaW4g
cGxhY2Ugb2YgdGhlCj4gPiB0cmFkaXRpb25hbCBwYWdlIHN0cnVjdHVyZS4gVGhpcyB0cmVuZCBp
bmRlZWQgcmVuZGVycyB0aGUgbGVnYWN5Cj4gPiBgd3JpdGVwYWdlYCBmdW5jdGlvbiBpbiBmaWxl
IHN5c3RlbXMgbm90IG9ubHkgdW5uZWNlc3NhcnkgYnV0Cj4gPiBwb3RlbnRpYWxseSBkZXRyaW1l
bnRhbC4gIFRoaXMgaXMgcGFydGljdWxhcmx5IHRydWUgZm9yIGZpbGUgc3lzdGVtcwo+ID4gbGlr
ZSBGMkZTLCB3aGljaCwgYXMgeW91IGtub3csIGhhcyBhbHJlYWR5IGZ1bGx5IGltcGxlbWVudGVk
IHRoZQo+ID4gYHdyaXRlcGFnZXNgIGZ1bmN0aW9uIGZvciBhbGwgaXRzIGBhZGRyZXNzX3NwYWNl
X29wZXJhdGlvbnNgLgo+ID4KPiA+IEhvd2V2ZXIsIGFzIHlvdSd2ZSBwb2ludGVkIG91dCwgdGhl
IGBwYWdlb3V0YCBmdW5jdGlvbiB3aXRoaW4gdm1zY2FuLAo+ID4gd2hpY2ggYGtzd2FwZGAgdXNl
cyBmb3IgZGlydHkgcGFnZSB3cml0ZWJhY2ssIGRvZXNuJ3QgY3VycmVudGx5Cj4gPiBzdXBwb3J0
IGNhbGxpbmcgdGhlIGZpbGUgc3lzdGVtJ3MKPiA+IGBhZGRyZXNzX3NwYWNlX29wZXJhdGlvbnMt
PndyaXRlcGFnZXNgLiAgSSB3YXMgd29uZGVyaW5nIGlmIHlvdSBoYXZlCj4gPiBhbnkgcGxhbnMg
dG8gaW1wcm92ZSB0aGlzIHNpdHVhdGlvbiwgYW5kIGlmIHNvLCBjb3VsZCB5b3UgcGVyaGFwcwo+
ID4gc2hhcmUgc29tZSBpbnNpZ2h0cyBpbnRvIHRoZSBnZW5lcmFsIGRpcmVjdGlvbiBvciBhcHBy
b2FjaCB5b3UgbWlnaHQKPiA+IGJlIGNvbnNpZGVyaW5nPwo+Cj4gY29tbWl0IDIxYjRlZTcwMjlj
OQo+IEF1dGhvcjogRGF2ZSBDaGlubmVyIDxkY2hpbm5lckByZWRoYXQuY29tPgo+IERhdGU6ICAg
VHVlIEF1ZyAxMCAxODozMzo0MSAyMDIxIC0wNzAwCj4KPiAgICAgeGZzOiBkcm9wIC0+d3JpdGVw
YWdlIGNvbXBsZXRlbHkKPgo+ICAgICAtPndyaXRlcGFnZSBpcyBvbmx5IHVzZWQgaW4gb25lIHBs
YWNlIC0gc2luZ2xlIHBhZ2Ugd3JpdGViYWNrIGZyb20KPiAgICAgbWVtb3J5IHJlY2xhaW0uIFdl
IG9ubHkgYWxsb3cgc3VjaCB3cml0ZWJhY2sgZnJvbSBrc3dhcGQsIG5vdCBmcm9tCj4gICAgIGRp
cmVjdCBtZW1vcnkgcmVjbGFpbSwgYW5kIHNvIGl0IGlzIHJhcmVseSB1c2VkLiBXaGVuIGl0IGNv
bWVzIGZyb20KPiAgICAga3N3YXBkLCBpdCBpcyBlZmZlY3RpdmVseSByYW5kb20gZGlydHkgcGFn
ZSBzaG9vdC1kb3duLCB3aGljaCBpcwo+ICAgICBob3JyaWJsZSBmb3IgSU8gcGF0dGVybnMuIFdl
IHdpbGwgYWxyZWFkeSBoYXZlIGJhY2tncm91bmQgd3JpdGViYWNrCj4gICAgIHRyeWluZyB0byBj
bGVhbiBhbGwgdGhlIGRpcnR5IHBhZ2VzIGluIG1lbW9yeSBhcyBlZmZpY2llbnRseSBhcwo+ICAg
ICBwb3NzaWJsZSwgc28gaGF2aW5nIGtzd2FwZCBpbnRlcnJ1cHQgb3VyIHdlbGwgZm9ybWVkIElP
IHN0cmVhbSBvbmx5Cj4gICAgIHNsb3dzIHRoaW5ncyBkb3duLiBTbyBnZXQgcmlkIG9mIHhmc192
bV93cml0ZXBhZ2UoKSBjb21wbGV0ZWx5Lgo+Cj4gICAgIFNpZ25lZC1vZmYtYnk6IERhdmUgQ2hp
bm5lciA8ZGNoaW5uZXJAcmVkaGF0LmNvbT4KPiAgICAgW2Rqd29uZzogZm9yd2FyZCBwb3J0IHRv
IDUuMTVdCj4gICAgIFJldmlld2VkLWJ5OiBEYXJyaWNrIEouIFdvbmcgPGRqd29uZ0BrZXJuZWwu
b3JnPgo+ICAgICBTaWduZWQtb2ZmLWJ5OiBEYXJyaWNrIEouIFdvbmcgPGRqd29uZ0BrZXJuZWwu
b3JnPgo+Cj4KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1mc2RldmVsLzIwMTgxMTA5
MTUxMjM5LkdEOTE1M0BpbmZyYWRlYWQub3JnLwo+Cj4gVGhlcmUncyBwcm9iYWJseSBzb21lIG90
aGVyIGdvb2QgZG9jdW1lbnRhdGlvbiBhcm91bmQgd2h5IHdlJ3JlIGRvaW5nCj4gdGhpcywgYnV0
IHRoaXMgaXMgYWxsIEkgaGF2ZSBoYW5keS4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1m
MmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdl
Lm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
