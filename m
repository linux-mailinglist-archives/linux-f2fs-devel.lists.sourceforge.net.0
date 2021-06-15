Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E543A7509
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 15 Jun 2021 05:26:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lsziH-0004ZB-Ow; Tue, 15 Jun 2021 03:26:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <sunke32@huawei.com>) id 1lsziG-0004Z4-Dz
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 15 Jun 2021 03:26:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=e+qdaoUYKcJcoAeVHU4QX1K7BQJ0a/QQEf568j+TZxs=; b=d4xhWropXAN1Z4wnTiwpZaIm+/
 Mz8WIJvnXMEas7jgb4FKV6q5lY2Z2zc+CXL7+P1u6wJa2ESwZ8vcWFc4EbEqBT7tSBkWtZfJMkGqb
 j2mHo89l5fyvcsvsu8LrvFZn7q5Egd0p7L6qbCVt07eN+/B9/Ag73ao3g494KeW+TL8A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=e+qdaoUYKcJcoAeVHU4QX1K7BQJ0a/QQEf568j+TZxs=; b=RfqpVN3pXHQm1nzV2bnFuqCq8F
 yml59aXYvk9hYXgNU0ApdP7LzGN6y+5puQDflLdUMc59xi8fXp8r1vcoQzVuHHEAIP4odGjT3I9Y+
 xzGldqCy8oKiB61rpC16VXpArdYYxm2x+eniRbgl69mRWWBt1zhRleaF5+LmUAoI5IpE=;
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lszi8-00A1Ot-R2
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 15 Jun 2021 03:26:06 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4G3tr216PdzXfyX;
 Tue, 15 Jun 2021 11:20:50 +0800 (CST)
Received: from dggema759-chm.china.huawei.com (10.1.198.201) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Tue, 15 Jun 2021 11:25:49 +0800
Received: from [10.174.178.31] (10.174.178.31) by
 dggema759-chm.china.huawei.com (10.1.198.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Tue, 15 Jun 2021 11:25:49 +0800
To: <fstests@vger.kernel.org>, <guan@eryu.me>, <yuchao0@huawei.com>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <20210611112211.1408767-1-sunke32@huawei.com>
From: Sun Ke <sunke32@huawei.com>
Message-ID: <d95c4ac2-50a2-4f08-3940-ac0597266280@huawei.com>
Date: Tue, 15 Jun 2021 11:25:48 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210611112211.1408767-1-sunke32@huawei.com>
X-Originating-IP: [10.174.178.31]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggema759-chm.china.huawei.com (10.1.198.201)
X-CFilter-Loop: Reflected
X-Spam-Score: -0.5 (/)
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
 -0.5 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lszi8-00A1Ot-R2
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
Content-Type: text/plain; charset="gbk"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

CgrU2iAyMDIxLzYvMTEgMTk6MjIsIFN1biBLZSDQtLXAOgo+IEluIGdlbmVyaWMvNTAsIHRvdWNo
IDEwMCBmaWxlcywgZ28gZG93biB0aGUgZnMgaW1tZWRpYXRlbHksIFRoZW4gdW1vdW50Cj4gYW5k
IHNldCB0aGUgZGlzayByZWFkaS1vbmx5LiBUcnkgdG8gbW91bnQgaXQgYWdhaW4gd2l0aG91dCBc
LW8KPiBub3JlY292ZXJ5XCwgaXQgc2hvdWxkIGZhaWwsIGJlY2F1c2UgaXQgY2FuIG5vdCByZWNv
dmVyeSBvbiBhIHJlYWQtb25seQo+IGRldmljZS4gQnV0IGYyZnMgbW91bnQgc3VjY2Vzc2Z1bGx5
IGFuZCB0aGUgdGVzdCBmYWlsLgo+IAo+IGYyZnMgc2VlbXMgZG8gbm90IHN1cHBvcnQgbWV0YWRh
dGEgam91cm5hbGluZy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBTdW4gS2UgPHN1bmtlMzJAaHVhd2Vp
LmNvbT4KPiAtLS0KPiAKPiBJIGFtIG5vdCB2ZXJ5IHN1cmUgaWYgZjJmcyBkbyBub3Qgc3VwcG9y
dCBtZXRhZGF0YSBqb3VybmFsaW5nLgo+IAo+ICMjIwo+IGJlZm9yZSBjaGFuZ2UKPiAjIyMKPiBb
cm9vdEBsb2NhbGhvc3QgeGZzdGVzdHMtZGV2XSMgLi9jaGVjayB0ZXN0cy9nZW5lcmljLzA1MAo+
IEZTVFlQICAgICAgICAgLS0gZjJmcwo+IFBMQVRGT1JNICAgICAgLS0gTGludXgveDg2XzY0IGxv
Y2FsaG9zdCA1LjEyLjAtcmM1LW5leHQtMjAyMTAzMzAgIzggU01QIFR1ZSBKdW4gOCAxMTowOToz
NyBDU1QgMjAyMQo+IE1LRlNfT1BUSU9OUyAgLS0gL2Rldi9zZGIKPiBNT1VOVF9PUFRJT05TIC0t
IC1vIGFjbCx1c2VyX3hhdHRyIC9kZXYvc2RiIC90bXAvc2NyYXRjaAo+IAo+IGdlbmVyaWMvMDUw
IDRzIC4uLiAtIG91dHB1dCBtaXNtYXRjaCAoc2VlIC9yb290L3dvcmsveGZzdGVzdHMtZGV2L3Jl
c3VsdHMvL2dlbmVyaWMvMDUwLm91dC5iYWQpCj4gICAgICAtLS0gdGVzdHMvZ2VuZXJpYy8wNTAu
b3V0ICAgMjAyMS0wNS0zMSAxNTozNzo0MC4wMDAwMDAwMDAgKzA4MDAKPiAgICAgICsrKyAvcm9v
dC93b3JrL3hmc3Rlc3RzLWRldi9yZXN1bHRzLy9nZW5lcmljLzA1MC5vdXQuYmFkICAgIDIwMjEt
MDYtMTEgMTY6NDg6MTkuOTkzMDAwMDAwICswODAwCj4gICAgICBAQCAtMTMsOSArMTMsNyBAQAo+
ICAgICAgIHNldHRpbmcgZGV2aWNlIHJlYWQtb25seQo+ICAgICAgIG1vdW50aW5nIGZpbGVzeXN0
ZW0gdGhhdCBuZWVkcyByZWNvdmVyeSBvbiBhIHJlYWQtb25seSBkZXZpY2U6Cj4gICAgICAgbW91
bnQ6IGRldmljZSB3cml0ZS1wcm90ZWN0ZWQsIG1vdW50aW5nIHJlYWQtb25seQo+ICAgICAgLW1v
dW50OiBjYW5ub3QgbW91bnQgZGV2aWNlIHJlYWQtb25seQo+ICAgICAgIHVubW91bnRpbmcgcmVh
ZC1vbmx5IGZpbGVzeXN0ZW0KPiAgICAgIC11bW91bnQ6IFNDUkFUQ0hfREVWOiBub3QgbW91bnRl
ZAo+ICAgICAgIG1vdW50aW5nIGZpbGVzeXN0ZW0gd2l0aCAtbyBub3JlY292ZXJ5IG9uIGEgcmVh
ZC1vbmx5IGRldmljZToKPiAgICAgIC4uLgo+ICAgICAgKFJ1biAnZGlmZiAtdSAvcm9vdC93b3Jr
L3hmc3Rlc3RzLWRldi90ZXN0cy9nZW5lcmljLzA1MC5vdXQgL3Jvb3Qvd29yay94ZnN0ZXN0cy1k
ZXYvcmVzdWx0cy8vZ2VuZXJpYy8wNTAub3V0LmJhZCcgIHRvIHNlZSB0aGUgZW50aXJlIGRpZmYp
Cj4gUmFuOiBnZW5lcmljLzA1MAo+IEZhaWx1cmVzOiBnZW5lcmljLzA1MAo+IEZhaWxlZCAxIG9m
IDEgdGVzdHMKPiAKPiAjIyMKPiBhZnRlciBjaGFuZ2UKPiAjIyMKPiBbcm9vdEBsb2NhbGhvc3Qg
eGZzdGVzdHMtZGV2XSMgLi9jaGVjayB0ZXN0cy9nZW5lcmljLzA1MAo+IEZTVFlQICAgICAgICAg
LS0gZjJmcwo+IFBMQVRGT1JNICAgICAgLS0gTGludXgveDg2XzY0IGxvY2FsaG9zdCA1LjEyLjAt
cmM1LW5leHQtMjAyMTAzMzAgIzggU01QIFR1ZSBKdW4gOCAxMTowOTozNyBDU1QgMjAyMQo+IE1L
RlNfT1BUSU9OUyAgLS0gL2Rldi9zZGIKPiBNT1VOVF9PUFRJT05TIC0tIC1vIGFjbCx1c2VyX3hh
dHRyIC9kZXYvc2RiIC90bXAvc2NyYXRjaAo+IAo+IGdlbmVyaWMvMDUwIDRzIC4uLiAgNHMKPiBS
YW46IGdlbmVyaWMvMDUwCj4gUGFzc2VkIGFsbCAxIHRlc3RzCj4gCj4gCj4gCj4gICBjb21tb24v
cmMgfCAyICstCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKPiAKPiBkaWZmIC0tZ2l0IGEvY29tbW9uL3JjIGIvY29tbW9uL3JjCj4gaW5kZXggYTBhYTcz
MDAuLjQyOGI4YjgwIDEwMDY0NAo+IC0tLSBhL2NvbW1vbi9yYwo+ICsrKyBiL2NvbW1vbi9yYwo+
IEBAIC0zNTQzLDcgKzM1NDMsNyBAQCBfaGFzX21ldGFkYXRhX2pvdXJuYWxpbmcoKQo+ICAgCWZp
Cj4gICAKPiAgIAljYXNlICIkRlNUWVAiIGluCj4gLQlleHQyfHZmYXR8bXNkb3N8dWRmfGV4ZmF0
fHRtcGZzKQo+ICsJZXh0Mnx2ZmF0fG1zZG9zfHVkZnxleGZhdHx0bXBmc3xmMmZzKQo+ICAgCQll
Y2hvICIkRlNUWVAgZG9lcyBub3Qgc3VwcG9ydCBtZXRhZGF0YSBqb3VybmFsaW5nIgo+ICAgCQly
ZXR1cm4gMQo+ICAgCQk7Owo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2
ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xp
c3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
