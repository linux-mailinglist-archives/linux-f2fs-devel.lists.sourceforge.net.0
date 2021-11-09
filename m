Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 147DB44AF01
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  9 Nov 2021 14:46:51 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mkRSW-0003rc-Hz; Tue, 09 Nov 2021 13:46:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1mkRSV-0003rW-VV
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 09 Nov 2021 13:46:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6qNIqtvFRZ7Zmt9qnDOi8Tu4pOhhVcWwds0iUJ0M1Yc=; b=IaE5GUhQxk8wESlEZcweiQBD/t
 tzcTiNi851jy7/a2t6J7f77iWRMgX/HSdE5hV0f+6obGFT4x13YIybuHpEqWd9Y1qBXiTiQLOSVqu
 GIsuxDSYqYGo7w+P7gPZuQ84V6cpxyplScemUmygmytuh27B4JIESUehRExrXFgbnHaw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6qNIqtvFRZ7Zmt9qnDOi8Tu4pOhhVcWwds0iUJ0M1Yc=; b=GqujlNLKrecALxaaEbi3Y9ioP4
 oP5LY6GYTD+/adYxQY/i/lYRts1UBQD4D6Od3iTbW5o2xMJgY4SceaW0SiYVYxmg3+spdM5s4VOoU
 ZXaROfgKI2vBjae+NeLLF3UJyyI1KiJZoo8H7uKQ6hdv02YkQfdBrJjIlybyD5sRsAfU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mkRSU-0001iw-Fe
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 09 Nov 2021 13:46:43 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 87D4560F9B;
 Tue,  9 Nov 2021 13:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636465592;
 bh=4oXDkmOZn38BU56v1wNZqHsvMfK5PkYh0tJiSaFJW6o=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QVaY/nLMWs3xIkwRD5wZHIWiUbxfdJx3W/eWgrW599gonR+ZPkkev7gdIJAFxpoai
 be8bbnGSpOWkol8GM0joreQG2MOmFB2n1WgFEuEgdvG/RH3o4S8V3Dzzd7uMz4IM30
 wWdeEK7P1yGM4uubLtrOpr+Jq1swmON3eScUTkzLPvVGtEEJsNGhUGpJc7Fo7MIQUB
 3jeLNP2dn6V9BqWJ/GaWZB5aoxVKfGsquWt3q0S1WsXbIiCVTaOO+rdcOgQWYJa3/v
 hb/FlM2Cc2kek3GX9qK0e0WVym/zH70ykRm76HFNBJf69tJPrKTA3piJXYrOIdUnc+
 HY0BT+4DRBytw==
Message-ID: <0033e568-3bcb-f0f8-51f6-f4ba3932ab00@kernel.org>
Date: Tue, 9 Nov 2021 21:46:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: =?UTF-8?B?5bi45Yek5qWg?= <changfengnan@vivo.com>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>
References: <20211108035459.40139-1-changfengnan@vivo.com>
 <KL1PR0601MB4003615E989DEFDE86793B58BB919@KL1PR0601MB4003.apcprd06.prod.outlook.com>
 <AI6AmQANEzwDyLqc-ild4qqN.9.1636381829406.Hmail.changfengnan@vivo.com>
 <KL1PR0601MB400396B05790858364501F3EBB929@KL1PR0601MB4003.apcprd06.prod.outlook.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <KL1PR0601MB400396B05790858364501F3EBB929@KL1PR0601MB4003.apcprd06.prod.outlook.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2021/11/9 11:18, 常凤楠 wrote: > > >> 
 
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
X-Headers-End: 1mkRSU-0001iw-Fe
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

T24gMjAyMS8xMS85IDExOjE4LCDluLjlh6TmpaAgd3JvdGU6Cj4gCj4gCj4+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tCj4+IEZyb206IGNoYW5nZmVuZ25hbkB2aXZvLmNvbSA8Y2hhbmdmZW5n
bmFuQHZpdm8uY29tPiBPbiBCZWhhbGYgT2YKPj4gQ2hhbyBZdQo+PiBTZW50OiBNb25kYXksIE5v
dmVtYmVyIDgsIDIwMjEgMTA6MzAgUE0KPj4gVG86IOW4uOWHpOaloCA8Y2hhbmdmZW5nbmFuQHZp
dm8uY29tPjsgamFlZ2V1a0BrZXJuZWwub3JnCj4+IENjOiBsaW51eC1mMmZzLWRldmVsQGxpc3Rz
LnNvdXJjZWZvcmdlLm5ldAo+PiBTdWJqZWN0OiBSZTogRG8gd2UgbmVlZCBzZXJpYWwgaW8gZm9y
IGNvbXByZXNzIGZpbGU/Cj4+Cj4+IE9uIDIwMjEvMTEvOCAxNjo1Niwg5bi45Yek5qWgIHdyb3Rl
Ogo+Pj4gQW55d2F5LCBJIGRpZCBzb21lIG1vZGlmeSB0byB2ZXJpZnkgbXkgaWRlYSwgYW5kIGRp
ZCBzb21lIHRlc3QsIG5vdAo+PiBmb3VuZCBwcm9ibGVtIGZvciBub3cuCj4+Cj4+IENvdWxkIHlv
dSBwbGVhc2UgY29uc2lkZXI6Cj4+IDEuIHBpbiBmaWxlCj4+IDIuIGZhbGxvY2F0ZSBmaWxlIHcv
IGZpbGVzaXplIGtlZXBlZAo+PiAgICAtIGl0IHdpbGwgcHJlYWxsb2NhdGUgcGh5c2ljYWwgYmxv
Y2tzIGFsaWduZWQgdG8gc2VnbWVudHMgMy4gdW5waW4gZmlsZSA0Lgo+PiBvdmVyd3JpdGUgY29t
cHJlc3NlZCBmaWxlCj4gCj4gU28geW91IG1lYW5zIGFmdGVyIHN0ZXAgMS0zLCBpdCB3aWxsIG1h
a2UgY29tcHJlc3NlZCBmaWxlIGZyYWdtZW50YXRpb24gd29yc2UgPwoKT2gsIEknbSB0cnlpbmcg
dG8gZmluZCBhIHdheSB0byBhdm9pZCB3cml0ZSBwZXJmb3JtYW5jZSByZWdyZXNzaW9uIGR1ZSB0
byByYWNlCmNvbmRpdGlvbiBvbiB3cml0ZXBhZ2VzIGxvY2sgbWVhbndoaWxlIGF2b2lkaW5nIGZy
YWdtZW50YXRpb24gb2YgY29tcHJlc3NlZCBmaWxlLgpCdXQgSSdtIG91dCBvZiBteSBtaW5kLCBh
Ym92ZSBjYXNlIHdvdWxkbid0IGhlbHAsIHBsZWFzZSBpZ25vcmUgdGhpcy4KClRoYW5rcywKCj4g
Cj4gVGhhbmtzLgo+Pgo+PiBUaGFua3MsCj4+Cj4+Pgo+Pj4gVGhlIG1vZGlmeSBhcyBmb2xsb3dz
Ogo+Pj4KPj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2RhdGEuYyBiL2ZzL2YyZnMvZGF0YS5jIGlu
ZGV4Cj4+PiBmNGZkNmMyNDZjOWEuLjBlZDY3N2VmZTgyMCAxMDA2NDQKPj4+IC0tLSBhL2ZzL2Yy
ZnMvZGF0YS5jCj4+PiArKysgYi9mcy9mMmZzL2RhdGEuYwo+Pj4gQEAgLTMxNjUsOCArMzE2NSw2
IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBfX3Nob3VsZF9zZXJpYWxpemVfaW8oc3RydWN0Cj4+IGlu
b2RlICppbm9kZSwKPj4+ICAgIAlpZiAoSVNfTk9RVU9UQShpbm9kZSkpCj4+PiAgICAJCXJldHVy
biBmYWxzZTsKPj4+Cj4+PiAtCWlmIChmMmZzX25lZWRfY29tcHJlc3NfZGF0YShpbm9kZSkpCj4+
PiAtCQlyZXR1cm4gdHJ1ZTsKPj4+ICAgIAlpZiAod2JjLT5zeW5jX21vZGUgIT0gV0JfU1lOQ19B
TEwpCj4+PiAgICAJCXJldHVybiB0cnVlOwo+Pj4gICAgCWlmIChnZXRfZGlydHlfcGFnZXMoaW5v
ZGUpID49Cj4+PiBTTV9JKEYyRlNfSV9TQihpbm9kZSkpLT5taW5fc2VxX2Jsb2NrcykKPj4+IEBA
IC0zMjE4LDExICszMjE2LDE2IEBAIHN0YXRpYyBpbnQgX19mMmZzX3dyaXRlX2RhdGFfcGFnZXMo
c3RydWN0Cj4+IGFkZHJlc3Nfc3BhY2UgKm1hcHBpbmcsCj4+PiAgICAJCW11dGV4X2xvY2soJnNi
aS0+d3JpdGVwYWdlcyk7Cj4+PiAgICAJCWxvY2tlZCA9IHRydWU7Cj4+PiAgICAJfQo+Pj4gKwlp
ZiAoZjJmc19uZWVkX2NvbXByZXNzX2RhdGEoaW5vZGUpKQo+Pj4gKwkJbXV0ZXhfbG9jaygmKEYy
RlNfSShpbm9kZSktPmNvbXByZXNzX2xvY2spKTsKPj4+Cj4+PiAgICAJYmxrX3N0YXJ0X3BsdWco
JnBsdWcpOwo+Pj4gICAgCXJldCA9IGYyZnNfd3JpdGVfY2FjaGVfcGFnZXMobWFwcGluZywgd2Jj
LCBpb190eXBlKTsKPj4+ICAgIAlibGtfZmluaXNoX3BsdWcoJnBsdWcpOwo+Pj4KPj4+ICsJaWYg
KGYyZnNfbmVlZF9jb21wcmVzc19kYXRhKGlub2RlKSkKPj4+ICsJCW11dGV4X3VubG9jaygmKEYy
RlNfSShpbm9kZSktPmNvbXByZXNzX2xvY2spKTsKPj4+ICsKPj4+ICAgIAlpZiAobG9ja2VkKQo+
Pj4gICAgCQltdXRleF91bmxvY2soJnNiaS0+d3JpdGVwYWdlcyk7Cj4+Pgo+Pj4gZGlmZiAtLWdp
dCBhL2ZzL2YyZnMvZjJmcy5oIGIvZnMvZjJmcy9mMmZzLmggaW5kZXgKPj4+IDAzOWEyMjllMTFj
OS4uM2E2NTg3ZjEzZDJmIDEwMDY0NAo+Pj4gLS0tIGEvZnMvZjJmcy9mMmZzLmgKPj4+ICsrKyBi
L2ZzL2YyZnMvZjJmcy5oCj4+PiBAQCAtNzYzLDYgKzc2Myw3IEBAIHN0cnVjdCBmMmZzX2lub2Rl
X2luZm8gewo+Pj4gICAgCXN0cnVjdCBsaXN0X2hlYWQgaW5tZW1fcGFnZXM7CS8qIGlubWVtb3J5
IHBhZ2VzIG1hbmFnZWQgYnkKPj4gZjJmcyAqLwo+Pj4gICAgCXN0cnVjdCB0YXNrX3N0cnVjdCAq
aW5tZW1fdGFzazsJLyogc3RvcmUgaW5tZW1vcnkgdGFzayAqLwo+Pj4gICAgCXN0cnVjdCBtdXRl
eCBpbm1lbV9sb2NrOwkvKiBsb2NrIGZvciBpbm1lbW9yeSBwYWdlcyAqLwo+Pj4gKwlzdHJ1Y3Qg
bXV0ZXggY29tcHJlc3NfbG9jazsJLyogbG9jayBmb3IgY29tcHJlc3MgZmlsZSAqLwo+Pj4gICAg
CXN0cnVjdCBleHRlbnRfdHJlZSAqZXh0ZW50X3RyZWU7CS8qIGNhY2hlZCBleHRlbnRfdHJlZSBl
bnRyeSAqLwo+Pj4KPj4+ICAgIAkvKiBhdm9pZCByYWNpbmcgYmV0d2VlbiBmb3JlZ3JvdW5kIG9w
IGFuZCBnYyAqLyBkaWZmIC0tZ2l0Cj4+PiBhL2ZzL2YyZnMvc3VwZXIuYyBiL2ZzL2YyZnMvc3Vw
ZXIuYyBpbmRleCBhMTMzOTMyMzMzYzUuLjg1NjZlOWMzNDU0MAo+Pj4gMTAwNjQ0Cj4+PiAtLS0g
YS9mcy9mMmZzL3N1cGVyLmMKPj4+ICsrKyBiL2ZzL2YyZnMvc3VwZXIuYwo+Pj4gQEAgLTEzMjMs
NiArMTMyMyw3IEBAIHN0YXRpYyBzdHJ1Y3QgaW5vZGUgKmYyZnNfYWxsb2NfaW5vZGUoc3RydWN0
Cj4+IHN1cGVyX2Jsb2NrICpzYikKPj4+ICAgIAlJTklUX0xJU1RfSEVBRCgmZmktPmlubWVtX2ls
aXN0KTsKPj4+ICAgIAlJTklUX0xJU1RfSEVBRCgmZmktPmlubWVtX3BhZ2VzKTsKPj4+ICAgIAlt
dXRleF9pbml0KCZmaS0+aW5tZW1fbG9jayk7Cj4+PiArCW11dGV4X2luaXQoJmZpLT5jb21wcmVz
c19sb2NrKTsKPj4+ICAgIAlpbml0X3J3c2VtKCZmaS0+aV9nY19yd3NlbVtSRUFEXSk7Cj4+PiAg
ICAJaW5pdF9yd3NlbSgmZmktPmlfZ2NfcndzZW1bV1JJVEVdKTsKPj4+ICAgIAlpbml0X3J3c2Vt
KCZmaS0+aV94YXR0cl9zZW0pOwo+Pj4gLS0KPj4+Cj4+Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0KPj4+PiBGcm9tOiDluLjlh6TmpaAKPj4+PiBTZW50OiBNb25kYXksIE5vdmVtYmVyIDgs
IDIwMjEgMTE6NTUgQU0KPj4+PiBUbzogamFlZ2V1a0BrZXJuZWwub3JnOyBjaGFvQGtlcm5lbC5v
cmcKPj4+PiBDYzogbGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPj4+PiBT
dWJqZWN0OiBEbyB3ZSBuZWVkIHNlcmlhbCBpbyBmb3IgY29tcHJlc3MgZmlsZT8KPj4+Pgo+Pj4+
IEluIG15IHRlc3QsIHNlcmlhbCBpbyBmb3IgY29tcHJlc3MgZmlsZSB3aWxsIG1ha2UgbXVsdGl0
aHJlYWQgc21hbGwKPj4+PiB3cml0ZSBwZXJmb3JtYW5jZSBkcm9wIGEgbG90Lgo+Pj4+Cj4+Pj4g
SSdtIHRyeSB0byBmaW5ndXJlIG91dCB3aHkgd2UgbmVlZCBfX3Nob3VsZF9zZXJpYWxpemVfaW8s
IElNTywgd2UgdXNlCj4+Pj4gX19zaG91bGRfc2VyaWFsaXplX2lvIHRvIGF2b2lkIGRlYWRsb2Nr
IG9yIHRyeSB0byBpbXByb3ZlIHNlcXVlbnRpYWwKPj4+PiBwZXJmb3JtYW5jZSwgYnV0IEkgZG9u
J3QgdW5kZXJzdGFuZCB3aHkgd2Ugc2hvdWxkIGRvIHRoaXMgZm9yCj4+Pj4gY29tcHJlc3NlZCBm
aWxlLiBJbiBteSB0ZXN0LCBpZiB3ZSBqdXN0IHJlbW92ZSB0aGlzLCB3cml0ZSBzYW1lIGZpbGUK
Pj4+PiBpbiBtdWx0aXRocmVhZCB3aWxsIGhhdmUgcHJvYmxlbSwgYnV0IHBhcmFsbGVsIHdyaXRl
IGRpZmZlcmVudCBmaWxlcwo+Pj4+IGluIG11bHRpdGhyZWFkIGlzIG9rLiBTbyBJIHRoaW5rIG1h
eWJlIHdlIHNob3VsZCB1c2UgYW5vdGhlciBsb2NrIHRvCj4+Pj4gYWxsb3cgd3JpdGUgZGlmZmVy
ZW50IGZpbGVzIGluIG11bHRpdGhyZWFkLgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYy
ZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2Uu
bmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
