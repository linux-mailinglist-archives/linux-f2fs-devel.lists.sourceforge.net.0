Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9577522193F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 Jul 2020 03:04:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jvsKC-0008Sk-NS; Thu, 16 Jul 2020 01:04:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jvsKB-0008SV-0n
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 16 Jul 2020 01:04:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UQJObexPRsDsRi4bG8axIF/XVJQIZB1haavbfvslv48=; b=HWehyqfOg0r1Mca8fijhJgf92S
 cD36OlAJg86RLco7jj0lrTmC9dFDOsRFjGevV1dKPJK4u6nNwVpyzGAfqcXTyvjfIECV0ga0wLpkh
 pzki/EBAhuERc/HYw1dVWwKJom9rPL3xazZaWTm530Bm4J05XSX8ZJNDFy7ASypubG0Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UQJObexPRsDsRi4bG8axIF/XVJQIZB1haavbfvslv48=; b=gevHVhvDcv18LN4SOFC2aiwFKD
 3KGX8zcRO++amnEcW+wbWCbqPbFga6+AsV9G3swweRIMxJD8URko57dTLhDWiHRkV5woHGg8g8qAe
 BkyVvmadAAhmL8wYc0WGMrmDmAOcVArF301LAxcGLAHnEkIPM276FNV0XobgWr0iukPs=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jvsK6-0028ta-NE
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 16 Jul 2020 01:04:34 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 00D367C0197A199A374A;
 Thu, 16 Jul 2020 09:04:20 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.210) with Microsoft SMTP Server (TLS) id 14.3.487.0; Thu, 16 Jul
 2020 09:04:16 +0800
To: Eric Biggers <ebiggers@kernel.org>, Daeho Jeong <daeho43@gmail.com>
References: <20200713031252.3873546-1-daeho43@gmail.com>
 <20200713181152.GC2910046@google.com>
 <3b02263d-a5e1-136c-40ed-514d34e4c895@huawei.com>
 <CACOAw_wBD_ourGJSdRTDM-wzeH97aGE966QDB6bpjiyXRrh47A@mail.gmail.com>
 <f4a594a1-464f-3a74-90cb-fd536bed9962@huawei.com>
 <CACOAw_w3OWDVXSYHuTEEVv1HaBZir1CWcRAmxOt00MB4vXBKVg@mail.gmail.com>
 <1d84bc01-fece-df55-6e33-07a705cfb432@huawei.com>
 <CACOAw_xaS7qB22EPsZvHoC=uPiPtqGMAK5cP4Vk20xO21GQ-Kg@mail.gmail.com>
 <20200715164220.GC1167@sol.localdomain>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <78df7d19-2744-34df-73b3-3c4650db8771@huawei.com>
Date: Thu, 16 Jul 2020 09:04:15 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200715164220.GC1167@sol.localdomain>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jvsK6-0028ta-NE
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: change the way of handling
 range.len in F2FS_IOC_SEC_TRIM_FILE
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, kernel-team@android.com, Daeho
 Jeong <daehojeong@google.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMC83LzE2IDA6NDIsIEVyaWMgQmlnZ2VycyB3cm90ZToKPiBPbiBXZWQsIEp1bCAxNSwg
MjAyMCBhdCAwNzoyNToxM1BNICswOTAwLCBEYWVobyBKZW9uZyB3cm90ZToKPj4gQ2hhbywKPj4K
Pj4gSSBjYW4ndCBmaW5kIGZzY3J5cHRfemVyb291dF9yYW5nZV9pbmxpbmVfY3J5cHQoKSBmdW5j
dGlvbi4gRG8geW91Cj4+IG1lYW4gd2UgbmVlZCB0byBpbXBsZW1lbnQgdGhpcyBvbmUgZm9yIGlu
bGluZSBlbmNyeXB0aW9uPwo+Pgo+PiAyMDIw64WEIDfsm5QgMTXsnbwgKOyImCkg7Jik7ZuEIDQ6
MTcsIENoYW8gWXUgPHl1Y2hhbzBAaHVhd2VpLmNvbT7ri5jsnbQg7J6R7ISxOgo+Pj4KPj4+IE9u
IDIwMjAvNy8xNSAxNDo1NCwgRGFlaG8gSmVvbmcgd3JvdGU6Cj4+Pj4gWW91IG1lYW4gd2UgY2Fu
IHN1cHBvcnQgWkVST09VVCBvcHRpb24gb25seSBmb3IgZW5jcnlwdGVkIGZpbGVzIG9mCj4+Pj4g
bm9uLW11bHRpZGV2aWNlIGYyZnMsCj4+Pj4gYW5kIHJldHVybiAtRU9QTk9UU1VQUCBpbiB0aGUg
bXVsdGlkZXZpY2UgY2FzZSwgcmlnaHQgbm93Pwo+Pj4KPj4+IFllcywgc29tZXRoaW5nIGxpa2U6
Cj4+Pgo+Pj4gZjJmc19zZWNfdHJpbV9maWxlKCkKPj4+Cj4+PiBpZiAoKHJhbmdlLmZsYWdzICYg
RjJGU19UUklNX0ZJTEVfWkVST09VVCkgJiYKPj4+ICAgICAgICAgZjJmc19lbmNyeXB0ZWRfZmls
ZSgpICYmIGYyZnNfaXNfbXVsdGlfZGV2aWNlKCkpCj4+PiAgICAgICAgIHJldHVybiAtRU9QTk9U
U1VQUDsKPj4+Cj4+Pgo+Pj4gZjJmc19zZWN1cmVfZXJhc2UoKQo+Pj4KPj4+IGlmICghcmV0ICYm
IChmbGFncyAmIEYyRlNfVFJJTV9GSUxFX1pFUk9PVVQpKSB7Cj4+PiAgICAgICAgIGlmIChmMmZz
X2VuY3J5cHRlZF9maWxlKCkpIHsKPj4+ICAgICAgICAgICAgICAgICBpZiAoZnNjcnlwdF9pbm9k
ZV91c2VzX2ZzX2xheWVyX2NyeXB0bykKPj4+ICAgICAgICAgICAgICAgICAgICAgICAgIHJldCA9
IGZzY3J5cHRfemVyb291dF9yYW5nZSgpOwo+Pj4gICAgICAgICAgICAgICAgIGVsc2UKPj4+ICAg
ICAgICAgICAgICAgICAgICAgICAgIHJldCA9IGZzY3J5cHRfemVyb291dF9yYW5nZV9pbmxpbmVf
Y3J5cHQoKTsKPj4+ICAgICAgICAgfSBlbHNlIHsKPj4+ICAgICAgICAgICAgICAgICByZXQgPSBi
bGtkZXZfaXNzdWVfemVyb291dCgpOwo+Pj4gICAgICAgICB9Cj4+PiB9Cj4gCj4gZnNjcnlwdF96
ZXJvb3V0X3JhbmdlX2lubGluZV9jcnlwdCgpIGlzIGJlaW5nIGFkZGVkIGJ5Cj4gImZzY3J5cHQ6
IGFkZCBpbmxpbmUgZW5jcnlwdGlvbiBzdXBwb3J0Iiwgd2hpY2ggaXMgcXVldWVkIGluIHRoZSBm
c2NyeXB0IHRyZWUKPiAodGhlIG1hc3RlciBicmFuY2ggb2YgaHR0cHM6Ly9naXQua2VybmVsLm9y
Zy9wdWIvc2NtL2ZzL2ZzY3J5cHQvZnNjcnlwdC5naXQpLgo+IAo+IEJ1dCB0aGF0J3Mgbm90IGFj
dHVhbGx5IHJlbGV2YW50IGhlcmUgYmVjYXVzZSBmc2NyeXB0X3plcm9vdXRfcmFuZ2UoKSBjYWxs
cwo+IGZzY3J5cHRfemVyb291dF9yYW5nZV9pbmxpbmVfY3J5cHQoKSB3aGVuIG5lZWRlZC4KCk9o
LCBjb3JyZWN0LCB0aGFua3MgZm9yIHBvaW50aW5nIG91dC4KClRoYW5rcywKCj4gCj4gSnVzdCB1
c2UgZnNjcnlwdF96ZXJvb3V0X3JhbmdlKCkuCj4gCj4gLSBFcmljCj4gLgo+IAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwg
bWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBz
Oi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
