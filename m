Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 937CF89E03D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  9 Apr 2024 18:22:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ruEEh-0000Dj-32;
	Tue, 09 Apr 2024 16:22:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1ruEEg-0000Dd-2Q
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 Apr 2024 16:22:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xxRl0SlTWno/yLh+y785Q+lwhh+ELRLLFCZYcUARExY=; b=mk/DvUrSf9lNn95++jyLnYeJiG
 TLMj4MXhrTlF9y+NVkgAVBj4g/N9XwCzL1dJPdqfoCwvokdFepJKR/FCGtRbVzbqLYA4w/Wuq5i0a
 LswEs4qJV8RbtD6bQqe1LrFl+8ZK0MWOi5NKW//e37udBlGkJaDUkdRkYR9uySiPMvVg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xxRl0SlTWno/yLh+y785Q+lwhh+ELRLLFCZYcUARExY=; b=OQIg1uYaN+TFN0OIWUhfYbuPei
 ZR1aHrUETnFA2lyFwRAr3I3MfkBkizVH3rIy4ADj0Wbx8P/yyNbCZ7dLMn0oB3vJX9ReqmsFMDu+Y
 iWsS4FRLlRjroPRcv8p6wB3BC0MmTHSlplt89ZcC21Js6AQmvMG9qzmeVUJ+8If8slaU=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ruEEf-0002k4-CG for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 Apr 2024 16:22:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 9D344CE1B3D;
 Tue,  9 Apr 2024 16:22:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 850D5C433F1;
 Tue,  9 Apr 2024 16:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712679720;
 bh=j25mVSV7JaOAYPymcWENzF72xWe8UKWzEPPYmINrrTY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bx/6Um3GCGFEJdmkNmAM/2vbAgjap7/1jyuTvs2ybQfzvNzcP1cbp1FYKlGohexhA
 jLypVhSW1clknwS0KoF/IoOboJEuL3xKLqvN0XLZuEJQSk8d1p4GRGE73iGBYTD555
 l82nSAcpJYVI+QVIlQzGkEE2vXbKHdyLG+LfO1kEdm+LfbQdupLWktkiJsrqzE0VFO
 sOGIcQeBbP3KaOjpyJ8IQSbBJ5peFVieuXS8FurIOfNkUV8EGm82yqfmwYyiYoz3VT
 6WZwEIZlL6+JHqfC7ruGoHVkPA0mus8C/Wa9IQ7iOF84uz7LHmyW0e2JH2n7C/7eNd
 IiT7mahfgIgLg==
Date: Tue, 9 Apr 2024 16:21:58 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <ZhVrJh3rackEiIfL@google.com>
References: <20240404195254.556896-1-jaegeuk@kernel.org>
 <2c195fee-c71c-4e44-b24f-9880b3c1b6c4@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2c195fee-c71c-4e44-b24f-9880b3c1b6c4@kernel.org>
X-Spam-Score: -4.2 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 04/09, Chao Yu wrote: > On 2024/4/5 3:52,
 Jaegeuk Kim wrote:
 > > Shutdown does not check the error of thaw_super due to readonly, which
 > > causes a deadlock like below. > > > > f2fs_ioc_shutdown(F [...] 
 Content analysis details:   (-4.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -1.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ruEEf-0002k4-CG
Subject: Re: [f2fs-dev] [PATCH] f2fs: don't set RO when shutting down f2fs
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
Cc: linux-kernel@vger.kernel.org,
 Light Hsieh =?utf-8?B?KOisneaYjueHiCk=?= <Light.Hsieh@mediatek.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMDQvMDksIENoYW8gWXUgd3JvdGU6Cj4gT24gMjAyNC80LzUgMzo1MiwgSmFlZ2V1ayBLaW0g
d3JvdGU6Cj4gPiBTaHV0ZG93biBkb2VzIG5vdCBjaGVjayB0aGUgZXJyb3Igb2YgdGhhd19zdXBl
ciBkdWUgdG8gcmVhZG9ubHksIHdoaWNoCj4gPiBjYXVzZXMgYSBkZWFkbG9jayBsaWtlIGJlbG93
Lgo+ID4gCj4gPiBmMmZzX2lvY19zaHV0ZG93bihGMkZTX0dPSU5HX0RPV05fRlVMTFNZTkMpICAg
ICAgICBpc3N1ZV9kaXNjYXJkX3RocmVhZAo+ID4gICAtIGJkZXZfZnJlZXplCj4gPiAgICAtIGZy
ZWV6ZV9zdXBlcgo+ID4gICAtIGYyZnNfc3RvcF9jaGVja3BvaW50KCkKPiA+ICAgIC0gZjJmc19o
YW5kbGVfY3JpdGljYWxfZXJyb3IgICAgICAgICAgICAgICAgICAgICAtIHNiX3N0YXJ0X3dyaXRl
Cj4gPiAgICAgIC0gc2V0IFJPICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAtIHdhaXRpbmcKPiA+ICAgLSBiZGV2X3RoYXcKPiA+ICAgIC0gdGhhd19zdXBlcl9sb2NrZWQK
PiA+ICAgICAgLSByZXR1cm4gLUVJTlZBTCwgaWYgc2JfcmRvbmx5KCkKPiA+ICAgLSBmMmZzX3N0
b3BfZGlzY2FyZF90aHJlYWQKPiA+ICAgIC0+IHdhaXQgZm9yIGt0aHJlYWRfc3RvcChkaXNjYXJk
X3RocmVhZCk7Cj4gPiAKPiA+IFJlcG9ydGVkLWJ5OiAiTGlnaHQgSHNpZWggKOisneaYjueHiCki
IDxMaWdodC5Ic2llaEBtZWRpYXRlay5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKYWVnZXVrIEtp
bSA8amFlZ2V1a0BrZXJuZWwub3JnPgo+ID4gLS0tCj4gPiAgIGZzL2YyZnMvc3VwZXIuYyB8IDEx
ICsrKysrKysrKy0tCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9mcy9mMmZzL3N1cGVyLmMgYi9mcy9mMmZz
L3N1cGVyLmMKPiA+IGluZGV4IGRmOTc2NWI0MWRhYy4uYmE2Mjg4ZTg3MGM1IDEwMDY0NAo+ID4g
LS0tIGEvZnMvZjJmcy9zdXBlci5jCj4gPiArKysgYi9mcy9mMmZzL3N1cGVyLmMKPiA+IEBAIC00
MTM1LDkgKzQxMzUsMTYgQEAgdm9pZCBmMmZzX2hhbmRsZV9jcml0aWNhbF9lcnJvcihzdHJ1Y3Qg
ZjJmc19zYl9pbmZvICpzYmksIHVuc2lnbmVkIGNoYXIgcmVhc29uLAo+ID4gICAJaWYgKHNodXRk
b3duKQo+ID4gICAJCXNldF9zYmlfZmxhZyhzYmksIFNCSV9JU19TSFVURE9XTik7Cj4gPiAtCS8q
IGNvbnRpbnVlIGZpbGVzeXN0ZW0gb3BlcmF0b3JzIGlmIGVycm9ycz1jb250aW51ZSAqLwo+ID4g
LQlpZiAoY29udGludWVfZnMgfHwgZjJmc19yZWFkb25seShzYikpCj4gPiArCS8qCj4gPiArCSAq
IENvbnRpbnVlIGZpbGVzeXN0ZW0gb3BlcmF0b3JzIGlmIGVycm9ycz1jb250aW51ZS4gU2hvdWxk
IG5vdCBzZXQKPiA+ICsJICogUk8gYnkgc2h1dGRvd24sIHNpbmNlIFJPIGJ5cGFzc2VzIHRoYXdf
c3VwZXIgd2hpY2ggY2FuIGhhbmcgdGhlCj4gPiArCSAqIHN5c3RlbS4KPiA+ICsJICovCj4gPiAr
CWlmIChjb250aW51ZV9mcyB8fCBmMmZzX3JlYWRvbmx5KHNiKSB8fAo+ID4gKwkJCQlyZWFzb24g
PT0gU1RPUF9DUF9SRUFTT05fU0hVVERPV04pIHsKPiA+ICsJCWYyZnNfd2FybihzYmksICJTdG9w
cGVkIGZpbGVzeXN0ZW0gZHVlIHRvIHJlYWRvbjogJWQiLCByZWFzb24pOwo+ID4gICAJCXJldHVy
bjsKPiAKPiBEbyB3ZSBuZWVkIHRvIHNldCBSTyBhZnRlciBiZGV2X3RoYXcoKSBpbiBmMmZzX2Rv
X3NodXRkb3duKCk/CgpJSVJDLCBzaHV0ZG93biBkb2Vzbid0IG5lZWQgdG8gc2V0IFJPIGFzIHdl
IHN0b3BwZWQgdGhlIGNoZWNrcG9pbnQuCkknbSBtb3JlIGNvbmNlcm5lZCBvbiBhbnkgc2lkZSBl
ZmZlY3QgY2F1c2VkIGJ5IHRoaXMgUk8gY2hhbmdlLgoKPiAKPiBUaGFua3MsCj4gCj4gPiArCX0K
PiA+ICAgCWYyZnNfd2FybihzYmksICJSZW1vdW50aW5nIGZpbGVzeXN0ZW0gcmVhZC1vbmx5Iik7
Cj4gPiAgIAkvKgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMu
c291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3Rp
bmZvL2xpbnV4LWYyZnMtZGV2ZWwK
