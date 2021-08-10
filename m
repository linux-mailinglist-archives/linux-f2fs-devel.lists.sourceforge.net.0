Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1793E50C3
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Aug 2021 03:50:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mDGuJ-0001Fp-Li; Tue, 10 Aug 2021 01:50:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <changfengnan@vivo.com>) id 1mDGuH-0001Fi-SM
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 10 Aug 2021 01:50:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=naiNAW4sX1bqo3OZ92uw/QogSPL8RO3RkVBbfIkn5ko=; b=JKuNMIWWJxE6BpGUmgwkmyYbcW
 W9Gq3gGBdzQa5UBRhZe3tpQVHWA7rtW5Z1OHcjP6JLlGdb79OMFm1pTWV+YFfFjuMNlDhn39/GgEl
 MC/a2ltJyn9P/3ub4kQAiZbIFHl6jQIdCsqSvZP3gell1eYSGWA4ytaI7+03RPCjdUjs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=naiNAW4sX1bqo3OZ92uw/QogSPL8RO3RkVBbfIkn5ko=; b=JFBPHbkhSBnv9iS6wJ4OJiQp1g
 xy1w0jrFWXO3rW920o+C9ex1p+t9s33YCDmhHyD0+Sd288QQ8tR6o0ohBCJrYKw7/rnfguFJf+iRw
 MBbbP6kKXVbPIElnhV0wKqqzowLN5KAyAYdnM+4Q3wzLXP0MLrTVwXABqUN6sSTuT0rY=;
Received: from mail-m17654.qiye.163.com ([59.111.176.54])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mDGu9-001J97-By
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 10 Aug 2021 01:50:17 +0000
Received: from [172.25.44.145] (unknown [58.250.176.229])
 by mail-m17654.qiye.163.com (Hmail) with ESMTPA id AB87420110;
 Tue, 10 Aug 2021 09:50:01 +0800 (CST)
To: Chao Yu <chao@kernel.org>, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20210722032536.150423-1-changfengnan@vivo.com>
 <b2ce8000-226e-6dfa-0052-36cb2faeaf3a@kernel.org>
 <72752bc5-c8b9-43b2-ca82-d7364238649e@vivo.com>
 <1c45e327-00f4-1cc8-b168-9a7b571ba47a@kernel.org>
 <a8412e91-e43c-6801-b45c-52d390921b17@vivo.com>
 <73f298ed-e945-5b7d-a9b8-69aafeb7ac05@kernel.org>
From: Fengnan Chang <changfengnan@vivo.com>
Message-ID: <f086b56f-180b-5e16-e88e-5baf400e1bd4@vivo.com>
Date: Tue, 10 Aug 2021 09:50:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <73f298ed-e945-5b7d-a9b8-69aafeb7ac05@kernel.org>
Content-Language: en-US
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
 kWDxoPAgseWUFZKDYvK1lXWShZQUhPN1dZLVlBSVdZDwkaFQgSH1lBWRoYSUlWGR9ISUpIHU9PS0
 1IVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktISkNVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PT46Fxw6Nz9DPS4PSU0zNBEj
 Ei5PCT9VSlVKTUlDTk1LSUtJSEpNVTMWGhIXVRgTGhUcHR4VHBUaFTsNEg0UVRgUFkVZV1kSC1lB
 WU5DVUlOS1VKTE1VSUlCWVdZCAFZQU5KSUI3Bg++
X-HM-Tid: 0a7b2dc09845d9fdkuwsab87420110
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [59.111.176.54 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [59.111.176.54 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1mDGu9-001J97-By
Subject: Re: [f2fs-dev] [RFC PATCH] f2fs: compress: avoid duplicate counting
 of valid blocks when read compressed file
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

VW0sIGluIHByZXZpb3VzIHRob3VnaHQsIGNvbnNpZGVyIG9mIHJhbmRvbSByZWFkIGZvciBub24t
Y29tcHJlc3NlZApjbHVzdGVyLCBJIGRpZG4ndCBoYW5kbGUgbm9uLWNvbXByZXNzZWQgY2x1c3Rl
ciwgYWZ0ZXIgeW91ciByZW1pbmQsIEkgCnRoaW5rIHdlIGNhbiBza2lwIGYyZnNfaXNfY29tcHJl
c3NlZF9jbHVzdGVyKCkgY2hlY2sgZm9yIHNlcXVlbnRpYWwgcmVhZCAKZm9yIG5vbi1jb21wcmVz
c2VkIGNsdXN0ZXIuCgpPbiAyMDIxLzgvOSAyMjozOCwgQ2hhbyBZdSB3cm90ZToKPiBPbiAyMDIx
LzgvOSAxMTo0NiwgRmVuZ25hbiBDaGFuZyB3cm90ZToKPj4gSGkgY2hhbzoKPj4gwqDCoMKgwqAg
U2luY2UgY2MuY2x1c3Rlcl9pZHggb25seSB3aWxsIGJlIHNldCBpbiBmMmZzX2NvbXByZXNzX2N0
eF9hZGRfcGFnZSwKPj4gc28gZm9yIG5vbi1jb21wcmVzc2VkIGNsdXN0ZXIsIGNjLmNsdXN0ZXJf
aWR4IHNob3VsZCBhbHdheXMgYmUgTlVMTC4gaXQKPj4gbWVhbnMgdGhhdCB0aGUgaGFuZGxpbmcg
cHJvY2VzcyBvZiBub24tY29tcHJlc3NlZCBjbHVzdGVyIGlzIHNhbWUgYXMgCj4+IG9sZGVyLgo+
IAo+IFl1cCwgc28gd2hhdCBJIG1lYW4gaXMgd2h5IG5vdCBza2lwcGluZyBmMmZzX2lzX2NvbXBy
ZXNzZWRfY2x1c3RlcigpIGNoZWNrCj4gZm9yIG5vbi1jb21wcmVzc2VkIGNsdXN0ZXIgYXMgd2Ug
ZGlkIGZvciBjb21wcmVzc2VkIGNsdXN0ZXIuCj4gCj4gVGhhbmtzLAo+IAo+Pgo+PiBPbiAyMDIx
LzgvNiA4OjU3LCBDaGFvIFl1IHdyb3RlOgo+Pj4gT24gMjAyMS83LzIzIDExOjE4LCBGZW5nbmFu
IENoYW5nIHdyb3RlOgo+Pj4+IGYyZnNfcmVhZF9tdWx0aV9wYWdlcyB3aWxsIGhhbmRsZe+8jGFs
bCB0cnVuY2F0ZSBwYWdlIHdpbGwgYmUgemVybyBvdXQsCj4+Pj4gV2hldGhlciBwYXJ0aWFsIG9y
IGFsbCBwYWdlIGluIGNsdXN0ZXIuCj4+Pj4KPj4+Pgo+Pj4+IE9uIDIwMjEvNy8yMiAyMTo0Nywg
Q2hhbyBZdSB3cm90ZToKPj4+Pj4gT24gMjAyMS83LzIyIDExOjI1LCBGZW5nbmFuIENoYW5nIHdy
b3RlOgo+Pj4+Pj4gU2luY2UgY2x1c3RlciBpcyBiYXNpYyB1bml0IG9mIGNvbXByZXNzaW9uLCBv
bmUgY2x1c3RlciBpcwo+Pj4+Pj4gY29tcHJlc3NlZCBvcgo+Pj4+Pj4gbm90LCBzbyB3ZSBjYW4g
Y2FsY3VsYXRlIHZhbGlkIGJsb2NrcyBvbmx5IGZvciBmaXJzdCBwYWdlIGluCj4+Pj4+PiBjbHVz
dGVyLCB0aGUKPj4+Pj4+IG90aGVyIHBhZ2VzIGp1c3Qgc2tpcC4KPj4+Pj4+Cj4+Pj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBGZW5nbmFuIENoYW5nIDxjaGFuZ2ZlbmduYW5Adml2by5jb20+Cj4+Pj4+PiAt
LS0KPj4+Pj4+IMKgwqDCoCBmcy9mMmZzL2RhdGEuYyB8IDEzICsrKysrKystLS0tLS0KPj4+Pj4+
IMKgwqDCoCAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+
Pj4+Pj4KPj4+Pj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2RhdGEuYyBiL2ZzL2YyZnMvZGF0YS5j
Cj4+Pj4+PiBpbmRleCBkMmNmNDhjNWEyZTQuLmEwMDk5ZDgzMjlmMCAxMDA2NDQKPj4+Pj4+IC0t
LSBhL2ZzL2YyZnMvZGF0YS5jCj4+Pj4+PiArKysgYi9mcy9mMmZzL2RhdGEuYwo+Pj4+Pj4gQEAg
LTIzMDQsMTIgKzIzMDQsMTMgQEAgc3RhdGljIGludCBmMmZzX21wYWdlX3JlYWRwYWdlcyhzdHJ1
Y3QgaW5vZGUKPj4+Pj4+ICppbm9kZSwKPj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGlmIChyZXQpCj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gc2V0X2Vycm9yX3BhZ2U7Cj4+Pj4+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0
ID0gZjJmc19pc19jb21wcmVzc2VkX2NsdXN0ZXIoaW5vZGUsIHBhZ2UtPmluZGV4KTsKPj4+Pj4+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChyZXQgPCAwKQo+Pj4+Pj4gLcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIHNldF9lcnJvcl9wYWdlOwo+Pj4+Pj4gLcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgZWxzZSBpZiAoIXJldCkKPj4+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgZ290byByZWFkX3NpbmdsZV9wYWdlOwo+Pj4+Pgo+Pj4+PiBIb3cgYWJvdXQg
dHJ1bmNhdGlvbiByYWNlcyB3aXRoIHJlYWQ/Cj4+Pgo+Pj4gTG9vayBpbnRvIHRoaXMgYWdhaW4s
IGl0IGxvb2tzIGZpbmUsIHRydW5jYXRpb24gdHJpZXMgdG8gZ3JhYiBhbGwgcGFnZXMKPj4+IGxv
Y2sKPj4+IG9mIGNsdXN0ZXIsIGJ1dCByZWFkYWhlYWQgaGFzIGFscmVhZHkgaGVsZCBzb21lL2Fs
bCBvZiB0aGVtLCBzbyB0aGVyZSAKPj4+IGlzIG5vCj4+PiBzdWNoIHJhY2UgY29uZGl0aW9uLgo+
Pj4KPj4+IFNvIGNvbXByZXNzZWQgY2x1c3RlciBjYXNlIGxvb2tzIGZpbmUgdG8gbWUsIGJ1dCB3
ZSBzdGlsbCBuZWVkIHRvIGNhbGwKPj4+IGYyZnNfaXNfY29tcHJlc3NlZF9jbHVzdGVyKCkgZXZl
cnkgdGltZSBmb3Igbm9uLWNvbXByZXNzZWQgY2x1c3RlciwgCj4+PiBjb3VsZAo+Pj4geW91IHBs
ZWFzZSBjaGVjayB0aGF0IGFzIHdlbGw/Cj4+Pgo+Pj4gVGhhbmtzLAo+Pj4KPj4+Pj4KPj4+Pj4g
VGhhbmtzLAo+Pj4+Pgo+Pj4+Pj4gLQo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYg
KGNjLmNsdXN0ZXJfaWR4ID09IE5VTExfQ0xVU1RFUikgewo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCByZXQgPSBmMmZzX2lzX2NvbXByZXNzZWRfY2x1c3Rlcihpbm9kZSwg
Cj4+Pj4+PiBwYWdlLT5pbmRleCk7Cj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGlmIChyZXQgPCAwKQo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGdvdG8gc2V0X2Vycm9yX3BhZ2U7Cj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGVsc2UgaWYgKCFyZXQpCj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgZ290byByZWFkX3NpbmdsZV9wYWdlOwo+Pj4+Pj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgfQo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldCA9
IGYyZnNfaW5pdF9jb21wcmVzc19jdHgoJmNjKTsKPj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBpZiAocmV0KQo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgZ290byBzZXRfZXJyb3JfcGFnZTsKPj4+Pj4+Cj4+Pj4+Cj4+Pgo+IAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2
ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0
dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2
ZWwK
