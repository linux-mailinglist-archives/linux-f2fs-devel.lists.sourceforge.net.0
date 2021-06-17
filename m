Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA923AABCB
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 17 Jun 2021 08:23:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ltlQQ-0000PU-LL; Thu, 17 Jun 2021 06:22:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <sunke32@huawei.com>) id 1ltlQL-0000PJ-MV
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Jun 2021 06:22:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DK/C0ep7Ae3gti8iLpiXG9J0lPQ8gN3ZD7kdsqgYpKE=; b=kWIGky34jiRyezoly0MX5XJHJz
 7pTAwLxq/AyJCozIGbpr9Bvi8oX31WatCZJv5j1HdE+gqDF+vQT/EHhAtc2L6SlGff8HhRuTPQrXA
 xVigXkgFm/PY497QMn6ke/em7ZyQcWRY9teDAL4tbbNexHbnNd6WwvIqW9uhqu/oOgNg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DK/C0ep7Ae3gti8iLpiXG9J0lPQ8gN3ZD7kdsqgYpKE=; b=nJ5+RfPU3dYxKCxNSqz+KqtSQn
 RaBLRfzv2ZXjJqMOQ5xTwvE4OwvaamNn9S18CSwkw5a9eKHYtmMFs3UpIgdPp3s+LzAOjYa/rNfYf
 gR0+wqq+oTLtX6quXBsWWn8aQKiBVBJfum/y6j9mWYFlnwptSCiXQJp7fwWWmfcx5MBQ=;
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1ltlQI-0004r2-Ut
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Jun 2021 06:22:46 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4G5Bg05m10zXgkg;
 Thu, 17 Jun 2021 14:17:32 +0800 (CST)
Received: from dggema759-chm.china.huawei.com (10.1.198.201) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Thu, 17 Jun 2021 14:22:35 +0800
Received: from [10.174.178.31] (10.174.178.31) by
 dggema759-chm.china.huawei.com (10.1.198.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Thu, 17 Jun 2021 14:22:34 +0800
To: Chao Yu <chao@kernel.org>, <linux-f2fs-devel@lists.sourceforge.net>
References: <20210611112211.1408767-1-sunke32@huawei.com>
 <20210611112211.1408767-2-sunke32@huawei.com>
 <1ea6a853-d892-4c3e-d023-72adc379b803@huawei.com>
 <aa3fef51-5633-800a-1d93-cbfb66453c2a@kernel.org>
From: Sun Ke <sunke32@huawei.com>
Message-ID: <50149b61-d9e1-9464-c5af-9f35d4542fc5@huawei.com>
Date: Thu, 17 Jun 2021 14:22:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <aa3fef51-5633-800a-1d93-cbfb66453c2a@kernel.org>
X-Originating-IP: [10.174.178.31]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggema759-chm.china.huawei.com (10.1.198.201)
X-CFilter-Loop: Reflected
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.187 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.3 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1ltlQI-0004r2-Ut
Subject: Re: [f2fs-dev] [PATCH] generic/103: leave more space for f2fs
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
Cc: guan@eryu.me, fstests@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

CgrlnKggMjAyMS82LzE2IDIxOjE1LCBDaGFvIFl1IOWGmemBkzoKPiBPbiAyMDIxLzYvMTUgMTE6
MjgsIFN1biBLZSB3cm90ZToKPj4gdG8gbGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQKPj4KPj4g5ZyoIDIwMjEvNi8xMSAxOToyMiwgU3VuIEtlIOWGmemBkzoKPj4+IEl0IGZh
aWxlZCBvbiBmMmZzOgo+Pj4gwqDCoMKgwqDCoCBRQSBvdXRwdXQgY3JlYXRlZCBieSAxMDMKPj4+
IMKgwqDCoMKgICtmYWxsb2NhdGU6IE5vIHNwYWNlIGxlZnQgb24gZGV2aWNlCj4+PiDCoMKgwqDC
oMKgIFNpbGVuY2UgaXMgZ29sZGVuLgo+Pj4gwqDCoMKgwqAgLi4uCj4+Pgo+Pj4gVHJ5IHRvIGxl
YXZlIH41MTJLQiwgYnV0IGR1cmluZyB0aGUgZmFsbG9jYXRlLCBmMmZzIHdpbGwgYmUgZmlsbGVk
Lgo+Pj4gUHJvdmlkZSBlcnJvciBwcm9tcHQ6ICJmYWxsb2NhdGU6IE5vIHNwYWNlIGxlZnQgb24g
ZGV2aWNlIi4KPj4+Cj4+PiBMZWF2ZSBtb3JlIHNwYWNlIGZvciBmMmZzLgo+Pj4KPj4+IFNpZ25l
ZC1vZmYtYnk6IFN1biBLZSA8c3Vua2UzMkBodWF3ZWkuY29tPgo+Pj4gLS0tCj4+PiBJIGFkZCBz
b21lIHRlc3QgY29kZQo+Pj4gwqDCoMKgwqArwqDCoMKgwqDCoMKgIGRmCj4+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGF2YWlsPWBfZ2V0X2F2YWlsYWJsZV9zcGFjZSAkU0NSQVRDSF9NTlRgCj4+
PiDCoMKgwqDCoCvCoMKgwqDCoMKgwqAgZWNobyAiYXZhaWwgPSAke2F2YWlsfSIKPj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgZmlsZXNpemVrYj0kKChhdmFpbCAvIDEwMjQgLSA1MTIpKQo+Pj4g
wqDCoMKgwqArwqDCoMKgwqDCoMKgIGVjaG8gImZpbGVzaXpla2IgPSAke2ZpbGVzaXpla2J9Igo+
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAkWEZTX0lPX1BST0cgLWZjICJmYWxsb2MgMCAke2Zp
bGVzaXpla2J9ayIgJGZpbGUKPj4+IMKgwqDCoMKgK8KgwqDCoMKgwqDCoCBkZgo+Pj4gwqDCoMKg
wqB9Cj4+Pgo+Pj4gZjJmczoKPj4+IMKgwqDCoMKgUUEgb3V0cHV0IGNyZWF0ZWQgYnkgMTAzCj4+
PiDCoMKgwqDCoCtGaWxlc3lzdGVtwqDCoMKgwqDCoMKgIDFLLWJsb2Nrc8KgwqDCoMKgwqDCoCBV
c2VkwqDCoCBBdmFpbGFibGUgVXNlJSBNb3VudGVkIG9uCj4+PiDCoMKgwqDCoC4uLgo+Pj4gwqDC
oMKgwqArL2Rldi9zZGLCoMKgwqDCoMKgwqDCoMKgwqAgMTI1ODA4NjTCoMKgwqDCoCA1NTMyOTLC
oMKgwqAgMTIwMjc1NzLCoMKgIDUlIC9tbnQvc2NyYXRjaAo+Pj4gwqDCoMKgwqArYXZhaWwgPSAx
MjMxNjIzMzcyOAo+Pj4gwqDCoMKgwqArZmlsZXNpemVrYiA9IDEyMDI3MDYwCj4+PiDCoMKgwqDC
oCtmYWxsb2NhdGU6IE5vIHNwYWNlIGxlZnQgb24gZGV2aWNlCj4+PiDCoMKgwqDCoCtGaWxlc3lz
dGVtwqDCoMKgwqDCoMKgIDFLLWJsb2Nrc8KgwqDCoMKgwqDCoCBVc2VkwqDCoCBBdmFpbGFibGUg
VXNlJSBNb3VudGVkIG9uCj4+PiDCoMKgwqDCoC4uLgo+Pj4gwqDCoMKgwqArL2Rldi9zZGLCoMKg
wqDCoMKgwqDCoMKgwqAgMTI1ODA4NjTCoMKgIDEyNTgwODY0wqDCoMKgwqDCoMKgwqDCoMKgwqAg
MCAxMDAlIC9tbnQvc2NyYXRjaAo+Pj4gwqDCoMKgwqBTaWxlbmNlIGlzIGdvbGRlbi4KPj4+Cj4+
PiB4ZnM6Cj4+PiDCoMKgwqDCoFFBIG91dHB1dCBjcmVhdGVkIGJ5IDEwMwo+Pj4gwqDCoMKgwqAr
RmlsZXN5c3RlbcKgwqDCoMKgwqDCoCAxSy1ibG9ja3PCoMKgwqDCoMKgwqAgVXNlZMKgwqAgQXZh
aWxhYmxlIFVzZSUgTW91bnRlZCBvbgo+Pj4gwqDCoMKgwqAuLi4KPj4+IMKgwqDCoMKgKy9kZXYv
c2RiwqDCoMKgwqDCoMKgwqDCoMKgIDEyNTcyNjcywqDCoMKgwqAgMTIwODI4wqDCoMKgIDEyNDUx
ODQ0wqDCoCAxJSAvbW50L3NjcmF0Y2gKPj4+IMKgwqDCoMKgK2F2YWlsID0gMTI3NTA2ODgyNTYK
Pj4+IMKgwqDCoMKgK2ZpbGVzaXpla2IgPSAxMjQ1MTMzMgo+Pj4gwqDCoMKgwqArRmlsZXN5c3Rl
bcKgwqDCoMKgwqDCoCAxSy1ibG9ja3PCoMKgwqDCoMKgwqAgVXNlZMKgwqAgQXZhaWxhYmxlIFVz
ZSUgTW91bnRlZCBvbgo+Pj4gwqDCoMKgwqAuLi4KPj4+IMKgwqDCoMKgKy9kZXYvc2RiwqDCoMKg
wqDCoMKgwqDCoMKgIDEyNTcyNjcywqDCoCAxMjU3MjE2MMKgwqDCoMKgwqDCoMKgwqAgNTEyIDEw
MCUgL21udC9zY3JhdGNoCj4+PiDCoMKgwqDCoFNpbGVuY2UgaXMgZ29sZGVuLgo+Pj4KPj4+IGV4
dDQ6Cj4+PiDCoMKgwqDCoFFBIG91dHB1dCBjcmVhdGVkIGJ5IDEwMwo+Pj4gwqDCoMKgwqArRmls
ZXN5c3RlbcKgwqDCoMKgwqDCoCAxSy1ibG9ja3PCoMKgwqDCoMKgwqAgVXNlZMKgwqAgQXZhaWxh
YmxlIFVzZSUgTW91bnRlZCBvbgo+Pj4gwqDCoMKgwqAuLi4KPj4+IMKgwqDCoMKgKy9kZXYvc2Ri
wqDCoMKgwqDCoMKgwqDCoMKgIDEyMzE5ODgwwqDCoMKgwqDCoCA0MTA0OMKgwqDCoCAxMTYzMzMw
NMKgwqAgMSUgL21udC9zY3JhdGNoCj4+PiDCoMKgwqDCoCthdmFpbCA9IDExOTEyNTAzMjk2Cj4+
PiDCoMKgwqDCoCtmaWxlc2l6ZWtiID0gMTE2MzI3OTIKPj4+IMKgwqDCoMKgK0ZpbGVzeXN0ZW3C
oMKgwqDCoMKgwqAgMUstYmxvY2tzwqDCoMKgwqDCoMKgIFVzZWTCoMKgIEF2YWlsYWJsZSBVc2Ul
IE1vdW50ZWQgb24KPj4+IMKgwqDCoMKgLi4uCj4+PiDCoMKgwqDCoCsvZGV2L3NkYsKgwqDCoMKg
wqDCoMKgwqDCoCAxMjMxOTg4MMKgwqAgMTE2NzM4NDTCoMKgwqDCoMKgwqDCoMKgIDUwOCAxMDAl
IC9tbnQvc2NyYXRjaAo+Pj4gwqDCoMKgwqBTaWxlbmNlIGlzIGdvbGRlbi4KPj4+Cj4+PiBhZnRl
ciBjaGFuZ2UgKGYyZnMpCj4+PiDCoMKgwqDCoFFBIG91dHB1dCBjcmVhdGVkIGJ5IDEwMwo+Pj4g
wqDCoMKgwqBGaWxlc3lzdGVtwqDCoMKgwqDCoMKgIDFLLWJsb2Nrc8KgwqDCoMKgwqDCoCBVc2Vk
wqDCoCBBdmFpbGFibGUgVXNlJSBNb3VudGVkIG9uCj4+PiDCoMKgwqDCoC4uLgo+Pj4gwqDCoMKg
wqAvZGV2L3NkYsKgwqDCoMKgwqDCoMKgwqDCoCAxMjU4MDg2NMKgwqAgMTI1ODAzOTbCoMKgwqDC
oMKgwqDCoMKgIDQ2OCAxMDAlIC90bXAvc2NyYXRjaAo+Pj4gwqDCoMKgwqBTaWxlbmNlIGlzIGdv
bGRlbi4KPj4+Cj4+PiDCoCB0ZXN0cy9nZW5lcmljLzEwMyB8IDEwICsrKysrKysrKy0KPj4+IMKg
IDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4+Cj4+PiBk
aWZmIC0tZ2l0IGEvdGVzdHMvZ2VuZXJpYy8xMDMgYi90ZXN0cy9nZW5lcmljLzEwMwo+Pj4gaW5k
ZXggYjIyYjAxNTk2MjNlLi5kZmNlMzg3MDc4MWMgMTAwNzU1Cj4+PiAtLS0gYS90ZXN0cy9nZW5l
cmljLzEwMwo+Pj4gKysrIGIvdGVzdHMvZ2VuZXJpYy8xMDMKPj4+IEBAIC00MCwxMCArNDAsMTgg
QEAgcm0gLWYgJHNlcXJlcy5mdWxsCj4+PiDCoCBfY29uc3VtZV9mcmVlc3AoKQo+Pj4gwqAgewo+
Pj4gwqDCoMKgwqDCoCBmaWxlPSQxCj4+PiArwqDCoMKgIGxlYXZlPTUxMgo+Pj4gKwo+Pj4gK8Kg
wqDCoCAjIFRyeSB0byBsZWF2ZSB+NTEyS0IsIGJ1dCBkdXJpbmcgdGhlIGZhbGxvY2F0ZSwgZjJm
cyB3aWxsIGJlIAo+Pj4gZmlsbGVkLgo+Pj4gK8KgwqDCoCAjIFByb3ZpZGUgZXJyb3IgcHJvbXB0
OiAiZmFsbG9jYXRlOiBObyBzcGFjZSBsZWZ0IG9uIGRldmljZSIuIExlYXZlCj4+PiArwqDCoMKg
ICMgbW9yZSBzcGFjZSBmb3IgZjJmcy4KPj4+ICvCoMKgwqAgaWYgWyAkRlNUWVAgPT0gImYyZnMi
IF07IHRoZW4KPj4+ICvCoMKgwqDCoMKgwqDCoCBsZWF2ZT0xMjI4OAo+Pj4gK8KgwqDCoCBmaQo+
Pj4gwqDCoMKgwqDCoCAjIGNvbnN1bWUgbmVhcmx5IGFsbCBhdmFpbGFibGUgc3BhY2UgKGxlYXZl
IH41MTJrQikKPj4+IMKgwqDCoMKgwqAgYXZhaWw9YF9nZXRfYXZhaWxhYmxlX3NwYWNlICRTQ1JB
VENIX01OVGAKPiAKPiAgwqDCoMKgwqDCoMKgwqAgaWYgWyAkRlNUWVAgPT0gImYyZnMiIF07IHRo
ZW4KPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGxlZnQ9JCgobGVmdCArIGF2YWls
IC8gMTAyNDAwMCkpCj4gIMKgwqDCoMKgwqDCoMKgIGZpCj4gCj4gZjJmcyB1c2VzIGluZGV4KHJh
ZGl4KSB0cmVlIGFzIG1hcHBpbmcgbWV0YWRhdGEsIGl0cyBzcGFjZSBvdmVyaGVhZAo+IGlzIGFi
b3V0IG9uZSB0aG91c2FuZHRoIG9mIHRoZSBkYXRhLCBzbyBjYW4geW91IHBsZWFzZSB0cnkgYWJv
dmUKPiBjYWxjdWxhdGlvbj8KPiAKPiBUaGFua3MsCkkgaGF2ZSB0cmllZCB5b3VyIGNhbGN1bGF0
aW9uLCBpdCB3b3Jrcy4gSSB3aWxsIHNlbmQgdjIgcGF0Y2guCgpUaGFua3MsClN1biBLZQo+IAo+
Pj4gLcKgwqDCoCBmaWxlc2l6ZWtiPSQoKGF2YWlsIC8gMTAyNCAtIDUxMikpCj4+PiArwqDCoMKg
IGZpbGVzaXpla2I9JCgoYXZhaWwgLyAxMDI0IC0gJGxlYXZlKSkKPj4+IMKgwqDCoMKgwqAgJFhG
U19JT19QUk9HIC1mYyAiZmFsbG9jIDAgJHtmaWxlc2l6ZWtifWsiICRmaWxlCj4+PiDCoCB9Cj4+
Pgo+Pgo+Pgo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+PiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+PiBMaW51eC1mMmZzLWRldmVsQGxp
c3RzLnNvdXJjZWZvcmdlLm5ldAo+PiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0
cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCj4gLgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Ckxp
bnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNl
Zm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
