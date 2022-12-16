Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E3464EA1C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 16 Dec 2022 12:18:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p68jC-0005aL-1c;
	Fri, 16 Dec 2022 11:18:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhuqiandann@gmail.com>) id 1p68it-0005Ya-MG
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Dec 2022 11:17:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Npm0qC2z5bK4IeTsFeJwXcTQn9mcTYSVK3FkIJ19lwU=; b=DQCWv+Afnp7bYb4SzdIrutqrtB
 hWjDijBG/T+pFpvOmkWobvfGo4ur1I41u96ck9zQCSj+/Xbkl//oFm62D4vPJQeFvalTP39udzL5S
 MF5x7Bota2PtuE/EMBMsGuShJOzV9yM5ryPNJHVM/u0JsZLx4wlmUhrva7n+S61qXDrQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Npm0qC2z5bK4IeTsFeJwXcTQn9mcTYSVK3FkIJ19lwU=; b=Hf5Mc8acb0xpKg7mjhzI0f2lkk
 dKrLptESkiFbjiVqk3mwWm3CNBlU/ngPwcSlRL0TPwXJsmvP+ab8ZWJ+0VhYWeEo0tU7wYNCQL96Q
 eEzMyewcxFfVpAvLq/jziE8jH9NcfHXJZ8iEAN1l3WL3FgohAxSrCHGtmSRSycVIODmo=;
Received: from mail-lf1-f67.google.com ([209.85.167.67])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1p68il-0003j8-2D for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Dec 2022 11:17:49 +0000
Received: by mail-lf1-f67.google.com with SMTP id q6so2958301lfm.10
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 16 Dec 2022 03:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Npm0qC2z5bK4IeTsFeJwXcTQn9mcTYSVK3FkIJ19lwU=;
 b=eACeL1KczoRwXedhzceBIrHn5CjgkwVZtysnkyPS+niPeZ2PpO5TTe6XL9unxRzVZi
 yZ6jhvp+nmI8VYl+67ypRuzdsuu5Wj+VbLeBuhDr4iz+uYuhVDmzJdw//LGI5LK+kC1P
 L6nIHbCBxU5fnLP0uBzTFsg9XOCH/kD/fFfgR8RM+eNhtfkRIalmkNvB+Qm3pAYfwSQE
 mGhpnKWPxrcYedaxcsTSwE7YrI9tjQ4naUa+1BZuJ2GK5LtXyse4XGZyh6UvpdQc/AwY
 CXI1iv4c+gTHWFQa+bLln+wtPcZzC9FAXnWpQl7ahRpodDvY0No7udMkiyBDw2EWzPla
 ebMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Npm0qC2z5bK4IeTsFeJwXcTQn9mcTYSVK3FkIJ19lwU=;
 b=4wrNq+LfwAf/c91ZU3fVsVmb3RjFBEBgmDZqWQmwLP0IMPMQCXsCx0Y6WmzU8nOY16
 eYA+iueesgI0j7+J4XiEB/tn5TObTZd6Bn0UC7c16pdE93iiRZIRWpaIWtfIfSexoM55
 lqkREPXO2vMaDl54vIKr1kx/Ha81MB6YaeB3MCKeyweDUO8y1gZBHxoK3TkqFcyrKz1P
 7PmoHHBvqH6ruPCJ4cjOsy7J8S5IFWWrw/aizqnkoNdZ0Ib1H6AU4xgbHSoysICwaRfc
 AVddP/oRnQf9HNbiNTThNC5ekcEjro6+rX3hjDa4Epi/chfcJSo5N53LOCKfeg7roALh
 S6Qg==
X-Gm-Message-State: ANoB5pnCzkaKSEtagrUdmgTJ0abwSuC/I2bj3je+TQWv3rs93+tWJE7Y
 igVzQMZvjPHtZnlonOSXvS/l81lYSwtF9L9VQ7A=
X-Google-Smtp-Source: AA0mqf6WqqEOXvWoWNeXWZzJXj45PepuDgvEoOgs9zdHLw7wJg8K/kVdDGQz641m9vutM4VCYYc7iaQ3BYKAZkkntLg=
X-Received: by 2002:a05:6512:2a8d:b0:4b5:6639:a64a with SMTP id
 dt13-20020a0565122a8d00b004b56639a64amr9598178lfb.438.1671189456350; Fri, 16
 Dec 2022 03:17:36 -0800 (PST)
MIME-Version: 1.0
References: <20221208050808.2448146-1-zhoudan8@xiaomi.com>
 <Y5OYYJYx9G2LbRmc@google.com>
 <20221212122109.GA714122@mi-ThinkStation-K> <Y5ezpOwd8sOTTaW5@google.com>
 <20221213022100.GA841758@mi-ThinkStation-K>
In-Reply-To: <20221213022100.GA841758@mi-ThinkStation-K>
From: zhou dan <zhuqiandann@gmail.com>
Date: Fri, 16 Dec 2022 19:17:24 +0800
Message-ID: <CAHDnOD7W0eo-ZMU8nXsPhXrxbpR3U+kooTVaTU8VL67QHbYH3A@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, about this patch, I haven't received any reply recently.
    Maybe you have some new ideas to solve this problem? zhoudan 于2022年12月13日周二
    10:21写道： > > However, 'f2fs_compressed_file()' only determines whether
    the file can > be compressed, not whether the file has been compressed. As
    far as I > [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.167.67 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.167.67 listed in wl.mailspike.net]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [zhuqiandann[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
X-Headers-End: 1p68il-0003j8-2D
Subject: Re: [f2fs-dev] [PATCH] f2fs: don't set FI_COMPRESS_RELEASED if file
 is not compressed
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
Cc: zhoudan8@xiaomi.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGksIGFib3V0IHRoaXMgcGF0Y2gsIEkgaGF2ZW4ndCByZWNlaXZlZCBhbnkgcmVwbHkgcmVjZW50
bHkuCk1heWJlIHlvdSBoYXZlIHNvbWUgbmV3IGlkZWFzIHRvIHNvbHZlIHRoaXMgcHJvYmxlbT8K
Cgp6aG91ZGFuIDx6aHVxaWFuZGFubkBnbWFpbC5jb20+IOS6jjIwMjLlubQxMuaciDEz5pel5ZGo
5LqMIDEwOjIx5YaZ6YGT77yaCj4KPiBIb3dldmVyLCAnZjJmc19jb21wcmVzc2VkX2ZpbGUoKScg
b25seSBkZXRlcm1pbmVzIHdoZXRoZXIgdGhlIGZpbGUgY2FuCj4gYmUgY29tcHJlc3NlZCwgbm90
IHdoZXRoZXIgdGhlIGZpbGUgaGFzIGJlZW4gY29tcHJlc3NlZC4gQXMgZmFyIGFzIEkKPiBrbm93
LCB3aGVuIGNvbXByZXNzX21vZGUgaXMgdXNlciwgZmlsZXMgbWFya2VkIEZJX0NPTVBSRVNTRURf
RklMRQo+IHdpbGwgYmUgY29tcHJlc3NlZCBvbmx5IGFmdGVyICdmMmZzX2lvY19jb21wcmVzc19m
aWxlKCknIGlzIGNhbGxlZC4KPiBPbiBNb24sIERlYyAxMiwgMjAyMiBhdCAwMzowNTowOFBNIC0w
ODAwLCBKYWVnZXVrIEtpbSB3cm90ZToKPiA+IE9uIDEyLzEyLCB6aG91ZGFuIHdyb3RlOgo+ID4g
PiBNYXliZSBJJ20gbm90IGRlc2NyaWJpbmcgaXQgY2xlYXJseSBlbm91Z2gsIGJ1dCBJIHRoaW5r
IHRoZXJlIGlzCj4gPiA+IHNvbWV0aGluZyB3cm9uZyB3aXRoIHRoZSBsb2dpYyBoZXJlLlRoZSAn
ZjJmc19yZWxlYXNlX2NvbXByZXNzX2Jsb2NrcycKPiA+ID4gbWV0aG9kIGRvZXMgbm90IGRldGVy
bWluZSBpZiB0aGUgZmlsZSBpcyBjb21wcmVzc2VkLCBidXQgc2ltcGx5IGFkZHMKPiA+ID4gdGhl
IEZJX0NPTVBSRVNTX1JFTEVBU0VEIGZsYWcuCj4gPgo+ID4gSSBmaXJzdGx5IGxvc3QgeW91ciBw
b2ludCBzaW5jZSBmMmZzX3JlbGVhc2VfY29tcHJlc3NfYmxvY2tzKCkgY2hlY2tlZAo+ID4gZjJm
c19jb21wcmVzc2VkX2ZpbGUoKS4KPiA+Cj4gPiA+IEluIHBhcnRpY3VsYXIsIGluIHRoZSBjdXJy
ZW50IEFuZHJvaWQgc3lzdGVtLCB3aGVuIHRoZSBhcHBsaWNhdGlvbiBpcwo+ID4gPiBpbnN0YWxs
ZWQsIHRoZSByZWxlYXNlIGludGVyZmFjZSBpcyBjYWxsZWQgYnkgZGVmYXVsdCB0byByZWxlYXNl
IHRoZQo+ID4gPiBzdG9yYWdlIG1hcmtlZCBhcyBjb21wcmVzc2VkLCAgd2l0aG91dCBjaGVja2lu
ZyB3aGV0aGVyIHRoZSBmaWxlIGlzCj4gPiA+IGFjdHVhbGx5IGNvbXByZXNzZWQuIEluIHRoaXMg
Y2FzZSwgd2hlbiBjb21wcmVzc19tb2RlIGlzIHNldCB0byB1c2VyLAo+ID4gPiBjYWxsaW5nIHRo
ZSBjb21wcmVzcyBpbnRlcmZhY2UgcmV0dXJucyBFTlZBTCBhbmQgdGhlIGZpbGUgY2Fubm90IGJl
Cj4gPiA+IGNvbXByZXNzZWQuCj4gPiA+IFNvIEkgdGhpbmsgdGhlIGltcGxlbWVudGF0aW9uIG9m
IHJlbGVhc2UgbmVlZHMgdG8gYmUgbW9kaWZpZWQsIGFuZAo+ID4gPiBvbmx5IHNldCBGSV9DT01Q
UkVTU19SRUxFQVNFRCB3aGVuIGl0J3MgcmVhbGx5IGNvbXByZXNzZWQgYW5kIHRoZQo+ID4gPiBz
dG9yYWdlIGlzIHJlbGVhc2VkLgo+ID4gPgo+ID4gPiBPbiBGcmksIERlYyAwOSwgMjAyMiBhdCAx
MjoxOTo0NFBNIC0wODAwLCBKYWVnZXVrIEtpbSB3cm90ZToKPiA+ID4gPiBPbiAxMi8wOCwgemhv
dWRhbjggd3JvdGU6Cj4gPiA+ID4gPiBJbiBjb21wcmVzc19tb2RlPXVzZXIsIGYyZnNfcmVsZWFz
ZV9jb21wcmVzc19ibG9ja3MoKQo+ID4gPiA+ID4gIGRvZXMgbm90IHZlcmlmeSB3aGV0aGVyIGl0
IGhhcyBiZWVuIGNvbXByZXNzZWQgYW5kCj4gPiA+ID4gPiAgc2V0cyBGSV9DT01QUkVTU19SRUxF
QVNFRCBkaXJlY3RseS4gd2hpY2ggd2lsbCBsZWFkIHRvCj4gPiA+ID4gPiByZXR1cm4gLUVJTlZB
TCBhZnRlciBjYWxsaW5nIGNvbXByZXNzLgo+ID4gPiA+ID4gVG8gZml4IGl0LGxldCdzIGRvIG5v
dCBzZXQgRklfQ09NUFJFU1NfUkVMRUFTRUQgaWYgZmlsZQo+ID4gPiA+ID4gaXMgbm90IGNvbXBy
ZXNzZWQuCj4gPiA+ID4KPiA+ID4gPiBEbyB5b3UgbWVhbiB5b3Ugd2FudCB0byBhdm9pZCBFSU5W
QUwgb24gYSBmaWxlIGhhdmluZyBGSV9DT01QUkVTU19SRUxFQVNFRAo+ID4gPiA+IHdpdGggemVy
byBpX2NvbXByX2Jsb2tjcz8KPiA+ID4gPgo+ID4gPiA+IEkgdGhpbmsgdGhlIGN1cnJlbnQgbG9n
aWMgaXMgZ2l2aW5nIHRoZSBlcnJvciBvbiBhIHJlbGVhc2VkIGZpbGUgYWxyZWFkeS4KPiA+ID4g
Pgo+ID4gPiA+ID4KPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IHpob3VkYW44IDx6aG91ZGFuOEB4
aWFvbWkuY29tPgo+ID4gPiA+ID4gLS0tCj4gPiA+ID4gPiAgZnMvZjJmcy9maWxlLmMgfCAzICst
LQo+ID4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMo
LSkKPiA+ID4gPiA+Cj4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9maWxlLmMgYi9mcy9m
MmZzL2ZpbGUuYwo+ID4gPiA+ID4gaW5kZXggODJjZGExMjU4MjI3Li5mMzI5MTAwNzdkZjYgMTAw
NjQ0Cj4gPiA+ID4gPiAtLS0gYS9mcy9mMmZzL2ZpbGUuYwo+ID4gPiA+ID4gKysrIGIvZnMvZjJm
cy9maWxlLmMKPiA+ID4gPiA+IEBAIC0zNDUxLDE0ICszNDUxLDEzIEBAIHN0YXRpYyBpbnQgZjJm
c19yZWxlYXNlX2NvbXByZXNzX2Jsb2NrcyhzdHJ1Y3QgZmlsZSAqZmlscCwgdW5zaWduZWQgbG9u
ZyBhcmcpCj4gPiA+ID4gPiAgICAgICAgIHJldCA9IGZpbGVtYXBfd3JpdGVfYW5kX3dhaXRfcmFu
Z2UoaW5vZGUtPmlfbWFwcGluZywgMCwgTExPTkdfTUFYKTsKPiA+ID4gPiA+ICAgICAgICAgaWYg
KHJldCkKPiA+ID4gPiA+ICAgICAgICAgICAgICAgICBnb3RvIG91dDsKPiA+ID4gPiA+IC0KPiA+
ID4gPiA+IC0gICAgICAgc2V0X2lub2RlX2ZsYWcoaW5vZGUsIEZJX0NPTVBSRVNTX1JFTEVBU0VE
KTsKPiA+ID4gPiA+ICAgICAgICAgaW5vZGUtPmlfY3RpbWUgPSBjdXJyZW50X3RpbWUoaW5vZGUp
Owo+ID4gPiA+ID4gICAgICAgICBmMmZzX21hcmtfaW5vZGVfZGlydHlfc3luYyhpbm9kZSwgdHJ1
ZSk7Cj4gPiA+ID4gPgo+ID4gPiA+ID4gICAgICAgICBpZiAoIWF0b21pY19yZWFkKCZGMkZTX0ko
aW5vZGUpLT5pX2NvbXByX2Jsb2NrcykpCj4gPiA+ID4gPiAgICAgICAgICAgICAgICAgZ290byBv
dXQ7Cj4gPiA+ID4gPgo+ID4gPiA+ID4gKyAgICAgICBzZXRfaW5vZGVfZmxhZyhpbm9kZSwgRklf
Q09NUFJFU1NfUkVMRUFTRUQpOwo+ID4gPiA+ID4gICAgICAgICBmMmZzX2Rvd25fd3JpdGUoJkYy
RlNfSShpbm9kZSktPmlfZ2NfcndzZW1bV1JJVEVdKTsKPiA+ID4gPiA+ICAgICAgICAgZmlsZW1h
cF9pbnZhbGlkYXRlX2xvY2soaW5vZGUtPmlfbWFwcGluZyk7Cj4gPiA+ID4gPgo+ID4gPiA+ID4g
LS0KPiA+ID4gPiA+IDIuMzguMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2
ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xp
c3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
