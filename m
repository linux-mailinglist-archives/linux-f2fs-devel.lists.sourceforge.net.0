Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0589D73BEAF
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Jun 2023 21:07:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qCm8E-00034t-3x;
	Fri, 23 Jun 2023 19:07:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1qCm8D-00034n-BG
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Jun 2023 19:07:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mXBy0AaOYC8q+ZTQDhtqjJ6Nh3JsUHeZl6f+Js0D0Bo=; b=moK/F+monAVXrij7hk5faeeS2z
 90UrgwKQeMXM3cMqRRv84ESZH9Q4lHA7wP/J4FK4waGNTer+kWItWw3H1DrGX3RSNszO5ydQc+aYp
 rV722gdf9C/03fY4TOXu2OtcX9di7jSTF4iJpRCk3OyJfnDjLwAiERulFzB8590BFBr8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mXBy0AaOYC8q+ZTQDhtqjJ6Nh3JsUHeZl6f+Js0D0Bo=; b=m3LN7cZ6L1vvlI0G6s8Q6LxsnB
 xvAYidShSJAsIbyU0aIrQ6hfDP79adkZzyaRDq+xbb8OBlE+FGoAcB/8MTD1NoqpyQPBfbBlAEQkT
 3QSXehrj6U+ffVEYNpdGCJpkhPM+kOr4kByy53zJkIhDbScphYbzvIFULQUn6txjWPG0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qCm88-0006vF-Py for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Jun 2023 19:07:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6613E61A8A;
 Fri, 23 Jun 2023 19:07:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAB0CC433C0;
 Fri, 23 Jun 2023 19:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687547250;
 bh=3oIrKT+DwvrEWaVxD5JTgNFQgRwhlYyZXMKFAb4an9c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gxUi9P87k5n0u+hDcsZKcvsli/1yQ/u2ZG1slRAUCrG6d4kwy+TBzpAEdn7ufosx5
 cnI6viiDgcY4spSPRXJVltmixK3H+jd7eyS7bDVNpimkZgJyvaT4POV6QcGtZ1dnqE
 lj9OIq/G0yGf+jG41LjctjFOGUgkjIriMMBCUxnRGxGSTfqF1p3XhYdx77WMN/TMR5
 3pGt09TR63vePyCOxuoedNqzin+5vFl6ixKPUbUkg0s1xvzz/quY6eVTlucKuf36+z
 gGObUR8zOvR90ImbnQxd3CpxMfUzig9AFTVK64OfLZuVdCw2y9lfpl+/WZOSu+wFhc
 iWXKpV8fIIyfw==
Date: Fri, 23 Jun 2023 12:07:29 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <ZJXtcfoR+BFx5CXn@google.com>
References: <20230613085250.3648491-1-heyunlei@oppo.com>
 <b8523d41-246b-b11e-f6e3-423e32cc597a@kernel.org>
 <6c527e97-c4a6-dc58-13fb-516f77e5e068@oppo.com>
 <f7a44e66-6fde-a178-d29e-7684bcbc454e@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f7a44e66-6fde-a178-d29e-7684bcbc454e@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 06/20, Chao Yu wrote: > On 2023/6/20 10:42, 何云蕾(Yunlei
    he) wrote: > > > > On 2023/6/20 8:33, Chao Yu wrote: > > > On 2023/6/13 16:52,
    Yunlei He wrote: > > > > File set both cold and hot advis [...] 
 
 Content analysis details:   (-5.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qCm88-0006vF-Py
Subject: Re: [f2fs-dev] [PATCH] f2fs: not allowed to set file both cold and
 hot
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
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMDYvMjAsIENoYW8gWXUgd3JvdGU6Cj4gT24gMjAyMy82LzIwIDEwOjQyLCDkvZXkupHolb4o
WXVubGVpIGhlKSB3cm90ZToKPiA+IAo+ID4gT24gMjAyMy82LzIwIDg6MzMsIENoYW8gWXUgd3Jv
dGU6Cj4gPiA+IE9uIDIwMjMvNi8xMyAxNjo1MiwgWXVubGVpIEhlIHdyb3RlOgo+ID4gPiA+IEZp
bGUgc2V0IGJvdGggY29sZCBhbmQgaG90IGFkdmlzZSBiaXQgaXMgY29uZnVzaW9uLCBzbwo+ID4g
PiA+IHJldHVybiBFSU5WQUwgdG8gYXZvaWQgdGhpcyBjYXNlLgo+ID4gPiA+IAo+ID4gPiA+IFNp
Z25lZC1vZmYtYnk6IFl1bmxlaSBIZSA8aGV5dW5sZWlAb3Bwby5jb20+Cj4gPiA+ID4gLS0tCj4g
PiA+ID4gwqAgZnMvZjJmcy94YXR0ci5jIHwgMyArKysKPiA+ID4gPiDCoCAxIGZpbGUgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspCj4gPiA+ID4gCj4gPiA+ID4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMv
eGF0dHIuYyBiL2ZzL2YyZnMveGF0dHIuYwo+ID4gPiA+IGluZGV4IDIxMzgwNWQzNTkyYy4uOTE3
ZjNhYzlmMWExIDEwMDY0NAo+ID4gPiA+IC0tLSBhL2ZzL2YyZnMveGF0dHIuYwo+ID4gPiA+ICsr
KyBiL2ZzL2YyZnMveGF0dHIuYwo+ID4gPiA+IEBAIC0xMjcsNiArMTI3LDkgQEAgc3RhdGljIGlu
dCBmMmZzX3hhdHRyX2FkdmlzZV9zZXQoY29uc3Qgc3RydWN0IHhhdHRyX2hhbmRsZXIgKmhhbmRs
ZXIsCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FSU5W
QUw7Cj4gPiA+ID4gCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoCBuZXdfYWR2aXNlID0gbmV3X2Fk
dmlzZSAmIEZBRFZJU0VfTU9ESUZJQUJMRV9CSVRTOwo+ID4gPiA+ICvCoMKgwqDCoMKgwqAgaWYg
KChuZXdfYWR2aXNlICYgRkFEVklTRV9DT0xEX0JJVCkgJiYgKG5ld19hZHZpc2UgJiBGQURWSVNF
X0hPVF9CSVQpKQo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAt
RUlOVkFMOwoKV2h5IG5vdCB0aGlzIHRvIGFsbG93IHNldHRpbmcgb25lIGJpdCBvbmx5PwoKQEAg
LTEyMyw3ICsxMjMsOCBAQCBzdGF0aWMgaW50IGYyZnNfeGF0dHJfYWR2aXNlX3NldChjb25zdCBz
dHJ1Y3QgeGF0dHJfaGFuZGxlciAqaGFuZGxlciwKICAgICAgICAgICAgICAgIHJldHVybiAtRUlO
VkFMOwoKICAgICAgICBuZXdfYWR2aXNlID0gKihjaGFyICopdmFsdWU7Ci0gICAgICAgaWYgKG5l
d19hZHZpc2UgJiB+RkFEVklTRV9NT0RJRklBQkxFX0JJVFMpCisgICAgICAgaWYgKG5ld19hZHZp
c2UgJiB+RkFEVklTRV9NT0RJRklBQkxFX0JJVFMgfHwKKyAgICAgICAgICAgbmV3X2FkdmlzZSA9
PSBGQURWSVNFX01PRElGSUFCTEVfQklUUykKICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFM
OwoKPiA+ID4gCj4gPiA+IFl1bmxlaSwKPiA+ID4gCj4gPiA+IFdoYXQgYWJvdXQgdGhlIGJlbG93
IGNhc2U6Cj4gPiA+IAo+ID4gPiAxLiBmMmZzX3hhdHRyX2FkdmlzZV9zZXQoRkFEVklTRV9DT0xE
X0JJVCkKPiA+ID4gMi4gZjJmc194YXR0cl9hZHZpc2Vfc2V0KEZBRFZJU0VfSE9UX0JJVCkKPiA+
IAo+ID4gSGkswqAgQ2hhbywKPiA+IAo+ID4gIMKgwqDCoCBJIHRlc3QgdGhpcyBjYXNlIHdvcmsg
d2VsbCB3aXRoIHRoaXMgcGF0Y2gswqAgY2FzZSBiZWxvdyB3aWxsIHJldHVybiAtRUlOVkFMOgo+
ID4gCj4gPiAgwqDCoMKgIGYyZnNfeGF0dHJfYWR2aXNlX3NldChGQURWSVNFX0NPTERfQklUIHwg
RkFEVklTRV9IT1RfQklUKQo+IAo+IENvcnJlY3QsIEkgbWlzc2VkIHRvIGNoZWNrIGJlbG93IHN0
YXRlbWVudC4KPiAKPiBuZXdfYWR2aXNlIHw9IG9sZF9hZHZpc2UgJiB+RkFEVklTRV9NT0RJRklB
QkxFX0JJVFM7Cj4gCj4gQW55d2F5LCB0aGUgcGF0Y2ggbG9va3MgZ29vZCB0byBtZS4KPiAKPiBS
ZXZpZXdlZC1ieTogQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPgo+IAo+IFRoYW5rcywKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRl
dmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApo
dHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRl
dmVsCg==
