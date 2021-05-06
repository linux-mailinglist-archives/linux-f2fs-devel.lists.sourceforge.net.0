Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E87A1375157
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  6 May 2021 11:15:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lea6L-0007Ho-8P; Thu, 06 May 2021 09:15:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1lea6J-0007HD-UI
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 06 May 2021 09:15:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fTeZ6zr5fGc/de/GQbw/MmzSYydlNqQ/Cotf0dXnAes=; b=mlpDed1kTiwKhi4Zw5q3US06jN
 5yc7tRfzV908e7UX0kEYVvTZEbQmUt//jKOHLSgGMh+svlnuSacs0ksIsNp1j9aeeHE4yVJ99R9VD
 PyqntJbZtIiwN9XovXdAVXYZIscuBiusfk0TPcFKmx8zoE6upM0fxOlBbkmj7s1BXIkc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fTeZ6zr5fGc/de/GQbw/MmzSYydlNqQ/Cotf0dXnAes=; b=CKwnV02D3QK2AM4ivsv2pWR49z
 y2CqM7QK7e1gqGYd3IX6kNXQQLFwX+r7Y7Qw3S6bkdQm2iB+X8uzeoWEqIoNm6N834oQlFYPixq4g
 R93lZOLt0G39/M7w+mw1U+FoWlPa4f2zBLim7yetTaKj/xgneZ5JR5ihq1gU1x/AjJTk=;
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lea6G-004QgM-TN
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 06 May 2021 09:15:20 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FbSXr3DjpzklTq;
 Thu,  6 May 2021 17:13:00 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by smtp.huawei.com
 (10.3.19.208) with Microsoft SMTP Server (TLS) id 14.3.498.0; Thu, 6 May 2021
 17:15:05 +0800
To: Gao Xiang <hsiangkao@redhat.com>, <changfengnan@vivo.com>
References: <20210426021153.646-1-changfengnan@vivo.com>
 <20210426031902.GA3934275@xiangao.remote.csb>
 <004c01d73a78$12f23a30$38d6ae90$@vivo.com>
 <20210426090024.GB4042836@xiangao.remote.csb>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <103e8ec4-d14f-0f2a-72d4-ffd4e215685f@huawei.com>
Date: Thu, 6 May 2021 17:15:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20210426090024.GB4042836@xiangao.remote.csb>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [45.249.212.32 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lea6G-004QgM-TN
Subject: Re: [f2fs-dev] =?utf-8?b?562U5aSNOiBbUEFUQ0hdIGYyZnM6IGNvbXByZXNz?=
 =?utf-8?q?=3A_avoid_unnecessary_check_in_f2fs=5Fprepare=5Fcompress=5Fover?=
 =?utf-8?q?write?=
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMS80LzI2IDE3OjAwLCBHYW8gWGlhbmcgd3JvdGU6Cj4gT24gTW9uLCBBcHIgMjYsIDIw
MjEgYXQgMDQ6NDI6MjBQTSArMDgwMCwgY2hhbmdmZW5nbmFuQHZpdm8uY29tIHdyb3RlOgo+PiBU
aGFuayB5b3UgZm9yIHRoZSByZW1pbmRlciwgSSBoYWRuJ3QgdGhvdWdodCBhYm91dCBmYWxsb2Nh
dGUgYmVmb3JlLgo+PiBJIGhhdmUgZG9uZSBzb21lIHRlc3RzIGFuZCB0aGUgcmVzdWx0cyBhcmUg
YXMgZXhwZWN0ZWQuCj4+IEhlcmUgaXMgbXkgdGVzdCBtZXRob2QsIGNyZWF0ZSBhIGNvbXByZXNz
ZWQgZmlsZSwgYW5kIHVzZSBmYWxsb2NhdGUgd2l0aCBrZWVwIHNpemUsIHdoZW4gd3JpdGUgZGF0
YSB0byBleHBhbmQgYXJlYSwgZjJmc19wcmVwYXJlX2NvbXByZXNzX292ZXJ3cml0ZQo+PiBhbHdh
eXMgcmV0dXJuIDAsIHRoZSBiZWhhdmlvciBpcyBzYW1lIGFzIG15IHBhdGNoICwgYXBwbHkgbXkg
cGF0Y2ggY2FuIGF2b2lkIHRob3NlIGNoZWNrLgo+PiBJcyB0aGVyZSBhbnl0aGluZyBlbHNlIEkg
aGF2ZW4ndCB0aG91Z2h0IG9mPwo+IAo+IE5vcGUsIEkgZGlkbid0IGxvb2sgaW50byB0aGUgaW1w
bGVtZW50YXRpb24uIEp1c3QgYSB3aWxkIGd1ZXNzLgo+IAo+IChJIGp1c3Qgd29uZGVyZWQgaWYg
dGhlIGNsdXN0ZXIgc2l6ZSBpcyBzb21ld2hhdCBsYXJnZSAoZS5nLiA2NGspLAo+ICAgYnV0IHdp
dGggYSBwYXJ0aWFsIGZhbGxvY2F0ZSAoZS5nLiAxNmspLCBhbmQgZG9lcyBpdCBiZWhhdmUgb2s/
Cj4gICBvciBzb21lIG90aGVyIGNvcm5lciBjYXNlcy9jb25kaXRpb25zIGFyZSBuZWVkZWQuKQoK
WGlhbmcsIHNvcnJ5IGZvciBsYXRlIHJlcGx5LgoKTm93LCBmMmZzIHRyaWdnZXJzIGNvbXByZXNz
aW9uIG9ubHkgaWYgb25lIGNsdXN0ZXIgaXMgZnVsbHkgd3JpdHRlbiwKZS5nLiBjbHVzdGVyIHNp
emUgaXMgMTZrYiwgaXNpemUgaXMgOGtiLCB0aGVuIHRoZSBmaXJzdCBjbHVzdGVyIGlzCm5vbi1j
b21wcmVzc2VkIG9uZSwgc28gd2UgZG9uJ3QgbmVlZCB0byBwcmVwYXJlIGZvciBjb21wcmVzc2Vk
CmNsdXN0ZXIgb3ZlcndyaXRlIGR1cmluZyB3cml0ZV9iZWdpbigpLiBBbHNvLCBibG9ja3MgZmFs
bG9jYXRlZApiZXlvbmQgaXNpemUgc2hvdWxkIG5ldmVyIGJlIGNvbXByZXNzZWQsIHNvIHdlIGRv
bid0IG5lZWQgdG8gd29ycnkKYWJvdXQgdGhhdC4KClRoYW5rcywKCj4gCj4gSWYgdGhhdCBpcyBm
aW5lLCBJIGhhdmUgbm8gcHJvYmxlbSBhYm91dCB0aGlzLCB5ZXQgaV9zaXplIGhlcmUKPiBpcyBn
ZW5lcmFsbHkgc29tZXdoYXQgcmlza3kgc2luY2UgYWZ0ZXIgcG9zdC1FT0YgYmVoYXZpb3IKPiBj
aGFuZ2VzIChlLmcuIHN1cHBvcnRpbmcgRkFMTE9DX0ZMX1pFUk9fUkFOR0Ugd2l0aCBrZWVwIHNp
emUKPiBsYXRlciksIGl0IG1heSBjYXVzZSBzb21lIHBvdGVudGlhbCByZWdyZXNzaW9uLgo+IAo+
Pgo+PiAtLS0tLemCruS7tuWOn+S7ti0tLS0tCj4+IOWPkeS7tuS6ujogR2FvIFhpYW5nIDxoc2lh
bmdrYW9AcmVkaGF0LmNvbT4KPj4g5Y+R6YCB5pe26Ze0OiAyMDIx5bm0NOaciDI25pelIDExOjE5
Cj4+IOaUtuS7tuS6ujogRmVuZ25hbiBDaGFuZyA8Y2hhbmdmZW5nbmFuQHZpdm8uY29tPgo+PiDm
ioTpgIE6IGNoYW9Aa2VybmVsLm9yZzsgamFlZ2V1a0BrZXJuZWwub3JnOwo+PiBsaW51eC1mMmZz
LWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+PiDkuLvpopg6IFJlOiBbZjJmcy1kZXZdIFtQ
QVRDSF0gZjJmczogY29tcHJlc3M6IGF2b2lkIHVubmVjZXNzYXJ5IGNoZWNrIGluCj4+IGYyZnNf
cHJlcGFyZV9jb21wcmVzc19vdmVyd3JpdGUKPj4KPj4gT24gTW9uLCBBcHIgMjYsIDIwMjEgYXQg
MTA6MTE6NTNBTSArMDgwMCwgRmVuZ25hbiBDaGFuZyB3cm90ZToKPj4+IHdoZW4gd3JpdGUgY29t
cHJlc3NlZCBmaWxlIHdpdGggT19UUlVOQywgdGhlcmUgd2lsbCBiZSBhIGxvdCBvZgo+Pj4gdW5u
ZWNlc3NhcnkgY2hlY2sgdmFsaWQgYmxvY2tzIGluIGYyZnNfcHJlcGFyZV9jb21wcmVzc19vdmVy
d3JpdGUsCj4+PiBlc3BlY2lhbGx5IHdoZW4gd3JpdHRlbiBpbiBwYWdlIHNpemUsIHJlbW92ZSBp
dC4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBGZW5nbmFuIENoYW5nIDxjaGFuZ2ZlbmduYW5Adml2
by5jb20+Cj4+Cj4+IEV2ZW4gdGhvdWdoIEkgZGlkbid0IGxvb2sgaW50byB0aGUgd2hvbGUgdGhp
bmcsIG15IHJlYWN0aW9uIGhlcmUgaXMgcm91Z2hseQo+PiBob3cgdG8gaGFuZGxlIGZhbGxvY2F0
ZSB3aXRoIGtlZXAgc2l6ZT8gRG9lcyBpdCB3b3JrIGFzIGV4cGVjdGVkPwo+Pgo+Pj4gLS0tCj4+
PiAgIGZzL2YyZnMvZGF0YS5jIHwgNCArKysrCj4+PiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKykKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9kYXRhLmMgYi9mcy9mMmZzL2Rh
dGEuYyBpbmRleAo+Pj4gY2Y5MzU0NzRmZmJhLi45YzNiMDg0OWYzNWUgMTAwNjQ0Cj4+PiAtLS0g
YS9mcy9mMmZzL2RhdGEuYwo+Pj4gKysrIGIvZnMvZjJmcy9kYXRhLmMKPj4+IEBAIC0zMjcwLDYg
KzMyNzAsNyBAQCBzdGF0aWMgaW50IGYyZnNfd3JpdGVfYmVnaW4oc3RydWN0IGZpbGUgKmZpbGUs
Cj4+PiBzdHJ1Y3QgYWRkcmVzc19zcGFjZSAqbWFwcGluZywKPj4+ICAgCXN0cnVjdCBmMmZzX3Ni
X2luZm8gKnNiaSA9IEYyRlNfSV9TQihpbm9kZSk7Cj4+PiAgIAlzdHJ1Y3QgcGFnZSAqcGFnZSA9
IE5VTEw7Cj4+PiAgIAlwZ29mZl90IGluZGV4ID0gKCh1bnNpZ25lZCBsb25nIGxvbmcpIHBvcykg
Pj4gUEFHRV9TSElGVDsKPj4+ICsJcGdvZmZfdCBlbmQgPSAoaV9zaXplX3JlYWQoaW5vZGUpICsg
UEFHRV9TSVpFIC0gMSkgPj4gUEFHRV9TSElGVDsKPj4+ICAgCWJvb2wgbmVlZF9iYWxhbmNlID0g
ZmFsc2UsIGRyb3BfYXRvbWljID0gZmFsc2U7Cj4+PiAgIAlibG9ja190IGJsa2FkZHIgPSBOVUxM
X0FERFI7Cj4+PiAgIAlpbnQgZXJyID0gMDsKPj4+IEBAIC0zMzA2LDYgKzMzMDcsOSBAQCBzdGF0
aWMgaW50IGYyZnNfd3JpdGVfYmVnaW4oc3RydWN0IGZpbGUgKmZpbGUsCj4+PiBzdHJ1Y3QgYWRk
cmVzc19zcGFjZSAqbWFwcGluZywKPj4+Cj4+PiAgIAkJKmZzZGF0YSA9IE5VTEw7Cj4+Pgo+Pj4g
KwkJaWYgKGluZGV4ID49IGVuZCkKPj4+ICsJCQlnb3RvIHJlcGVhdDsKPj4+ICsKPj4+ICAgCQly
ZXQgPSBmMmZzX3ByZXBhcmVfY29tcHJlc3Nfb3ZlcndyaXRlKGlub2RlLCBwYWdlcCwKPj4+ICAg
CQkJCQkJCWluZGV4LCBmc2RhdGEpOwo+Pj4gICAJCWlmIChyZXQgPCAwKSB7Cj4+PiAtLQo+Pj4g
Mi4yOS4wCj4+Cj4+Cj4+Cj4+Cj4+Cj4+Cj4+Cj4gCj4gCj4gCj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcg
bGlzdAo+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4gaHR0cHM6Ly9s
aXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo+IAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYy
ZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2Uu
bmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYy
ZnMtZGV2ZWwK
