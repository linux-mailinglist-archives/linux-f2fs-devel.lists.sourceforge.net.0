Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 34082BB15BB
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 01 Oct 2025 19:25:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aYGH3uHmweAaICHT/ICrBbZdXiR2JSRiueNVmR2eYkI=; b=VgBUhjTYjlEWVNQ6Pso3kIL6ZR
	CspCu6Z9vjsSY8FOgBkfyGriullqTHGa3XuLPM8BuId7RsQEUSkPH6r4NFYFKLbq7Ak/I3qVO0ej+
	fqdC8fE4bFgLB78FDjrvcKdaBiz7TuBSSwmG2/j56pY6xheUIUdvtQzF79BN9KJzrDZM=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v40a3-0005cX-0B;
	Wed, 01 Oct 2025 17:25:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1v40Zw-0005cM-HD
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 01 Oct 2025 17:25:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1yt1l6FpY5WayQ1yBJ7w4+8mgjpmCXMoKaJpCMFLDik=; b=S5nov7XD8E8ihOVrapZ4WiJ12X
 XA9WJ6uj4fuo1upQdL3Hfwab6P0yy02v2D06morxoKovov/ZxY48c/4UdtPhdFsm350RLTtSpzv6l
 jLhr/wuTriX2OiTX5PPCV95PJm4Yt7Tm886ierZmfHjtvFzU/ZGwDX9Iyk5JOkpswYCU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1yt1l6FpY5WayQ1yBJ7w4+8mgjpmCXMoKaJpCMFLDik=; b=mRzJyFItn6GrA9bTCZ2jPabqAi
 F9mUsCdkHGdUKE31ImMXbiuvmiGuU9izFhV/AtJBIZWfk6AVRDq+hlB6jkuhnZbY34stoEXiFSJdV
 BLdCJ/VRYw41ru0+Yoo75rFDr+H2kD9zOzk7FIBzMRM2+guWSwc1E4rKK23QbDWjsAQI=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v40Zv-0005Qa-VI for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 01 Oct 2025 17:25:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4AFD6605A5;
 Wed,  1 Oct 2025 17:25:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6F47C4CEF1;
 Wed,  1 Oct 2025 17:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759339518;
 bh=sRW95YIBG18A2cf8IDstaGyspNAd2rL2HIltY7BriT4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=an9IQYQzdsBU+sOeaWfiZQVXgZm5Q2h2VeSMOCDzlL0s8JZPAKa9BoyVsUBRe3RJD
 FNAdSwKMbaB02iQ8bKQHCgDsLVaCsx2c214kEfCJJ18SL4cPFk5FBUNFCeEG76BLFs
 3dpA6y1ityYCzmz0EguFMPKBoZKHS61hY3lTe8htme/oQ4zh1Z5JyecMFm3jrGqwVj
 B0JiIR2MENFKUoZctExAIKq/X6JojGIerDWKrH1HUVFvRRlfH+rQCYpt/h13aviUX6
 p+xDot+3ZtkBn8O5RHhcaNkp1FnKa69+7zb40qOjP3KblP86Xe1Zj7u/uOHEE4WrBl
 +FdgXpdKhybiA==
Date: Wed, 1 Oct 2025 17:25:16 +0000
To: Juhyung Park <qkrwngud825@gmail.com>
Message-ID: <aN1j_Kapop-6B46V@google.com>
References: <20250930170952.3188971-1-jaegeuk@kernel.org>
 <CAD14+f0JGoNeEbN=duPeiKhBmQK9EBZ4h-BE0ShwmckzoQ47PQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD14+f0JGoNeEbN=duPeiKhBmQK9EBZ4h-BE0ShwmckzoQ47PQ@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 09/30, Juhyung Park wrote: > I recall being told by Chao
 that the ext is checked with .startsWith()-like > semantics,
 hence "mp" covering
 both mp3/mp4. > > Was this not the case for hot list? Thanks, Juhyung. Yeah,
 it seems the code looks like that. Let me drop this patch. 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v40Zv-0005Qa-VI
Subject: Re: [f2fs-dev] [PATCH] mkfs.f2fs: set SQLite journal files to hot
 extensions
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMDkvMzAsIEp1aHl1bmcgUGFyayB3cm90ZToKPiBJIHJlY2FsbCBiZWluZyB0b2xkIGJ5IENo
YW8gdGhhdCB0aGUgZXh0IGlzIGNoZWNrZWQgd2l0aCAuc3RhcnRzV2l0aCgpLWxpa2UKPiBzZW1h
bnRpY3MsIGhlbmNlICJtcCIgY292ZXJpbmcgYm90aCBtcDMvbXA0Lgo+IAo+IFdhcyB0aGlzIG5v
dCB0aGUgY2FzZSBmb3IgaG90IGxpc3Q/CgpUaGFua3MsIEp1aHl1bmcuIFllYWgsIGl0IHNlZW1z
IHRoZSBjb2RlIGxvb2tzIGxpa2UgdGhhdC4gTGV0IG1lIGRyb3AgdGhpcwpwYXRjaC4KCj4gCj4g
T24gVHVlLCBTZXAgMzAsIDIwMjUgYXQgMTA6MTPigK9BTSBKYWVnZXVrIEtpbSB2aWEgTGludXgt
ZjJmcy1kZXZlbCA8Cj4gbGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQ+IHdy
b3RlOgo+IAo+ID4gSm91cm5hbCBmaWxlcyB3aWxsIGJlIGNyZWF0ZWQgYW5kIGRlbGV0ZWQgd2l0
aCByYW5kb20gdXBkYXRlcy4gTGV0J3MgcHV0Cj4gPiB0aGUgZGF0YSBpbiBIT1QgbG9nIHRvIG1p
dGlnYXRlIHRoZSBlbnRpcmUgZnJhZ21lbnRhdGlvbi4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBK
YWVnZXVrIEtpbSA8amFlZ2V1a0BrZXJuZWwub3JnPgo+ID4gLS0tCj4gPiAgbWtmcy9mMmZzX2Zv
cm1hdC5jIHwgMyArKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4gPgo+
ID4gZGlmZiAtLWdpdCBhL21rZnMvZjJmc19mb3JtYXQuYyBiL21rZnMvZjJmc19mb3JtYXQuYwo+
ID4gaW5kZXggYjk4OTc2YzZmZmE4Li41M2UxZjk4Mjk0NWQgMTAwNjQ0Cj4gPiAtLS0gYS9ta2Zz
L2YyZnNfZm9ybWF0LmMKPiA+ICsrKyBiL21rZnMvZjJmc19mb3JtYXQuYwo+ID4gQEAgLTE1Nyw2
ICsxNTcsOSBAQCBjb25zdCBjaGFyICptZWRpYV9leHRfbGlzdHNbXSA9IHsKPiA+Cj4gPiAgY29u
c3QgY2hhciAqaG90X2V4dF9saXN0c1tdID0gewo+ID4gICAgICAgICAiZGIiLAo+ID4gKyAgICAg
ICAiZGItam91cm5hbCIsCj4gPiArICAgICAgICJkYi13YWwiLAo+ID4gKyAgICAgICAiZGItc2ht
IiwKPiA+Cj4gPiAgI2lmbmRlZiBXSVRIX0FORFJPSUQKPiA+ICAgICAgICAgLyogVmlydHVhbCBt
YWNoaW5lcyAqLwo+ID4gLS0KPiA+IDIuNTEuMC42MTguZzk4M2ZkOTlkMjktZ29vZwo+ID4KPiA+
Cj4gPgo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
PiA+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4gPiBMaW51eC1mMmZzLWRldmVsQGxp
c3RzLnNvdXJjZWZvcmdlLm5ldAo+ID4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlz
dHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo+ID4KCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApM
aW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJj
ZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
