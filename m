Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D97F44F1BF
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 13 Nov 2021 07:16:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mlmKT-0002JC-Cs; Sat, 13 Nov 2021 06:15:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1mlmKR-0002J5-0T
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 13 Nov 2021 06:15:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JtdevMEbo7GBZghWOm44qrM8bv6IW9G8YUhVrqjX8HI=; b=ebqBO0qEGCRagzJRRQrW8OJt4j
 1EkmjDmg9/No9Oe17KfarNhuGhoPrPonfbTr4a+ZqMAZvuARxn/uL5o1ax61rXOszwqTqm+7GDr96
 eDgbwmrHy6hxpGMbex3f9IZvyOGoB1O/2DHtXaNu2KfALlxmsaM7kMcu2CJWW/Zruu5U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JtdevMEbo7GBZghWOm44qrM8bv6IW9G8YUhVrqjX8HI=; b=ONZd8ago2mG2KSxjXTtoqA4QVY
 Jk0Qu8EGw3AmFg8zHRMSg1M5Xw9rmfA5hwZ7j6op4SvAhMahmvGOjv6xs6slR3vXr0dCytecC/Dwe
 qq34b4Nds/xs9zWqQrgXvbo1IMK/+ZwwaPlA9AWaCTy1h8CjB6EX//L6Teya3J77oX1o=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mlmKP-0004cm-1M
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 13 Nov 2021 06:15:54 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 915F560F4F;
 Sat, 13 Nov 2021 06:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636784144;
 bh=wj/UpPiN6MG04vxHXkRSWOlpBuwDNFqNT3K29/fWHJ8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=DkBK2e92aHEkaHSJvRPc+foKeX4Q8QcxLZXUwKPMgDuBk6PniTHcs+nZ2IZRtTeso
 a9E62ad6q6gChWfID3sEg4cjq0acloKEyFwiBBmVkO3r6j18bOGkUw5W2Mmz8APBOK
 ay+mSNyisK6gyteyKGBaiR1nA8LgO/3wmJkSJ6Vge3EgZt/0gCuFyBzwZXkbeXvjwF
 dRoj+WDfycgrUWL9fmEYBUM/v8cW0zWhPMzCZFE+hWyehje3ePiXWZKzxQ9d7xoaOT
 zHyOmVso8LUWx9flbBa4mnhUYjCj0bNBbbSyWQhA+6xJDZzr0WXmVJsjmF0JI+xQ7Y
 7RoTEeWEgrO5A==
Message-ID: <e17018b9-19fd-41a8-e92e-d95bbdc8ab6c@kernel.org>
Date: Sat, 13 Nov 2021 14:15:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Content-Language: en-US
To: =?UTF-8?B?5bi45Yek5qWg?= <changfengnan@vivo.com>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>
References: <20211108035459.40139-1-changfengnan@vivo.com>
 <KL1PR0601MB4003615E989DEFDE86793B58BB919@KL1PR0601MB4003.apcprd06.prod.outlook.com>
 <AI6AmQANEzwDyLqc-ild4qqN.9.1636381829406.Hmail.changfengnan@vivo.com>
 <KL1PR0601MB400396B05790858364501F3EBB929@KL1PR0601MB4003.apcprd06.prod.outlook.com>
 <AFUAIwC1E3YFUbOLaOBVbqp6.9.1636465594624.Hmail.changfengnan@vivo.com>
 <KL1PR0601MB40034AE177D7AB8FE4E2E59EBB939@KL1PR0601MB4003.apcprd06.prod.outlook.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <KL1PR0601MB40034AE177D7AB8FE4E2E59EBB939@KL1PR0601MB4003.apcprd06.prod.outlook.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2021/11/10 9:41, 常凤楠 wrote: >> 
 
 Content analysis details:   (-7.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [198.145.29.99 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mlmKP-0004cm-1M
Subject: Re: [f2fs-dev] Do we need serial io for compress file?
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
Cc: "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMS8xMS8xMCA5OjQxLCDluLjlh6TmpaAgd3JvdGU6Cj4+IC0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tCj4+IEZyb206IGNoYW5nZmVuZ25hbkB2aXZvLmNvbSA8Y2hhbmdmZW5nbmFuQHZp
dm8uY29tPiBPbiBCZWhhbGYgT2YKPj4gQ2hhbyBZdQo+PiBTZW50OiBUdWVzZGF5LCBOb3ZlbWJl
ciA5LCAyMDIxIDk6NDYgUE0KPj4gVG86IOW4uOWHpOaloCA8Y2hhbmdmZW5nbmFuQHZpdm8uY29t
PjsgamFlZ2V1a0BrZXJuZWwub3JnCj4+IENjOiBsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJj
ZWZvcmdlLm5ldAo+PiBTdWJqZWN0OiBSZTogRG8gd2UgbmVlZCBzZXJpYWwgaW8gZm9yIGNvbXBy
ZXNzIGZpbGU/Cj4+Cj4+IE9uIDIwMjEvMTEvOSAxMToxOCwg5bi45Yek5qWgIHdyb3RlOgo+Pj4K
Pj4+Cj4+Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPj4+PiBGcm9tOiBjaGFuZ2Zlbmdu
YW5Adml2by5jb20gPGNoYW5nZmVuZ25hbkB2aXZvLmNvbT4gT24gQmVoYWxmCj4+IE9mIENoYW8K
Pj4+PiBZdQo+Pj4+IFNlbnQ6IE1vbmRheSwgTm92ZW1iZXIgOCwgMjAyMSAxMDozMCBQTQo+Pj4+
IFRvOiDluLjlh6TmpaAgPGNoYW5nZmVuZ25hbkB2aXZvLmNvbT47IGphZWdldWtAa2VybmVsLm9y
Zwo+Pj4+IENjOiBsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+Pj4+IFN1
YmplY3Q6IFJlOiBEbyB3ZSBuZWVkIHNlcmlhbCBpbyBmb3IgY29tcHJlc3MgZmlsZT8KPj4+Pgo+
Pj4+IE9uIDIwMjEvMTEvOCAxNjo1Niwg5bi45Yek5qWgIHdyb3RlOgo+Pj4+PiBBbnl3YXksIEkg
ZGlkIHNvbWUgbW9kaWZ5IHRvIHZlcmlmeSBteSBpZGVhLCBhbmQgZGlkIHNvbWUgdGVzdCwgbm90
Cj4+Pj4gZm91bmQgcHJvYmxlbSBmb3Igbm93Lgo+Pj4+Cj4+Pj4gQ291bGQgeW91IHBsZWFzZSBj
b25zaWRlcjoKPj4+PiAxLiBwaW4gZmlsZQo+Pj4+IDIuIGZhbGxvY2F0ZSBmaWxlIHcvIGZpbGVz
aXplIGtlZXBlZAo+Pj4+ICAgICAtIGl0IHdpbGwgcHJlYWxsb2NhdGUgcGh5c2ljYWwgYmxvY2tz
IGFsaWduZWQgdG8gc2VnbWVudHMgMy4gdW5waW4gZmlsZQo+PiA0Lgo+Pj4+IG92ZXJ3cml0ZSBj
b21wcmVzc2VkIGZpbGUKPj4+Cj4+PiBTbyB5b3UgbWVhbnMgYWZ0ZXIgc3RlcCAxLTMsIGl0IHdp
bGwgbWFrZSBjb21wcmVzc2VkIGZpbGUgZnJhZ21lbnRhdGlvbgo+PiB3b3JzZSA/Cj4+Cj4+IE9o
LCBJJ20gdHJ5aW5nIHRvIGZpbmQgYSB3YXkgdG8gYXZvaWQgd3JpdGUgcGVyZm9ybWFuY2UgcmVn
cmVzc2lvbiBkdWUgdG8KPj4gcmFjZSBjb25kaXRpb24gb24gd3JpdGVwYWdlcyBsb2NrIG1lYW53
aGlsZSBhdm9pZGluZyBmcmFnbWVudGF0aW9uIG9mCj4+IGNvbXByZXNzZWQgZmlsZS4KPiAKPiBZ
ZXAsIHRoYXQncyB3aGF0IEkgd2FudCB0byBkbywgbG9va2luZyBmb3J3YXJkIHlvdXIgaWRlYS4K
PiBBbmQgaG93IGFib3V0IHRoZSBtb2RpZnkgYXMgYmVsb3cgPwoKV2Ugd2lsbCBzdGlsbCBzdWZm
ZXIgZnJhZ21lbnRhdGlvbiBpbiByYWNlIGNvbmRpdGlvbiBpbiBiZXR3ZWVuIGNvbXByZXNzZWQg
ZmlsZSB3cml0ZSBhbmQKbm9ybWFsIGZpbGUgd3JpdGU/CgpUaGFua3MsCgo+IAo+IFRoYW5rcy4K
Pj4gQnV0IEknbSBvdXQgb2YgbXkgbWluZCwgYWJvdmUgY2FzZSB3b3VsZG4ndCBoZWxwLCBwbGVh
c2UgaWdub3JlIHRoaXMuCj4+Cj4+IFRoYW5rcywKPj4KPj4+Cj4+PiBUaGFua3MuCj4+Pj4KPj4+
PiBUaGFua3MsCj4+Pj4KPj4+Pj4KPj4+Pj4gVGhlIG1vZGlmeSBhcyBmb2xsb3dzOgo+Pj4+Pgo+
Pj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9kYXRhLmMgYi9mcy9mMmZzL2RhdGEuYyBpbmRleAo+
Pj4+PiBmNGZkNmMyNDZjOWEuLjBlZDY3N2VmZTgyMCAxMDA2NDQKPj4+Pj4gLS0tIGEvZnMvZjJm
cy9kYXRhLmMKPj4+Pj4gKysrIGIvZnMvZjJmcy9kYXRhLmMKPj4+Pj4gQEAgLTMxNjUsOCArMzE2
NSw2IEBAIHN0YXRpYyBpbmxpbmUgYm9vbAo+Pj4+PiBfX3Nob3VsZF9zZXJpYWxpemVfaW8oc3Ry
dWN0Cj4+Pj4gaW5vZGUgKmlub2RlLAo+Pj4+PiAgICAgCWlmIChJU19OT1FVT1RBKGlub2RlKSkK
Pj4+Pj4gICAgIAkJcmV0dXJuIGZhbHNlOwo+Pj4+Pgo+Pj4+PiAtCWlmIChmMmZzX25lZWRfY29t
cHJlc3NfZGF0YShpbm9kZSkpCj4+Pj4+IC0JCXJldHVybiB0cnVlOwo+Pj4+PiAgICAgCWlmICh3
YmMtPnN5bmNfbW9kZSAhPSBXQl9TWU5DX0FMTCkKPj4+Pj4gICAgIAkJcmV0dXJuIHRydWU7Cj4+
Pj4+ICAgICAJaWYgKGdldF9kaXJ0eV9wYWdlcyhpbm9kZSkgPj0KPj4+Pj4gU01fSShGMkZTX0lf
U0IoaW5vZGUpKS0+bWluX3NlcV9ibG9ja3MpCj4+Pj4+IEBAIC0zMjE4LDExICszMjE2LDE2IEBA
IHN0YXRpYyBpbnQgX19mMmZzX3dyaXRlX2RhdGFfcGFnZXMoc3RydWN0Cj4+Pj4gYWRkcmVzc19z
cGFjZSAqbWFwcGluZywKPj4+Pj4gICAgIAkJbXV0ZXhfbG9jaygmc2JpLT53cml0ZXBhZ2VzKTsK
Pj4+Pj4gICAgIAkJbG9ja2VkID0gdHJ1ZTsKPj4+Pj4gICAgIAl9Cj4+Pj4+ICsJaWYgKGYyZnNf
bmVlZF9jb21wcmVzc19kYXRhKGlub2RlKSkKPj4+Pj4gKwkJbXV0ZXhfbG9jaygmKEYyRlNfSShp
bm9kZSktPmNvbXByZXNzX2xvY2spKTsKPj4+Pj4KPj4+Pj4gICAgIAlibGtfc3RhcnRfcGx1Zygm
cGx1Zyk7Cj4+Pj4+ICAgICAJcmV0ID0gZjJmc193cml0ZV9jYWNoZV9wYWdlcyhtYXBwaW5nLCB3
YmMsIGlvX3R5cGUpOwo+Pj4+PiAgICAgCWJsa19maW5pc2hfcGx1ZygmcGx1Zyk7Cj4+Pj4+Cj4+
Pj4+ICsJaWYgKGYyZnNfbmVlZF9jb21wcmVzc19kYXRhKGlub2RlKSkKPj4+Pj4gKwkJbXV0ZXhf
dW5sb2NrKCYoRjJGU19JKGlub2RlKS0+Y29tcHJlc3NfbG9jaykpOwo+Pj4+PiArCj4+Pj4+ICAg
ICAJaWYgKGxvY2tlZCkKPj4+Pj4gICAgIAkJbXV0ZXhfdW5sb2NrKCZzYmktPndyaXRlcGFnZXMp
Owo+Pj4+Pgo+Pj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9mMmZzLmggYi9mcy9mMmZzL2YyZnMu
aCBpbmRleAo+Pj4+PiAwMzlhMjI5ZTExYzkuLjNhNjU4N2YxM2QyZiAxMDA2NDQKPj4+Pj4gLS0t
IGEvZnMvZjJmcy9mMmZzLmgKPj4+Pj4gKysrIGIvZnMvZjJmcy9mMmZzLmgKPj4+Pj4gQEAgLTc2
Myw2ICs3NjMsNyBAQCBzdHJ1Y3QgZjJmc19pbm9kZV9pbmZvIHsKPj4+Pj4gICAgIAlzdHJ1Y3Qg
bGlzdF9oZWFkIGlubWVtX3BhZ2VzOwkvKiBpbm1lbW9yeSBwYWdlcyBtYW5hZ2VkIGJ5Cj4+Pj4g
ZjJmcyAqLwo+Pj4+PiAgICAgCXN0cnVjdCB0YXNrX3N0cnVjdCAqaW5tZW1fdGFzazsJLyogc3Rv
cmUgaW5tZW1vcnkgdGFzayAqLwo+Pj4+PiAgICAgCXN0cnVjdCBtdXRleCBpbm1lbV9sb2NrOwkv
KiBsb2NrIGZvciBpbm1lbW9yeSBwYWdlcyAqLwo+Pj4+PiArCXN0cnVjdCBtdXRleCBjb21wcmVz
c19sb2NrOwkvKiBsb2NrIGZvciBjb21wcmVzcyBmaWxlICovCj4+Pj4+ICAgICAJc3RydWN0IGV4
dGVudF90cmVlICpleHRlbnRfdHJlZTsJLyogY2FjaGVkIGV4dGVudF90cmVlIGVudHJ5ICovCj4+
Pj4+Cj4+Pj4+ICAgICAJLyogYXZvaWQgcmFjaW5nIGJldHdlZW4gZm9yZWdyb3VuZCBvcCBhbmQg
Z2MgKi8gZGlmZiAtLWdpdAo+Pj4+PiBhL2ZzL2YyZnMvc3VwZXIuYyBiL2ZzL2YyZnMvc3VwZXIu
YyBpbmRleCBhMTMzOTMyMzMzYzUuLjg1NjZlOWMzNDU0MAo+Pj4+PiAxMDA2NDQKPj4+Pj4gLS0t
IGEvZnMvZjJmcy9zdXBlci5jCj4+Pj4+ICsrKyBiL2ZzL2YyZnMvc3VwZXIuYwo+Pj4+PiBAQCAt
MTMyMyw2ICsxMzIzLDcgQEAgc3RhdGljIHN0cnVjdCBpbm9kZSAqZjJmc19hbGxvY19pbm9kZShz
dHJ1Y3QKPj4+PiBzdXBlcl9ibG9jayAqc2IpCj4+Pj4+ICAgICAJSU5JVF9MSVNUX0hFQUQoJmZp
LT5pbm1lbV9pbGlzdCk7Cj4+Pj4+ICAgICAJSU5JVF9MSVNUX0hFQUQoJmZpLT5pbm1lbV9wYWdl
cyk7Cj4+Pj4+ICAgICAJbXV0ZXhfaW5pdCgmZmktPmlubWVtX2xvY2spOwo+Pj4+PiArCW11dGV4
X2luaXQoJmZpLT5jb21wcmVzc19sb2NrKTsKPj4+Pj4gICAgIAlpbml0X3J3c2VtKCZmaS0+aV9n
Y19yd3NlbVtSRUFEXSk7Cj4+Pj4+ICAgICAJaW5pdF9yd3NlbSgmZmktPmlfZ2NfcndzZW1bV1JJ
VEVdKTsKPj4+Pj4gICAgIAlpbml0X3J3c2VtKCZmaS0+aV94YXR0cl9zZW0pOwo+Pj4+PiAtLQo+
Pj4+Pgo+Pj4+Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPj4+Pj4+IEZyb206IOW4uOWH
pOaloAo+Pj4+Pj4gU2VudDogTW9uZGF5LCBOb3ZlbWJlciA4LCAyMDIxIDExOjU1IEFNCj4+Pj4+
PiBUbzogamFlZ2V1a0BrZXJuZWwub3JnOyBjaGFvQGtlcm5lbC5vcmcKPj4+Pj4+IENjOiBsaW51
eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+Pj4+Pj4gU3ViamVjdDogRG8gd2Ug
bmVlZCBzZXJpYWwgaW8gZm9yIGNvbXByZXNzIGZpbGU/Cj4+Pj4+Pgo+Pj4+Pj4gSW4gbXkgdGVz
dCwgc2VyaWFsIGlvIGZvciBjb21wcmVzcyBmaWxlIHdpbGwgbWFrZSBtdWx0aXRocmVhZCBzbWFs
bAo+Pj4+Pj4gd3JpdGUgcGVyZm9ybWFuY2UgZHJvcCBhIGxvdC4KPj4+Pj4+Cj4+Pj4+PiBJJ20g
dHJ5IHRvIGZpbmd1cmUgb3V0IHdoeSB3ZSBuZWVkIF9fc2hvdWxkX3NlcmlhbGl6ZV9pbywgSU1P
LCB3ZQo+Pj4+Pj4gdXNlIF9fc2hvdWxkX3NlcmlhbGl6ZV9pbyB0byBhdm9pZCBkZWFkbG9jayBv
ciB0cnkgdG8gaW1wcm92ZQo+Pj4+Pj4gc2VxdWVudGlhbCBwZXJmb3JtYW5jZSwgYnV0IEkgZG9u
J3QgdW5kZXJzdGFuZCB3aHkgd2Ugc2hvdWxkIGRvCj4+Pj4+PiB0aGlzIGZvciBjb21wcmVzc2Vk
IGZpbGUuIEluIG15IHRlc3QsIGlmIHdlIGp1c3QgcmVtb3ZlIHRoaXMsIHdyaXRlCj4+Pj4+PiBz
YW1lIGZpbGUgaW4gbXVsdGl0aHJlYWQgd2lsbCBoYXZlIHByb2JsZW0sIGJ1dCBwYXJhbGxlbCB3
cml0ZQo+Pj4+Pj4gZGlmZmVyZW50IGZpbGVzIGluIG11bHRpdGhyZWFkIGlzIG9rLiBTbyBJIHRo
aW5rIG1heWJlIHdlIHNob3VsZAo+Pj4+Pj4gdXNlIGFub3RoZXIgbG9jayB0byBhbGxvdyB3cml0
ZSBkaWZmZXJlbnQgZmlsZXMgaW4gbXVsdGl0aHJlYWQuCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QK
TGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
