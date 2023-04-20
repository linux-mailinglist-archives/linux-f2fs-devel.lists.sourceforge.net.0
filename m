Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD626E9A33
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 20 Apr 2023 19:03:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ppXgS-0006Ci-P4;
	Thu, 20 Apr 2023 17:03:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qkrwngud825@gmail.com>) id 1ppXgQ-0006CV-ID
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 20 Apr 2023 17:02:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RVDbR3tUvimS4kAju79v+sGwhj0JoUPH/OLg1Ucp5lQ=; b=MazP+8/EP3GRfNmV8pPXdqcXAC
 xj7Fy+459KoHAHW5/bJSbDxTkv8v1ZTLzfmKOJbRC8uTGLpQv+5+Y/qFnd3jya5zkcKCHSxlhNr/S
 SLDRt+Z4qBuGvAnVMXy4OzW+63DeiDYp0Our7hNYFx7//kyE/mBVyuBq8EBFGHyVwP0Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RVDbR3tUvimS4kAju79v+sGwhj0JoUPH/OLg1Ucp5lQ=; b=HKYKXp7m/qSB5HZvUVDQBQlUKX
 IIiJrklF9ydr+kGv+e+JlgUIwibuLLDWTO+jJTBIjQc1tWsmVWZMZtXnR7S0mLusH4U1QC6/QZqpx
 0E2Az0i1QYr21aj8o2DaZ8IZ4rlzZkG9YHEbj63K+WwRG0c1fsw5A5ELypwLw/1/sB7Y=;
Received: from mail-ej1-f50.google.com ([209.85.218.50])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ppXgQ-0006Mi-0G for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 20 Apr 2023 17:02:58 +0000
Received: by mail-ej1-f50.google.com with SMTP id sz19so7990368ejc.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 20 Apr 2023 10:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682010171; x=1684602171;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RVDbR3tUvimS4kAju79v+sGwhj0JoUPH/OLg1Ucp5lQ=;
 b=Zr69BY/09TyzJe35yu7Hi27hI/9PZBRSjvbYpnAkNZDzJEyasAtLW67UuqHw477nhK
 FLAeEOT1tHrqGo3PmH0hcn4o1uC7qGClN+Zl9FP/Zw3J/XHf8O/9MrLDoUbEl5IGRLiG
 pL+yLw1LVpEw/MLCJDpKbTgAL0b5rvpNufHc61Y+O/RW68NG4BT5jmMEvQNtvxJizSMW
 aI0HiT8oSE3k49xhMQEufq3K/DIQeSfJdMY2Sp89hUQTJJFQdlGA3P8SPBchTK4YH4Fb
 tZ5kgRSIPOjbr3QqSN8/JpIXuFw/D0RnYx++2cdTRwqDJJGH1kAFkxGZNAHzTCz/3jhM
 XKOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682010171; x=1684602171;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RVDbR3tUvimS4kAju79v+sGwhj0JoUPH/OLg1Ucp5lQ=;
 b=c9mInhXL2fg3VUqfM2yVEOCpSHT8AhfIlcWCoMhGIbTokVU3dZkBmX4RBlnDiLH5r/
 rChqDbK40uH9lu9hLX04l+lXulMkZnTedy1Q5IoD1sVrsDDsj0iy1fBIp+z7606c0OQu
 Krq7+36IDTnR3wdkcDbup0WxjAYNKvezMkNEtV3HOLJW1nF1dQ7KaXv3qqc3U9VUrSJZ
 wXd3FK3r0OpgK4W6j+/0eVC/5lMxvS1SqCAoms7pSZHKoiN1dz4hEUfDd+aczlTDmcay
 irOWtDVBAJvVns+qJ/Us+98wUf/zNSr36QdDcmfSEO02kI12jfcZDsBIBlOylo2vispB
 a5Vw==
X-Gm-Message-State: AAQBX9e5C2KRB0rV93mNuA4YCTZD9zFhHe6g8XHOX+QHxhqnWCCCjRl5
 tj52oZ/LWkBqVNnBYiZHi/I6pFR9MklN5wYl4UQ=
X-Google-Smtp-Source: AKy350Zz6clcEXPV6INRA9OEUmT4p8SVvyLzVEfCp4FsE7Wne0ul77UHip2XZ669XOREbfOz/SGstRs+lM4CcEfcies=
X-Received: by 2002:a17:906:4f09:b0:94a:8771:fb60 with SMTP id
 t9-20020a1709064f0900b0094a8771fb60mr1958020eju.37.1682010171265; Thu, 20 Apr
 2023 10:02:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230404055446.1656296-1-qkrwngud825@gmail.com>
 <8da92504-a9db-4ca6-0979-039ba7a4c0fc@kernel.org>
In-Reply-To: <8da92504-a9db-4ca6-0979-039ba7a4c0fc@kernel.org>
From: Juhyung Park <qkrwngud825@gmail.com>
Date: Fri, 21 Apr 2023 02:02:39 +0900
Message-ID: <CAD14+f2AWz0a8a-KR78sKLsreby8OXWS06pg+uXLLCdnRJDbww@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Fri, Apr 21, 2023 at 1:06 AM Chao Yu wrote: > > On 2023/4/4
    13:54, Juhyung Park wrote: > > cp_payload is set differently [1] when extended
    node bitmap feature is > > enabled. Commit b79c3ba4ea9 [...] 
 
 Content analysis details:   (0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.218.50 listed in list.dnswl.org]
  0.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
  0.0 HK_RANDOM_FROM         From username looks random
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [qkrwngud825[at]gmail.com]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [qkrwngud825[at]gmail.com]
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [209.85.218.50 listed in wl.mailspike.net]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1ppXgQ-0006Mi-0G
Subject: Re: [f2fs-dev] [PATCH] fsck.f2fs: fix sanity check logic for
 cp_payload
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
Cc: Alexander Koskovich <akoskovich@pm.me>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gRnJpLCBBcHIgMjEsIDIwMjMgYXQgMTowNuKAr0FNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9y
Zz4gd3JvdGU6Cj4KPiBPbiAyMDIzLzQvNCAxMzo1NCwgSnVoeXVuZyBQYXJrIHdyb3RlOgo+ID4g
Y3BfcGF5bG9hZCBpcyBzZXQgZGlmZmVyZW50bHkgWzFdIHdoZW4gZXh0ZW5kZWQgbm9kZSBiaXRt
YXAgZmVhdHVyZSBpcwo+ID4gZW5hYmxlZC4gQ29tbWl0IGI3OWMzYmE0ZWE5ZCBicm9rZSBmc2Nr
IG9uIGYyZnMgZmlsZSBzeXN0ZW1zIGNyZWF0ZWQgb24KPiA+IDIrIFRCIGRldmljZSB3aXRoIGV4
dGVuZGVkIG5vZGUgYml0bWFwIGZlYXR1cmUgZW5hYmxlZC4KPiA+Cj4gPiBBcyB0aGUgc2FuaXR5
IGNoZWNrIGlzIGZvciBjaGVja2luZyBvdmVyZmxvd3MsIGZpeCB0aGlzIHRvIGFzc3VtZSB0aGUg
bWF4Cj4gPiBwb3NzaWJsZSBjcF9wYXlsb2FkIHNpemUgdW5kZXIgdGhlIGV4dGVuZGVkIG5vZGUg
Yml0bWFwLgo+ID4KPiA+IExpbms6IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51
eC9rZXJuZWwvZ2l0L2phZWdldWsvZjJmcy10b29scy5naXQvdHJlZS9ta2ZzL2YyZnNfZm9ybWF0
LmM/aD12MS4xNS4wI24zNzIgWzFdCj4gPiBGaXhlczogYjc5YzNiYTRlYTlkICgiZnNjay5mMmZz
OiBzYW5pdHkgY2hlY2sgY3BfcGF5bG9hZCBiZWZvcmUgcmVhZGluZyBjaGVja3BvaW50IikKPiA+
IFJlcG9ydGVkLWJ5OiBBbGV4YW5kZXIgS29za292aWNoIDxha29za292aWNoQHBtLm1lPgo+ID4g
U2lnbmVkLW9mZi1ieTogSnVoeXVuZyBQYXJrIDxxa3J3bmd1ZDgyNUBnbWFpbC5jb20+Cj4gPiAt
LS0KPiA+ICAgZnNjay9tb3VudC5jICAgICAgfCAyICstCj4gPiAgIGluY2x1ZGUvZjJmc19mcy5o
IHwgNCArKysrCj4gPiAgIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2ZzY2svbW91bnQuYyBiL2ZzY2svbW91bnQuYwo+
ID4gaW5kZXggMmIyNjcwMS4uZGYwMzE0ZCAxMDA2NDQKPiA+IC0tLSBhL2ZzY2svbW91bnQuYwo+
ID4gKysrIGIvZnNjay9tb3VudC5jCj4gPiBAQCAtMTIwOCw3ICsxMjA4LDcgQEAgaW50IGdldF92
YWxpZF9jaGVja3BvaW50KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSkKPiA+ICAgICAgIGludCBy
ZXQ7Cj4gPgo+ID4gICAgICAgY3BfcGF5bG9hZCA9IGdldF9zYihjcF9wYXlsb2FkKTsKPiA+IC0g
ICAgIGlmIChjcF9wYXlsb2FkID4gRjJGU19CTEtfQUxJR04oTUFYX1NJVF9CSVRNQVBfU0laRSkp
Cj4gPiArICAgICBpZiAoY3BfcGF5bG9hZCA+IEYyRlNfQkxLX0FMSUdOKE1BWF9DUF9QQVlMT0FE
KSkKPiA+ICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gPgo+ID4gICAgICAgY3BfYmxr
cyA9IDEgKyBjcF9wYXlsb2FkOwo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZjJmc19mcy5oIGIv
aW5jbHVkZS9mMmZzX2ZzLmgKPiA+IGluZGV4IDMzM2FlMDcuLmY4OTA2MzQgMTAwNjQ0Cj4gPiAt
LS0gYS9pbmNsdWRlL2YyZnNfZnMuaAo+ID4gKysrIGIvaW5jbHVkZS9mMmZzX2ZzLmgKPiA+IEBA
IC0xMTY4LDYgKzExNjgsMTAgQEAgc3RhdGljX2Fzc2VydChzaXplb2Yoc3RydWN0IGYyZnNfbmF0
X2Jsb2NrKSA9PSA0MDk1LCAiIik7Cj4gPiAgICNkZWZpbmUgTUFYX1NJVF9CSVRNQVBfU0laRSAg
ICAoU0VHX0FMSUdOKFNJWkVfQUxJR04oRjJGU19NQVhfU0VHTUVOVCwgXAo+ID4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNJVF9FTlRSWV9QRVJfQkxPQ0sp
KSAqIFwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBj
LmJsa3NfcGVyX3NlZyAvIDgpCj4gPiArI2RlZmluZSBNQVhfQ1BfUEFZTE9BRCAgICAgICAgIChT
RUdfQUxJR04oU0laRV9BTElHTihVSU5UMzJfTUFYLCBOQVRfRU5UUllfUEVSX0JMT0NLKSkgKiBc
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgREVGQVVM
VF9OQVRfRU5UUllfUkFUSU8gLyAxMDAgKiBcCj4KPiBERUZBVUxUX05BVF9FTlRSWV9SQVRJTyBp
cyAyMCBub3csIGlmIHdlIGNoYW5nZSBpdCB0byAxMDAgbGF0ZXIsCj4gb2xkIGZzY2sgd2lsbCBz
dGlsbCByZXBvcnQgZXJyb3Igb24gYSBuZXcgaW1hZ2U/Cj4KPiBTaG91bGQgd2UgcmVtb3ZlICJE
RUZBVUxUX05BVF9FTlRSWV9SQVRJTyAvIDEwMCI/Cj4KClRoYXQncyBhIHZhbGlkIGNvbmNlcm4s
IGlmIHdlIHBsYW4gdG8gaW5jcmVhc2UgaXQgaW4gdGhlIGZ1dHVyZS4KSSB3YXNuJ3Qgc3VyZSBo
b3cgc3RyaWN0IHRoZSBvdmVyZmxvdyBjaGVjayBtdXN0IGJlIGRvbmUuCgpGZWVsIGZyZWUgdG8g
c2VuZCBhIHBhdGNoIHRvIGluY3JlYXNlIHRoaXMuCgpJIHN1cHBvc2UgeW91ciBjb25jZXJuIGRv
ZXNuJ3QgcmVhbGx5IGhhdmUgYW4gaW1tZWRpYXRlIHByYWN0aWNhbAppbXBhY3QgYXMgdGhpcyBp
cyBzZXQgZnJvbSBta2ZzIGFuZCBpc24ndCB1c2VyIGNvbmZpZ3VyYWJsZS4KClRoYW5rcywKCj4g
VGhhbmtzLAo+Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgYy5ibGtzX3Blcl9zZWcgLyA4ICsgXAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIE1BWF9TSVRfQklUTUFQX1NJWkUgLSBNQVhfQklUTUFQX1NJWkVf
SU5fQ0tQVCkKPiA+Cj4gPiAgIC8qCj4gPiAgICAqIE5vdGUgdGhhdCBmMmZzX3NpdF9lbnRyeS0+
dmJsb2NrcyBoYXMgdGhlIGZvbGxvd2luZyBiaXQtZmllbGQgaW5mb3JtYXRpb24uCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZl
bCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0
cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZl
bAo=
