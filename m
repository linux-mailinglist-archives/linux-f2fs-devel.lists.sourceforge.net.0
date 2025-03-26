Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E234A7151D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 Mar 2025 11:52:27 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1txOMu-0004sQ-1T;
	Wed, 26 Mar 2025 10:52:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1txOMs-0004sK-LX
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Mar 2025 10:52:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KUiJ39e9rjS2bB3JIWPFSpS7Z7JQ7PGJYyhz9hoeqh8=; b=cVLyd4ckJU06k+eKQv1ZWqLSw3
 NTZsULOWDUVO5rpArSPdOj8LED4XOl1JwOEn5GwI3lF5avZD8sUwRSSj/iG3l5VOgjTfIGOHQxM9d
 F+C5chNVcayA6BE2H9pjuCOJsFycpc7XR9OzBxgpfaCF0wwwhU94GfyF5P4B2H5wl8Ns=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KUiJ39e9rjS2bB3JIWPFSpS7Z7JQ7PGJYyhz9hoeqh8=; b=Ukdcp3IuzFNPTJVnZjuirWi5ZG
 lwmOnGxumBFVFw9fDQ2tp49kJXTtAPn3eNnOk9SM2WA5wvNYHj9LAg7Y34SUtRw7920q/B2iy5gjW
 QhGN2WeZbpXtQJSh6ERXiyt8EyoJhgkfiYpKkyS01n1A/bdmUO+ZA4NaG+BV/P9m5z9U=;
Received: from mail-wm1-f41.google.com ([209.85.128.41])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1txOMn-0000Ve-CI for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Mar 2025 10:52:19 +0000
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-43cf7c2c351so3610895e9.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 26 Mar 2025 03:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742986322; x=1743591122; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KUiJ39e9rjS2bB3JIWPFSpS7Z7JQ7PGJYyhz9hoeqh8=;
 b=jl0J/LzsKxtd6j1vE+n8fBsT3Qomi0F5eY/UpmVc2ex97QxyHZ/ZHN/rcY4+RHDTT7
 L+1IrQo3olrDr85GaArnZfkBwdKy352i2ssFW4+1plQwdPNCO3ZtGx1SQi9vjn9T/7xy
 ncpf1Rxfhf6P/X9+bPSbFJo/6g+lddjNWKxgq1gUtd0roZz3UvqxGoDJH33UCMS2hF69
 r1Cd8V6qC24dvk03MjK+DCAIpw7LXI6Sn1xNH/YfnUaNBBfBrAqn0A1KoSrKarPuL5UI
 /36YTC6QTMHOqrcQdjWvZ6oYFQ0hTSnXdUVLtRz3c1cu5NfeeMi0dVivkRXhgwMZ+4df
 MpKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742986322; x=1743591122;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KUiJ39e9rjS2bB3JIWPFSpS7Z7JQ7PGJYyhz9hoeqh8=;
 b=wcruY/hnRf6y1slMzT31Sg0azMbOgLxsR3XM0L82w6PUF5WdR62X5VQoEmJm4NHVTm
 pHy7rP+v8p0gpoNo7OsdOgQ6GsblI98cu8R7Un4BOQQc0U+zTo9N0tFWdTNQeVxl2ytc
 BE4ym/M+AM5eug+r/S3F7S+xUweFP5ojrTV13zTMhrxoNo5Gb1LkKfqLU3bG3Sf08l5E
 tBbGXNmKQ1whfeWYTcVSQoQEwtE3rzgzrlNMDKJa3Wzot0DUBScluK5BCS7/i92gjfEy
 GY0D8lQdFS6ffWmq3rCzNu6cUd/upWhxkoM7h/YBKmJ0daXJYkEsZwBrOv6BqGlwaaB6
 BoEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUt00hTFS7RSJbTnUf+i+j5RCKttsoMEcatw6wRbrTrGeu01ncVY44RY6mCKa9WHH4f1h1CBVRbbE/HSsTGvCj9@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxNv6T5NE6nxUE1SIRc8KUua/okLDNbo7JsjAn7QsePbOShhY7g
 Hb1sRWeCB2hdXPU9jmnzpu11BaG5elMMIKtmEXZyWS+qONtdji2pN5SRXogcnrQR8VASHSxh3C7
 SVKDOBK/g1p706XYYbz2VwehTfzc=
X-Gm-Gg: ASbGncuEw4eri+gAyjTmHkjJxf3c0e2gNlpQ0UI7neawkfTa9YKxYBNdSxDWJZTZXsT
 0tME/RZ2Qcmz59VkxBldq5UE7eQ1RBesyo3EUrYy7MhoXboN8OUSdb7zvmVrPD7NFIlev601e6w
 PSrfyBGZL345D4J/httizQy6qXbKA=
X-Google-Smtp-Source: AGHT+IHvKYFrqGOaDXxYEwwFVrmnAAfI2Ac4I6FgReAxx3WGv0wMQQ4aPo7xkXF6L+B8JiFrf/klaBgj4vK++v/TIZI=
X-Received: by 2002:a05:600c:4448:b0:439:a30f:2e49 with SMTP id
 5b1f17b1804b1-43d6fcd0f23mr24454315e9.5.1742986321514; Wed, 26 Mar 2025
 03:52:01 -0700 (PDT)
MIME-Version: 1.0
References: <1742978761-16264-1-git-send-email-zhiguo.niu@unisoc.com>
 <e4fb11ea-a97b-4ba0-aa28-f6f93e5a6134@kernel.org>
In-Reply-To: <e4fb11ea-a97b-4ba0-aa28-f6f93e5a6134@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Wed, 26 Mar 2025 18:51:49 +0800
X-Gm-Features: AQ5f1JqKX6cSDt9h78JSWvel5VEJL_MOqY8616rTktHLRZ9xdX5kgNh_fTSxbb4
Message-ID: <CAHJ8P3JWABsntymD3u5=0YR7=0it5x0PP49S4ftwBEjC1UreOA@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Chao Yu 于2025年3月26日周三 17:26写道： > > On 3/26/25
    16:46, Zhiguo Niu wrote: > > Commit fccaa81de87e ("f2fs: prevent atomic file
    from being dirtied before commit") > > adds the processin [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.128.41 listed in list.dnswl.org]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [niuzhiguo84[at]gmail.com]
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.128.41 listed in sa-accredit.habeas.com]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.128.41 listed in bl.score.senderscore.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [niuzhiguo84[at]gmail.com]
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.128.41 listed in wl.mailspike.net]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
X-Headers-End: 1txOMn-0000Ve-CI
Subject: Re: [f2fs-dev] [RFC PATCH] f2fs: remove some redundant flow about
 FI_ATOMIC_DIRTIED
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
Cc: daehojeong@google.com, ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Zhiguo Niu <zhiguo.niu@unisoc.com>,
 jaegeuk@kernel.org, Hao_hao.Wang@unisoc.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Q2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiDkuo4yMDI15bm0M+aciDI25pel5ZGo5LiJIDE3OjI2
5YaZ6YGT77yaCj4KPiBPbiAzLzI2LzI1IDE2OjQ2LCBaaGlndW8gTml1IHdyb3RlOgo+ID4gQ29t
bWl0IGZjY2FhODFkZTg3ZSAoImYyZnM6IHByZXZlbnQgYXRvbWljIGZpbGUgZnJvbSBiZWluZyBk
aXJ0aWVkIGJlZm9yZSBjb21taXQiKQo+ID4gYWRkcyB0aGUgcHJvY2Vzc2luZyBvZiBGSV9BVE9N
SUNfRElSVElFRCBpbiB0aGUgZm9sbG93aW5nIHR3byBwb3NpdGlvbnMsCj4gPiBbMV0KPiA+IGYy
ZnNfY29tbWl0X2F0b21pY193cml0ZQo+ID4gIC0gX19mMmZzX2NvbW1pdF9hdG9taWNfd3JpdGUK
PiA+ICAgLSBzYmktPmNvbW1pdHRlZF9hdG9taWNfYmxvY2sgKz0gZmktPmF0b21pY193cml0ZV9j
bnQ7Cj4gPiAgIC0gc2V0X2lub2RlX2ZsYWcoaW5vZGUsIEZJX0FUT01JQ19DT01NSVRURUQpOwo+
ID4gICAtIGlmIChpc19pbm9kZV9mbGFnX3NldChpbm9kZSwgRklfQVRPTUlDX0RJUlRJRUQpKSB7
Cj4gPiAgIC0gICAgY2xlYXJfaW5vZGVfZmxhZyhpbm9kZSwgRklfQVRPTUlDX0RJUlRJRUQpOwo+
ID4gICAtICAgIGYyZnNfbWFya19pbm9kZV9kaXJ0eV9zeW5jKGlub2RlLCB0cnVlKTsKPiA+ICAg
LSB9Cj4gPiBbMl0KPiA+IGYyZnNfYWJvcnRfYXRvbWljX3dyaXRlCj4gPiAgIC0gaWYgKGlzX2lu
b2RlX2ZsYWdfc2V0KGlub2RlLCBGSV9BVE9NSUNfRElSVElFRCkpIHsKPiA+ICAgLSAgICBjbGVh
cl9pbm9kZV9mbGFnKGlub2RlLCBGSV9BVE9NSUNfRElSVElFRCk7Cj4gPiAgIC0gICAgZjJmc19t
YXJrX2lub2RlX2RpcnR5X3N5bmMoaW5vZGUsIHRydWUpOwo+ID4gICAtIH0KPiA+Cj4gPiBidXQg
WzFdIHNlZW1zIHRvIGJlIHJlZHVuZGFudDoKPiA+IFRoZSBhdG9taWMgZmlsZSBmbGFnIEZJX0FU
T01JQ19GSUxFIGlzIHN0aWxsIHNldCBoZXJlLCBzbyBmMmZzX21hcmtfaW5vZGVfZGlydHlfc3lu
Ywo+ID4gc3RpbGwgZG9lcyBub3Qgc2V0IHRoZSBkaXJ0eSBzdGF0ZSB0byB2ZnMuIElmIEZJX0FU
T01JQ19ESVJUSUVEIHdhcyBvcmlnaW5hbGx5IHNldAo+ID4gd2hlbiBhdG9taWMgZmlsZSBpcyBj
b21taXR0aW5nLCB0aGVuIEZJX0FUT01JQ19ESVJUSUVEIGlzIGp1c3QgY2xlYXJlZCBoZXJlLCBh
bmQKPiA+IHRoZW4gZG8gdGhlIHJlcGVhdGluZyBhY3Rpb24gb2Ygc2V0dGluZyBGSV9BVE9NSUNf
RElSVElFRD8KPiA+IFNvIGlzIGl0IGVub3VnaCB0byBkbyB0aGlzIG9ubHkgaW4gWzJdPwo+Cj4g
SGkgWmhpZ3VvLAo+Cj4gSSBjaGVja2VkIHRoZSBjb2RlIGFnYWluLCBmaW5hbGx5LCBJIGdvdCB0
aGlzLCBjb3VsZCB5b3UgcGxlYXNlIHRha2UKPiBhIGxvb2s/Cj4KPiBQaW5nIERhZWhvIGFzIHdl
bGwuCj4KPiBTdWJqZWN0OiBbUEFUQ0hdIGYyZnM6IGZpeCB0byBzZXQgYXRvbWljIHdyaXRlIHN0
YXR1cyBtb3JlIGNsZWFyCj4KPiAxLiBBZnRlciB3ZSBzdGFydCBhdG9taWMgd3JpdGUgaW4gYSBk
YXRhYmFzZSBmaWxlLCBiZWZvcmUgY29tbWl0dGluZwo+IGFsbCBkYXRhLCB3ZSdkIGJldHRlciBu
b3Qgc2V0IGlub2RlIHcvIHZmcyBkaXJ0eSBzdGF0dXMgdG8gYXZvaWQKPiByZWR1bmRhbnQgdXBk
YXRlcywgaW5zdGVhZCwgd2Ugb25seSBzZXQgaW5vZGUgdy8gYXRvbWljIGRpcnR5IHN0YXR1cy4K
Pgo+IDIuIEFmdGVyIHdlIGNvbW1pdCBhbGwgZGF0YSwgYmVmb3JlIGNvbW1pdHRpbmcgbWV0YWRh
dGEsIHdlIG5lZWQgdG8KPiBjbGVhciBhdG9taWMgZGlydHkgc3RhdHVzLCBhbmQgc2V0IHZmcyBk
aXJ0eSBzdGF0dXMgdG8gYWxsb3cgdmZzIGZsdXNoCj4gZGlydHkgaW5vZGUuCj4KSGkgQ2hhbywK
dGhlc2UgbG9va3MgbW9yZSBjbGVhci4KPiBTaWduZWQtb2ZmLWJ5OiBDaGFvIFl1IDxjaGFvQGtl
cm5lbC5vcmc+Cj4gLS0tCj4gIGZzL2YyZnMvaW5vZGUuYyAgIHwgIDQgKysrLQo+ICBmcy9mMmZz
L3NlZ21lbnQuYyB8IDEwICsrKysrKy0tLS0KPiAgZnMvZjJmcy9zdXBlci5jICAgfCAgNCArKyst
Cj4gIDMgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPgo+
IGRpZmYgLS1naXQgYS9mcy9mMmZzL2lub2RlLmMgYi9mcy9mMmZzL2lub2RlLmMKPiBpbmRleCA1
Yzg2MzRlYWVmN2IuLmY1OTkxZTg3NTFiOSAxMDA2NDQKPiAtLS0gYS9mcy9mMmZzL2lub2RlLmMK
PiArKysgYi9mcy9mMmZzL2lub2RlLmMKPiBAQCAtMzQsNyArMzQsOSBAQCB2b2lkIGYyZnNfbWFy
a19pbm9kZV9kaXJ0eV9zeW5jKHN0cnVjdCBpbm9kZSAqaW5vZGUsIGJvb2wgc3luYykKPiAgICAg
ICAgIGlmIChmMmZzX2lub2RlX2RpcnRpZWQoaW5vZGUsIHN5bmMpKQo+ICAgICAgICAgICAgICAg
ICByZXR1cm47Cj4KPiAtICAgICAgIGlmIChmMmZzX2lzX2F0b21pY19maWxlKGlub2RlKSkKPiAr
ICAgICAgIC8qIG9ubHkgYXRvbWljIGZpbGUgdy8gRklfQVRPTUlDX0NPTU1JVFRFRCBjYW4gYmUg
c2V0IHZmcyBkaXJ0eSAqLwo+ICsgICAgICAgaWYgKGYyZnNfaXNfYXRvbWljX2ZpbGUoaW5vZGUp
ICYmCj4gKyAgICAgICAgICAgICAgICAgICAgICAgIWlzX2lub2RlX2ZsYWdfc2V0KGlub2RlLCBG
SV9BVE9NSUNfQ09NTUlUVEVEKSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuOwo+Cj4gICAgICAg
ICBtYXJrX2lub2RlX2RpcnR5X3N5bmMoaW5vZGUpOwo+IGRpZmYgLS1naXQgYS9mcy9mMmZzL3Nl
Z21lbnQuYyBiL2ZzL2YyZnMvc2VnbWVudC5jCj4gaW5kZXggZGMzNjBiNGIwNTY5Li4yODY1OWE3
MTg5MWEgMTAwNjQ0Cj4gLS0tIGEvZnMvZjJmcy9zZWdtZW50LmMKPiArKysgYi9mcy9mMmZzL3Nl
Z21lbnQuYwo+IEBAIC0zNzYsMTAgKzM3NiwxMiBAQCBzdGF0aWMgaW50IF9fZjJmc19jb21taXRf
YXRvbWljX3dyaXRlKHN0cnVjdCBpbm9kZSAqaW5vZGUpCj4gICAgICAgICB9IGVsc2Ugewo+ICAg
ICAgICAgICAgICAgICBzYmktPmNvbW1pdHRlZF9hdG9taWNfYmxvY2sgKz0gZmktPmF0b21pY193
cml0ZV9jbnQ7Cj4gICAgICAgICAgICAgICAgIHNldF9pbm9kZV9mbGFnKGlub2RlLCBGSV9BVE9N
SUNfQ09NTUlUVEVEKTsKPiAtICAgICAgICAgICAgICAgaWYgKGlzX2lub2RlX2ZsYWdfc2V0KGlu
b2RlLCBGSV9BVE9NSUNfRElSVElFRCkpIHsKPiAtICAgICAgICAgICAgICAgICAgICAgICBjbGVh
cl9pbm9kZV9mbGFnKGlub2RlLCBGSV9BVE9NSUNfRElSVElFRCk7Cj4gLSAgICAgICAgICAgICAg
ICAgICAgICAgZjJmc19tYXJrX2lub2RlX2RpcnR5X3N5bmMoaW5vZGUsIHRydWUpOwo+IC0gICAg
ICAgICAgICAgICB9Cj4gKwo+ICsgICAgICAgICAgICAgICBmMmZzX2J1Z19vbihzYmksICFpc19p
bm9kZV9mbGFnX3NldChpbm9kZSwgRklfQVRPTUlDX0RJUlRJRUQpKTsKYnV0IEZJX0FUT01JQ19E
SVJUSUVEIG1heSAgbm90IGJlIHNldCB3aGVuIGF0b21pYyBmaWxlIGlzIGNvbW1pdHRpbmc/CnRo
YW5rcyEKPiArCj4gKyAgICAgICAgICAgICAgIC8qIGNsZWFyIGF0b21pYyBkaXJ0eSBzdGF0dXMg
YW5kIHNldCB2ZnMgZGlydHkgc3RhdHVzICovCj4gKyAgICAgICAgICAgICAgIGNsZWFyX2lub2Rl
X2ZsYWcoaW5vZGUsIEZJX0FUT01JQ19ESVJUSUVEKTsKPiArICAgICAgICAgICAgICAgZjJmc19t
YXJrX2lub2RlX2RpcnR5X3N5bmMoaW5vZGUsIHRydWUpOwo+ICAgICAgICAgfQo+Cj4gICAgICAg
ICBfX2NvbXBsZXRlX3Jldm9rZV9saXN0KGlub2RlLCAmcmV2b2tlX2xpc3QsIHJldCA/IHRydWUg
OiBmYWxzZSk7Cj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvc3VwZXIuYyBiL2ZzL2YyZnMvc3VwZXIu
Ywo+IGluZGV4IDlhNDJhMTMyM2Y0Mi4uYTVjYzlmNmVlMTZhIDEwMDY0NAo+IC0tLSBhL2ZzL2Yy
ZnMvc3VwZXIuYwo+ICsrKyBiL2ZzL2YyZnMvc3VwZXIuYwo+IEBAIC0xNTMyLDcgKzE1MzIsOSBA
QCBpbnQgZjJmc19pbm9kZV9kaXJ0aWVkKHN0cnVjdCBpbm9kZSAqaW5vZGUsIGJvb2wgc3luYykK
PiAgICAgICAgIH0KPiAgICAgICAgIHNwaW5fdW5sb2NrKCZzYmktPmlub2RlX2xvY2tbRElSVFlf
TUVUQV0pOwo+Cj4gLSAgICAgICBpZiAoIXJldCAmJiBmMmZzX2lzX2F0b21pY19maWxlKGlub2Rl
KSkKPiArICAgICAgIC8qIGlmIGF0b21pYyB3cml0ZSBpcyBub3QgY29tbWl0dGVkLCBzZXQgaW5v
ZGUgdy8gYXRvbWljIGRpcnR5ICovCj4gKyAgICAgICBpZiAoIXJldCAmJiBmMmZzX2lzX2F0b21p
Y19maWxlKGlub2RlKSAmJgo+ICsgICAgICAgICAgICAgICAgICAgICAgICFpc19pbm9kZV9mbGFn
X3NldChpbm9kZSwgRklfQVRPTUlDX0NPTU1JVFRFRCkpCj4gICAgICAgICAgICAgICAgIHNldF9p
bm9kZV9mbGFnKGlub2RlLCBGSV9BVE9NSUNfRElSVElFRCk7Cj4KPiAgICAgICAgIHJldHVybiBy
ZXQ7Cj4gLS0KPiAyLjQ4LjEKPgo+Cj4gPgo+ID4gQ2M6IERhZWhvIEplb25nIDxkYWVob2plb25n
QGdvb2dsZS5jb20+Cj4gPiBGaXhlczogZmNjYWE4MWRlODdlICgiZjJmczogcHJldmVudCBhdG9t
aWMgZmlsZSBmcm9tIGJlaW5nIGRpcnRpZWQgYmVmb3JlIGNvbW1pdCIpCj4gPiBTaWduZWQtb2Zm
LWJ5OiBaaGlndW8gTml1IDx6aGlndW8ubml1QHVuaXNvYy5jb20+Cj4gPiAtLS0KPiA+ICBmcy9m
MmZzL3NlZ21lbnQuYyB8IDQgLS0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0IGRlbGV0aW9ucygt
KQo+ID4KPiA+IGRpZmYgLS1naXQgYS9mcy9mMmZzL3NlZ21lbnQuYyBiL2ZzL2YyZnMvc2VnbWVu
dC5jCj4gPiBpbmRleCAzOTZlZjcxLi5kNGVhM2FmIDEwMDY0NAo+ID4gLS0tIGEvZnMvZjJmcy9z
ZWdtZW50LmMKPiA+ICsrKyBiL2ZzL2YyZnMvc2VnbWVudC5jCj4gPiBAQCAtMzc2LDEwICszNzYs
NiBAQCBzdGF0aWMgaW50IF9fZjJmc19jb21taXRfYXRvbWljX3dyaXRlKHN0cnVjdCBpbm9kZSAq
aW5vZGUpCj4gPiAgICAgICB9IGVsc2Ugewo+ID4gICAgICAgICAgICAgICBzYmktPmNvbW1pdHRl
ZF9hdG9taWNfYmxvY2sgKz0gZmktPmF0b21pY193cml0ZV9jbnQ7Cj4gPiAgICAgICAgICAgICAg
IHNldF9pbm9kZV9mbGFnKGlub2RlLCBGSV9BVE9NSUNfQ09NTUlUVEVEKTsKPiA+IC0gICAgICAg
ICAgICAgaWYgKGlzX2lub2RlX2ZsYWdfc2V0KGlub2RlLCBGSV9BVE9NSUNfRElSVElFRCkpIHsK
PiA+IC0gICAgICAgICAgICAgICAgICAgICBjbGVhcl9pbm9kZV9mbGFnKGlub2RlLCBGSV9BVE9N
SUNfRElSVElFRCk7Cj4gPiAtICAgICAgICAgICAgICAgICAgICAgZjJmc19tYXJrX2lub2RlX2Rp
cnR5X3N5bmMoaW5vZGUsIHRydWUpOwo+ID4gLSAgICAgICAgICAgICB9Cj4gPiAgICAgICB9Cj4g
Pgo+ID4gICAgICAgX19jb21wbGV0ZV9yZXZva2VfbGlzdChpbm9kZSwgJnJldm9rZV9saXN0LCBy
ZXQgPyB0cnVlIDogZmFsc2UpOwo+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1k
ZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQv
bGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
