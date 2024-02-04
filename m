Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC3D848BD7
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  4 Feb 2024 08:30:03 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rWWwh-00029K-3B;
	Sun, 04 Feb 2024 07:29:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qwjhust@gmail.com>) id 1rWWwe-00029A-4k
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 04 Feb 2024 07:29:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DVYWotuzszhb5Bt71MvuDcibA+w+/C5yZudwo/s/w7o=; b=VTl9VlC3SCKYiTHVbSMGxCJW9t
 gIU5jyxvRhqI2b9uZs1OggJ/IpMWbvL7/M3cs1hbgEOmU7eoEn6fYy4jkKIDabqELPVzTzpwMsiv9
 EN54qVzPlJYQmS2jk7/YWdtJcmeuhCbbNLlAKRo/ieEegaQjjYVjaDMR8BuGsHBVTgZA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DVYWotuzszhb5Bt71MvuDcibA+w+/C5yZudwo/s/w7o=; b=HpMAvhIwjy3uB3AqVCsOg8kcgS
 +icgNr1MWI00L8/GuIiTfG3jsz8KXU1NwTW631vUMT07PX00YhiFVLhiUFKinDugjqSYrAZEPdQ7Y
 xzA5OmGIGFy46sMYB6TlyAdfMLVusC2HZkAf/uQLTXi34EeQQgLgQ21oZVM2AFb2Q9qk=;
Received: from mail-qt1-f173.google.com ([209.85.160.173])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rWWwd-0006GO-8N for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 04 Feb 2024 07:29:40 +0000
Received: by mail-qt1-f173.google.com with SMTP id
 d75a77b69052e-42a4516ec5dso27310931cf.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 03 Feb 2024 23:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707031767; x=1707636567; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DVYWotuzszhb5Bt71MvuDcibA+w+/C5yZudwo/s/w7o=;
 b=FShXpL42rf18/6vQZCNm+TMG52tdEEsZIv4CQpsNWPDdsU8c3ipbiyk7fM3pexGxBr
 emhV63TZcriA17IQog04h1iuODL21lEPgTsYjhQD3WLVJILpZysj6DfVGdKFlWifNKTM
 NZNr9AUdtH5gsYygAYRKxCKO8cnle7CvJ93PdrqTpoahdzoTi4o6bQfy0hwvFvWzJ8J2
 7lRjx58XWio+NikcTqISAGZnsBmIqkdxO9DP8bmoQXqMsIl8Q2NIa+lB9kgzbSlvwes6
 vuURal3OYCf7z00igAer1QAp4lIqIur6NVYTFiKoRvldert3qY3+YAmSsHPBDNUwyqUk
 Ygtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707031767; x=1707636567;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DVYWotuzszhb5Bt71MvuDcibA+w+/C5yZudwo/s/w7o=;
 b=gFDJOHcpOTCawzzZUuzVAml6cEz0/K+wAhr1/ahwPDNKL8ksabOncgQDjToO+dYqCN
 ktp5yJFq69SmewKDZrKDuAJyQldRYvIZROUEKB7Cu/Mxr1kRWxbYIhYdFdgAh0ItcU5Z
 RCSDypluNY+siiFzLDJMHBvsWlwGF+7Hw2rl0DzNa/qKqvcERJ8IJExLOrC8hj00CaMS
 gxADsb369LjIBjGBz4d8VNyNYKGA96TwNadqYhTdCFAVjgjkJH14kzkcR+l1qqk3Q6d8
 dUvpN0wbRkVfaidg/7NpIssyzEGpi/FsOMXN3CTHs3CxMwzmqg+e9PlbOOZ9Fr1iOlat
 ubDA==
X-Gm-Message-State: AOJu0Yzg8LgYtK692aLu7GNPiThN/MMRtYxJ7ywled4sC8L9wubtVRGS
 TyGMGtNU97z7kscmN9ted6d/sBiRgB7ye4wa5ZDIDBS1CxWvDwHsI7FjtyQ5ZuP195SSKMVlYgh
 fuhUpvrD7O9shNZmyTEvSI+zSkhr0NeodjEZ8GTCI
X-Google-Smtp-Source: AGHT+IF94BpCHtL7/7nrD+aXNLLAGT63Sx9pIncX86mc0qCFOOpcSOHfJ3sK6l86R3PvYoYSRGqEI1m4Pbnhx0upZpQ=
X-Received: by 2002:ac8:46c6:0:b0:42b:eaa1:b28c with SMTP id
 h6-20020ac846c6000000b0042beaa1b28cmr2776685qto.43.1707031766715; Sat, 03 Feb
 2024 23:29:26 -0800 (PST)
MIME-Version: 1.0
References: <20240204031022.1189-1-qwjhust@gmail.com>
 <e6cffb6e-3228-415d-890c-76fe0a9ac08b@oppo.com>
In-Reply-To: <e6cffb6e-3228-415d-890c-76fe0a9ac08b@oppo.com>
From: Wenjie Qi <qwjhust@gmail.com>
Date: Sun, 4 Feb 2024 15:29:16 +0800
Message-ID: <CAGFpFsQevfTzirUyn7=5UOwrbwWo3SKnS_Sa7TQWXi3O6KSzMw@mail.gmail.com>
To: Yongpeng Yang <yangyongpeng1@oppo.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Sun, Feb 4, 2024 at 12:53 PM Yongpeng Yang wrote: > >
    1. f2fs_scan_devices call init_blkz_info for each zoned device, is it > reasonable
    that every device need to have 6 open zones at least? Because it is possible
    for all active logs to write to the same zoned device at the same time, each
    zoned device must have at least the same number of open zone resources as
    active logs. 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [qwjhust[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [209.85.160.173 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.160.173 listed in list.dnswl.org]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1rWWwd-0006GO-8N
Subject: Re: [f2fs-dev] [PATCH v5] f2fs: fix zoned block device information
 initialization
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org, hustqwj@hust.edu.cn,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gU3VuLCBGZWIgNCwgMjAyNCBhdCAxMjo1M+KAr1BNIFlvbmdwZW5nIFlhbmcgPHlhbmd5b25n
cGVuZzFAb3Bwby5jb20+IHdyb3RlOgo+Cj4gMS4gZjJmc19zY2FuX2RldmljZXMgY2FsbCBpbml0
X2Jsa3pfaW5mbyBmb3IgZWFjaCB6b25lZCBkZXZpY2UsIGlzIGl0Cj4gcmVhc29uYWJsZSB0aGF0
IGV2ZXJ5IGRldmljZSBuZWVkIHRvIGhhdmUgNiBvcGVuIHpvbmVzIGF0IGxlYXN0PwoKQmVjYXVz
ZSBpdCBpcyBwb3NzaWJsZSBmb3IgYWxsIGFjdGl2ZSBsb2dzIHRvIHdyaXRlIHRvIHRoZSBzYW1l
IHpvbmVkCmRldmljZSBhdCB0aGUgc2FtZSB0aW1lLAplYWNoIHpvbmVkIGRldmljZSBtdXN0IGhh
dmUgYXQgbGVhc3QgdGhlIHNhbWUgbnVtYmVyIG9mIG9wZW4gem9uZQpyZXNvdXJjZXMgYXMgYWN0
aXZlIGxvZ3MuCgo+IDIuIHdlIHNob3VsZCBhZGQgYWxsIG9wZW5fem9uZXMgb2YgZXZlcnkgem9u
ZWQgZGV2aWNlIHRvCj4gc2JpLT5tYXhfb3Blbl96b25lcywgc2JpLT5tYXhfb3Blbl96b25lcyB3
aWxsIGJlIFVJTlRfTUFYIG9yIGFjY3VtdWxhdGVkCj4gb3Blbl96b25lcy4gSXMgaXQgbW9yZSBy
ZWFzb25hYmxlPwoKSSBkb24ndCB0aGluayB0aGF0J3MgcmlnaHQuCnNiaS0+bWF4X29wZW5fem9u
ZSBpcyB0aGUgbnVtYmVyIG9mIHJlc291cmNlcyB0aGF0IGFyZSB0aGUgbGVhc3Qgb2YKYWxsIHpv
bmVkIGRldmljZXMuCgpUaGFua3MuCgo+Cj4KPiBPbiAyLzQvMjAyNCAxMToxMCBBTSwgV2Vuamll
IFFpIHdyb3RlOgo+ID4gSWYgdGhlIG1heCBvcGVuIHpvbmVzIG9mIHpvbmVkIGRldmljZXMgYXJl
IGxlc3MgdGhhbgo+ID4gdGhlIGFjdGl2ZSBsb2dzIG9mIEYyRlMsIHRoZSBkZXZpY2UgbWF5IGVy
cm9yIGR1ZSB0bwo+ID4gaW5zdWZmaWNpZW50IHpvbmUgcmVzb3VyY2VzIHdoZW4gbXVsdGlwbGUg
YWN0aXZlIGxvZ3MKPiA+IGFyZSBiZWluZyB3cml0dGVuIGF0IHRoZSBzYW1lIHRpbWUuCj4gPgo+
ID4gU2lnbmVkLW9mZi1ieTogV2VuamllIFFpIDxxd2podXN0QGdtYWlsLmNvbT4KPiA+IC0tLQo+
ID4gICBmcy9mMmZzL2YyZnMuaCAgfCAgMSArCj4gPiAgIGZzL2YyZnMvc3VwZXIuYyB8IDI0ICsr
KysrKysrKysrKysrKysrKysrKysrKwo+ID4gICAyIGZpbGVzIGNoYW5nZWQsIDI1IGluc2VydGlv
bnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9mMmZzLmggYi9mcy9mMmZzL2YyZnMu
aAo+ID4gaW5kZXggNTQzODk4NDgyZjhiLi4xNjExMDdmMmQzYmQgMTAwNjQ0Cj4gPiAtLS0gYS9m
cy9mMmZzL2YyZnMuaAo+ID4gKysrIGIvZnMvZjJmcy9mMmZzLmgKPiA+IEBAIC0xNTU4LDYgKzE1
NTgsNyBAQCBzdHJ1Y3QgZjJmc19zYl9pbmZvIHsKPiA+Cj4gPiAgICNpZmRlZiBDT05GSUdfQkxL
X0RFVl9aT05FRAo+ID4gICAgICAgdW5zaWduZWQgaW50IGJsb2Nrc19wZXJfYmxrejsgICAgICAg
ICAgIC8qIEYyRlMgYmxvY2tzIHBlciB6b25lICovCj4gPiArICAgICB1bnNpZ25lZCBpbnQgbWF4
X29wZW5fem9uZXM7ICAgICAgICAgICAgLyogbWF4IG9wZW4gem9uZSByZXNvdXJjZXMgb2YgdGhl
IHpvbmVkIGRldmljZSAqLwo+ID4gICAjZW5kaWYKPiA+Cj4gPiAgICAgICAvKiBmb3Igbm9kZS1y
ZWxhdGVkIG9wZXJhdGlvbnMgKi8KPiA+IGRpZmYgLS1naXQgYS9mcy9mMmZzL3N1cGVyLmMgYi9m
cy9mMmZzL3N1cGVyLmMKPiA+IGluZGV4IDFiNzE4YmViZmFhMS4uYzY3MDllZmJjMjk0IDEwMDY0
NAo+ID4gLS0tIGEvZnMvZjJmcy9zdXBlci5jCj4gPiArKysgYi9mcy9mMmZzL3N1cGVyLmMKPiA+
IEBAIC0yMzg4LDYgKzIzODgsMTYgQEAgc3RhdGljIGludCBmMmZzX3JlbW91bnQoc3RydWN0IHN1
cGVyX2Jsb2NrICpzYiwgaW50ICpmbGFncywgY2hhciAqZGF0YSkKPiA+ICAgICAgIGlmIChlcnIp
Cj4gPiAgICAgICAgICAgICAgIGdvdG8gcmVzdG9yZV9vcHRzOwo+ID4KPiA+ICsjaWZkZWYgQ09O
RklHX0JMS19ERVZfWk9ORUQKPiA+ICsgICAgIGlmIChzYmktPm1heF9vcGVuX3pvbmVzIDwgRjJG
U19PUFRJT04oc2JpKS5hY3RpdmVfbG9ncykgewo+ID4gKyAgICAgICAgICAgICBmMmZzX2Vycihz
YmksCj4gPiArICAgICAgICAgICAgICAgICAgICAgInpvbmVkOiBtYXggb3BlbiB6b25lcyAldSBp
cyB0b28gc21hbGwsIG5lZWQgYXQgbGVhc3QgJXUgb3BlbiB6b25lcyIsCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgc2JpLT5tYXhfb3Blbl96b25lcywgRjJGU19PUFRJT04oc2Jp
KS5hY3RpdmVfbG9ncyk7Cj4gPiArICAgICAgICAgICAgIGVyciA9IC1FSU5WQUw7Cj4gPiArICAg
ICAgICAgICAgIGdvdG8gcmVzdG9yZV9vcHRzOwo+ID4gKyAgICAgfQo+ID4gKyNlbmRpZgo+ID4g
Kwo+ID4gICAgICAgLyogZmx1c2ggb3V0c3RhbmRpbmcgZXJyb3JzIGJlZm9yZSBjaGFuZ2luZyBm
cyBzdGF0ZSAqLwo+ID4gICAgICAgZmx1c2hfd29yaygmc2JpLT5zX2Vycm9yX3dvcmspOwo+ID4K
PiA+IEBAIC0zOTMwLDExICszOTQwLDIyIEBAIHN0YXRpYyBpbnQgaW5pdF9ibGt6X2luZm8oc3Ry
dWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBpbnQgZGV2aSkKPiA+ICAgICAgIHNlY3Rvcl90IG5yX3Nl
Y3RvcnMgPSBiZGV2X25yX3NlY3RvcnMoYmRldik7Cj4gPiAgICAgICBzdHJ1Y3QgZjJmc19yZXBv
cnRfem9uZXNfYXJncyByZXBfem9uZV9hcmc7Cj4gPiAgICAgICB1NjQgem9uZV9zZWN0b3JzOwo+
ID4gKyAgICAgdW5zaWduZWQgaW50IG1heF9vcGVuX3pvbmVzOwo+ID4gICAgICAgaW50IHJldDsK
PiA+Cj4gPiAgICAgICBpZiAoIWYyZnNfc2JfaGFzX2Jsa3pvbmVkKHNiaSkpCj4gPiAgICAgICAg
ICAgICAgIHJldHVybiAwOwo+ID4KPiA+ICsgICAgIG1heF9vcGVuX3pvbmVzID0gYmRldl9tYXhf
b3Blbl96b25lcyhiZGV2KTsKPiA+ICsgICAgIGlmIChtYXhfb3Blbl96b25lcyAmJiAobWF4X29w
ZW5fem9uZXMgPCBzYmktPm1heF9vcGVuX3pvbmVzKSkKPiA+ICsgICAgICAgICAgICAgc2JpLT5t
YXhfb3Blbl96b25lcyA9IG1heF9vcGVuX3pvbmVzOwo+ID4gKyAgICAgaWYgKHNiaS0+bWF4X29w
ZW5fem9uZXMgPCBGMkZTX09QVElPTihzYmkpLmFjdGl2ZV9sb2dzKSB7Cj4gPiArICAgICAgICAg
ICAgIGYyZnNfZXJyKHNiaSwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAiem9uZWQ6IG1heCBv
cGVuIHpvbmVzICV1IGlzIHRvbyBzbWFsbCwgbmVlZCBhdCBsZWFzdCAldSBvcGVuIHpvbmVzIiwK
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzYmktPm1heF9vcGVuX3pvbmVzLCBG
MkZTX09QVElPTihzYmkpLmFjdGl2ZV9sb2dzKTsKPiA+ICsgICAgICAgICAgICAgcmV0dXJuIC1F
SU5WQUw7Cj4gPiArICAgICB9Cj4gPiArCj4gPiAgICAgICB6b25lX3NlY3RvcnMgPSBiZGV2X3pv
bmVfc2VjdG9ycyhiZGV2KTsKPiA+ICAgICAgIGlmICghaXNfcG93ZXJfb2ZfMih6b25lX3NlY3Rv
cnMpKSB7Cj4gPiAgICAgICAgICAgICAgIGYyZnNfZXJyKHNiaSwgIkYyRlMgZG9lcyBub3Qgc3Vw
cG9ydCBub24gcG93ZXIgb2YgMiB6b25lIHNpemVzXG4iKTsKPiA+IEBAIC00MjUzLDYgKzQyNzQs
OSBAQCBzdGF0aWMgaW50IGYyZnNfc2Nhbl9kZXZpY2VzKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNi
aSkKPiA+Cj4gPiAgICAgICBsb2dpY2FsX2Jsa3NpemUgPSBiZGV2X2xvZ2ljYWxfYmxvY2tfc2l6
ZShzYmktPnNiLT5zXwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlz
dHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xp
c3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
