Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F10A8A7EB
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 15 Apr 2025 21:29:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u4lxx-0003VJ-KG;
	Tue, 15 Apr 2025 19:29:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qkrwngud825@gmail.com>) id 1u4lxn-0003Um-Pw
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Apr 2025 19:28:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8FJRJmAKMibx/8TdTHsJBpMiAzX8C5G3g6cNiKMoYfU=; b=ObmQ2lZf0JJA8so8XIrdwUkDd4
 g5HQ2H4fIbs3vWpx1eFXXJZIQbWL8SNOK7F+iqtVFDCd8AXej+2s/uHzCOBp6BClho9h5s+B3P7vG
 FbBExYpfcLCg+J6OKTJkk6FaYvgD4oQm5TsKjC9n2REnDkkvGnZJ/Bp0dsyHzNrxENgA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8FJRJmAKMibx/8TdTHsJBpMiAzX8C5G3g6cNiKMoYfU=; b=gz2O5ZAxMBqvymuOCCOAQDfr9w
 +AIWWrOnrLohavIYQVqB+2c9BrGfbUaukqLoR7k1aBVJqa+K3usFQCqJDDZo7UnEkZS10uxq74cN5
 cdD2mkd3bC9PiZzIWVhtDOIpXVE7HJNYrsPOA1bMOQpiytBnXjFyA1PcU3hjsyeZe2Yc=;
Received: from mail-ej1-f44.google.com ([209.85.218.44])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1u4lxY-0000nM-JM for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Apr 2025 19:28:56 +0000
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-ac2c663a3daso1093868566b.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 15 Apr 2025 12:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744745309; x=1745350109; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8FJRJmAKMibx/8TdTHsJBpMiAzX8C5G3g6cNiKMoYfU=;
 b=M71sexsaj9LcGqgN0tm4Wz/Oxb/db+d2aQ15s+WsdbWOVRm2WCZBl3e2vBD9WzdlBt
 WpibXAaGinAcMhD2j/xwcrir/Trq8CQ9Y8JwDSlQmwrbtcq+wmfKt5Y8q0+S8WBoNIIN
 +9lTDrYipc647l4fdgx5GG7i5UTLg/W76ezZZheFY4GEBhMYkOjMTLaL7OoORO8NC6eO
 t0zeTK4a2/Q1GkMr1v4wDUAHdtBrWqe5+xYcAnxYaM+XMv/4vRTc1e/luNvtAkLWLV/s
 1mgPGZeYdbeVkgF0iBULnfdAY6gk358NBNNXfv7NBMTPHcdzPOnQKhUnzHSQCzqTzRs9
 XoLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744745309; x=1745350109;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8FJRJmAKMibx/8TdTHsJBpMiAzX8C5G3g6cNiKMoYfU=;
 b=LNUyz/ZyK9cNyk57pdTbDhJF3E2fzkCrQEBp/DJy1ZjGx+rnV4tg1clsLI46RMyI86
 U6cvY2UPx7mYBhxX7LlxE+we23jNmajoD6IfdgSEL/tLySXnTsiWjbq+8TqxivT3IanK
 a0H1EbPoOl8XesaL4hrV+Diex7oSMkFnZP3FLOTMg95DWTMH5p9APLpL8bIawozk793B
 iYZpqrmbcbF2/zHr3IWDu70ri4GPb2IfR5+2B29ykah8ywLfcpH57r8lFwj8Es9mAqAS
 7qYdrLwfhNmwA3JI3C/xhmO+eusFg1iPyFXz0BwEORIUoqnGlFAxK4OGrnGjyd8B7aa0
 aqgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXl7PEzH4PpU63stnE4/LYM75DRVIkXPAfZGw4dA8XkT9oDdpc52CEIjlZzv+keMPEHHGOKDZq2XPPKE8BYnYxJ@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yxcc1+fihoV5b9z6s4TYvIZfOKLqaHuYe/X4kc8woU+zFcSB4ly
 8uH0ZKp3EhmZxxGCLShtQFxSVt8UdEKj2fv+tpTg+FYasN9pxK9Nwb4o9THPyK3wzuUWQxwXTAN
 5e2I9bWONZQzAzefJGNTPZP8s8mo=
X-Gm-Gg: ASbGncvjR9B5AeiSkkE8tdPrF/3bRdKpW8z0toa8/vXm0REj9jqFQ4ZqfSlhh6xGZqf
 w94OaXqqxKfDKfs5vY9/88RqfqfBzD722E1vf58NorEzc2pu6MF4ux0xlMcKZCfJGECug2a+Eyk
 8SskYjv3MYX1nnjRNuyaRBpvQ=
X-Google-Smtp-Source: AGHT+IGoY0Z4Hszwnq5KkpsCXNHutcgnD8H6qSpy7zAnXgtT+Yx6izjOVqagfluMGaOiwqb0jtS4elpA+fKqH6cC+6Q=
X-Received: by 2002:a17:907:3e06:b0:ac3:b613:a651 with SMTP id
 a640c23a62f3a-acb38257dfemr29833366b.17.1744745308753; Tue, 15 Apr 2025
 12:28:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250414111141.735081-1-chao@kernel.org>
In-Reply-To: <20250414111141.735081-1-chao@kernel.org>
From: Juhyung Park <qkrwngud825@gmail.com>
Date: Tue, 15 Apr 2025 12:28:17 -0700
X-Gm-Features: ATxdqUFBYiIHTuX90ohRsJWYQQ9v-nlzmA0-BOeKPHIXV0rcXsI-OE1J1DGItsI
Message-ID: <CAD14+f0fFTOqjNL3pwi+Ucx2dR2UDhrF15-HgwbaM=Zid5Ge=Q@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 1.1 (+)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hm. Would this be what @uplinkr might have encountered? On
    Mon, Apr 14, 2025 at 4:13 AM Chao Yu via Linux-f2fs-devel wrote: > > w/
    below testcase, resize will generate a corrupted image which > contains inconsistent
    metadata: > > touch img > truncate - [...] 
 
 Content analysis details:   (1.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  1.0 HK_RANDOM_FROM         From username looks random
  0.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.218.44 listed in bl.score.senderscore.com]
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.218.44 listed in sa-accredit.habeas.com]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [qkrwngud825[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [qkrwngud825[at]gmail.com]
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.218.44 listed in wl.mailspike.net]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
X-Headers-End: 1u4lxY-0000nM-JM
Subject: Re: [f2fs-dev] [PATCH] resize.f2fs: fix to always change metadata
 for expand resize
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SG0uCgpXb3VsZCB0aGlzIGJlIHdoYXQgQHVwbGlua3IgbWlnaHQgaGF2ZSBlbmNvdW50ZXJlZD8K
Ck9uIE1vbiwgQXByIDE0LCAyMDI1IGF0IDQ6MTPigK9BTSBDaGFvIFl1IHZpYSBMaW51eC1mMmZz
LWRldmVsCjxsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldD4gd3JvdGU6Cj4K
PiB3LyBiZWxvdyB0ZXN0Y2FzZSwgcmVzaXplIHdpbGwgZ2VuZXJhdGUgYSBjb3JydXB0ZWQgaW1h
Z2Ugd2hpY2gKPiBjb250YWlucyBpbmNvbnNpc3RlbnQgbWV0YWRhdGE6Cj4KPiB0b3VjaCBpbWcK
PiB0cnVuY2F0ZSAtcyAkKCg1MTIqMTAyNCoxMDI0KjEwMjQpKSBpbWcKPiBta2ZzLmYyZnMgLWYg
aW1nICQoKDI1NioxMDI0KjEwMjQpKQo+IHJlc2l6ZS5mMmZzIC1zIGltZyAtdCAkKCgxMDI0KjEw
MjQqMTAyNCkpCj4gbW91bnQgaW1nIC9tbnQvZjJmcwo+Cj4gWyAgIDMxLjcyNTIwMF0gRjJGUy1m
cyAobG9vcDApOiBXcm9uZyBiaXRtYXAgc2l6ZTogc2l0OiAxOTIsIHNpdF9ibGtfY250OjQ3NjIK
PiBbICAgMzEuNzI4NDQxXSBGMkZTLWZzIChsb29wMCk6IEZhaWxlZCB0byBnZXQgdmFsaWQgRjJG
UyBjaGVja3BvaW50Cj4KPiBUaGUgcm9vdCBjYXVzZSBpcyBzYWZlIG1vZGUgKHZpYSAtcyBvcHRp
b24pIGlzIG5vdCBjb21wYXRpYmxlCj4gdy8gZXhwYW5kIHJlc2l6ZSwgZHVlIHRvIGluIHNhZmUg
bW9kZSwgd2Ugd2lsbCBrZWVwIGFsbCBwYXJhbWV0ZXJzCj4gcmVsYXRlZCB0byBOQVQsIFNJVCwg
U1NBIGFyZWEsIGUuZy4gc2l0X2JpdG1hcF9zaXplLCBob3dldmVyLCB3ZQo+IHdpbGwgdXBkYXRl
IHNlZ21lbnRfY291bnRfbWFpbiBhY2NvcmRpbmcgbmV3IHBhcnRpdGlvbiBzaXplLCByZXN1bHQK
PiBpbiB0aGVyZSBpcyBubyBlbm91Z2ggc2l0X2JpdG1hcCBhbmQgU0lUIGJsb2NrcyB0byBhZGRy
ZXNzIHRoZQo+IGVudGlyZSBibG9jayBhZGRyZXNzIG9mIG5ldyBwYXJ0aXRpb24uCj4KPiBBZGRp
bmcgYSBjaGVjayBjb25kaXRpb24gdG8gYXZvaWQgZXhwYW5kaW5nIHBhcnRpdGlvbiBpbiBzYWZl
Cj4gbW9kZSwgYW5kIGNoYW5nZSBtYW51YWwgYWNjb3JkaW5nbHkuCj4KPiBTaWduZWQtb2ZmLWJ5
OiBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+Cj4gLS0tCj4gIGZzY2svcmVzaXplLmMgICAgIHwg
MTIgKysrKysrKystLS0tCj4gIG1hbi9yZXNpemUuZjJmcy44IHwgIDIgKy0KPiAgMiBmaWxlcyBj
aGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEv
ZnNjay9yZXNpemUuYyBiL2ZzY2svcmVzaXplLmMKPiBpbmRleCAxYWI3ZDc1Li41ODkxNGVjIDEw
MDY0NAo+IC0tLSBhL2ZzY2svcmVzaXplLmMKPiArKysgYi9mc2NrL3Jlc2l6ZS5jCj4gQEAgLTc1
NiwxOCArNzU2LDIyIEBAIGludCBmMmZzX3Jlc2l6ZShzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkp
Cj4KPiAgICAgICAgIC8qIG1heSBkaWZmZXJlbnQgc2VjdG9yIHNpemUgKi8KPiAgICAgICAgIGlm
ICgoYy50YXJnZXRfc2VjdG9ycyAqIGMuc2VjdG9yX3NpemUgPj4KPiAtICAgICAgICAgICAgICAg
ICAgICAgICBnZXRfc2IobG9nX2Jsb2Nrc2l6ZSkpIDwgZ2V0X3NiKGJsb2NrX2NvdW50KSkKPiAr
ICAgICAgICAgICAgICAgICAgICAgICBnZXRfc2IobG9nX2Jsb2Nrc2l6ZSkpIDwgZ2V0X3NiKGJs
b2NrX2NvdW50KSkgewo+ICAgICAgICAgICAgICAgICBpZiAoIWMuc2FmZV9yZXNpemUpIHsKPiAg
ICAgICAgICAgICAgICAgICAgICAgICBBU1NFUlRfTVNHKCJOb3RoaW5nIHRvIHJlc2l6ZSwgbm93
IG9ubHkgc3VwcG9ydHMgcmVzaXppbmcgd2l0aCBzYWZlIHJlc2l6ZSBmbGFnXG4iKTsKPiAgICAg
ICAgICAgICAgICAgICAgICAgICByZXR1cm4gLTE7Cj4gICAgICAgICAgICAgICAgIH0gZWxzZSB7
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIGYyZnNfcmVzaXplX3NocmluayhzYmkp
Owo+ICAgICAgICAgICAgICAgICB9Cj4gLSAgICAgICBlbHNlIGlmICgoKGMudGFyZ2V0X3NlY3Rv
cnMgKiBjLnNlY3Rvcl9zaXplID4+Cj4gKyAgICAgICB9IGVsc2UgaWYgKCgoYy50YXJnZXRfc2Vj
dG9ycyAqIGMuc2VjdG9yX3NpemUgPj4KPiAgICAgICAgICAgICAgICAgICAgICAgICBnZXRfc2Io
bG9nX2Jsb2Nrc2l6ZSkpID4gZ2V0X3NiKGJsb2NrX2NvdW50KSkgfHwKPiAtICAgICAgICAgICAg
ICAgICAgICAgICBjLmlnbm9yZV9lcnJvcikKPiArICAgICAgICAgICAgICAgICAgICAgICBjLmln
bm9yZV9lcnJvcikgewo+ICsgICAgICAgICAgICAgICBpZiAoYy5zYWZlX3Jlc2l6ZSkgewo+ICsg
ICAgICAgICAgICAgICAgICAgICAgIEFTU0VSVF9NU0coIkV4cGFuZGluZyByZXNpemUgZG9lc24n
dCBzdXBwb3J0IHNhZmUgcmVzaXplIGZsYWciKTsKPiArICAgICAgICAgICAgICAgICAgICAgICBy
ZXR1cm4gLTE7Cj4gKyAgICAgICAgICAgICAgIH0KPiAgICAgICAgICAgICAgICAgcmV0dXJuIGYy
ZnNfcmVzaXplX2dyb3coc2JpKTsKPiAtICAgICAgIGVsc2Ugewo+ICsgICAgICAgfSBlbHNlIHsK
PiAgICAgICAgICAgICAgICAgTVNHKDAsICJOb3RoaW5nIHRvIHJlc2l6ZS5cbiIpOwo+ICAgICAg
ICAgICAgICAgICByZXR1cm4gMDsKPiAgICAgICAgIH0KPiBkaWZmIC0tZ2l0IGEvbWFuL3Jlc2l6
ZS5mMmZzLjggYi9tYW4vcmVzaXplLmYyZnMuOAo+IGluZGV4IGJkZGE0ZmQuLjViNmRhZjUgMTAw
NjQ0Cj4gLS0tIGEvbWFuL3Jlc2l6ZS5mMmZzLjgKPiArKysgYi9tYW4vcmVzaXplLmYyZnMuOAo+
IEBAIC02OSw3ICs2OSw3IEBAIFNraXAgY2F1dGlvbiBkaWFsb2d1ZSBhbmQgcmVzaXplIHBhcnRp
dGlvbiBkaXJlY3RseS4KPiAgU3BlY2lmeSBzdXBwb3J0IHdyaXRlIGhpbnQuCj4gIC5UUAo+ICAu
QkkgXC1zCj4gLUVuYWJsZSBzYWZlIHJlc2l6ZS4KPiArRW5hYmxlIHNhZmUgcmVzaXplLCBpdCBj
YW4gb25seSBiZSB1c2VkIHcvIHNocmluayByZXNpemUuCj4gIC5UUAo+ICAuQkkgXC1WCj4gIFBy
aW50IHRoZSB2ZXJzaW9uIG51bWJlciBhbmQgZXhpdC4KPiAtLQo+IDIuNDkuMAo+Cj4KPgo+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTGludXgtZjJm
cy1kZXZlbCBtYWlsaW5nIGxpc3QKPiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdl
Lm5ldAo+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4
LWYyZnMtZGV2ZWwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3Rz
LnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0
aW5mby9saW51eC1mMmZzLWRldmVsCg==
