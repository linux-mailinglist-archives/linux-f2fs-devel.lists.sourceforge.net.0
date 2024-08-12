Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C12F994F7BA
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Aug 2024 21:53:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sdb6t-0007UH-Ik;
	Mon, 12 Aug 2024 19:53:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1sdb6s-0007UB-Am
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Aug 2024 19:53:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DiFh86TsqHxOkPlk9CiLiOfNgDkgqQioxEkgYzSBfO4=; b=K/3mYiYO1aTPX/lP9OxCl3RB1x
 TfS+U1Klw9LOPE7Olgh7AQ1O4OiWmPrvnc7kwkvRSmZcHA4VquFYIH6iWkF/ADItzs/4FYeg0P43v
 asZiuztFqWRupNkzO1IPhrzRuPBeccfkxpyQ3YUzseOP4ET0pZm+fO9yyxvSbAA0YkPA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DiFh86TsqHxOkPlk9CiLiOfNgDkgqQioxEkgYzSBfO4=; b=DFQIYblgDybSGHGTVLuRuI6rhC
 2LGm1PoWJ72ALqlmSuPATwor8TLa9jsygT+B85Ee6BVu4gp+zN1d35bxZShG+HWgExIE7Glo3Dx0A
 d0pKHLH5jYuIEUz48AOgOPjlb1kLNZr+3HZkVqmprjwy5O25IilYR9ISJ/VVI51elSUA=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sdb6s-0000BS-8Q for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Aug 2024 19:53:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 78A9CCE0E05;
 Mon, 12 Aug 2024 19:53:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7028FC32782;
 Mon, 12 Aug 2024 19:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723492409;
 bh=7XxYjJbSfMGxw6FYb3Wi3R5bokMMXSutWsLbppq0/DQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gJL3YDIuKY8x1IIO55gL+KcPXFJjdHrH7Tn1icpyQjG52dRgTbVYa7IhLoUuRI5mR
 sfl/F6oQKAzIwjJvqWTaTHSytmflds0CPAGH0L5NM9IZwcyGgo94Yu1yVxwI5iHUMc
 DRUus+F2PLn+lIw7zSHHL0egeQmRL/r5fQqSUmrXWRphfXpuA+5+eLPpt3CeF/lQOv
 WoeyWVjwjnCp5ph0owTRHOdEu9XHIR/ZuvKnmyXBfZIS8ZE3VmI+a59PmAi9/BJf7t
 6Cx+jzia41Ka98SMlshiwaz9xbYtLDn1ae+b1+FbyWODzJb5/ohc57N63KZcdYHyvq
 bKHOsz/WPpXRg==
Date: Mon, 12 Aug 2024 19:53:27 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <ZrpoNyb8h0ccIZdF@google.com>
References: <20240808205732.292600-1-jaegeuk@kernel.org>
 <CACOAw_w0Dyn4T-r00=XrvGO0ZvWCVPv9wPQis9mz-9NXoqwmPA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACOAw_w0Dyn4T-r00=XrvGO0ZvWCVPv9wPQis9mz-9NXoqwmPA@mail.gmail.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 08/12, Daeho Jeong wrote: > On Thu, Aug 8, 2024 at 1:59 PM
    Jaegeuk Kim <jaegeuk@kernel.org> wrote: > > > > Should finish zones if they
    are open. > > > > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel [...] 
 
 Content analysis details:   (-5.3 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [145.40.73.55 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sdb6s-0000BS-8Q
Subject: Re: [f2fs-dev] [PATCH] fsck.f2fs: don't finish zones if it's not
 open
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMDgvMTIsIERhZWhvIEplb25nIHdyb3RlOgo+IE9uIFRodSwgQXVnIDgsIDIwMjQgYXQgMTo1
OeKAr1BNIEphZWdldWsgS2ltIDxqYWVnZXVrQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IFNo
b3VsZCBmaW5pc2ggem9uZXMgaWYgdGhleSBhcmUgb3Blbi4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5
OiBKYWVnZXVrIEtpbSA8amFlZ2V1a0BrZXJuZWwub3JnPgo+ID4gLS0tCj4gPiAgaW5jbHVkZS9m
MmZzX2ZzLmggICB8IDIgKysKPiA+ICBsaWIvbGliZjJmc196b25lZC5jIHwgNSArKystLQo+ID4g
IDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4KPiA+
IGRpZmYgLS1naXQgYS9pbmNsdWRlL2YyZnNfZnMuaCBiL2luY2x1ZGUvZjJmc19mcy5oCj4gPiBp
bmRleCAzZjU1ODNkMTgzMjkuLjE1YTFjODJhZTE4ZiAxMDA2NDQKPiA+IC0tLSBhL2luY2x1ZGUv
ZjJmc19mcy5oCj4gPiArKysgYi9pbmNsdWRlL2YyZnNfZnMuaAo+ID4gQEAgLTE3NDIsNiArMTc0
Miw4IEBAIGJsa196b25lX2NvbmRfc3RyKHN0cnVjdCBibGtfem9uZSAqYmxreikKPiA+ICAgKiBI
YW5kbGUga2VybmVsIHpvbmUgY2FwYWNpdHkgc3VwcG9ydAo+ID4gICAqLwo+ID4gICNkZWZpbmUg
YmxrX3pvbmVfZW1wdHkoeikgICAgICAoYmxrX3pvbmVfY29uZCh6KSA9PSBCTEtfWk9ORV9DT05E
X0VNUFRZKQo+ID4gKyNkZWZpbmUgYmxrX3pvbmVfb3Blbih6KSAgICAgICAoYmxrX3pvbmVfY29u
ZCh6KSA9PSBCTEtfWk9ORV9DT05EX0lNUF9PUEVOIHx8ICBcCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBibGtfem9uZV9jb25kKHopID09IEJMS19aT05FX0NPTkRfRVhQX09Q
RU4pCj4gPiAgI2RlZmluZSBibGtfem9uZV9zZWN0b3IoeikgICAgICh6KS0+c3RhcnQKPiA+ICAj
ZGVmaW5lIGJsa196b25lX2xlbmd0aCh6KSAgICAgKHopLT5sZW4KPiA+ICAjZGVmaW5lIGJsa196
b25lX3dwX3NlY3Rvcih6KSAgKHopLT53cAo+ID4gZGlmZiAtLWdpdCBhL2xpYi9saWJmMmZzX3pv
bmVkLmMgYi9saWIvbGliZjJmc196b25lZC5jCj4gPiBpbmRleCAyMjFkN2QxMzM3YzcuLjg5YmE1
YWQ3M2E3NiAxMDA2NDQKPiA+IC0tLSBhL2xpYi9saWJmMmZzX3pvbmVkLmMKPiA+ICsrKyBiL2xp
Yi9saWJmMmZzX3pvbmVkLmMKPiA+IEBAIC01MTMsNyArNTEzLDcgQEAgaW50IGYyZnNfZmluaXNo
X3pvbmUoaW50IGksIHZvaWQgKmJsa3pvbmUpCj4gPiAgICAgICAgIHN0cnVjdCBibGtfem9uZV9y
YW5nZSByYW5nZTsKPiA+ICAgICAgICAgaW50IHJldDsKPiA+Cj4gPiAtICAgICAgIGlmICghYmxr
X3pvbmVfc2VxKGJsa3opIHx8IGJsa196b25lX2VtcHR5KGJsa3opKQo+ID4gKyAgICAgICBpZiAo
IWJsa196b25lX3NlcShibGt6KSB8fCAhYmxrX3pvbmVfb3BlbihibGt6KSkKPiAKPiBEb24ndCB3
ZSBuZWVkIHRvIGNoZWNrIGJsa196b25lX2VtcHR5KCkgYW55bW9yZT8KCkkgdGhpbmsgdGhlIHB1
cnBvc2Ugb2YgZmluaXNoaW5nIGEgem9uZSBpcyB0byBjbG9zZSBhbnkgb3BlbiB6b25lcy4gSSBl
eHBlY3QKdGhlIGVtcHR5fGZ1bGwgem9uZSB3aWxsIGJlIHJlc2V0IGJ5IGYyZnMgbGF0ZXIgYmVm
b3JlIHVzZS4KCj4gCj4gPiAgICAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4gPgo+ID4gICAgICAg
ICAvKiBOb24gZW1wdHkgc2VxdWVudGlhbCB6b25lOiBmaW5pc2ggKi8KPiA+IEBAIC01MjIsNyAr
NTIyLDggQEAgaW50IGYyZnNfZmluaXNoX3pvbmUoaW50IGksIHZvaWQgKmJsa3pvbmUpCj4gPiAg
ICAgICAgIHJldCA9IGlvY3RsKGRldi0+ZmQsIEJMS0ZJTklTSFpPTkUsICZyYW5nZSk7Cj4gPiAg
ICAgICAgIGlmIChyZXQgIT0gMCkgewo+ID4gICAgICAgICAgICAgICAgIHJldCA9IC1lcnJubzsK
PiA+IC0gICAgICAgICAgICAgICBFUlJfTVNHKCJpb2N0bCBCTEtGSU5JU0haT05FIGZhaWxlZDog
ZXJybm89JWRcbiIsIGVycm5vKTsKPiA+ICsgICAgICAgICAgICAgICBFUlJfTVNHKCJpb2N0bCBC
TEtGSU5JU0haT05FIGZhaWxlZDogZXJybm89JWQsIHN0YXR1cz0lc1xuIiwKPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgIGVycm5vLCBibGtfem9uZV9jb25kX3N0cihibGt6KSk7Cj4gPiAgICAg
ICAgIH0KPiA+Cj4gPiAgICAgICAgIHJldHVybiByZXQ7Cj4gPiAtLQo+ID4gMi40Ni4wLjc2Lmdl
NTU5YzRiZjFhLWdvb2cKPiA+Cj4gPgo+ID4KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4gPiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+
ID4gTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPiA+IGh0dHBzOi8vbGlz
dHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRl
dmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApo
dHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRl
dmVsCg==
