Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B553C1E88
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  9 Jul 2021 06:40:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m1iJD-0007tT-Nj; Fri, 09 Jul 2021 04:40:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <wangxiaojun11@huawei.com>) id 1m1iJB-0007tI-VN
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 09 Jul 2021 04:40:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PRiy0gfgPcMGztf0VvAR509ro5Ch8rbymUWATjAUxPs=; b=eDEsmHyREylwg7qGvXR1EB77Ew
 UKsMpa733XLeQBE1+Y1Dj54+rHOmfZLvEV3QjgXPFWX+jMiCVIl6KSXlcsJRjN6VWqiPoec7WmMoE
 rTEnF4zM3ujJ8yckukWg2pmg3J5lGjkbolNGML6dp7//GueedUsyLkpx2+0UO2hyV7LA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PRiy0gfgPcMGztf0VvAR509ro5Ch8rbymUWATjAUxPs=; b=kIULR9Hi4ZaeDrWvnBoses9gEV
 5cmK118MbB5+iO8243v83Q9qpCM3KwcZvtaO9J5fV5QLp5GrqujE2a3BJ9J9QIoYIjZK4O5OGVv36
 PvBbj2I94/gi57f44Y60w2hlindINVO4du0o/w8XW0boAsv4dBrHK5/7Nvzr3uEIRtRw=;
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m1iIw-000cTE-QV
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 09 Jul 2021 04:40:13 +0000
Received: from dggeml756-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4GLgNN6XfCzcbLt;
 Fri,  9 Jul 2021 12:36:36 +0800 (CST)
Received: from [10.174.177.8] (10.174.177.8) by dggeml756-chm.china.huawei.com
 (10.1.199.158) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 9 Jul
 2021 12:39:50 +0800
To: Chao Yu <chao@kernel.org>, <jaegeuk@kernel.org>
References: <20210709020559.3885430-1-wangxiaojun11@huawei.com>
 <0b0ae666-e020-2e1d-c893-e8180a7f1225@kernel.org>
 <86d53291-428e-cb99-ccb8-2f1211ab1cec@huawei.com>
 <3a2e1506-6c67-6dfe-9c69-af80f0cc87eb@kernel.org>
From: "wangxiaojun (N)" <wangxiaojun11@huawei.com>
Message-ID: <9cfe137f-57b2-a2fb-dd13-f640f0bc8a3f@huawei.com>
Date: Fri, 9 Jul 2021 12:39:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <3a2e1506-6c67-6dfe-9c69-af80f0cc87eb@kernel.org>
X-Originating-IP: [10.174.177.8]
X-ClientProxiedBy: dggeme719-chm.china.huawei.com (10.1.199.115) To
 dggeml756-chm.china.huawei.com (10.1.199.158)
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.188 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1m1iIw-000cTE-QV
Subject: Re: [f2fs-dev] [PATCH] f2fs: avoid to create an empty string as the
 extension_list
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

CuWcqCAyMDIxLzcvOSAxMjowMiwgQ2hhbyBZdSDlhpnpgZM6Cj4gT24gMjAyMS83LzkgMTE6NDks
IHdhbmd4aWFvanVuIChOKSB3cm90ZToKPj4KPj4g5ZyoIDIwMjEvNy85IDExOjIxLCBDaGFvIFl1
IOWGmemBkzoKPj4+IE9uIDIwMjEvNy85IDEwOjA1LCBXYW5nIFhpYW9qdW4gd3JvdGU6Cj4+Pj4g
V2hlbiBjcmVhdGluZyBhIGZpbGUsIHdlIG5lZWQgdG8gc2V0IHRoZSB0ZW1wZXJhdHVyZSBiYXNl
ZCBvbgo+Pj4+IGV4dGVuc2lvbl9saXN0LiBJZiB0aGUgZW1wdHkgc3RyaW5nIGlzIGEgdmFsaWQg
ZXh0ZW5zaW9uX2xpc3QsCj4+Pj4gdGhlIGlzX2V4dGVuc2lvbl9leGlzdCB3aWxsIGFsd2F5cyBy
ZXR1cm5zIHRydWUsCj4+Pj4gd2hpY2ggYWZmZWN0cyB0aGUgc2VwYXJhdGlvbiBvZiBob3QgYW5k
IGNvbGQuCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBXYW5nIFhpYW9qdW4gPHdhbmd4aWFvanVu
MTFAaHVhd2VpLmNvbT4KPj4+PiAtLS0KPj4+PiDCoMKgIGZzL2YyZnMvbmFtZWkuYyB8IDIgKysK
Pj4+PiDCoMKgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPj4+Pgo+Pj4+IGRpZmYg
LS1naXQgYS9mcy9mMmZzL25hbWVpLmMgYi9mcy9mMmZzL25hbWVpLmMKPj4+PiBpbmRleCBhOWNk
OWNmOTcyMjkuLjM0MzQxZDNlZGI4ZCAxMDA2NDQKPj4+PiAtLS0gYS9mcy9mMmZzL25hbWVpLmMK
Pj4+PiArKysgYi9mcy9mMmZzL25hbWVpLmMKPj4+PiBAQCAtMjE5LDYgKzIxOSw4IEBAIGludCBm
MmZzX3VwZGF0ZV9leHRlbnNpb25fbGlzdChzdHJ1Y3QKPj4+PiBmMmZzX3NiX2luZm8gKnNiaSwg
Y29uc3QgY2hhciAqbmFtZSwKPj4+PiDCoMKgwqDCoMKgwqAgaW50IHN0YXJ0LCBjb3VudDsKPj4+
PiDCoMKgwqDCoMKgwqAgaW50IGk7Cj4+Pj4gwqDCoCArwqDCoMKgIGlmICghc3RybGVuKG5hbWUp
KQo+Pj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTlZBTDsKPj4+Cj4+PiBIb3cgYWJvdXQg
YWRkaW5nIHRoaXMgaW4gX19zYmlfc3RvcmUoKT8gbGlrZToKPj4+Cj4+PiBpZiAoIXN0cmxlbihu
YW1lKSB8fCBzdHJsZW4obmFtZSkgPj0gRjJGU19FWFRFTlNJT05fTEVOKQo+Pj4gwqDCoMKgwqDC
oHJldHVybiAtRUlOVkFMOwo+Pj4KPj4+IE90aGVyd2lzZSwgaXQgbG9va3MgZ29vZCB0byBtZS4K
Pj4KPj4gVGhpcyBpcyBhbiBhbHRlcm5hdGl2ZSBtb2RpZmljYXRpb24uIEV4Y2VwdGlvbiBjaGVj
ayBpcyBtb3JlIGNvbXBhY3QgCj4+IGhlcmUuCj4+Cj4+IEJ1dCBpZiB0aGUgZjJmc191cGRhdGVf
ZXh0ZW5zaW9uX2xpc3QgZnVuY3Rpb24gaXMgY2FsbGVkIGVsc2V3aGVyZSBpbgo+PiB0aGUgZnV0
dXJlLAo+Cj4gVGhlcmUgaXMgb3RoZXIgcmVsYXRlZCBjaGVjayBvZiBAbmFtZSBpbiBfX3NiaV9z
dG9yZSgpLCBzbyBJIGd1ZXNzCj4gZjJmc191cGRhdGVfZXh0ZW5zaW9uX2xpc3QoKSBpcyBjb3Vw
bGluZyB0byBfX3NiaV9zdG9yZSgpIG5vdy4KPgo+Pgo+PiBjaGVja2luZyBpbnNpZGUgdGhlIGZ1
bmN0aW9uIGNhbiBhdm9pZCB0aGlzIHByb2JsZW0uCj4+Cj4+IEkgd2FzIGFsc28gYSBsaXR0bGUg
dW5zdXJlLCBhbmQgZmluYWxseSBjaG9zZSB0aGlzIG1vZGlmaWNhdGlvbi4KPgo+IEknbSBmaW5l
IHRvIG1vdmUgYWxsIGNoZWNrcyBpbnRvIGYyZnNfdXBkYXRlX2V4dGVuc2lvbl9saXN0KCksIGJ1
dCBub3cKPiBpdCBsb29rcyBtb3JlIGNsZWFuIHRvIGp1c3QgbGV0IHRoZSBjYWxsZXIgZG8gdGhl
IGNoZWNrIG9uIEBuYW1lLgo+Cj4gVGhhbmtzLAo+Ck9rYXksIEknbGwgdXBkYXRlIGluIHRoZSB2
MiB2ZXJzaW9uIGFzIHlvdSBzdWdnZXN0LiBJdCdzIGRlZmluaXRlbHkgbW9yZSAKY2xlYW4uCgpU
aGFua3MsCgo+Pgo+Pj4KPj4+IFJldmlld2VkLWJ5OiBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+
Cj4+Pgo+Pj4gVGhhbmtzLAo+Pj4KPj4+PiDCoMKgwqDCoMKgwqAgaWYgKHNldCkgewo+Pj4+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGlmICh0b3RhbF9jb3VudCA9PSBGMkZTX01BWF9FWFRFTlNJT04p
Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTlZBTDsKPj4+Pgo+
Pj4gLgo+IC4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNv
dXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5m
by9saW51eC1mMmZzLWRldmVsCg==
