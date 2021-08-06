Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D74C3E204F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  6 Aug 2021 02:57:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mBoBK-0001jv-FT; Fri, 06 Aug 2021 00:57:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1mBoBJ-0001jj-32
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 Aug 2021 00:57:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UMxb/sohK5mdhfVp6hOeLUPKwGnmM+TArm5NcOeOeLM=; b=SRSvHEwSU5uUUy9jytpBF9e9di
 UO1B2EsUI4N8EEsSpwbIs/dgg8/P94NbWvriWaThWCIHKaq91PNggIOnw4l0GOkip7zeGIFSF01Ry
 k7JEVP9KkNR2OrtIQhvYXdSswQ2Sjl7jZ6UIROKVJEEYXfBsCBCxqtVjYYcrYwl5nW58=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UMxb/sohK5mdhfVp6hOeLUPKwGnmM+TArm5NcOeOeLM=; b=cvi00vJ+8dLpYp74aQd0rzEkwV
 1VgBCeKjHFWQ8PyMXPYpHopn3qk5MC5vivcB/VQ4iwccO9caTm7Pfn6ydOP+Nl5KqG+aIh3B6cd07
 D0fwoogdGXRfxl5fSWteU4C8vxgXgVOrB81ftTBtyhgK7NIvRiIrOZS77bl1xJM5Ectg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mBoBC-0004tC-NU
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 Aug 2021 00:57:49 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9E61161176;
 Fri,  6 Aug 2021 00:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628211452;
 bh=He2VKEgqovOEL500tUXhU5wdZ820K9rSC+DGxcXARsU=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=ozj32rN36E0Oyo2aLZ9sZhJc/OsG7ETaeIz2tKmVhiNKLUa+5HhEbERvowlkrLPyx
 VAPYwDjqTxJ3REHM+Tcjy5BihLppKti8k5QP6jAiZLkl7veeMEt95M+B4+CE4DtTIC
 b4dtZBwN/Qngrds+z1iSBr17AL05QHPfJqfQmI1Ifeysmz91FaUApBeJLgF5r1PFFS
 fPcpYUXoZeC6VU6bbkRMj78uRRmKTiuvEgA7Ou9z/19Xa8f2WqqcF9dOxE1hepvPRV
 dNlpygJSoD9qZK5g/RuAr/N5kHesOT6yZeGuJb9BlIW0SSlAxKN46t7WXQQx9XZUbS
 9mYUUXLLACz8g==
To: Fengnan Chang <changfengnan@vivo.com>, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20210722032536.150423-1-changfengnan@vivo.com>
 <b2ce8000-226e-6dfa-0052-36cb2faeaf3a@kernel.org>
 <72752bc5-c8b9-43b2-ca82-d7364238649e@vivo.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <1c45e327-00f4-1cc8-b168-9a7b571ba47a@kernel.org>
Date: Fri, 6 Aug 2021 08:57:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <72752bc5-c8b9-43b2-ca82-d7364238649e@vivo.com>
Content-Language: en-US
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mBoBC-0004tC-NU
Subject: Re: [f2fs-dev] [RFC PATCH] f2fs: compress: avoid duplicate counting
 of valid blocks when read compressed file
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

T24gMjAyMS83LzIzIDExOjE4LCBGZW5nbmFuIENoYW5nIHdyb3RlOgo+IGYyZnNfcmVhZF9tdWx0
aV9wYWdlcyB3aWxsIGhhbmRsZe+8jGFsbCB0cnVuY2F0ZSBwYWdlIHdpbGwgYmUgemVybyBvdXQs
Cj4gV2hldGhlciBwYXJ0aWFsIG9yIGFsbCBwYWdlIGluIGNsdXN0ZXIuCj4gCj4gCj4gT24gMjAy
MS83LzIyIDIxOjQ3LCBDaGFvIFl1IHdyb3RlOgo+PiBPbiAyMDIxLzcvMjIgMTE6MjUsIEZlbmdu
YW4gQ2hhbmcgd3JvdGU6Cj4+PiBTaW5jZSBjbHVzdGVyIGlzIGJhc2ljIHVuaXQgb2YgY29tcHJl
c3Npb24sIG9uZSBjbHVzdGVyIGlzIGNvbXByZXNzZWQgb3IKPj4+IG5vdCwgc28gd2UgY2FuIGNh
bGN1bGF0ZSB2YWxpZCBibG9ja3Mgb25seSBmb3IgZmlyc3QgcGFnZSBpbiBjbHVzdGVyLCB0aGUK
Pj4+IG90aGVyIHBhZ2VzIGp1c3Qgc2tpcC4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBGZW5nbmFu
IENoYW5nIDxjaGFuZ2ZlbmduYW5Adml2by5jb20+Cj4+PiAtLS0KPj4+ICDCoCBmcy9mMmZzL2Rh
dGEuYyB8IDEzICsrKysrKystLS0tLS0KPj4+ICDCoCAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRp
b25zKCspLCA2IGRlbGV0aW9ucygtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2RhdGEu
YyBiL2ZzL2YyZnMvZGF0YS5jCj4+PiBpbmRleCBkMmNmNDhjNWEyZTQuLmEwMDk5ZDgzMjlmMCAx
MDA2NDQKPj4+IC0tLSBhL2ZzL2YyZnMvZGF0YS5jCj4+PiArKysgYi9mcy9mMmZzL2RhdGEuYwo+
Pj4gQEAgLTIzMDQsMTIgKzIzMDQsMTMgQEAgc3RhdGljIGludCBmMmZzX21wYWdlX3JlYWRwYWdl
cyhzdHJ1Y3QgaW5vZGUKPj4+ICppbm9kZSwKPj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGlmIChyZXQpCj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGdvdG8gc2V0X2Vycm9yX3BhZ2U7Cj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfQo+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0ID0gZjJmc19pc19jb21wcmVz
c2VkX2NsdXN0ZXIoaW5vZGUsIHBhZ2UtPmluZGV4KTsKPj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGlmIChyZXQgPCAwKQo+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3Rv
IHNldF9lcnJvcl9wYWdlOwo+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZWxzZSBpZiAoIXJl
dCkKPj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byByZWFkX3NpbmdsZV9w
YWdlOwo+Pgo+PiBIb3cgYWJvdXQgdHJ1bmNhdGlvbiByYWNlcyB3aXRoIHJlYWQ/CgpMb29rIGlu
dG8gdGhpcyBhZ2FpbiwgaXQgbG9va3MgZmluZSwgdHJ1bmNhdGlvbiB0cmllcyB0byBncmFiIGFs
bCBwYWdlcyBsb2NrCm9mIGNsdXN0ZXIsIGJ1dCByZWFkYWhlYWQgaGFzIGFscmVhZHkgaGVsZCBz
b21lL2FsbCBvZiB0aGVtLCBzbyB0aGVyZSBpcyBubwpzdWNoIHJhY2UgY29uZGl0aW9uLgoKU28g
Y29tcHJlc3NlZCBjbHVzdGVyIGNhc2UgbG9va3MgZmluZSB0byBtZSwgYnV0IHdlIHN0aWxsIG5l
ZWQgdG8gY2FsbApmMmZzX2lzX2NvbXByZXNzZWRfY2x1c3RlcigpIGV2ZXJ5IHRpbWUgZm9yIG5v
bi1jb21wcmVzc2VkIGNsdXN0ZXIsIGNvdWxkCnlvdSBwbGVhc2UgY2hlY2sgdGhhdCBhcyB3ZWxs
PwoKVGhhbmtzLAoKPj4KPj4gVGhhbmtzLAo+Pgo+Pj4gLQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgaWYgKGNjLmNsdXN0ZXJfaWR4ID09IE5VTExfQ0xVU1RFUikgewo+Pj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXQgPSBmMmZzX2lzX2NvbXByZXNzZWRfY2x1c3Rlcihp
bm9kZSwgcGFnZS0+aW5kZXgpOwo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBp
ZiAocmV0IDwgMCkKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBn
b3RvIHNldF9lcnJvcl9wYWdlOwo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBl
bHNlIGlmICghcmV0KQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGdvdG8gcmVhZF9zaW5nbGVfcGFnZTsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0KPj4+
ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXQgPSBmMmZzX2luaXRfY29tcHJlc3NfY3R4
KCZjYyk7Cj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKHJldCkKPj4+ICDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gc2V0X2Vycm9yX3BhZ2U7Cj4+Pgo+
PgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9y
Z2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4
LWYyZnMtZGV2ZWwK
