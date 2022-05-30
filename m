Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C062353732D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 30 May 2022 03:02:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nvTnk-0000VN-TE; Mon, 30 May 2022 01:02:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jack.qiu@huawei.com>) id 1nvTnj-0000VH-Gv
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 30 May 2022 01:02:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YT8KKZUQdQNdaGrVeo9dkcmBZgW2+E55LlpTCUbeH+4=; b=ZJKmOhu3UYPWh99nIQXEMqmvUH
 oPzCiii5Kr+FGTitbAVn+r4rBIOVSRrlNMqG+Tfnp3G2tkbRZcvin7plrmrlYowe/mVZ0pZGVWSal
 w+MiD5dRwnDKlANV4Vwc7/YcQAsJ9zCZPJ+asjHRglNah3+eiLroq801HzpxCPtP+oWg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YT8KKZUQdQNdaGrVeo9dkcmBZgW2+E55LlpTCUbeH+4=; b=bjS21zr4GJrDc64oVbFygrNBwP
 LzmL1ypshp/mZeYkBtr4q7dDoUHCKx+Lj/e/5vdfNkEdoEWKwvzthmUspJG5NBz+wsxT51tbziHFl
 8Na+Nul+KaDNW7Zl05PLJuAffOFrVM3hQDw85Nj1D9JNfd1rgT5EGqVLlr9xpz05mnSw=;
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nvTnh-00084i-HX
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 30 May 2022 01:02:32 +0000
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4LBHDF4v9DzjWwF;
 Mon, 30 May 2022 09:01:33 +0800 (CST)
Received: from dggpemm500008.china.huawei.com (7.185.36.136) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 30 May 2022 09:02:21 +0800
Received: from [10.174.176.201] (10.174.176.201) by
 dggpemm500008.china.huawei.com (7.185.36.136) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 30 May 2022 09:02:21 +0800
To: Chao Yu <chao@kernel.org>, <linux-f2fs-devel@lists.sourceforge.net>
References: <20220528093503.2608388-1-jack.qiu@huawei.com>
 <fe8f163b-5ba9-f361-8e6f-5af007564420@kernel.org>
Message-ID: <b5b3ecce-d4d9-eeff-cdbb-3441885cf538@huawei.com>
Date: Mon, 30 May 2022 09:02:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <fe8f163b-5ba9-f361-8e6f-5af007564420@kernel.org>
X-Originating-IP: [10.174.176.201]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500008.china.huawei.com (7.185.36.136)
X-CFilter-Loop: Reflected
X-Spam-Score: -4.2 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/5/29 14:58, Chao Yu wrote: > On 2022/5/28 17:35, Jack
 Qiu via Linux-f2fs-devel wrote: >> When find_lock_page return error, page
 in [i, page_len) will leak. > > I doubt it is impossible to fail [...] 
 Content analysis details:   (-4.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.187 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.9 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1nvTnh-00084i-HX
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix page leak in redirty_blocks
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
From: Jack Qiu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jack Qiu <jack.qiu@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMi81LzI5IDE0OjU4LCBDaGFvIFl1IHdyb3RlOgo+IE9uIDIwMjIvNS8yOCAxNzozNSwg
SmFjayBRaXUgdmlhIExpbnV4LWYyZnMtZGV2ZWwgd3JvdGU6Cj4+IFdoZW4gZmluZF9sb2NrX3Bh
Z2UgcmV0dXJuIGVycm9yLCBwYWdlIGluIFtpLCBwYWdlX2xlbikgd2lsbCBsZWFrLgo+IAo+IEkg
ZG91YnQgaXQgaXMgaW1wb3NzaWJsZSB0byBmYWlsIGluIGZpbmRfbG9ja19wYWdlIGR1ZSB0byBv
bmUgZXh0cmEKPiByZWZlcmVuY2UgY291bnQgd2FzIGFkZGVkIGluIHByZXZpb3VzIHJlYWRfY2Fj
aGVfcGFnZSgpLgoKVGhhbmtzIGZvciByZXZpZXcuCkknbSBub3Qgc3VyZSBhYm91dCBpdCB3aXRo
IGxpbWl0ZWQga25vd2xlZGdlLiBJZiBpdCBpcyB0cnVlLCBtYXliZSB1c2UgZjJmc19idWdfb24o
c2JpLCAhcGFnZSkgaXMgYmV0dGVyPwoKPiAKPiBUaGFua3MsCj4gCj4+Cj4+IFNpZ25lZC1vZmYt
Ynk6IEphY2sgUWl1IDxqYWNrLnFpdUBodWF3ZWkuY29tPgo+PiAtLS0KPj4gwqAgZnMvZjJmcy9m
aWxlLmMgfCAxMyArKysrKysrKysrKysrCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRp
b25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2ZpbGUuYyBiL2ZzL2YyZnMvZmlsZS5j
Cj4+IGluZGV4IDEwMDYzN2IxYWRiMy4uMGU4OTM4YzU5MThlIDEwMDY0NAo+PiAtLS0gYS9mcy9m
MmZzL2ZpbGUuYwo+PiArKysgYi9mcy9mMmZzL2ZpbGUuYwo+PiBAQCAtMzk1NCw2ICszOTU0LDEy
IEBAIHN0YXRpYyBpbnQgcmVkaXJ0eV9ibG9ja3Moc3RydWN0IGlub2RlICppbm9kZSwgcGdvZmZf
dCBwYWdlX2lkeCwgaW50IGxlbikKPj4gwqDCoMKgwqDCoCBzdHJ1Y3QgcGFnZSAqcGFnZTsKPj4g
wqDCoMKgwqDCoCBwZ29mZl90IHJlZGlydHlfaWR4ID0gcGFnZV9pZHg7Cj4+IMKgwqDCoMKgwqAg
aW50IGksIHBhZ2VfbGVuID0gMCwgcmV0ID0gMDsKPj4gK8KgwqDCoCBzdHJ1Y3QgcGFnZSAqKnBh
Z2VzOwo+PiArCj4+ICvCoMKgwqAgcGFnZXMgPSBmMmZzX2t2emFsbG9jKEYyRlNfSV9TQihpbm9k
ZSksCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2l6ZW9mKHN0cnVjdCBwYWdl
ICopICogbGVuLCBHRlBfTk9GUyk7Cj4+ICvCoMKgwqAgaWYgKCFwYWdlcykKPj4gK8KgwqDCoMKg
wqDCoMKgIHJldHVybiAtRU5PTUVNOwo+Pgo+PiDCoMKgwqDCoMKgIHBhZ2VfY2FjaGVfcmFfdW5i
b3VuZGVkKCZyYWN0bCwgbGVuLCAwKTsKPj4KPj4gQEAgLTM5NjQsNiArMzk3MCw3IEBAIHN0YXRp
YyBpbnQgcmVkaXJ0eV9ibG9ja3Moc3RydWN0IGlub2RlICppbm9kZSwgcGdvZmZfdCBwYWdlX2lk
eCwgaW50IGxlbikKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+IMKgwqDC
oMKgwqDCoMKgwqDCoCB9Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBwYWdlX2xlbisrOwo+PiArwqDC
oMKgwqDCoMKgwqAgcGFnZXNbaV0gPSBwYWdlOwo+PiDCoMKgwqDCoMKgIH0KPj4KPj4gwqDCoMKg
wqDCoCBmb3IgKGkgPSAwOyBpIDwgcGFnZV9sZW47IGkrKywgcmVkaXJ0eV9pZHgrKykgewo+PiBA
QCAtMzk3NSw4ICszOTgyLDE0IEBAIHN0YXRpYyBpbnQgcmVkaXJ0eV9ibG9ja3Moc3RydWN0IGlu
b2RlICppbm9kZSwgcGdvZmZfdCBwYWdlX2lkeCwgaW50IGxlbikKPj4gwqDCoMKgwqDCoMKgwqDC
oMKgIHNldF9wYWdlX2RpcnR5KHBhZ2UpOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZjJmc19wdXRf
cGFnZShwYWdlLCAxKTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGYyZnNfcHV0X3BhZ2UocGFnZSwg
MCk7Cj4+ICvCoMKgwqDCoMKgwqDCoCBwYWdlc1tpXSA9IE5VTEw7Cj4+IMKgwqDCoMKgwqAgfQo+
Pgo+PiArwqDCoMKgIC8qIHB1dCBwYWdlc1tpLCBwYWdlX2xlbikgd2hlbiBlcnJvciBoYXBwZW5z
ICovCj4+ICvCoMKgwqAgZm9yICg7IHJldCA8IDAgJiYgaSA8IHBhZ2VfbGVuOyBpKyspCj4+ICvC
oMKgwqDCoMKgwqDCoCBmMmZzX3B1dF9wYWdlKHBhZ2VzW2ldLCAwKTsKPj4gK8KgwqDCoCBrdmZy
ZWUocGFnZXMpOwo+PiArCj4+IMKgwqDCoMKgwqAgcmV0dXJuIHJldDsKPj4gwqAgfQo+Pgo+PiAt
LSAKPj4gMi4zMS4xCj4+Cj4+Cj4+Cj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCj4+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4+IExpbnV4
LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4+IGh0dHBzOi8vbGlzdHMuc291cmNl
Zm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKPiAuCgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwg
bWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBz
Oi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
