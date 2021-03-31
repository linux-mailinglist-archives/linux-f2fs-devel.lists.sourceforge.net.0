Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D075634FD13
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 31 Mar 2021 11:38:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lRXIo-0002um-Ct; Wed, 31 Mar 2021 09:38:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1lRXIm-0002uf-Fq
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 31 Mar 2021 09:38:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=POhGSF/3lfQXoHdFfJdxIcRljKKPscIoZY2dmWN3fFI=; b=XWxF0yviRKBjOlMBooz7rDcQD5
 TBAygM/Q1mYS7YfCDHtlp3bXkBVD9vqNy7MvM/MZ5u4cnayfoE3xTMdMXPmfvhp3qK8LgP8YZD1oj
 pVO2KGZH67sJ2US+COj4vl+6ly6rvZ+JGM+KbXWQUdedt+mEyJFtpyiGQuxurocWSUwA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=POhGSF/3lfQXoHdFfJdxIcRljKKPscIoZY2dmWN3fFI=; b=A7mNQAg9ShGRNxWC3HdME/8rPB
 Lvw5uf4rxWwWdHX0fBESbjY3mTTDDI/Rtu8Wg3Zy/mimIn7txSycRF2I6eAGCVKFOZS4a00fiGbLO
 K3h3xb4MBv6AUKVad+2FGodhI0W5MSm6dIQGUuRYwkfen1JuYwLJorc5SXJ6c8km43Jc=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lRXIh-0006EC-7Y
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 31 Mar 2021 09:38:16 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F9LlG1yq0zmc9j;
 Wed, 31 Mar 2021 17:35:22 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by smtp.huawei.com
 (10.3.19.205) with Microsoft SMTP Server (TLS) id 14.3.498.0; Wed, 31 Mar
 2021 17:37:53 +0800
To: Yi Zhuang <zhuangyi1@huawei.com>, <jaegeuk@kernel.org>, <chao@kernel.org>, 
 <linux-f2fs-devel@lists.sourceforge.net>
References: <20210331093414.52308-1-zhuangyi1@huawei.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <a1530b34-98e9-06e3-9fba-b3d8a797eda1@huawei.com>
Date: Wed, 31 Mar 2021 17:37:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20210331093414.52308-1-zhuangyi1@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lRXIh-0006EC-7Y
Subject: Re: [f2fs-dev] [PATCH] f2fs: Fix a hungtask problem in atomic write
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
Cc: yuehaibing@huawei.com, weiyongjun1@huawei.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMS8zLzMxIDE3OjM0LCBZaSBaaHVhbmcgd3JvdGU6Cj4gSW4gdGhlIGNhY2hlIHdyaXRp
bmcgcHJvY2VzcywgaWYgaXQgaXMgYW4gYXRvbWljIGZpbGUsIGluY3JlYXNlIHRoZSBwYWdlCj4g
Y291bnQgb2YgRjJGU19XQl9DUF9EQVRBLCBvdGhlcndpc2UgaW5jcmVhc2UgdGhlIHBhZ2UgY291
bnQgb2YKPiBGMkZTX1dCX0RBVEEuCj4gCj4gV2hlbiB5b3Ugc3RlcCBpbnRvIHRoZSBob29rIGJy
YW5jaCBkdWUgdG8gaW5zdWZmaWNpZW50IG1lbW9yeSBpbgo+IGYyZnNfd3JpdGVfYmVnaW4sIGYy
ZnNfZHJvcF9pbm1lbV9wYWdlc19hbGwgd2lsbCBiZSBjYWxsZWQgdG8gdHJhdmVyc2UKPiBhbGwg
YXRvbWljIGlub2RlcyBhbmQgY2xlYXIgdGhlIEZJX0FUT01JQ19GSUxFIG1hcmsgb2YgYWxsIGF0
b21pYyBmaWxlcy4KPiAKPiBJbiBmMmZzX2Ryb3BfaW5tZW1fcGFnZXPvvIxmaXJzdCBhY3F1aXJl
IHRoZSBpbm1lbV9sb2NrICwgcmV2b2tlIGFsbCB0aGUKPiBpbm1lbV9wYWdlcywgYW5kIHRoZW4g
Y2xlYXIgdGhlIEZJX0FUT01JQ19GSUxFIG1hcmsuIEJlZm9yZSB0aGlzIG1hcmsgaXMKPiBjbGVh
cmVkLCBvdGhlciB0aHJlYWRzIG1heSBob2xkIGlubWVtX2xvY2sgdG8gYWRkIGlubWVtX3BhZ2Vz
IHRvIHRoZSBpbm9kZQo+IHRoYXQgaGFzIGp1c3QgYmVlbiBlbXB0aWVkIGlubWVtX3BhZ2VzLCBh
bmQgaW5jcmVhc2UgdGhlIHBhZ2UgY291bnQgb2YKPiBGMkZTX1dCX0NQX0RBVEEuCj4gCj4gV2hl
biB0aGUgSU8gcmV0dXJucywgaXQgaXMgZm91bmQgdGhhdCB0aGUgRklfQVRPTUlDX0ZJTEUgZmxh
ZyBpcyBjbGVhcmVkCj4gYnkgZjJmc19kcm9wX2lubWVtX3BhZ2VzX2FsbCwgYW5kIGYyZnNfaXNf
YXRvbWljX2ZpbGUgcmV0dXJucyBmYWxzZSx3aGljaAo+IGNhdXNlcyB0aGUgcGFnZSBjb3VudCBv
ZiBGMkZTX1dCX0RBVEEgdG8gYmUgZGVjcmVtZW50ZWQuIFRoZSBwYWdlIGNvdW50IG9mCj4gRjJG
U19XQl9DUF9EQVRBIGNhbm5vdCBiZSBjbGVhcmVkLiBGaW5hbGx5LCBodW5ndGFzayBpcyB0cmln
Z2VyZWQgaW4KPiBmMmZzX3dhaXRfb25fYWxsX3BhZ2VzIGJlY2F1c2UgZ2V0X3BhZ2VzIHdpbGwg
bmV2ZXIgcmV0dXJuIHplcm8uCj4gCj4gcHJvY2VzcyBBOgkJCQlwcm9jZXNzIEI6Cj4gZjJmc19k
cm9wX2lubWVtX3BhZ2VzX2FsbAo+IC0+ZjJmc19kcm9wX2lubWVtX3BhZ2VzIG9mIGlub2RlIzEK
PiAgICAgIC0+bXV0ZXhfbG9jaygmZmktPmlubWVtX2xvY2spCj4gICAgICAtPl9fcmV2b2tlX2lu
bWVtX3BhZ2VzIG9mIGlub2RlIzEJZjJmc19pb2NfY29tbWl0X2F0b21pY193cml0ZQo+ICAgICAg
LT5tdXRleF91bmxvY2soJmZpLT5pbm1lbV9sb2NrKQktPmYyZnNfY29tbWl0X2lubWVtX3BhZ2Vz
IG9mIGlub2RlIzEKPiAJCQkJCS0+bXV0ZXhfbG9jaygmZmktPmlubWVtX2xvY2spCj4gCQkJCQkt
Pl9fZjJmc19jb21taXRfaW5tZW1fcGFnZXMKPiAJCQkJCSAgICAtPmYyZnNfZG9fd3JpdGVfZGF0
YV9wYWdlCj4gCQkJCQkgICAgICAgIC0+ZjJmc19vdXRwbGFjZV93cml0ZV9kYXRhCj4gCQkJCQkg
ICAgICAgICAgICAtPmRvX3dyaXRlX3BhZ2UKPiAJCQkJCSAgICAgICAgICAgICAgICAtPmYyZnNf
c3VibWl0X3BhZ2Vfd3JpdGUKPiAJCQkJCSAgICAgICAgICAgICAgICAgICAgLT5pbmNfcGFnZV9j
b3VudChzYmksIEYyRlNfV0JfQ1BfREFUQSApCj4gCQkJCQktPm11dGV4X3VubG9jaygmZmktPmlu
bWVtX2xvY2spCj4gICAgICAtPnNwaW5fbG9jaygmc2JpLT5pbm9kZV9sb2NrW0FUT01JQ19GSUxF
XSk7Cj4gICAgICAtPmNsZWFyX2lub2RlX2ZsYWcoaW5vZGUsIEZJX0FUT01JQ19GSUxFKQo+ICAg
ICAgLT5zcGluX3VubG9jaygmc2JpLT5pbm9kZV9sb2NrW0FUT01JQ19GSUxFXSkKPiAJCQkJCWYy
ZnNfd3JpdGVfZW5kX2lvCj4gCQkJCQktPmRlY19wYWdlX2NvdW50KHNiaSwgRjJGU19XQl9EQVRB
ICk7Cj4gCj4gV2UgY2FuIGZpeCB0aGUgcHJvYmxlbSBieSBwdXR0aW5nIHRoZSBhY3Rpb24gb2Yg
Y2xlYXJpbmcgdGhlIEZJX0FUT01JQ19GSUxFCj4gbWFyayBpbnRvIHRoZSBpbm1lbV9sb2NrIGxv
Y2suIFRoaXMgb3BlcmF0aW9uIGNhbiBlbnN1cmUgdGhhdCBubyBvbmUgd2lsbAo+IHN1Ym1pdCB0
aGUgaW5tZW0gcGFnZXMgYmVmb3JlIHRoZSBGSV9BVE9NSUNfRklMRSBtYXJrIGlzIGNsZWFyZWQs
IHNvIHRoYXQKPiB0aGVyZSB3aWxsIGJlIG5vIGF0b21pYyB3cml0ZXMgd2FpdGluZyBmb3Igd3Jp
dGViYWNrLgo+IAo+IEZpeGVzOiA1Nzg2NGFlNWNlM2EgKCJmMmZzOiBsaW1pdCAjIG9mIGlubWVt
b3J5IHBhZ2VzIikKPiBTaWduZWQtb2ZmLWJ5OiBZaSBaaHVhbmcgPHpodWFuZ3lpMUBodWF3ZWku
Y29tPgoKUmV2aWV3ZWQtYnk6IENoYW8gWXUgPHl1Y2hhbzBAaHVhd2VpLmNvbT4KClRoYW5rcywK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1m
MmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdl
Lm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1m
MmZzLWRldmVsCg==
