Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ADE9A3F999
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Feb 2025 16:57:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tlVOo-0001Xb-Oj;
	Fri, 21 Feb 2025 15:57:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1tlVOm-0001XS-Ui
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Feb 2025 15:57:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mW57wmTj0EPUMiZ9PWhA+HFpZm560N/x1y9G/Fzly6U=; b=TJ1TRVVH1UsStPZ4yBBrN4XjXa
 axK+cBH/oXx9IzUYtr1yNzlfLF5odV5GWK3ym/YSad1+gzdbDapPrj35ygUtAICANfKnlS1fEN7Nr
 TDOJktNQ/4Xj76046NIkkmKN4AFwBsyDs+ox1yQZY/QmiPxHqWe9p0iw5gq43DH2b8RM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mW57wmTj0EPUMiZ9PWhA+HFpZm560N/x1y9G/Fzly6U=; b=gqGacF1vVQMNvopoRJ9bGfVRGF
 CNB8tfkxNPTjvRRgWBvQlks0IUjpsjJnE8szrRvf6wKFMq+kMmx99exMIqCRcXaRWuTZY4WgOaXpi
 i3vkjFyIHHuCGHLYeOqUvbVTeN22xOk2cF4WxRgcyHwWHBdq/25RdmFXIK1V9rIYjmZs=;
Received: from mail-vs1-f53.google.com ([209.85.217.53])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tlVOm-0000el-OL for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Feb 2025 15:57:09 +0000
Received: by mail-vs1-f53.google.com with SMTP id
 ada2fe7eead31-4be68eadf2fso707416137.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 21 Feb 2025 07:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740153418; x=1740758218; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mW57wmTj0EPUMiZ9PWhA+HFpZm560N/x1y9G/Fzly6U=;
 b=TV+HIgDQBtCBqaAyMZeuoPAaea4LL7dmTHOHFvd2iuUTNd1C5Hdu9HLrr0hlUib+pt
 sa2O3Lr7wRGWId6ECek73fr4rSvZ2rXHHSoErN4jmuKbrMeTrIvWoz9odMzBqN0ayt/7
 v+ZAIke+uiomxyVeLkfgnEgMAcSdt/L7+NK3epnlAAvCQHHwQ8g4MN7yFGu9bq3XkNAv
 Kh0T3KzJSU3D3Vwam0h27cwu/urgmcY5PoERqvQGmim66SmT4Jj4/uDWSPn8bmY0X7Lo
 jWKLXn90U8pgmrIe9N8FPmxJ2kq98NlUnX4SfbihtK6V63k+bwKrIeSMeikuXnAlYHyO
 b2Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740153418; x=1740758218;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mW57wmTj0EPUMiZ9PWhA+HFpZm560N/x1y9G/Fzly6U=;
 b=MikwkzMFmLsizSwF0/8Tasz8RY3QotZ88FrdnJszAN9zAL3lH7yKxfLsUuaAL02ubT
 s9crdKvSxu0N5WUSyXadndCEFQJnHUlk5vYqbzV6eQILbiPRyzjzerUScH7bzsP/pQ8U
 xPACc878jDeAqLn2zl/LPa6dDBljob05zaEk3ALVuOnlxKcZplImWtKgysQK8DS0aiaj
 9WdA7TGgxcUkexeuWLCdfZjMdEkWAALfPekg2N2a/6Nk8K9Zq61JsmH9iJNFld5ABpbV
 JBrwhBXjrAfxnpEi+ATHjf2Hy+YgNLZVPbgAX0lBdsZepQZfgQJNeK0WRvt33OGdUFx7
 hsig==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+qRNltNc2bQuVLe72puM4Q5jr/N2eJDWjIHNaj1CeKOPQ3FyAkcPJLF/Ckkj6qNXaL3BEaQhgvZ6bUr4tmkRd@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yxl64IVs4k5gP0t1YObz3o+/df5ZcM08W/3c3y2p35nmV/IRWm9
 j298YEse1dbc7hQWDt6yP6wlor0osDG/uCHOpzRJcyxUf4qcaEXBThQQh1ZMBWFNCxPieogDx/i
 EdFv+sT3oq97vDTncYSIeYQN5l+Y=
X-Gm-Gg: ASbGncsSqT7M9ZRxURyETUw3C8NOQI5HevB4yKyCv0Xivo9R9HBEKlII1yv68kSaIhf
 f+e9v6J/dq9+CfPhUGJa0M+9/620wVXtknQpAyTfW+hnsIu3nza4ekeUiD9N7T0XYpRxjKgS8ih
 ZcQiEZ+t+YwaahxrFqBlBU8xBqRpE/13H2vBhPCOA=
X-Google-Smtp-Source: AGHT+IGHwRZ8c74llSlA3WD5AWuIv6UFSApe19V2+tCR129QZ+QcEagYFQkoiJvcPPBnOTGpKvUCZtmZC++kfsiH19Y=
X-Received: by 2002:a05:6102:d8e:b0:4bb:5527:347a with SMTP id
 ada2fe7eead31-4bfc01f041emr2500563137.22.1740153417750; Fri, 21 Feb 2025
 07:56:57 -0800 (PST)
MIME-Version: 1.0
References: <20250204145353.165-1-yohan.joung@sk.com>
 <53598146-1f01-41ad-980e-9f4b989e81ab@kernel.org>
In-Reply-To: <53598146-1f01-41ad-980e-9f4b989e81ab@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Fri, 21 Feb 2025 07:56:46 -0800
X-Gm-Features: AWEUYZkdoK3uJsFTk5HZX7XcHtaWFzduJr6mHRMXVEFKz3GS3btkedN7mqNt17U
Message-ID: <CACOAw_x2v9fhorDWx9+f4VufddSPA5S6PF22AM_56smjjD5Faw@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Mon, Feb 17, 2025 at 4:38 AM Chao Yu wrote: > > On 2/4/25
    22:53, Yohan Joung wrote: > > F2FS zone storage requires discard and reset
    zone for each conventional, > > zoned device. > > In the cur [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.217.53 listed in list.dnswl.org]
  0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                          [209.85.217.53 listed in sa-trusted.bondedsender.org]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.217.53 listed in bl.score.senderscore.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.217.53 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
X-Headers-End: 1tlVOm-0000el-OL
Subject: Re: [f2fs-dev] [PATCH v1] f2fs: fix to ensure queued discard
 commands are properly issued
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, Yohan Joung <jyh429@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gTW9uLCBGZWIgMTcsIDIwMjUgYXQgNDozOOKAr0FNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9y
Zz4gd3JvdGU6Cj4KPiBPbiAyLzQvMjUgMjI6NTMsIFlvaGFuIEpvdW5nIHdyb3RlOgo+ID4gRjJG
UyB6b25lIHN0b3JhZ2UgcmVxdWlyZXMgZGlzY2FyZCBhbmQgcmVzZXQgem9uZSBmb3IgZWFjaCBj
b252ZW50aW9uYWwsCj4gPiB6b25lZCBkZXZpY2UuCj4gPiBJbiB0aGUgY3VycmVudCBjb25maWd1
cmF0aW9uLCBEaXNjYXJkIGdyYW51bGFyaXR5IGlzIHNldCB0byB0aGUgem9uZQo+ID4gc2l6ZSBi
dXQgcXVldWluZyBpcyBpbnNlcnRlZCBpbnRvIHRoZSBwZW5kIGxpc3Qgd2l0aCBhIG1heGltdW0g
c2l6ZSBvZiB0aGUKPiA+IHNlZ21lbnQgc2l6ZSBBcyBhIHJlc3VsdCBxdWV1ZWQgY29tbWFuZHMg
Y2Fubm90IGJlIGlzc3VlZC4KPiA+IHNvIHdlIGFyZSByZXN0b3J0aW5nIGRpc2NhcmQgZ3JhbnVs
YXJpdHkgdG8gaXRzIG9yaWdpbmFsIHN0YXRlCj4KPiBJdCBzZWVtcyBjb21taXQgNGY5OTMyNjRm
ZTI5ICgiZjJmczogaW50cm9kdWNlIGRpc2NhcmRfdW5pdCBtb3VudCBvcHRpb24iKQo+IGludHJv
ZHVjZWQgYSBidWc6IHdoZW4gd2UgZW5hYmxlIGRpc2NhcmRfdW5pdD1zZWN0aW9uIG9wdGlvbiwg
aXQgd2lsbCBzZXQKPiAuZGlzY2FyZF9ncmFudWxhcml0eSB0byBCTEtTX1BFUl9TRUMoKSwgaG93
ZXZlciBkaXNjYXJkIGdyYW51bGFyaXR5IG9ubHkKPiBzdXBwb3J0cyBbMSwgNTEyXSwgb25jZSBz
ZWN0aW9uIHNpemUgaXMgbm90IGVxdWFsIHRvIHNlZ21lbnQgc2l6ZSwgaXQgd2lsbAo+IGNhdXNl
IGJ1Zy4gYmxrem9uZWQgZmVhdHVyZSBiZWNhbWUgdGhlIHZpY3RpbSBzaW5jZSBpdCB1c2UKPiBk
aXNjYXJkX3VuaXQ9c2VjdGlvbiBvcHRpb24gYnkgZGVmYXVsdC4KPgo+IFdoYXQ6ICAgICAgICAg
ICAvc3lzL2ZzL2YyZnMvPGRpc2s+L2Rpc2NhcmRfZ3JhbnVsYXJpdHkKPiBEYXRlOiAgICAgICAg
ICAgSnVseSAyMDE3Cj4gQ29udGFjdDogICAgICAgICJDaGFvIFl1IiA8eXVjaGFvMEBodWF3ZWku
Y29tPgo+IERlc2NyaXB0aW9uOiAgICBDb250cm9scyBkaXNjYXJkIGdyYW51bGFyaXR5IG9mIGlu
bmVyIGRpc2NhcmQgdGhyZWFkLiBJbm5lciB0aHJlYWQKPiAgICAgICAgICAgICAgICAgd2lsbCBu
b3QgaXNzdWUgZGlzY2FyZHMgd2l0aCBzaXplIHRoYXQgaXMgc21hbGxlciB0aGFuIGdyYW51bGFy
aXR5Lgo+ICAgICAgICAgICAgICAgICBUaGUgdW5pdCBzaXplIGlzIG9uZSBibG9jayg0S0IpLCBu
b3cgb25seSBzdXBwb3J0IGNvbmZpZ3VyaW5nCj4gICAgICAgICAgICAgICAgIGluIHJhbmdlIG9m
IFsxLCA1MTJdLiBEZWZhdWx0IHZhbHVlIGlzIDE2Lgo+ICAgICAgICAgICAgICAgICBGb3Igc21h
bGwgZGV2aWNlcywgZGVmYXVsdCB2YWx1ZSBpcyAxLgo+Cj4gV2hhdCBhYm91dCB0aGlzPwo+Cj4g
U3ViamVjdDogW1BBVENIXSBmMmZzOiBmaXggdG8gc2V0IC5kaXNjYXJkX2dyYW51bGFyaXR5IGNv
cnJlY3RseQo+Cj4gY29tbWl0IDRmOTkzMjY0ZmUyOSAoImYyZnM6IGludHJvZHVjZSBkaXNjYXJk
X3VuaXQgbW91bnQgb3B0aW9uIikgaW50cm9kdWNlZAo+IGEgYnVnLCB3aGVuIHdlIGVuYWJsZSBk
aXNjYXJkX3VuaXQ9c2VjdGlvbiBvcHRpb24sIGl0IHdpbGwgc2V0Cj4gLmRpc2NhcmRfZ3JhbnVs
YXJpdHkgdG8gQkxLU19QRVJfU0VDKCksIGhvd2V2ZXIgZGlzY2FyZCBncmFudWxhcml0eSBvbmx5
Cj4gc3VwcG9ydHMgWzEsIDUxMl0sIG9uY2Ugc2VjdGlvbiBzaXplIGlzIG5vdCBlcXVhbCB0byBz
ZWdtZW50IHNpemUsIGl0IHdpbGwKPiBjYXVzZSBpc3N1ZV9kaXNjYXJkX3RocmVhZCgpIGluIERQ
T0xJQ1lfQkcgbW9kZSB3aWxsIG5vdCBzZWxlY3QgZGlzY2FyZCBlbnRyeQo+IHcvIGFueSBncmFu
dWxhcml0eSB0byBpc3N1ZS4KPgo+IEZpeGVzOiA0Zjk5MzI2NGZlMjkgKCJmMmZzOiBpbnRyb2R1
Y2UgZGlzY2FyZF91bml0IG1vdW50IG9wdGlvbiIpCj4gU2lnbmVkLW9mZi1ieTogWW9oYW4gSm91
bmcgPHlvaGFuLmpvdW5nQHNrLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBDaGFvIFl1IDxjaGFvQGtl
cm5lbC5vcmc+Cj4gLS0tCj4gIGZzL2YyZnMvc2VnbWVudC5jIHwgNSArKy0tLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBh
L2ZzL2YyZnMvc2VnbWVudC5jIGIvZnMvZjJmcy9zZWdtZW50LmMKPiBpbmRleCA2ZWJlMjVlYWZh
ZmEuLjJiNDE1OTI2NjQxZiAxMDA2NDQKPiAtLS0gYS9mcy9mMmZzL3NlZ21lbnQuYwo+ICsrKyBi
L2ZzL2YyZnMvc2VnbWVudC5jCj4gQEAgLTIzMjAsMTAgKzIzMjAsOSBAQCBzdGF0aWMgaW50IGNy
ZWF0ZV9kaXNjYXJkX2NtZF9jb250cm9sKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSkKPiAgICAg
ICAgIGRjYy0+ZGlzY2FyZF9ncmFudWxhcml0eSA9IERFRkFVTFRfRElTQ0FSRF9HUkFOVUxBUklU
WTsKPiAgICAgICAgIGRjYy0+bWF4X29yZGVyZWRfZGlzY2FyZCA9IERFRkFVTFRfTUFYX09SREVS
RURfRElTQ0FSRF9HUkFOVUxBUklUWTsKPiAgICAgICAgIGRjYy0+ZGlzY2FyZF9pb19hd2FyZSA9
IERQT0xJQ1lfSU9fQVdBUkVfRU5BQkxFOwo+IC0gICAgICAgaWYgKEYyRlNfT1BUSU9OKHNiaSku
ZGlzY2FyZF91bml0ID09IERJU0NBUkRfVU5JVF9TRUdNRU5UKQo+ICsgICAgICAgaWYgKEYyRlNf
T1BUSU9OKHNiaSkuZGlzY2FyZF91bml0ID09IERJU0NBUkRfVU5JVF9TRUdNRU5UIHx8Cj4gKyAg
ICAgICAgICAgICAgIEYyRlNfT1BUSU9OKHNiaSkuZGlzY2FyZF91bml0ID09IERJU0NBUkRfVU5J
VF9TRUNUSU9OKQo+ICAgICAgICAgICAgICAgICBkY2MtPmRpc2NhcmRfZ3JhbnVsYXJpdHkgPSBC
TEtTX1BFUl9TRUcoc2JpKTsKPiAtICAgICAgIGVsc2UgaWYgKEYyRlNfT1BUSU9OKHNiaSkuZGlz
Y2FyZF91bml0ID09IERJU0NBUkRfVU5JVF9TRUNUSU9OKQo+IC0gICAgICAgICAgICAgICBkY2Mt
PmRpc2NhcmRfZ3JhbnVsYXJpdHkgPSBCTEtTX1BFUl9TRUMoc2JpKTsKPgo+ICAgICAgICAgSU5J
VF9MSVNUX0hFQUQoJmRjYy0+ZW50cnlfbGlzdCk7Cj4gICAgICAgICBmb3IgKGkgPSAwOyBpIDwg
TUFYX1BMSVNUX05VTTsgaSsrKQo+IC0tCj4gMi40OC4xLjYwMS5nMzBjZWI3YjA0MC1nb29nCj4K
ClJldmlld2VkLWJ5OiBEYWVobyBKZW9uZyA8ZGFlaG9qZW9uZ0Bnb29nbGUuY29tPgoKPgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMt
ZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0
Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMt
ZGV2ZWwK
