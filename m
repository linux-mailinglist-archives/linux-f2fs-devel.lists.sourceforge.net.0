Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6713D36A1
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Jul 2021 10:25:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m6qV6-0005nJ-MP; Fri, 23 Jul 2021 08:25:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <changfengnan@vivo.com>) id 1m6qQk-0005ic-Hd
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 23 Jul 2021 08:21:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IQidftHMEFcDek4zENXfiKmcDuJJNyCMBQrUv/9rylE=; b=Uxz2Ddxqxcv899yKIIYEDszqyK
 XhC29Ds1LVEyx5zo8Dy4KN9RYhubPgQggEnlIJ1QCA9BL1snEXjSBxJZ9o6mtNL6jb2YlTy4NVYEB
 fiSCGdg6A2fi4aie3PKmRasqHf1qpzNTHhhhihRf3nQyuMGqhdKC2egnGVShSCPEck8g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IQidftHMEFcDek4zENXfiKmcDuJJNyCMBQrUv/9rylE=; b=EduUuMwNGuZurocxAybmV7i86e
 k/QNQHEQadVMHUTKxnZe8BpKWNF1BZMBnYWD/HLsd7zV1vscA0wpucsQWnWblTy2jCQXXDLZ/Ciuh
 Lx7bkeaAZqRm62lZX0eHZ+oyJzqkAkkCEmbiyQus41vryy23lxuYp7G+1/An5RPUnstQ=;
Received: from mail-m121144.qiye.163.com ([115.236.121.144])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m6qQW-0006SC-Gr
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 23 Jul 2021 08:21:14 +0000
DKIM-Signature: a=rsa-sha256;
 b=ciLI+/2f9WgfBUVWwkk+hTovANWv3CBQ5aPNTPbevIu6Pj6MJK3dd8D9JV/Rf0146Mr4ycTmELovAOesOQl0Cmv38L2zg0n3kjUQjC6x8PYcyehggrN1LiNsB4Pwd5yzEQFLssVF0Ra8hCGsRDnQKS0SoHjTJ0aiOdTxjfcBuRE=;
 c=relaxed/relaxed; s=default; d=vivo.com; v=1;
 bh=IQidftHMEFcDek4zENXfiKmcDuJJNyCMBQrUv/9rylE=;
 h=date:mime-version:subject:message-id:from;
Received: from [172.25.44.145] (unknown [58.251.74.232])
 by mail-m121144.qiye.163.com (Hmail) with ESMTPA id 4B6F6AC02CC;
 Fri, 23 Jul 2021 16:20:53 +0800 (CST)
To: Chao Yu <chao@kernel.org>, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20210722034729.231855-1-changfengnan@vivo.com>
 <58f5c3c2-ef99-1592-8dbd-1a56ce2eeda3@kernel.org>
 <6f8aa853-e65c-9f4e-8a31-5d13a2cde19d@vivo.com>
 <6d903ed9-469e-7bab-12bd-c47564a20ce0@kernel.org>
From: Fengnan Chang <changfengnan@vivo.com>
Message-ID: <21c65c92-b029-9409-a0ea-085b04da8547@vivo.com>
Date: Fri, 23 Jul 2021 16:20:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <6d903ed9-469e-7bab-12bd-c47564a20ce0@kernel.org>
Content-Language: en-US
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
 kWDxoPAgseWUFZKDYvK1lXWShZQUhPN1dZLVlBSVdZDwkaFQgSH1lBWUJNHhlWTUtNGhoaSR8ZHU
 9OVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktISkxVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Kz46Cgw*DT9WUUkaNDI3GFZN
 NwlPCRxVSlVKTUlMS0lDT05IQk9JVTMWGhIXVRgTGhUcHR4VHBUaFTsNEg0UVRgUFkVZV1kSC1lB
 WU5DVUlOSlVMT1VJSElZV1kIAVlBTU9PQjcG
X-HM-Tid: 0a7ad273f876b039kuuu4b6f6ac02cc
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [115.236.121.144 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [115.236.121.144 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.1 DKIM_INVALID           DKIM or DK signature exists, but is not valid
 -0.2 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1m6qQW-0006SC-Gr
Subject: Re: [f2fs-dev] [RFC PATCH] f2fs: compress: reduce one page array
 alloc and free when write compressed page
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

b2ssIGl0IHNlZW1zIHRoZXJlIGlzIG9uZSBwbGFjZSB3YXMgbWlzc2VkLgoKVGhhbmtzLgoKCk9u
IDIwMjEvNy8yMyAxMzoyNiwgQ2hhbyBZdSB3cm90ZToKPiBPbiAyMDIxLzcvMjMgMTE6NTIsIEZl
bmduYW4gQ2hhbmcgd3JvdGU6Cj4+IFNvcnJ5LCBJIGRpZG4ndCBnZXQgeW91ciBwb2ludCwgaW4g
bXkgb3BpbmlvbiwgbmV3X25yX2NwYWdlcyBzaG91bGQKPj4gYWx3YXlzIGxpdHRsZSB0aGFuIG5y
X2NwYWdlcywgaXMgdGhpcyByaWdodD8gU28gd2UgY2FuIGp1c3QgdXNlIGNwYWdlcywKPj4gZG9u
J3QgbmVlZCB0byBhbGxvYyBuZXcgb25lLgo+Pgo+PiBUaGFua3MuCj4+Cj4+Cj4+IE9uIDIwMjEv
Ny8yMiAyMTo1MywgQ2hhbyBZdSB3cm90ZToKPj4+IE9uIDIwMjEvNy8yMiAxMTo0NywgRmVuZ25h
biBDaGFuZyB3cm90ZToKPj4+PiBEb24ndCBhbGxvYyBuZXcgcGFnZSBhcnJheSB0byByZXBsYWNl
IG9sZCwganVzdCB1c2Ugb2xkIHBhZ2UgYXJyYXksIHRyeQo+Pj4+IHRvIHJlZHVjZSBvbmUgcGFn
ZSBhcnJheSBhbGxvYyBhbmQgZnJlZSB3aGVuIHdyaXRlIGNvbXByZXNzIHBhZ2UuCj4+Pgo+Pj4g
Tm9wZSwgc2VlIHdob2xlIHN0b3J5IGluIGJlbG93IGxpbms6Cj4+Pgo+Pj4gaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvcGF0Y2h3b3JrL3BhdGNoLzEzMDUwOTYvCj4+Pgo+Pj4gVGhhbmtzLAo+Pj4K
Pj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IEZlbmduYW4gQ2hhbmcgPGNoYW5nZmVuZ25hbkB2aXZv
LmNvbT4KPj4+PiAtLS0KPj4+PiDCoMKgIGZzL2YyZnMvY29tcHJlc3MuYyB8IDE0ICsrLS0tLS0t
LS0tLS0tCj4+Pj4gwqDCoCBmcy9mMmZzL2YyZnMuaMKgwqDCoMKgIHzCoCAxICsKPj4+PiDCoMKg
IDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKPj4+Pgo+
Pj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2NvbXByZXNzLmMgYi9mcy9mMmZzL2NvbXByZXNzLmMK
Pj4+PiBpbmRleCA0NTU1NjE4MjZjN2QuLjQzZGFhZmUzODJlNyAxMDA2NDQKPj4+PiAtLS0gYS9m
cy9mMmZzL2NvbXByZXNzLmMKPj4+PiArKysgYi9mcy9mMmZzL2NvbXByZXNzLmMKPj4+PiBAQCAt
NjE4LDcgKzYxOCw2IEBAIHN0YXRpYyBpbnQgZjJmc19jb21wcmVzc19wYWdlcyhzdHJ1Y3QgY29t
cHJlc3NfY3R4Cj4+Pj4gKmNjKQo+Pj4+IMKgwqDCoMKgwqDCoCBjb25zdCBzdHJ1Y3QgZjJmc19j
b21wcmVzc19vcHMgKmNvcHMgPQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBmMmZzX2NvcHNbZmktPmlfY29tcHJlc3NfYWxnb3JpdGhtXTsKPj4+PiDCoMKgwqDCoMKg
wqAgdW5zaWduZWQgaW50IG1heF9sZW4sIG5ld19ucl9jcGFnZXM7Cj4+Pj4gLcKgwqDCoCBzdHJ1
Y3QgcGFnZSAqKm5ld19jcGFnZXM7Cj4+Pj4gwqDCoMKgwqDCoMKgIHUzMiBjaGtzdW0gPSAwOwo+
Pj4+IMKgwqDCoMKgwqDCoCBpbnQgaSwgcmV0Owo+Pj4+IEBAIC02MzMsNiArNjMyLDcgQEAgc3Rh
dGljIGludCBmMmZzX2NvbXByZXNzX3BhZ2VzKHN0cnVjdCBjb21wcmVzc19jdHgKPj4+PiAqY2Mp
Cj4+Pj4gwqDCoMKgwqDCoMKgIG1heF9sZW4gPSBDT01QUkVTU19IRUFERVJfU0laRSArIGNjLT5j
bGVuOwo+Pj4+IMKgwqDCoMKgwqDCoCBjYy0+bnJfY3BhZ2VzID0gRElWX1JPVU5EX1VQKG1heF9s
ZW4sIFBBR0VfU0laRSk7Cj4+Pj4gK8KgwqDCoCBjYy0+cmF3X25yX2NwYWdlcyA9IGNjLT5ucl9j
cGFnZXM7Cj4gCj4gSWYgcmF3X25yX2NwYWdzIGlzIHVzZWQgdG8gc3RvcmUgb3JpZ2luYWwgbnJf
Y3BhZ2VzLCB3ZSBuZWVkIHRvIGNhbGwKPiBwYWdlX2FycmF5X2ZyZWUoLCBjYy0+Y3BhZ2VzLCBj
Yy0+cmF3X25yX2NwYWdlcykgaW4gYWxsIHBsYWNlcywgY2FuIHlvdQo+IHBsZWFzZSBjaGVjayB3
aGV0aGVyIHRoaXMgYXJlIGFueSBtaXNzZWQgY2FzZXM/Cj4gCj4gVGhhbmtzLAo+IAo+Pj4+IMKg
wqDCoMKgwqDCoCBjYy0+Y3BhZ2VzID0gcGFnZV9hcnJheV9hbGxvYyhjYy0+aW5vZGUsIGNjLT5u
cl9jcGFnZXMpOwo+Pj4+IMKgwqDCoMKgwqDCoCBpZiAoIWNjLT5jcGFnZXMpIHsKPj4+PiBAQCAt
NjgzLDEzICs2ODMsNiBAQCBzdGF0aWMgaW50IGYyZnNfY29tcHJlc3NfcGFnZXMoc3RydWN0Cj4+
Pj4gY29tcHJlc3NfY3R4ICpjYykKPj4+PiDCoMKgwqDCoMKgwqAgbmV3X25yX2NwYWdlcyA9IERJ
Vl9ST1VORF9VUChjYy0+Y2xlbiArIENPTVBSRVNTX0hFQURFUl9TSVpFLAo+Pj4+IFBBR0VfU0la
RSk7Cj4+Pj4gLcKgwqDCoCAvKiBOb3cgd2UncmUgZ29pbmcgdG8gY3V0IHVubmVjZXNzYXJ5IHRh
aWwgcGFnZXMgKi8KPj4+PiAtwqDCoMKgIG5ld19jcGFnZXMgPSBwYWdlX2FycmF5X2FsbG9jKGNj
LT5pbm9kZSwgbmV3X25yX2NwYWdlcyk7Cj4+Pj4gLcKgwqDCoCBpZiAoIW5ld19jcGFnZXMpIHsK
Pj4+PiAtwqDCoMKgwqDCoMKgwqAgcmV0ID0gLUVOT01FTTsKPj4+PiAtwqDCoMKgwqDCoMKgwqAg
Z290byBvdXRfdnVubWFwX2NidWY7Cj4+Pj4gLcKgwqDCoCB9Cj4+Pj4gLQo+Pj4+IMKgwqDCoMKg
wqDCoCAvKiB6ZXJvIG91dCBhbnkgdW51c2VkIHBhcnQgb2YgdGhlIGxhc3QgcGFnZSAqLwo+Pj4+
IMKgwqDCoMKgwqDCoCBtZW1zZXQoJmNjLT5jYnVmLT5jZGF0YVtjYy0+Y2xlbl0sIDAsCj4+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAobmV3X25yX2NwYWdlcyAqIFBBR0VfU0laRSkg
LQo+Pj4+IEBAIC03MDAsNyArNjkzLDYgQEAgc3RhdGljIGludCBmMmZzX2NvbXByZXNzX3BhZ2Vz
KHN0cnVjdCBjb21wcmVzc19jdHgKPj4+PiAqY2MpCj4+Pj4gwqDCoMKgwqDCoMKgIGZvciAoaSA9
IDA7IGkgPCBjYy0+bnJfY3BhZ2VzOyBpKyspIHsKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCBp
ZiAoaSA8IG5ld19ucl9jcGFnZXMpIHsKPj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBuZXdf
Y3BhZ2VzW2ldID0gY2MtPmNwYWdlc1tpXTsKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGNvbnRpbnVlOwo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0KPj4+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBmMmZzX2NvbXByZXNzX2ZyZWVfcGFnZShjYy0+Y3BhZ2VzW2ldKTsKPj4+PiBA
QCAtNzEwLDggKzcwMiw2IEBAIHN0YXRpYyBpbnQgZjJmc19jb21wcmVzc19wYWdlcyhzdHJ1Y3Qg
Y29tcHJlc3NfY3R4Cj4+Pj4gKmNjKQo+Pj4+IMKgwqDCoMKgwqDCoCBpZiAoY29wcy0+ZGVzdHJv
eV9jb21wcmVzc19jdHgpCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29wcy0+ZGVzdHJveV9j
b21wcmVzc19jdHgoY2MpOwo+Pj4+IC3CoMKgwqAgcGFnZV9hcnJheV9mcmVlKGNjLT5pbm9kZSwg
Y2MtPmNwYWdlcywgY2MtPm5yX2NwYWdlcyk7Cj4+Pj4gLcKgwqDCoCBjYy0+Y3BhZ2VzID0gbmV3
X2NwYWdlczsKPj4+PiDCoMKgwqDCoMKgwqAgY2MtPm5yX2NwYWdlcyA9IG5ld19ucl9jcGFnZXM7
Cj4+Pj4gwqDCoMKgwqDCoMKgIHRyYWNlX2YyZnNfY29tcHJlc3NfcGFnZXNfZW5kKGNjLT5pbm9k
ZSwgY2MtPmNsdXN0ZXJfaWR4LAo+Pj4+IEBAIC0xMzMwLDcgKzEzMjAsNyBAQCBzdGF0aWMgaW50
IGYyZnNfd3JpdGVfY29tcHJlc3NlZF9wYWdlcyhzdHJ1Y3QKPj4+PiBjb21wcmVzc19jdHggKmNj
LAo+Pj4+IMKgwqDCoMKgwqDCoCBzcGluX3VubG9jaygmZmktPmlfc2l6ZV9sb2NrKTsKPj4+PiDC
oMKgwqDCoMKgwqAgZjJmc19wdXRfcnBhZ2VzKGNjKTsKPj4+PiAtwqDCoMKgIHBhZ2VfYXJyYXlf
ZnJlZShjYy0+aW5vZGUsIGNjLT5jcGFnZXMsIGNjLT5ucl9jcGFnZXMpOwo+Pj4+ICvCoMKgwqAg
cGFnZV9hcnJheV9mcmVlKGNjLT5pbm9kZSwgY2MtPmNwYWdlcywgY2MtPnJhd19ucl9jcGFnZXMp
Owo+Pj4+IMKgwqDCoMKgwqDCoCBjYy0+Y3BhZ2VzID0gTlVMTDsKPj4+PiDCoMKgwqDCoMKgwqAg
ZjJmc19kZXN0cm95X2NvbXByZXNzX2N0eChjYywgZmFsc2UpOwo+Pj4+IMKgwqDCoMKgwqDCoCBy
ZXR1cm4gMDsKPj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9mMmZzLmggYi9mcy9mMmZzL2YyZnMu
aAo+Pj4+IGluZGV4IDg2N2YyYzVkOTU1OS4uOGIxZjg0ZDg4YTY1IDEwMDY0NAo+Pj4+IC0tLSBh
L2ZzL2YyZnMvZjJmcy5oCj4+Pj4gKysrIGIvZnMvZjJmcy9mMmZzLmgKPj4+PiBAQCAtMTQ1NCw2
ICsxNDU0LDcgQEAgc3RydWN0IGNvbXByZXNzX2N0eCB7Cj4+Pj4gwqDCoMKgwqDCoMKgIHVuc2ln
bmVkIGludCBucl9ycGFnZXM7wqDCoMKgwqDCoMKgwqAgLyogdG90YWwgcGFnZSBudW1iZXIgaW4g
cnBhZ2VzICovCj4+Pj4gwqDCoMKgwqDCoMKgIHN0cnVjdCBwYWdlICoqY3BhZ2VzO8KgwqDCoMKg
wqDCoMKgIC8qIHBhZ2VzIHN0b3JlIGNvbXByZXNzZWQgZGF0YSBpbgo+Pj4+IGNsdXN0ZXIgKi8K
Pj4+PiDCoMKgwqDCoMKgwqAgdW5zaWduZWQgaW50IG5yX2NwYWdlczvCoMKgwqDCoMKgwqDCoCAv
KiB0b3RhbCBwYWdlIG51bWJlciBpbiBjcGFnZXMgKi8KPj4+PiArwqDCoMKgIHVuc2lnbmVkIGlu
dCByYXdfbnJfY3BhZ2VzO8KgwqDCoCAvKiBtYXggdG90YWwgcGFnZSBudW1iZXIgaW4gCj4+Pj4g
Y3BhZ2VzICovCj4+Pj4gwqDCoMKgwqDCoMKgIHZvaWQgKnJidWY7wqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAvKiB2aXJ0dWFsIG1hcHBlZCBhZGRyZXNzIG9uIHJwYWdlcyAqLwo+Pj4+IMKgwqDCoMKg
wqDCoCBzdHJ1Y3QgY29tcHJlc3NfZGF0YSAqY2J1ZjvCoMKgwqAgLyogdmlydHVhbCBtYXBwZWQg
YWRkcmVzcyBvbgo+Pj4+IGNwYWdlcyAqLwo+Pj4+IMKgwqDCoMKgwqDCoCBzaXplX3QgcmxlbjvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIHZhbGlkIGRhdGEgbGVuZ3RoIGluIHJidWYgKi8KPj4+
Pgo+Pj4KPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNv
dXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5m
by9saW51eC1mMmZzLWRldmVsCg==
