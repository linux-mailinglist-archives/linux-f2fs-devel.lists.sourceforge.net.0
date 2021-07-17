Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E09C73CC3D4
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 17 Jul 2021 16:31:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m4lLL-0007wW-5B; Sat, 17 Jul 2021 14:31:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <chao@kernel.org>) id 1m4lLJ-0007wP-R4
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 17 Jul 2021 14:31:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ksF1bUBbgLS2eLrccucA6VthOIXNWRB/khtV3w8zTsU=; b=Frv8X2mq0E0c6F5xcMztUsYt4Y
 F5JjMsYRoBpUJLMWRv14uxBUS+JWcc0bB+Bf9joghgF5Scbv9Zk9DN0rt2fNRnv2kZQKWE+AbbvBM
 8x0WYHhfV4UuteJlIXJkN9VwrqjOm/9PPU2z/1+uDscMan+SqukjbZaUaQMBuIJ6T98g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ksF1bUBbgLS2eLrccucA6VthOIXNWRB/khtV3w8zTsU=; b=Td2nmV0KUmyT2FkMsFG1QtZEbs
 U70WNAPUJl2fKX84cRzl7/nOtXlZ9sDyN4XApWXQsY3FzVqOr91WuKfZHOBL2aPBPP/W0Hz/y3bFb
 oTcqqscWTiGRTQFO2npytBtd1q5X+mLq+GmTxLxXvYBWR4U3VEyZdgtdutDupo3s7+6o=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m4lLE-00Bh8N-Gf
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 17 Jul 2021 14:31:01 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 69FB060E0C;
 Sat, 17 Jul 2021 14:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626532245;
 bh=14WzMwXfvvUALR/o3/B01DobiAum7gdNjkRKMGRhoAs=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=m8vjV62TtAP8tiyTNpo4pnmCmdchWW1SamKFORsv7Vi67qYK+1CUiCMrWb1PinJk7
 b2iUlVJNh6MR1NKYaKUZIgBxVTZmf6gEBxk/EmXOGzwCC0vH8yaQlC4TXzzQrjWPJf
 HdlNmZKKA+LMsEP5K4d8cM52N2S0TZhBtNPoJV8Qu3J80/0Yjs8kkzOCcgTTK7c+Xc
 3sAoRRBU2Lj3TqgKFcPyoIKsU5N4NIThpgJY67tpwe0jnAUniB/Ld6JlPEXEOIEqVH
 PMjAa/Q8FXxaIud7NVjZdt8rvc7yG/2WCBcBkivkfKupsWqwKFIWgukF6u/pKdvt3+
 2eYON/LB6NGlw==
To: =?UTF-8?B?5p2O5oms6Z+s?= <frank.li@vivo.com>
References: <AAoAygBXD7UuY6twAU03JKpm.3.1626528346162.Hmail.frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <1030f9ed-d7af-3fc5-a1ac-a53e0d1a46c3@kernel.org>
Date: Sat, 17 Jul 2021 22:30:42 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <AAoAygBXD7UuY6twAU03JKpm.3.1626528346162.Hmail.frank.li@vivo.com>
Content-Language: en-US
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1m4lLE-00Bh8N-Gf
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix ctx->pos in f2fs_read_inline_dir()
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMS83LzE3IDIxOjI1LCDmnY7miazpn6wgd3JvdGU6Cj4gSEkgQ2hhbywKPiAKPiBGcm9t
OiBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+Cj4gRGF0ZTogMjAyMS0wNy0xNyAxNjo1NjowMQo+
IFRvOiAgWWFuZ3RhbyBMaSA8ZnJhbmsubGlAdml2by5jb20+LGphZWdldWtAa2VybmVsLm9yZwo+
IENjOiAgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZyxsaW51eC1mMmZzLWRldmVsQGxpc3Rz
LnNvdXJjZWZvcmdlLm5ldAo+IFN1YmplY3Q6IFJlOiBbZjJmcy1kZXZdIFtQQVRDSF0gZjJmczog
Zml4IGN0eC0+cG9zIGluIGYyZnNfcmVhZF9pbmxpbmVfZGlyKCk+T24gMjAyMS83LzE3IDExOjQ5
LCBZYW5ndGFvIExpIHdyb3RlOgo+Pj4gSSByZWNlbnRseSBmb3VuZCBhIGNhc2Ugd2hlcmUgZGUt
Pm5hbWVfbGVuIGlzIDAgaW4gZjJmc19maWxsX2RlbnRyaWVzKCkgZWFzaWx5IHJlcHJvZHVjZWQs
Cj4+PiBhbmQgZmluYWxseSBzZXQgdGhlIGZzY2sgZmxhZy4KPj4+Cj4+PiBUaHJlYWQgQQkJCQkJ
VGhyZWFkIEIKPj4+Cj4+PiBmMmZzX3JlYWRkaXIKPj4+IAlmMmZzX3JlYWRfaW5saW5lX2Rpcgo+
Pj4gCQljdHgtPnBvcyA9IGQubWF4Cj4+PiAJCQkJCQlmMmZzX2FkZF9kZW50cnkKPj4+IAkJCQkJ
CQlmMmZzX2FkZF9pbmxpbmVfZW50cnkKPj4+IAkJCQkJCQkJZG9fY29udmVydF9pbmxpbmVfZGly
Cj4+PiAJCQkJCQkJZjJmc19hZGRfcmVndWxhcl9lbnRyeQo+Pj4gZjJmc19yZWFkZGlyCj4+PiAJ
ZjJmc19maWxsX2RlbnRyaWVzCj4+PiAJCXNldF9zYmlfZmxhZyhzYmksIFNCSV9ORUVEX0ZTQ0sp
Cj4+Pgo+Pj4gUHJvY2VzcyBBIG9wZW5zIHRoZSBmb2xkZXIsIGFuZCBoYXMgYmVlbiByZWFkaW5n
IHdpdGhvdXQgY2xvc2luZyBpdC4gRHVyaW5nIHRoaXMgcGVyaW9kLAo+Pj4gUHJvY2VzcyBCIGNy
ZWF0ZWQgYSBmaWxlIHVuZGVyIHRoZSBmb2xkZXIgKG9jY3VweWluZyBtdWx0aXBsZSBmMmZzX2Rp
cl9lbnRyeSwgZXhjZWVkaW5nCj4+PiB0aGUgZC5tYXggb2YgdGhlIGlubGluZSBkaXIpLiBBZnRl
ciBjcmVhdGlvbiwgcHJvY2VzcyBBIHVzZXMgdGhlIGQubWF4IG9mIGlubGluZSBkaXIgdG8KPj4+
IHJlYWQgaXQgYWdhaW4sIGFuZCBpdCB3aWxsIHJlYWQgdGhhdCBkZS0+bmFtZV9sZW4gaXMgMC4K
Pj4KPj4gTmljZSBjYXRjaCEKPj4KPj4+Cj4+PiBBbmQgcmV0dXJuaW5nIGVhcmx5IGluIGYyZnNf
cmVhZF9pbmxpbmVfZGlyIHdpbGwgY2F1c2UgdGhlIHByb2Nlc3MgdG8gYmUgdW5hYmxlIHRvIHNl
ZQo+Pj4gdGhlIGNoYW5nZXMgYmVmb3JlIHJlb3BlbmluZyB0aGUgZmlsZS4KPj4+Cj4+PiBTbyBk
b24ndCByZXR1cm4gZWFybHkgYW5kIHJlbW92ZSB0aGUgbW9kaWZpY2F0aW9uIG9mIGN0eC0+cG9z
IGluIGYyZnNfcmVhZF9pbmxpbmVfZGlyKCkuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogWWFuZ3Rh
byBMaSA8ZnJhbmsubGlAdml2by5jb20+Cj4+PiAtLS0KPj4+ICAgIGZzL2YyZnMvaW5saW5lLmMg
fCA1IC0tLS0tCj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgNSBkZWxldGlvbnMoLSkKPj4+Cj4+PiBk
aWZmIC0tZ2l0IGEvZnMvZjJmcy9pbmxpbmUuYyBiL2ZzL2YyZnMvaW5saW5lLmMKPj4+IGluZGV4
IDU2YTIwZDVjMTVkYS4uZmM2NTUxMTM5YTNkIDEwMDY0NAo+Pj4gLS0tIGEvZnMvZjJmcy9pbmxp
bmUuYwo+Pj4gKysrIGIvZnMvZjJmcy9pbmxpbmUuYwo+Pj4gQEAgLTcyOSw5ICs3MjksNiBAQCBp
bnQgZjJmc19yZWFkX2lubGluZV9kaXIoc3RydWN0IGZpbGUgKmZpbGUsIHN0cnVjdCBkaXJfY29u
dGV4dCAqY3R4LAo+Pj4gICAgCj4+PiAgICAJbWFrZV9kZW50cnlfcHRyX2lubGluZShpbm9kZSwg
JmQsIGlubGluZV9kZW50cnkpOwo+Pj4gICAgCj4+PiAtCWlmIChjdHgtPnBvcyA9PSBkLm1heCkK
Pj4+IC0JCXJldHVybiAwOwo+Pj4gLQo+Pj4gICAgCWlwYWdlID0gZjJmc19nZXRfbm9kZV9wYWdl
KEYyRlNfSV9TQihpbm9kZSksIGlub2RlLT5pX2lubyk7Cj4+PiAgICAJaWYgKElTX0VSUihpcGFn
ZSkpCj4+PiAgICAJCXJldHVybiBQVFJfRVJSKGlwYWdlKTsKPj4+IEBAIC03NDcsOCArNzQ0LDYg
QEAgaW50IGYyZnNfcmVhZF9pbmxpbmVfZGlyKHN0cnVjdCBmaWxlICpmaWxlLCBzdHJ1Y3QgZGly
X2NvbnRleHQgKmN0eCwKPj4+ICAgIAltYWtlX2RlbnRyeV9wdHJfaW5saW5lKGlub2RlLCAmZCwg
aW5saW5lX2RlbnRyeSk7Cj4+PiAgICAKPj4+ICAgIAllcnIgPSBmMmZzX2ZpbGxfZGVudHJpZXMo
Y3R4LCAmZCwgMCwgZnN0cik7Cj4+Cj4+IEFmdGVyIHRoaXMgZnVuY3Rpb24sIGN0eC0+cG9zIHdp
bGwgcG9pbnQgdG8gc3RhcnQgcG9zaXRpb24gb2YgZmlyc3QgZnJlZSBzbG90IGFmdGVyCj4+IGxh
c3QgZGlyX2VudHJ5LCB3ZSBjYW4ndCBndWFyYW50ZWUgdGhhdCB0aGUgZnJlZSBzbG90IHdvbid0
IGJlIHVzZWQgaW4gYWJvdmUgcmFjZQo+PiBjb25kaXRpb24sIHJpZ2h0Pwo+Pgo+PiBNb3Jlb3Zl
ciwgdy9vIGlubGluZSBjb252ZXJzaW9uLCB0aGUgcmFjZSBjb25kaXRpb24gc3RpbGwgY2FuIGhh
cHBlbiBhcyBiZWxvdywgcmlnaHQ/Cj4+Cj4+IGRpcl9lbnRyeTE6IEEKPj4gZGlyX2VudHJ5Mjog
Qgo+PiBkaXJfZW50cnkzOiBDCj4+IGZyZWUgc2xvdDogXwo+Pgo+PiBCZWZvcmU6Cj4+IEFBQUFC
QkJCX19fCj4+ICAgICAgICAgIF4KPj4gVGhyZWFkIEIgZGVsZXRlIGRpcl9lbnRyeTIsIGFuZCBj
cmVhdGUgZGlyX2VudHJ5My4KPj4KPj4gQWZ0ZXI6Cj4+IEFBQUFDQ0NDQ19fCj4+ICAgICAgICAg
IF4KPiAKPiBUYWtpbmcgaW50byBhY2NvdW50IHRoZSBhYm92ZSBzaXR1YXRpb25zLCBJIHRoaW5r
IHRoaXMgY2FzZSB3aGVyZSBkZS0+bmFtZV9sZW4gaXMgMCBpbiBmMmZzX2ZpbGxfZGVudHJpZXMo
KQo+IHNob3VsZCBiZSBub3JtYWwgYW5kIHRoZXJlIGlzIG5vIHdheSB0byBhdm9pZCBpdC4gTWF5
YmUgd2Ugc2hvdWxkbid0IHNldCBmc2NrIGZsYWcgYXQgdGhpcyB0aW1lPwo+IEJlY2F1c2UgdGhl
IGZpbGUgc3lzdGVtIGlzIG5vdCBkYW1hZ2VkLgoKWWFuZ3RhbywKCklNTywgaXQgc2hvdWxkIGJ5
cGFzcyB0YWdnaW5nIEZTQ0sgZmxhZyBvbmx5IGlmOgphKSBiaXRfcG9zICg6PSBjdHgtPnBvcyAl
IGQtPm1heCkgaXMgbm9uLXplcm8gJiBiKSBiZWZvcmUgYml0X3BvcyBtb3ZlcyB0byBmaXJzdAp2
YWxpZCBkaXJfZW50cnkuCgpUaGFua3MsCgo+IAo+IE1CUiAvIFlhbmd0YW8KPiAKPiAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRl
dmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApo
dHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRl
dmVsCg==
