Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B3243A9C9
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 Oct 2021 03:39:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mfBQp-0006xy-AE; Tue, 26 Oct 2021 01:39:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <wangxiaojun11@huawei.com>) id 1mfBQn-0006xg-2H
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Oct 2021 01:39:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2vNg84XwYNZkkEcCWcRlm2Nja1ijuSr6U8AG4Ra78Uc=; b=WlPILsnbF9wsxRfeLwFFuklJiu
 rc/CUwnde9QlwAao0WRsolLnD/XYwoFp+phaXnQwbQEYPYIawg1/9aXM0lIbwoR/DsqjiU9ndexKG
 qyrU4Q28hihPdO2BGHDl0dxsbWr8WBvry6A+oQckbnPPT3ZlaskmucAGijt3Doj3OQbE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2vNg84XwYNZkkEcCWcRlm2Nja1ijuSr6U8AG4Ra78Uc=; b=AMLEfFQ+75ffXxuaXoHgGi3iEl
 uRKeID6KBw6kBpx8CJLMiFfCzKFUpme8OUAE64wac8Xu1AtLcreVfLKkPQRcY2nrBbrJTJfRPG7DU
 BC55AF9339VRpN+O9li4AvjJMv9aHppeOSSLJrKtCpY70D6B/IKO8ivjXo/12SvB+sEk=;
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mfBQc-00GGjp-F8
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Oct 2021 01:39:13 +0000
Received: from dggeml756-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4HdZ9Z3SwQzbn4B;
 Tue, 26 Oct 2021 09:34:10 +0800 (CST)
Received: from [10.174.177.8] (10.174.177.8) by dggeml756-chm.china.huawei.com
 (10.1.199.158) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.15; Tue, 26
 Oct 2021 09:38:48 +0800
To: Chao Yu <chao@kernel.org>, <jaegeuk@kernel.org>
References: <20211025120931.1409835-1-wangxiaojun11@huawei.com>
 <1a8748f4-c15d-361a-f57a-bdacc037314f@kernel.org>
From: Wang Xiaojun <wangxiaojun11@huawei.com>
Message-ID: <5a3e82d0-0f89-36a1-7f0b-b072b97278a5@huawei.com>
Date: Tue, 26 Oct 2021 09:38:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1a8748f4-c15d-361a-f57a-bdacc037314f@kernel.org>
X-Originating-IP: [10.174.177.8]
X-ClientProxiedBy: dggeme705-chm.china.huawei.com (10.1.199.101) To
 dggeml756-chm.china.huawei.com (10.1.199.158)
X-CFilter-Loop: Reflected
X-Spam-Score: -4.3 (----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  在 2021/10/26 8:29, Chao Yu 写道: > On 2021/10/25 20:09,
    Wang Xiaojun wrote: >> If sbi->cur_cp is 2 and the duplicate_checkpoint function
    returns >> in advance because sbi->cp_backuped is set to tr [...] 
 
 Content analysis details:   (-4.3 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [45.249.212.187 listed in wl.mailspike.net]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
                             medium trust
                             [45.249.212.187 listed in list.dnswl.org]
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1mfBQc-00GGjp-F8
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: fix the wrong sbi->cur_cp setting
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

CuWcqCAyMDIxLzEwLzI2IDg6MjksIENoYW8gWXUg5YaZ6YGTOgo+IE9uIDIwMjEvMTAvMjUgMjA6
MDksIFdhbmcgWGlhb2p1biB3cm90ZToKPj4gSWYgc2JpLT5jdXJfY3AgaXMgMiBhbmQgdGhlIGR1
cGxpY2F0ZV9jaGVja3BvaW50IGZ1bmN0aW9uIHJldHVybnMKPj4gaW4gYWR2YW5jZSBiZWNhdXNl
IHNiaS0+Y3BfYmFja3VwZWQgaXMgc2V0IHRvIHRydWUsIHdlIGNhbm5vdCBzZXQKPj4gc2JpLT5j
dXJfY3AgdG8gMS4KPgo+IEhtbW0sIGluIHByZXZpb3VzIGltcGxlbWVudGF0aW9uLCB3aGF0IHBy
b2JsZW0gd2Ugd2lsbCBlbmNvdW50ZXIsIGFuZAo+IHdoYXQncyB0aGUgcm9vdCBjYXVzZT8KPgo+
IFRoYW5rcywKCkluIGZhY3QsIGl0J3Mgbm90IGNhdXNpbmcgcHJvYmxlbXMgYXQgdGhpcyB0aW1l
LgoKRHVyaW5nIHRoZSBjb2RlIHJldmlldywgSSBmb3VuZCB0aGF0IHRoaXMgd2FzIG5vdCBsb2dp
Y2FsbHkgcmVhc29uYWJsZS4KClRoaXMgcGFyYW1ldGVyKHNiaS0+Y3VyX2NwKSBjYW4gYmUgc2V0
IHRvIDEgb25seSBhZnRlciBzdWNjZXNzZnVsIApyZXBsaWNhdGlvbi4KClRoYW5rcywKCj4KPj4K
Pj4gU2lnbmVkLW9mZi1ieTogV2FuZyBYaWFvanVuIDx3YW5neGlhb2p1bjExQGh1YXdlaS5jb20+
Cj4+IC0tLQo+PiDCoCBmc2NrL2ZzY2suY8KgIHwgMyAtLS0KPj4gwqAgZnNjay9tb3VudC5jIHwg
NSArKy0tLQo+PiDCoCAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlv
bnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2ZzY2svZnNjay5jIGIvZnNjay9mc2NrLmMKPj4gaW5k
ZXggMTEwYzFlYy4uYWE3N2EzNCAxMDA2NDQKPj4gLS0tIGEvZnNjay9mc2NrLmMKPj4gKysrIGIv
ZnNjay9mc2NrLmMKPj4gQEAgLTIzODMsOSArMjM4Myw2IEBAIHN0YXRpYyB2b2lkIGZpeF9jaGVj
a3BvaW50cyhzdHJ1Y3QgZjJmc19zYl9pbmZvIAo+PiAqc2JpKQo+PiDCoCB7Cj4+IMKgwqDCoMKg
wqAgLyogY29weSB2YWxpZCBjaGVja3BvaW50IHRvIGl0cyBtaXJyb3IgcG9zaXRpb24gKi8KPj4g
wqDCoMKgwqDCoCBkdXBsaWNhdGVfY2hlY2twb2ludChzYmkpOwo+PiAtCj4+IC3CoMKgwqAgLyog
cmVwYWlyIGNoZWNrcG9pbnQgYXQgQ1AgIzAgcG9zaXRpb24gKi8KPj4gLcKgwqDCoCBzYmktPmN1
cl9jcCA9IDE7Cj4+IMKgwqDCoMKgwqAgZml4X2NoZWNrcG9pbnQoc2JpKTsKPj4gwqAgfQo+PiDC
oCBkaWZmIC0tZ2l0IGEvZnNjay9tb3VudC5jIGIvZnNjay9tb3VudC5jCj4+IGluZGV4IGM5Mjhh
MTUuLjI5NTE3MGUgMTAwNjQ0Cj4+IC0tLSBhL2ZzY2svbW91bnQuYwo+PiArKysgYi9mc2NrL21v
dW50LmMKPj4gQEAgLTI5OTgsNiArMjk5OCw4IEBAIHZvaWQgZHVwbGljYXRlX2NoZWNrcG9pbnQo
c3RydWN0IGYyZnNfc2JfaW5mbyAKPj4gKnNiaSkKPj4gwqDCoMKgwqDCoCBBU1NFUlQocmV0ID49
IDApOwo+PiDCoCDCoMKgwqDCoMKgIHNiaS0+Y3BfYmFja3VwZWQgPSAxOwo+PiArwqDCoMKgIC8q
IHJlcGFpciBjaGVja3BvaW50IGF0IENQICMwIHBvc2l0aW9uICovCj4+ICvCoMKgwqAgc2JpLT5j
dXJfY3AgPSAxOwo+PiDCoCDCoMKgwqDCoMKgIE1TRygwLCAiSW5mbzogRHVwbGljYXRlIHZhbGlk
IGNoZWNrcG9pbnQgdG8gbWlycm9yIHBvc2l0aW9uICIKPj4gwqDCoMKgwqDCoMKgwqDCoMKgICIl
bGx1IC0+ICVsbHVcbiIsIHNyYywgZHN0KTsKPj4gQEAgLTMwOTgsOSArMzEwMCw2IEBAIHZvaWQg
d3JpdGVfY2hlY2twb2ludHMoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKQo+PiDCoCB7Cj4+IMKg
wqDCoMKgwqAgLyogY29weSB2YWxpZCBjaGVja3BvaW50IHRvIGl0cyBtaXJyb3IgcG9zaXRpb24g
Ki8KPj4gwqDCoMKgwqDCoCBkdXBsaWNhdGVfY2hlY2twb2ludChzYmkpOwo+PiAtCj4+IC3CoMKg
wqAgLyogcmVwYWlyIGNoZWNrcG9pbnQgYXQgQ1AgIzAgcG9zaXRpb24gKi8KPj4gLcKgwqDCoCBz
YmktPmN1cl9jcCA9IDE7Cj4+IMKgwqDCoMKgwqAgd3JpdGVfY2hlY2twb2ludChzYmkpOwo+PiDC
oCB9Cj4+Cj4gLgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMu
c291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3Rp
bmZvL2xpbnV4LWYyZnMtZGV2ZWwK
