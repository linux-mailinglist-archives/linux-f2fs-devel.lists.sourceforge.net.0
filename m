Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2F34D296D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Mar 2022 08:25:02 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nRqgs-0003Vr-79; Wed, 09 Mar 2022 07:24:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jiayang5@huawei.com>) id 1nRqgq-0003Vi-Oc
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Mar 2022 07:24:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=op1OVAfpKTDv5l1zbMwucB1B3su188RBJpP7/IqYmbU=; b=b0qsbHoKdPxGU1Y0QnyMdrOO1h
 ZsQ5QhwtgY5+y1JQ3MzRwwQJE9ZXvOGGR7Ri12saz2Vhsotw/vKiL9yz0dINyAY0vgi59VPwy0v4R
 a6Y0xfBVGV2mG7vW5yLlgVBk/BESuRCV3eneall8ldgEkmKM5rNB4tOzTsA2vSgNQiLY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=op1OVAfpKTDv5l1zbMwucB1B3su188RBJpP7/IqYmbU=; b=Fd1syGQW+BodfQXCJom3a26PJK
 6z1XxzyXDtz80TOTKcE+yplaRrf+/tTmzngb2pg+z9XQjwYB/+0eCJ7itb9E+rNZI2N0uDbplN9NL
 IOS2n+4DNzB+apo4BxoADoAeqFw/jsKI1GHRn8B9q3B3pHBEfiCAcw9Q4ORZMmH2cbLA=;
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nRqgo-009T6n-0I
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Mar 2022 07:24:55 +0000
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4KD3Z015V9zBrdH;
 Wed,  9 Mar 2022 15:22:48 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 9 Mar 2022 15:24:43 +0800
Received: from [10.174.179.183] (10.174.179.183) by
 dggpemm500007.china.huawei.com (7.185.36.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.21; Wed, 9 Mar 2022 15:24:43 +0800
To: Chao Yu <chao@kernel.org>, <jaegeuk@kernel.org>
References: <20220307081227.1353957-1-jiayang5@huawei.com>
 <0833a084-f31d-2815-40cf-c8e173feec02@kernel.org>
 <1dfef1c2-2bea-e4ca-39d1-986c2c9b0813@huawei.com>
 <edbf3e72-ab58-74d8-52f2-34b4034b484d@kernel.org>
Message-ID: <0e910b52-a1ed-ca82-7c09-67a7879ee934@huawei.com>
Date: Wed, 9 Mar 2022 15:24:42 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <edbf3e72-ab58-74d8-52f2-34b4034b484d@kernel.org>
X-Originating-IP: [10.174.179.183]
X-ClientProxiedBy: dggeme710-chm.china.huawei.com (10.1.199.106) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/3/9 12:12, Chao Yu wrote: > On 2022/3/8 16:19, Jia
 Yang via Linux-f2fs-devel wrote: >> >> >> On 2022/3/7 18:40, Chao Yu wrote:
 >>> On 2022/3/7 16:12, Jia Yang via Linux-f2fs-devel wrote: >>>> [...] 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.188 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [45.249.212.188 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1nRqgo-009T6n-0I
Subject: Re: [f2fs-dev] [PATCH -next] f2fs: remove unnecessary read for
 F2FS_FITS_IN_INODE
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
From: Jia Yang via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jia Yang <jiayang5@huawei.com>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

CgpPbiAyMDIyLzMvOSAxMjoxMiwgQ2hhbyBZdSB3cm90ZToKPiBPbiAyMDIyLzMvOCAxNjoxOSwg
SmlhIFlhbmcgdmlhIExpbnV4LWYyZnMtZGV2ZWwgd3JvdGU6Cj4+Cj4+Cj4+IE9uIDIwMjIvMy83
IDE4OjQwLCBDaGFvIFl1IHdyb3RlOgo+Pj4gT24gMjAyMi8zLzcgMTY6MTIsIEppYSBZYW5nIHZp
YSBMaW51eC1mMmZzLWRldmVsIHdyb3RlOgo+Pj4+IEYyRlNfRklUU19JTl9JTk9ERSBvbmx5IGNh
cmVzIHRoZSB0eXBlIG9mIGYyZnMgaW5vZGUsIHNvIHRoZXJlCj4+Pj4gaXMgbm8gbmVlZCB0byBy
ZWFkIG5vZGUgcGFnZSBvZiBmMmZzIGlub2RlLgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogSmlh
IFlhbmcgPGppYXlhbmc1QGh1YXdlaS5jb20+Cj4+Pj4gLS0tCj4+Pj4gwqDCoCBmcy9mMmZzL2Zp
bGUuYyB8IDEwICsrLS0tLS0tLS0KPj4+PiDCoMKgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDggZGVsZXRpb25zKC0pCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9maWxl
LmMgYi9mcy9mMmZzL2ZpbGUuYwo+Pj4+IGluZGV4IGNmZGM0MWY4N2Y1ZC4uNGI5M2ZiZWMyZWMw
IDEwMDY0NAo+Pj4+IC0tLSBhL2ZzL2YyZnMvZmlsZS5jCj4+Pj4gKysrIGIvZnMvZjJmcy9maWxl
LmMKPj4+PiBAQCAtMjk5OSw3ICsyOTk5LDcgQEAgc3RhdGljIGludCBmMmZzX2lvY19zZXRwcm9q
ZWN0KHN0cnVjdCBpbm9kZSAqaW5vZGUsIF9fdTMyIHByb2ppZCkKPj4+PiDCoMKgIHsKPj4+PiDC
oMKgwqDCoMKgwqAgc3RydWN0IGYyZnNfaW5vZGVfaW5mbyAqZmkgPSBGMkZTX0koaW5vZGUpOwo+
Pj4+IMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkgPSBGMkZTX0lfU0IoaW5v
ZGUpOwo+Pj4+IC3CoMKgwqAgc3RydWN0IHBhZ2UgKmlwYWdlOwo+Pj4+ICvCoMKgwqAgc3RydWN0
IGYyZnNfaW5vZGUgKnJpOwo+Pj4KPj4+IHN0cnVjdCBmMmZzX2lub2RlICpyaSA9IE5VTEw7Cj4+
Pgo+Pj4gKG9mZnNldG9mKHR5cGVvZigqKGYyZnNfaW5vZGUpKSwgZmllbGQpICsKPj4+IHNpemVv
ZigoZjJmc19pbm9kZSktPmZpZWxkKQo+Pj4KPj4+IEEgbGl0dGxlIGJpdCB3b3JyeSBhYm91dCB1
c2luZyBhIE5VTEwgcG9pbnRlciBoZXJlLCBkdWUgdG8gbm90IHN1cmUgdGhlIHJlc3VsdCBvZgo+
Pj4gb2Zmc2V0b2YoKSBhbmQgc2l6ZW9mKCkgd2lsbCBhbHdheXMgYmUgY2FsY3VsYXRlZCBhdCBj
b21waWxpbmcgdGltZSBmb3IgYWxsIGtpbmQgb2YKPj4+IGNvbXBpbGVycywgY2FuIHdlIGd1YXJh
bnRlZSB0aGF0Pwo+Pgo+PiBXZSBjYW4ndCBndWFyYW50ZWUgdGhhdCwgYnV0IEkgc2VlIHRoYXQg
ZjJmc19nZXRhdHRyIGFsc28gcnVucyBpbiB0aGlzIHdheS4gRG8geW91IHRoaW5rIHRoYXQgYWxs
b2NhdGluZyBtZW1vcnkgZm9yCj4+IGYyZnMgaW5vZGUgaXMgYXZhaWxhYmxlPwo+IAo+IFdlbGws
IGl0IGxvb2tzIGV4dDRfZ2V0YXR0cigpIGFsc28gZGlkIHRoaXMgd2F5Li4uCj4gCj4gSG93IGFi
b3V0IGluaXRpYWxpemluZyByaSB3LyBOVUxMIGF0IGxlYXN0Pwo+IAoKSSBhZ3JlZSB3aXRoIHRo
YXQgYW5kIEkgd2lsbCBmaXggaXQgaW4gVjIgdmVyc2lvbi4KClRoYW5rcywKCj4gVGhhbmtzLAo+
IAo+Pgo+PiBUaGFua3MuCj4+Cj4+Pgo+Pj4+IMKgwqDCoMKgwqDCoCBrcHJvamlkX3Qga3Byb2pp
ZDsKPj4+PiDCoMKgwqDCoMKgwqAgaW50IGVycjsKPj4+PiDCoMKgIEBAIC0zMDIzLDE3ICszMDIz
LDExIEBAIHN0YXRpYyBpbnQgZjJmc19pb2Nfc2V0cHJvamVjdChzdHJ1Y3QgaW5vZGUgKmlub2Rl
LCBfX3UzMiBwcm9qaWQpCj4+Pj4gwqDCoMKgwqDCoMKgIGlmIChJU19OT1FVT1RBKGlub2RlKSkK
Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gZXJyOwo+Pj4+IMKgwqAgLcKgwqDCoCBp
cGFnZSA9IGYyZnNfZ2V0X25vZGVfcGFnZShzYmksIGlub2RlLT5pX2lubyk7Cj4+Pj4gLcKgwqDC
oCBpZiAoSVNfRVJSKGlwYWdlKSkKPj4+PiAtwqDCoMKgwqDCoMKgwqAgcmV0dXJuIFBUUl9FUlIo
aXBhZ2UpOwo+Pj4+IMKgwqAgLcKgwqDCoCBpZiAoIUYyRlNfRklUU19JTl9JTk9ERShGMkZTX0lO
T0RFKGlwYWdlKSwgZmktPmlfZXh0cmFfaXNpemUsCj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlfcHJvamlkKSkgewo+
Pj4+ICvCoMKgwqAgaWYgKCFGMkZTX0ZJVFNfSU5fSU5PREUocmksIGZpLT5pX2V4dHJhX2lzaXpl
LCBpX3Byb2ppZCkpIHsKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlcnIgPSAtRU9WRVJGTE9X
Owo+Pj4+IC3CoMKgwqDCoMKgwqDCoCBmMmZzX3B1dF9wYWdlKGlwYWdlLCAxKTsKPj4+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gZXJyOwo+Pj4KPj4+IHJldHVybiAtRU9WRVJGTE9XOwo+
Pj4KPj4+IFRoYW5rcywKPj4+Cj4+Pj4gwqDCoMKgwqDCoMKgIH0KPj4+PiAtwqDCoMKgIGYyZnNf
cHV0X3BhZ2UoaXBhZ2UsIDEpOwo+Pj4+IMKgwqAgwqDCoMKgwqDCoCBlcnIgPSBmMmZzX2RxdW90
X2luaXRpYWxpemUoaW5vZGUpOwo+Pj4+IMKgwqDCoMKgwqDCoCBpZiAoZXJyKQo+Pj4gLgo+Pgo+
Pgo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBM
aW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+PiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNv
dXJjZWZvcmdlLm5ldAo+PiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0
aW5mby9saW51eC1mMmZzLWRldmVsCj4gLgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYy
ZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2Uu
bmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
