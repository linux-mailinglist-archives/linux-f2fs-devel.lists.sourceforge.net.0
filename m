Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7C43E9CBF
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Aug 2021 04:55:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mE0sa-0000HF-TY; Thu, 12 Aug 2021 02:55:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <bo.wu@vivo.com>) id 1mE0sa-0000H9-DC
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 Aug 2021 02:55:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9Mbz24TNO7Gub2tHIi6skAq1WJSguE/hScoR0PgzM2w=; b=NSKv+KgoNL/rZRQLGA4LFbFsuV
 EBSrm3q7qnoYj/Yc+CPcU8ef10WFpVItRldS4U7c3NNNmvplov4G0bLVRCusapnCZLlbQ82lb54rv
 wa+wZM6vy9KlCrhYEBadosNmuApZmH7uH/dgQgTuKZG5q07XxhiHlgvXexYGJtw646e0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9Mbz24TNO7Gub2tHIi6skAq1WJSguE/hScoR0PgzM2w=; b=VYYfA/3Gc3FHCQkdWMhFG1qPqv
 Z2WxiwJOFz82WKN4UKnFCJmrvWfRlesW/R5VC2KTCD9mEpS8Z6YilKBaLaKHhAeo7wLYNJ/0da1FC
 xMmZJq2JNfHkDWG8ISgM5H7K1RG6WFeu4G82HZmpR3Wc/Pd0WhPdu/7TU28JU9yhyp5w=;
Received: from mail-m17656.qiye.163.com ([59.111.176.56])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mE0sW-003gNK-QC
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 Aug 2021 02:55:36 +0000
Received: from [172.25.45.51] (unknown [58.250.176.229])
 by mail-m17656.qiye.163.com (Hmail) with ESMTPA id 1A1E6C400FE;
 Thu, 12 Aug 2021 10:55:25 +0800 (CST)
To: Chao Yu <chao@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <5b68208b-fd94-bf4e-fc4b-d79d13abf1c6@vivo.com>
 <6519b8b7-1eb0-f286-7593-5c5ebbfb5554@kernel.org>
 <86e53ee7-13b5-5e8e-7c81-acb1736ebc8b@vivo.com>
 <aa5f3225-6409-bc62-1021-107a18040384@kernel.org>
From: Wu Bo <bo.wu@vivo.com>
Message-ID: <df31a4be-55af-5944-77c8-a09daba02ccb@vivo.com>
Date: Thu, 12 Aug 2021 10:55:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <aa5f3225-6409-bc62-1021-107a18040384@kernel.org>
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
 kWDxoPAgseWUFZKDYvK1lXWShZQUhPN1dZLVlBSVdZDwkaFQgSH1lBWRpMTh9WSx5DT0pDT05ISx
 pIVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktITUpVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NUk6PAw4IT9CLSEhPTFPOQEN
 IR4aCi1VSlVKTUlDTEhNQklOTUhCVTMWGhIXVRkUVQwOOw0SDRRVGBQWRVlXWRILWUFZTkNVSU5L
 VUpMTVVJSUJZV1kIAVlBTkpKTjcG
X-HM-Tid: 0a7b38492e16da02kuws1a1e6c400fe
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: code.so]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [59.111.176.56 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [59.111.176.56 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1mE0sW-003gNK-QC
Subject: Re: [f2fs-dev] f2fs do DIO write make file corruption
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

CuWcqCAyMDIxLzgvMTEgMjA6NTcsIENoYW8gWXUg5YaZ6YGTOgo+IE9uIDIwMjEvOC8xMSAxMToy
OCwgV3UgQm8gd3JvdGU6Cj4+Cj4+IOWcqCAyMDIxLzgvMTEgMTE6MDMsIENoYW8gWXUg5YaZ6YGT
Ogo+Pj4gT24gMjAyMS84LzExIDEwOjQ4LCBXdSBCbyB3cm90ZToKPj4+PiBJIHVzZSB0aGUgZm9s
bG93aW5nIGNvbW1hbmQgdG8gY3JlYXRlIGEgZmlsZSwgdGhlIGZpbGUgbWF5IGdvdAo+Pj4+IGNv
cnJ1cHRpb246Cj4+Pj4gwqDCoMKgwqDCoGYyZnNfaW8gd3JpdGUgMiAwIDUxMiBpbmNfbnVtIGRp
byAkcGF0aAo+Pj4+Cj4+Pj4gQW5kIHdoZW4gSSB1c2UgYmlvIG9yIHRvIHNldCB0aGUgY2h1bmsg
c2l6ZSB0byAxIGJsb2NrLCB0aGUgZmlsZSBpcwo+Pj4+IG5vcm1hbC4gVGhlIGNvbW1hbmRzIGFz
IGZvbGxvd2luZzoKPj4+PiDCoMKgwqDCoMKgZjJmc19pbyB3cml0ZSAyIDAgNTEyIGluY19udW0g
YnVmZmVyZWQgJHBhdGgKPj4+PiDCoMKgwqDCoMKgZjJmc19pbyB3cml0ZSAxIDAgNTEyIGluY19u
dW0gZGlvICRwYXRoCj4+Pj4KPj4+PiBJIGZpbmQgdGhpcyBidWcgb24gb2xkIGtlcm5lbCB2ZXJz
aW9uIDQuMTQuMTE3LCBhbmQgbm90IGZpbmQgb24gdmVyc2lvbgo+Pj4+IDQuMTkuMTUyLiBTbyB0
aGlzIGJ1ZyBpcyBmaXhlZC4gQ2FuIGFueW9uZSBjYW4gdGVsbCBtZSB3aGljaCBwYXRjaCAKPj4+
PiBmaXhlZAo+Pj4+IHRoaXMgYnVnPwo+Pj4KPj4+IE5vdCBzdXJlLAo+Pj4KPj4+IGh0dHBzOi8v
Z2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3N0YWJsZS9saW51eC5naXQv
Y29tbWl0Lz9oPWxpbnV4LTQuMTkueSZpZD03YmFlOGI2YjczZTQ2YzMwN2ZhMzU1Y2UwODY4MDBi
N2FkNjYxMGY4IAo+Pj4KPiAKPiBJIGRpZG4ndCBzZWUgdGhpcyBwYXRjaCBpbiA0LjE0IHN0YWJs
ZSBrZXJuZWwgb2YgbWFpbGluZSwgc28gZG8geW91IG1lYW4gCj4gNC4xNCBrZXJuZWwKPiBtYWlu
dGFpbmVkIGJ5IEFuZHJvaWQ/Cj4gCj4gSWYgc28sIGYyZnMgY29kZXMgaW4gYmV0d2VlbiA0LjE0
IGFuZCA0LjE5IEFuZHJvaWQga2VybmVsIGFyZSBhbG1vc3QgdGhlIAo+IHNhbWUsCj4gc2VlIGJl
bG93IGxpbms6Cj4gCj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5l
bC9naXQvamFlZ2V1ay9mMmZzLXN0YWJsZS5naXQvCj4gCgpTb3JyeSwgaXQncyBvdXIgb2xkIEFu
ZHJvaWQgcHJvamVjdCBjb2RlLlNvIHRoZSBrZXJuZWwgdmVyc2lvbiBtYXkgaGF2ZSAKbm8gcmVm
ZXJlbmNlIHZhbHVlLgpUaGlzIHByb2plY3QgY29kZSBsYXN0IHN5bmMgdG8gQW5kcm9pZCBjb21t
b24ga2VybmVsIGlzOgoJOWY4OTI0OTZmYzBiOmYyZnM6IHJlYWRhaGVhZCBlbmNyeXB0ZWQgYmxv
Y2sgZHVyaW5nIEdDWzIwMTgtMDktMDVdClRoZSBjb2RlIGxpbmsgaXM6Cmh0dHBzOi8vYW5kcm9p
ZC5nb29nbGVzb3VyY2UuY29tL2tlcm5lbC9jb21tb24vKy85Zjg5MjQ5NmZjMGIKQW5kIGFmdGVy
IHRoYXQsIHdlIGFwcGxpZWQgc29tZSBmaXh1cCBwYXRjaGVzLgoKPiBUaGFua3MsCj4gCj4+Pgo+
Pgo+PiBUaGlzIHBhdGNoIGlzIGFwcGxpZWQuIFRoZSBpc3N1ZSBvY2N1cnMgd2hlbiBmMmZzIGRp
byB0cnkgdG8gcHJlYWxsb2NhdGUKPj4gbXVsdGlwbGUgYmxvY2tzIGFuZCBnb3Qgc2NhdHRlcmVk
IGRpc2sgYmxvY2tzLiBUaGUgbG9nIGFzIGZvbGxvd2luZzoKPj4gwqDCoMKgwqDCoMKgwqAgbXlf
ZjJmc19pby0xMzQyNSBbMDAyXSAuLi4uwqDCoCAzOTUuNTgzNjM3OiBlbDBfaXJxX25ha2VkOgo+
PiAxOnR5cGU6MSxpbm86NDAxMzIsb2ZmOjc2OCxvbGRfYmxrOjAsbmV3X2JsazoxODU3NjQKPj4g
wqDCoMKgwqDCoMKgwqAgbXlfZjJmc19pby0xMzQyNSBbMDAyXSAuLi4uwqDCoCAzOTUuNTgzNzEw
OiBlbDBfaXJxX25ha2VkOgo+PiAxOnR5cGU6MSxpbm86NDAxMzIsb2ZmOjc2OSxvbGRfYmxrOjAs
bmV3X2JsazoyMDU4MjQKPj4gwqDCoMKgwqDCoMKgwqAgbXlfZjJmc19pby0xMzQyNSBbMDAyXSAu
Li4uwqDCoCAzOTUuNTgzNzIxOiBmMmZzX21hcF9ibG9ja3M6IGRldiA9Cj4+ICgyNTksMjMpLCBp
bm8gPSA0MDEzMiwgZmlsZSBvZmZzZXQgPSA3NjgsIHN0YXJ0IGJsa2FkZHIgPSAweDJkNWE0LCBs
ZW4gPQo+PiAweDIsIGVyciA9IDAKPj4gwqDCoMKgwqDCoMKgwqAgbXlfZjJmc19pby0xMzQyNSBb
MDAyXSAuLi4uwqDCoCAzOTUuNTgzNzM1OiBmMmZzX21hcF9ibG9ja3M6IGRldiA9Cj4+ICgyNTks
MjMpLCBpbm8gPSA0MDEzMiwgZmlsZSBvZmZzZXQgPSA3NjgsIHN0YXJ0IGJsa2FkZHIgPSAweDJk
NWE0LCBsZW4gPQo+PiAweDEsIGVyciA9IDAKPj4gwqDCoMKgwqDCoMKgwqAgbXlfZjJmc19pby0x
MzQyNSBbMDAyXSAuLi4uwqDCoCAzOTUuNTgzNzQxOiBmMmZzX21hcF9ibG9ja3M6IGRldiA9Cj4+
ICgyNTksMjMpLCBpbm8gPSA0MDEzMiwgZmlsZSBvZmZzZXQgPSA3NjksIHN0YXJ0IGJsa2FkZHIg
PSAweDMyNDAwLCBsZW4gPQo+PiAweDEsIGVyciA9IDAKPj4KPj4gQW5kIGlmIHRoZSBibG9ja3Mg
YXJlIGNvbnRpbnVvdXNseSwgdGhlIGZpbGUgZGF0YSBpcyBub3JtYWw6Cj4+IMKgwqDCoMKgwqAg
bXlfZjJmc19pby0xMzQyNSBbMDAyXSAuLi4uwqDCoCAzOTUuNTg0MDM3OiBlbDBfaXJxX25ha2Vk
Ogo+PiAxOnR5cGU6MSxpbm86NDAxMzIsb2ZmOjc3MCxvbGRfYmxrOjAsbmV3X2JsazoyMDU4MjUK
Pj4gwqDCoMKgwqDCoMKgwqAgbXlfZjJmc19pby0xMzQyNSBbMDAyXSAuLi4uwqDCoCAzOTUuNTg0
MDY2OiBlbDBfaXJxX25ha2VkOgo+PiAxOnR5cGU6MSxpbm86NDAxMzIsb2ZmOjc3MSxvbGRfYmxr
OjAsbmV3X2JsazoyMDU4MjYKPj4gwqDCoMKgwqDCoMKgwqAgbXlfZjJmc19pby0xMzQyNSBbMDAy
XSAuLi4uwqDCoCAzOTUuNTg0MDc3OiBmMmZzX21hcF9ibG9ja3M6IGRldiA9Cj4+ICgyNTksMjMp
LCBpbm8gPSA0MDEzMiwgZmlsZSBvZmZzZXQgPSA3NzAsIHN0YXJ0IGJsa2FkZHIgPSAweDMyNDAx
LCBsZW4gPQo+PiAweDIsIGVyciA9IDAKPj4gwqDCoMKgwqDCoMKgwqAgbXlfZjJmc19pby0xMzQy
NSBbMDAyXSAuLi4uwqDCoCAzOTUuNTg0MDkxOiBmMmZzX21hcF9ibG9ja3M6IGRldiA9Cj4+ICgy
NTksMjMpLCBpbm8gPSA0MDEzMiwgZmlsZSBvZmZzZXQgPSA3NzAsIHN0YXJ0IGJsa2FkZHIgPSAw
eDMyNDAxLCBsZW4gPQo+PiAweDIsIGVyciA9IDAKPj4KPj4+Cj4+PiBUaGFua3MsCj4+Pgo+Pj4+
Cj4+Pj4KPj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+Pj4+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4+Pj4gTGludXgtZjJmcy1kZXZl
bEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPj4+PiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5l
dC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCj4+Pj4KPj4+Cj4+Cj4+Cj4+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IExpbnV4LWYyZnMt
ZGV2ZWwgbWFpbGluZyBsaXN0Cj4+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2Uu
bmV0Cj4+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4
LWYyZnMtZGV2ZWwKPj4KPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVs
QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0
cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
