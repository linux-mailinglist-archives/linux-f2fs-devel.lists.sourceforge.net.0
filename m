Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2EBAC07A1
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 May 2025 10:49:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4OFeKoqmiQkhD2sBD1p5EJ7Gr2qjCa7+aU+Bi6f6wXY=; b=N9zNaqUmRivmaCGtw26zizbPZ/
	tenPyYbP0dbMwCRs2Shn95/GpRAvTKc5MIUY0lA8Z4+Hl0jPibA9w+XvfX8LZHAIbbICrga/xESZ3
	luQWBc2MTLUnlVw0VTkg9v1apJXYCfKQKhIDGmlSFRC+aqckHjBsRwkDz2LJhB78h47U=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uI1bk-0000Fa-QZ;
	Thu, 22 May 2025 08:48:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uI1bg-0000DY-5I
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 May 2025 08:48:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RDaRw7/yLz/Ur1Wf4wZ7rCZ7h7h7E9i2XzeXS6vuJnc=; b=Rda1QeIdV+pNhmwkXA70flmmK7
 YLujZ2sJlL4t7H0g/6XfWMbH1a9vgKxg67/J6z4Blz7Hi2IBedgSI/m6XqFeqUWIR2m8dHOjiAyDA
 GnR/2WSYEIvlcLD/VJA2M1Qr4+Oh2yiH/KdFCjtPBW4avUWukxV+rTVPCvrYBc+8ukQs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RDaRw7/yLz/Ur1Wf4wZ7rCZ7h7h7E9i2XzeXS6vuJnc=; b=C+X7A4wvrbmRWmZHrZp+np6eia
 xXQdMofHdFHMDUxXvAcUPYOOdlodXN/w/8qnoQ22/n+YGSmjA0TLZLfb/2DT/oYnPD3S+8JJrvBE5
 Q5SOM3Ir3V/gg7+cRVEYM6xr7DwSTZqGyYra52Jz8ZBqFWrPVE/oOzD7qtWIXH3JKYnw=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uI1bf-0008G2-JA for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 May 2025 08:48:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C4B6862A16;
 Thu, 22 May 2025 08:48:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 712B8C4CEE4;
 Thu, 22 May 2025 08:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747903720;
 bh=ihS6jkwVXe0kUJF4gL2lpj/kzxm1hhaKXnhv5yo54IE=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=ISpwP48cHIcaAomi9C+qGohjeUm7Ifa41pbI81itBQsrNgFPP9nxVOznyfRkGNKzs
 gX5xAbUBwc6X3oehQ64ZtI9E0aGzYGvVcTuaLq47wSULCGjX15FgbWjicovYf8LEU4
 yAX0CFZbqSFqV0tU2GFrZq+nmHkTL9bmcZDRqaQF238xE/eNcM1ujiOWN+UBO7YYGX
 RdGToBmGbAk7Wp9FoHr0L20MYU+jImD+Uo8XZc/NXpkhrrE3P9k/ZoeXtkXpe2q677
 MS/o2itsx9lEnuXFtVjpIk7fSLHpPl2adRuNeTaTU0CZ0BmtYYU5IcbaWyO2Dw5LPa
 h7qB4lI7LRMew==
Message-ID: <4d5d4b7e-addd-4083-989f-f9c9cbcac04e@kernel.org>
Date: Thu, 22 May 2025 16:48:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chunhai Guo <guochunhai@vivo.com>, "jaegeuk@kernel.org"
 <jaegeuk@kernel.org>
References: <20250102101310.580277-1-guochunhai@vivo.com>
 <20250102101310.580277-2-guochunhai@vivo.com>
 <b3f919fe-35a0-4253-91e9-fac8666bfbe2@kernel.org>
 <fd75a391-3dd1-4411-806e-0bbb363fcba3@vivo.com>
Content-Language: en-US
In-Reply-To: <fd75a391-3dd1-4411-806e-0bbb363fcba3@vivo.com>
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 1/3/25 15:00, Chunhai Guo wrote: > 在 1/3/2025 11:36 AM,
    Chao Yu 写道: >> On 2025/1/2 18:13, Chunhai Guo wrote: >>> If userspace
    issues an fstrim with a range that does not include all >>> segme [...] 
 
 Content analysis details:   (-1.6 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uI1bf-0008G2-JA
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: fix missing small discard in fstrim
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMS8zLzI1IDE1OjAwLCBDaHVuaGFpIEd1byB3cm90ZToKPiDlnKggMS8zLzIwMjUgMTE6MzYg
QU0sIENoYW8gWXUg5YaZ6YGTOgo+PiBPbiAyMDI1LzEvMiAxODoxMywgQ2h1bmhhaSBHdW8gd3Jv
dGU6Cj4+PiBJZiB1c2Vyc3BhY2UgaXNzdWVzIGFuIGZzdHJpbSB3aXRoIGEgcmFuZ2UgdGhhdCBk
b2VzIG5vdCBpbmNsdWRlIGFsbAo+Pj4gc2VnbWVudHMgd2l0aCBzbWFsbCBkaXNjYXJkcywgdGhl
c2Ugc2VnbWVudHMgd2lsbCBiZSByZXVzZWQgd2l0aG91dCBiZWluZwo+PiBJIGRpZG4ndCBnZXQg
aXQsIGlmIGZzdHJpbSBkaWRuJ3QgY292ZXIgdGhvc2Ugc2VnbWVudHMsIHdoeSBkbyB3ZSBuZWVk
IHRvCj4+IGlzc3VlIHNtYWxsIGRpc2NhcmQgZm9yIG91dC1vZi1yYW5nZSBzZWdtZW50cz8KPiBD
dXJyZW50bHksIGFsbCB0aGUgZGlydHkgc2VudHJpZXMgaW4gdGhlIGRpcnR5X3NlbnRyaWVzX2Jp
dG1hcCBhcmUgCj4gaGFuZGxlZCBpbiB0aGUgZnN0cmltIHByb2Nlc3MgcmVnYXJkbGVzcyBvZiB3
aGV0aGVyIHRoZXkgYXJlIHdpdGhpbiB0aGUgCj4gZnN0cmltIHJhbmdlIG9yIG5vdC4gVGhlcmVm
b3JlLCB0aGlzIHBhdGNoIGlzIG5lY2Vzc2FyeSB0byBhZGRyZXNzIHRoZSAKPiBpc3N1ZS4KCmZz
dHJpbSBmbG93IGRvZXNuJ3QgZGVwZW5kIG9uIGRpcnR5IHN0YXR1cyBvZiBzZWdtZW50cywgcmln
aHQ/CgpJdCB3aWxsIGFkZCBkaXNjYXJkIHJhbmdlIHcvIGJlbG93IGNvZGU/CgoJaWYgKGNwYy0+
cmVhc29uICYgQ1BfRElTQ0FSRCkgewoJCV9fdTY0IHRyaW1fc3RhcnQgPSBjcGMtPnRyaW1fc3Rh
cnQ7CgoJCWZvciAoOyBjcGMtPnRyaW1fc3RhcnQgPD0gY3BjLT50cmltX2VuZDsgY3BjLT50cmlt
X3N0YXJ0KyspCgkJCWFkZF9kaXNjYXJkX2FkZHJzKHNiaSwgY3BjLCBmYWxzZSk7CgoJCWNwYy0+
dHJpbV9zdGFydCA9IHRyaW1fc3RhcnQ7Cgl9CgpUaGFua3MsCgo+IAo+IGYyZnNfZmx1c2hfc2l0
X2VudHJpZXMoKQo+ICDCoMKgwqAgbGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZlKHNlcywgdG1wLCBo
ZWFkLCBzZXRfbGlzdCkgewo+ICDCoMKgwqDCoMKgwqDCoCBmb3JfZWFjaF9zZXRfYml0X2Zyb20o
c2Vnbm8sIGJpdG1hcCwgZW5kKSB7Cj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLi4uCj4gIMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgX19jbGVhcl9iaXQoc2Vnbm8sIGJpdG1hcCk7IC8vIHNlZ25v
IGlzIGNsZWFyZWQgcmVnYXJkbGVzcyAKPiBvZiB3aGV0aGVyIG9yIG5vdCBpdCBpcyB3aXRoaW4g
dGhlIGZzdHJpbSByYW5nZQo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC4uLgo+ICDCoMKgwqDC
oMKgwqDCoCB9Cj4gIMKgwqDCoCB9Cj4gCj4gCj4gVGhhbmtzLAo+IAo+PiBUaGFua3MsCj4+Cj4+
PiBkaXNjYXJkZWQuIFRoaXMgcGF0Y2ggZml4ZXMgdGhpcyBpc3N1ZS4KPj4+IFRoaXMgcGF0Y2gg
aXMgc29tZXdoYXQgc2ltaWxhciB0byBjb21taXQgNjUwZDNjNGU1NmUxICgiZjJmczogZml4IGEg
bWlzc2luZwo+Pj4gZGlzY2FyZCBwcmVmcmVlIHNlZ21lbnRzIikuCj4+Pgo+Pj4gRml4ZXM6IGQ3
YmMyNDg0YjhkNCAoImYyZnM6IGZpeCBzbWFsbCBkaXNjYXJkcyBub3QgdG8gaXNzdWUgcmVkdW5k
YW50bHkiKQo+Pj4gU2lnbmVkLW9mZi1ieTogQ2h1bmhhaSBHdW8gPGd1b2NodW5oYWlAdml2by5j
b20+Cj4+PiAtLS0KPj4+ICAgIGZzL2YyZnMvc2VnbWVudC5jIHwgMTAgKysrKysrKy0tLQo+Pj4g
ICAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPj4+Cj4+
PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9zZWdtZW50LmMgYi9mcy9mMmZzL3NlZ21lbnQuYwo+Pj4g
aW5kZXggOGZlOWY3OTRiNTgxLi5hZjlhNjI1OTFjNDkgMTAwNjQ0Cj4+PiAtLS0gYS9mcy9mMmZz
L3NlZ21lbnQuYwo+Pj4gKysrIGIvZnMvZjJmcy9zZWdtZW50LmMKPj4+IEBAIC00NTUyLDYgKzQ1
NTIsOCBAQCB2b2lkIGYyZnNfZmx1c2hfc2l0X2VudHJpZXMoc3RydWN0IGYyZnNfc2JfaW5mbyAq
c2JpLCBzdHJ1Y3QgY3BfY29udHJvbCAqY3BjKQo+Pj4gICAgCXN0cnVjdCBsaXN0X2hlYWQgKmhl
YWQgPSAmU01fSShzYmkpLT5zaXRfZW50cnlfc2V0Owo+Pj4gICAgCWJvb2wgdG9fam91cm5hbCA9
ICFpc19zYmlfZmxhZ19zZXQoc2JpLCBTQklfSVNfUkVTSVpFRlMpOwo+Pj4gICAgCXN0cnVjdCBz
ZWdfZW50cnkgKnNlOwo+Pj4gKwlib29sIGZvcmNlID0gKGNwYy0+cmVhc29uICYgQ1BfRElTQ0FS
RCk7Cj4+PiArCV9fdTY0IHRyaW1fc3RhcnQgPSBjcGMtPnRyaW1fc3RhcnQ7Cj4+PiAgICAKPj4+
ICAgIAlkb3duX3dyaXRlKCZzaXRfaS0+c2VudHJ5X2xvY2spOwo+Pj4gICAgCj4+PiBAQCAtNDYw
OSw3ICs0NjExLDkgQEAgdm9pZCBmMmZzX2ZsdXNoX3NpdF9lbnRyaWVzKHN0cnVjdCBmMmZzX3Ni
X2luZm8gKnNiaSwgc3RydWN0IGNwX2NvbnRyb2wgKmNwYykKPj4+ICAgICNlbmRpZgo+Pj4gICAg
Cj4+PiAgICAJCQkvKiBhZGQgZGlzY2FyZCBjYW5kaWRhdGVzICovCj4+PiAtCQkJaWYgKCEoY3Bj
LT5yZWFzb24gJiBDUF9ESVNDQVJEKSkgewo+Pj4gKwkJCWlmICghZm9yY2UgfHwgKGZvcmNlICYm
Cj4+PiArCQkJCQkoc2Vnbm8gPCB0cmltX3N0YXJ0IHx8Cj4+PiArCQkJCQkgc2Vnbm8gPiBjcGMt
PnRyaW1fZW5kKSkpIHsKPj4+ICAgIAkJCQljcGMtPnRyaW1fc3RhcnQgPSBzZWdubzsKPj4+ICAg
IAkJCQlhZGRfZGlzY2FyZF9hZGRycyhzYmksIGNwYywgZmFsc2UsIGZhbHNlKTsKPj4+ICAgIAkJ
CX0KPj4+IEBAIC00NjQ5LDggKzQ2NTMsOCBAQCB2b2lkIGYyZnNfZmx1c2hfc2l0X2VudHJpZXMo
c3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBzdHJ1Y3QgY3BfY29udHJvbCAqY3BjKQo+Pj4gICAg
CWYyZnNfYnVnX29uKHNiaSwgIWxpc3RfZW1wdHkoaGVhZCkpOwo+Pj4gICAgCWYyZnNfYnVnX29u
KHNiaSwgc2l0X2ktPmRpcnR5X3NlbnRyaWVzKTsKPj4+ICAgIG91dDoKPj4+IC0JaWYgKGNwYy0+
cmVhc29uICYgQ1BfRElTQ0FSRCkgewo+Pj4gLQkJX191NjQgdHJpbV9zdGFydCA9IGNwYy0+dHJp
bV9zdGFydDsKPj4+ICsJaWYgKGZvcmNlKSB7Cj4+PiArCQljcGMtPnRyaW1fc3RhcnQgPSB0cmlt
X3N0YXJ0Owo+Pj4gICAgCj4+PiAgICAJCWZvciAoOyBjcGMtPnRyaW1fc3RhcnQgPD0gY3BjLT50
cmltX2VuZDsgY3BjLT50cmltX3N0YXJ0KyspCj4+PiAgICAJCQlhZGRfZGlzY2FyZF9hZGRycyhz
YmksIGNwYywgdHJ1ZSwgZmFsc2UpOwo+IAo+IAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51
eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZv
cmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
