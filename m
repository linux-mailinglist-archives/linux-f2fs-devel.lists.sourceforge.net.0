Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BB72423DD
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Aug 2020 03:51:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k5fvH-00069j-NA; Wed, 12 Aug 2020 01:51:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1k5fvG-00069a-C3
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 12 Aug 2020 01:51:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ATq1/7G3hZAe6KAgpQ6zViS94M/7okaF/wuamMGnCLE=; b=fGRO6rx9jmMzRswuDMk90lLDRX
 GDkpfANINMbFEsNF1toderIOhO0ozflfuupxzlyD9lEINWbO01YheoYz0wTIdLYOYWMo3DR5nC9M4
 BUjKmRzcmQw4h1DXhLa1EG+BVafhprwWxvzzZQwUqV5IVP0ZuOG2Tkxuhen7D5dKnRMc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ATq1/7G3hZAe6KAgpQ6zViS94M/7okaF/wuamMGnCLE=; b=RlLem4KLB0OBqNGgjXp7kv5FmH
 w8lbDeeyiFG3TNKLrc/KF1PEIVUTt40OYNV+CAXlvA26Hj1ayc4CJMDwqMynctgPkiCEkAEabkQoW
 CBYXhR6ic1v2qSYKBLNtWwNN0yXJTh6BfBycOv/PQJBSdzcapOL9JcnYW4VwF3flUV7w=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1k5fvD-002ksh-Fd
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 12 Aug 2020 01:51:22 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 9F1BC595C8752D438AE5;
 Wed, 12 Aug 2020 09:51:08 +0800 (CST)
Received: from [10.164.122.247] (10.164.122.247) by smtp.huawei.com
 (10.3.19.205) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 12 Aug
 2020 09:51:03 +0800
To: Daeho Jeong <daeho43@gmail.com>, Gao Xiang <hsiangkao@redhat.com>
References: <20200811033753.783276-1-daeho43@gmail.com>
 <20200811071552.GA8365@xiangao.remote.csb>
 <3059d7b0-cf50-4315-e5a9-8d9c00965a7c@huawei.com>
 <CACOAw_yic7GF3E1zEvZ=Gea3XW4fMYdg-cNuu4wfg+uTKMcJqA@mail.gmail.com>
 <CACOAw_wi3C0iyTVYc3075d4K27NT7BGMGzsKFDDozf=98vWMcA@mail.gmail.com>
 <20200811101827.GA7870@xiangao.remote.csb>
 <CACOAw_zRPeGzHyc_siLqBRjURWTE61G5rGCwk7bnbcOnADGRpg@mail.gmail.com>
 <20200811112912.GB7870@xiangao.remote.csb>
 <CACOAw_zAbTf+hEW0XVyL-aUw7oxCFTm_jRXLM8eiaOEdDWc0Qw@mail.gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <7808b204-b0a4-400c-9ccc-07bc7aea194d@huawei.com>
Date: Wed, 12 Aug 2020 09:51:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CACOAw_zAbTf+hEW0XVyL-aUw7oxCFTm_jRXLM8eiaOEdDWc0Qw@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.164.122.247]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.35 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1k5fvD-002ksh-Fd
Subject: Re: [f2fs-dev] [PATCH] f2fs: change virtual mapping way for
 compression pages
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
Cc: linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com,
 Daeho Jeong <daehojeong@google.com>, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMC84LzExIDE5OjMxLCBEYWVobyBKZW9uZyB3cm90ZToKPiBQbHVzLCBkaWZmZXJlbnRs
eSBmcm9tIHlvdXIgdGVzdGJlZCwgaW4gbXkgcGl4ZWwgZGV2aWNlLCB0aGVyZSBzZWVtcwo+IHRv
IGJlIG11Y2ggbW9yZSBjb250ZW50aW9uIGluIHZtYXAoKSBvcGVyYXRpb24uCj4gSWYgaXQncyBu
b3QgdGhlcmUsIEkgYWdyZWUgdGhhdCB0aGVyZSBtaWdodCBub3QgYmUgYSBiaWcgZGlmZmVyZW5j
ZQo+IGJldHdlZW4gdm1hcCgpIGFuZCB2bV9tYXBfcmFtKCkuCj4gCj4gMjAyMOuFhCA47JuUIDEx
7J28ICjtmZQpIOyYpO2bhCA4OjI5LCBHYW8gWGlhbmcgPGhzaWFuZ2thb0ByZWRoYXQuY29tPuuL
mOydtCDsnpHshLE6Cj4+Cj4+IE9uIFR1ZSwgQXVnIDExLCAyMDIwIGF0IDA4OjIxOjIzUE0gKzA5
MDAsIERhZWhvIEplb25nIHdyb3RlOgo+Pj4gU3VyZSwgSSdsbCB1cGRhdGUgdGhlIHRlc3QgY29u
ZGl0aW9uIGFzIHlvdSBzYWlkIGluIHRoZSBjb21taXQgbWVzc2FnZS4KPj4+IEZZSSwgdGhlIHRl
c3QgaXMgZG9uZSB3aXRoIDE2a2IgY2h1bmsgYW5kIFBpeGVsIDMgKGFybTY0KSBkZXZpY2UuCj4+
Cj4+IFllYWgsIGFueXdheSwgaXQnZCBiZXR0ZXIgdG8gbG9jayB0aGUgZnJlcSBhbmQgb2ZmbGlu
ZSB0aGUgbGl0dGxlCj4+IGNvcmVzIGluIHlvdXIgdGVzdCBhcyB3ZWxsIChpdCdkIG1ha2UgbW9y
ZSBzZW5zZSkuIGUuZy4gaWYgMTZrIGNsdXN0ZXIKCkknbSBub3QgYWdhaW5zdCB0aGlzIGNvbW1p
dCwgYnV0IGNvdWxkIHlvdSBwbGVhc2UgdHJ5IHRvIGFkanVzdCBjcHVmcmVxIHRvCmZpeGVkIHZh
bHVlIGFuZCBvZmZsaW5lIGxpdHRsZSBvciBiaWcgY29yZSwgc28gdGhhdCB3ZSBjYW4gc3VwcGx5
IGZhaXIgdGVzdAplbnZpcm9ubWVudCBkdXJpbmcgdGVzdCwgSSBqdXN0IHdvbmRlciB0aGF0IGlu
IHN1Y2ggZW52aXJvbm1lbnQsIGhvdyBtdWNoIHdlCmNhbiBpbXByb3ZlIHRoZSBwZXJmb3JtYW5j
ZSB3aXRoIHZtX21hcF9yYW0oKS4KCj4+IGlzIGFwcGxpZWQsIGV2ZW4gYWxsIGRhdGEgaXMgemVy
b2VkLCB0aGUgY291bnQgb2Ygdm1hcC92bV9tYXBfcmFtCj4+IGlzbid0IGh1Z2VvdXMgKGFuZCBh
cyB5b3Ugc2FpZCwgInNvbWV0aW1lcywgaXQgaGFzIGEgdmVyeSBsb25nIGRlbGF5IiwKPj4gaXQn
cyBtdWNoIGxpa2UgYW5vdGhlciBzY2hlZHVsaW5nIGNvbmNlcm4gYXMgd2VsbCkuCj4+Cj4+IEFu
eXdheSwgSSdtIG5vdCBhZ2FpbnN0IHlvdXIgY29tbWl0IGJ1dCB0aGUgY29tbWl0IG1lc3NhZ2Ug
aXMgYSBiaXQKPj4gb2YgdW5jbGVhci4gQXQgbGVhc3QsIGlmIHlvdSB0aGluayB0aGF0IGlzIHJl
YWxseSB0aGUgY2FzZSwgSSdtIG9rCj4+IHdpdGggdGhhdC4KPj4KPj4gVGhhbmtzLAo+PiBHYW8g
WGlhbmcKPj4KPj4+Cj4+PiBUaGFua3MsCj4+Pgo+Pj4gMjAyMMOr4oCm4oCeIDjDrOKAuuKAnSAx
McOs77+9wrwgKMOt4oSi4oCdKSDDrMucwqTDreKAuuKAniA3OjE4LCBHYW8gWGlhbmcgPGhzaWFu
Z2thb0ByZWRoYXQuY29tPsOr4oC5y5zDrO+/vcK0IMOsxb7igJjDrOKAnsKxOgo+Pj4+Cj4+Pj4g
T24gVHVlLCBBdWcgMTEsIDIwMjAgYXQgMDY6MzM6MjZQTSArMDkwMCwgRGFlaG8gSmVvbmcgd3Jv
dGU6Cj4+Pj4+IFBsdXMsIHdoZW4gd2UgdXNlIHZtYXAoKSwgdm1hcCgpIG5vcm1hbGx5IGV4ZWN1
dGVzIGluIGEgc2hvcnQgdGltZQo+Pj4+PiBsaWtlIHZtX21hcF9yYW0oKS4KPj4+Pj4gQnV0LCBz
b21ldGltZXMsIGl0IGhhcyBhIHZlcnkgbG9uZyBkZWxheS4KPj4+Pj4KPj4+Pj4gMjAyMMODwqvD
ouKCrMKmw6LigqzFviA4w4PCrMOi4oKswrrDouKCrO+/vSAxMcODwqzDr8K/wr3DgsK8ICjDg8Kt
w6LigJ7CosOi4oKs77+9KSDDg8Ksw4vFk8OCwqTDg8Ktw6LigqzCusOi4oKsxb4gNjoyOCwgRGFl
aG8gSmVvbmcgPGRhZWhvNDNAZ21haWwuY29tPsODwqvDouKCrMK5w4vFk8ODwqzDr8K/wr3DgsK0
IMODwqzDhcK+w6LigqzLnMODwqzDouKCrMW+w4LCsToKPj4+Pj4+Cj4+Pj4+PiBBY3R1YWxseSwg
YXMgeW91IGNhbiBzZWUsIEkgdXNlIHRoZSB3aG9sZSB6ZXJvIGRhdGEgYmxvY2tzIGluIHRoZSB0
ZXN0IGZpbGUuCj4+Pj4+PiBJdCBjYW4gbWF4aW1pemUgdGhlIGVmZmVjdCBvZiBjaGFuZ2luZyB2
aXJ0dWFsIG1hcHBpbmcuCj4+Pj4+PiBXaGVuIEkgdXNlIG5vcm1hbCBmaWxlcyB3aGljaCBjYW4g
YmUgY29tcHJlc3NlZCBhYm91dCA3MCUgZnJvbSB0aGUKPj4+Pj4+IG9yaWdpbmFsIGZpbGUsCj4+
Pj4+PiBUaGUgdm1fbWFwX3JhbSgpIHZlcnNpb24gaXMgYWJvdXQgMnggZmFzdGVyIHRoYW4gdm1h
cCgpIHZlcnNpb24uCj4+Pj4KPj4+PiBXaGF0IGYyZnMgZG9lcyBpcyBtdWNoIHNpbWlsYXIgdG8g
YnRyZnMgY29tcHJlc3Npb24uIEV2ZW4gaWYgdGhlc2UKPj4+PiBibG9ja3MgYXJlIGFsbCB6ZXJv
ZWQuIEluIHByaW5jaXBsZSwgdGhlIG1heGltdW0gY29tcHJlc3Npb24gcmF0aW8KPj4+PiBpcyBk
ZXRlcm1pbmVkIChjbHVzdGVyIHNpemVkIGJsb2NrcyBpbnRvIG9uZSBjb21wcmVzc2VkIGJsb2Nr
LCBlLmcKPj4+PiAxNmsgY2x1c3RlciBpbnRvIG9uZSBjb21wcmVzc2VkIGJsb2NrKS4KPj4+Pgo+
Pj4+IFNvIGl0J2QgYmUgYmV0dGVyIHRvIGRlc2NyaWJlIHlvdXIgY29uZmlndXJlZCBjbHVzdGVy
IHNpemUgKDE2ayBvcgo+Pj4+IDEyOGspIGFuZCB5b3VyIGhhcmR3YXJlIGluZm9ybWF0aW9uIGlu
IHRoZSBjb21taXQgbWVzc2FnZSBhcyB3ZWxsLgo+Pj4+Cj4+Pj4gQWN0dWFsbHksIEkgYWxzbyB0
cmllZCB3aXRoIHRoaXMgcGF0Y2ggYXMgd2VsbCBvbiBteSB4ODYgbGFwdG9wIGp1c3QKPj4+PiBu
b3cgd2l0aCBGSU8gKEkgZGlkbid0IHVzZSB6ZXJvZWQgYmxvY2sgdGhvdWdoKSwgYW5kIEkgZGlk
bid0IG5vdGljZQo+Pj4+IG11Y2ggZGlmZmVyZW5jZSB3aXRoIHR1cmJvIGJvb3N0IG9mZiBhbmQg
bWF4ZnJlcS4KPj4+Pgo+Pj4+IEknbSBub3QgYXJndWluZyB0aGlzIGNvbW1pdCwganVzdCBhIG5v
dGUgYWJvdXQgdGhpcyBjb21taXQgbWVzc2FnZS4KPj4+Pj4+Pj4+IDEwNDg1NzYwMDAgYnl0ZXMg
KDAuOSBHKSBjb3BpZWQsIDkuMTQ2MjE3IHMsIDEwOSBNL3MKPj4+Pj4+Pj4+IDEwNDg1NzYwMDAg
Ynl0ZXMgKDAuOSBHKSBjb3BpZWQsIDkuOTk3NTQyIHMsIDEwMCBNL3MKPj4+Pj4+Pj4+IDEwNDg1
NzYwMDAgYnl0ZXMgKDAuOSBHKSBjb3BpZWQsIDEwLjEwOTcyNyBzLCA5OSBNL3MKPj4+Pgo+Pj4+
IElNSE8sIHRoZSBhYm92ZSBudW1iZXIgaXMgbXVjaCBsaWtlIGRlY29tcHJlc3NpbmcgaW4gdGhl
IGFybTY0IGxpdHRsZSBjb3Jlcy4KPj4+Pgo+Pj4+IFRoYW5rcywKPj4+PiBHYW8gWGlhbmcKPj4+
Pgo+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4gMjAyMMODwqvDouKCrMKmw6LigqzFviA4w4PCrMOi4oKswrrD
ouKCrO+/vSAxMcODwqzDr8K/wr3DgsK8ICjDg8Ktw6LigJ7CosOi4oKs77+9KSDDg8Ksw4vFk8OC
wqTDg8Ktw6LigqzCusOi4oKsxb4gNDo1NSwgQ2hhbyBZdSA8eXVjaGFvMEBodWF3ZWkuY29tPsOD
wqvDouKCrMK5w4vFk8ODwqzDr8K/wr3DgsK0IMODwqzDhcK+w6LigqzLnMODwqzDouKCrMW+w4LC
sToKPj4+Pj4+Pgo+Pj4+Pj4+IE9uIDIwMjAvOC8xMSAxNToxNSwgR2FvIFhpYW5nIHdyb3RlOgo+
Pj4+Pj4+PiBPbiBUdWUsIEF1ZyAxMSwgMjAyMCBhdCAxMjozNzo1M1BNICswOTAwLCBEYWVobyBK
ZW9uZyB3cm90ZToKPj4+Pj4+Pj4+IEZyb206IERhZWhvIEplb25nIDxkYWVob2plb25nQGdvb2ds
ZS5jb20+Cj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gQnkgcHJvZmlsaW5nIGYyZnMgY29tcHJlc3Npb24g
d29ya3MsIEkndmUgZm91bmQgdm1hcCgpIGNhbGxpbmdzIGFyZQo+Pj4+Pj4+Pj4gYm90dGxlbmVj
a3Mgb2YgZjJmcyBkZWNvbXByZXNzaW9uIHBhdGguIENoYW5naW5nIHRoZXNlIHdpdGgKPj4+Pj4+
Pj4+IHZtX21hcF9yYW0oKSwgd2UgY2FuIGVuaGFuY2UgZjJmcyBkZWNvbXByZXNzaW9uIHNwZWVk
IHByZXR0eSBtdWNoLgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IFtWZXJpZmljYXRpb25dCj4+Pj4+Pj4+
PiBkZCBpZj0vZGV2L3plcm8gb2Y9ZHVtbXkgYnM9MW0gY291bnQ9MTAwMAo+Pj4+Pj4+Pj4gZWNo
byAzID4gL3Byb2Mvc3lzL3ZtL2Ryb3BfY2FjaGVzCj4+Pj4+Pj4+PiBkZCBpZj1kdW1teSBvZj0v
ZGV2L3plcm8gYnM9NTEyawo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IC0gdy9vIGNvbXByZXNzaW9uIC0K
Pj4+Pj4+Pj4+IDEwNDg1NzYwMDAgYnl0ZXMgKDAuOSBHKSBjb3BpZWQsIDEuOTk5Mzg0IHMsIDUw
MCBNL3MKPj4+Pj4+Pj4+IDEwNDg1NzYwMDAgYnl0ZXMgKDAuOSBHKSBjb3BpZWQsIDIuMDM1OTg4
IHMsIDQ5MSBNL3MKPj4+Pj4+Pj4+IDEwNDg1NzYwMDAgYnl0ZXMgKDAuOSBHKSBjb3BpZWQsIDIu
MDM5NDU3IHMsIDQ5MCBNL3MKPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiAtIGJlZm9yZSBwYXRjaCAtCj4+
Pj4+Pj4+PiAxMDQ4NTc2MDAwIGJ5dGVzICgwLjkgRykgY29waWVkLCA5LjE0NjIxNyBzLCAxMDkg
TS9zCj4+Pj4+Pj4+PiAxMDQ4NTc2MDAwIGJ5dGVzICgwLjkgRykgY29waWVkLCA5Ljk5NzU0MiBz
LCAxMDAgTS9zCj4+Pj4+Pj4+PiAxMDQ4NTc2MDAwIGJ5dGVzICgwLjkgRykgY29waWVkLCAxMC4x
MDk3MjcgcywgOTkgTS9zCj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gLSBhZnRlciBwYXRjaCAtCj4+Pj4+
Pj4+PiAxMDQ4NTc2MDAwIGJ5dGVzICgwLjkgRykgY29waWVkLCAyLjI1MzQ0MSBzLCA0NDQgTS9z
Cj4+Pj4+Pj4+PiAxMDQ4NTc2MDAwIGJ5dGVzICgwLjkgRykgY29waWVkLCAyLjczOTc2NCBzLCAz
NjUgTS9zCj4+Pj4+Pj4+PiAxMDQ4NTc2MDAwIGJ5dGVzICgwLjkgRykgY29waWVkLCAyLjE4NTY0
OSBzLCA0NTggTS9zCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IEluZGVlZCwgdm1hcCgpIGFwcHJvYWNoIGhh
cyBzb21lIGltcGFjdCBvbiB0aGUgd2hvbGUKPj4+Pj4+Pj4gd29ya2Zsb3cuIEJ1dCBJIGRvbid0
IHRoaW5rIHRoZSBnYXAgaXMgc3VjaCBzaWduaWZpY2FudCwKPj4+Pj4+Pj4gbWF5YmUgaXQgcmVs
YXRlcyB0byB1bmxvY2tlZCBjcHVmcmVxIChhbmQgYmlnIGxpdHRsZQo+Pj4+Pj4+PiBjb3JlIGRp
ZmZlcmVuY2UgaWYgaXQncyBvbiBzb21lIGFybTY0IGJvYXJkKS4KPj4+Pj4+Pgo+Pj4+Pj4+IEFn
cmVlZCwKPj4+Pj4+Pgo+Pj4+Pj4+IEkgZ3Vlc3MgdGhlcmUgc2hvdWxkIGJlIG90aGVyIHJlYXNv
biBjYXVzaW5nIHRoZSBsYXJnZSBwZXJmb3JtYW5jZQo+Pj4+Pj4+IGdhcCwgc2NoZWR1bGluZywg
ZnJlcXVlbmN5LCBvciBzb21ldGhpbmcgZWxzZS4KPj4+Pj4+Pgo+Pj4+Pj4+Pgo+Pj4+Pj4+Pgo+
Pj4+Pj4+Pgo+Pj4+Pj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+Pj4+Pj4+PiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+Pj4+Pj4+PiBM
aW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+Pj4+Pj4+PiBodHRwczovL2xp
c3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCj4+Pj4+
Pj4+IC4KPj4+Pj4+Pj4KPj4+Pj4KPj4+Pgo+Pj4KPj4KPiAuCj4gCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5n
IGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0
cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
