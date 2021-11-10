Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD9944BA69
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 10 Nov 2021 03:39:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mkdWR-00011D-M9; Wed, 10 Nov 2021 02:39:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1mkdWQ-000117-5S
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 10 Nov 2021 02:39:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OrjKzvz4KHRlfWvuSyrgONEWinWx08S8Y+DyUI3/Co4=; b=iX2xEOO1/er3PneuBNNhWtZ7dX
 Rtqsg0bCPMO1eXpHSN0ddSI0CFsIsU7WhV8TvAKAyoqWmUTFozzDBZed5SBP7KELEAtKTlnVA9nA3
 yPl/Jbm85acAvC8aAvvTMlEXabv/7bnViSbXL9VRGGPCkk1/Ll4L+lIIvHmQmhHjk1U4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OrjKzvz4KHRlfWvuSyrgONEWinWx08S8Y+DyUI3/Co4=; b=mnFObtZ3ywsN/OJZQMkwBEGFZw
 wVHCP1vruHm1pWRLw/cLma4z/6ZymZFATeL7P+i2csbO+LNSiknJwcIo6hm9fwayRUCKJsbkS10/x
 Az4PVkivpuejJ733yrJiNGGcXm9e4Dhb7rduTvPsae5n3ElWNPaq+DLAb7UgYftgvRHg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mkdWM-007x27-ER
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 10 Nov 2021 02:39:34 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7A9CA61105;
 Wed, 10 Nov 2021 02:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636511960;
 bh=ELaHoTX2nHxUHKVhO03RLJLkK0qBevjwVg7xk7VnqU8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=HDiq/CdFcQM5YJSxY7C7oVaVc7YkolQqcNfk2N3MThH1ClzhPII9/eddKSzp5dKAq
 mJM9ZlIxGs2Sp7GuqKztddJtPZnJ1j7ffgz06HQ7PXRRStYSlwD/1L2ZhzxFGReXck
 vqTFLm1WTZaOzbuTN/BUh9sgOvp7ACUX9pTYExa5OYdHwUpng9jGJkMaDF6KslDH4G
 LAJTSQZvbqT2CUKcHfF8e2n0fsX0nRdCxFwXOXG9/sEyqHBjMxWoAsAEdY79E9NQEV
 pBAFql3brGAFLc2K9wKs1AaDZgr3iHZ4NRERMnN5a9fH+GRQKt3obCggxu+hoYNBZi
 anRzHxihtDamw==
Message-ID: <15650d97-28d3-732c-f641-8f543d141ea7@kernel.org>
Date: Wed, 10 Nov 2021 10:39:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Content-Language: en-US
To: =?UTF-8?B?5bi45Yek5qWg?= <changfengnan@vivo.com>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>
References: <20211109035408.260852-1-changfengnan@vivo.com>
 <ALIA-QAiE0UFErjRNaMLZaqL.9.1636467042061.Hmail.changfengnan@vivo.com>
 <KL1PR0601MB4003B1F1D743572816552417BB939@KL1PR0601MB4003.apcprd06.prod.outlook.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <KL1PR0601MB4003B1F1D743572816552417BB939@KL1PR0601MB4003.apcprd06.prod.outlook.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2021/11/10 10:34, 常凤楠 wrote: > > >> 
 
 Content analysis details:   (-7.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [198.145.29.99 listed in list.dnswl.org]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mkdWM-007x27-ER
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: compress: reduce one page array
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
Cc: "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMS8xMS8xMCAxMDozNCwg5bi45Yek5qWgIHdyb3RlOgo+IAo+IAo+PiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQo+PiBGcm9tOiBjaGFuZ2ZlbmduYW5Adml2by5jb20gPGNoYW5nZmVu
Z25hbkB2aXZvLmNvbT4gT24gQmVoYWxmIE9mCj4+IENoYW8gWXUKPj4gU2VudDogVHVlc2RheSwg
Tm92ZW1iZXIgOSwgMjAyMSAxMDoxMSBQTQo+PiBUbzog5bi45Yek5qWgIDxjaGFuZ2ZlbmduYW5A
dml2by5jb20+OyBqYWVnZXVrQGtlcm5lbC5vcmcKPj4gQ2M6IGxpbnV4LWYyZnMtZGV2ZWxAbGlz
dHMuc291cmNlZm9yZ2UubmV0Cj4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjJdIGYyZnM6IGNvbXBy
ZXNzOiByZWR1Y2Ugb25lIHBhZ2UgYXJyYXkgYWxsb2MgYW5kCj4+IGZyZWUgd2hlbiB3cml0ZSBj
b21wcmVzc2VkIHBhZ2UKPj4KPj4gT24gMjAyMS8xMS85IDExOjU0LCBGZW5nbmFuIENoYW5nIHdy
b3RlOgo+Pj4gRG9uJ3QgYWxsb2MgbmV3IHBhZ2UgcG9pbnRlcnMgYXJyYXkgdG8gcmVwbGFjZSBv
bGQsIGp1c3QgdXNlIG9sZCwKPj4+IGludHJvZHVjZSB2YWxpZF9ucl9jcGFnZXMgdG8gaW5kaWNh
dGUgdmFsaWQgbnVtYmVyIG9mIHBhZ2UgcG9pbnRlcnMgaW4KPj4+IGFycmF5LCB0cnkgdG8gcmVk
dWNlIG9uZSBwYWdlIGFycmF5IGFsbG9jIGFuZCBmcmVlIHdoZW4gd3JpdGUgY29tcHJlc3MKPj4g
cGFnZS4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBGZW5nbmFuIENoYW5nIDxjaGFuZ2ZlbmduYW5A
dml2by5jb20+Cj4+PiAtLS0KPj4+ICAgIGZzL2YyZnMvY29tcHJlc3MuYyB8IDI3ICsrKysrKysr
Ky0tLS0tLS0tLS0tLS0tLS0tLQo+Pj4gICAgZnMvZjJmcy9kYXRhLmMgICAgIHwgIDEgKwo+Pj4g
ICAgZnMvZjJmcy9mMmZzLmggICAgIHwgIDEgKwo+Pj4gICAgMyBmaWxlcyBjaGFuZ2VkLCAxMSBp
bnNlcnRpb25zKCspLCAxOCBkZWxldGlvbnMoLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJm
cy9jb21wcmVzcy5jIGIvZnMvZjJmcy9jb21wcmVzcy5jIGluZGV4Cj4+PiA5YjY2M2VhZjQ4MDUu
LjI4Nzg1ZGQ3OGM2ZiAxMDA2NDQKPj4+IC0tLSBhL2ZzL2YyZnMvY29tcHJlc3MuYwo+Pj4gKysr
IGIvZnMvZjJmcy9jb21wcmVzcy5jCj4+PiBAQCAtMTUzLDYgKzE1Myw3IEBAIHZvaWQgZjJmc19k
ZXN0cm95X2NvbXByZXNzX2N0eChzdHJ1Y3QKPj4gY29tcHJlc3NfY3R4ICpjYywgYm9vbCByZXVz
ZSkKPj4+ICAgIAljYy0+cnBhZ2VzID0gTlVMTDsKPj4+ICAgIAljYy0+bnJfcnBhZ2VzID0gMDsK
Pj4+ICAgIAljYy0+bnJfY3BhZ2VzID0gMDsKPj4+ICsJY2MtPnZhbGlkX25yX2NwYWdlcyA9IDA7
Cj4+PiAgICAJaWYgKCFyZXVzZSkKPj4+ICAgIAkJY2MtPmNsdXN0ZXJfaWR4ID0gTlVMTF9DTFVT
VEVSOwo+Pj4gICAgfQo+Pj4gQEAgLTYxOSw3ICs2MjAsNiBAQCBzdGF0aWMgaW50IGYyZnNfY29t
cHJlc3NfcGFnZXMoc3RydWN0Cj4+IGNvbXByZXNzX2N0eCAqY2MpCj4+PiAgICAJY29uc3Qgc3Ry
dWN0IGYyZnNfY29tcHJlc3Nfb3BzICpjb3BzID0KPj4+ICAgIAkJCQlmMmZzX2NvcHNbZmktPmlf
Y29tcHJlc3NfYWxnb3JpdGhtXTsKPj4+ICAgIAl1bnNpZ25lZCBpbnQgbWF4X2xlbiwgbmV3X25y
X2NwYWdlczsKPj4+IC0Jc3RydWN0IHBhZ2UgKipuZXdfY3BhZ2VzOwo+Pj4gICAgCXUzMiBjaGtz
dW0gPSAwOwo+Pj4gICAgCWludCBpLCByZXQ7Cj4+Pgo+Pj4gQEAgLTYzNCw2ICs2MzQsNyBAQCBz
dGF0aWMgaW50IGYyZnNfY29tcHJlc3NfcGFnZXMoc3RydWN0Cj4+IGNvbXByZXNzX2N0eAo+Pj4g
KmNjKQo+Pj4KPj4+ICAgIAltYXhfbGVuID0gQ09NUFJFU1NfSEVBREVSX1NJWkUgKyBjYy0+Y2xl
bjsKPj4+ICAgIAljYy0+bnJfY3BhZ2VzID0gRElWX1JPVU5EX1VQKG1heF9sZW4sIFBBR0VfU0la
RSk7Cj4+PiArCWNjLT52YWxpZF9ucl9jcGFnZXMgPSBjYy0+bnJfY3BhZ2VzOwo+Pj4KPj4+ICAg
IAljYy0+Y3BhZ2VzID0gcGFnZV9hcnJheV9hbGxvYyhjYy0+aW5vZGUsIGNjLT5ucl9jcGFnZXMp
Owo+Pj4gICAgCWlmICghY2MtPmNwYWdlcykgewo+Pj4gQEAgLTY4NCwxMyArNjg1LDYgQEAgc3Rh
dGljIGludCBmMmZzX2NvbXByZXNzX3BhZ2VzKHN0cnVjdAo+Pj4gY29tcHJlc3NfY3R4ICpjYykK
Pj4+Cj4+PiAgICAJbmV3X25yX2NwYWdlcyA9IERJVl9ST1VORF9VUChjYy0+Y2xlbiArCj4+IENP
TVBSRVNTX0hFQURFUl9TSVpFLAo+Pj4gUEFHRV9TSVpFKTsKPj4+Cj4+PiAtCS8qIE5vdyB3ZSdy
ZSBnb2luZyB0byBjdXQgdW5uZWNlc3NhcnkgdGFpbCBwYWdlcyAqLwo+Pj4gLQluZXdfY3BhZ2Vz
ID0gcGFnZV9hcnJheV9hbGxvYyhjYy0+aW5vZGUsIG5ld19ucl9jcGFnZXMpOwo+Pj4gLQlpZiAo
IW5ld19jcGFnZXMpIHsKPj4+IC0JCXJldCA9IC1FTk9NRU07Cj4+PiAtCQlnb3RvIG91dF92dW5t
YXBfY2J1ZjsKPj4KPj4gSXQgcmVtb3ZlcyBsYXN0IHVzZXIgb2Ygb3V0X3Z1bm1hcF9jYnVmIGxh
YmVsLCBzbyB3ZSBjYW4gcmVtb3ZlIGJlbG93Cj4+IGRlYWQgY29kZXMgaW4gZXJyb3IgcGF0aCBh
cyB3ZWxsLgo+Pgo+PiBvdXRfdnVubWFwX2NidWY6Cj4+IAl2bV91bm1hcF9yYW0oY2MtPmNidWYs
IGNjLT5ucl9jcGFnZXMpOwo+IAo+IE5vdCByaWdodCwgdGhlcmUgc3RpbGwgb3RoZXIgY29kZSB1
c2UgdGhpcy4KCk9oLCByaWdodC4gOikKClRoYW5rcywKCj4gCj4gVGhhbmtzLgo+Pgo+Pj4gLQl9
Cj4+PiAtCj4+PiAgICAJLyogemVybyBvdXQgYW55IHVudXNlZCBwYXJ0IG9mIHRoZSBsYXN0IHBh
Z2UgKi8KPj4+ICAgIAltZW1zZXQoJmNjLT5jYnVmLT5jZGF0YVtjYy0+Y2xlbl0sIDAsCj4+PiAg
ICAJCQkobmV3X25yX2NwYWdlcyAqIFBBR0VfU0laRSkgLQo+Pj4gQEAgLTcwMSw3ICs2OTUsNiBA
QCBzdGF0aWMgaW50IGYyZnNfY29tcHJlc3NfcGFnZXMoc3RydWN0Cj4+IGNvbXByZXNzX2N0eAo+
Pj4gKmNjKQo+Pj4KPj4+ICAgIAlmb3IgKGkgPSAwOyBpIDwgY2MtPm5yX2NwYWdlczsgaSsrKSB7
Cj4+PiAgICAJCWlmIChpIDwgbmV3X25yX2NwYWdlcykgewo+Pj4gLQkJCW5ld19jcGFnZXNbaV0g
PSBjYy0+Y3BhZ2VzW2ldOwo+Pj4gICAgCQkJY29udGludWU7Cj4+PiAgICAJCX0KPj4KPj4gaWYg
KGkgPCBuZXdfbnJfY3BhZ2VzKQo+PiAJY29udGludWU7Cj4+Cj4+PiAgICAJCWYyZnNfY29tcHJl
c3NfZnJlZV9wYWdlKGNjLT5jcGFnZXNbaV0pOwo+Pj4gQEAgLTcxMSw5ICs3MDQsNyBAQCBzdGF0
aWMgaW50IGYyZnNfY29tcHJlc3NfcGFnZXMoc3RydWN0Cj4+IGNvbXByZXNzX2N0eCAqY2MpCj4+
PiAgICAJaWYgKGNvcHMtPmRlc3Ryb3lfY29tcHJlc3NfY3R4KQo+Pj4gICAgCQljb3BzLT5kZXN0
cm95X2NvbXByZXNzX2N0eChjYyk7Cj4+Pgo+Pj4gLQlwYWdlX2FycmF5X2ZyZWUoY2MtPmlub2Rl
LCBjYy0+Y3BhZ2VzLCBjYy0+bnJfY3BhZ2VzKTsKPj4+IC0JY2MtPmNwYWdlcyA9IG5ld19jcGFn
ZXM7Cj4+PiAtCWNjLT5ucl9jcGFnZXMgPSBuZXdfbnJfY3BhZ2VzOwo+Pj4gKwljYy0+dmFsaWRf
bnJfY3BhZ2VzID0gbmV3X25yX2NwYWdlczsKPj4+Cj4+PiAgICAJdHJhY2VfZjJmc19jb21wcmVz
c19wYWdlc19lbmQoY2MtPmlub2RlLCBjYy0+Y2x1c3Rlcl9pZHgsCj4+PiAgICAJCQkJCQkJY2Mt
PmNsZW4sIHJldCk7Cj4+PiBAQCAtMTI4OCwxNCArMTI3OSwxNCBAQCBzdGF0aWMgaW50Cj4+IGYy
ZnNfd3JpdGVfY29tcHJlc3NlZF9wYWdlcyhzdHJ1Y3QKPj4+IGNvbXByZXNzX2N0eCAqY2MsCj4+
Pgo+Pj4gICAgCWNpYy0+bWFnaWMgPSBGMkZTX0NPTVBSRVNTRURfUEFHRV9NQUdJQzsKPj4+ICAg
IAljaWMtPmlub2RlID0gaW5vZGU7Cj4+PiAtCWF0b21pY19zZXQoJmNpYy0+cGVuZGluZ19wYWdl
cywgY2MtPm5yX2NwYWdlcyk7Cj4+PiArCWF0b21pY19zZXQoJmNpYy0+cGVuZGluZ19wYWdlcywg
Y2MtPnZhbGlkX25yX2NwYWdlcyk7Cj4+PiAgICAJY2ljLT5ycGFnZXMgPSBwYWdlX2FycmF5X2Fs
bG9jKGNjLT5pbm9kZSwgY2MtPmNsdXN0ZXJfc2l6ZSk7Cj4+PiAgICAJaWYgKCFjaWMtPnJwYWdl
cykKPj4+ICAgIAkJZ290byBvdXRfcHV0X2NpYzsKPj4+Cj4+PiAgICAJY2ljLT5ucl9ycGFnZXMg
PSBjYy0+Y2x1c3Rlcl9zaXplOwo+Pj4KPj4+IC0JZm9yIChpID0gMDsgaSA8IGNjLT5ucl9jcGFn
ZXM7IGkrKykgewo+Pj4gKwlmb3IgKGkgPSAwOyBpIDwgY2MtPnZhbGlkX25yX2NwYWdlczsgaSsr
KSB7Cj4+PiAgICAJCWYyZnNfc2V0X2NvbXByZXNzZWRfcGFnZShjYy0+Y3BhZ2VzW2ldLCBpbm9k
ZSwKPj4+ICAgIAkJCQkJY2MtPnJwYWdlc1tpICsgMV0tPmluZGV4LCBjaWMpOwo+Pj4gICAgCQlm
aW8uY29tcHJlc3NlZF9wYWdlID0gY2MtPmNwYWdlc1tpXTsgQEAgLTEzNDAsNyArMTMzMSw3Cj4+
IEBAIHN0YXRpYwo+Pj4gaW50IGYyZnNfd3JpdGVfY29tcHJlc3NlZF9wYWdlcyhzdHJ1Y3QgY29t
cHJlc3NfY3R4ICpjYywKPj4+ICAgIAkJaWYgKGZpby5jb21wcl9ibG9ja3MgJiYgX19pc192YWxp
ZF9kYXRhX2Jsa2FkZHIoYmxrYWRkcikpCj4+PiAgICAJCQlmaW8uY29tcHJfYmxvY2tzKys7Cj4+
Pgo+Pj4gLQkJaWYgKGkgPiBjYy0+bnJfY3BhZ2VzKSB7Cj4+PiArCQlpZiAoaSA+IGNjLT52YWxp
ZF9ucl9jcGFnZXMpIHsKPj4+ICAgIAkJCWlmIChfX2lzX3ZhbGlkX2RhdGFfYmxrYWRkcihibGth
ZGRyKSkgewo+Pj4gICAgCQkJCWYyZnNfaW52YWxpZGF0ZV9ibG9ja3Moc2JpLCBibGthZGRyKTsK
Pj4+ICAgIAkJCQlmMmZzX3VwZGF0ZV9kYXRhX2Jsa2FkZHIoJmRuLCBORVdfQUREUik7IEBACj4+
IC0xMzY1LDggKzEzNTYsOCBAQAo+Pj4gc3RhdGljIGludCBmMmZzX3dyaXRlX2NvbXByZXNzZWRf
cGFnZXMoc3RydWN0IGNvbXByZXNzX2N0eCAqY2MsCj4+Pgo+Pj4gICAgCWlmIChmaW8uY29tcHJf
YmxvY2tzKQo+Pj4gICAgCQlmMmZzX2lfY29tcHJfYmxvY2tzX3VwZGF0ZShpbm9kZSwgZmlvLmNv
bXByX2Jsb2NrcyAtIDEsCj4+IGZhbHNlKTsKPj4+IC0JZjJmc19pX2NvbXByX2Jsb2Nrc191cGRh
dGUoaW5vZGUsIGNjLT5ucl9jcGFnZXMsIHRydWUpOwo+Pj4gLQlhZGRfY29tcHJfYmxvY2tfc3Rh
dChpbm9kZSwgY2MtPm5yX2NwYWdlcyk7Cj4+PiArCWYyZnNfaV9jb21wcl9ibG9ja3NfdXBkYXRl
KGlub2RlLCBjYy0+dmFsaWRfbnJfY3BhZ2VzLCB0cnVlKTsKPj4+ICsJYWRkX2NvbXByX2Jsb2Nr
X3N0YXQoaW5vZGUsIGNjLT52YWxpZF9ucl9jcGFnZXMpOwo+Pj4KPj4+ICAgIAlzZXRfaW5vZGVf
ZmxhZyhjYy0+aW5vZGUsIEZJX0FQUEVORF9XUklURSk7Cj4+PiAgICAJaWYgKGNjLT5jbHVzdGVy
X2lkeCA9PSAwKQo+Pj4gQEAgLTE0MDQsNyArMTM5NSw3IEBAIHN0YXRpYyBpbnQgZjJmc193cml0
ZV9jb21wcmVzc2VkX3BhZ2VzKHN0cnVjdAo+PiBjb21wcmVzc19jdHggKmNjLAo+Pj4gICAgCWVs
c2UKPj4+ICAgIAkJZjJmc191bmxvY2tfb3Aoc2JpKTsKPj4+ICAgIG91dF9mcmVlOgo+Pj4gLQlm
b3IgKGkgPSAwOyBpIDwgY2MtPm5yX2NwYWdlczsgaSsrKSB7Cj4+PiArCWZvciAoaSA9IDA7IGkg
PCBjYy0+dmFsaWRfbnJfY3BhZ2VzOyBpKyspIHsKPj4+ICAgIAkJaWYgKCFjYy0+Y3BhZ2VzW2ld
KQo+Pj4gICAgCQkJY29udGludWU7Cj4+Cj4+IFdlIGNhbiByZW1vdmUgYWJvdmUgY3BhZ2VzIGNo
ZWNrPwo+Pgo+PiBUaGFua3MsCj4+Cj4+PiAgICAJCWYyZnNfY29tcHJlc3NfZnJlZV9wYWdlKGNj
LT5jcGFnZXNbaV0pOwo+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZGF0YS5jIGIvZnMvZjJmcy9k
YXRhLmMgaW5kZXgKPj4+IGY0ZmQ2YzI0NmM5YS4uNGRkYzBiYTBmMmMwIDEwMDY0NAo+Pj4gLS0t
IGEvZnMvZjJmcy9kYXRhLmMKPj4+ICsrKyBiL2ZzL2YyZnMvZGF0YS5jCj4+PiBAQCAtMjkzNCw2
ICsyOTM0LDcgQEAgc3RhdGljIGludCBmMmZzX3dyaXRlX2NhY2hlX3BhZ2VzKHN0cnVjdAo+PiBh
ZGRyZXNzX3NwYWNlICptYXBwaW5nLAo+Pj4gICAgCQkucnBhZ2VzID0gTlVMTCwKPj4+ICAgIAkJ
Lm5yX3JwYWdlcyA9IDAsCj4+PiAgICAJCS5jcGFnZXMgPSBOVUxMLAo+Pj4gKwkJLnZhbGlkX25y
X2NwYWdlcyA9IDAsCj4+PiAgICAJCS5yYnVmID0gTlVMTCwKPj4+ICAgIAkJLmNidWYgPSBOVUxM
LAo+Pj4gICAgCQkucmxlbiA9IFBBR0VfU0laRSAqIEYyRlNfSShpbm9kZSktPmlfY2x1c3Rlcl9z
aXplLCBkaWZmIC0tZ2l0Cj4+PiBhL2ZzL2YyZnMvZjJmcy5oIGIvZnMvZjJmcy9mMmZzLmggaW5k
ZXggMDM5YTIyOWUxMWM5Li5hY2I1ODdmMDU0ZGIKPj4+IDEwMDY0NAo+Pj4gLS0tIGEvZnMvZjJm
cy9mMmZzLmgKPj4+ICsrKyBiL2ZzL2YyZnMvZjJmcy5oCj4+PiBAQCAtMTQ4MSw2ICsxNDgxLDcg
QEAgc3RydWN0IGNvbXByZXNzX2N0eCB7Cj4+PiAgICAJdW5zaWduZWQgaW50IG5yX3JwYWdlczsJ
CS8qIHRvdGFsIHBhZ2UgbnVtYmVyIGluIHJwYWdlcwo+PiAqLwo+Pj4gICAgCXN0cnVjdCBwYWdl
ICoqY3BhZ2VzOwkJLyogcGFnZXMgc3RvcmUgY29tcHJlc3NlZCBkYXRhIGluCj4+IGNsdXN0ZXIg
Ki8KPj4+ICAgIAl1bnNpZ25lZCBpbnQgbnJfY3BhZ2VzOwkJLyogdG90YWwgcGFnZSBudW1iZXIg
aW4gY3BhZ2VzCj4+ICovCj4+PiArCXVuc2lnbmVkIGludCB2YWxpZF9ucl9jcGFnZXM7CS8qIHZh
bGlkIHBhZ2UgbnVtYmVyIGluIGNwYWdlcyAqLwo+Pj4gICAgCXZvaWQgKnJidWY7CQkJLyogdmly
dHVhbCBtYXBwZWQgYWRkcmVzcyBvbiBycGFnZXMgKi8KPj4+ICAgIAlzdHJ1Y3QgY29tcHJlc3Nf
ZGF0YSAqY2J1ZjsJLyogdmlydHVhbCBtYXBwZWQgYWRkcmVzcyBvbgo+PiBjcGFnZXMgKi8KPj4+
ICAgIAlzaXplX3QgcmxlbjsJCQkvKiB2YWxpZCBkYXRhIGxlbmd0aCBpbiByYnVmICovCj4+PgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYy
ZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2Uu
bmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYy
ZnMtZGV2ZWwK
