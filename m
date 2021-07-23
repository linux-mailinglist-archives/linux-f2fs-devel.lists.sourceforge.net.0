Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 674F63D3235
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Jul 2021 05:27:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m6lqS-0006b5-PB; Fri, 23 Jul 2021 03:27:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jack.qiu@huawei.com>) id 1m6lqQ-0006az-UX
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 23 Jul 2021 03:27:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dMFA2XPyVOF1iPHyKcHKSGE/NqKp2MfQzNq+EJ8FXtQ=; b=XJ3prwPY9/VREggqyZxT/kFqDv
 d/J9qaLtkjp0S+G3BuQRXxROrtbiwsxw15e0t4aEI+YqYVzDNhSpNLqw1HyWytiFra1G+sB6RqKw0
 aAP1NsAbj3qzHvViRTTYvnt8SPbQSGZ/L93yxzyF5QpPNx2YJKSnKzA5jLY+6NlF/gt4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dMFA2XPyVOF1iPHyKcHKSGE/NqKp2MfQzNq+EJ8FXtQ=; b=LrfqxZ3VbilC9nSH5+fHqYgCA6
 UfHNeVmZeOd471Xk7V9OsbQPq0x8cKe3xv75kUZ/qwTAPESJwjl0j9+LVGmr3pYT7aWTydsUoCqeT
 6KNeCa2foXPLiKcQtAHe1QF0vz0u7xGUFZmWodHFEEy9AucMCE59xep2X7nCAiQHLfw8=;
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m6lqO-0002iD-9w
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 23 Jul 2021 03:27:26 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4GWF5f6cKRz7xLP;
 Fri, 23 Jul 2021 11:23:34 +0800 (CST)
Received: from dggpemm500008.china.huawei.com (7.185.36.136) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 23 Jul 2021 11:27:15 +0800
Received: from [10.174.176.201] (10.174.176.201) by
 dggpemm500008.china.huawei.com (7.185.36.136) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 23 Jul 2021 11:27:15 +0800
To: Chao Yu <chao@kernel.org>, <jaegeuk@kernel.org>
References: <20210722044130.44591-1-jack.qiu@huawei.com>
 <630147dc-4f73-f985-347a-c4933c312edd@kernel.org>
 <e5616c5c-3b3d-2036-3395-8d0d0ce2cf80@huawei.com>
 <fd3b4af6-34a8-2fcf-e82f-888831f5d097@kernel.org>
From: Jack Qiu <jack.qiu@huawei.com>
Message-ID: <1f950160-1d6a-13ea-2ba1-39b906f5cc0d@huawei.com>
Date: Fri, 23 Jul 2021 11:27:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <fd3b4af6-34a8-2fcf-e82f-888831f5d097@kernel.org>
X-Originating-IP: [10.174.176.201]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500008.china.huawei.com (7.185.36.136)
X-CFilter-Loop: Reflected
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.188 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.2 NICE_REPLY_A           Looks like a legit reply (A)
 0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1m6lqO-0002iD-9w
Subject: Re: [f2fs-dev] [PATCH -next] f2fs: fix use after free in
 f2fs_fill_super
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMS83LzIzIDEwOjUxLCBDaGFvIFl1IHdyb3RlOgo+IE9uIDIwMjEvNy8yMyAxMDo0MSwg
SmFjayBRaXUgd3JvdGU6Cj4+IE9uIDIwMjEvNy8yMiAyMjowNSwgQ2hhbyBZdSB3cm90ZToKPj4+
IE9uIDIwMjEvNy8yMiAxMjo0MSwgSmFjayBRaXUgd3JvdGU6Cj4+Pj4gVGhlIHJvb3QgY2F1c2Ug
aXMgc2hyaW5rX2RjYWNoZV9zYiBhZnRlciBzYmkgaGFzIGJlZW4gZnJlZWQuCj4+Pj4gU28gY2Fs
bCBzaHJpbmtfZGNhY2hlX3NiIGJlZm9yZSBmcmVlIHNiaSBhbmQgb3RoZXIgcmVzb3VyY2VzLgo+
Pj4+Cj4+Pj4gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09Cj4+Pj4gQlVHOiBLQVNBTjogdXNlLWFmdGVyLWZyZWUgaW4gZjJm
c19ldmljdF9pbm9kZSsweDMxYy8weGRlNQo+Pj4+IFJlYWQgb2Ygc2l6ZSA0IGF0IGFkZHIgZmZm
Zjg4ODFkOTdmMGQ1MCBieSB0YXNrIHN5ei1leGVjdXRvci4zLzg3MjkKPj4+Pgo+Pj4+IFBVOiAx
IFBJRDogODcyOSBDb21tOiBzeXotZXhlY3V0b3IuMyBOb3QgdGFpbnRlZAo+Pj4+IDQuMTkuMTk1
LTAwMDAyLWc2N2RjZWVhMDQ0MzEtZGlydHkgIzMxCj4+Pgo+Pj4gRG9lcyB0aGlzIGJ1ZyBiZWxv
dyB0byA0LjE5LjE5NT8KPiAKPiBJIG1lYW4gd2hldGhlciB0aGlzIGJ1ZyBleGlzdHMgaW4gbWFp
bmxpbmU/IE5vdCBzdXJlLCBJIGp1c3QgZG91YnQgbWF5YmUKPiB3ZSBoYXZlIGZpeGVkIHRoaXMg
aXNzdWUsIGJ1dCBmb3Jnb3QgdG8gYmFja3BvcnQgaXQgdG8gNC4xOSBzdGFibGUga2VybmVsLgo+
IApHb3QgaXQuCj4+Pgo+PiBZZXMsIEkgYmVsaWV2ZSBlZDJlNjIxYTk1ZDcwNGU2YTRlOTA0Y2Mw
MDUyNGU4Y2JkZGRhMGMyIGNhdXNlcyB0aGlzIGJ1Zy4KPj4KPj4gZ2l0IGRlc2NyaWJlIC0tY29u
dGFpbnMgZWQyZTYyMWE5NWQ3MDRlNmE0ZTkwNGNjMDA1MjRlOGNiZGRkYTBjMgo+PiB2My4xNy1y
YzR+MjdeMn4xNwo+Pgo+PiBAQCAtMTEyNiw2ICsxMTMwLDEzIEBAIHN0YXRpYyBpbnQgZjJmc19m
aWxsX3N1cGVyKHN0cnVjdCBzdXBlcl9ibG9jayAqc2IsIHZvaWQgKmRhdGEsIGludCBzaWxlbnQp
Cj4+IMKgwqDCoMKgwqDCoMKgwqAgYnJlbHNlKHJhd19zdXBlcl9idWYpOwo+PiDCoCBmcmVlX3Ni
aToKPj4gwqDCoMKgwqDCoMKgwqDCoCBrZnJlZShzYmkpO8KgwqDCoCAtLS3CoCBmcmVlIHNiaQo+
PiArCj4+ICvCoMKgwqDCoMKgwqAgLyogZ2l2ZSBvbmx5IG9uZSBhbm90aGVyIGNoYW5jZSAqLwo+
PiArwqDCoMKgwqDCoMKgIGlmIChyZXRyeSkgewo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCByZXRyeSA9ICFyZXRyeTsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2hy
aW5rX2RjYWNoZV9zYihzYik7IC0tLSBjYWxsIGYyZnNfZXZpY3RfaW5vZGUocm9vdCBpbm9kZSks
IGl0IHdpbGwgYWNjZXNzIHNiaQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3Rv
IHRyeV9vbmVtb3JlOwo+PiArwqDCoMKgwqDCoMKgIH0KPj4gwqDCoMKgwqDCoMKgwqDCoCByZXR1
cm4gZXJyOwo+PiDCoCB9Cj4+Cj4+Pj4gSGFyZHdhcmUgbmFtZTogUUVNVSBTdGFuZGFyZCBQQyAo
aTQ0MEZYICsgUElJWCwgMTk5NiksIEJJT1MKPj4+PiA/LTIwMTkwNzI3XzA3MzgzNi1idWlsZHZt
LXBwYzY0bGUtMTYucHBjLmZlZG9yYXByb2plY3Qub3JnLTMuZmMzMQo+Pj4+IDA0LzAxLzIwMTQK
Pj4+PiBDYWxsIFRyYWNlOgo+Pj4+IMKgwqAgZHVtcF9zdGFjaysweGU1LzB4MTRiCj4+Pj4gwqDC
oCA/IGYyZnNfZXZpY3RfaW5vZGUrMHgzMWMvMHhkZTUKPj4+PiDCoMKgIHByaW50X2FkZHJlc3Nf
ZGVzY3JpcHRpb24rMHg2Yy8weDIzNwo+Pj4+IMKgwqAgPyBmMmZzX2V2aWN0X2lub2RlKzB4MzFj
LzB4ZGU1Cj4+Pj4gwqDCoCBrYXNhbl9yZXBvcnQuY29sZCsweDg4LzB4MmEzCj4+Pj4gwqDCoCBm
MmZzX2V2aWN0X2lub2RlKzB4MzFjLzB4ZGU1Cj4+Pj4gwqDCoCA/IGZ1bGxfcHJveHlfb3Blbi5j
b2xkKzB4MTIvMHgxMgo+Pj4+IMKgwqAgZXZpY3QrMHgyY2QvMHg1ZjAKPj4+PiDCoMKgIGlwdXQr
MHgzZDkvMHg2ZjAKPj4+PiDCoMKgIGRlbnRyeV91bmxpbmtfaW5vZGUrMHgyNzMvMHgzMzAKPj4+
PiDCoMKgIF9fZGVudHJ5X2tpbGwrMHgzNDAvMHg1ZTAKPj4+PiDCoMKgIGRlbnRyeV9raWxsKzB4
YjcvMHg3NDAKPj4+PiDCoMKgIHNocmlua19kZW50cnlfbGlzdCsweDI1Ni8weDY2MAo+Pj4+IMKg
wqAgc2hyaW5rX2RjYWNoZV9zYisweDExZi8weDFkMAo+Pj4+IMKgwqAgPyBzaHJpbmtfZGVudHJ5
X2xpc3QrMHg2NjAvMHg2NjAKPj4+PiDCoMKgID8gX19rYXNhbl9zbGFiX2ZyZWUrMHgxNDQvMHgx
ODAKPj4+PiDCoMKgIGYyZnNfZmlsbF9zdXBlcisweDJhMzQvMHg0YTgwCj4+Pj4gwqDCoCA/IGYy
ZnNfc2FuaXR5X2NoZWNrX2NrcHQuY29sZCsweDJiNi8weDJiNgo+Pj4+IMKgwqAgPyB3YWl0X2Zv
cl9jb21wbGV0aW9uKzB4M2MwLzB4M2MwCj4+Pj4gwqDCoCA/IHNldF9ibG9ja3NpemUrMHgyMzAv
MHgyYjAKPj4+PiDCoMKgIG1vdW50X2JkZXYrMHgyYzEvMHgzNzAKPj4+PiDCoMKgID8gZjJmc19z
YW5pdHlfY2hlY2tfY2twdC5jb2xkKzB4MmI2LzB4MmI2Cj4+Pj4gwqDCoCBtb3VudF9mcysweDRj
LzB4MWMwCj4+Pj4gwqDCoCB2ZnNfa2Vybl9tb3VudC5wYXJ0LjArMHg2MC8weDNkMAo+Pj4+IMKg
wqAgZG9fbW91bnQrMHgzNjcvMHgyNTcwCj4+Pj4gwqDCoCA/IGthc2FuX3VucG9pc29uX3NoYWRv
dysweDMzLzB4NDAKPj4+PiDCoMKgID8gY29weV9tb3VudF9zdHJpbmcrMHg0MC8weDQwCj4+Pj4g
wqDCoCA/IGttZW1fY2FjaGVfYWxsb2NfdHJhY2UrMHgxM2YvMHgyYjAKPj4+PiDCoMKgID8gX2Nv
cHlfZnJvbV91c2VyKzB4OTQvMHgxMDAKPj4+PiDCoMKgID8gY29weV9tb3VudF9vcHRpb25zKzB4
MWYxLzB4MmUwCj4+Pj4gwqDCoCBrc3lzX21vdW50KzB4YTAvMHgxMDAKPj4+PiDCoMKgIF9feDY0
X3N5c19tb3VudCsweGJmLzB4MTYwCj4+Pj4gwqDCoCBkb19zeXNjYWxsXzY0KzB4YzIvMHgxOTAK
Pj4+PiDCoMKgIGVudHJ5X1NZU0NBTExfNjRfYWZ0ZXJfaHdmcmFtZSsweDQ5LzB4YmUKPj4+PiBS
SVA6IDAwMzM6MHg0NzkzOGUKPj4+PiBDb2RlOiA0OCBjNyBjMSBiNCBmZiBmZiBmZiBmNyBkOCA2
NCA4OSAwMSA0OCA4MyBjOCBmZiBjMyA2NiAyZSAwZiAxZiA4NAo+Pj4+IDAwIDAwIDAwIDAwIDAw
IDkwIGYzIDBmIDFlIGZhIDQ5IDg5IGNhIGI4IGE1IDAwIDAwIDAwIDBmIDA1IDw0OD4gM2QgMDEK
Pj4+PiBmMCBmZiBmZiA3MyAwMSBjMyA0OCBjNyBjMSBiNCBmZiBmZiBmZiBmNyBkOCA2NCA4OSAw
MSA0OAo+Pj4+IFJTUDogMDAyYjowMDAwN2ZlZDY3M2I2YTQ4IEVGTEFHUzogMDAwMDAyNDYgT1JJ
R19SQVg6IDAwMDAwMDAwMDAwMDAwYTUKPj4+PiBSQVg6IGZmZmZmZmZmZmZmZmZmZGEgUkJYOiAw
MDAwMDAwMDIwMDAwMjAwIFJDWDogMDAwMDAwMDAwMDQ3OTM4ZQo+Pj4+IFJEWDogMDAwMDAwMDAy
MDAwMDAwMCBSU0k6IDAwMDAwMDAwMjAwMDAxMDAgUkRJOiAwMDAwN2ZlZDY3M2I2YWEwCj4+Pj4g
UkJQOiAwMDAwN2ZlZDY3M2I2YWUwIFIwODogMDAwMDdmZWQ2NzNiNmFlMCBSMDk6IDAwMDAwMDAw
MjAwMDAwMDAKPj4+PiBSMTA6IDAwMDAwMDAwMDAwMDAwMDAgUjExOiAwMDAwMDAwMDAwMDAwMjQ2
IFIxMjogMDAwMDAwMDAyMDAwMDAwMAo+Pj4+IFIxMzogMDAwMDAwMDAyMDAwMDEwMCBSMTQ6IDAw
MDA3ZmVkNjczYjZhYTAgUjE1OiAwMDAwMDAwMDIwMDAwYjAwCj4+Pj4KPj4+PiBBbGxvY2F0ZWQg
YnkgdGFzayA4NzI5Ogo+Pj4+IMKgwqAga2FzYW5fa21hbGxvYysweGMyLzB4ZTAKPj4+PiDCoMKg
IGttZW1fY2FjaGVfYWxsb2NfdHJhY2UrMHgxM2YvMHgyYjAKPj4+PiDCoMKgIGYyZnNfZmlsbF9z
dXBlcisweDEyNC8weDRhODAKPj4+PiDCoMKgIG1vdW50X2JkZXYrMHgyYzEvMHgzNzAKPj4+PiDC
oMKgIG1vdW50X2ZzKzB4NGMvMHgxYzAKPj4+PiDCoMKgIHZmc19rZXJuX21vdW50LnBhcnQuMCsw
eDYwLzB4M2QwCj4+Pj4gwqDCoCBkb19tb3VudCsweDM2Ny8weDI1NzAKPj4+PiDCoMKgIGtzeXNf
bW91bnQrMHhhMC8weDEwMAo+Pj4+IMKgwqAgX194NjRfc3lzX21vdW50KzB4YmYvMHgxNjAKPj4+
PiDCoMKgIGRvX3N5c2NhbGxfNjQrMHhjMi8weDE5MAo+Pj4+IMKgwqAgZW50cnlfU1lTQ0FMTF82
NF9hZnRlcl9od2ZyYW1lKzB4NDkvMHhiZQo+Pj4+Cj4+Pj4gRnJlZWQgYnkgdGFzayA4NzI5Ogo+
Pj4+IMKgwqAgX19rYXNhbl9zbGFiX2ZyZWUrMHgxMmYvMHgxODAKPj4+PiDCoMKgIGtmcmVlKzB4
ZmEvMHgyYTAKPj4+PiDCoMKgIGYyZnNfZmlsbF9zdXBlcisweDJhMDAvMHg0YTgwCj4+Pj4gwqDC
oCBtb3VudF9iZGV2KzB4MmMxLzB4MzcwCj4+Pj4gwqDCoCBtb3VudF9mcysweDRjLzB4MWMwCj4+
Pj4gwqDCoCB2ZnNfa2Vybl9tb3VudC5wYXJ0LjArMHg2MC8weDNkMAo+Pj4+IMKgwqAgZG9fbW91
bnQrMHgzNjcvMHgyNTcwCj4+Pj4gwqDCoCBrc3lzX21vdW50KzB4YTAvMHgxMDAKPj4+PiDCoMKg
IF9feDY0X3N5c19tb3VudCsweGJmLzB4MTYwCj4+Pj4gwqDCoCBkb19zeXNjYWxsXzY0KzB4YzIv
MHgxOTAKPj4+PiDCoMKgIGVudHJ5X1NZU0NBTExfNjRfYWZ0ZXJfaHdmcmFtZSsweDQ5LzB4YmUK
Pj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IEphY2sgUWl1IDxqYWNrLnFpdUBodWF3ZWkuY29tPgo+
Pj4+IC0tLQo+Pj4+IMKgwqAgZnMvZjJmcy9zdXBlci5jIHwgMyArKy0KPj4+PiDCoMKgIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4+Pgo+Pj4+IGRpZmYg
LS1naXQgYS9mcy9mMmZzL3N1cGVyLmMgYi9mcy9mMmZzL3N1cGVyLmMKPj4+PiBpbmRleCA4ZmVj
ZDMwNTBjY2QuLmIwNDE2MjVlMDZjZSAxMDA2NDQKPj4+PiAtLS0gYS9mcy9mMmZzL3N1cGVyLmMK
Pj4+PiArKysgYi9mcy9mMmZzL3N1cGVyLmMKPj4+PiBAQCAtNDIyOSw2ICs0MjI5LDggQEAgc3Rh
dGljIGludCBmMmZzX2ZpbGxfc3VwZXIoc3RydWN0IHN1cGVyX2Jsb2NrICpzYiwgdm9pZCAqZGF0
YSwgaW50IHNpbGVudCkKPj4+PiDCoMKgIGZyZWVfY29tcHJlc3NfaW5vZGU6Cj4+Pj4gwqDCoMKg
wqDCoMKgIGYyZnNfZGVzdHJveV9jb21wcmVzc19pbm9kZShzYmkpOwo+Pj4+IMKgwqAgZnJlZV9y
b290X2lub2RlOgo+Pj4+ICvCoMKgwqAgaWYgKHJldHJ5X2NudCA+IDAgJiYgc2tpcF9yZWNvdmVy
eSkKPj4+PiArwqDCoMKgwqDCoMKgwqAgc2hyaW5rX2RjYWNoZV9zYihzYik7Cj4+Pgo+Pj4gQ29t
cGFyZSB0byA0LjE5LCBsYXN0IGYyZnMgYWRkcyBldmljdF9pbm9kZXMoKSBiZWZvcmUgZjJmc191
bnJlZ2lzdGVyX3N5c2ZzKCksCj4+IENhbiBub3QgZmluZCAqZXZpY3RfaW5vZGVzKiwgY291bGQg
eW91IHBsZWFzZSBlbGFib3JhdGUgbW9yZSBkZXRhaWw/Cj4gCj4gQ291bGQgeW91IHBsZWFzZSBj
aGVjayB3aGV0aGVyIGJlbG93IHBhdGNoIGNhbiBmaXggdGhpcyBpc3N1ZT8KPiAKPiBodHRwczov
L2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5n
aXQvY29tbWl0Lz9pZD04MTJhOTU5NzdmZDJmMGQxZjIyMGM3MTZhOTgKPiAKPiBUaGFua3MsCj4g
Ckkgd2lsbCB0ZXN0IGl0LgoKVGhhbnNrLAo+Pj4gY291bGQgeW91IHBsZWFzZSBjaGVjayB3aGV0
aGVyIHRoaXMgY2FuIGZpeCB0aGUgaXNzdWU/Cj4+IEkgaGF2ZSBydW4gdGhlIHRlc3QgbW9yZSB0
aGFuIDEgZGF5IHcvIHRoaXMgcGF0Y2gsIGl0IHdpbGwgZmFpbCBpbiAxIGhvdXIgYmVmb3JlLgo+
PiBJIGJlbGlldmUgdGhpcyBwYXRjaCBjYW4gZml4ICp0aGlzKiBpc3N1ZS4gQnV0IEknbSBub3Qg
cXVpdGUgZmFtaWxpYXIgd2l0aCBzaHJpbmtfZGNhY2hlX3NiLAo+PiBtYXliZSBJIG1pc3Mgb3Ro
ZXIgc2NlbmFyaW8uIElmIHlvdSBoYXZlIG90aGVyIGNvbW1lbnQsIHBsZWFzZSBsZXQgbWUga25v
dy4KPj4KPj4gVGhhbmtzLAo+Pj4KPj4+IFRoYW5rcywKPj4+Cj4+Pj4gwqDCoMKgwqDCoMKgIGRw
dXQoc2ItPnNfcm9vdCk7Cj4+Pj4gwqDCoMKgwqDCoMKgIHNiLT5zX3Jvb3QgPSBOVUxMOwo+Pj4+
IMKgwqAgZnJlZV9ub2RlX2lub2RlOgo+Pj4+IEBAIC00Mjg1LDcgKzQyODcsNiBAQCBzdGF0aWMg
aW50IGYyZnNfZmlsbF9zdXBlcihzdHJ1Y3Qgc3VwZXJfYmxvY2sgKnNiLCB2b2lkICpkYXRhLCBp
bnQgc2lsZW50KQo+Pj4+IMKgwqDCoMKgwqDCoCAvKiBnaXZlIG9ubHkgb25lIGFub3RoZXIgY2hh
bmNlICovCj4+Pj4gwqDCoMKgwqDCoMKgIGlmIChyZXRyeV9jbnQgPiAwICYmIHNraXBfcmVjb3Zl
cnkpIHsKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXRyeV9jbnQtLTsKPj4+PiAtwqDCoMKg
wqDCoMKgwqAgc2hyaW5rX2RjYWNoZV9zYihzYik7Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAg
Z290byB0cnlfb25lbW9yZTsKPj4+PiDCoMKgwqDCoMKgwqAgfQo+Pj4+IMKgwqDCoMKgwqDCoCBy
ZXR1cm4gZXJyOwo+Pj4+IC0twqAKPj4+PiAyLjE3LjEKPj4+Pgo+Pj4gLgo+Pgo+IC4KCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1k
ZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQK
aHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1k
ZXZlbAo=
