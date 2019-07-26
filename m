Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F34175D4F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Jul 2019 05:20:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hqqlz-0005ys-EC; Fri, 26 Jul 2019 03:19:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hqqlw-0005yk-Sr
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 26 Jul 2019 03:19:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jsLNV33T8EDqJt/6PQmJAt68HGz+YOCCpsQJ79Ita4Y=; b=BYAns5VPIkzMtGx2zx51ytQQIN
 92h73QyHStu9ZKeoiZp5R/nAl29nPH0mTTiSleoGkNDnp+oXu7f+z9pFmEwN3ORtPd4CfVfAha7bE
 TSGv8i3kOJ0CAToxYr0eOmdH7tmQAyhyxLhOAWk/TGZkxkLXGt1rAGOUOJFhXR9Mwbuw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jsLNV33T8EDqJt/6PQmJAt68HGz+YOCCpsQJ79Ita4Y=; b=hzU2KxZwiHrilVZHQ1yhOvWmbj
 m0sHO06evm1qHZVcF3MVNe7WUDW/Qk9VTxmApBFcWj848/LXVE3/etqdJ8fI3OFyFIWlKj+fapnKf
 0fa63TuZi9NzjQAADrHGJN/QTzDyInbNKt4QY1hupOWNA1bGGrwfXLf83fhc0EmG7jss=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hqqlv-00GvYI-7K
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 26 Jul 2019 03:19:56 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 273C2B958C07B3984965;
 Fri, 26 Jul 2019 11:19:45 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.206) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 26 Jul
 2019 11:19:43 +0800
To: Jia-Ju Bai <baijiaju1990@gmail.com>, <jaegeuk@kernel.org>
References: <f577be2f-fc2f-9ef8-2c6c-9c247123b1ad@gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <2d66cd56-eccf-9086-c5db-118acce717a6@huawei.com>
Date: Fri, 26 Jul 2019 11:19:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <f577be2f-fc2f-9ef8-2c6c-9c247123b1ad@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hqqlv-00GvYI-7K
Subject: Re: [f2fs-dev] [BUG] fs: f2fs: Possible null-pointer dereferences
 in update_general_status()
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGkgSmlhanUsCgpUaGFua3MgZm9yIHRoZSByZXBvcnQsIEkgY2hlY2tlZCB0aGUgY29kZSwgYW5k
IGZvdW5kIGl0IGRvZXNuJ3QgbmVlZCB0byBjaGVjawpTTV9JKHNiaSkgcG9pbnRlciwgdGhpcyBp
cyBiZWNhdXNlIGluIGZpbGxfc3VwZXIoKSBhbmQgcHV0X3N1cGVyKCksIHdlIHdpbGwgY2FsbApm
MmZzX2Rlc3Ryb3lfc3RhdHMoKSBpbiBwcmlvciB0byBmMmZzX2Rlc3Ryb3lfc2VnbWVudF9tYW5h
Z2VyKCksIHNvIGlmIGN1cnJlbnQKc2JpIGNhbiBzdGlsbCBiZSB2aXNpdGVkIGluIGdsb2JhbCBz
dGF0IGxpc3QsIFNNX0koc2JpKSBzaG91bGQgYmUgcmVsZWFzZWQgeWV0LgpTbyBhbnl3YXksIGxl
dCdzIHJlbW92ZSB1bm5lZWRlZCBjaGVjayBpbiBsaW5lIDcwLzc4LiA6KQoKVGhhbmtzLAoKT24g
MjAxOS83LzI1IDE3OjQ5LCBKaWEtSnUgQmFpIHdyb3RlOgo+IEluIHVwZGF0ZV9nZW5lcmFsX3N0
YXR1cygpLCB0aGVyZSBhcmUgdHdvIGlmIHN0YXRlbWVudHMgdG8KPiBjaGVjayB3aGV0aGVyIFNN
X0koc2JpKSBpcyBOVUxMOgo+IExJTkUgNzA6wqDCoMKgwqAgaWYgKFNNX0koc2JpKSAmJiBTTV9J
KHNiaSktPmZjY19pbmZvKQo+IExJTkUgNzg6wqDCoMKgwqAgaWYgKFNNX0koc2JpKSAmJiBTTV9J
KHNiaSktPmRjY19pbmZvKQo+IAo+IFdoZW4gU01fSShzYmkpIGlzIE5VTEwsIGl0IGlzIHVzZWQg
YXQgc29tZSBwbGFjZXMsIHN1Y2ggYXM6Cj4gTElORSA4ODogcmVzZXJ2ZWRfc2VnbWVudHMoc2Jp
KQo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBTTV9JKHNiaSkt
PnJlc2VydmVkX3NlZ21lbnRzOwo+IExJTkUgODk6IG92ZXJwcm92aXNpb25fc2VnbWVudHMoc2Jp
KQo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBTTV9JKHNiaSkt
Pm92cF9zZWdtZW50czsKPiBMSU5FIDExMjogTUFJTl9TRUdTKHNiaSkKPiAgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKFNNX0koc2JpKS0+bWFpbl9zZWdtZW50cykKPiAK
PiBUaHVzLCBwb3NzaWJsZSBudWxsLXBvaW50ZXIgZGVyZWZlcmVuY2VzIG1heSBvY2N1ci4KPiAK
PiBUaGVzZSBidWdzIGFyZSBmb3VuZCBieSBhIHN0YXRpYyBhbmFseXNpcyB0b29sIFNUQ2hlY2sg
d3JpdHRlbiBieSB1cy4KPiAKPiBJIGRvIG5vdCBrbm93IGhvdyB0byBjb3JyZWN0bHkgZml4IHRo
ZXNlIGJ1Z3MsIHNvIEkgb25seSByZXBvcnQgdGhlbS4KPiAKPiAKPiBCZXN0IHdpc2hlcywKPiBK
aWEtSnUgQmFpCj4gLgo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxA
bGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3Rz
L2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
