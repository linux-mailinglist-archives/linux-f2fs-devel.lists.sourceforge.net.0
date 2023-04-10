Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5146DCA46
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 Apr 2023 19:57:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1plvlu-0003q5-Rg;
	Mon, 10 Apr 2023 17:57:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1plvlk-0003pz-Lr
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Apr 2023 17:57:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+rJ0HzSlsN2qDLRasn/SNIDGChbSYp6qeUhbUCXs+Jw=; b=e23EAz6h6n7N6U7mP23rDhUh3H
 wMqIJmo0UbenZqj6CQRQna69GtO0Zg5u6xXTHL3EeL3113/3WnY20yPqV/XiK4/PDKyQLwC9MN7mL
 OSQidjiBjtQqpR0zYHW6AWVn4y5FfYFx5RUaogRsO4cPM9UjfCLiwEukO8ulQMQhXALw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+rJ0HzSlsN2qDLRasn/SNIDGChbSYp6qeUhbUCXs+Jw=; b=jCTGHq8Jt0yPUmG8nqiSmY+thW
 MYCW41hhNe0xPXYMEQqqahSvRrGwreVW2cdgosTH/TdmvIaC7Paf8SwgYdAxpfYC+zGSIQSzSjxGN
 Bl5pKlZFtSABhP+tMXFIG2H/I+Mpo1PF6Ttb04SO1xp6IAf+WXiUz2EP9VF1ouKclJG4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1plvlk-0034KC-NT for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Apr 2023 17:57:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 58DC261B5D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 10 Apr 2023 17:57:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5809C433EF;
 Mon, 10 Apr 2023 17:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681149446;
 bh=pRusvesWgcLH3mFrSqqGUneripwEMIKM/L3+hxDKUDg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WgozEOTWyqyrh7PZvvmUHT6JNgN6L2x+FM/GC7Tt98GLdJyIHpNxv6qJhGKxrOm5E
 b4oBnhpcPIrh7nABA8ak+VDCrPC1Y1C6OYWgMve7ft8m4ON32x3Ug5jHLd3eyfOrR4
 ccDfKbXIzyl++l4GsLQsKJZrOlrUtdWu4OjPOoH79ctW3/mO6EoiYphGdIkhki9eon
 6CQPB/ncYPUBNahNwftZo+FUccwt9pT8pFADkOvSUfoFuvGPHY2c9tSI1tXdynyZw0
 eocbLR6XFTrqtVhb33yU7m7IEw2sD4sfdBxrYkCN1tuFVDlbovvSEbsJHvTNoOiJF/
 c6z7UKi7x9P/A==
Date: Mon, 10 Apr 2023 10:57:24 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <ZDROBJFxSUdGaqAa@google.com>
References: <20230405144359.930253-1-chao@kernel.org>
 <ZDCEK2OPkhTmRZrq@google.com>
 <224e8756-7c63-fd53-a0f3-f3e2a7b4c13f@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <224e8756-7c63-fd53-a0f3-f3e2a7b4c13f@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 04/08, Chao Yu wrote: > On 2023/4/8 4:59,
 Jaegeuk Kim wrote:
 > > This breaks generic/009? > > I guess it is as expected? > > Please check
 description of fiemap ioctl manual from [1]: > > FIEMAP_EXT [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1plvlk-0034KC-NT
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to tag FIEMAP_EXTENT_DELALLOC in
 fiemap() for delay allocated extent
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMDQvMDgsIENoYW8gWXUgd3JvdGU6Cj4gT24gMjAyMy80LzggNDo1OSwgSmFlZ2V1ayBLaW0g
d3JvdGU6Cj4gPiBUaGlzIGJyZWFrcyBnZW5lcmljLzAwOT8KPiAKPiBJIGd1ZXNzIGl0IGlzIGFz
IGV4cGVjdGVkPwo+IAo+IFBsZWFzZSBjaGVjayBkZXNjcmlwdGlvbiBvZiBmaWVtYXAgaW9jdGwg
bWFudWFsIGZyb20gWzFdOgo+IAo+IEZJRU1BUF9FWFRFTlRfVU5LTk9XTgo+IFRoZSBsb2NhdGlv
biBvZiB0aGlzIGV4dGVudCBpcyBjdXJyZW50bHkgdW5rbm93bi4gVGhpcyBtYXkKPiBpbmRpY2F0
ZSB0aGUgZGF0YSBpcyBzdG9yZWQgb24gYW4gaW5hY2Nlc3NpYmxlIHZvbHVtZSBvciB0aGF0Cj4g
bm8gc3RvcmFnZSBoYXMgYmVlbiBhbGxvY2F0ZWQgZm9yIHRoZSBmaWxlIHlldC4KPiAKPiBGSUVN
QVBfRVhURU5UX0RFTEFMTE9DCj4gVGhpcyB3aWxsIGFsc28gc2V0IEZJRU1BUF9FWFRFTlRfVU5L
Tk9XTi4KPiAKPiBEZWxheWVkIGFsbG9jYXRpb24gLSB3aGlsZSB0aGVyZSBpcyBkYXRhIGZvciB0
aGlzIGV4dGVudCwgaXRzCj4gcGh5c2ljYWwgbG9jYXRpb24gaGFzIG5vdCBiZWVuIGFsbG9jYXRl
ZCB5ZXQuCj4gCj4gRklFTUFQX0VYVEVOVF9VTldSSVRURU4KPiBVbndyaXR0ZW4gZXh0ZW50IC0g
dGhlIGV4dGVudCBpcyBhbGxvY2F0ZWQgYnV0IGl0cyBkYXRhIGhhcyBub3QKPiBiZWVuIGluaXRp
YWxpemVkLiBUaGlzIGluZGljYXRlcyB0aGUgZXh0ZW504oCZcyBkYXRhIHdpbGwgYmUgYWxsCj4g
emVybyBpZiByZWFkIHRocm91Z2ggdGhlIGZpbGVzeXN0ZW0gYnV0IHRoZSBjb250ZW50cyBhcmUg
dW5kZWZpbmVkCj4gaWYgcmVhZCBkaXJlY3RseSBmcm9tIHRoZSBkZXZpY2UuCj4gCj4gWzFdIGh0
dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL2h0bWwvbGF0ZXN0L2ZpbGVzeXN0ZW1zL2ZpZW1hcC5o
dG1sCj4gCj4gQWNjb3JkaW5nIHRvIGl0cyBkZXNjcmlwdGlvbiwgZjJmcyBvbmx5IHN1cHBvcnQK
PiBGSUVNQVBfRVhURU5UX3tVTktOT1dOLCBERUxBTExPQ30sIGJ1dCBub3Qgc3VwcG9ydAo+IEZJ
RU1BUF9FWFRFTlRfVU5XUklUVEVOLgoKTm8sIEkgZG9uJ3QgdGhpbmsgc28uCgo+IAo+IFNvIDAw
OSwgMDkyLCAwOTQgLi4gd2hpY2ggZXhwZWN0cyB1bndyaXR0ZW4gc3RhdHVzIGZyb20gZXh0ZW50
IHdpbGwKPiBmYWlsLgo+IAo+IEhvdyBhYm91dCBkaXNhYmxpbmcgdGhvc2UgdGVzdGNhc2U/Cj4g
Cj4gVGhhbmtzLAo+IAo+ID4gCj4gPiBPbiAwNC8wNSwgQ2hhbyBZdSB3cm90ZToKPiA+ID4geGZz
dGVzdCBnZW5lcmljLzYxNCBmYWlscyB0byBydW4gZHVlIGJlbG93IHJlYXNvbjoKPiA+ID4gCj4g
PiA+IGdlbmVyaWMvNjE0IDFzIC4uLiBbbm90IHJ1bl0gdGVzdCByZXF1aXJlcyBkZWxheWVkIGFs
bG9jYXRpb24gYnVmZmVyZWQgd3JpdGVzCj4gPiA+IAo+ID4gPiBUaGUgcm9vdCBjYXVzZSBpcyBm
MmZzIHRhZ3Mgd3JvbmcgZmllbWFwIGZsYWcgZm9yIGRlbGF5IGFsbG9jYXRlZAo+ID4gPiBleHRl
bnQuCj4gPiA+IAo+ID4gPiBRdW90ZWQgZnJvbSBmaWVtYXAuaDoKPiA+ID4gRklFTUFQX0VYVEVO
VF9VTktOT1dOCQkweDAwMDAwMDAyIC8qIERhdGEgbG9jYXRpb24gdW5rbm93bi4gKi8KPiA+ID4g
RklFTUFQX0VYVEVOVF9ERUxBTExPQwkJMHgwMDAwMDAwNCAvKiBMb2NhdGlvbiBzdGlsbCBwZW5k
aW5nLgo+ID4gPiAJCQkJCQkgICAgKiBTZXRzIEVYVEVOVF9VTktOT1dOLiAqLwo+ID4gPiBGSUVN
QVBfRVhURU5UX1VOV1JJVFRFTgkJMHgwMDAwMDgwMCAvKiBTcGFjZSBhbGxvY2F0ZWQsIGJ1dAo+
ID4gPiAJCQkJCQkgICAgKiBubyBkYXRhIChpLmUuIHplcm8pLiAqLwo+ID4gPiAKPiA+ID4gRklF
TUFQX0VYVEVOVF9VTldSSVRURU4gbWVhbnMgYmxvY2sgYWRkcmVzcyBpcyBwcmVhbGxvY2F0ZWQs
IGJ1dCB3L28KPiA+ID4gYmVlbiB3cml0dGVuIGFueSBkYXRhLCB3aGljaCBzdGF0dXMgZjJmcyBp
cyBub3Qgc3VwcG9ydGVkIG5vdywgZm9yIGFsbAo+ID4gPiBORVdfQUREUiBibG9jayBhZGRyZXNz
ZXMsIGl0IG1lYW5zIGRlbGF5IGFsbG9jYXRlZCBibG9ja3MsIHNvIGxldCdzCj4gPiA+IHRhZyBG
SUVNQVBfRVhURU5UX0RFTEFMTE9DIGluc3RlYWQuCj4gPiA+IAo+ID4gPiBUZXN0Y2FzZToKPiA+
ID4geGZzX2lvIC1mIC1jICdwd3JpdGUgMCA2NGsnIC9tbnQvZjJmcy9maWxlOwo+ID4gPiBmaWxl
ZnJhZyAtdiAvbW50L2YyZnMvZmlsZQo+ID4gPiAKPiA+ID4gT3V0cHV0Ogo+ID4gPiAtIEJlZm9y
ZQo+ID4gPiBGaWxlc3lzdGVtIHR5cGUgaXM6IGYyZjUyMDEwCj4gPiA+IEZpemUgb2YgL21udC9m
MmZzL2ZpbGUgaXMgNjU1MzYgKDE2IGJsb2NrcyBvZiA0MDk2IGJ5dGVzKQo+ID4gPiAgIGV4dDog
ICAgIGxvZ2ljYWxfb2Zmc2V0OiAgICAgICAgcGh5c2ljYWxfb2Zmc2V0OiBsZW5ndGg6ICAgZXhw
ZWN0ZWQ6IGZsYWdzOgo+ID4gPiAgICAgMDogICAgICAgIDAuLiAgICAgIDE1OiAgICAgICAgICAw
Li4gICAgICAgIDE1OiAgICAgMTY6ICAgICAgICAgICAgIGxhc3QsdW53cml0dGVuLG1lcmdlZCxl
b2YKPiA+ID4gL21udC9mMmZzL2ZpbGU6IDEgZXh0ZW50IGZvdW5kCj4gPiA+IAo+ID4gPiBBZnRl
cjoKPiA+ID4gRmlsZXN5c3RlbSB0eXBlIGlzOiBmMmY1MjAxMAo+ID4gPiBGaWxlIHNpemUgb2Yg
L21udC9mMmZzL2ZpbGUgaXMgNjU1MzYgKDE2IGJsb2NrcyBvZiA0MDk2IGJ5dGVzKQo+ID4gPiAg
IGV4dDogICAgIGxvZ2ljYWxfb2Zmc2V0OiAgICAgICAgcGh5c2ljYWxfb2Zmc2V0OiBsZW5ndGg6
ICAgZXhwZWN0ZWQ6IGZsYWdzOgo+ID4gPiAgICAgMDogICAgICAgIDAuLiAgICAgIDE1OiAgICAg
ICAgICAwLi4gICAgICAgICAwOiAgICAgIDA6ICAgICAgICAgICAgIGxhc3QsdW5rbm93bl9sb2Ms
ZGVsYWxsb2MsZW9mCj4gPiA+IC9tbnQvZjJmcy9maWxlOiAxIGV4dGVudCBmb3VuZAo+ID4gPiAK
PiA+ID4gRml4ZXM6IDdmNjNlYjc3YWY3YiAoImYyZnM6IHJlcG9ydCB1bndyaXR0ZW4gYXJlYSBp
biBmMmZzX2ZpZW1hcCIpCj4gPiA+IFNpZ25lZC1vZmYtYnk6IENoYW8gWXUgPGNoYW9Aa2VybmVs
Lm9yZz4KPiA+ID4gLS0tCj4gPiA+ICAgZnMvZjJmcy9kYXRhLmMgfCA3ICsrKysrLS0KPiA+ID4g
ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4gPiAK
PiA+ID4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZGF0YS5jIGIvZnMvZjJmcy9kYXRhLmMKPiA+ID4g
aW5kZXggMzU5ZGU2NTA3NzJlLi4zYWZjOTc2NDc0M2UgMTAwNjQ0Cj4gPiA+IC0tLSBhL2ZzL2Yy
ZnMvZGF0YS5jCj4gPiA+ICsrKyBiL2ZzL2YyZnMvZGF0YS5jCj4gPiA+IEBAIC0xOTk1LDcgKzE5
OTUsMTAgQEAgaW50IGYyZnNfZmllbWFwKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBmaWVt
YXBfZXh0ZW50X2luZm8gKmZpZWluZm8sCj4gPiA+ICAgCX0KPiA+ID4gICAJaWYgKHNpemUpIHsK
PiA+ID4gLQkJZmxhZ3MgfD0gRklFTUFQX0VYVEVOVF9NRVJHRUQ7Cj4gPiA+ICsJCWlmIChmbGFn
cyAmIEZJRU1BUF9FWFRFTlRfREVMQUxMT0MpCj4gPiA+ICsJCQlwaHlzID0gMDsKPiA+ID4gKwkJ
ZWxzZQo+ID4gPiArCQkJZmxhZ3MgfD0gRklFTUFQX0VYVEVOVF9NRVJHRUQ7Cj4gPiA+ICAgCQlp
ZiAoSVNfRU5DUllQVEVEKGlub2RlKSkKPiA+ID4gICAJCQlmbGFncyB8PSBGSUVNQVBfRVhURU5U
X0RBVEFfRU5DUllQVEVEOwo+ID4gPiBAQCAtMjAzNSw3ICsyMDM4LDcgQEAgaW50IGYyZnNfZmll
bWFwKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBmaWVtYXBfZXh0ZW50X2luZm8gKmZpZWlu
Zm8sCj4gPiA+ICAgCQkJCXNpemUgKz0gYmxrc190b19ieXRlcyhpbm9kZSwgMSk7Cj4gPiA+ICAg
CQkJfQo+ID4gPiAgIAkJfSBlbHNlIGlmIChtYXAubV9mbGFncyAmIEYyRlNfTUFQX0RFTEFMTE9D
KSB7Cj4gPiA+IC0JCQlmbGFncyA9IEZJRU1BUF9FWFRFTlRfVU5XUklUVEVOOwo+ID4gPiArCQkJ
ZmxhZ3MgPSBGSUVNQVBfRVhURU5UX0RFTEFMTE9DOwo+ID4gPiAgIAkJfQo+ID4gPiAgIAkJc3Rh
cnRfYmxrICs9IGJ5dGVzX3RvX2Jsa3MoaW5vZGUsIHNpemUpOwo+ID4gPiAtLSAKPiA+ID4gMi4z
Ni4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vm
b3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGlu
dXgtZjJmcy1kZXZlbAo=
