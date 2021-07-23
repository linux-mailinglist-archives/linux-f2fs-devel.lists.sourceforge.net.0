Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BDF3D3258
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Jul 2021 05:52:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m6mEc-0007HE-N3; Fri, 23 Jul 2021 03:52:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <changfengnan@vivo.com>) id 1m6mEa-0007H8-52
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 23 Jul 2021 03:52:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bf/MLlrA3Lm/+PTDHJ4a9KgMwbLt880WQa+ZNJbfVgE=; b=Fl4VjBfExxGOcarB/raOffic1A
 pX6BKaLrdB4oTCDXJdI7pMnYih5nvoZFoFbceJat3tM9llj/kuIJmo/O1wuO+3i91zzs8P8rycqq9
 u0REzcf8lTQTl7P4Mt7BYWmKQoOZJvuaOXSDdOtINmdWbNkupwZxkTbN51ejanI5Rj/Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bf/MLlrA3Lm/+PTDHJ4a9KgMwbLt880WQa+ZNJbfVgE=; b=lcng/6Cb5Nsi7mikarWrcFqcmP
 AcAyo8sh3tzRvOjPlOZPcWUX1oWlkrLH7g3II9w50uc0g6WJssQtEut+bQLxm0Pb8NvF4apyoOadj
 DU8KGx7IzgicJ2XtojZAK/BOMg6IgQDk28yzQvV0/DQxhQ0WgjOzw4XzGgTHUt8+cchE=;
Received: from mail-m121144.qiye.163.com ([115.236.121.144])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m6mES-00049V-3k
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 23 Jul 2021 03:52:24 +0000
DKIM-Signature: a=rsa-sha256;
 b=obMdqsErYhqghR7eX5khckFdxxCsRUYlACrlSa1dby7WvRg1P3jZ/tPvMOKMUYTqKq9v8uvY2rF3tl9EEKo+fpHB0hdV8rKU7XOoyttHyoUOI057nXzQueiuphuRlx7TmLi4qr7aRRFsSb9Yz5gRJ0PKkAaPUEtohXdFlDweALI=;
 c=relaxed/relaxed; s=default; d=vivo.com; v=1;
 bh=bf/MLlrA3Lm/+PTDHJ4a9KgMwbLt880WQa+ZNJbfVgE=;
 h=date:mime-version:subject:message-id:from;
Received: from [172.25.44.145] (unknown [58.251.74.232])
 by mail-m121144.qiye.163.com (Hmail) with ESMTPA id 00ADFAC0295;
 Fri, 23 Jul 2021 11:52:08 +0800 (CST)
To: Chao Yu <chao@kernel.org>, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20210722034729.231855-1-changfengnan@vivo.com>
 <58f5c3c2-ef99-1592-8dbd-1a56ce2eeda3@kernel.org>
From: Fengnan Chang <changfengnan@vivo.com>
Message-ID: <6f8aa853-e65c-9f4e-8a31-5d13a2cde19d@vivo.com>
Date: Fri, 23 Jul 2021 11:52:08 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <58f5c3c2-ef99-1592-8dbd-1a56ce2eeda3@kernel.org>
Content-Language: en-US
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
 kWDxoPAgseWUFZKDYvK1lXWShZQUhPN1dZLVlBSVdZDwkaFQgSH1lBWUJJS0NWGE4YQkhCGR1CGk
 keVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktISkxVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6ORQ6Nio*Gj9COkkzLToJTTcx
 H0owCT9VSlVKTUlMS0pJSElCT0lMVTMWGhIXVRgTGhUcHR4VHBUaFTsNEg0UVRgUFkVZV1kSC1lB
 WU5DVUlOSlVMT1VJSElZV1kIAVlBTk1KQzcG
X-HM-Tid: 0a7ad17dee8cb039kuuu00adfac0295
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
X-Headers-End: 1m6mES-00049V-3k
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

U29ycnksIEkgZGlkbid0IGdldCB5b3VyIHBvaW50LCBpbiBteSBvcGluaW9uLCBuZXdfbnJfY3Bh
Z2VzIHNob3VsZCAKYWx3YXlzIGxpdHRsZSB0aGFuIG5yX2NwYWdlcywgaXMgdGhpcyByaWdodD8g
U28gd2UgY2FuIGp1c3QgdXNlIGNwYWdlcywgCmRvbid0IG5lZWQgdG8gYWxsb2MgbmV3IG9uZS4K
ClRoYW5rcy4KCgpPbiAyMDIxLzcvMjIgMjE6NTMsIENoYW8gWXUgd3JvdGU6Cj4gT24gMjAyMS83
LzIyIDExOjQ3LCBGZW5nbmFuIENoYW5nIHdyb3RlOgo+PiBEb24ndCBhbGxvYyBuZXcgcGFnZSBh
cnJheSB0byByZXBsYWNlIG9sZCwganVzdCB1c2Ugb2xkIHBhZ2UgYXJyYXksIHRyeQo+PiB0byBy
ZWR1Y2Ugb25lIHBhZ2UgYXJyYXkgYWxsb2MgYW5kIGZyZWUgd2hlbiB3cml0ZSBjb21wcmVzcyBw
YWdlLgo+IAo+IE5vcGUsIHNlZSB3aG9sZSBzdG9yeSBpbiBiZWxvdyBsaW5rOgo+IAo+IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL3BhdGNod29yay9wYXRjaC8xMzA1MDk2Lwo+IAo+IFRoYW5rcywK
PiAKPj4KPj4gU2lnbmVkLW9mZi1ieTogRmVuZ25hbiBDaGFuZyA8Y2hhbmdmZW5nbmFuQHZpdm8u
Y29tPgo+PiAtLS0KPj4gwqAgZnMvZjJmcy9jb21wcmVzcy5jIHwgMTQgKystLS0tLS0tLS0tLS0K
Pj4gwqAgZnMvZjJmcy9mMmZzLmjCoMKgwqDCoCB8wqAgMSArCj4+IMKgIDIgZmlsZXMgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2Zz
L2YyZnMvY29tcHJlc3MuYyBiL2ZzL2YyZnMvY29tcHJlc3MuYwo+PiBpbmRleCA0NTU1NjE4MjZj
N2QuLjQzZGFhZmUzODJlNyAxMDA2NDQKPj4gLS0tIGEvZnMvZjJmcy9jb21wcmVzcy5jCj4+ICsr
KyBiL2ZzL2YyZnMvY29tcHJlc3MuYwo+PiBAQCAtNjE4LDcgKzYxOCw2IEBAIHN0YXRpYyBpbnQg
ZjJmc19jb21wcmVzc19wYWdlcyhzdHJ1Y3QgY29tcHJlc3NfY3R4IAo+PiAqY2MpCj4+IMKgwqDC
oMKgwqAgY29uc3Qgc3RydWN0IGYyZnNfY29tcHJlc3Nfb3BzICpjb3BzID0KPj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmMmZzX2NvcHNbZmktPmlfY29tcHJlc3NfYWxnb3Jp
dGhtXTsKPj4gwqDCoMKgwqDCoCB1bnNpZ25lZCBpbnQgbWF4X2xlbiwgbmV3X25yX2NwYWdlczsK
Pj4gLcKgwqDCoCBzdHJ1Y3QgcGFnZSAqKm5ld19jcGFnZXM7Cj4+IMKgwqDCoMKgwqAgdTMyIGNo
a3N1bSA9IDA7Cj4+IMKgwqDCoMKgwqAgaW50IGksIHJldDsKPj4gQEAgLTYzMyw2ICs2MzIsNyBA
QCBzdGF0aWMgaW50IGYyZnNfY29tcHJlc3NfcGFnZXMoc3RydWN0IGNvbXByZXNzX2N0eCAKPj4g
KmNjKQo+PiDCoMKgwqDCoMKgIG1heF9sZW4gPSBDT01QUkVTU19IRUFERVJfU0laRSArIGNjLT5j
bGVuOwo+PiDCoMKgwqDCoMKgIGNjLT5ucl9jcGFnZXMgPSBESVZfUk9VTkRfVVAobWF4X2xlbiwg
UEFHRV9TSVpFKTsKPj4gK8KgwqDCoCBjYy0+cmF3X25yX2NwYWdlcyA9IGNjLT5ucl9jcGFnZXM7
Cj4+IMKgwqDCoMKgwqAgY2MtPmNwYWdlcyA9IHBhZ2VfYXJyYXlfYWxsb2MoY2MtPmlub2RlLCBj
Yy0+bnJfY3BhZ2VzKTsKPj4gwqDCoMKgwqDCoCBpZiAoIWNjLT5jcGFnZXMpIHsKPj4gQEAgLTY4
MywxMyArNjgzLDYgQEAgc3RhdGljIGludCBmMmZzX2NvbXByZXNzX3BhZ2VzKHN0cnVjdCAKPj4g
Y29tcHJlc3NfY3R4ICpjYykKPj4gwqDCoMKgwqDCoCBuZXdfbnJfY3BhZ2VzID0gRElWX1JPVU5E
X1VQKGNjLT5jbGVuICsgQ09NUFJFU1NfSEVBREVSX1NJWkUsIAo+PiBQQUdFX1NJWkUpOwo+PiAt
wqDCoMKgIC8qIE5vdyB3ZSdyZSBnb2luZyB0byBjdXQgdW5uZWNlc3NhcnkgdGFpbCBwYWdlcyAq
Lwo+PiAtwqDCoMKgIG5ld19jcGFnZXMgPSBwYWdlX2FycmF5X2FsbG9jKGNjLT5pbm9kZSwgbmV3
X25yX2NwYWdlcyk7Cj4+IC3CoMKgwqAgaWYgKCFuZXdfY3BhZ2VzKSB7Cj4+IC3CoMKgwqDCoMKg
wqDCoCByZXQgPSAtRU5PTUVNOwo+PiAtwqDCoMKgwqDCoMKgwqAgZ290byBvdXRfdnVubWFwX2Ni
dWY7Cj4+IC3CoMKgwqAgfQo+PiAtCj4+IMKgwqDCoMKgwqAgLyogemVybyBvdXQgYW55IHVudXNl
ZCBwYXJ0IG9mIHRoZSBsYXN0IHBhZ2UgKi8KPj4gwqDCoMKgwqDCoCBtZW1zZXQoJmNjLT5jYnVm
LT5jZGF0YVtjYy0+Y2xlbl0sIDAsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIChuZXdf
bnJfY3BhZ2VzICogUEFHRV9TSVpFKSAtCj4+IEBAIC03MDAsNyArNjkzLDYgQEAgc3RhdGljIGlu
dCBmMmZzX2NvbXByZXNzX3BhZ2VzKHN0cnVjdCBjb21wcmVzc19jdHggCj4+ICpjYykKPj4gwqDC
oMKgwqDCoCBmb3IgKGkgPSAwOyBpIDwgY2MtPm5yX2NwYWdlczsgaSsrKSB7Cj4+IMKgwqDCoMKg
wqDCoMKgwqDCoCBpZiAoaSA8IG5ld19ucl9jcGFnZXMpIHsKPj4gLcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgbmV3X2NwYWdlc1tpXSA9IGNjLT5jcGFnZXNbaV07Cj4+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGNvbnRpbnVlOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+PiDCoMKgwqDCoMKg
wqDCoMKgwqAgZjJmc19jb21wcmVzc19mcmVlX3BhZ2UoY2MtPmNwYWdlc1tpXSk7Cj4+IEBAIC03
MTAsOCArNzAyLDYgQEAgc3RhdGljIGludCBmMmZzX2NvbXByZXNzX3BhZ2VzKHN0cnVjdCBjb21w
cmVzc19jdHggCj4+ICpjYykKPj4gwqDCoMKgwqDCoCBpZiAoY29wcy0+ZGVzdHJveV9jb21wcmVz
c19jdHgpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBjb3BzLT5kZXN0cm95X2NvbXByZXNzX2N0eChj
Yyk7Cj4+IC3CoMKgwqAgcGFnZV9hcnJheV9mcmVlKGNjLT5pbm9kZSwgY2MtPmNwYWdlcywgY2Mt
Pm5yX2NwYWdlcyk7Cj4+IC3CoMKgwqAgY2MtPmNwYWdlcyA9IG5ld19jcGFnZXM7Cj4+IMKgwqDC
oMKgwqAgY2MtPm5yX2NwYWdlcyA9IG5ld19ucl9jcGFnZXM7Cj4+IMKgwqDCoMKgwqAgdHJhY2Vf
ZjJmc19jb21wcmVzc19wYWdlc19lbmQoY2MtPmlub2RlLCBjYy0+Y2x1c3Rlcl9pZHgsCj4+IEBA
IC0xMzMwLDcgKzEzMjAsNyBAQCBzdGF0aWMgaW50IGYyZnNfd3JpdGVfY29tcHJlc3NlZF9wYWdl
cyhzdHJ1Y3QgCj4+IGNvbXByZXNzX2N0eCAqY2MsCj4+IMKgwqDCoMKgwqAgc3Bpbl91bmxvY2so
JmZpLT5pX3NpemVfbG9jayk7Cj4+IMKgwqDCoMKgwqAgZjJmc19wdXRfcnBhZ2VzKGNjKTsKPj4g
LcKgwqDCoCBwYWdlX2FycmF5X2ZyZWUoY2MtPmlub2RlLCBjYy0+Y3BhZ2VzLCBjYy0+bnJfY3Bh
Z2VzKTsKPj4gK8KgwqDCoCBwYWdlX2FycmF5X2ZyZWUoY2MtPmlub2RlLCBjYy0+Y3BhZ2VzLCBj
Yy0+cmF3X25yX2NwYWdlcyk7Cj4+IMKgwqDCoMKgwqAgY2MtPmNwYWdlcyA9IE5VTEw7Cj4+IMKg
wqDCoMKgwqAgZjJmc19kZXN0cm95X2NvbXByZXNzX2N0eChjYywgZmFsc2UpOwo+PiDCoMKgwqDC
oMKgIHJldHVybiAwOwo+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9mMmZzLmggYi9mcy9mMmZzL2Yy
ZnMuaAo+PiBpbmRleCA4NjdmMmM1ZDk1NTkuLjhiMWY4NGQ4OGE2NSAxMDA2NDQKPj4gLS0tIGEv
ZnMvZjJmcy9mMmZzLmgKPj4gKysrIGIvZnMvZjJmcy9mMmZzLmgKPj4gQEAgLTE0NTQsNiArMTQ1
NCw3IEBAIHN0cnVjdCBjb21wcmVzc19jdHggewo+PiDCoMKgwqDCoMKgIHVuc2lnbmVkIGludCBu
cl9ycGFnZXM7wqDCoMKgwqDCoMKgwqAgLyogdG90YWwgcGFnZSBudW1iZXIgaW4gcnBhZ2VzICov
Cj4+IMKgwqDCoMKgwqAgc3RydWN0IHBhZ2UgKipjcGFnZXM7wqDCoMKgwqDCoMKgwqAgLyogcGFn
ZXMgc3RvcmUgY29tcHJlc3NlZCBkYXRhIGluIAo+PiBjbHVzdGVyICovCj4+IMKgwqDCoMKgwqAg
dW5zaWduZWQgaW50IG5yX2NwYWdlczvCoMKgwqDCoMKgwqDCoCAvKiB0b3RhbCBwYWdlIG51bWJl
ciBpbiBjcGFnZXMgKi8KPj4gK8KgwqDCoCB1bnNpZ25lZCBpbnQgcmF3X25yX2NwYWdlczvCoMKg
wqAgLyogbWF4IHRvdGFsIHBhZ2UgbnVtYmVyIGluIGNwYWdlcyAqLwo+PiDCoMKgwqDCoMKgIHZv
aWQgKnJidWY7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKiB2aXJ0dWFsIG1hcHBlZCBhZGRyZXNz
IG9uIHJwYWdlcyAqLwo+PiDCoMKgwqDCoMKgIHN0cnVjdCBjb21wcmVzc19kYXRhICpjYnVmO8Kg
wqDCoCAvKiB2aXJ0dWFsIG1hcHBlZCBhZGRyZXNzIG9uIAo+PiBjcGFnZXMgKi8KPj4gwqDCoMKg
wqDCoCBzaXplX3QgcmxlbjvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIHZhbGlkIGRhdGEgbGVu
Z3RoIGluIHJidWYgKi8KPj4KPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRl
dmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9s
aXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
