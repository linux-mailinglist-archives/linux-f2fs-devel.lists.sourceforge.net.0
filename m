Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D69A18EDF1
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Mar 2020 03:20:10 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jGChA-0007Yi-D8; Mon, 23 Mar 2020 02:20:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jGCh8-0007YE-8Y
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Mar 2020 02:20:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IouGyhXTXo6fC9yxEITMkWHL7dwiI0Rbr68GSROdLVs=; b=Xt+RQ0TNWMt4gPRaXySdgKaaWe
 mKaqrpSohUFl/fb38Q+/QU4m6keEn0A1zbpIzb8qRnk14Q+VcrxJWnY92MTusTOj/Sw1Y3IC1IsAy
 LZqgKqLmnJnXmuNkjVZ8iSp+D7A4JZMbm480cA7j+wTNFnFI90DM+0w6EhdAgxpuuZvs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IouGyhXTXo6fC9yxEITMkWHL7dwiI0Rbr68GSROdLVs=; b=Iqyfdkazy1fjbBCYCQtqyqcKhU
 GmYIPuK5pHhoB/B/o43nKUGkr+BfKysV4HPeyBhhWuuPvhNLaeI5PUi+v4HJggm6B+F5rlXdzykRH
 1GMZ+ddwi5g8Xl+Cig3AocAe6XUvI5OxjBVomMBJ4zlfbaTHDo3xiW9LzUZGNyE/f9K4=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jGCh3-0046sn-Ii
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Mar 2020 02:20:02 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 725CCD8523A1F9EF112E;
 Mon, 23 Mar 2020 10:19:50 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.202) with Microsoft SMTP Server (TLS) id 14.3.487.0; Mon, 23 Mar
 2020 10:19:44 +0800
To: Joe Perches <joe@perches.com>, <jaegeuk@kernel.org>
References: <20200323012519.41536-1-yuchao0@huawei.com>
 <ed37a2a18060f71accb202c05724c0b66d0aa9f7.camel@perches.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <68bc1967-8772-d04a-1209-d919bf122f9f@huawei.com>
Date: Mon, 23 Mar 2020 10:19:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <ed37a2a18060f71accb202c05724c0b66d0aa9f7.camel@perches.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1jGCh3-0046sn-Ii
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: fix potential .flags overflow on
 32bit architecture
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

T24gMjAyMC8zLzIzIDEwOjAwLCBKb2UgUGVyY2hlcyB3cm90ZToKPiBPbiBNb24sIDIwMjAtMDMt
MjMgYXQgMDk6MjUgKzA4MDAsIENoYW8gWXUgd3JvdGU6Cj4+IGYyZnNfaW5vZGVfaW5mby5mbGFn
cyBpcyB1bnNpZ25lZCBsb25nIHZhcmlhYmxlLCBpdCBoYXMgMzIgYml0cwo+PiBpbiAzMmJpdCBh
cmNoaXRlY3R1cmUsIHNpbmNlIHdlIGludHJvZHVjZWQgRklfTU1BUF9GSUxFIGZsYWcKPj4gd2hl
biB3ZSBzdXBwb3J0IGRhdGEgY29tcHJlc3Npb24sIHdlIG1heSBhY2Nlc3MgbWVtb3J5IGNyb3Nz
Cj4+IHRoZSBib3JkZXIgb2YgLmZsYWdzIGZpZWxkLCBjb3JydXB0aW5nIC5pX3NlbSBmaWVsZCwg
cmVzdWx0IGluCj4+IGJlbG93IGRlYWRsb2NrLgo+Pgo+PiBUbyBmaXggdGhpcyBpc3N1ZSwgbGV0
J3MgZXhwYW5kIC5mbGFncyBhcyBhbiBhcnJheSB0byBncmFiIGVub3VnaAo+PiBzcGFjZSB0byBz
dG9yZSBuZXcgZmxhZ3MuCj4gW10KPj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZjJmcy5oIGIvZnMv
ZjJmcy9mMmZzLmgKPiBbXQo+PiBAQCAtMjU4NiwyMiArMjU5MCwyOCBAQCBzdGF0aWMgaW5saW5l
IHZvaWQgX19tYXJrX2lub2RlX2RpcnR5X2ZsYWcoc3RydWN0IGlub2RlICppbm9kZSwKPj4gIAl9
Cj4+ICB9Cj4+ICAKPj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBfX3NldF9pbm9kZV9mbGFnKHN0cnVj
dCBpbm9kZSAqaW5vZGUsIGludCBmbGFnKQo+PiArewo+PiArCXRlc3RfYW5kX3NldF9iaXQoZmxh
ZyAlIEJJVFNfUEVSX0xPTkcsCj4+ICsJCQkmRjJGU19JKGlub2RlKS0+ZmxhZ3NbQklUX1dPUkQo
ZmxhZyldKTsKPiAKPiBJIGJlbGlldmUgdGhpcyBzaG91bGQganVzdCB1c2UKPiAKPiAJdGVzdF9h
bmRfc2V0X2JpdChmbGFnLCBGMkZTX0koaW5vZGUpLT5mbGFncyk7Cj4gCj4+ICBzdGF0aWMgaW5s
aW5lIGludCBpc19pbm9kZV9mbGFnX3NldChzdHJ1Y3QgaW5vZGUgKmlub2RlLCBpbnQgZmxhZykK
Pj4gIHsKPj4gLQlyZXR1cm4gdGVzdF9iaXQoZmxhZywgJkYyRlNfSShpbm9kZSktPmZsYWdzKTsK
Pj4gKwlyZXR1cm4gdGVzdF9iaXQoZmxhZyAlIEJJVFNfUEVSX0xPTkcsCj4+ICsJCQkJJkYyRlNf
SShpbm9kZSktPmZsYWdzW0JJVF9XT1JEKGZsYWcpXSk7Cj4gCj4gaGVyZSB0b28uCj4gCj4gCXRl
c3RfYml0KGZsYWcsIEYyRlNfSShpbm9kZSktPmZsYWdzKTsKPiAKPj4gIHN0YXRpYyBpbmxpbmUg
dm9pZCBjbGVhcl9pbm9kZV9mbGFnKHN0cnVjdCBpbm9kZSAqaW5vZGUsIGludCBmbGFnKQo+PiAg
ewo+PiAtCWlmICh0ZXN0X2JpdChmbGFnLCAmRjJGU19JKGlub2RlKS0+ZmxhZ3MpKQo+PiAtCQlj
bGVhcl9iaXQoZmxhZywgJkYyRlNfSShpbm9kZSktPmZsYWdzKTsKPj4gKwl0ZXN0X2FuZF9jbGVh
cl9iaXQoZmxhZyAlIEJJVFNfUEVSX0xPTkcsCj4+ICsJCQkJJkYyRlNfSShpbm9kZSktPmZsYWdz
W0JJVF9XT1JEKGZsYWcpXSk7Cj4gCj4gYW5kIGhlcmUuCgpNeSBiYWQsIE9uZMWZZWogSmlybWFu
IGFsc28gcmVtaW5kZWQgbWUgdGhpcyBpc3N1ZSwgd2lsbCBmaXggdGhpcyBzb29uLgoKVGhhbmtz
LAoKPiAKPiBJIGFsc28gZG9uJ3Qga25vdyB3aHkgdGhlc2UgZnVuY3Rpb25zIGFyZSB1c2VkIGF0
IGFsbC4KPiAKPiAKPiAuCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZl
bEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlz
dHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
