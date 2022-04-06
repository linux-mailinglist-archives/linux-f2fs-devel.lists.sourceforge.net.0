Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 491E84F52B0
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  6 Apr 2022 05:01:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nbvvU-0001Mo-3i; Wed, 06 Apr 2022 03:01:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <yuyufen@huawei.com>) id 1nbvvT-0001Me-2P
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 06 Apr 2022 03:01:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:CC:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0Gdlqh6DcXt9MMZ9FbCG35xjCm4/E9SWaHfRPq5MvSM=; b=ijLuzt1dB8+MrwHRiFUKfvvgPZ
 a14Zc4ukH/YS+fTX43dJ7lGGAPrPMrPWrz1sraXQxRsrIVwZHafMsRDWGjkoijkLDWWf2YjZUO6lK
 kUs76POd94AveXFlggIa7p9mnOpac/+W7+H6yWoixtTCtC+VpQkVIidLehF0BMtz4Rbs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0Gdlqh6DcXt9MMZ9FbCG35xjCm4/E9SWaHfRPq5MvSM=; b=GDZ+eIRO/EDlO+HCxNNf13ue5Q
 zLbHMk89iWIcUHcjsaa9BuFjlH5gC886l+bSpkRERaAowwfSo8370vf8T9VodUpFghhAQSILQQxDK
 tzs7vU7CQ1KmCrRpxL7LbnkAvghVZMlUnYRSpzywpyzwheO64fFCQ2Z7mTkocZI5wDq4=;
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nbvvO-0000iA-5L
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 06 Apr 2022 03:01:43 +0000
Received: from dggpeml500020.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4KY8PS4LtzzQjJN;
 Wed,  6 Apr 2022 10:59:40 +0800 (CST)
Received: from dggpeml500009.china.huawei.com (7.185.36.209) by
 dggpeml500020.china.huawei.com (7.185.36.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 6 Apr 2022 11:01:24 +0800
Received: from [10.174.177.235] (10.174.177.235) by
 dggpeml500009.china.huawei.com (7.185.36.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 6 Apr 2022 11:01:24 +0800
Message-ID: <25a24259-3ac3-81ab-1c28-f2a4886888b5@huawei.com>
Date: Wed, 6 Apr 2022 11:01:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Chao Yu <chao@kernel.org>, <jaegeuk@kernel.org>
References: <20220401071909.505086-1-yuyufen@huawei.com>
 <20220401071909.505086-5-yuyufen@huawei.com>
 <0c134e0e-b2d0-0bc0-42fc-cd220ff77e72@kernel.org>
In-Reply-To: <0c134e0e-b2d0-0bc0-42fc-cd220ff77e72@kernel.org>
X-Originating-IP: [10.174.177.235]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml500009.china.huawei.com (7.185.36.209)
X-CFilter-Loop: Reflected
X-Spam-Score: -4.3 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, On 2022/4/1 16:28, Chao Yu wrote: > On 2022/4/1 15:19,
 Yufen Yu via Linux-f2fs-devel wrote: >> Nowly, we can use new fault injection
 framework. Just delete the >> stale fault injection code. >> >> Sig [...]
 Content analysis details:   (-4.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [45.249.212.188 listed in wl.mailspike.net]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.188 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1nbvvO-0000iA-5L
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGksCgpPbiAyMDIyLzQvMSAxNjoyOCwgQ2hhbyBZdSB3cm90ZToKPiBPbiAyMDIyLzQvMSAxNTox
OSwgWXVmZW4gWXUgdmlhIExpbnV4LWYyZnMtZGV2ZWwgd3JvdGU6Cj4+IE5vd2x5LCB3ZSBjYW4g
dXNlIG5ldyBmYXVsdCBpbmplY3Rpb24gZnJhbWV3b3JrLiBKdXN0IGRlbGV0ZSB0aGUKPj4gc3Rh
bGUgZmF1bHQgaW5qZWN0aW9uIGNvZGUuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFl1ZmVuIFl1IDx5
dXl1ZmVuQGh1YXdlaS5jb20+Cj4+IC0tLQo+PiDCoCBmcy9mMmZzL2NoZWNrcG9pbnQuYyB8wqAg
MiArLQo+PiDCoCBmcy9mMmZzL2YyZnMuaMKgwqDCoMKgwqDCoCB8IDUxICsrLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+PiDCoCBmcy9mMmZzL3N1cGVyLmPCoMKgwqDC
oMKgIHwgNTMgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4g
wqAgZnMvZjJmcy9zeXNmcy5jwqDCoMKgwqDCoCB8IDIzIC0tLS0tLS0tLS0tLS0tLS0tLS0KPj4g
wqAgNCBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEyNiBkZWxldGlvbnMoLSkKPj4K
Ci4uLgoKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+IEBAIC0xOTYzLDE0
ICsxOTIwLDYgQEAgc3RhdGljIGludCBmMmZzX3Nob3dfb3B0aW9ucyhzdHJ1Y3Qgc2VxX2ZpbGUg
KnNlcSwgc3RydWN0IGRlbnRyeSAqcm9vdCkKPj4gwqDCoMKgwqDCoCBpZiAoRjJGU19JT19TSVpF
X0JJVFMoc2JpKSkKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHNlcV9wcmludGYoc2VxLCAiLGlvX2Jp
dHM9JXUiLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEYyRlNfT1BUSU9O
KHNiaSkud3JpdGVfaW9fc2l6ZV9iaXRzKTsKPj4gLSNpZmRlZiBDT05GSUdfRjJGU19GQVVMVF9J
TkpFQ1RJT04KPj4gLcKgwqDCoCBpZiAodGVzdF9vcHQoc2JpLCBGQVVMVF9JTkpFQ1RJT04pKSB7
Cj4+IC3CoMKgwqDCoMKgwqDCoCBzZXFfcHJpbnRmKHNlcSwgIixmYXVsdF9pbmplY3Rpb249JXUi
LAo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEYyRlNfT1BUSU9OKHNiaSkuZmF1
bHRfaW5mby5pbmplY3RfcmF0ZSk7Cj4+IC3CoMKgwqDCoMKgwqDCoCBzZXFfcHJpbnRmKHNlcSwg
IixmYXVsdF90eXBlPSV1IiwKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBGMkZT
X09QVElPTihzYmkpLmZhdWx0X2luZm8uaW5qZWN0X3R5cGUpOwo+PiAtwqDCoMKgIH0KPj4gLSNl
bmRpZgo+IAo+IFRoaXMgd2lsbCBjYXVzZSByZWdyZXNzaW9uIGR1ZSB0byBpdCBicmVha3MgYXBw
bGljYXRpb24gdXNhZ2Ugdy8gLW8KPiBmYXVsdF8qIG1vdW50b3B0aW9uLi4uLCBJIGRvbid0IHRo
aW5rIHRoaXMgaXMgdGhlIHJpZ2h0IHdheS4KCgpUaGFua3MgZm9yIGNhdGNoaW5nIHRoaXMuIEkg
YWRtaXQgaXQncyBhIHByb2JsZW0uIEJ1dCwgSU1PIGZhdWx0XyogbW91bnQKb3B0aW9uIGFyZSBt
b3N0bHkgYmVlbiB1c2VkIGluIHRlc3QsIG5vdCBpbiBhY3R1YWwgcHJvZHVjdC4gU28sIEkgdGhp
bmsKaXQgbWF5IGp1c3QgYWZmZWN0IHNvbWUgdGVzdCBhcHBsaWNhdGlvbnMuIFdpdGggdGhlIGNv
bW1vbiBmYXVsdCBpbmplY3Rpb24KZnJhbWV3b3JrLCBpdCBjYW4gYmUgbW9yZSBlYXN5IGFuZCBm
bGV4aWJsZSB0byBkbyBmYXVsdCBpbmplY3Rpb24gdGVzdC4KVGhlcmVmb3JlLCBJIHdhbnQgdG8g
cmVtb3ZlIHRoZSB0d28gbW91bnQgb3B0aW9ucyBkaXJlY3RseS4KCklmIHlvdSByZWFsbHkgd29y
cmllZCBhYm91dCBjb21wYXRpYmlsaXR5LCBob3cgYWJvdXQganVzdCByZXNlcnZpbmcgdGhlCnR3
byBpbmplY3RfKiBvcHRpb25zIGJ1dCB3aXRob3V0IGRvaW5nIGFueSB0aGluZyBmb3IgdGhlbS4g
V2UgYWN0dWFsbHkKY29uZmlndXJlIGZhdWx0IGluamVjdGlvbnMgYnkgZGVidWdmcyBpbiB0aGlz
IHBhdGNoLgoKT3IgZG8geW91IGhhdmUgbW9yZSBiZXR0ZXIgc3VnZ2VzdGlvbj8KClRoYW5rcywK
WXVmZW4KCgoKCgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3Rz
LnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0
aW5mby9saW51eC1mMmZzLWRldmVsCg==
