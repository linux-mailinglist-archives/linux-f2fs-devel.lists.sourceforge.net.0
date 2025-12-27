Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 45103CDF33E
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 27 Dec 2025 02:25:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QyHCnHeeNy8zEo1DWis4HQt/5JuI6Yp6D0FakAb9mPQ=; b=cIKkFwoW4ZWkwdtIIBgNUqns2k
	3Yc/qQBqRYKjTAyNUU4uG8+BM9thzQEGr1N5mogreb3xGtcTs0L+CWsDzJIxpDm+Wrku9tBR96ElO
	58pduU2W3jNhXZmva3y7wXE7icar16O8z5IIN9JvwhDKXH1YVTmEF4Z+VXLTfsRngAA8=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vZJ3L-0003R6-9S;
	Sat, 27 Dec 2025 01:25:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vZJ3F-0003Qm-Fl
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 Dec 2025 01:25:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4ugwBFyds3cmnR5kuLj+IB3Esk1/MR6pMOe0HhVfb78=; b=PcgarrUjC87SSA/WvrEiRNBKwu
 Vo8sNo/7dThUEgBh1TQy33W/Sl5JkMlsiyjMj1Ls9JQmHtAFSEBiWwfgaZz+4y+vO0iA3vnQ2UYS6
 PbGbyApVVTMYrA147EzjYVlaJ7AaOupTAZ6prdQLOgi5LdqDMqhkeHlKx4OAb+d77ifg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4ugwBFyds3cmnR5kuLj+IB3Esk1/MR6pMOe0HhVfb78=; b=kQSxPLV0Hl44AnnSW3z93BAe59
 CcDW29a5ZoKsConZUb+Yjy6pXNA6f7RCXrWE5NLUJW4kkl7SXBXyHuApWDmHWLJGI3ViTvbaZw7qx
 yHdWSIMw2S5fWNTu2N+z5HcUwexY/Vodx5mdrbqEDMOToxLMHMdFTddySrQVfwmPpWWY=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vZJ3F-0000sI-Al for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 Dec 2025 01:25:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9A72160007;
 Sat, 27 Dec 2025 01:24:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1702BC4CEF7;
 Sat, 27 Dec 2025 01:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766798690;
 bh=MTGoC3N5EOxN5hWPwSbo933UNXHP+ed14SJ+mg/8smM=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=Hv7QtTcPYP6j92IF56eoDO31PHDB+i52w9sFjO+jE9WKt7NUHeWdX1XszMTfs9dhV
 NQEAJr7qdOOx1yzYNFQsOmGMfQedFPdociR0nA/WvV3B5BWgnfAKNyDl6/IuRPdhZY
 Y+EtNC8SefxSa+a/rKGCa9XrHJDLEkgtMLHrhDvA4dJ9iWUVnpY954w1Ot5X6nsfk4
 06zKW+NBn39vFzGRdtF9NWAjr1xlRxSSFppsFl2ZpBmxeHsMliplzxlGXcKz7aiDB/
 eqaKf8/OmY2UKQNFNzjLcm4JMQTw4s82F2cgtW7vwcaTH6X+in55NtVZEMKM1ooG3W
 qmuY6DIBi/K3g==
Message-ID: <f1d1733c-e771-4fb6-bf02-f174e84a0252@kernel.org>
Date: Sat, 27 Dec 2025 09:24:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <yangyongpeng.storage@gmail.com>,
 Yunlei He <heyunlei1988@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20251107062907.384287-1-heyunlei1988@gmail.com>
 <268cf104-6f77-419c-931e-c5cd82c3a921@kernel.org>
 <047b0d23-102e-41ce-b8b8-c7cb8ac31b21@gmail.com>
 <128fd300-d2d1-4169-a86f-a0babb47101b@kernel.org>
 <d6557e0a-a433-4dd1-bf02-d74cc6998592@gmail.com>
 <67e83a0a-74d3-43cc-902a-28172cb33149@kernel.org>
 <73a0bd40-385f-4112-93c6-995d98707e2c@gmail.com>
Content-Language: en-US
In-Reply-To: <73a0bd40-385f-4112-93c6-995d98707e2c@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/26/2025 11:52 AM, Yongpeng Yang wrote: > On 12/26/25
 11:07, Chao Yu via Linux-f2fs-devel wrote: >> On 12/23/2025 8:02 PM, Yongpeng
 Yang wrote: >>> >>> On 11/10/25 17:32, Chao Yu via Linux-f2fs-d [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vZJ3F-0000sI-Al
Subject: Re: [f2fs-dev] [PATCH] f2fs: drop non uptodata page during GC
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMTIvMjYvMjAyNSAxMTo1MiBBTSwgWW9uZ3BlbmcgWWFuZyB3cm90ZToKPiBPbiAxMi8yNi8y
NSAxMTowNywgQ2hhbyBZdSB2aWEgTGludXgtZjJmcy1kZXZlbCB3cm90ZToKPj4gT24gMTIvMjMv
MjAyNSA4OjAyIFBNLCBZb25ncGVuZyBZYW5nIHdyb3RlOgo+Pj4KPj4+IE9uIDExLzEwLzI1IDE3
OjMyLCBDaGFvIFl1IHZpYSBMaW51eC1mMmZzLWRldmVsIHdyb3RlOgo+Pj4+IE9uIDExLzEwLzI1
IDE3OjIwLCBZb25ncGVuZyBZYW5nIHdyb3RlOgo+Pj4+PiBPbiAxMS84LzI1IDExOjExLCBDaGFv
IFl1IHZpYSBMaW51eC1mMmZzLWRldmVsIHdyb3RlOgo+Pj4+Pj4gWXVubGVpLAo+Pj4+Pj4KPj4+
Pj4+IE9uIDIwMjUvMTEvNyAxNDoyOSwgWXVubGVpIEhlIHdyb3RlOgo+Pj4+Pj4+IEZyb206IFl1
bmxlaSBIZSA8aGV5dW5sZWlAeGlhb21pLmNvbT4KPj4+Pj4+Pgo+Pj4+Pj4+IEdDIG1vdmUgZmJl
IGRhdGEgYmxvY2sgd2lsbCBhZGQgc29tZSBub24gdXB0b2RhdGUgcGFnZSwgd2UnZAo+Pj4+Pj4+
IGJldHRlciByZWxlYXNlIGl0IGF0IHRoZSBlbmQuCj4+Pj4+Pgo+Pj4+Pj4gVGhpcyBpcyBqdXN0
IGZvciBzYXZpbmcgbWVtb3J5LCByaWdodD8KPj4+Pj4+Cj4+Pj4+Cj4+Pj4+IFllcywgbW92ZV9k
YXRhX2Jsb2NrKCkgZG9lc27igJl0IHJlYWQgYW55IGRhdGEgdG8gZm9saW8sIGFuZCB0aGUgR0MK
Pj4+Pj4gdXN1YWxseSBzZWxlY3RzIGNvbGQgZGF0YS4gVGhlcmVmb3JlLCB0aGlzIGZvbGlvIGlz
IHR5cGljYWxseSBub3QKPj4+Pj4gdXB0b2RhdGUsIGFuZCB0aGVyZeKAmXMgbm8gbmVlZCBmb3Ig
aXQgdG8gb2NjdXB5IHRoZSBwYWdlIGNhY2hlLgo+Pj4+Pgo+Pj4+Pj4+Cj4+Pj4+Pj4gU2lnbmVk
LW9mZi1ieTogWXVubGVpIEhlIDxoZXl1bmxlaUB4aWFvbWkuY29tPgo+Pj4+Pj4+IFNpZ25lZC1v
ZmYtYnk6IFlvbmdwZW5nIFlhbmcgPHlhbmd5b25ncGVuZ0B4aWFvbWkuY29tPgo+Pj4+Pj4+IC0t
LQo+Pj4+Pj4+ICDCoMKgIGZzL2YyZnMvZ2MuYyB8IDUgKysrKysKPj4+Pj4+PiAgwqDCoCAxIGZp
bGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCj4+Pj4+Pj4KPj4+Pj4+PiBkaWZmIC0tZ2l0IGEv
ZnMvZjJmcy9nYy5jIGIvZnMvZjJmcy9nYy5jCj4+Pj4+Pj4gaW5kZXggOGFiZjUyMTUzMGZmLi4w
OWI2NWU2ZWE4NTMgMTAwNjQ0Cj4+Pj4+Pj4gLS0tIGEvZnMvZjJmcy9nYy5jCj4+Pj4+Pj4gKysr
IGIvZnMvZjJmcy9nYy5jCj4+Pj4+Pj4gQEAgLTEzMTUsNiArMTMxNSw3IEBAIHN0YXRpYyBpbnQg
bW92ZV9kYXRhX2Jsb2NrKHN0cnVjdCBpbm9kZQo+Pj4+Pj4+ICppbm9kZSwgYmxvY2tfdCBiaWR4
LAo+Pj4+Pj4+ICDCoMKgwqDCoMKgwqAgc3RydWN0IG5vZGVfaW5mbyBuaTsKPj4+Pj4+PiAgwqDC
oMKgwqDCoMKgIHN0cnVjdCBmb2xpbyAqZm9saW8sICptZm9saW87Cj4+Pj4+Pj4gIMKgwqDCoMKg
wqDCoCBibG9ja190IG5ld2FkZHI7Cj4+Pj4+Pj4gK8KgwqDCoCBib29sIG5lZWRfaW52YWxpZGF0
ZSA9IHRydWU7Cj4+Pj4+Pj4gIMKgwqDCoMKgwqDCoCBpbnQgZXJyID0gMDsKPj4+Pj4+PiAgwqDC
oMKgwqDCoMKgIGJvb2wgbGZzX21vZGUgPSBmMmZzX2xmc19tb2RlKGZpby5zYmkpOwo+Pj4+Pj4+
ICDCoMKgwqDCoMKgwqAgaW50IHR5cGUgPSBmaW8uc2JpLT5hbS5hdGdjX2VuYWJsZWQgJiYgKGdj
X3R5cGUgPT0gQkdfR0MpICYmCj4+Pj4+Pj4gQEAgLTE0NTAsNyArMTQ1MSwxMSBAQCBzdGF0aWMg
aW50IG1vdmVfZGF0YV9ibG9jayhzdHJ1Y3QgaW5vZGUKPj4+Pj4+PiAqaW5vZGUsIGJsb2NrX3Qg
YmlkeCwKPj4+Pj4+PiAgwqDCoCBwdXRfb3V0Ogo+Pj4+Pj4+ICDCoMKgwqDCoMKgwqAgZjJmc19w
dXRfZG5vZGUoJmRuKTsKPj4+Pj4+PiAgwqDCoCBvdXQ6Cj4+Pj4+Pj4gK8KgwqDCoCBpZiAoZm9s
aW9fdGVzdF91cHRvZGF0ZShmb2xpbykpCj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIG5lZWRfaW52
YWxpZGF0ZSA9IGZhbHNlOwo+Pj4+Pj4KPj4+Pj4+IEhvdyBhYm91dCBkcm9wcGluZyBzdWNoIGZv
bGlvIHVuZGVyIGl0cyBsb2NrPwo+Pj4+Pj4KPj4+Pj4+IGlmICghZm9saW9fdGVzdF91cHRvZGF0
ZSgpKQo+Pj4+Pj4gIMKgwqDCoMKgwqDCoHRydW5jYXRlX2lub2RlX3BhcnRpYWxfZm9saW8oKQo+
Pj4+Pj4KPj4+Pj4KPj4+Pj4gdHJ1bmNhdGVfaW5vZGVfcGFydGlhbF9mb2xpbygpIGlzIG1vcmUg
ZWZmaWNpZW50IHNpbmNlIGl0IGF2b2lkcwo+Pj4+PiBsb29raW5nCj4+Pj4+IHVwIHRoZSBmb2xp
byBhZ2FpbiwgYnV0IGl04oCZcyBkZWNsYXJlZCBpbiBtbS9pbnRlcm5hbC5oLCBzbyBpdCBjYW5u
b3QgYmUKPj4+Pj4gY2FsbGVkIGRpcmVjdGx5Lgo+Pj4+Cj4+Pj4gWWVhaCwgb3IgZ2VuZXJpY19l
cnJvcl9yZW1vdmVfZm9saW8oKSwgbm90IHN1cmUuCj4+Pj4KPj4+PiBJIGp1c3QgdGFrZSBhIGxv
b2sgdG8gY2hlY2sgd2hldGhlciB0aGVyZSBpcyBhIGJldHRlciBhbHRlcm5hdGl2ZQo+Pj4+IHNj
aGVtZS4KPj4+Cj4+PiBIb3cgYWJvdXQgdGhlIGZvbGxvd2luZyBtb2RpZmljYXRpb24/IFRoZSBm
b2xpbyBpcyBtYXJrZWQgd2l0aAo+Pj4gUEdfZHJvcGJlaGluZCB1c2luZyBfX2ZvbGlvX3NldF9k
cm9wYmVoaW5kKCksIGFuZCBpcyBzdWJzZXF1ZW50bHkKPj4+IHJlbW92ZWQgZnJvbSB0aGUgcGFn
ZSBjYWNoZSB0aHJvdWdoIGZvbGlvX2VuZF9kcm9wYmVoaW5kKCkuCj4+Pgo+Pj4gVGhhbmtzLAo+
Pj4gWW9uZ3BlbmcKPj4+Cj4+PiAtLS0gYS9mcy9mMmZzL2djLmMKPj4+ICsrKyBiL2ZzL2YyZnMv
Z2MuYwo+Pj4gQEAgLTEzMjYsNiArMTMyNiw3IEBAIHN0YXRpYyBpbnQgbW92ZV9kYXRhX2Jsb2Nr
KHN0cnVjdCBpbm9kZSAqaW5vZGUsCj4+PiBibG9ja190IGJpZHgsCj4+PiAgwqDCoMKgwqDCoMKg
wqDCoCBmb2xpbyA9IGYyZnNfZ3JhYl9jYWNoZV9mb2xpbyhtYXBwaW5nLCBiaWR4LCBmYWxzZSk7
Cj4+PiAgwqDCoMKgwqDCoMKgwqDCoCBpZiAoSVNfRVJSKGZvbGlvKSkKPj4+ICDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gUFRSX0VSUihmb2xpbyk7Cj4+PiArwqDCoMKg
wqDCoMKgIF9fZm9saW9fc2V0X2Ryb3BiZWhpbmQoZm9saW8pOwo+Pj4KPj4+ICDCoMKgwqDCoMKg
wqDCoMKgIGlmICghY2hlY2tfdmFsaWRfbWFwKEYyRlNfSV9TQihpbm9kZSksIHNlZ25vLCBvZmYp
KSB7Cj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZXJyID0gLUVOT0VOVDsK
Pj4+IEBAIC0xNDUzLDcgKzE0NTQsMTAgQEAgc3RhdGljIGludCBtb3ZlX2RhdGFfYmxvY2soc3Ry
dWN0IGlub2RlICppbm9kZSwKPj4+IGJsb2NrX3QgYmlkeCwKPj4+ICDCoCBwdXRfb3V0Ogo+Pj4g
IMKgwqDCoMKgwqDCoMKgwqAgZjJmc19wdXRfZG5vZGUoJmRuKTsKPj4+ICDCoCBvdXQ6Cj4+PiAt
wqDCoMKgwqDCoMKgIGYyZnNfZm9saW9fcHV0KGZvbGlvLCB0cnVlKTsKPj4+ICvCoMKgwqDCoMKg
wqAgZm9saW9fdW5sb2NrKGZvbGlvKTsKPj4+ICvCoMKgwqDCoMKgwqAgZm9saW9fZW5kX2Ryb3Bi
ZWhpbmQoZm9saW8pOwo+Pj4gK8KgwqDCoMKgwqDCoCBmb2xpb19wdXQoZm9saW8pOwo+Pgo+PiBN
YXliZToKPj4KPj4gb3V0Ogo+PiAgwqDCoMKgwqBpZiAoIWZvbGlvX3Rlc3RfdXB0b2RhdGUpCj4+
ICDCoMKgwqDCoMKgwqDCoCBmb2xpb19zZXRfZHJvcGJlaGluZAo+PiAgwqDCoMKgwqBmb2xpb191
bmxvY2sKPj4gIMKgwqDCoMKgZm9saW9fZW5kX2Ryb3BiZWhpbmQKPj4gIMKgwqDCoMKgZm9saW9f
dGVzdF9jbGVhcl9kcm9wYmVoaW5kIC8vIG1ha2Ugc3VyZSB0byBjbGVhciB0aGUgZmxhZwoKT2gs
IGJ0dywgZm9saW9fdGVzdF9jbGVhcl9kcm9wYmVoaW5kKCkgc2hvdWxkIGJlIGNvdmVyZWQgdy8g
Zm9saW8gbG9jay4KCj4gCj4gT2gsIEkgbWlzcyB0aGlzLCBmb2xpb19lbmRfZHJvcGJlaGluZC0+
Zm9saW9fdHJ5bG9jayBtYXkgZmFpbC4gSSdsbCBmaXgKPiB0aGlzIGFuZCBzZW5kIHYyIHBhdGNo
Lgo+IAo+IFRoYW5rcwo+IFlvbmdwZW5nLAo+IAo+PiAgwqDCoMKgwqBmb2xpb19wdXQKPj4KPj4g
VGhhbmtzLAo+Pgo+Pj4gIMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGVycjsKPj4+ICDCoCB9Cj4+
Pgo+Pj4+Cj4+Pj4gVGhhbmtzLAo+Pj4+Cj4+Pj4+Cj4+Pj4+IFlvbmdwZW5nLAo+Pj4+Pgo+Pj4+
Pj4+ICDCoMKgwqDCoMKgwqAgZjJmc19mb2xpb19wdXQoZm9saW8sIHRydWUpOwo+Pj4+Pj4+ICvC
oMKgwqAgaWYgKG5lZWRfaW52YWxpZGF0ZSkKPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgaW52YWxp
ZGF0ZV9tYXBwaW5nX3BhZ2VzKG1hcHBpbmcsIGJpZHgsIGJpZHgpOwo+Pj4+Pj4+ICDCoMKgwqDC
oMKgwqAgcmV0dXJuIGVycjsKPj4+Pj4+PiAgwqDCoCB9Cj4+Pj4+Pgo+Pj4+Pj4KPj4+Pj4+Cj4+
Pj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+Pj4+
Pj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPj4+Pj4+IExpbnV4LWYyZnMtZGV2ZWxA
bGlzdHMuc291cmNlZm9yZ2UubmV0Cj4+Pj4+PiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5l
dC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCj4+Pj4+Cj4+Pj4KPj4+Pgo+Pj4+Cj4+
Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4+PiBM
aW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+Pj4+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMu
c291cmNlZm9yZ2UubmV0Cj4+Pj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMv
bGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo+Pj4KPj4KPj4KPj4KPj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4gTGludXgtZjJmcy1kZXZlbCBtYWls
aW5nIGxpc3QKPj4gTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPj4gaHR0
cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZl
bAo+IAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJj
ZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9s
aW51eC1mMmZzLWRldmVsCg==
