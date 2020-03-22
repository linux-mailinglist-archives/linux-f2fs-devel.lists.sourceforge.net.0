Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0BC18E918
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 22 Mar 2020 14:19:25 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jG0VY-0007Ef-KQ; Sun, 22 Mar 2020 13:19:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1jG0VX-0007EX-EQ
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 22 Mar 2020 13:19:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ePxAJ4baMviyqMbGEmicBKQI5BPWxLg8f9H9DTC69/U=; b=B+1hiRikAHnHCo6SuJ7YC5vEHB
 e4dljs3hhzEyCdDF4op32TSlsm3saAvI/Xpz02Q8EfOW+2BL482HmVAPrDTE5rRaj+Ezm9Rj1Z8lv
 rZVy8eC6v8wQWejHaFWK+noj6zHj4cmzNCqrOfYmSZTr88wpzqMOlEhkI9175ScBp+T8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ePxAJ4baMviyqMbGEmicBKQI5BPWxLg8f9H9DTC69/U=; b=nEcjpeUsN1j29mTTEOB5fPIEjs
 WokKSqxY9FujN6f/HCe33ZtVKzU46JzzjoPx3GnMpYUXtilXCd4iPq+CG+AOMJuleJoS7vGNffd5d
 fwYVHwOMA63K6YvVoNr4v1aIRxBp/xmkDsffEZzmttSmCbzwXC8R90R4y5E4FLitH6xI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jG0VU-003UZM-G7
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 22 Mar 2020 13:19:15 +0000
Received: from [192.168.0.107] (unknown [49.65.245.234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E780E206C3;
 Sun, 22 Mar 2020 13:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584883142;
 bh=cJjXz7mTR35bJeZ7sip2Qhg3W0McxHjMQu+j8nUdb9I=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=iGx7KuSE6BZZ+GLWAPN1YBrpSItELWyoE/Xzm/PEjrv4sg5hgyoKQBzrSvh/GQj6y
 kKdo2c1WzRdzaA0gM6nnR5DGUMgAO4NId3hP5nuIiW9wGPdckIgaary/EHtSy933CG
 6ekP1qHBQdaH7NqRUOK91pRmJqq9QTYzeVh9MkXs=
To: =?UTF-8?Q?Ond=c5=99ej_Jirman?= <megi@xff.cz>, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Chao Yu <yuchao0@huawei.com>
References: <20200322101327.5979-1-chao@kernel.org>
 <20200322121434.i2jea6o5tzanip7z@core.my.home>
From: Chao Yu <chao@kernel.org>
Message-ID: <47c71fe9-e168-8080-d0ed-2cfaa9a77e5e@kernel.org>
Date: Sun, 22 Mar 2020 21:18:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20200322121434.i2jea6o5tzanip7z@core.my.home>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jG0VU-003UZM-G7
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix potential .flags overflow on 32bit
 architecture
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

SGksCgpPbiAyMDIwLTMtMjIgMjA6MTQsIE9uZMWZZWogSmlybWFuIHdyb3RlOgo+IEhlbGxvLAo+
Cj4gT24gU3VuLCBNYXIgMjIsIDIwMjAgYXQgMDY6MTM6MjdQTSArMDgwMCwgQ2hhbyBZdSB3cm90
ZToKPj4gRnJvbTogQ2hhbyBZdSA8eXVjaGFvMEBodWF3ZWkuY29tPgo+Pgo+PiBmMmZzX2lub2Rl
X2luZm8uZmxhZ3MgaXMgdW5zaWduZWQgbG9uZyB2YXJpYWJsZSwgaXQgaGFzIDMyIGJpdHMKPj4g
aW4gMzJiaXQgYXJjaGl0ZWN0dXJlLCBzaW5jZSB3ZSBpbnRyb2R1Y2VkIEZJX01NQVBfRklMRSBm
bGFnCj4+IHdoZW4gd2Ugc3VwcG9ydCBkYXRhIGNvbXByZXNzaW9uLCB3ZSBtYXkgYWNjZXNzIG1l
bW9yeSBjcm9zcwo+PiB0aGUgYm9yZGVyIG9mIC5mbGFncyBmaWVsZCwgY29ycnVwdGluZyAuaV9z
ZW0gZmllbGQsIHJlc3VsdCBpbgo+PiBiZWxvdyBkZWFkbG9jay4KPj4KPj4gVG8gZml4IHRoaXMg
aXNzdWUsIGxldCdzIGludHJvZHVjZSAuZXh0cmFfZmxhZ3MgdG8gZ3JhYiBleHRyYQo+PiBzcGFj
ZSB0byBzdG9yZSB0aG9zZSBuZXcgZmxhZ3MuCj4+Cj4+IENhbGwgVHJhY2U6Cj4+ICBfX3NjaGVk
dWxlKzB4OGQwLzB4MTNmYwo+PiAgPyBtYXJrX2hlbGRfbG9ja3MrMHhhYy8weDEwMAo+PiAgc2No
ZWR1bGUrMHhjYy8weDI2MAo+PiAgcndzZW1fZG93bl93cml0ZV9zbG93cGF0aCsweDNhYi8weDY1
ZAo+PiAgZG93bl93cml0ZSsweGM3LzB4ZTAKPj4gIGYyZnNfZHJvcF9ubGluaysweDNkLzB4NjAw
IFtmMmZzXQo+PiAgZjJmc19kZWxldGVfaW5saW5lX2VudHJ5KzB4MzAwLzB4NDQwIFtmMmZzXQo+
PiAgZjJmc19kZWxldGVfZW50cnkrMHgzYTEvMHg3ZjAgW2YyZnNdCj4+ICBmMmZzX3VubGluaysw
eDUwMC8weDc5MCBbZjJmc10KPj4gIHZmc191bmxpbmsrMHgyMTEvMHg0OTAKPj4gIGRvX3VubGlu
a2F0KzB4NDgzLzB4NTIwCj4+ICBzeXNfdW5saW5rKzB4NGEvMHg3MAo+PiAgZG9fZmFzdF9zeXNj
YWxsXzMyKzB4MTJiLzB4NjgzCj4+ICBlbnRyeV9TWVNFTlRFUl8zMisweGFhLzB4MTAyCj4+Cj4+
IEZpeGVzOiA0YzhmZjcwOTViZWYgKCJmMmZzOiBzdXBwb3J0IGRhdGEgY29tcHJlc3Npb24iKQo+
PiBTaWduZWQtb2ZmLWJ5OiBDaGFvIFl1IDx5dWNoYW8wQGh1YXdlaS5jb20+Cj4+IC0tLQo+PiAg
ZnMvZjJmcy9mMmZzLmggIHwgMjYgKysrKysrKysrKysrKysrKysrKystLS0tLS0KPj4gIGZzL2Yy
ZnMvaW5vZGUuYyB8ICAxICsKPj4gIDIgZmlsZXMgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwg
NiBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZjJmcy5oIGIvZnMvZjJm
cy9mMmZzLmgKPj4gaW5kZXggZmNhZmE2ODIxMmViLi5mY2QyMmRmMmU5Y2EgMTAwNjQ0Cj4+IC0t
LSBhL2ZzL2YyZnMvZjJmcy5oCj4+ICsrKyBiL2ZzL2YyZnMvZjJmcy5oCj4+IEBAIC02OTUsNiAr
Njk1LDcgQEAgc3RydWN0IGYyZnNfaW5vZGVfaW5mbyB7Cj4+Cj4+ICAJLyogVXNlIGJlbG93IGlu
dGVybmFsbHkgaW4gZjJmcyovCj4+ICAJdW5zaWduZWQgbG9uZyBmbGFnczsJCS8qIHVzZSB0byBw
YXNzIHBlci1maWxlIGZsYWdzICovCj4+ICsJdW5zaWduZWQgbG9uZyBleHRyYV9mbGFnczsJLyog
ZXh0cmEgZmxhZ3MgKi8KPj4gIAlzdHJ1Y3Qgcndfc2VtYXBob3JlIGlfc2VtOwkvKiBwcm90ZWN0
IGZpIGluZm8gKi8KPj4gIAlhdG9taWNfdCBkaXJ0eV9wYWdlczsJCS8qICMgb2YgZGlydHkgcGFn
ZXMgKi8KPj4gIAlmMmZzX2hhc2hfdCBjaGFzaDsJCS8qIGhhc2ggdmFsdWUgb2YgZ2l2ZW4gZmls
ZSBuYW1lICovCj4+IEBAIC0yNTY5LDcgKzI1NzAsNyBAQCBlbnVtIHsKPj4gIH07Cj4+Cj4+ICBz
dGF0aWMgaW5saW5lIHZvaWQgX19tYXJrX2lub2RlX2RpcnR5X2ZsYWcoc3RydWN0IGlub2RlICpp
bm9kZSwKPj4gLQkJCQkJCWludCBmbGFnLCBib29sIHNldCkKPj4gKwkJCQkJdW5zaWduZWQgbG9u
ZyBsb25nIGZsYWcsIGJvb2wgc2V0KQo+PiAgewo+PiAgCXN3aXRjaCAoZmxhZykgewo+PiAgCWNh
c2UgRklfSU5MSU5FX1hBVFRSOgo+PiBAQCAtMjU4OCwyMCArMjU4OSwzMyBAQCBzdGF0aWMgaW5s
aW5lIHZvaWQgX19tYXJrX2lub2RlX2RpcnR5X2ZsYWcoc3RydWN0IGlub2RlICppbm9kZSwKPj4K
Pj4gIHN0YXRpYyBpbmxpbmUgdm9pZCBzZXRfaW5vZGVfZmxhZyhzdHJ1Y3QgaW5vZGUgKmlub2Rl
LCBpbnQgZmxhZykKPj4gIHsKPj4gLQlpZiAoIXRlc3RfYml0KGZsYWcsICZGMkZTX0koaW5vZGUp
LT5mbGFncykpCj4+IC0JCXNldF9iaXQoZmxhZywgJkYyRlNfSShpbm9kZSktPmZsYWdzKTsKPj4g
KwlpZiAoKDEgPDwgZmxhZykgPD0gc2l6ZW9mKHVuc2lnbmVkIGxvbmcpKSB7Cj4KPiBeIHRoaXMg
aXMgd3JvbmcuIE1heWJlIHlvdSBtZWFudCBmbGFnIDw9IEJJVFNfUEVSX0xPTkcKCk9oLCBteSBi
YWQsIEkgbWVhbnQgdGhhdCwgdGhhbmtzIGZvciBwb2ludGluZyBvdXQgdGhpcy4gOikKCj4KPiBB
bmQgZGl0dG8gZm9yIHRoZSBzYW1lIGNoZWNrcyBiZWxvdy4gTWF5YmUgeW91IGNhbiBtYWtlIGZs
YWdzIGFuIGFycmF5IG9mCj4gQklUX1dPUkQobWF4X2ZsYWdfdmFsdWUpICsgMSBhbmQgc2tpcCB0
aGUgYnJhbmNoZXMgYWx0b2dldGhlcj8KClRoYXQgd2lsbCBiZSBiZXR0ZXIsIGxldCBtZSByZXZp
c2UgdGhpcyBwYXRjaC4KClRoYW5rcywKCj4KPiB0aGFuayB5b3UgYW5kIHJlZ2FyZHMsCj4gCW8u
Cj4KPj4gKwkJaWYgKCF0ZXN0X2JpdChmbGFnLCAmRjJGU19JKGlub2RlKS0+ZmxhZ3MpKQo+PiAr
CQkJc2V0X2JpdChmbGFnLCAmRjJGU19JKGlub2RlKS0+ZmxhZ3MpOwo+PiArCX0gZWxzZSB7Cj4+
ICsJCWlmICghdGVzdF9iaXQoZmxhZyAtIDMyLCAmRjJGU19JKGlub2RlKS0+ZXh0cmFfZmxhZ3Mp
KQo+PiArCQkJc2V0X2JpdChmbGFnIC0gMzIsICZGMkZTX0koaW5vZGUpLT5leHRyYV9mbGFncyk7
Cj4+ICsJfQo+PiAgCV9fbWFya19pbm9kZV9kaXJ0eV9mbGFnKGlub2RlLCBmbGFnLCB0cnVlKTsK
Pj4gIH0KPj4KPj4gIHN0YXRpYyBpbmxpbmUgaW50IGlzX2lub2RlX2ZsYWdfc2V0KHN0cnVjdCBp
bm9kZSAqaW5vZGUsIGludCBmbGFnKQo+PiAgewo+PiAtCXJldHVybiB0ZXN0X2JpdChmbGFnLCAm
RjJGU19JKGlub2RlKS0+ZmxhZ3MpOwo+PiArCWlmICgoMSA8PCBmbGFnKSA8PSBzaXplb2YodW5z
aWduZWQgbG9uZykpCj4+ICsJCXJldHVybiB0ZXN0X2JpdChmbGFnLCAmRjJGU19JKGlub2RlKS0+
ZmxhZ3MpOwo+PiArCWVsc2UKPj4gKwkJcmV0dXJuIHRlc3RfYml0KGZsYWcgLSAzMiwgJkYyRlNf
SShpbm9kZSktPmV4dHJhX2ZsYWdzKTsKPj4gIH0KPj4KPj4gIHN0YXRpYyBpbmxpbmUgdm9pZCBj
bGVhcl9pbm9kZV9mbGFnKHN0cnVjdCBpbm9kZSAqaW5vZGUsIGludCBmbGFnKQo+PiAgewo+PiAt
CWlmICh0ZXN0X2JpdChmbGFnLCAmRjJGU19JKGlub2RlKS0+ZmxhZ3MpKQo+PiAtCQljbGVhcl9i
aXQoZmxhZywgJkYyRlNfSShpbm9kZSktPmZsYWdzKTsKPj4gKwlpZiAoKDEgPDwgZmxhZykgPD0g
c2l6ZW9mKHVuc2lnbmVkIGxvbmcpKSB7Cj4+ICsJCWlmICh0ZXN0X2JpdChmbGFnLCAmRjJGU19J
KGlub2RlKS0+ZmxhZ3MpKQo+PiArCQkJY2xlYXJfYml0KGZsYWcsICZGMkZTX0koaW5vZGUpLT5m
bGFncyk7Cj4+ICsJfSBlbHNlIHsKPj4gKwkJaWYgKHRlc3RfYml0KGZsYWcgLSAzMiwgJkYyRlNf
SShpbm9kZSktPmV4dHJhX2ZsYWdzKSkKPj4gKwkJCWNsZWFyX2JpdChmbGFnIC0gMzIsICZGMkZT
X0koaW5vZGUpLT5leHRyYV9mbGFncyk7Cj4+ICsJfQo+PiAgCV9fbWFya19pbm9kZV9kaXJ0eV9m
bGFnKGlub2RlLCBmbGFnLCBmYWxzZSk7Cj4+ICB9Cj4+Cj4+IGRpZmYgLS1naXQgYS9mcy9mMmZz
L2lub2RlLmMgYi9mcy9mMmZzL2lub2RlLmMKPj4gaW5kZXggNDRlMDhiZjJlMmI0Li5jYTkyNGQ3
ZTBlMzAgMTAwNjQ0Cj4+IC0tLSBhL2ZzL2YyZnMvaW5vZGUuYwo+PiArKysgYi9mcy9mMmZzL2lu
b2RlLmMKPj4gQEAgLTM2Myw2ICszNjMsNyBAQCBzdGF0aWMgaW50IGRvX3JlYWRfaW5vZGUoc3Ry
dWN0IGlub2RlICppbm9kZSkKPj4gIAlpZiAoU19JU1JFRyhpbm9kZS0+aV9tb2RlKSkKPj4gIAkJ
ZmktPmlfZmxhZ3MgJj0gfkYyRlNfUFJPSklOSEVSSVRfRkw7Cj4+ICAJZmktPmZsYWdzID0gMDsK
Pj4gKwlmaS0+ZXh0cmFfZmxhZ3MgPSAwOwo+PiAgCWZpLT5pX2FkdmlzZSA9IHJpLT5pX2Fkdmlz
ZTsKPj4gIAlmaS0+aV9waW5vID0gbGUzMl90b19jcHUocmktPmlfcGlubyk7Cj4+ICAJZmktPmlf
ZGlyX2xldmVsID0gcmktPmlfZGlyX2xldmVsOwo+PiAtLQo+PiAyLjIyLjAKPj4KCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVs
IG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRw
czovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVs
Cg==
