Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9263D324D
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Jul 2021 05:46:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m6m8W-0005yG-9s; Fri, 23 Jul 2021 03:46:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <jack.qiu@huawei.com>) id 1m6m8K-0005xj-Vc
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 23 Jul 2021 03:45:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dTG39xN6LElRd8wUymBUi+y6cQw/bSZfSWGlXDsQzuM=; b=f1AeNtQbBZbETUfcvA6lSCGacM
 SpSUtxS1h9ulhGJGp2kOJ8I5I11l/d4LcPxVms7DLQ8Z+3ZeUKST2mGYabvu1wqhiTyCEegw9Mn56
 DEyP2TaL/g/1lesdHy9dbtV9mXrBjUyWGMudeH2INTsJRdX96ezYYPRLFadUePBa3gLU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dTG39xN6LElRd8wUymBUi+y6cQw/bSZfSWGlXDsQzuM=; b=f3kz0CYGPk1rsAElrdKDZ0u9wR
 GI11nbCRQED1NVhluFnE7m98egSV+ehzFOAlc43cBUofTvTjVP1IiVzzp3+tXUrpWSQJKGtd0guPs
 35VTRnxc4qOgOZe9vQvyWp42CNETgwiA4nOKuMbGkYSC5rkQCf1+aj++rKN4awoaOW20=;
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m6m8H-00HTDM-5j
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 23 Jul 2021 03:45:56 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4GWFTr5mcrz7tYP;
 Fri, 23 Jul 2021 11:41:04 +0800 (CST)
Received: from dggpemm500008.china.huawei.com (7.185.36.136) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 23 Jul 2021 11:45:42 +0800
Received: from [10.174.176.201] (10.174.176.201) by
 dggpemm500008.china.huawei.com (7.185.36.136) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 23 Jul 2021 11:45:42 +0800
To: Chao Yu <chao@kernel.org>, <jaegeuk@kernel.org>
References: <20210722044130.44591-1-jack.qiu@huawei.com>
 <630147dc-4f73-f985-347a-c4933c312edd@kernel.org>
 <e5616c5c-3b3d-2036-3395-8d0d0ce2cf80@huawei.com>
 <fd3b4af6-34a8-2fcf-e82f-888831f5d097@kernel.org>
 <1f950160-1d6a-13ea-2ba1-39b906f5cc0d@huawei.com>
 <0a92b28a-d55e-e955-266f-794dd9fb744b@kernel.org>
From: Jack Qiu <jack.qiu@huawei.com>
Message-ID: <dfaed1b8-8219-4fd0-b382-0d03ea0d2286@huawei.com>
Date: Fri, 23 Jul 2021 11:45:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <0a92b28a-d55e-e955-266f-794dd9fb744b@kernel.org>
X-Originating-IP: [10.174.176.201]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500008.china.huawei.com (7.185.36.136)
X-CFilter-Loop: Reflected
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.189 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.2 NICE_REPLY_A           Looks like a legit reply (A)
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1m6m8H-00HTDM-5j
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

T24gMjAyMS83LzIzIDExOjI5LCBDaGFvIFl1IHdyb3RlOgo+IE9uIDIwMjEvNy8yMyAxMToyNywg
SmFjayBRaXUgd3JvdGU6Cj4+IE9uIDIwMjEvNy8yMyAxMDo1MSwgQ2hhbyBZdSB3cm90ZToKPj4+
IE9uIDIwMjEvNy8yMyAxMDo0MSwgSmFjayBRaXUgd3JvdGU6Cj4+Pj4gT24gMjAyMS83LzIyIDIy
OjA1LCBDaGFvIFl1IHdyb3RlOgo+Pj4+PiBPbiAyMDIxLzcvMjIgMTI6NDEsIEphY2sgUWl1IHdy
b3RlOgo+Pj4+Pj4gVGhlIHJvb3QgY2F1c2UgaXMgc2hyaW5rX2RjYWNoZV9zYiBhZnRlciBzYmkg
aGFzIGJlZW4gZnJlZWQuCj4+Pj4+PiBTbyBjYWxsIHNocmlua19kY2FjaGVfc2IgYmVmb3JlIGZy
ZWUgc2JpIGFuZCBvdGhlciByZXNvdXJjZXMuCj4+Pj4+Pgo+Pj4+Pj4gPT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Cj4+Pj4+
PiBCVUc6IEtBU0FOOiB1c2UtYWZ0ZXItZnJlZSBpbiBmMmZzX2V2aWN0X2lub2RlKzB4MzFjLzB4
ZGU1Cj4+Pj4+PiBSZWFkIG9mIHNpemUgNCBhdCBhZGRyIGZmZmY4ODgxZDk3ZjBkNTAgYnkgdGFz
ayBzeXotZXhlY3V0b3IuMy84NzI5Cj4+Pj4+Pgo+Pj4+Pj4gUFU6IDEgUElEOiA4NzI5IENvbW06
IHN5ei1leGVjdXRvci4zIE5vdCB0YWludGVkCj4+Pj4+PiA0LjE5LjE5NS0wMDAwMi1nNjdkY2Vl
YTA0NDMxLWRpcnR5ICMzMQo+Pj4+Pgo+Pj4+PiBEb2VzIHRoaXMgYnVnIGJlbG93IHRvIDQuMTku
MTk1Pwo+Pj4KPj4+IEkgbWVhbiB3aGV0aGVyIHRoaXMgYnVnIGV4aXN0cyBpbiBtYWlubGluZT8g
Tm90IHN1cmUsIEkganVzdCBkb3VidCBtYXliZQo+Pj4gd2UgaGF2ZSBmaXhlZCB0aGlzIGlzc3Vl
LCBidXQgZm9yZ290IHRvIGJhY2twb3J0IGl0IHRvIDQuMTkgc3RhYmxlIGtlcm5lbC4KPj4+Cj4+
IEdvdCBpdC4KPj4+Pj4KPj4+PiBZZXMsIEkgYmVsaWV2ZSBlZDJlNjIxYTk1ZDcwNGU2YTRlOTA0
Y2MwMDUyNGU4Y2JkZGRhMGMyIGNhdXNlcyB0aGlzIGJ1Zy4KPj4+Pgo+Pj4+IGdpdCBkZXNjcmli
ZSAtLWNvbnRhaW5zIGVkMmU2MjFhOTVkNzA0ZTZhNGU5MDRjYzAwNTI0ZThjYmRkZGEwYzIKPj4+
PiB2My4xNy1yYzR+MjdeMn4xNwo+Pj4+Cj4+Pj4gQEAgLTExMjYsNiArMTEzMCwxMyBAQCBzdGF0
aWMgaW50IGYyZnNfZmlsbF9zdXBlcihzdHJ1Y3Qgc3VwZXJfYmxvY2sgKnNiLCB2b2lkICpkYXRh
LCBpbnQgc2lsZW50KQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBicmVsc2UocmF3X3N1cGVyX2J1
Zik7Cj4+Pj4gwqDCoCBmcmVlX3NiaToKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAga2ZyZWUoc2Jp
KTvCoMKgwqAgLS0twqAgZnJlZSBzYmkKPj4+PiArCj4+Pj4gK8KgwqDCoMKgwqDCoCAvKiBnaXZl
IG9ubHkgb25lIGFub3RoZXIgY2hhbmNlICovCj4+Pj4gK8KgwqDCoMKgwqDCoCBpZiAocmV0cnkp
IHsKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXRyeSA9ICFyZXRyeTsKPj4+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzaHJpbmtfZGNhY2hlX3NiKHNiKTsgLS0t
IGNhbGwgZjJmc19ldmljdF9pbm9kZShyb290IGlub2RlKSwgaXQgd2lsbCBhY2Nlc3Mgc2JpCj4+
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byB0cnlfb25lbW9yZTsKPj4+PiAr
wqDCoMKgwqDCoMKgIH0KPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGVycjsKPj4+PiDC
oMKgIH0KPj4+Pgo+Pj4+Pj4gSGFyZHdhcmUgbmFtZTogUUVNVSBTdGFuZGFyZCBQQyAoaTQ0MEZY
ICsgUElJWCwgMTk5NiksIEJJT1MKPj4+Pj4+ID8tMjAxOTA3MjdfMDczODM2LWJ1aWxkdm0tcHBj
NjRsZS0xNi5wcGMuZmVkb3JhcHJvamVjdC5vcmctMy5mYzMxCj4+Pj4+PiAwNC8wMS8yMDE0Cj4+
Pj4+PiBDYWxsIFRyYWNlOgo+Pj4+Pj4gwqDCoMKgIGR1bXBfc3RhY2srMHhlNS8weDE0Ygo+Pj4+
Pj4gwqDCoMKgID8gZjJmc19ldmljdF9pbm9kZSsweDMxYy8weGRlNQo+Pj4+Pj4gwqDCoMKgIHBy
aW50X2FkZHJlc3NfZGVzY3JpcHRpb24rMHg2Yy8weDIzNwo+Pj4+Pj4gwqDCoMKgID8gZjJmc19l
dmljdF9pbm9kZSsweDMxYy8weGRlNQo+Pj4+Pj4gwqDCoMKgIGthc2FuX3JlcG9ydC5jb2xkKzB4
ODgvMHgyYTMKPj4+Pj4+IMKgwqDCoCBmMmZzX2V2aWN0X2lub2RlKzB4MzFjLzB4ZGU1Cj4+Pj4+
PiDCoMKgwqAgPyBmdWxsX3Byb3h5X29wZW4uY29sZCsweDEyLzB4MTIKPj4+Pj4+IMKgwqDCoCBl
dmljdCsweDJjZC8weDVmMAo+Pj4+Pj4gwqDCoMKgIGlwdXQrMHgzZDkvMHg2ZjAKPj4+Pj4+IMKg
wqDCoCBkZW50cnlfdW5saW5rX2lub2RlKzB4MjczLzB4MzMwCj4+Pj4+PiDCoMKgwqAgX19kZW50
cnlfa2lsbCsweDM0MC8weDVlMAo+Pj4+Pj4gwqDCoMKgIGRlbnRyeV9raWxsKzB4YjcvMHg3NDAK
Pj4+Pj4+IMKgwqDCoCBzaHJpbmtfZGVudHJ5X2xpc3QrMHgyNTYvMHg2NjAKPj4+Pj4+IMKgwqDC
oCBzaHJpbmtfZGNhY2hlX3NiKzB4MTFmLzB4MWQwCj4+Pj4+PiDCoMKgwqAgPyBzaHJpbmtfZGVu
dHJ5X2xpc3QrMHg2NjAvMHg2NjAKPj4+Pj4+IMKgwqDCoCA/IF9fa2FzYW5fc2xhYl9mcmVlKzB4
MTQ0LzB4MTgwCj4+Pj4+PiDCoMKgwqAgZjJmc19maWxsX3N1cGVyKzB4MmEzNC8weDRhODAKPj4+
Pj4+IMKgwqDCoCA/IGYyZnNfc2FuaXR5X2NoZWNrX2NrcHQuY29sZCsweDJiNi8weDJiNgo+Pj4+
Pj4gwqDCoMKgID8gd2FpdF9mb3JfY29tcGxldGlvbisweDNjMC8weDNjMAo+Pj4+Pj4gwqDCoMKg
ID8gc2V0X2Jsb2Nrc2l6ZSsweDIzMC8weDJiMAo+Pj4+Pj4gwqDCoMKgIG1vdW50X2JkZXYrMHgy
YzEvMHgzNzAKPj4+Pj4+IMKgwqDCoCA/IGYyZnNfc2FuaXR5X2NoZWNrX2NrcHQuY29sZCsweDJi
Ni8weDJiNgo+Pj4+Pj4gwqDCoMKgIG1vdW50X2ZzKzB4NGMvMHgxYzAKPj4+Pj4+IMKgwqDCoCB2
ZnNfa2Vybl9tb3VudC5wYXJ0LjArMHg2MC8weDNkMAo+Pj4+Pj4gwqDCoMKgIGRvX21vdW50KzB4
MzY3LzB4MjU3MAo+Pj4+Pj4gwqDCoMKgID8ga2FzYW5fdW5wb2lzb25fc2hhZG93KzB4MzMvMHg0
MAo+Pj4+Pj4gwqDCoMKgID8gY29weV9tb3VudF9zdHJpbmcrMHg0MC8weDQwCj4+Pj4+PiDCoMKg
wqAgPyBrbWVtX2NhY2hlX2FsbG9jX3RyYWNlKzB4MTNmLzB4MmIwCj4+Pj4+PiDCoMKgwqAgPyBf
Y29weV9mcm9tX3VzZXIrMHg5NC8weDEwMAo+Pj4+Pj4gwqDCoMKgID8gY29weV9tb3VudF9vcHRp
b25zKzB4MWYxLzB4MmUwCj4+Pj4+PiDCoMKgwqAga3N5c19tb3VudCsweGEwLzB4MTAwCj4+Pj4+
PiDCoMKgwqAgX194NjRfc3lzX21vdW50KzB4YmYvMHgxNjAKPj4+Pj4+IMKgwqDCoCBkb19zeXNj
YWxsXzY0KzB4YzIvMHgxOTAKPj4+Pj4+IMKgwqDCoCBlbnRyeV9TWVNDQUxMXzY0X2FmdGVyX2h3
ZnJhbWUrMHg0OS8weGJlCj4+Pj4+PiBSSVA6IDAwMzM6MHg0NzkzOGUKPj4+Pj4+IENvZGU6IDQ4
IGM3IGMxIGI0IGZmIGZmIGZmIGY3IGQ4IDY0IDg5IDAxIDQ4IDgzIGM4IGZmIGMzIDY2IDJlIDBm
IDFmIDg0Cj4+Pj4+PiAwMCAwMCAwMCAwMCAwMCA5MCBmMyAwZiAxZSBmYSA0OSA4OSBjYSBiOCBh
NSAwMCAwMCAwMCAwZiAwNSA8NDg+IDNkIDAxCj4+Pj4+PiBmMCBmZiBmZiA3MyAwMSBjMyA0OCBj
NyBjMSBiNCBmZiBmZiBmZiBmNyBkOCA2NCA4OSAwMSA0OAo+Pj4+Pj4gUlNQOiAwMDJiOjAwMDA3
ZmVkNjczYjZhNDggRUZMQUdTOiAwMDAwMDI0NiBPUklHX1JBWDogMDAwMDAwMDAwMDAwMDBhNQo+
Pj4+Pj4gUkFYOiBmZmZmZmZmZmZmZmZmZmRhIFJCWDogMDAwMDAwMDAyMDAwMDIwMCBSQ1g6IDAw
MDAwMDAwMDA0NzkzOGUKPj4+Pj4+IFJEWDogMDAwMDAwMDAyMDAwMDAwMCBSU0k6IDAwMDAwMDAw
MjAwMDAxMDAgUkRJOiAwMDAwN2ZlZDY3M2I2YWEwCj4+Pj4+PiBSQlA6IDAwMDA3ZmVkNjczYjZh
ZTAgUjA4OiAwMDAwN2ZlZDY3M2I2YWUwIFIwOTogMDAwMDAwMDAyMDAwMDAwMAo+Pj4+Pj4gUjEw
OiAwMDAwMDAwMDAwMDAwMDAwIFIxMTogMDAwMDAwMDAwMDAwMDI0NiBSMTI6IDAwMDAwMDAwMjAw
MDAwMDAKPj4+Pj4+IFIxMzogMDAwMDAwMDAyMDAwMDEwMCBSMTQ6IDAwMDA3ZmVkNjczYjZhYTAg
UjE1OiAwMDAwMDAwMDIwMDAwYjAwCj4+Pj4+Pgo+Pj4+Pj4gQWxsb2NhdGVkIGJ5IHRhc2sgODcy
OToKPj4+Pj4+IMKgwqDCoCBrYXNhbl9rbWFsbG9jKzB4YzIvMHhlMAo+Pj4+Pj4gwqDCoMKgIGtt
ZW1fY2FjaGVfYWxsb2NfdHJhY2UrMHgxM2YvMHgyYjAKPj4+Pj4+IMKgwqDCoCBmMmZzX2ZpbGxf
c3VwZXIrMHgxMjQvMHg0YTgwCj4+Pj4+PiDCoMKgwqAgbW91bnRfYmRldisweDJjMS8weDM3MAo+
Pj4+Pj4gwqDCoMKgIG1vdW50X2ZzKzB4NGMvMHgxYzAKPj4+Pj4+IMKgwqDCoCB2ZnNfa2Vybl9t
b3VudC5wYXJ0LjArMHg2MC8weDNkMAo+Pj4+Pj4gwqDCoMKgIGRvX21vdW50KzB4MzY3LzB4MjU3
MAo+Pj4+Pj4gwqDCoMKgIGtzeXNfbW91bnQrMHhhMC8weDEwMAo+Pj4+Pj4gwqDCoMKgIF9feDY0
X3N5c19tb3VudCsweGJmLzB4MTYwCj4+Pj4+PiDCoMKgwqAgZG9fc3lzY2FsbF82NCsweGMyLzB4
MTkwCj4+Pj4+PiDCoMKgwqAgZW50cnlfU1lTQ0FMTF82NF9hZnRlcl9od2ZyYW1lKzB4NDkvMHhi
ZQo+Pj4+Pj4KPj4+Pj4+IEZyZWVkIGJ5IHRhc2sgODcyOToKPj4+Pj4+IMKgwqDCoCBfX2thc2Fu
X3NsYWJfZnJlZSsweDEyZi8weDE4MAo+Pj4+Pj4gwqDCoMKgIGtmcmVlKzB4ZmEvMHgyYTAKPj4+
Pj4+IMKgwqDCoCBmMmZzX2ZpbGxfc3VwZXIrMHgyYTAwLzB4NGE4MAo+Pj4+Pj4gwqDCoMKgIG1v
dW50X2JkZXYrMHgyYzEvMHgzNzAKPj4+Pj4+IMKgwqDCoCBtb3VudF9mcysweDRjLzB4MWMwCj4+
Pj4+PiDCoMKgwqAgdmZzX2tlcm5fbW91bnQucGFydC4wKzB4NjAvMHgzZDAKPj4+Pj4+IMKgwqDC
oCBkb19tb3VudCsweDM2Ny8weDI1NzAKPj4+Pj4+IMKgwqDCoCBrc3lzX21vdW50KzB4YTAvMHgx
MDAKPj4+Pj4+IMKgwqDCoCBfX3g2NF9zeXNfbW91bnQrMHhiZi8weDE2MAo+Pj4+Pj4gwqDCoMKg
IGRvX3N5c2NhbGxfNjQrMHhjMi8weDE5MAo+Pj4+Pj4gwqDCoMKgIGVudHJ5X1NZU0NBTExfNjRf
YWZ0ZXJfaHdmcmFtZSsweDQ5LzB4YmUKPj4+Pj4+Cj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBKYWNr
IFFpdSA8amFjay5xaXVAaHVhd2VpLmNvbT4KPj4+Pj4+IC0tLQo+Pj4+Pj4gwqDCoMKgIGZzL2Yy
ZnMvc3VwZXIuYyB8IDMgKystCj4+Pj4+PiDCoMKgwqAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pj4+Pj4KPj4+Pj4+IGRpZmYgLS1naXQgYS9mcy9mMmZz
L3N1cGVyLmMgYi9mcy9mMmZzL3N1cGVyLmMKPj4+Pj4+IGluZGV4IDhmZWNkMzA1MGNjZC4uYjA0
MTYyNWUwNmNlIDEwMDY0NAo+Pj4+Pj4gLS0tIGEvZnMvZjJmcy9zdXBlci5jCj4+Pj4+PiArKysg
Yi9mcy9mMmZzL3N1cGVyLmMKPj4+Pj4+IEBAIC00MjI5LDYgKzQyMjksOCBAQCBzdGF0aWMgaW50
IGYyZnNfZmlsbF9zdXBlcihzdHJ1Y3Qgc3VwZXJfYmxvY2sgKnNiLCB2b2lkICpkYXRhLCBpbnQg
c2lsZW50KQo+Pj4+Pj4gwqDCoMKgIGZyZWVfY29tcHJlc3NfaW5vZGU6Cj4+Pj4+PiDCoMKgwqDC
oMKgwqDCoCBmMmZzX2Rlc3Ryb3lfY29tcHJlc3NfaW5vZGUoc2JpKTsKPj4+Pj4+IMKgwqDCoCBm
cmVlX3Jvb3RfaW5vZGU6Cj4+Pj4+PiArwqDCoMKgIGlmIChyZXRyeV9jbnQgPiAwICYmIHNraXBf
cmVjb3ZlcnkpCj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgc2hyaW5rX2RjYWNoZV9zYihzYik7Cj4+
Pj4+Cj4+Pj4+IENvbXBhcmUgdG8gNC4xOSwgbGFzdCBmMmZzIGFkZHMgZXZpY3RfaW5vZGVzKCkg
YmVmb3JlIGYyZnNfdW5yZWdpc3Rlcl9zeXNmcygpLAo+Pj4+IENhbiBub3QgZmluZCAqZXZpY3Rf
aW5vZGVzKiwgY291bGQgeW91IHBsZWFzZSBlbGFib3JhdGUgbW9yZSBkZXRhaWw/Cj4+Pgo+Pj4g
Q291bGQgeW91IHBsZWFzZSBjaGVjayB3aGV0aGVyIGJlbG93IHBhdGNoIGNhbiBmaXggdGhpcyBp
c3N1ZT8KPj4+Cj4+PiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVs
L2dpdC90b3J2YWxkcy9saW51eC5naXQvY29tbWl0Lz9pZD04MTJhOTU5NzdmZDJmMGQxZjIyMGM3
MTZhOTgKPj4+Cj4+PiBUaGFua3MsCj4+Pgo+PiBJIHdpbGwgdGVzdCBpdC4KPiAKPiBDb3VsZCB5
b3UgcGxlYXNlIHRlc3Qgb24gNS4xNC1yYzEgZmlyc3Q/Cj4gCj4gVGhhbmtzLAo+IApPay4KPj4K
Pj4gVGhhbnNrLAo+Pj4+PiBjb3VsZCB5b3UgcGxlYXNlIGNoZWNrIHdoZXRoZXIgdGhpcyBjYW4g
Zml4IHRoZSBpc3N1ZT8KPj4+PiBJIGhhdmUgcnVuIHRoZSB0ZXN0IG1vcmUgdGhhbiAxIGRheSB3
LyB0aGlzIHBhdGNoLCBpdCB3aWxsIGZhaWwgaW4gMSBob3VyIGJlZm9yZS4KPj4+PiBJIGJlbGll
dmUgdGhpcyBwYXRjaCBjYW4gZml4ICp0aGlzKiBpc3N1ZS4gQnV0IEknbSBub3QgcXVpdGUgZmFt
aWxpYXIgd2l0aCBzaHJpbmtfZGNhY2hlX3NiLAo+Pj4+IG1heWJlIEkgbWlzcyBvdGhlciBzY2Vu
YXJpby4gSWYgeW91IGhhdmUgb3RoZXIgY29tbWVudCwgcGxlYXNlIGxldCBtZSBrbm93Lgo+Pj4+
Cj4+Pj4gVGhhbmtzLAo+Pj4+Pgo+Pj4+PiBUaGFua3MsCj4+Pj4+Cj4+Pj4+PiDCoMKgwqDCoMKg
wqDCoCBkcHV0KHNiLT5zX3Jvb3QpOwo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqAgc2ItPnNfcm9vdCA9
IE5VTEw7Cj4+Pj4+PiDCoMKgwqAgZnJlZV9ub2RlX2lub2RlOgo+Pj4+Pj4gQEAgLTQyODUsNyAr
NDI4Nyw2IEBAIHN0YXRpYyBpbnQgZjJmc19maWxsX3N1cGVyKHN0cnVjdCBzdXBlcl9ibG9jayAq
c2IsIHZvaWQgKmRhdGEsIGludCBzaWxlbnQpCj4+Pj4+PiDCoMKgwqDCoMKgwqDCoCAvKiBnaXZl
IG9ubHkgb25lIGFub3RoZXIgY2hhbmNlICovCj4+Pj4+PiDCoMKgwqDCoMKgwqDCoCBpZiAocmV0
cnlfY250ID4gMCAmJiBza2lwX3JlY292ZXJ5KSB7Cj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHJldHJ5X2NudC0tOwo+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgIHNocmlua19kY2FjaGVfc2Io
c2IpOwo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIHRyeV9vbmVtb3JlOwo+Pj4+
Pj4gwqDCoMKgwqDCoMKgwqAgfQo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGVycjsKPj4+
Pj4+IC0twqAKPj4+Pj4+IDIuMTcuMQo+Pj4+Pj4KPj4+Pj4gLgo+Pj4+Cj4+PiAuCj4+Cj4gLgoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1m
MmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdl
Lm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1m
MmZzLWRldmVsCg==
