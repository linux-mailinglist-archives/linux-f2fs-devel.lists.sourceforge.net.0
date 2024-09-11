Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E18974B07
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Sep 2024 09:12:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1soHWs-0001KY-Ul;
	Wed, 11 Sep 2024 07:12:42 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1soHWr-0001KR-KI
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Sep 2024 07:12:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fRDtUhRKudhYF3HiPdzSo3l0VLx+yP9Paa7TIO9aKgI=; b=R4NPF1QHV7z9NjvdvQ1jTs6dSH
 47L603BN8ZHcA2seaqH25B7YeyAmWZGKxWQp59H1iLUYZRCHHj5p+pXjmviAhTT4BiWt+jUlj1FNt
 2lYXo/t0o/qHzi7AL4day0ANRe5I2a553hqlKra4R6CyVlkOYhPr7EPEmibS3Fr7w9Jk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fRDtUhRKudhYF3HiPdzSo3l0VLx+yP9Paa7TIO9aKgI=; b=NduCXwrFRiTPFi+vFV6FO6QkC7
 yvlxGPnzSZqFYJKjt6VEruNiiUIJEDA1e/tsmamBR4LyR7VSjDrVUtz8bJfnc8K/GYhWChBADCh6g
 S7MPq4I8g7K0aHURQTfEE7dDbRyPxxTmhbzJx55A8mSQQCLzFkMWASGufV9nt6YnU6kU=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1soHWq-0003o4-PV for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Sep 2024 07:12:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 6766CA4455C;
 Wed, 11 Sep 2024 07:12:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 011F2C4CEC6;
 Wed, 11 Sep 2024 07:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726038749;
 bh=I0zM5CLKue7JAHtHnil+T8oLz0L+gRgJPWAmvkeDhsU=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=qC5UOAzAQBOUONjiafY0N9WmVZEUwJ391+i6A2RqWD/F5U93ed319s1mF8nDI660S
 GrKtyTMTjtYz6/ZCH2CcKbz4oNn2hL9m2Lev5bHyqWmDYT8AWe8rCORon9izgIaLhk
 2JOYE2IaijaSq9lsfmr5n54Yu4feBq1MY5Cj/kHqTMcyk0aVZVU3w2eiyGtxwHeupt
 lxBPGrzrHdYoucT/UsOjfy3SErPTe3JdYTbV8LBBabqLyJiadQnRMg+Bmq6SAhClPU
 DVMlVuqgO6Pl3MB2wDAA6SX18B5DbMl9ZgFJrevL0syqNorw6fn8nSIThHkaL7QWfk
 bbF5wI//yzaqg==
Message-ID: <d7b3ad0c-6474-459d-855d-c1c435a2bb17@kernel.org>
Date: Wed, 11 Sep 2024 15:12:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: wangzijie1@honor.com
References: <52ced02d-728b-4e3b-9079-73efd91c90e3@kernel.org>
 <20240903060658.1780002-1-wangzijie1@honor.com>
 <973e075b-7044-4448-9cd0-45b5a1ad1382@kernel.org>
Content-Language: en-US
In-Reply-To: <973e075b-7044-4448-9cd0-45b5a1ad1382@kernel.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/9/4 11:49, Chao Yu via Linux-f2fs-devel wrote: > On
 2024/9/3 14:06,
 wangzijie wrote: >> From: Chao Yu via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
 >> >>> On 2024/8/27 14:22, w [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1soHWq-0003o4-PV
Subject: Re: [f2fs-dev] [RFC PATCH] f2fs: don't set SBI_QUOTA_NEED_REPAIR
 flag if receive SIGKILL
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNC85LzQgMTE6NDksIENoYW8gWXUgdmlhIExpbnV4LWYyZnMtZGV2ZWwgd3JvdGU6Cj4g
T24gMjAyNC85LzMgMTQ6MDYsIHdhbmd6aWppZSB3cm90ZToKPj4gRnJvbTogQ2hhbyBZdSB2aWEg
TGludXgtZjJmcy1kZXZlbCA8bGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQ+
Cj4+Cj4+PiBPbiAyMDI0LzgvMjcgMTQ6MjIsIHdhbmd6aWppZSB3cm90ZToKPj4+PiBUaHJlYWQg
QQo+Pj4+IC1kcXVvdF9pbml0aWFsaXplCj4+Pj4gwqAgLWRxZ2V0Cj4+Pj4gwqDCoCAtZjJmc19k
cXVvdF9hY3F1aXJlCj4+Pj4gwqDCoMKgIC12Ml9yZWFkX2RxdW90Cj4+Pj4gwqDCoMKgwqAgLXF0
cmVlX3JlYWRfZHF1b3QKPj4+PiDCoMKgwqDCoMKgIC1maW5kX3RyZWVfZHFlbnRyeQo+Pj4+IMKg
wqDCoMKgwqDCoCAtZjJmc19xdW90YV9yZWFkCj4+Pj4gwqDCoMKgwqDCoMKgwqAgLXJlYWRfY2Fj
aGVfcGFnZV9nZnAKPj4+PiDCoMKgwqDCoMKgwqDCoMKgIC1kb19yZWFkX2NhY2hlX2ZvbGlvCj4+
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIC1maWVtYXBfcmVhZF9mb2xpbwo+Pj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgIC1mb2xpb193YWl0X2xvY2tlZF9raWxsYWJsZQo+Pj4+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgLXJlY2VpdmUgU0lHS0lMTCA6IHJldHVybiAtRUlOVFIKPj4+PiDCoMKgwqDCoMKg
wqDCoCAtc2V0IFNCSV9RVU9UQV9ORUVEX1JFUEFJUgo+Pj4+IMKgwqDCoCAtc2V0IFNCSV9RVU9U
QV9ORUVEX1JFUEFJUgo+Pj4+Cj4+Pj4gV2hlbiBjYWxsaW5nIHJlYWRfY2FjaGVfcGFnZV9nZnAg
aW4gcXVvdGEgcmVhZCwgdGhyZWFkIG1heSByZWNlaXZlIFNJR0tJTEwgYW5kCj4+Pj4gc2V0IFNC
SV9RVU9UQV9ORUVEX1JFUEFJUiwgc2hvdWxkIHdlIHNldCBTQklfUVVPVEFfTkVFRF9SRVBBSVIg
aW4gdGhpcyBlcnJvciBwYXRoPwo+Pj4KPj4+IGYyZnNfcXVvdGFfcmVhZCgpIGNhbiBiZSBjYWxs
ZWQgaW4gYSBsb3Qgb2YgY29udGV4dHMsIGNhbiB3ZSBqdXN0IGlnbm9yZSAtRUlOVFIKPj4+IGZv
ciBmMmZzX2RxdW90X2luaXRpYWxpemUoKSBjYXNlPwo+Pj4KPj4+IFRoYW5rcywKPj4KPj4gWWVz
LCBpbiBtYW55IGNvbnRleHRzIGYyZnNfcXVvdGFfcmVhZCgpIGNhbiBiZSBjYWxsZWQgYW5kIG1h
eSByZXR1cm4gLUVJTlRSLCB3ZSBuZWVkIHRvIGlnbm9yZSB0aGlzIGVycm5vIGZvciBtb3JlIGNh
c2VzLiBJZiB3ZSBuZWVkIHRvIGRvIHNvLCBJIHdpbGwgY2hlY2sgaXQgYW5kIHJlc2VuZCBwYXRj
aC4KPj4gT3IgZG8geW91IGhhdmUgb3RoZXIgc3VnZ2VzdGlvbnMgdG8gYXZvaWQgdW5uZWNlc3Nh
cnkgU0JJX1FVT1RBX05FRURfUkVQQUlSIGZsYWcgc2V0Pwo+IAo+IEhvdyBhYm91dCB0aGlzPwo+
IAo+IC0tLQo+ICDCoGZzL2YyZnMvZjJmcy5owqAgfMKgIDEgKwo+ICDCoGZzL2YyZnMvaW5vZGUu
YyB8wqAgMyArLS0KPiAgwqBmcy9mMmZzL3N1cGVyLmMgfCAxNyArKysrKysrKysrKysrLS0tLQo+
ICDCoDMgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPiAK
PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9mMmZzLmggYi9mcy9mMmZzL2YyZnMuaAo+IGluZGV4IGRm
ZWQxOTc0ZWRhNS4uYTE3MDRhMTlkZmU5IDEwMDY0NAo+IC0tLSBhL2ZzL2YyZnMvZjJmcy5oCj4g
KysrIGIvZnMvZjJmcy9mMmZzLmgKPiBAQCAtODEwLDYgKzgxMCw3IEBAIGVudW0gewo+ICDCoMKg
wqDCoCBGSV9BVE9NSUNfRElSVElFRCzCoMKgwqAgLyogaW5kaWNhdGUgYXRvbWljIGZpbGUgaXMg
ZGlydGllZCAqLwo+ICDCoMKgwqDCoCBGSV9BVE9NSUNfUkVQTEFDRSzCoMKgwqAgLyogaW5kaWNh
dGUgYXRvbWljIHJlcGxhY2UgKi8KPiAgwqDCoMKgwqAgRklfT1BFTkVEX0ZJTEUswqDCoMKgwqDC
oMKgwqAgLyogaW5kaWNhdGUgZmlsZSBoYXMgYmVlbiBvcGVuZWQgKi8KPiArwqDCoMKgIEZJX0lO
SVRfRFFVT1QswqDCoMKgwqDCoMKgwqAgLyogaW5kaWNhdGUgaXQncyBpbml0aWFsaXppbmcgZHF1
b3QgKi8KPiAgwqDCoMKgwqAgRklfTUFYLMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyogbWF4IGZs
YWcsIG5ldmVyIGJlIHVzZWQgKi8KPiAgwqB9Owo+IAo+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2lu
b2RlLmMgYi9mcy9mMmZzL2lub2RlLmMKPiBpbmRleCAwMDhmMDEzNDhhZmEuLmIxZGJhZWRhMzA2
ZiAxMDA2NDQKPiAtLS0gYS9mcy9mMmZzL2lub2RlLmMKPiArKysgYi9mcy9mMmZzL2lub2RlLmMK
PiBAQCAtODI3LDggKzgyNyw3IEBAIHZvaWQgZjJmc19ldmljdF9pbm9kZShzdHJ1Y3QgaW5vZGUg
Kmlub2RlKQo+IAo+ICDCoMKgwqDCoCBlcnIgPSBmMmZzX2RxdW90X2luaXRpYWxpemUoaW5vZGUp
Owo+ICDCoMKgwqDCoCBpZiAoZXJyKSB7Cj4gLcKgwqDCoMKgwqDCoMKgIGlmIChlcnIgIT0gLUVJ
TlRSKQo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNldF9zYmlfZmxhZyhzYmksIFNCSV9RVU9U
QV9ORUVEX1JFUEFJUik7Cj4gK8KgwqDCoMKgwqDCoMKgIHNldF9zYmlfZmxhZyhzYmksIFNCSV9R
VU9UQV9ORUVEX1JFUEFJUik7Cj4gIMKgwqDCoMKgwqDCoMKgwqAgZXJyID0gMDsKPiAgwqDCoMKg
wqAgfQo+IAo+IGRpZmYgLS1naXQgYS9mcy9mMmZzL3N1cGVyLmMgYi9mcy9mMmZzL3N1cGVyLmMK
PiBpbmRleCA4ZTI5YWJhNGI3YTQuLmU3NzRiZGY4NzViMiAxMDA2NDQKPiAtLS0gYS9mcy9mMmZz
L3N1cGVyLmMKPiArKysgYi9mcy9mMmZzL3N1cGVyLmMKPiBAQCAtMjY0NCw4ICsyNjQ0LDExIEBA
IHN0YXRpYyBzc2l6ZV90IGYyZnNfcXVvdGFfcmVhZChzdHJ1Y3Qgc3VwZXJfYmxvY2sgKnNiLCBp
bnQgdHlwZSwgY2hhciAqZGF0YSwKPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChQVFJf
RVJSKHBhZ2UpID09IC1FTk9NRU0pIHsKPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgbWVtYWxsb2NfcmV0cnlfd2FpdChHRlBfTk9GUyk7Cj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGdvdG8gcmVwZWF0Owo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0gZWxz
ZSBpZiAoUFRSX0VSUihwYWdlKSAhPSAtRUlOVFIpCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBzZXRfc2JpX2ZsYWcoRjJGU19TQihzYiksIFNCSV9RVU9UQV9ORUVEX1JFUEFJUik7
Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfSBlbHNlIGlmIChQVFJfRVJSKHBhZ2UpID09IC1F
SU5UUiAmJgo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaXNfaW5vZGVfZmxhZ19z
ZXQoaW5vZGUsIEZJX0lOSVRfRFFVT1QpKSB7CgpDdXJyZW50IGlub2RlIGlzIHF1b3RhIGlub2Rl
LCBpdCdzIG5vdCB0aGUgc2FtZSBpbm9kZSB3ZSB0YWdnZWQKdy8gRklfSU5JVF9EUVVPVCwgc28g
cGxlYXNlIGlnbm9yZSB0aGlzIGRpZmYuLi4KClRoYW5rcywKCj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCByZXR1cm4gUFRSX0VSUihwYWdlKTsKPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB9Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2V0X3NiaV9mbGFnKEYyRlNfU0Ioc2Ip
LCBTQklfUVVPVEFfTkVFRF9SRVBBSVIpOwo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0
dXJuIFBUUl9FUlIocGFnZSk7Cj4gIMKgwqDCoMKgwqDCoMKgwqAgfQo+IAo+IEBAIC0yNzIxLDEw
ICsyNzI0LDE2IEBAIHN0YXRpYyBzc2l6ZV90IGYyZnNfcXVvdGFfd3JpdGUoc3RydWN0IHN1cGVy
X2Jsb2NrICpzYiwgaW50IHR5cGUsCj4gCj4gIMKgaW50IGYyZnNfZHF1b3RfaW5pdGlhbGl6ZShz
dHJ1Y3QgaW5vZGUgKmlub2RlKQo+ICDCoHsKPiArwqDCoMKgIGludCByZXQ7Cj4gKwo+ICDCoMKg
wqDCoCBpZiAodGltZV90b19pbmplY3QoRjJGU19JX1NCKGlub2RlKSwgRkFVTFRfRFFVT1RfSU5J
VCkpCj4gIMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FU1JDSDsKPiAKPiAtwqDCoMKgIHJldHVy
biBkcXVvdF9pbml0aWFsaXplKGlub2RlKTsKPiArwqDCoMKgIHNldF9pbm9kZV9mbGFnKGlub2Rl
LCBGSV9JTklUX0RRVU9UKTsKPiArwqDCoMKgIHJldCA9IGRxdW90X2luaXRpYWxpemUoaW5vZGUp
Owo+ICvCoMKgwqAgY2xlYXJfaW5vZGVfZmxhZyhpbm9kZSwgRklfSU5JVF9EUVVPVCk7Cj4gKwo+
ICvCoMKgwqAgcmV0dXJuIHJldDsKPiAgwqB9Cj4gCj4gIMKgc3RhdGljIHN0cnVjdCBkcXVvdCBf
X3JjdSAqKmYyZnNfZ2V0X2RxdW90cyhzdHJ1Y3QgaW5vZGUgKmlub2RlKQo+IEBAIC0zMDY0LDcg
KzMwNzMsNyBAQCBzdGF0aWMgaW50IGYyZnNfZHF1b3RfYWNxdWlyZShzdHJ1Y3QgZHF1b3QgKmRx
dW90KQo+IAo+ICDCoMKgwqDCoCBmMmZzX2Rvd25fcmVhZCgmc2JpLT5xdW90YV9zZW0pOwo+ICDC
oMKgwqDCoCByZXQgPSBkcXVvdF9hY3F1aXJlKGRxdW90KTsKPiAtwqDCoMKgIGlmIChyZXQgPCAw
ICYmIHJldCAhPSAtRUlOVFIpCj4gK8KgwqDCoCBpZiAocmV0IDwgMCkKPiAgwqDCoMKgwqDCoMKg
wqDCoCBzZXRfc2JpX2ZsYWcoc2JpLCBTQklfUVVPVEFfTkVFRF9SRVBBSVIpOwo+ICDCoMKgwqDC
oCBmMmZzX3VwX3JlYWQoJnNiaS0+cXVvdGFfc2VtKTsKPiAgwqDCoMKgwqAgcmV0dXJuIHJldDsK
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
ZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgt
ZjJmcy1kZXZlbAo=
