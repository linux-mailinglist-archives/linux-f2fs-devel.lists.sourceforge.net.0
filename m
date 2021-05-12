Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D51537B3B2
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 May 2021 03:52:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lge3D-0005jV-LT; Wed, 12 May 2021 01:52:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1lge3B-0005jN-Ae
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 12 May 2021 01:52:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mV/U1+DaQaTsH2mwtM4jZeIIKm+bhkLEZYk9iXTuMRA=; b=UfBTyIP/57FcuQw8v8fIWWfNLq
 caP4YMMboVD52CvXJm8C3ISSQVlkEYr45CLECFrceei3x35dyOwY6fJW/+7esWFg8oyMnPk5DqdFI
 GE2ljv4SD29qj97zS8aNJHhz0yYLE5blfjRaDVps1Iv6Ui3+44b1uQcPPckeUzUSBQtU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mV/U1+DaQaTsH2mwtM4jZeIIKm+bhkLEZYk9iXTuMRA=; b=EbNEHH/Vv5jMv4VKx4jkxddY2g
 zqVMtOAodetzwPI8rHIWb+fOYQlt+xspAx7/EAy08bbqbP3zPXEykec5xvJ+dcmJEqEpr5Ah0DzSC
 hRhS9qkgMN4EgMbrEWFdqF1eSF43HAMzalkmm2iXASC7Kxz6SzfIMwqPZddlwlpzWoD0=;
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lge32-004Yck-Jn
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 12 May 2021 01:52:39 +0000
Received: from dggemx753-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4FfyPk54pyz60qN;
 Wed, 12 May 2021 09:48:58 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by
 dggemx753-chm.china.huawei.com (10.0.44.37) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Wed, 12 May 2021 09:52:20 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>, <changfengnan@vivo.com>
References: <20210507094455.1695-1-changfengnan@vivo.com>
 <YJlUpHJLONlORWWl@google.com> <000b01d74656$518e96f0$f4abc4d0$@vivo.com>
 <YJr8PuZlOBqb+Qv1@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <15efccda-b8e3-80bc-13b7-b2d62a1cac15@huawei.com>
Date: Wed, 12 May 2021 09:52:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <YJr8PuZlOBqb+Qv1@google.com>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-ClientProxiedBy: dggemx702-chm.china.huawei.com (10.1.199.49) To
 dggemx753-chm.china.huawei.com (10.0.44.37)
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lge32-004Yck-Jn
Subject: Re: [f2fs-dev] =?utf-8?b?562U5aSNOiBbUEFUQ0ggdjRdIGYyZnM6IGNvbXBy?=
 =?utf-8?q?ess=3A_avoid_unnecessary_check_in_f2fs=5Fprepare=5Fcompress=5Fo?=
 =?utf-8?q?verwrite?=
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMS81LzEyIDU6NTAsIEphZWdldWsgS2ltIHdyb3RlOgo+IE9uIDA1LzExLCBjaGFuZ2Zl
bmduYW5Adml2by5jb20gd3JvdGU6Cj4+IEhpIEphZWdldWs6Cj4+Cj4+IElmIHRoZXJlJ3JlIGV4
aXN0aW5nIGNsdXN0ZXJzIGJleW9uZCBpX3NpemUsIG1heSBjYXVzZSBkYXRhIGNvcnJ1cHRpb24s
IGJ1dAo+PiB3aWxsIHRoaXMgaGFwcGVuIGluIG5vcm1hbD8gbWF5YmUgc29tZSBlcnJvciBjYW4g
Y2F1c2UgdGhpcywgaWYgaV9zaXplIGlzCj4+IGVycm9yIHRoZSBkYXRhIGJleW9uZCBzaXplIHN0
aWxsIGNhbid0IGhhbmRsZSBwcm9wZXJseS4gIElzIHRoZXJlIG5vcm1hbAo+PiBjYXNlIGNhbiBj
YXN1ZSBleGlzdGluZyBjbHVzdGVycyBiZXlvbmQgaV9zaXplPwo+IAo+IFdlIGRvbid0IGhhdmUg
YSBydWxlIHRvIHN5bmMgYmV0d2VlbiBpX3NpemUgYW5kIGlfYmxvY2tzLgoKSSBjYW4ndCBpbWFn
ZSBhIGNhc2UgdGhhdCBjb21wcmVzc2VkIGNsdXN0ZXIgbWF5IGNyb3NzIGZpbGVzaXplLCBpdCBs
b29rcyBpdCdzCmEgYnVnIGlmIHRoYXQgaGFwcGVuZWQsIGJ1dCBJJ20gbm90IHN1cmUgSSBoYXZl
IGNvbnNpZGVyZWQgYWxsIGNhc2VzLiBTbywgSQpwcmVmZXIgdG8gYWRkIGEgY2hlY2sgY29uZGl0
aW9uIGFzIGJlbG93LCB0aGVuIHRlc3Rpbmcgdy8geGZzdGVzdC9wb3JfZnNzdHJlc3MKZm9yIGEg
d2hpbGUuCgpTdWJqZWN0OiBbUEFUQ0hdIGYyZnM6IGNvbXByZXNzOiBjb21wcmVzc2VkIGNsdXN0
ZXIgc2hvdWxkIG5vdCBjcm9zcyBpX3NpemUKCi0tLQogIGZzL2YyZnMvZGF0YS5jIHwgMiArKwog
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9mcy9mMmZzL2Rh
dGEuYyBiL2ZzL2YyZnMvZGF0YS5jCmluZGV4IDA2ZDFlNThkMzg4Mi4uOWFjY2EzNThkNTc4IDEw
MDY0NAotLS0gYS9mcy9mMmZzL2RhdGEuYworKysgYi9mcy9mMmZzL2RhdGEuYwpAQCAtMzMyNSw2
ICszMzI1LDggQEAgc3RhdGljIGludCBmMmZzX3dyaXRlX2JlZ2luKHN0cnVjdCBmaWxlICpmaWxl
LCBzdHJ1Y3QgYWRkcmVzc19zcGFjZSAqbWFwcGluZywKICAJCQllcnIgPSByZXQ7CiAgCQkJZ290
byBmYWlsOwogIAkJfSBlbHNlIGlmIChyZXQpIHsKKwkJCWYyZnNfYnVnX29uKHNiaSwgaW5kZXgg
Pj0KKwkJCQlESVZfUk9VTkRfVVAoaV9zaXplX3JlYWQoaW5vZGUpLCBQQUdFX1NJWkUpKTsKICAJ
CQlyZXR1cm4gMDsKICAJCX0KICAJfQotLSAKMi4yOS4yCgoKCj4gCj4+Cj4+IFRoYW5rcy4KPj4K
Pj4gLS0tLS3pgq7ku7bljp/ku7YtLS0tLQo+PiDlj5Hku7bkuro6IEphZWdldWsgS2ltIDxqYWVn
ZXVrQGtlcm5lbC5vcmc+Cj4+IOWPkemAgeaXtumXtDogMjAyMeW5tDXmnIgxMOaXpSAyMzo0NAo+
PiDmlLbku7bkuro6IEZlbmduYW4gQ2hhbmcgPGNoYW5nZmVuZ25hbkB2aXZvLmNvbT4KPj4g5oqE
6YCBOiBjaGFvQGtlcm5lbC5vcmc7IGxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2Uu
bmV0Cj4+IOS4u+mimDogUmU6IFtQQVRDSCB2NF0gZjJmczogY29tcHJlc3M6IGF2b2lkIHVubmVj
ZXNzYXJ5IGNoZWNrIGluCj4+IGYyZnNfcHJlcGFyZV9jb21wcmVzc19vdmVyd3JpdGUKPj4KPj4g
T24gMDUvMDcsIEZlbmduYW4gQ2hhbmcgd3JvdGU6Cj4+PiB3aGVuIHdyaXRlIGNvbXByZXNzZWQg
ZmlsZSB3aXRoIE9fVFJVTkMsIHRoZXJlIHdpbGwgYmUgYSBsb3Qgb2YKPj4+IHVubmVjZXNzYXJ5
IGNoZWNrIHZhbGlkIGJsb2NrcyBpbiBmMmZzX3ByZXBhcmVfY29tcHJlc3Nfb3ZlcndyaXRlLAo+
Pj4gZXNwZWNpYWxseSB3aGVuIHdyaXR0ZW4gaW4gcGFnZSBzaXplLCByZW1vdmUgaXQuCj4+Pgo+
Pj4gVGhpcyBwYXRjaCB3aWxsIG5vdCBicmluZyBzaWduaWZpY2FudCBwZXJmb3JtYW5jZSBpbXBy
b3ZlbWVudHMsIEkgdGVzdAo+Pj4gdGhpcyBvbiBtb2JpbGUgcGhvbmUsIHVzZSBhbmRyb2JlbmNo
LCB0aGUgc2VxdWVudGlhbCB3cml0ZSB0ZXN0IGNhc2UKPj4+IHdhcyBvcGVuIGZpbGUgd2l0aCBP
X1RSVU5DLCBzZXQgd3JpdGUgc2l6ZSB0byA0S0IsICBwZXJmb3JtYW5jZQo+Pj4gaW1wcm92ZWQg
YWJvdXQgMiUtMyUuIElmIHdyaXRlIHNpemUgc2V0IHRvIDMyTUIsIHBlcmZvcm1hbmNlIGltcHJv
dmVkCj4+IGFib3V0IDAuNSUuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogRmVuZ25hbiBDaGFuZyA8
Y2hhbmdmZW5nbmFuQHZpdm8uY29tPgo+Pj4gLS0tCj4+PiAgIGZzL2YyZnMvZGF0YS5jIHwgOCAr
KysrKysrKwo+Pj4gICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCj4+Pgo+Pj4gZGlm
ZiAtLWdpdCBhL2ZzL2YyZnMvZGF0YS5jIGIvZnMvZjJmcy9kYXRhLmMgaW5kZXgKPj4+IGNmOTM1
NDc0ZmZiYS4uYjllYzdiMTgyZjQ1IDEwMDY0NAo+Pj4gLS0tIGEvZnMvZjJmcy9kYXRhLmMKPj4+
ICsrKyBiL2ZzL2YyZnMvZGF0YS5jCj4+PiBAQCAtMzMwMyw5ICszMzAzLDE3IEBAIHN0YXRpYyBp
bnQgZjJmc193cml0ZV9iZWdpbihzdHJ1Y3QgZmlsZSAqZmlsZSwKPj4+IHN0cnVjdCBhZGRyZXNz
X3NwYWNlICptYXBwaW5nLCAgI2lmZGVmIENPTkZJR19GMkZTX0ZTX0NPTVBSRVNTSU9OCj4+PiAg
IAlpZiAoZjJmc19jb21wcmVzc2VkX2ZpbGUoaW5vZGUpKSB7Cj4+PiAgIAkJaW50IHJldDsKPj4+
ICsJCXBnb2ZmX3QgZW5kID0gKGlfc2l6ZV9yZWFkKGlub2RlKSArIFBBR0VfU0laRSAtIDEpID4+
Cj4+IFBBR0VfU0hJRlQ7Cj4+Pgo+Pj4gICAJCSpmc2RhdGEgPSBOVUxMOwo+Pj4KPj4+ICsJCS8q
Cj4+PiArCQkgKiB3aGVuIHdyaXRlIHBvcyBpcyBiaWdnZXIgdGhhbiBpbm9kZSBzaXplCj4+ICxm
MmZzX3ByZXBhcmVfY29tcHJlc3Nfb3ZlcndyaXRlCj4+PiArCQkgKiBhbHdheXMgcmV0dXJuIDAs
IHNvIGNoZWNrIHBvcyBmaXJzdCB0byBhdm9pZCB0aGlzLgo+Pj4gKwkJICovCj4+PiArCQlpZiAo
aW5kZXggPj0gZW5kKQo+Pj4gKwkJCWdvdG8gcmVwZWF0Owo+Pgo+PiBXaGF0IGlmIHRoZXJlJ3Jl
IGV4aXN0aW5nIGNsdXN0ZXJzIGJleW9uZCBpX3NpemU/IEdpdmVuIHBlcmZvcm1hbmNlIGltcGFj
dHMsCj4+IGRvIHdlIHJlYWxseSBuZWVkIHRoaXM/Cj4+Cj4+PiArCj4+PiAgIAkJcmV0ID0gZjJm
c19wcmVwYXJlX2NvbXByZXNzX292ZXJ3cml0ZShpbm9kZSwgcGFnZXAsCj4+PiAgIAkJCQkJCQlp
bmRleCwgZnNkYXRhKTsKPj4+ICAgCQlpZiAocmV0IDwgMCkgewo+Pj4gLS0KPj4+IDIuMjkuMAo+
Pgo+IAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPiBMaW51eC1mMmZzLWRldmVsQGxpc3Rz
LnNvdXJjZWZvcmdlLm5ldAo+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xp
c3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1m
MmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdl
Lm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
