Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F402EE8489
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Oct 2019 10:33:27 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iPNsU-0002cx-BT; Tue, 29 Oct 2019 09:33:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1iPNsT-0002ck-8s
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 29 Oct 2019 09:33:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rnZ19+M7+M0FozXbUTAkvwpyYwhlVZ7m3BXlGTIyhdk=; b=FqU9npcQqZ6D6OtZxoCMqLGs4a
 U0FV1CCDvCPyphTiqF8izkaq1nZasCcjeEKDTYgL+G6PO3W0VSPTSajhDNLPMya6E1pFAOZIexVgU
 w5q03kC05tvs7bm5BmKI938/tgAlZ8bXB48mAzFFet5w78aaCEA1MwIbEVL2EfM047oc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rnZ19+M7+M0FozXbUTAkvwpyYwhlVZ7m3BXlGTIyhdk=; b=LPCxGXav0Bq9G7BNj4mbtYAXPc
 80PeQ/e+7DaBXmAXVChNDxTE3oYDscisKmfM64tI2WYWbcE5P/+MaKmR+NmJnFEVaMEx/F9jM1cZR
 OXmh1Uqk24rU3Hw4qlNFj4RcMwvVRFZmx12fQ3ps/j2irEt7gFcm20D/3u/eVSiNJR/A=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iPNsR-008JRq-J8
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 29 Oct 2019 09:33:25 +0000
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 5DD4795D8C9B028EF9D9;
 Tue, 29 Oct 2019 17:33:16 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.213) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 29 Oct
 2019 17:33:12 +0800
To: =?UTF-8?B?546L55+b?= <spearmao@126.com>
References: <51b426e.685b.16df7c1dfeb.Coremail.spearmao@126.com>
 <41ebc7c0-d302-af52-f201-825220ed70f0@huawei.com>
 <6a90286.7f06.16dfde844d3.Coremail.spearmao@126.com>
 <14c6b12e.4b95.16e111552ce.Coremail.spearmao@126.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <8e7b930d-3c93-4edf-ad2c-cdff3e71ec49@huawei.com>
Date: Tue, 29 Oct 2019 17:33:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <14c6b12e.4b95.16e111552ce.Coremail.spearmao@126.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1iPNsR-008JRq-J8
Subject: Re: [f2fs-dev] Question about f2fs UDC(userdata checkpointing)
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

SGVsbG8sCgpPbiAyMDE5LzEwLzI4IDE0OjM3LCDnjovnn5sgd3JvdGU6Cj4gSGkgQ2hhbywKPiAK
PiBTb3JyeSB0byBib3RoZXIgeW91IGFnYWluIHdpdGggbGFzdCBxdWVzdGlvbiBhYm91dCB0aGlz
IHRvcGljLiA6KQo+IAo+ICJBY3R1YWxseSwgQVBQIGNhbiB1cGRhdGUgZGF0YSBkdXJpbmcgQ1Ag
ZGlzYWJsaW5nLCB1bmxlc3MgdGhlcmUgaXMgbm8gZW5vdWdoCj4gZnJlZSBzcGFjZSIKPiBTbyB3
ZSBkb24ndCBwcmV2ZW50IGFwcCB1cGRhdGUgZGF0YSBkdXJpbmcgQ1AgZGlzYWJsaW5nLCBidXQg
d2UgcHJldmVudCB0aGUKPiBkaXJ0eSBub2RlL2RhdGEgaW5mb3JtYXRpb24gdG8gYmUgc3luY2Vk
IGludG8gc3RvcmFnZSwgcmlnaHQ/Cj4gCj4gRnJvbSBjb2RlIGkgY2FuIHNlZSBiZWxvdyBzeW5j
IG9wZXJhdGlvbiB3aWxsIHJldHVybiBkaXJlY3RseSBpZiBmaW5kIENQIGlzCj4gZGlzYWJsZWQ6
Cj4gwqDCoMKgIMKgwqDCoCBmMmZzX3N5bmNfZnMoKQo+IMKgwqDCoCDCoMKgwqAgZjJmc19kb19z
eW5jX2ZpbGUoKQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKHVubGlrZWx5KGlzX3NiaV9m
bGFnX3NldChzYmksIFNCSV9DUF9ESVNBQkxFRCkpKQo+IMKgwqDCoCDCoMKgIMKgIMKgIMKgIMKg
IMKgwqAgcmV0dXJuIDA7Cj4gCj4gTXkgcXVlc3Rpb24gaXMsIGkgZGlkbid0IGZpbmQgYW55IGNv
ZGUgdG8gY2hlY2sgQ1AgaXMgZGlzYWJsZWQgaW4gdGhlIFdyaWJlLUJhY2sKPiBwcm9jZWR1cmUu
Cj4gQXMgeW91IGtub3csIFdCIHByb2NlZHVyZSB3b3VsZCBiZSBleGVjdXRlZCBwZXJpb2RpY2Fs
bHkgYW5kIGZsdXNoIGRpcnR5IGRhdGEKPiBpbnRvIHN0b3JhZ2UuCj4gVGh1cyBpZiBXQiBpcyBu
b3QgcHJldmVudGVkIGR1cmluZyBDUCBkaXNhYmxlZCwgZGF0YSBzdGlsbCBiZSB1cGRhdGVkIG9u
dG8KPiBmbGFzaCzCoCB0aGlzIGlzIG91dCBvZiBleHBlY3RhdGlvbiBvZiBVREMsIGlzIHRoaXMg
cmlnaHQ/CgpXZSBkb24ndCBuZWVkIHRvIHRha2UgY2FyZSBvZiBXQiwgaWYgQ1AgYW5kIGZzeW5j
IGlzIGRpc2FibGVkLCBhZnRlciBzdWRkZW4KcG93ZXItY3V0LCB3ZSB3aWxsIHJvbGxiYWNrIHRv
IHByZXZpb3VzIENQLCB3aGljaCB3aWxsIG5vdCBjb250YWluIHdyaXRlYmFja2VkCmRhdGEvbm9k
ZS4KClRoYW5rcywKCj4gCj4gVGhhbmtzLAo+IE1hbwo+IAo+IAo+IEF0IDIwMTktMTAtMjQgMjE6
MTU6MjAsICLnjovnn5siIDxzcGVhcm1hb0AxMjYuY29tPiB3cm90ZToKPiAKPiAgICAgQ2hhbywK
PiAKPiAgICAgVmVyeSBhcHByZWNpYXRlZCBmb3IgeW91ciBraW5kIGFuZCBwcm9tcHQgcmVwbHku
IDopCj4gCj4gICAgIExldCBtZSB0cnkgdG8gc3BlbmQgbW9yZSB0aW1lIG9uIHRoZSBmMmZzIFVE
QyByZWxhdGVkIGNvZGUgYW5kIGdldCBiYWNrCj4gICAgIGxhdGVyIGlmIEkgaGF2ZSBmdXJ0aGVy
IHF1ZXN0aW9ucy4KPiAKPiAgICAgVGhhbmtzIQo+ICAgICBNYW8KPiAKPiAgICAgQXQgMjAxOS0x
MC0yMyAxNzo0MjowMywgIkNoYW8gWXUiIDx5dWNoYW8wQGh1YXdlaS5jb20+IHdyb3RlOgo+ICAg
ICA+SGVsbG8sCj4gICAgID4KPiAgICAgPk9uIDIwMTkvMTAvMjMgMTY6MzUsIOeOi+efmyB3cm90
ZToKPiAgICAgPgo+ICAgICA+W3NuaXBdCj4gICAgID4KPiAgICAgPj4gV2hlbiBDUCBpcyBkaXNh
YmxlZCwgSSBzYXcgbWFueSBmMmZzIG9wZXJhdGlvbnMgYXJlIHByZXZlbnRlZChsaXN0ZWQgYWJv
dmUpLgo+ICAgICA+PiAKPiAgICAgPj4gSWYgc28sIGR1cmluZyB0aGUgcGVyaW9kIENQIGRpc2Fi
bGVkLCBhcHAgY2Fu4oCZdCBkbyBhbnkgY2hhbmdlIHRvIGYyZnM/IAo+ICAgICA+Cj4gICAgID5Q
bGVhc2UgQ2MgZjJmcyBtYWlsaW5nIGxpc3QgZm9yIGFueSBmMmZzIHF1ZXN0aW9uLgo+ICAgICA+
Cj4gICAgID5BY3R1YWxseSwgQVBQIGNhbiB1cGRhdGUgZGF0YSBkdXJpbmcgQ1AgZGlzYWJsaW5n
LCB1bmxlc3MgdGhlcmUgaXMgbm8gZW5vdWdoCj4gICAgID5mcmVlIHNwYWNlLCB0aGUgbG9naWMg
d2FzIGluZGljYXRlZCBieSBiZWxvdyBjb2RlczoKPiAgICAgPgo+ICAgICA+c3RhdGljIGlubGlu
ZSBib29sIGYyZnNfaXNfY2hlY2twb2ludF9yZWFkeShzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkp
Cj4gICAgID57Cj4gICAgID4JaWYgKGxpa2VseSghaXNfc2JpX2ZsYWdfc2V0KHNiaSwgU0JJX0NQ
X0RJU0FCTEVEKSkpCj4gICAgID4JCXJldHVybiB0cnVlOwo+ICAgICA+CWlmIChsaWtlbHkoIWhh
c19ub3RfZW5vdWdoX2ZyZWVfc2VjcyhzYmksIDAsIDApKSkKPiAgICAgPgkJcmV0dXJuIHRydWU7
Cj4gICAgID4JcmV0dXJuIGZhbHNlOwo+ICAgICA+fQo+ICAgICA+Cj4gICAgID5zdGF0aWMgaW50
IGYyZnNfbWtub2Qoc3RydWN0IGlub2RlICpkaXIsIHN0cnVjdCBkZW50cnkgKmRlbnRyeSwKPiAg
ICAgPgkJCQl1bW9kZV90IG1vZGUsIGRldl90IHJkZXYpCj4gICAgID57Cj4gICAgID4Jc3RydWN0
IGYyZnNfc2JfaW5mbyAqc2JpID0gRjJGU19JX1NCKGRpcik7Cj4gICAgID4Jc3RydWN0IGlub2Rl
ICppbm9kZTsKPiAgICAgPglpbnQgZXJyID0gMDsKPiAgICAgPgo+ICAgICA+CWlmICh1bmxpa2Vs
eShmMmZzX2NwX2Vycm9yKHNiaSkpKQo+ICAgICA+CQlyZXR1cm4gLUVJTzsKPiAgICAgPglpZiAo
IWYyZnNfaXNfY2hlY2twb2ludF9yZWFkeShzYmkpKQo+ICAgICA+CQlyZXR1cm4gLUVOT1NQQzsK
PiAgICAgPi4uLgo+ICAgICA+fQo+ICAgICA+Cj4gICAgID5PbmNlIGFsbCBkYXRhIHdhcyB1cGRh
dGVkIGJ5IEFuZHJvaWQsIHdlIGNhbiB0ZXJtaW5hdGUgQ1AgZGlzYWJsaW5nIHN0YXR1cywgYW5k
Cj4gICAgID50cmlnZ2VyIGEgY2hlY2twb2ludCB0byBwZXJzaXN0IGFsbCBwcmV2aW91cyB1cGRh
dGVzLgo+ICAgICA+Cj4gICAgID5UaGFua3MsCj4gICAgID4KPiAgICAgPj4gCj4gICAgID4+IElm
IHllcywgaG93IGl0IGltcGxlbWVudGVkIHRoZSBjaGVja3BvaW50IGZ1bmN0aW9uPwo+ICAgICA+
PiAKPiAgICAgPj4gTWF5YmUgdGhlIHBhdGNoIEkKPiAgICAgPj4gZm91bmQoaHR0cHM6Ly9zb3Vy
Y2Vmb3JnZS5uZXQvcC9saW51eC1mMmZzL21haWxtYW4vbWVzc2FnZS8zNjQyNTUxMS8pIGlzIG5v
dCB0aGUKPiAgICAgPj4gd2hvbGUgaW1wbGVtZW50YXRpb24gb2YgdGhpcyBmZWF1dGXigKYuCj4g
ICAgID4+IAo+ICAgICA+PiDCoAo+ICAgICA+PiAKPiAgICAgPj4gCj4gICAgID4+IFRoYW5rcywK
PiAgICAgPj4gCj4gICAgID4+IE1hbwo+ICAgICA+PiAKPiAgICAgPj4gCj4gICAgID4+IAo+ICAg
ICA+PiDCoAo+ICAgICA+PiAKPiAKPiAKPiAKPiAgICAgwqAKPiAKPiAKPiAKPiDCoAo+IAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMt
ZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0
Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMt
ZGV2ZWwK
