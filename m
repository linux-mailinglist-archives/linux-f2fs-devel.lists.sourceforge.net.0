Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E605D734992
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jun 2023 02:55:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qB3AP-0002Zw-7Z;
	Mon, 19 Jun 2023 00:54:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qB3AN-0002Zq-Lq
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jun 2023 00:54:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cGk92vVSNERvYh8aQsDJ4uZoMj/oQhhKPaQptFTkXrg=; b=T5Q6M4mAuJAY4XgYLNmuv3kS76
 qSIFvvMhQiwx5KgaKYb9JU1Q02HfY6NxKWreETZeLOnLW03wi9yxE8a+oG8hZ9+6MgAA2b3uHo5cZ
 yUT92t483bGcoosf0NoIc+RZ78uF8hihsZoKwTy+8kXete2iGj6xDFcog9EqAcmL7UWw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cGk92vVSNERvYh8aQsDJ4uZoMj/oQhhKPaQptFTkXrg=; b=FlsPnrARKd0m8YTDebhY2VuJBW
 Bt95nMAhoJyZwjHDikMwEqH1J513Qp17401HKpVja1Pz/brL8iSPdC5BRR1As0lTrJ0etKHfDDO/Y
 9aVz44PaeDiy6ov65ETsV3WckNZ61WPrXtGuNVVsol9WyorD0KzWyCEs9ZxLG2tKoLbA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qB3AN-0006XR-OM for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jun 2023 00:54:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4858060F39;
 Mon, 19 Jun 2023 00:54:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C03D6C433C9;
 Mon, 19 Jun 2023 00:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687136077;
 bh=J5rPQv5FZPHF2Y1H1ENGnLbVVE0JpWkmTsnb0eHScI0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=P8K4CmEjNDfHnh0orkbOZPaEX5mgFJXcCqfNf0JBhIrSAAagGvGRGeZfyFgUp4Y5J
 juNLAB5KOgahrRYNYG9UkQtwjI5zIfP4R2/kMYjvFEPLltxaSurNxeZF5rENBMpJTR
 Pz2L546yiFkP/pPV1+7Q+uhZLpLWkxoq56PjVQZmzWahwiRLTnrfuT0pKTph3zpvnd
 UfOwEKYRP20u8snxlEQ+9+FjqvLkDgkmeGN3kyEPBl8Q5iAbwcAqnf1h+CG+nj2dUu
 n/1Jc+wi4v8V0eKFRn7Yv8Lb3glrYAjZbUnuI0E0RKLZQroum02RtsS7Bzrlu+kzna
 us1rDRFrpgFcw==
Message-ID: <7ab6b6f9-37fa-9bf2-69ce-7b1b1944d9f3@kernel.org>
Date: Mon, 19 Jun 2023 08:54:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20230609131555.56651-1-frank.li@vivo.com>
 <8097d4d9-815e-2527-0fb7-90ec0609a4a3@kernel.org>
 <dde6972a-e98c-8a6e-493b-9aff5668101d@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <dde6972a-e98c-8a6e-493b-9aff5668101d@vivo.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/6/13 12:14, Yangtao Li wrote: > > On 2023/6/12 22:38,
 Chao Yu wrote: >> On 2023/6/9 21:15, Yangtao Li wrote: >>> It is observed
 that when in user compression mode >>> (compress_extension=*), > [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qB3AN-0006XR-OM
Subject: Re: [f2fs-dev] [PATCH] f2fs: compress: don't force buffered io when
 in COMPR_MODE_USER mode
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
Cc: Qi Han <hanqi@vivo.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMy82LzEzIDEyOjE0LCBZYW5ndGFvIExpIHdyb3RlOgo+IAo+IE9uIDIwMjMvNi8xMiAy
MjozOCwgQ2hhbyBZdSB3cm90ZToKPj4gT24gMjAyMy82LzkgMjE6MTUsIFlhbmd0YW8gTGkgd3Jv
dGU6Cj4+PiBJdCBpcyBvYnNlcnZlZCB0aGF0IHdoZW4gaW4gdXNlciBjb21wcmVzc2lvbiBtb2Rl
Cj4+PiAoY29tcHJlc3NfZXh0ZW5zaW9uPSopLAo+Pj4gZXZlbiB0aG91Z2ggdGhlIGZpbGUgaXMg
bm90IGNvbXByZXNzZWQsIHRoZSBmaWxlIGlzIHN0aWxsIGZvcmNlZCB0byB1c2UKPj4+IGJ1ZmZl
ciBpbywgd2hpY2ggbWFrZXMgdGhlIEFuZHJvQmVuY2ggc2VxdWVudGlhbCByZWFkIGFuZCB3cml0
ZSBkcm9wCj4+PiBzaWduaWZpY2FudGx5LiBJbiBmYWN0LCB3aGVuIHRoZSBmaWxlIGlzIG5vdCBj
b21wcmVzc2VkLCB3ZSBkb24ndCBuZWVkCj4+PiB0byBmb3JjZSBpdCB0byBidWZmZXIgaW8uCj4+
Pgo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCB3L28gcGF0Y2ggfCB3
LyBwYXRjaCB8Cj4+PiBzZXEgcmVhZMKgIChNQi9zKSB8IDEzMjAuMDY4wqAgfCAzNjk2LjE1NCB8
Cj4+PiBzZXEgd3JpdGUgKE1CL3MpIHwgNjE3Ljk5NsKgwqAgfCAyOTc4LjQ3OCB8Cj4+Pgo+Pj4g
Rml4ZXM6IDRjOGZmNzA5NWJlZiAoImYyZnM6IHN1cHBvcnQgZGF0YSBjb21wcmVzc2lvbiIpCj4+
PiBTaWduZWQtb2ZmLWJ5OiBRaSBIYW4gPGhhbnFpQHZpdm8uY29tPgo+Pj4gU2lnbmVkLW9mZi1i
eTogWWFuZ3RhbyBMaSA8ZnJhbmsubGlAdml2by5jb20+Cj4+PiAtLS0KPj4+ICDCoCBmcy9mMmZz
L2YyZnMuaCB8IDE0ICsrKysrKysrKysrKysrCj4+PiAgwqAgZnMvZjJmcy9maWxlLmMgfMKgIDIg
Ky0KPj4+ICDCoCAyIGZpbGVzIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9mMmZzLmggYi9mcy9mMmZzL2YyZnMuaAo+
Pj4gaW5kZXggMWVmY2ZkOWU1YTk5Li43ZjU0NzI1MjUzMTAgMTAwNjQ0Cj4+PiAtLS0gYS9mcy9m
MmZzL2YyZnMuaAo+Pj4gKysrIGIvZnMvZjJmcy9mMmZzLmgKPj4+IEBAIC0zMTY4LDYgKzMxNjgs
MjAgQEAgc3RhdGljIGlubGluZSBpbnQgZjJmc19jb21wcmVzc2VkX2ZpbGUoc3RydWN0Cj4+PiBp
bm9kZSAqaW5vZGUpCj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgIGlzX2lub2RlX2ZsYWdfc2V0KGlu
b2RlLCBGSV9DT01QUkVTU0VEX0ZJTEUpOwo+Pj4gIMKgIH0KPj4+ICDCoCArc3RhdGljIGlubGlu
ZSBib29sIGYyZnNfaXNfY29tcHJlc3NlZF9maWxlKHN0cnVjdCBpbm9kZSAqaW5vZGUpCj4+PiAr
ewo+Pj4gK8KgwqDCoCBpbnQgY29tcHJlc3NfbW9kZSA9IEYyRlNfT1BUSU9OKEYyRlNfSV9TQihp
bm9kZSkpLmNvbXByZXNzX21vZGU7Cj4+PiArCj4+PiArwqDCoMKgIGlmIChjb21wcmVzc19tb2Rl
ID09IENPTVBSX01PREVfRlMpCj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGYyZnNfY29tcHJl
c3NlZF9maWxlKGlub2RlKTsKPj4+ICvCoMKgwqAgZWxzZSBpZiAoYXRvbWljX3JlYWQoJkYyRlNf
SShpbm9kZSktPmlfY29tcHJfYmxvY2tzKSB8fAo+Pgo+PiBTaG91bGQgY2hlY2sgZGlydHkgcGFn
ZSBhcyB3ZWxsPyBpX2NvbXByX2Jsb2NrcyBtYXkgaW5jcmVhc2UgYWZ0ZXIKPj4gZGF0YSB3cml0
ZWJhY2suCj4+Cj4gSUlVQywgaW4gQ09NUFJfTU9ERV9VU0VSIG1vZGUsIGlfY29tcHJfYmxvY2tz
IHdpbGwgb25seSBiZSB1cGRhdGVkIHdoZW4KPiBGSV9FTkFCTEVfQ09NUFJFU1MgaXMgZW5hYmxl
ZC4KPiAKPiBJZiBGSV9FTkFCTEVfQ09NUFJFU1MgaXMgbm90IGVuYWJsZWQsIGlfY29tcHJfYmxv
Y2tzIHdpbGwgbmV2ZXIgYmUKPiB1cGRhdGVkIGFmdGVyIGRhdGEgd3JpdGViYWNrLgo+IAo+IFNv
IHRoZXJlIGlzIG5vIG5lZWQgdG8gYWRkaXRpb25hbGx5IGp1ZGdlIHdoZXRoZXIgdGhlcmUgaXMg
YSBkaXJ0eSBwYWdlPwoKT2gsIHVzZXIgbW9kZSwgdGhhdCdzIGNvcnJlY3QuCgpJZiB3ZSBhbGxv
dyBkaW8vYWlvIG9uIGNvbXByZXNzIGZpbGUsIGl0IG5lZWRzIHRvIGNvbnNpZGVyIHJhY2UgY2Fz
ZSBpbgpiZXR3ZWVuIGFpbyBhbmQgaW9jX2NvbXByZXNzX2ZpbGUuCgpUaGFua3MsCgo+IAo+IAo+
IFRoYW5rcywKPiAKPj4gVGhhbmtzLAo+Pgo+Pj4gK8KgwqDCoMKgwqDCoMKgIGlzX2lub2RlX2Zs
YWdfc2V0KGlub2RlLCBGSV9DT01QUkVTU19SRUxFQVNFRCkgfHwKPj4+ICvCoMKgwqDCoMKgwqDC
oCBpc19pbm9kZV9mbGFnX3NldChpbm9kZSwgRklfRU5BQkxFX0NPTVBSRVNTKSkKPj4+ICvCoMKg
wqDCoMKgwqDCoCByZXR1cm4gdHJ1ZTsKPj4+ICsKPj4+ICvCoMKgwqAgcmV0dXJuIGZhbHNlOwo+
Pj4gK30KPj4+ICsKPj4+ICDCoCBzdGF0aWMgaW5saW5lIGJvb2wgZjJmc19uZWVkX2NvbXByZXNz
X2RhdGEoc3RydWN0IGlub2RlICppbm9kZSkKPj4+ICDCoCB7Cj4+PiAgwqDCoMKgwqDCoCBpbnQg
Y29tcHJlc3NfbW9kZSA9IEYyRlNfT1BUSU9OKEYyRlNfSV9TQihpbm9kZSkpLmNvbXByZXNzX21v
ZGU7Cj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9maWxlLmMgYi9mcy9mMmZzL2ZpbGUuYwo+Pj4g
aW5kZXggNzRlY2M5ZTIwNjE5Li4wNjk4MTI5YjIxNjUgMTAwNjQ0Cj4+PiAtLS0gYS9mcy9mMmZz
L2ZpbGUuYwo+Pj4gKysrIGIvZnMvZjJmcy9maWxlLmMKPj4+IEBAIC04MjEsNyArODIxLDcgQEAg
c3RhdGljIGJvb2wgZjJmc19mb3JjZV9idWZmZXJlZF9pbyhzdHJ1Y3QgaW5vZGUKPj4+ICppbm9k
ZSwgaW50IHJ3KQo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gdHJ1ZTsKPj4+ICDCoMKg
wqDCoMKgIGlmIChmc3Zlcml0eV9hY3RpdmUoaW5vZGUpKQo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDC
oCByZXR1cm4gdHJ1ZTsKPj4+IC3CoMKgwqAgaWYgKGYyZnNfY29tcHJlc3NlZF9maWxlKGlub2Rl
KSkKPj4+ICvCoMKgwqAgaWYgKGYyZnNfaXNfY29tcHJlc3NlZF9maWxlKGlub2RlKSkKPj4+ICDC
oMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHRydWU7Cj4+PiAgwqAgwqDCoMKgwqDCoCAvKiBkaXNh
bGxvdyBkaXJlY3QgSU8gaWYgYW55IG9mIGRldmljZXMgaGFzIHVuYWxpZ25lZCBibGtzaXplICov
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
ZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgt
ZjJmcy1kZXZlbAo=
