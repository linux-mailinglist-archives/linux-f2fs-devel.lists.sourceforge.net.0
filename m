Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB6F3D320C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Jul 2021 04:51:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m6lHe-00045g-5k; Fri, 23 Jul 2021 02:51:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <chao@kernel.org>) id 1m6lHc-00045Z-Uj
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 23 Jul 2021 02:51:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/xIPUS4K1+5LaDECNH1VyXZ0KdqjeDzJz6wX5Wa2skU=; b=A+ZPNuU5mMBShTVeWHaqX4ia3K
 5ULM/IIr0N3mSM+A+9z5sZLRJmUFCcX7/NLNDTe5toYfpDoULnmsy+d+LaGT0/KX5V4M4AROnYegg
 zC82Q13qQsIJg4qnmWwYK4nekgjd6v1Fpr9cNLIPZfdaMeAcNwtuUa3Jtw2G8TM+ZdrE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/xIPUS4K1+5LaDECNH1VyXZ0KdqjeDzJz6wX5Wa2skU=; b=iei8prm2A5NlftmHdtekke2AUX
 3f/kVrrRC3xI7RnuqBpgwGY2l0HntHPm71XZ0OLg+TZHC28z12kZOl68+RPpNcMXPpZA494qdQByu
 DwpVC3Qxz4+rMt1SMYXao0NO88LOjzdN8s4FGyoBUZEOKW9rQaT7yTCpqyCP4eByB8G0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m6lHP-00HQeT-Mf
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 23 Jul 2021 02:51:28 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1736160725;
 Fri, 23 Jul 2021 02:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627008663;
 bh=oaO3KKUuHPacr67yNCjcvHsFhsR2no7MDSe+mzGu1JU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=RpR4o0XXobLdAEOwRLh49Rzd40dK9LyKowuGAp/au4kLdS7BoTs4pLCbclH1lvgK8
 XCpYQCmpVCPP4rWB5X1jt70J3Ca0DaLK3qirZkvrFsNT5yzZejHcHgkUwGp9Z+Ll+R
 5SJjrDDcpD+Iq4F/yRJb1hkZYcr5UXAHXSVxHyYeEzjEFEBIPT+a5FmGicIKWGeP1j
 s8MAkeAeYrh1yAHAt3JQ3mDBBPu1peI2aQfqafJXB1DdwWOysY1MhB0ebSSGdTp/GX
 VodLaN51gZhLsyDAM3zTgxOLNi55iIGOdN6WtjgKVGg4DrNLtUWzXbLDVliL1Stag+
 VIHhT4Id1BbmQ==
To: Jack Qiu <jack.qiu@huawei.com>, jaegeuk@kernel.org
References: <20210722044130.44591-1-jack.qiu@huawei.com>
 <630147dc-4f73-f985-347a-c4933c312edd@kernel.org>
 <e5616c5c-3b3d-2036-3395-8d0d0ce2cf80@huawei.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <fd3b4af6-34a8-2fcf-e82f-888831f5d097@kernel.org>
Date: Fri, 23 Jul 2021 10:51:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <e5616c5c-3b3d-2036-3395-8d0d0ce2cf80@huawei.com>
Content-Language: en-US
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 NICE_REPLY_A           Looks like a legit reply (A)
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1m6lHP-00HQeT-Mf
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMS83LzIzIDEwOjQxLCBKYWNrIFFpdSB3cm90ZToKPiBPbiAyMDIxLzcvMjIgMjI6MDUs
IENoYW8gWXUgd3JvdGU6Cj4+IE9uIDIwMjEvNy8yMiAxMjo0MSwgSmFjayBRaXUgd3JvdGU6Cj4+
PiBUaGUgcm9vdCBjYXVzZSBpcyBzaHJpbmtfZGNhY2hlX3NiIGFmdGVyIHNiaSBoYXMgYmVlbiBm
cmVlZC4KPj4+IFNvIGNhbGwgc2hyaW5rX2RjYWNoZV9zYiBiZWZvcmUgZnJlZSBzYmkgYW5kIG90
aGVyIHJlc291cmNlcy4KPj4+Cj4+PiA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KPj4+IEJVRzogS0FTQU46IHVzZS1hZnRl
ci1mcmVlIGluIGYyZnNfZXZpY3RfaW5vZGUrMHgzMWMvMHhkZTUKPj4+IFJlYWQgb2Ygc2l6ZSA0
IGF0IGFkZHIgZmZmZjg4ODFkOTdmMGQ1MCBieSB0YXNrIHN5ei1leGVjdXRvci4zLzg3MjkKPj4+
Cj4+PiBQVTogMSBQSUQ6IDg3MjkgQ29tbTogc3l6LWV4ZWN1dG9yLjMgTm90IHRhaW50ZWQKPj4+
IDQuMTkuMTk1LTAwMDAyLWc2N2RjZWVhMDQ0MzEtZGlydHkgIzMxCj4+Cj4+IERvZXMgdGhpcyBi
dWcgYmVsb3cgdG8gNC4xOS4xOTU/CgpJIG1lYW4gd2hldGhlciB0aGlzIGJ1ZyBleGlzdHMgaW4g
bWFpbmxpbmU/IE5vdCBzdXJlLCBJIGp1c3QgZG91YnQgbWF5YmUKd2UgaGF2ZSBmaXhlZCB0aGlz
IGlzc3VlLCBidXQgZm9yZ290IHRvIGJhY2twb3J0IGl0IHRvIDQuMTkgc3RhYmxlIGtlcm5lbC4K
Cj4+Cj4gWWVzLCBJIGJlbGlldmUgZWQyZTYyMWE5NWQ3MDRlNmE0ZTkwNGNjMDA1MjRlOGNiZGRk
YTBjMiBjYXVzZXMgdGhpcyBidWcuCj4gCj4gZ2l0IGRlc2NyaWJlIC0tY29udGFpbnMgZWQyZTYy
MWE5NWQ3MDRlNmE0ZTkwNGNjMDA1MjRlOGNiZGRkYTBjMgo+IHYzLjE3LXJjNH4yN14yfjE3Cj4g
Cj4gQEAgLTExMjYsNiArMTEzMCwxMyBAQCBzdGF0aWMgaW50IGYyZnNfZmlsbF9zdXBlcihzdHJ1
Y3Qgc3VwZXJfYmxvY2sgKnNiLCB2b2lkICpkYXRhLCBpbnQgc2lsZW50KQo+ICAgICAgICAgIGJy
ZWxzZShyYXdfc3VwZXJfYnVmKTsKPiAgIGZyZWVfc2JpOgo+ICAgICAgICAgIGtmcmVlKHNiaSk7
ICAgIC0tLSAgZnJlZSBzYmkKPiArCj4gKyAgICAgICAvKiBnaXZlIG9ubHkgb25lIGFub3RoZXIg
Y2hhbmNlICovCj4gKyAgICAgICBpZiAocmV0cnkpIHsKPiArICAgICAgICAgICAgICAgcmV0cnkg
PSAhcmV0cnk7Cj4gKyAgICAgICAgICAgICAgIHNocmlua19kY2FjaGVfc2Ioc2IpOyAtLS0gY2Fs
bCBmMmZzX2V2aWN0X2lub2RlKHJvb3QgaW5vZGUpLCBpdCB3aWxsIGFjY2VzcyBzYmkKPiArICAg
ICAgICAgICAgICAgZ290byB0cnlfb25lbW9yZTsKPiArICAgICAgIH0KPiAgICAgICAgICByZXR1
cm4gZXJyOwo+ICAgfQo+IAo+Pj4gSGFyZHdhcmUgbmFtZTogUUVNVSBTdGFuZGFyZCBQQyAoaTQ0
MEZYICsgUElJWCwgMTk5NiksIEJJT1MKPj4+ID8tMjAxOTA3MjdfMDczODM2LWJ1aWxkdm0tcHBj
NjRsZS0xNi5wcGMuZmVkb3JhcHJvamVjdC5vcmctMy5mYzMxCj4+PiAwNC8wMS8yMDE0Cj4+PiBD
YWxsIFRyYWNlOgo+Pj4gIMKgIGR1bXBfc3RhY2srMHhlNS8weDE0Ygo+Pj4gIMKgID8gZjJmc19l
dmljdF9pbm9kZSsweDMxYy8weGRlNQo+Pj4gIMKgIHByaW50X2FkZHJlc3NfZGVzY3JpcHRpb24r
MHg2Yy8weDIzNwo+Pj4gIMKgID8gZjJmc19ldmljdF9pbm9kZSsweDMxYy8weGRlNQo+Pj4gIMKg
IGthc2FuX3JlcG9ydC5jb2xkKzB4ODgvMHgyYTMKPj4+ICDCoCBmMmZzX2V2aWN0X2lub2RlKzB4
MzFjLzB4ZGU1Cj4+PiAgwqAgPyBmdWxsX3Byb3h5X29wZW4uY29sZCsweDEyLzB4MTIKPj4+ICDC
oCBldmljdCsweDJjZC8weDVmMAo+Pj4gIMKgIGlwdXQrMHgzZDkvMHg2ZjAKPj4+ICDCoCBkZW50
cnlfdW5saW5rX2lub2RlKzB4MjczLzB4MzMwCj4+PiAgwqAgX19kZW50cnlfa2lsbCsweDM0MC8w
eDVlMAo+Pj4gIMKgIGRlbnRyeV9raWxsKzB4YjcvMHg3NDAKPj4+ICDCoCBzaHJpbmtfZGVudHJ5
X2xpc3QrMHgyNTYvMHg2NjAKPj4+ICDCoCBzaHJpbmtfZGNhY2hlX3NiKzB4MTFmLzB4MWQwCj4+
PiAgwqAgPyBzaHJpbmtfZGVudHJ5X2xpc3QrMHg2NjAvMHg2NjAKPj4+ICDCoCA/IF9fa2FzYW5f
c2xhYl9mcmVlKzB4MTQ0LzB4MTgwCj4+PiAgwqAgZjJmc19maWxsX3N1cGVyKzB4MmEzNC8weDRh
ODAKPj4+ICDCoCA/IGYyZnNfc2FuaXR5X2NoZWNrX2NrcHQuY29sZCsweDJiNi8weDJiNgo+Pj4g
IMKgID8gd2FpdF9mb3JfY29tcGxldGlvbisweDNjMC8weDNjMAo+Pj4gIMKgID8gc2V0X2Jsb2Nr
c2l6ZSsweDIzMC8weDJiMAo+Pj4gIMKgIG1vdW50X2JkZXYrMHgyYzEvMHgzNzAKPj4+ICDCoCA/
IGYyZnNfc2FuaXR5X2NoZWNrX2NrcHQuY29sZCsweDJiNi8weDJiNgo+Pj4gIMKgIG1vdW50X2Zz
KzB4NGMvMHgxYzAKPj4+ICDCoCB2ZnNfa2Vybl9tb3VudC5wYXJ0LjArMHg2MC8weDNkMAo+Pj4g
IMKgIGRvX21vdW50KzB4MzY3LzB4MjU3MAo+Pj4gIMKgID8ga2FzYW5fdW5wb2lzb25fc2hhZG93
KzB4MzMvMHg0MAo+Pj4gIMKgID8gY29weV9tb3VudF9zdHJpbmcrMHg0MC8weDQwCj4+PiAgwqAg
PyBrbWVtX2NhY2hlX2FsbG9jX3RyYWNlKzB4MTNmLzB4MmIwCj4+PiAgwqAgPyBfY29weV9mcm9t
X3VzZXIrMHg5NC8weDEwMAo+Pj4gIMKgID8gY29weV9tb3VudF9vcHRpb25zKzB4MWYxLzB4MmUw
Cj4+PiAgwqAga3N5c19tb3VudCsweGEwLzB4MTAwCj4+PiAgwqAgX194NjRfc3lzX21vdW50KzB4
YmYvMHgxNjAKPj4+ICDCoCBkb19zeXNjYWxsXzY0KzB4YzIvMHgxOTAKPj4+ICDCoCBlbnRyeV9T
WVNDQUxMXzY0X2FmdGVyX2h3ZnJhbWUrMHg0OS8weGJlCj4+PiBSSVA6IDAwMzM6MHg0NzkzOGUK
Pj4+IENvZGU6IDQ4IGM3IGMxIGI0IGZmIGZmIGZmIGY3IGQ4IDY0IDg5IDAxIDQ4IDgzIGM4IGZm
IGMzIDY2IDJlIDBmIDFmIDg0Cj4+PiAwMCAwMCAwMCAwMCAwMCA5MCBmMyAwZiAxZSBmYSA0OSA4
OSBjYSBiOCBhNSAwMCAwMCAwMCAwZiAwNSA8NDg+IDNkIDAxCj4+PiBmMCBmZiBmZiA3MyAwMSBj
MyA0OCBjNyBjMSBiNCBmZiBmZiBmZiBmNyBkOCA2NCA4OSAwMSA0OAo+Pj4gUlNQOiAwMDJiOjAw
MDA3ZmVkNjczYjZhNDggRUZMQUdTOiAwMDAwMDI0NiBPUklHX1JBWDogMDAwMDAwMDAwMDAwMDBh
NQo+Pj4gUkFYOiBmZmZmZmZmZmZmZmZmZmRhIFJCWDogMDAwMDAwMDAyMDAwMDIwMCBSQ1g6IDAw
MDAwMDAwMDA0NzkzOGUKPj4+IFJEWDogMDAwMDAwMDAyMDAwMDAwMCBSU0k6IDAwMDAwMDAwMjAw
MDAxMDAgUkRJOiAwMDAwN2ZlZDY3M2I2YWEwCj4+PiBSQlA6IDAwMDA3ZmVkNjczYjZhZTAgUjA4
OiAwMDAwN2ZlZDY3M2I2YWUwIFIwOTogMDAwMDAwMDAyMDAwMDAwMAo+Pj4gUjEwOiAwMDAwMDAw
MDAwMDAwMDAwIFIxMTogMDAwMDAwMDAwMDAwMDI0NiBSMTI6IDAwMDAwMDAwMjAwMDAwMDAKPj4+
IFIxMzogMDAwMDAwMDAyMDAwMDEwMCBSMTQ6IDAwMDA3ZmVkNjczYjZhYTAgUjE1OiAwMDAwMDAw
MDIwMDAwYjAwCj4+Pgo+Pj4gQWxsb2NhdGVkIGJ5IHRhc2sgODcyOToKPj4+ICDCoCBrYXNhbl9r
bWFsbG9jKzB4YzIvMHhlMAo+Pj4gIMKgIGttZW1fY2FjaGVfYWxsb2NfdHJhY2UrMHgxM2YvMHgy
YjAKPj4+ICDCoCBmMmZzX2ZpbGxfc3VwZXIrMHgxMjQvMHg0YTgwCj4+PiAgwqAgbW91bnRfYmRl
disweDJjMS8weDM3MAo+Pj4gIMKgIG1vdW50X2ZzKzB4NGMvMHgxYzAKPj4+ICDCoCB2ZnNfa2Vy
bl9tb3VudC5wYXJ0LjArMHg2MC8weDNkMAo+Pj4gIMKgIGRvX21vdW50KzB4MzY3LzB4MjU3MAo+
Pj4gIMKgIGtzeXNfbW91bnQrMHhhMC8weDEwMAo+Pj4gIMKgIF9feDY0X3N5c19tb3VudCsweGJm
LzB4MTYwCj4+PiAgwqAgZG9fc3lzY2FsbF82NCsweGMyLzB4MTkwCj4+PiAgwqAgZW50cnlfU1lT
Q0FMTF82NF9hZnRlcl9od2ZyYW1lKzB4NDkvMHhiZQo+Pj4KPj4+IEZyZWVkIGJ5IHRhc2sgODcy
OToKPj4+ICDCoCBfX2thc2FuX3NsYWJfZnJlZSsweDEyZi8weDE4MAo+Pj4gIMKgIGtmcmVlKzB4
ZmEvMHgyYTAKPj4+ICDCoCBmMmZzX2ZpbGxfc3VwZXIrMHgyYTAwLzB4NGE4MAo+Pj4gIMKgIG1v
dW50X2JkZXYrMHgyYzEvMHgzNzAKPj4+ICDCoCBtb3VudF9mcysweDRjLzB4MWMwCj4+PiAgwqAg
dmZzX2tlcm5fbW91bnQucGFydC4wKzB4NjAvMHgzZDAKPj4+ICDCoCBkb19tb3VudCsweDM2Ny8w
eDI1NzAKPj4+ICDCoCBrc3lzX21vdW50KzB4YTAvMHgxMDAKPj4+ICDCoCBfX3g2NF9zeXNfbW91
bnQrMHhiZi8weDE2MAo+Pj4gIMKgIGRvX3N5c2NhbGxfNjQrMHhjMi8weDE5MAo+Pj4gIMKgIGVu
dHJ5X1NZU0NBTExfNjRfYWZ0ZXJfaHdmcmFtZSsweDQ5LzB4YmUKPj4+Cj4+PiBTaWduZWQtb2Zm
LWJ5OiBKYWNrIFFpdSA8amFjay5xaXVAaHVhd2VpLmNvbT4KPj4+IC0tLQo+Pj4gIMKgIGZzL2Yy
ZnMvc3VwZXIuYyB8IDMgKystCj4+PiAgwqAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL3N1cGVyLmMgYi9m
cy9mMmZzL3N1cGVyLmMKPj4+IGluZGV4IDhmZWNkMzA1MGNjZC4uYjA0MTYyNWUwNmNlIDEwMDY0
NAo+Pj4gLS0tIGEvZnMvZjJmcy9zdXBlci5jCj4+PiArKysgYi9mcy9mMmZzL3N1cGVyLmMKPj4+
IEBAIC00MjI5LDYgKzQyMjksOCBAQCBzdGF0aWMgaW50IGYyZnNfZmlsbF9zdXBlcihzdHJ1Y3Qg
c3VwZXJfYmxvY2sgKnNiLCB2b2lkICpkYXRhLCBpbnQgc2lsZW50KQo+Pj4gIMKgIGZyZWVfY29t
cHJlc3NfaW5vZGU6Cj4+PiAgwqDCoMKgwqDCoCBmMmZzX2Rlc3Ryb3lfY29tcHJlc3NfaW5vZGUo
c2JpKTsKPj4+ICDCoCBmcmVlX3Jvb3RfaW5vZGU6Cj4+PiArwqDCoMKgIGlmIChyZXRyeV9jbnQg
PiAwICYmIHNraXBfcmVjb3ZlcnkpCj4+PiArwqDCoMKgwqDCoMKgwqAgc2hyaW5rX2RjYWNoZV9z
YihzYik7Cj4+Cj4+IENvbXBhcmUgdG8gNC4xOSwgbGFzdCBmMmZzIGFkZHMgZXZpY3RfaW5vZGVz
KCkgYmVmb3JlIGYyZnNfdW5yZWdpc3Rlcl9zeXNmcygpLAo+IENhbiBub3QgZmluZCAqZXZpY3Rf
aW5vZGVzKiwgY291bGQgeW91IHBsZWFzZSBlbGFib3JhdGUgbW9yZSBkZXRhaWw/CgpDb3VsZCB5
b3UgcGxlYXNlIGNoZWNrIHdoZXRoZXIgYmVsb3cgcGF0Y2ggY2FuIGZpeCB0aGlzIGlzc3VlPwoK
aHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMv
bGludXguZ2l0L2NvbW1pdC8/aWQ9ODEyYTk1OTc3ZmQyZjBkMWYyMjBjNzE2YTk4CgpUaGFua3Ms
Cgo+PiBjb3VsZCB5b3UgcGxlYXNlIGNoZWNrIHdoZXRoZXIgdGhpcyBjYW4gZml4IHRoZSBpc3N1
ZT8KPiBJIGhhdmUgcnVuIHRoZSB0ZXN0IG1vcmUgdGhhbiAxIGRheSB3LyB0aGlzIHBhdGNoLCBp
dCB3aWxsIGZhaWwgaW4gMSBob3VyIGJlZm9yZS4KPiBJIGJlbGlldmUgdGhpcyBwYXRjaCBjYW4g
Zml4ICp0aGlzKiBpc3N1ZS4gQnV0IEknbSBub3QgcXVpdGUgZmFtaWxpYXIgd2l0aCBzaHJpbmtf
ZGNhY2hlX3NiLAo+IG1heWJlIEkgbWlzcyBvdGhlciBzY2VuYXJpby4gSWYgeW91IGhhdmUgb3Ro
ZXIgY29tbWVudCwgcGxlYXNlIGxldCBtZSBrbm93Lgo+IAo+IFRoYW5rcywKPj4KPj4gVGhhbmtz
LAo+Pgo+Pj4gIMKgwqDCoMKgwqAgZHB1dChzYi0+c19yb290KTsKPj4+ICDCoMKgwqDCoMKgIHNi
LT5zX3Jvb3QgPSBOVUxMOwo+Pj4gIMKgIGZyZWVfbm9kZV9pbm9kZToKPj4+IEBAIC00Mjg1LDcg
KzQyODcsNiBAQCBzdGF0aWMgaW50IGYyZnNfZmlsbF9zdXBlcihzdHJ1Y3Qgc3VwZXJfYmxvY2sg
KnNiLCB2b2lkICpkYXRhLCBpbnQgc2lsZW50KQo+Pj4gIMKgwqDCoMKgwqAgLyogZ2l2ZSBvbmx5
IG9uZSBhbm90aGVyIGNoYW5jZSAqLwo+Pj4gIMKgwqDCoMKgwqAgaWYgKHJldHJ5X2NudCA+IDAg
JiYgc2tpcF9yZWNvdmVyeSkgewo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoCByZXRyeV9jbnQtLTsK
Pj4+IC3CoMKgwqDCoMKgwqDCoCBzaHJpbmtfZGNhY2hlX3NiKHNiKTsKPj4+ICDCoMKgwqDCoMKg
wqDCoMKgwqAgZ290byB0cnlfb25lbW9yZTsKPj4+ICDCoMKgwqDCoMKgIH0KPj4+ICDCoMKgwqDC
oMKgIHJldHVybiBlcnI7Cj4+PiAtLSAKPj4+IDIuMTcuMQo+Pj4KPj4gLgo+IAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwg
bWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBz
Oi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
