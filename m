Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B875A65CBE2
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Jan 2023 03:29:48 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pCtXG-0002Xz-9v;
	Wed, 04 Jan 2023 02:29:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1pCtXF-0002Xt-Eo
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jan 2023 02:29:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ftUmS8MYlUwDmD5CBJUgYgQ4jW64HEf9EVXbnTOBmpA=; b=gZGI6XS6gId9q6gnW5P6XzR0Sv
 UpTay4rGUck/xpO6Dh17clth4COR7E4N4yM+ZCVQ/n7w3TdVqmAvCaEn8l3fR7X3eLD29hw+7AgSj
 svXpDizKilV5VzO5OXngoAWqLhmyo1pVYpx8FFv2ODPA4Y83+9R4kE1J2cuT+kzTzCsg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ftUmS8MYlUwDmD5CBJUgYgQ4jW64HEf9EVXbnTOBmpA=; b=C9etM+KhMYiV3KOKZfc6e3+V1m
 7/vZu0gY5z8R8DpUndfFUCgWAL5CqNk4sa12C2fB0fo0v1I1Uc4308gZlQxeDHSeasp1L/XtX5ugz
 90m7ZErb3RHS+B2kIn6FzCeD3DFMZpUrqI8Hw+AJGMdfhF5eKe45Wwog3egkqMyYI/H4=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pCtXE-003ynm-An for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jan 2023 02:29:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 10F66B810F3;
 Wed,  4 Jan 2023 02:29:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D3A9C433EF;
 Wed,  4 Jan 2023 02:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672799376;
 bh=+9kf5hnEZ64xx3CtPeLN3FbBv3YuDqJKdh7IsiXm7JE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FOXRL+IDbcMyGxtKtJG+RB+Id7fd/6sOcQcr0oRCA9QpTfnJDnRpqVwajQCwB4hnQ
 gFD5WSiErDUygNR8kXWaEwAfYK/XldSZ0N96RpIYqOdxpQ+GzZ8tvKIMYYwXI/3NE/
 Y6R60ggCKwKNQsWOhfyi0QYnuxcjnZpZIZ/i1KoKjHL6Zcv2QjZ6a1PaaZrxlT442i
 WPX97auO71/RL3qTmpljgCWalM0vm9FIcruMsNEEW/CX7UxbeztRKZD18OWlT5h5b7
 Jk+xjJ3F+laXoFNRrutw1HLzmmwJqWkU+OCnJEr6se5HKo7Q2QvATjc0qp2PCzOkzN
 jyGIH53fPMyOw==
Date: Tue, 3 Jan 2023 18:29:34 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: zhou dan <zhuqiandann@gmail.com>
Message-ID: <Y7TkjnSbHnDj76qd@google.com>
References: <20221208050808.2448146-1-zhoudan8@xiaomi.com>
 <Y5OYYJYx9G2LbRmc@google.com>
 <20221212122109.GA714122@mi-ThinkStation-K>
 <Y5ezpOwd8sOTTaW5@google.com>
 <20221213022100.GA841758@mi-ThinkStation-K>
 <CAHDnOD7W0eo-ZMU8nXsPhXrxbpR3U+kooTVaTU8VL67QHbYH3A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHDnOD7W0eo-ZMU8nXsPhXrxbpR3U+kooTVaTU8VL67QHbYH3A@mail.gmail.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/16, zhou dan wrote: > Hi, about this patch, I haven't
 received any reply recently. > Maybe you have some new ideas to solve this
 problem? Could you please describe the exact flow that you're suffering from?
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pCtXE-003ynm-An
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

T24gMTIvMTYsIHpob3UgZGFuIHdyb3RlOgo+IEhpLCBhYm91dCB0aGlzIHBhdGNoLCBJIGhhdmVu
J3QgcmVjZWl2ZWQgYW55IHJlcGx5IHJlY2VudGx5Lgo+IE1heWJlIHlvdSBoYXZlIHNvbWUgbmV3
IGlkZWFzIHRvIHNvbHZlIHRoaXMgcHJvYmxlbT8KCkNvdWxkIHlvdSBwbGVhc2UgZGVzY3JpYmUg
dGhlIGV4YWN0IGZsb3cgdGhhdCB5b3UncmUgc3VmZmVyaW5nIGZyb20/Cgo+IAo+IAo+IHpob3Vk
YW4gPHpodXFpYW5kYW5uQGdtYWlsLmNvbT4g5LqOMjAyMuW5tDEy5pyIMTPml6XlkajkuowgMTA6
MjHlhpnpgZPvvJoKPiA+Cj4gPiBIb3dldmVyLCAnZjJmc19jb21wcmVzc2VkX2ZpbGUoKScgb25s
eSBkZXRlcm1pbmVzIHdoZXRoZXIgdGhlIGZpbGUgY2FuCj4gPiBiZSBjb21wcmVzc2VkLCBub3Qg
d2hldGhlciB0aGUgZmlsZSBoYXMgYmVlbiBjb21wcmVzc2VkLiBBcyBmYXIgYXMgSQo+ID4ga25v
dywgd2hlbiBjb21wcmVzc19tb2RlIGlzIHVzZXIsIGZpbGVzIG1hcmtlZCBGSV9DT01QUkVTU0VE
X0ZJTEUKPiA+IHdpbGwgYmUgY29tcHJlc3NlZCBvbmx5IGFmdGVyICdmMmZzX2lvY19jb21wcmVz
c19maWxlKCknIGlzIGNhbGxlZC4KPiA+IE9uIE1vbiwgRGVjIDEyLCAyMDIyIGF0IDAzOjA1OjA4
UE0gLTA4MDAsIEphZWdldWsgS2ltIHdyb3RlOgo+ID4gPiBPbiAxMi8xMiwgemhvdWRhbiB3cm90
ZToKPiA+ID4gPiBNYXliZSBJJ20gbm90IGRlc2NyaWJpbmcgaXQgY2xlYXJseSBlbm91Z2gsIGJ1
dCBJIHRoaW5rIHRoZXJlIGlzCj4gPiA+ID4gc29tZXRoaW5nIHdyb25nIHdpdGggdGhlIGxvZ2lj
IGhlcmUuVGhlICdmMmZzX3JlbGVhc2VfY29tcHJlc3NfYmxvY2tzJwo+ID4gPiA+IG1ldGhvZCBk
b2VzIG5vdCBkZXRlcm1pbmUgaWYgdGhlIGZpbGUgaXMgY29tcHJlc3NlZCwgYnV0IHNpbXBseSBh
ZGRzCj4gPiA+ID4gdGhlIEZJX0NPTVBSRVNTX1JFTEVBU0VEIGZsYWcuCj4gPiA+Cj4gPiA+IEkg
Zmlyc3RseSBsb3N0IHlvdXIgcG9pbnQgc2luY2UgZjJmc19yZWxlYXNlX2NvbXByZXNzX2Jsb2Nr
cygpIGNoZWNrZWQKPiA+ID4gZjJmc19jb21wcmVzc2VkX2ZpbGUoKS4KPiA+ID4KPiA+ID4gPiBJ
biBwYXJ0aWN1bGFyLCBpbiB0aGUgY3VycmVudCBBbmRyb2lkIHN5c3RlbSwgd2hlbiB0aGUgYXBw
bGljYXRpb24gaXMKPiA+ID4gPiBpbnN0YWxsZWQsIHRoZSByZWxlYXNlIGludGVyZmFjZSBpcyBj
YWxsZWQgYnkgZGVmYXVsdCB0byByZWxlYXNlIHRoZQo+ID4gPiA+IHN0b3JhZ2UgbWFya2VkIGFz
IGNvbXByZXNzZWQsICB3aXRob3V0IGNoZWNraW5nIHdoZXRoZXIgdGhlIGZpbGUgaXMKPiA+ID4g
PiBhY3R1YWxseSBjb21wcmVzc2VkLiBJbiB0aGlzIGNhc2UsIHdoZW4gY29tcHJlc3NfbW9kZSBp
cyBzZXQgdG8gdXNlciwKPiA+ID4gPiBjYWxsaW5nIHRoZSBjb21wcmVzcyBpbnRlcmZhY2UgcmV0
dXJucyBFTlZBTCBhbmQgdGhlIGZpbGUgY2Fubm90IGJlCj4gPiA+ID4gY29tcHJlc3NlZC4KPiA+
ID4gPiBTbyBJIHRoaW5rIHRoZSBpbXBsZW1lbnRhdGlvbiBvZiByZWxlYXNlIG5lZWRzIHRvIGJl
IG1vZGlmaWVkLCBhbmQKPiA+ID4gPiBvbmx5IHNldCBGSV9DT01QUkVTU19SRUxFQVNFRCB3aGVu
IGl0J3MgcmVhbGx5IGNvbXByZXNzZWQgYW5kIHRoZQo+ID4gPiA+IHN0b3JhZ2UgaXMgcmVsZWFz
ZWQuCj4gPiA+ID4KPiA+ID4gPiBPbiBGcmksIERlYyAwOSwgMjAyMiBhdCAxMjoxOTo0NFBNIC0w
ODAwLCBKYWVnZXVrIEtpbSB3cm90ZToKPiA+ID4gPiA+IE9uIDEyLzA4LCB6aG91ZGFuOCB3cm90
ZToKPiA+ID4gPiA+ID4gSW4gY29tcHJlc3NfbW9kZT11c2VyLCBmMmZzX3JlbGVhc2VfY29tcHJl
c3NfYmxvY2tzKCkKPiA+ID4gPiA+ID4gIGRvZXMgbm90IHZlcmlmeSB3aGV0aGVyIGl0IGhhcyBi
ZWVuIGNvbXByZXNzZWQgYW5kCj4gPiA+ID4gPiA+ICBzZXRzIEZJX0NPTVBSRVNTX1JFTEVBU0VE
IGRpcmVjdGx5LiB3aGljaCB3aWxsIGxlYWQgdG8KPiA+ID4gPiA+ID4gcmV0dXJuIC1FSU5WQUwg
YWZ0ZXIgY2FsbGluZyBjb21wcmVzcy4KPiA+ID4gPiA+ID4gVG8gZml4IGl0LGxldCdzIGRvIG5v
dCBzZXQgRklfQ09NUFJFU1NfUkVMRUFTRUQgaWYgZmlsZQo+ID4gPiA+ID4gPiBpcyBub3QgY29t
cHJlc3NlZC4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBEbyB5b3UgbWVhbiB5b3Ugd2FudCB0byBhdm9p
ZCBFSU5WQUwgb24gYSBmaWxlIGhhdmluZyBGSV9DT01QUkVTU19SRUxFQVNFRAo+ID4gPiA+ID4g
d2l0aCB6ZXJvIGlfY29tcHJfYmxva2NzPwo+ID4gPiA+ID4KPiA+ID4gPiA+IEkgdGhpbmsgdGhl
IGN1cnJlbnQgbG9naWMgaXMgZ2l2aW5nIHRoZSBlcnJvciBvbiBhIHJlbGVhc2VkIGZpbGUgYWxy
ZWFkeS4KPiA+ID4gPiA+Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IHpo
b3VkYW44IDx6aG91ZGFuOEB4aWFvbWkuY29tPgo+ID4gPiA+ID4gPiAtLS0KPiA+ID4gPiA+ID4g
IGZzL2YyZnMvZmlsZS5jIHwgMyArLS0KPiA+ID4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gZGlmZiAt
LWdpdCBhL2ZzL2YyZnMvZmlsZS5jIGIvZnMvZjJmcy9maWxlLmMKPiA+ID4gPiA+ID4gaW5kZXgg
ODJjZGExMjU4MjI3Li5mMzI5MTAwNzdkZjYgMTAwNjQ0Cj4gPiA+ID4gPiA+IC0tLSBhL2ZzL2Yy
ZnMvZmlsZS5jCj4gPiA+ID4gPiA+ICsrKyBiL2ZzL2YyZnMvZmlsZS5jCj4gPiA+ID4gPiA+IEBA
IC0zNDUxLDE0ICszNDUxLDEzIEBAIHN0YXRpYyBpbnQgZjJmc19yZWxlYXNlX2NvbXByZXNzX2Js
b2NrcyhzdHJ1Y3QgZmlsZSAqZmlscCwgdW5zaWduZWQgbG9uZyBhcmcpCj4gPiA+ID4gPiA+ICAg
ICAgICAgcmV0ID0gZmlsZW1hcF93cml0ZV9hbmRfd2FpdF9yYW5nZShpbm9kZS0+aV9tYXBwaW5n
LCAwLCBMTE9OR19NQVgpOwo+ID4gPiA+ID4gPiAgICAgICAgIGlmIChyZXQpCj4gPiA+ID4gPiA+
ICAgICAgICAgICAgICAgICBnb3RvIG91dDsKPiA+ID4gPiA+ID4gLQo+ID4gPiA+ID4gPiAtICAg
ICAgIHNldF9pbm9kZV9mbGFnKGlub2RlLCBGSV9DT01QUkVTU19SRUxFQVNFRCk7Cj4gPiA+ID4g
PiA+ICAgICAgICAgaW5vZGUtPmlfY3RpbWUgPSBjdXJyZW50X3RpbWUoaW5vZGUpOwo+ID4gPiA+
ID4gPiAgICAgICAgIGYyZnNfbWFya19pbm9kZV9kaXJ0eV9zeW5jKGlub2RlLCB0cnVlKTsKPiA+
ID4gPiA+ID4KPiA+ID4gPiA+ID4gICAgICAgICBpZiAoIWF0b21pY19yZWFkKCZGMkZTX0koaW5v
ZGUpLT5pX2NvbXByX2Jsb2NrcykpCj4gPiA+ID4gPiA+ICAgICAgICAgICAgICAgICBnb3RvIG91
dDsKPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gKyAgICAgICBzZXRfaW5vZGVfZmxhZyhpbm9kZSwg
RklfQ09NUFJFU1NfUkVMRUFTRUQpOwo+ID4gPiA+ID4gPiAgICAgICAgIGYyZnNfZG93bl93cml0
ZSgmRjJGU19JKGlub2RlKS0+aV9nY19yd3NlbVtXUklURV0pOwo+ID4gPiA+ID4gPiAgICAgICAg
IGZpbGVtYXBfaW52YWxpZGF0ZV9sb2NrKGlub2RlLT5pX21hcHBpbmcpOwo+ID4gPiA+ID4gPgo+
ID4gPiA+ID4gPiAtLQo+ID4gPiA+ID4gPiAyLjM4LjEKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApM
aW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJj
ZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
