Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBAE3AA9B4
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 17 Jun 2021 05:45:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ltiyH-0002TP-J6; Thu, 17 Jun 2021 03:45:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sunke32@huawei.com>) id 1ltiy9-0002T7-0P
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Jun 2021 03:45:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DYsp5RbBMFLDDJTjJv16jYjrHo49b9rOsVrIGxN3tkg=; b=CDa/1u3ln/XOth2j4vRk8UFW6V
 +6GZh/9JxNxBHM1z2tb5v5lqdCSoP+BbELhEdzBSBJJHJwDJicfOLa6OXmMqiS1VboP8vXlXvD3tl
 ZOOSpAokbJjX+MrR6GczyK4b+MhhHJfvOSu6DswJbTU8mb76mH8/3OBzkJkr0b9SaJf4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DYsp5RbBMFLDDJTjJv16jYjrHo49b9rOsVrIGxN3tkg=; b=KJE7cX0ANHiGV1xddkBczHKCjY
 bhwbCF59j/poTwcmLiHd15dGMKfnHv2OfziYYo6ZZbjl+D1KReQzNz6xbhAk+Q8RpTOWxLrDY+1pm
 zH+5maESlQaWbDrERGcDWNJhUx5Ux8LOJhgIT4iDLySqtuZp/kJRSj4tYGU53MMENIp4=;
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1ltiy0-00D9m0-Hh
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Jun 2021 03:45:32 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4G57BY6ZV0z6vvn;
 Thu, 17 Jun 2021 11:41:09 +0800 (CST)
Received: from dggema759-chm.china.huawei.com (10.1.198.201) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Thu, 17 Jun 2021 11:45:09 +0800
Received: from [10.174.178.31] (10.174.178.31) by
 dggema759-chm.china.huawei.com (10.1.198.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Thu, 17 Jun 2021 11:45:08 +0800
To: Chao Yu <chao@kernel.org>, <fstests@vger.kernel.org>, <guan@eryu.me>,
 <yuchao0@huawei.com>, <linux-f2fs-devel@lists.sourceforge.net>
References: <20210611112211.1408767-1-sunke32@huawei.com>
 <d95c4ac2-50a2-4f08-3940-ac0597266280@huawei.com>
 <258b1228-2a8a-e4c1-cf6c-695f49c0cca0@kernel.org>
From: Sun Ke <sunke32@huawei.com>
Message-ID: <963534d2-5a42-c4c6-8bc6-013f120ecffd@huawei.com>
Date: Thu, 17 Jun 2021 11:45:08 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <258b1228-2a8a-e4c1-cf6c-695f49c0cca0@kernel.org>
X-Originating-IP: [10.174.178.31]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggema759-chm.china.huawei.com (10.1.198.201)
X-CFilter-Loop: Reflected
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.2 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1ltiy0-00D9m0-Hh
Subject: Re: [f2fs-dev] [PATCH] common/rc: f2fs do not support metadata
 journaling
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

CgrlnKggMjAyMS82LzE2IDIwOjM2LCBDaGFvIFl1IOWGmemBkzoKPiBPbiAyMDIxLzYvMTUgMTE6
MjUsIFN1biBLZSB3cm90ZToKPj4KPj4KPj4g5ZyoIDIwMjEvNi8xMSAxOToyMiwgU3VuIEtlIOWG
memBkzoKPj4+IEluIGdlbmVyaWMvNTAsIHRvdWNoIDEwMCBmaWxlcywgZ28gZG93biB0aGUgZnMg
aW1tZWRpYXRlbHksIFRoZW4gdW1vdW50Cj4+PiBhbmQgc2V0IHRoZSBkaXNrIHJlYWRpLW9ubHku
IFRyeSB0byBtb3VudCBpdCBhZ2FpbiB3aXRob3V0IFwtbwo+Pj4gbm9yZWNvdmVyeVwsIGl0IHNo
b3VsZCBmYWlsLCBiZWNhdXNlIGl0IGNhbiBub3QgcmVjb3Zlcnkgb24gYSByZWFkLW9ubHkKPj4+
IGRldmljZS4gQnV0IGYyZnMgbW91bnQgc3VjY2Vzc2Z1bGx5IGFuZCB0aGUgdGVzdCBmYWlsLgo+
Pj4KPj4+IGYyZnMgc2VlbXMgZG8gbm90IHN1cHBvcnQgbWV0YWRhdGEgam91cm5hbGluZy4KPiAK
PiBJdCBsb29rcyBub3QgY29ycmVjdC4KPiAKPiBGWUksCj4gCj4gaHR0cHM6Ly9sa21sLm9yZy9s
a21sLzIwMjEvMy8yMy83NQo+IAo+IFRoYW5rcywKWW91ciBwYXRjaCBzaG91bGQgZml4IHRoaXMg
YnVnLCBidXQgaXQgc3RpbGwgZmFpbCBpbiA1LjEzLjAtcmM1LgoKW3Jvb3RAbG9jYWxob3N0IHhm
c3Rlc3RzLWRldl0jIC4vY2hlY2sgdGVzdHMvZ2VuZXJpYy8wNTAKRlNUWVAgICAgICAgICAtLSBm
MmZzClBMQVRGT1JNICAgICAgLS0gTGludXgveDg2XzY0IGxvY2FsaG9zdCA1LjEzLjAtcmM1ICMy
IFNNUCBXZWQgSnVuIDE2IAoyMDozNjo1NCBDU1QgMjAyMQpNS0ZTX09QVElPTlMgIC0tIC9kZXYv
c2RiCk1PVU5UX09QVElPTlMgLS0gLW8gYWNsLHVzZXJfeGF0dHIgL2Rldi9zZGIgL3RtcC9zY3Jh
dGNoCgpnZW5lcmljLzA1MCAzcyAuLi4gLSBvdXRwdXQgbWlzbWF0Y2ggKHNlZSAKL3Jvb3Qvd29y
ay94ZnN0ZXN0cy1kZXYvcmVzdWx0cy8vZ2VuZXJpYy8wNTAub3V0LmJhZCkKICAgICAtLS0gdGVz
dHMvZ2VuZXJpYy8wNTAub3V0CTIwMjEtMDUtMzEgMTU6Mzc6NDAuMDAwMDAwMDAwICswODAwCiAg
ICAgKysrIC9yb290L3dvcmsveGZzdGVzdHMtZGV2L3Jlc3VsdHMvL2dlbmVyaWMvMDUwLm91dC5i
YWQJMjAyMS0wNi0xNyAKMTE6NDA6MjYuMTA3MDAwMDAwICswODAwCiAgICAgQEAgLTEzLDkgKzEz
LDcgQEAKICAgICAgc2V0dGluZyBkZXZpY2UgcmVhZC1vbmx5CiAgICAgIG1vdW50aW5nIGZpbGVz
eXN0ZW0gdGhhdCBuZWVkcyByZWNvdmVyeSBvbiBhIHJlYWQtb25seSBkZXZpY2U6CiAgICAgIG1v
dW50OiBkZXZpY2Ugd3JpdGUtcHJvdGVjdGVkLCBtb3VudGluZyByZWFkLW9ubHkKICAgICAtbW91
bnQ6IGNhbm5vdCBtb3VudCBkZXZpY2UgcmVhZC1vbmx5CiAgICAgIHVubW91bnRpbmcgcmVhZC1v
bmx5IGZpbGVzeXN0ZW0KICAgICAtdW1vdW50OiBTQ1JBVENIX0RFVjogbm90IG1vdW50ZWQKICAg
ICAgbW91bnRpbmcgZmlsZXN5c3RlbSB3aXRoIC1vIG5vcmVjb3Zlcnkgb24gYSByZWFkLW9ubHkg
ZGV2aWNlOgogICAgIC4uLgogICAgIChSdW4gJ2RpZmYgLXUgL3Jvb3Qvd29yay94ZnN0ZXN0cy1k
ZXYvdGVzdHMvZ2VuZXJpYy8wNTAub3V0IAovcm9vdC93b3JrL3hmc3Rlc3RzLWRldi9yZXN1bHRz
Ly9nZW5lcmljLzA1MC5vdXQuYmFkJyAgdG8gc2VlIHRoZSBlbnRpcmUgCmRpZmYpClJhbjogZ2Vu
ZXJpYy8wNTAKRmFpbHVyZXM6IGdlbmVyaWMvMDUwCkZhaWxlZCAxIG9mIDEgdGVzdHMKClRoYW5r
cywKU3VuIEtlCj4gCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogU3VuIEtlIDxzdW5rZTMyQGh1YXdl
aS5jb20+Cj4+PiAtLS0KPj4+Cj4+PiBJIGFtIG5vdCB2ZXJ5IHN1cmUgaWYgZjJmcyBkbyBub3Qg
c3VwcG9ydCBtZXRhZGF0YSBqb3VybmFsaW5nLgo+Pj4KPj4+ICMjIwo+Pj4gYmVmb3JlIGNoYW5n
ZQo+Pj4gIyMjCj4+PiBbcm9vdEBsb2NhbGhvc3QgeGZzdGVzdHMtZGV2XSMgLi9jaGVjayB0ZXN0
cy9nZW5lcmljLzA1MAo+Pj4gRlNUWVDCoMKgwqDCoMKgwqDCoMKgIC0tIGYyZnMKPj4+IFBMQVRG
T1JNwqDCoMKgwqDCoCAtLSBMaW51eC94ODZfNjQgbG9jYWxob3N0IDUuMTIuMC1yYzUtbmV4dC0y
MDIxMDMzMCAjOCAKPj4+IFNNUCBUdWUgSnVuIDggMTE6MDk6MzcgQ1NUIDIwMjEKPj4+IE1LRlNf
T1BUSU9OU8KgIC0tIC9kZXYvc2RiCj4+PiBNT1VOVF9PUFRJT05TIC0tIC1vIGFjbCx1c2VyX3hh
dHRyIC9kZXYvc2RiIC90bXAvc2NyYXRjaAo+Pj4KPj4+IGdlbmVyaWMvMDUwIDRzIC4uLiAtIG91
dHB1dCBtaXNtYXRjaCAoc2VlIAo+Pj4gL3Jvb3Qvd29yay94ZnN0ZXN0cy1kZXYvcmVzdWx0cy8v
Z2VuZXJpYy8wNTAub3V0LmJhZCkKPj4+IMKgwqDCoMKgIC0tLSB0ZXN0cy9nZW5lcmljLzA1MC5v
dXTCoMKgIDIwMjEtMDUtMzEgMTU6Mzc6NDAuMDAwMDAwMDAwICswODAwCj4+PiDCoMKgwqDCoCAr
KysgL3Jvb3Qvd29yay94ZnN0ZXN0cy1kZXYvcmVzdWx0cy8vZ2VuZXJpYy8wNTAub3V0LmJhZCAg
ICAKPj4+IDIwMjEtMDYtMTEgMTY6NDg6MTkuOTkzMDAwMDAwICswODAwCj4+PiDCoMKgwqDCoCBA
QCAtMTMsOSArMTMsNyBAQAo+Pj4gwqDCoMKgwqDCoCBzZXR0aW5nIGRldmljZSByZWFkLW9ubHkK
Pj4+IMKgwqDCoMKgwqAgbW91bnRpbmcgZmlsZXN5c3RlbSB0aGF0IG5lZWRzIHJlY292ZXJ5IG9u
IGEgcmVhZC1vbmx5IGRldmljZToKPj4+IMKgwqDCoMKgwqAgbW91bnQ6IGRldmljZSB3cml0ZS1w
cm90ZWN0ZWQsIG1vdW50aW5nIHJlYWQtb25seQo+Pj4gwqDCoMKgwqAgLW1vdW50OiBjYW5ub3Qg
bW91bnQgZGV2aWNlIHJlYWQtb25seQo+Pj4gwqDCoMKgwqDCoCB1bm1vdW50aW5nIHJlYWQtb25s
eSBmaWxlc3lzdGVtCj4+PiDCoMKgwqDCoCAtdW1vdW50OiBTQ1JBVENIX0RFVjogbm90IG1vdW50
ZWQKPj4+IMKgwqDCoMKgwqAgbW91bnRpbmcgZmlsZXN5c3RlbSB3aXRoIC1vIG5vcmVjb3Zlcnkg
b24gYSByZWFkLW9ubHkgZGV2aWNlOgo+Pj4gwqDCoMKgwqAgLi4uCj4+PiDCoMKgwqDCoCAoUnVu
ICdkaWZmIC11IC9yb290L3dvcmsveGZzdGVzdHMtZGV2L3Rlc3RzL2dlbmVyaWMvMDUwLm91dCAK
Pj4+IC9yb290L3dvcmsveGZzdGVzdHMtZGV2L3Jlc3VsdHMvL2dlbmVyaWMvMDUwLm91dC5iYWQn
wqAgdG8gc2VlIHRoZSAKPj4+IGVudGlyZSBkaWZmKQo+Pj4gUmFuOiBnZW5lcmljLzA1MAo+Pj4g
RmFpbHVyZXM6IGdlbmVyaWMvMDUwCj4+PiBGYWlsZWQgMSBvZiAxIHRlc3RzCj4+Pgo+Pj4gIyMj
Cj4+PiBhZnRlciBjaGFuZ2UKPj4+ICMjIwo+Pj4gW3Jvb3RAbG9jYWxob3N0IHhmc3Rlc3RzLWRl
dl0jIC4vY2hlY2sgdGVzdHMvZ2VuZXJpYy8wNTAKPj4+IEZTVFlQwqDCoMKgwqDCoMKgwqDCoCAt
LSBmMmZzCj4+PiBQTEFURk9STcKgwqDCoMKgwqAgLS0gTGludXgveDg2XzY0IGxvY2FsaG9zdCA1
LjEyLjAtcmM1LW5leHQtMjAyMTAzMzAgIzggCj4+PiBTTVAgVHVlIEp1biA4IDExOjA5OjM3IENT
VCAyMDIxCj4+PiBNS0ZTX09QVElPTlPCoCAtLSAvZGV2L3NkYgo+Pj4gTU9VTlRfT1BUSU9OUyAt
LSAtbyBhY2wsdXNlcl94YXR0ciAvZGV2L3NkYiAvdG1wL3NjcmF0Y2gKPj4+Cj4+PiBnZW5lcmlj
LzA1MCA0cyAuLi7CoCA0cwo+Pj4gUmFuOiBnZW5lcmljLzA1MAo+Pj4gUGFzc2VkIGFsbCAxIHRl
c3RzCj4+Pgo+Pj4KPj4+Cj4+PiDCoCBjb21tb24vcmMgfCAyICstCj4+PiDCoCAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEv
Y29tbW9uL3JjIGIvY29tbW9uL3JjCj4+PiBpbmRleCBhMGFhNzMwMC4uNDI4YjhiODAgMTAwNjQ0
Cj4+PiAtLS0gYS9jb21tb24vcmMKPj4+ICsrKyBiL2NvbW1vbi9yYwo+Pj4gQEAgLTM1NDMsNyAr
MzU0Myw3IEBAIF9oYXNfbWV0YWRhdGFfam91cm5hbGluZygpCj4+PiDCoMKgwqDCoMKgIGZpCj4+
PiDCoMKgwqDCoMKgIGNhc2UgIiRGU1RZUCIgaW4KPj4+IC3CoMKgwqAgZXh0Mnx2ZmF0fG1zZG9z
fHVkZnxleGZhdHx0bXBmcykKPj4+ICvCoMKgwqAgZXh0Mnx2ZmF0fG1zZG9zfHVkZnxleGZhdHx0
bXBmc3xmMmZzKQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGVjaG8gIiRGU1RZUCBkb2VzIG5vdCBz
dXBwb3J0IG1ldGFkYXRhIGpvdXJuYWxpbmciCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJu
IDEKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCA7Owo+Pj4KPj4KPj4KPj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4gTGludXgtZjJmcy1kZXZlbCBtYWls
aW5nIGxpc3QKPj4gTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPj4gaHR0
cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZl
bAo+IC4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJj
ZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9s
aW51eC1mMmZzLWRldmVsCg==
