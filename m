Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 774094FDC59
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 Apr 2022 13:05:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1neEKQ-0003Ti-Pz; Tue, 12 Apr 2022 11:04:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <yuyufen@huawei.com>) id 1neEK2-0003TN-49
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Apr 2022 11:04:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:CC:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SahFf/1+6GfXRY9Eu7rsHPifNqvdX5B4sT+cEHlfQds=; b=IMGyr7hVHSWbcsifyEgUKC3EkL
 Rvq+SiTxF4kDStL305SRzKmxlcS6mxk5Lgy+bBa657Iw4DVLTVM76zLqNEbCEhBc8Udt5YGOIXQda
 DP+Dj25m8wdw+sSlx5GyJLfRvJfJE6w4MnmsgNOwmMm2au5bUQ9Fazi/d8w22WLUKStE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SahFf/1+6GfXRY9Eu7rsHPifNqvdX5B4sT+cEHlfQds=; b=QVILjuPM2vU7befJ02fo3ltw/w
 vwo4Xu73gojGKzn85aSjvRKiNOCwyfAqH9HiIztgCyiHrrVoWBv0zbFGEn73jEpsh1/H+YCUTkZQs
 Hrs5x7P5l3Wkm7zNLo4rpFZ4e4W7oWLg9Yl1G10KZLfjJQAKZMCuJwVf9XM8I3p0DF9o=;
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1neEJz-00Dwvn-1g
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Apr 2022 11:04:32 +0000
Received: from dggpeml500020.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Kd2sH56MbzdZmY;
 Tue, 12 Apr 2022 19:03:47 +0800 (CST)
Received: from dggpeml500009.china.huawei.com (7.185.36.209) by
 dggpeml500020.china.huawei.com (7.185.36.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 12 Apr 2022 19:04:22 +0800
Received: from [10.174.177.235] (10.174.177.235) by
 dggpeml500009.china.huawei.com (7.185.36.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 12 Apr 2022 19:04:22 +0800
Message-ID: <7c6a3d09-0215-cb7d-cf82-0c4fd801d998@huawei.com>
Date: Tue, 12 Apr 2022 19:04:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
References: <20220401071909.505086-1-yuyufen@huawei.com>
 <20220401071909.505086-5-yuyufen@huawei.com>
 <0c134e0e-b2d0-0bc0-42fc-cd220ff77e72@kernel.org>
 <25a24259-3ac3-81ab-1c28-f2a4886888b5@huawei.com>
 <778b1f04-a71b-a226-f7a7-4833fc9bf7c2@kernel.org>
 <YlSbqay8y6oaCxR6@google.com>
In-Reply-To: <YlSbqay8y6oaCxR6@google.com>
X-Originating-IP: [10.174.177.235]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpeml500009.china.huawei.com (7.185.36.209)
X-CFilter-Loop: Reflected
X-Spam-Score: -4.3 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/4/12 5:20, Jaegeuk Kim wrote: > On 04/11, Chao Yu
 wrote: >> On 2022/4/6 11:01, Yufen Yu via Linux-f2fs-devel wrote: >>> Hi,
 >>> >>> On 2022/4/1 16:28, Chao Yu wrote: >>>> On 2022/4/1 15:19, Yu [...]
 Content analysis details:   (-4.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.187 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [45.249.212.187 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1neEJz-00Dwvn-1g
Subject: Re: [f2fs-dev] [PATCH 4/5] f2fs: get rid of stale fault injection
 code
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
From: Yufen Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Yufen Yu <yuyufen@huawei.com>
Cc: ", yuyufen"@huawei.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

CgpPbiAyMDIyLzQvMTIgNToyMCwgSmFlZ2V1ayBLaW0gd3JvdGU6Cj4gT24gMDQvMTEsIENoYW8g
WXUgd3JvdGU6Cj4+IE9uIDIwMjIvNC82IDExOjAxLCBZdWZlbiBZdSB2aWEgTGludXgtZjJmcy1k
ZXZlbCB3cm90ZToKPj4+IEhpLAo+Pj4KPj4+IE9uIDIwMjIvNC8xIDE2OjI4LCBDaGFvIFl1IHdy
b3RlOgo+Pj4+IE9uIDIwMjIvNC8xIDE1OjE5LCBZdWZlbiBZdSB2aWEgTGludXgtZjJmcy1kZXZl
bCB3cm90ZToKPj4+Pj4gTm93bHksIHdlIGNhbiB1c2UgbmV3IGZhdWx0IGluamVjdGlvbiBmcmFt
ZXdvcmsuIEp1c3QgZGVsZXRlIHRoZQo+Pj4+PiBzdGFsZSBmYXVsdCBpbmplY3Rpb24gY29kZS4K
Pj4+Pj4KPj4+Pj4gU2lnbmVkLW9mZi1ieTogWXVmZW4gWXUgPHl1eXVmZW5AaHVhd2VpLmNvbT4K
Pj4+Pj4gLS0tCj4+Pj4+ICDCoCBmcy9mMmZzL2NoZWNrcG9pbnQuYyB8wqAgMiArLQo+Pj4+PiAg
wqAgZnMvZjJmcy9mMmZzLmjCoMKgwqDCoMKgwqAgfCA1MSArKy0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4+Pj4gIMKgIGZzL2YyZnMvc3VwZXIuY8KgwqDCoMKgwqAg
fCA1MyAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+Pj4+PiAg
wqAgZnMvZjJmcy9zeXNmcy5jwqDCoMKgwqDCoCB8IDIzIC0tLS0tLS0tLS0tLS0tLS0tLS0KPj4+
Pj4gIMKgIDQgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxMjYgZGVsZXRpb25zKC0p
Cj4+Pj4+Cj4+Pgo+Pj4gLi4uCj4+Pgo+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
YnJlYWs7Cj4+Pj4+IEBAIC0xOTYzLDE0ICsxOTIwLDYgQEAgc3RhdGljIGludCBmMmZzX3Nob3df
b3B0aW9ucyhzdHJ1Y3Qgc2VxX2ZpbGUgKnNlcSwgc3RydWN0IGRlbnRyeSAqcm9vdCkKPj4+Pj4g
IMKgwqDCoMKgwqAgaWYgKEYyRlNfSU9fU0laRV9CSVRTKHNiaSkpCj4+Pj4+ICDCoMKgwqDCoMKg
wqDCoMKgwqAgc2VxX3ByaW50ZihzZXEsICIsaW9fYml0cz0ldSIsCj4+Pj4+ICDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEYyRlNfT1BUSU9OKHNiaSkud3JpdGVfaW9fc2l6ZV9i
aXRzKTsKPj4+Pj4gLSNpZmRlZiBDT05GSUdfRjJGU19GQVVMVF9JTkpFQ1RJT04KPj4+Pj4gLcKg
wqDCoCBpZiAodGVzdF9vcHQoc2JpLCBGQVVMVF9JTkpFQ1RJT04pKSB7Cj4+Pj4+IC3CoMKgwqDC
oMKgwqDCoCBzZXFfcHJpbnRmKHNlcSwgIixmYXVsdF9pbmplY3Rpb249JXUiLAo+Pj4+PiAtwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEYyRlNfT1BUSU9OKHNiaSkuZmF1bHRfaW5mby5p
bmplY3RfcmF0ZSk7Cj4+Pj4+IC3CoMKgwqDCoMKgwqDCoCBzZXFfcHJpbnRmKHNlcSwgIixmYXVs
dF90eXBlPSV1IiwKPj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBGMkZTX09Q
VElPTihzYmkpLmZhdWx0X2luZm8uaW5qZWN0X3R5cGUpOwo+Pj4+PiAtwqDCoMKgIH0KPj4+Pj4g
LSNlbmRpZgo+Pj4+Cj4+Pj4gVGhpcyB3aWxsIGNhdXNlIHJlZ3Jlc3Npb24gZHVlIHRvIGl0IGJy
ZWFrcyBhcHBsaWNhdGlvbiB1c2FnZSB3LyAtbwo+Pj4+IGZhdWx0XyogbW91bnRvcHRpb24uLi4s
IEkgZG9uJ3QgdGhpbmsgdGhpcyBpcyB0aGUgcmlnaHQgd2F5Lgo+Pj4KPj4+Cj4+PiBUaGFua3Mg
Zm9yIGNhdGNoaW5nIHRoaXMuIEkgYWRtaXQgaXQncyBhIHByb2JsZW0uIEJ1dCwgSU1PIGZhdWx0
XyogbW91bnQKPj4+IG9wdGlvbiBhcmUgbW9zdGx5IGJlZW4gdXNlZCBpbiB0ZXN0LCBub3QgaW4g
YWN0dWFsIHByb2R1Y3QuIFNvLCBJIHRoaW5rCj4+PiBpdCBtYXkganVzdCBhZmZlY3Qgc29tZSB0
ZXN0IGFwcGxpY2F0aW9ucy4gV2l0aCB0aGUgY29tbW9uIGZhdWx0IGluamVjdGlvbgo+Pj4gZnJh
bWV3b3JrLCBpdCBjYW4gYmUgbW9yZSBlYXN5IGFuZCBmbGV4aWJsZSB0byBkbyBmYXVsdCBpbmpl
Y3Rpb24gdGVzdC4KPj4+IFRoZXJlZm9yZSwgSSB3YW50IHRvIHJlbW92ZSB0aGUgdHdvIG1vdW50
IG9wdGlvbnMgZGlyZWN0bHkuCj4+Pgo+Pj4gSWYgeW91IHJlYWxseSB3b3JyaWVkIGFib3V0IGNv
bXBhdGliaWxpdHksIGhvdyBhYm91dCBqdXN0IHJlc2VydmluZyB0aGUKPj4+IHR3byBpbmplY3Rf
KiBvcHRpb25zIGJ1dCB3aXRob3V0IGRvaW5nIGFueSB0aGluZyBmb3IgdGhlbS4gV2UgYWN0dWFs
bHkKPj4+IGNvbmZpZ3VyZSBmYXVsdCBpbmplY3Rpb25zIGJ5IGRlYnVnZnMgaW4gdGhpcyBwYXRj
aC4KPj4+Cj4+PiBPciBkbyB5b3UgaGF2ZSBtb3JlIGJldHRlciBzdWdnZXN0aW9uPwo+Pgo+PiBD
b3VsZCB5b3UgcGxlYXNlIGNvbnNpZGVyIHRvIGtlZXAgb3JpZ2luYWwgbG9naWMgb2YgZjJmcyBm
YXVsdCBpbmplY3Rpb24KPj4gaWYgdXNlciB1c2UgaW5qZWN0Xyogb3B0aW9ucywgb3RoZXJ3aXNl
IGZvbGxvd2luZyBjb21tb24gZmF1bHQgaW5qZWN0aW9uCj4+IGZyYW1ld29yaz8KPj4KPj4gVGhv
dWdodHM/Cj4gCj4gSSB0aGluayBpdCdkIGJlIHVzZWZ1bCB0byB0ZXN0IHJvbGwtZm9yd2FyZCBy
ZWNvdmVyeSBmbG93IGJ5IHVzaW5nIHRob3NlIG1vdW50Cj4gb3B0aW9ucywgc2luY2UgcnVudGlt
ZSBmYXVsdCBpbmplY3Rpb24gY2Fubm90IGVuYWJsZSBpdCBkdXJpbmcgbW91bnQuCj4gCgpZZWFo
LCBJIGhhdmUgbm90IGNhdGNoIHRoaXMgcG9pbnQgYmVmb3JlLgoKPiBCVFcsIHdoYXQgaXMgdGhl
IHJlYWwgYmVuZWZpdCB0byB1c2UgdGhlIGZhdWx0IGluamVjdGlvbiBmcmFtZXdvcms/Cj4gCgpJ
IHRoaW5rIGZhdWx0IGluamVjdGlvbiBmcmFtZXdvcmsgY2FuIHByb3ZpZGUgbW9yZSBlYXNpZXIg
YW5kIGZsZXhpYmxlCmZ1bmN0aW9uIHRoYW4gdGhlIGN1cnJlbnQgb25lLiBGdXJ0aGVybW9yZSwg
d2UgY2FuIGp1c3QgZm9sbG93aW5nIGl0IGFuZApkb24ndCBuZWVkIHRvIG1haW50YWluIGYyZnMg
b3duIGZhdWx0IGluamVjdGlvbiBjb2xkLgoKVGhhbmtzLApZdWZlbgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGlu
ZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlz
dHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
