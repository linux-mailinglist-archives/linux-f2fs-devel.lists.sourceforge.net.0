Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 241B44C3C1E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Feb 2022 04:02:25 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nNQs9-0003Bb-Bs; Fri, 25 Feb 2022 03:02:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nNQs7-0003BV-Tu
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 25 Feb 2022 03:02:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/Dk4WMyrsJY3oUmfyKVexbwQONjOKBp/ndOsgt32UHM=; b=mGJRlTzzAa0EQYdruXDrJZSQJ4
 oafZAULP5kC09qK8XO8Ugr+/CBJsUVpiGi+CnXYa8jYGUVaKgWeG2J8Q4jWFQ09LOyWaj6znmmH2s
 VRclQBLRWF0WAnOnK9NGtZ+xLy8IqhO5wLmbEsLnBnxA22k6suq0CXd/vWr5PC3obj4w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:From:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/Dk4WMyrsJY3oUmfyKVexbwQONjOKBp/ndOsgt32UHM=; b=ih3tCi4vc5CTYzjtzu7yLLr8Xu
 kc3qqF4X1CiGMeZdIU9DsnUsuTOFrVWn+F1ahzKJkgJf/VlWHaIqT+kY/pSfvSg9rWGt7/2HL2nEj
 V+uGm2QJHLgxlSJ+rNMl5m43ddm1jIFZSLQiX2hZy90/mcQz6GUsxK0jNNCZ6VZvFB1A=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nNQs3-0003GA-KO
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 25 Feb 2022 03:02:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3217461682;
 Fri, 25 Feb 2022 03:02:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B08AC340E9;
 Fri, 25 Feb 2022 03:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645758129;
 bh=GCfS0bK+I5I3lEZQRQftSGQK5WqxhpxFrjnWKkAWjZA=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=QFL8Yh7vbeIGlR+R0CFQftd+sZ0lsyVOTa/808axopWHCppLI/fz9B5pMVGC6tyJ/
 OTl+sMsa7GpoL8UkEwZuUyviAcdDhEiLXgVBVvzQLZNz9Tv7OTDZPZw9mLQR27H6HF
 EFMoPjHpx7AV8+S6Lqhz77vYWI4pG+W8Unem+65NtbY4+Xn3S7zq3OL/uXWoLqDmZT
 JA25uo/FWSH+pDC7c/DM4Qde442vP6+4uypnXZAUcsQdcmsQ+IfVwfcxIVwt9gabXh
 vSLIqsPHoOwlvJN6QFMsT+/zLOg7rveRn1fQIchPaMvoF6gzE7eczFOsUI++GdDvmq
 Bhea/SzC10VXQ==
Message-ID: <5b5e20d1-877f-b321-b341-c0f233ee976c@kernel.org>
Date: Fri, 25 Feb 2022 11:02:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20220127054449.24711-1-chao@kernel.org>
 <YfMVxzdhat01ca7m@google.com>
 <e434b0a4-a66a-eebc-cafc-f0bad03c3fa5@kernel.org>
 <YfSMMpj2GrYXAJK2@google.com>
 <51be77f1-6e85-d46d-d0d3-c06d2055a190@kernel.org>
 <Yfs1KRgwgzSOvocR@google.com>
 <86a175d3-c438-505b-1dbc-4ef6e8b5adcb@kernel.org>
In-Reply-To: <86a175d3-c438-505b-1dbc-4ef6e8b5adcb@kernel.org>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/2/3 22:57, Chao Yu wrote: > On 2022/2/3 9:51, Jaegeuk
 Kim wrote: >> On 01/29, Chao Yu wrote: >>> On 2022/1/29 8:37, Jaegeuk Kim
 wrote: >>>> On 01/28, Chao Yu wrote: >>>>> On 2022/1/28 5:59, Ja [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nNQs3-0003GA-KO
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to avoid potential deadlock
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
Cc: Jing Xia <jing.xia@unisoc.com>, linux-f2fs-devel@lists.sourceforge.net,
 Zhiguo Niu <zhiguo.niu@unisoc.com>, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMi8yLzMgMjI6NTcsIENoYW8gWXUgd3JvdGU6Cj4gT24gMjAyMi8yLzMgOTo1MSwgSmFl
Z2V1ayBLaW0gd3JvdGU6Cj4+IE9uIDAxLzI5LCBDaGFvIFl1IHdyb3RlOgo+Pj4gT24gMjAyMi8x
LzI5IDg6MzcsIEphZWdldWsgS2ltIHdyb3RlOgo+Pj4+IE9uIDAxLzI4LCBDaGFvIFl1IHdyb3Rl
Ogo+Pj4+PiBPbiAyMDIyLzEvMjggNTo1OSwgSmFlZ2V1ayBLaW0gd3JvdGU6Cj4+Pj4+PiBPbiAw
MS8yNywgQ2hhbyBZdSB3cm90ZToKPj4+Pj4+PiBRdW90ZWQgZnJvbSBKaW5nIFhpYSdzIHJlcG9y
dCwgdGhlcmUgaXMgYSBwb3RlbnRpYWwgZGVhZGxvY2sgbWF5IGhhcHBlbgo+Pj4+Pj4+IGJldHdl
ZW4ga3dvcmtlciBhbmQgY2hlY2twb2ludCBhcyBiZWxvdzoKPj4+Pj4+Pgo+Pj4+Pj4+IFtUOndy
aXRlYmFja13CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgW1Q6Y2hlY2twb2ludF0KPj4+
Pj4+PiAtIHdiX3dyaXRlYmFjawo+Pj4+Pj4+IMKgwqDCoCAtIGJsa19zdGFydF9wbHVnCj4+Pj4+
Pj4gYmlvIGNvbnRhaW5zIE5vZGVBIHdhcyBwbHVnZ2VkIGluIHdyaXRlYmFjayB0aHJlYWRzCj4+
Pj4+Pgo+Pj4+Pj4gSSdtIHN0aWxsIHRyeWluZyB0byB1bmRlcnN0YW5kIG1vcmUgcHJlY2lzZWx5
LiBTbywgaG93IGlzIGl0IHBvc3NpYmxlIHRvCj4+Pj4+PiBoYXZlIGJpbyBoYXZpbmcgbm9kZSB3
cml0ZSBpbiB0aGlzIGN1cnJlbnQgY29udGV4dD8KPj4+Pj4KPj4+Pj4gSU1PLCBhZnRlciBhYm92
ZSBibGtfc3RhcnRfcGx1ZygpLCBpdCBtYXkgcGx1ZyBzb21lIGlub2RlJ3Mgbm9kZSBwYWdlIGlu
IGt3b3JrZXIKPj4+Pj4gZHVyaW5nIHdyaXRlYmFja2luZyBub2RlX2lub2RlJ3MgZGF0YSBwYWdl
ICh3aGljaCBzaG91bGQgYmUgbm9kZSBwYWdlKT8KPj4+Pgo+Pj4+IFdhc24ndCB0aGF0IGFkZGVk
IGludG8gYSBkaWZmZXJlbnQgdGFzay0+cGx1Zz8KPj4+Cj4+PiBJJ20gbm90IHN1cmUgSSd2ZSBn
b3QgeW91ciBjb25jZXJuIGNvcnJlY3RseS4uLgo+Pj4KPj4+IERvIHlvdSBtZWFuIE5vZGVBIGFu
ZCBvdGhlciBJT3MgZnJvbSBkb193cml0ZXBhZ2VzKCkgd2VyZSBwbHVnZ2VkIGluCj4+PiBkaWZm
ZXJlbnQgbG9jYWwgcGx1ZyB2YXJpYWJsZXM/Cj4+Cj4+IEkgdGhpbmsgc28uCj4gCj4gSSBndWVz
cyBibG9jayBwbHVnIGhlbHBlciBzYXlzIGl0IGRvZXNuJ3QgYWxsb3cgdG8gdXNlIG5lc3RlZCBw
bHVnLCBzbyB0aGVyZQo+IGlzIG9ubHkgb25lIHBsdWcgaW4ga3dvcmtlciB0aHJlYWQ/Cj4gCj4g
dm9pZCBibGtfc3RhcnRfcGx1Z19ucl9pb3Moc3RydWN0IGJsa19wbHVnICpwbHVnLCB1bnNpZ25l
ZCBzaG9ydCBucl9pb3MpCj4gewo+ICDCoMKgwqDCoHN0cnVjdCB0YXNrX3N0cnVjdCAqdHNrID0g
Y3VycmVudDsKPiAKPiAgwqDCoMKgwqAvKgo+ICDCoMKgwqDCoCAqIElmIHRoaXMgaXMgYSBuZXN0
ZWQgcGx1ZywgZG9uJ3QgYWN0dWFsbHkgYXNzaWduIGl0Lgo+ICDCoMKgwqDCoCAqLwo+ICDCoMKg
wqDCoGlmICh0c2stPnBsdWcpCj4gIMKgwqDCoMKgwqDCoMKgIHJldHVybjsKPiAuLi4KPiB9CgpB
bnkgZnVydGhlciBjb21tZW50cz8KClRoYW5rcywKCj4gCj4gVGhhbmtzLAo+IAo+Pgo+Pj4KPj4+
IFRoYW5rcywKPj4+Cj4+Pj4KPj4+Pj4KPj4+Pj4gVGhhbmtzLAo+Pj4+Pgo+Pj4+Pj4KPj4+Pj4+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIGRvX3dyaXRlcGFnZXPC
oCAtLSBzeW5jIHdyaXRlIGlub2RlQiwgaW5jIHdiX3N5bmNfcmVxW0RBVEFdCj4+Pj4+Pj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIGYyZnNfd3JpdGVfZGF0YV9w
YWdlcwo+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAt
IGYyZnNfd3JpdGVfc2luZ2xlX2RhdGFfcGFnZSAtLSB3cml0ZSBsYXN0IGRpcnR5IHBhZ2UKPj4+
Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIGYyZnNf
ZG9fd3JpdGVfZGF0YV9wYWdlCj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAtIHNldF9wYWdlX3dyaXRlYmFja8KgIC0tIGNsZWFyIHBhZ2UgZGly
dHkgZmxhZyBhbmQKPj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIFBBR0VDQUNIRV9UQUdfRElSVFkgdGFnIGluIHJhZGl4IHRyZWUKPj4+Pj4+PiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gZjJmc19vdXRw
bGFjZV93cml0ZV9kYXRhCj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIC0gZjJmc191cGRhdGVfZGF0YV9ibGthZGRyCj4+Pj4+Pj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBmMmZzX3dhaXRf
b25fcGFnZV93cml0ZWJhY2sgLS0gd2FpdCBOb2RlQSB0byB3cml0ZWJhY2sgaGVyZQo+Pj4+Pj4+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gaW5vZGVfZGVj
X2RpcnR5X3BhZ2VzCj4+Pj4+Pj4gwqDCoMKgIC0gd3JpdGViYWNrX3NiX2lub2Rlcwo+Pj4+Pj4+
IMKgwqDCoMKgIC0gd3JpdGViYWNrX3NpbmdsZV9pbm9kZQo+Pj4+Pj4+IMKgwqDCoMKgwqAgLSBk
b193cml0ZXBhZ2VzCj4+Pj4+Pj4gwqDCoMKgwqDCoMKgIC0gZjJmc193cml0ZV9kYXRhX3BhZ2Vz
IC0tIHNraXAgd3JpdGVwYWdlcyBkdWUgdG8gd2Jfc3luY19yZXFbREFUQV0KPj4+Pj4+PiDCoMKg
wqDCoMKgwqDCoCAtIHdiYy0+cGFnZXNfc2tpcHBlZCArPSBnZXRfZGlydHlfcGFnZXMoKSAtLSBQ
QUdFQ0FDSEVfVEFHX0RJUlRZIGlzIG5vdCBzZXQgYnV0IGdldF9kaXJ0eV9wYWdlcygpIHJldHVy
bnMgb25lCj4+Pj4+Pj4gwqDCoMKgwqAgLSByZXF1ZXVlX2lub2RlIC0tIHJlcXVldWUgaW5vZGUg
dG8gd2ItPmJfZGlydHkgcXVldWUgZHVlIHRvIG5vbi16ZXJvLnBhZ2VzX3NraXBwZWQKPj4+Pj4+
PiDCoMKgwqAgLSBibGtfZmluaXNoX3BsdWcKPj4+Pj4+Pgo+Pj4+Pj4+IExldCdzIHRyeSB0byBh
dm9pZCBkZWFkbG9jayBjb25kaXRpb24gYnkgZm9yY2luZyB1bnBsdWdnaW5nIHByZXZpb3VzIGJp
byB2aWEKPj4+Pj4+PiBibGtfZmluaXNoX3BsdWcoY3VycmVudC0+cGx1Zykgb25jZSB3ZSd2IHNr
aXBwZWQgd3JpdGViYWNrIGluIHdyaXRlcGFnZXMoKQo+Pj4+Pj4+IGR1ZSB0byB2YWxpZCBzYmkt
PndiX3N5bmNfcmVxW0RBVEEvTk9ERV0uCj4+Pj4+Pj4KPj4+Pj4+PiBGaXhlczogNjg3ZGU3ZjEw
MTBjICgiZjJmczogYXZvaWQgSU8gc3BsaXQgZHVlIHRvIG1peGVkIFdCX1NZTkNfQUxMIGFuZCBX
Ql9TWU5DX05PTkUiKQo+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFpoaWd1byBOaXUgPHpoaWd1by5u
aXVAdW5pc29jLmNvbT4KPj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBKaW5nIFhpYSA8amluZy54aWFA
dW5pc29jLmNvbT4KPj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBDaGFvIFl1IDxjaGFvQGtlcm5lbC5v
cmc+Cj4+Pj4+Pj4gLS0tCj4+Pj4+Pj4gwqDCoMKgIGZzL2YyZnMvZGF0YS5jIHwgNiArKysrKy0K
Pj4+Pj4+PiDCoMKgwqAgZnMvZjJmcy9ub2RlLmMgfCA2ICsrKysrLQo+Pj4+Pj4+IMKgwqDCoCAy
IGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4+Pj4+Pj4K
Pj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9kYXRhLmMgYi9mcy9mMmZzL2RhdGEuYwo+Pj4+
Pj4+IGluZGV4IDc2ZDZmZTdiMGM4Zi4uOTMyYTRjODFhY2FmIDEwMDY0NAo+Pj4+Pj4+IC0tLSBh
L2ZzL2YyZnMvZGF0YS5jCj4+Pj4+Pj4gKysrIGIvZnMvZjJmcy9kYXRhLmMKPj4+Pj4+PiBAQCAt
MzE3NCw4ICszMTc0LDEyIEBAIHN0YXRpYyBpbnQgX19mMmZzX3dyaXRlX2RhdGFfcGFnZXMoc3Ry
dWN0IGFkZHJlc3Nfc3BhY2UgKm1hcHBpbmcsCj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqAgLyogdG8g
YXZvaWQgc3BsaXRpbmcgSU9zIGR1ZSB0byBtaXhlZCBXQl9TWU5DX0FMTCBhbmQgV0JfU1lOQ19O
T05FICovCj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqAgaWYgKHdiYy0+c3luY19tb2RlID09IFdCX1NZ
TkNfQUxMKQo+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYXRvbWljX2luYygmc2JpLT53
Yl9zeW5jX3JlcVtEQVRBXSk7Cj4+Pj4+Pj4gLcKgwqDCoCBlbHNlIGlmIChhdG9taWNfcmVhZCgm
c2JpLT53Yl9zeW5jX3JlcVtEQVRBXSkpCj4+Pj4+Pj4gK8KgwqDCoCBlbHNlIGlmIChhdG9taWNf
cmVhZCgmc2JpLT53Yl9zeW5jX3JlcVtEQVRBXSkpIHsKPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAg
LyogdG8gYXZvaWQgcG90ZW50aWFsIGRlYWRsb2NrICovCj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKg
IGlmIChjdXJyZW50LT5wbHVnKQo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJsa19m
aW5pc2hfcGx1ZyhjdXJyZW50LT5wbHVnKTsKPj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGdvdG8gc2tpcF93cml0ZTsKPj4+Pj4+PiArwqDCoMKgIH0KPj4+Pj4+PiDCoMKgwqDCoMKgwqDC
oCBpZiAoX19zaG91bGRfc2VyaWFsaXplX2lvKGlub2RlLCB3YmMpKSB7Cj4+Pj4+Pj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBtdXRleF9sb2NrKCZzYmktPndyaXRlcGFnZXMpOwo+Pj4+Pj4+IGRp
ZmYgLS1naXQgYS9mcy9mMmZzL25vZGUuYyBiL2ZzL2YyZnMvbm9kZS5jCj4+Pj4+Pj4gaW5kZXgg
NTU2ZmNkODQ1N2YzLi42OWM2YmNhZjVhYWUgMTAwNjQ0Cj4+Pj4+Pj4gLS0tIGEvZnMvZjJmcy9u
b2RlLmMKPj4+Pj4+PiArKysgYi9mcy9mMmZzL25vZGUuYwo+Pj4+Pj4+IEBAIC0yMTA2LDggKzIx
MDYsMTIgQEAgc3RhdGljIGludCBmMmZzX3dyaXRlX25vZGVfcGFnZXMoc3RydWN0IGFkZHJlc3Nf
c3BhY2UgKm1hcHBpbmcsCj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqAgaWYgKHdiYy0+c3luY19tb2Rl
ID09IFdCX1NZTkNfQUxMKQo+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYXRvbWljX2lu
Yygmc2JpLT53Yl9zeW5jX3JlcVtOT0RFXSk7Cj4+Pj4+Pj4gLcKgwqDCoCBlbHNlIGlmIChhdG9t
aWNfcmVhZCgmc2JpLT53Yl9zeW5jX3JlcVtOT0RFXSkpCj4+Pj4+Pj4gK8KgwqDCoCBlbHNlIGlm
IChhdG9taWNfcmVhZCgmc2JpLT53Yl9zeW5jX3JlcVtOT0RFXSkpIHsKPj4+Pj4+PiArwqDCoMKg
wqDCoMKgwqAgLyogdG8gYXZvaWQgcG90ZW50aWFsIGRlYWRsb2NrICovCj4+Pj4+Pj4gK8KgwqDC
oMKgwqDCoMKgIGlmIChjdXJyZW50LT5wbHVnKQo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGJsa19maW5pc2hfcGx1ZyhjdXJyZW50LT5wbHVnKTsKPj4+Pj4+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGdvdG8gc2tpcF93cml0ZTsKPj4+Pj4+PiArwqDCoMKgIH0KPj4+Pj4+PiDCoMKg
wqDCoMKgwqDCoCB0cmFjZV9mMmZzX3dyaXRlcGFnZXMobWFwcGluZy0+aG9zdCwgd2JjLCBOT0RF
KTsKPj4+Pj4+PiAtLSAKPj4+Pj4+PiAyLjMyLjAKPiAKPiAKPiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBs
aXN0Cj4gTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPiBodHRwczovL2xp
c3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1k
ZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQK
aHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1k
ZXZlbAo=
