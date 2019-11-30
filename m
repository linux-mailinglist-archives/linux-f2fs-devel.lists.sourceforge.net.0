Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F081510DC41
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 30 Nov 2019 04:32:11 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iatUP-0006Pj-7V; Sat, 30 Nov 2019 03:32:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1iatUI-0006Ov-MG
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 30 Nov 2019 03:32:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oPSiVXaJd/R9HUq6zpxaME9Ahjc2A7fVxOVC3I8ncCE=; b=VlxDypRrK25L0nsvWYpPoFi4Ck
 nKqSDe8Ye3+VTlvssCQTBErDgUH0p4T9LE3COVBeFLfRs2mhCBQOd+ybFVOy/gAb6HNGus6cLCuhB
 PFYpvb9A7qURipQxmlr2e/OdO1pZaWRVDoR0ag2EmsSYvvgMfoSlUPOqDCgrgpD9yxUw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oPSiVXaJd/R9HUq6zpxaME9Ahjc2A7fVxOVC3I8ncCE=; b=Ab6vpHrOuAmGbW/Q4gDdw1uV7r
 ukFRL0KO3xlehOqh1rFngPgbWHR/LiLq6yOY87Rme62g6uLB6C+eR5tz9cs6sCHQP0dV8s5Tn4sIi
 4SkaF/W/uwcssrZIQ2mexVthvXcGzKE1nUY7ua3+ylzUl02uP5h0eadijsra9ZxFWe2U=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iatUG-000FLP-Do
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 30 Nov 2019 03:32:02 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 3ABAA19417AEFC1CC100;
 Sat, 30 Nov 2019 11:31:50 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.202) with Microsoft SMTP Server (TLS) id 14.3.439.0; Sat, 30 Nov
 2019 11:31:48 +0800
To: =?UTF-8?B?546L55+b?= <spearmao@126.com>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <51b426e.685b.16df7c1dfeb.Coremail.spearmao@126.com>
 <41ebc7c0-d302-af52-f201-825220ed70f0@huawei.com>
 <6a90286.7f06.16dfde844d3.Coremail.spearmao@126.com>
 <14c6b12e.4b95.16e111552ce.Coremail.spearmao@126.com>
 <8e7b930d-3c93-4edf-ad2c-cdff3e71ec49@huawei.com>
 <57b2493f.8414.16e8d939f1f.Coremail.spearmao@126.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <2fafc314-583c-0da9-6cec-3f8d46f6afed@huawei.com>
Date: Sat, 30 Nov 2019 11:31:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <57b2493f.8414.16e8d939f1f.Coremail.spearmao@126.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: googlesource.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1iatUG-000FLP-Do
Subject: Re: [f2fs-dev] F2fs mount cost long time due to waiting f2fs gc
 with f2fs checkpoint disabled
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGVsbG8sCgpTb3JyeSBmb3IgdGhlIGRlbGF5IHJlcGx5LgoKT24gMjAxOS8xMS8yMSAxODo0OCwg
546L55+bIHdyb3RlOgo+IEhpIENoYW8sCj4gCj4gUmVjZW50bHkgSSBlbmNvdW50ZXIgYW4gaXNz
dWUgdGhhdCBmMmZzIG1vdW50IGNvc3QgcXVpdGUgYSBsb25nIHRpbWUodGhlIGxvbmdlc3QgdGlt
ZSBpIG1ldCBpcyBhbG1vc3QgNG1pbiB0byBtb3VudCBmMmZzIGNvbXBsZXRlbHkpLgo+IEJlbG93
IGlzIGEgdHlwaWNhbCBsb2c6Cj4gMDEtMjQgMTg6NDI6MDkuODI1wqDCoMKgwqAgMMKgwqDCoMKg
IDAgSSBpbml0wqDCoMKgIDogW2xpYmZzX21ncl1SZXRyeWluZyBtb3VudCAoc291cmNlPS9kZXYv
YmxvY2svYm9vdGRldmljZS9ieS1uYW1lL3VzZXJkYXRhLHRhcmdldD0vZGF0YSx0eXBlPWYyZnMp
PS0xKDExKTogVHJ5IGFnYWluCj4gMDEtMjQgMTg6NDI6MTUuMzY5wqDCoMKgwqAgMMKgwqDCoMKg
IDAgSSBpbml0wqDCoMKgIDogW2xpYmZzX21ncl1SZXRyeWluZyBtb3VudCAoc291cmNlPS9kZXYv
YmxvY2svYm9vdGRldmljZS9ieS1uYW1lL3VzZXJkYXRhLHRhcmdldD0vZGF0YSx0eXBlPWYyZnMp
PS0xKDExKTogVHJ5IGFnYWluCj4gMDEtMjQgMTg6NDI6MjAuOTUywqDCoMKgwqAgMMKgwqDCoMKg
IDAgSSBpbml0wqDCoMKgIDogW2xpYmZzX21ncl1SZXRyeWluZyBtb3VudCAoc291cmNlPS9kZXYv
YmxvY2svYm9vdGRldmljZS9ieS1uYW1lL3VzZXJkYXRhLHRhcmdldD0vZGF0YSx0eXBlPWYyZnMp
PS0xKDExKTogVHJ5IGFnYWluCj4gMDEtMjQgMTg6NDI6MjYuNTEwwqDCoMKgwqAgMMKgwqDCoMKg
IDAgSSBpbml0wqDCoMKgIDogW2xpYmZzX21ncl1SZXRyeWluZyBtb3VudCAoc291cmNlPS9kZXYv
YmxvY2svYm9vdGRldmljZS9ieS1uYW1lL3VzZXJkYXRhLHRhcmdldD0vZGF0YSx0eXBlPWYyZnMp
PS0xKDExKTogVHJ5IGFnYWluCj4gMDEtMjQgMTg6NDI6MzIuMjg4wqDCoMKgwqAgMMKgwqDCoMKg
IDAgSSBpbml0wqDCoMKgIDogW2xpYmZzX21ncl1SZXRyeWluZyBtb3VudCAoc291cmNlPS9kZXYv
YmxvY2svYm9vdGRldmljZS9ieS1uYW1lL3VzZXJkYXRhLHRhcmdldD0vZGF0YSx0eXBlPWYyZnMp
PS0xKDExKTogVHJ5IGFnYWluCj4gMDEtMjQgMTg6NDI6MzcuODQzwqDCoMKgwqAgMMKgwqDCoMKg
IDAgSSBpbml0wqDCoMKgIDogW2xpYmZzX21ncl1SZXRyeWluZyBtb3VudCAoc291cmNlPS9kZXYv
YmxvY2svYm9vdGRldmljZS9ieS1uYW1lL3VzZXJkYXRhLHRhcmdldD0vZGF0YSx0eXBlPWYyZnMp
PS0xKDExKTogVHJ5IGFnYWluCj4gMDEtMjQgMTg6NDI6NDMuNDc2wqDCoMKgwqAgMMKgwqDCoMKg
IDAgSSBpbml0wqDCoMKgIDogW2xpYmZzX21ncl1SZXRyeWluZyBtb3VudCAoc291cmNlPS9kZXYv
YmxvY2svYm9vdGRldmljZS9ieS1uYW1lL3VzZXJkYXRhLHRhcmdldD0vZGF0YSx0eXBlPWYyZnMp
PS0xKDExKTogVHJ5IGFnYWluCj4gLi4uCj4gMDEtMjQgMTg6NDQ6NDguODczwqDCoMKgwqAgMMKg
wqDCoMKgIDAgSSBpbml0wqDCoMKgIDogW2xpYmZzX21ncl1SZXRyeWluZyBtb3VudCAoc291cmNl
PS9kZXYvYmxvY2svYm9vdGRldmljZS9ieS1uYW1lL3VzZXJkYXRhLHRhcmdldD0vZGF0YSx0eXBl
PWYyZnMpPS0xKDExKTogVHJ5IGFnYWluCj4gMDEtMjQgMTg6NDQ6NTQuNjA2wqDCoMKgwqAgMMKg
wqDCoMKgIDAgSSBpbml0wqDCoMKgIDogW2xpYmZzX21ncl1SZXRyeWluZyBtb3VudCAoc291cmNl
PS9kZXYvYmxvY2svYm9vdGRldmljZS9ieS1uYW1lL3VzZXJkYXRhLHRhcmdldD0vZGF0YSx0eXBl
PWYyZnMpPS0xKDExKTogVHJ5IGFnYWluCj4gMDEtMjQgMTg6NDU6MjMuMzM3wqDCoMKgwqAgMMKg
wqDCoMKgIDAgSSBpbml0wqDCoMKgIDogW2xpYmZzX21ncl1SZXRyeWluZyBtb3VudCAoc291cmNl
PS9kZXYvYmxvY2svYm9vdGRldmljZS9ieS1uYW1lL3VzZXJkYXRhLHRhcmdldD0vZGF0YSx0eXBl
PWYyZnMpPS0xKDExKTogVHJ5IGFnYWluCj4gMDEtMjQgMTg6NDU6MjkuMDY1wqDCoMKgwqAgMMKg
wqDCoMKgIDAgVyBGMkZTLWZzIChtbWNibGswcDgwKTogU3RhcnQgY2hlY2twb2ludCBkaXNhYmxl
ZCEKPiAwMS0yNCAxODo0NToyOS4wNzfCoMKgwqDCoCAwwqDCoMKgwqAgMCBJIEYyRlMtZnMgKG1t
Y2JsazBwODApOiBNb3VudGVkIHdpdGggY2hlY2twb2ludCB2ZXJzaW9uID0gMjQ5ZjgzZgo+IDAx
LTI0IDE4OjQ1OjI5LjA4MsKgwqDCoMKgIDDCoMKgwqDCoCAwIEkgaW5pdMKgwqDCoCA6IFtsaWJm
c19tZ3JdX19tb3VudChzb3VyY2U9L2Rldi9ibG9jay9ib290ZGV2aWNlL2J5LW5hbWUvdXNlcmRh
dGEsdGFyZ2V0PS9kYXRhLHR5cGU9ZjJmcyk9MDogVHJ5IGFnYWluCj4gMDEtMjQgMTg6NDU6Mjku
MDgywqDCoMKgwqAgMMKgwqDCoMKgIDAgSSBpbml0wqDCoMKgIDogW2xpYmZzX21ncl0vZGF0YSBp
cyBmaWxlIGVuY3J5cHRlZAo+IDAxLTI0IDE4OjQ1OjI5LjA4MsKgwqDCoMKgIDDCoMKgwqDCoCAw
IEkgaW5pdMKgwqDCoCA6IFtsaWJmc19tZ3JdU3VjY2Vzc2Z1bGx5IG1vdW50ZWQgL2RhdGEgd2l0
aCBmaWxlIHN5c3RlbSB0eXBlICdmMmZzLjogVHJ5IGFnYWluCj4gCj4gVGhlIHJlbGF0ZWQgcGF0
Y2ggaXM6IGh0dHBzOi8vYW5kcm9pZC1yZXZpZXcuZ29vZ2xlc291cmNlLmNvbS9jL3BsYXRmb3Jt
L3N5c3RlbS9jb3JlLysvODc1NTM4Cj4gPGh0dHBzOi8vYW5kcm9pZC1yZXZpZXcuZ29vZ2xlc291
cmNlLmNvbS9jL3BsYXRmb3JtL3N5c3RlbS9jb3JlLysvODc1NTM4Pgo+IE15IHF1ZXN0aW9uIGlz
Ogo+IGEpIElzIHRoZXJlIGFueSByZWFzb24gdGhhdCBmMmZzIGdjIG11c3QgYmUgZG9uZSB3aXRo
aW4gNXMgaW4gdGhlIHByb2NlZHVyZSBvZiBkaXNhYmxlIGYyZnMgY2hlY2twb2ludD8KPiDCoMKg
IGNvZGUgcmVsYXRlZDrCoCBmMmZzX2Rpc2FibGVfY2hlY2twb2ludChzYmkpOgo+IMKgwqDCoMKg
wqDCoMKgwqDCoCB3aGlsZSAoIWYyZnNfdGltZV9vdmVyKHNiaSwgRElTQUJMRV9USU1FKSnCoCAv
LzVzCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZjJmc19nYyhzYmksIHRydWUs
IGZhbHNlLCBOVUxMX1NFR05PKTsKCkkgdGhpbmsgd2UgbmVlZCB0byB1c2UgdGhpcyB0aW1lb3V0
IG1lY2hhbmlzbSB0byBhdm9pZCBtb3VudCBiZWluZyBoYW5nZWQgdG9vIGxvbmcKdGltZSBpZiBH
QyBuZWVkIG1hbnkgdGltZSB0byBoYW5kbGUgZnJhZ21lbnQgbWlncmF0aW9uLgoKPiBiKSBXaHkg
dGhlcmUgaXMgYSBjb25kaXRpb24gdGVzdCBhcyBiZWxvdyBpbiBmMmZzX2Rpc2FibGVfY3BfYWdh
aW4oKT8KCklJVUPvvIx3ZSBuZWVkIHRvIGNvbnNpZGVyIGV4dHJlbWUgY2FzZSwgZS5nLiBpZiBh
bGwgZnJhZ21lbnRlZCBzZWdtZW50J3MgdHlwZSBpcwpkYXRhLCBhbmQgdGhlcmUgaXMgbm8gZnJl
ZSBzZWdtZW50LCB0aGVuIHdlIG1heSBmYWlsIHRvIGZpbmQgYW55IGZyZWUgc3BhY2UgZm9yCm5l
d2x5IHdyaXR0ZW4gbm9kZSwgdmljZSB2ZXJzYS4KClNvIGR1cmluZyBtb3VudCwgd2UgYXJlIHRy
eWluZyB0byB0cmlnZ2VyIEdDIHRvIG1pZ3JhdGUgZnJhZ21lbnRlZCBibG9jayBhcyBtdWNoIGFz
CnBvc3NpYmxlLCB0byBnZXQgZW5vdWdoIGZyZWUgc2VnbWVudCBmb3IgbGF0ZXIgZGF0YS9ub2Rl
IHdyaXR0ZW4uCgo+IMKgwqDCoMKgIGlmIChob2xlc1tEQVRBXSA+IG92cCB8fCBob2xlc1tOT0RF
XSA+IG92cCkKPiDCoCDCoCDCoCDCoCDCoCDCoCByZXR1cm4gLUVBR0FJTjvCoCA8PDw8LS0tLSBt
b3VudCB3aWxsIHJldHVybiBoZXJlCj4gwqAgwqAgTXkgdGhpcyBpc3N1ZSBpcyB0aGUgY29kZSBy
ZXR1cm4gaW4gYWJvdmUgY29kZSBhbmQgZnNfbWdyIHdpbGwgbW91bnQgdXNlcmRhdGEgYWdhaW4g
YW5kIGFnYWluLgo+IAo+IENhbiB1IGtpbmRseSBoZWxwIHRvIGNvbW1lbnQgbXkgYWJvdmUgcXVl
c3Rpb25zP8KgCj4gQW5kIGlzIHRoZXJlIGlzIGFueSBzb2x1dGlvbiB0byBhdm9pZCBvciBpbXBy
b3ZlIHRoaXMgc2NlbmFyaW8gc2luY2UgaWYgdGhpcyBoYXBwZW4sIHdpbGwgaW1wYWN0IHRoZSBl
bmQgdXNlciBleHBlcmllbmNlKGVuZCB1c2VyIG1heSB0aGluayBwaG9uZSBnZXQgY29ycnVwdGVk
Li4uKS4gCgpDaGVja3BvaW50IGRpc2FibGluZyBpcyBvbmx5IHVzZWQgZm9yIHVwZ3JhZGluZyBv
ZiBkYXRhIHBhcnRpdGlvbiwgdXNlciBjYW4gYmVhciB0aGF0CmFzIHVwZ3JhZGluZyB1c3VhbGx5
IHRha2VzIGxvbmcgdGltZS4KClRoYW5rcywKCj4gCj4gVGhhbmtzLAo+IE1hbwo+IAo+IAo+IMKg
Cj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vm
b3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGlu
dXgtZjJmcy1kZXZlbAo=
