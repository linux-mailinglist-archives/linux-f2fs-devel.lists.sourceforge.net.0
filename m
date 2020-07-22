Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE84229DD2
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 22 Jul 2020 19:06:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jyIC8-0008PK-N5; Wed, 22 Jul 2020 17:06:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <gregkh@linuxfoundation.org>) id 1jyIC7-0008P9-39
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 Jul 2020 17:06:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=livU0pCa/qsmiUVAc6nFK7s7ABNUCWCuotAdUiOGYwg=; b=fYL79JDap6YOLXdOUOZ+2Efs2j
 EKNQUoqe+qRYCPejM3bTCj30+j6sTYazwhhrjNQh/tVkCSx2FJm9vmN7Wgvp853RKVzy6h/jGzi33
 udnKC32LWywhvnr835D6Vd64Vcx4JnN2VE3oFJBgydQ/3TRyeJ2DAjYdir16LxoSjZcg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=livU0pCa/qsmiUVAc6nFK7s7ABNUCWCuotAdUiOGYwg=; b=j0CI3qo4SOm5CJJg3A9dIzGhoM
 SrQShSliIAGWEmoCQBpwyZsVRPqEF2DDIznaJsS1PqlSrjXjOkXtrnzZtnNuURorDEzR/SfzdEfoe
 m64UQ/gHm3Db8Y26KKrBiA1mmTZMZIpGQwwd+dWigiT3aBoPjqmVYJEs44NqccrsobVM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jyIC2-00DlxV-Jp
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 Jul 2020 17:06:15 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 77903207E8;
 Wed, 22 Jul 2020 17:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595437558;
 bh=OR5cu9ZiOnyEIuGOim8D0YhB42FI73IvAZzLYBaMrAU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fo21+ikbWeaUKIlmQNUaTc7OWl1nlaenOWLBZXBwygMsnaX9HuJ9knbDk583vacjj
 YNS64Wb3BIoGLj8a7Y/fgPhNnSc5EFsxGH21pGPqhSDx3BY8knZVbnQw+puTpgdjIy
 f1s8m7QiEWgjc5Abrl8IzGXrbNwOtsHQ0SzVKdFg=
Date: Wed, 22 Jul 2020 19:06:02 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <20200722170602.GA440171@kroah.com>
References: <20200719054409.3050516-1-daeho43@gmail.com>
 <20200719151640.GA301791@kroah.com>
 <20200722164356.GA3912099@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200722164356.GA3912099@google.com>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jyIC2-00DlxV-Jp
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: add sysfs symbolic link to kobject
 with volume name
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gV2VkLCBKdWwgMjIsIDIwMjAgYXQgMDk6NDM6NTZBTSAtMDcwMCwgSmFlZ2V1ayBLaW0gd3Jv
dGU6Cj4gT24gMDcvMTksIEdyZWcgS0ggd3JvdGU6Cj4gPiBPbiBTdW4sIEp1bCAxOSwgMjAyMCBh
dCAwMjo0NDowOFBNICswOTAwLCBEYWVobyBKZW9uZyB3cm90ZToKPiA+ID4gRnJvbTogRGFlaG8g
SmVvbmcgPGRhZWhvamVvbmdAZ29vZ2xlLmNvbT4KPiA+ID4gCj4gPiA+IEFkZGVkIGEgc3ltYm9s
aWMgbGluayBkaXJlY3RvcnkgcG9pbnRpbmcgdG8gaXRzIGRldmljZSBuYW1lCj4gPiA+IGRpcmVj
dG9yeSB1c2luZyB0aGUgdm9sdW1lIG5hbWUgb2YgdGhlIHBhcnRpdGlvbiBpbiBzeXNmcy4KPiA+
ID4gKGkuZS4sIC9zeXMvZnMvZjJmcy92b2xfI3ggLT4gL3N5cy9mcy9mMmZzL3NkYTEpCj4gPiAK
PiA+IE5vLCBwbGVhc2Ugbm8uCj4gPiAKPiA+IFRoYXQgaXMgYWxyZWFkeSBjcmVhdGVkIHRvZGF5
IGZvciB5b3UgaW4gL2Rldi9kaXNrLyAgVGhlIGtlcm5lbCBkb2VzIG5vdAo+ID4gbmVlZCB0byBk
byB0aGlzIGFnYWluLgo+ID4gCj4gPiBJZiB5b3VyIGRpc3Ryby9zeXN0ZW0vd2hhdGV2ZXIgZG9l
cyBub3QgcHJvdmlkZSB5b3Ugd2l0aCAvZGV2L2Rpc2svIGFuZAo+ID4gYWxsIG9mIHRoZSBzeW1s
aW5rcyBpbiB0aGVyZSwgdGhlbiB3b3JrIHdpdGggeW91ciBkaXN0cm8vc3lzdGVtL3doYXRldmVy
Cj4gPiB0byBkbyBzby4KPiAKPiBJIGRvbid0IGdldCB0aGUgcG9pbnQsIHNpbmNlIC9kZXYvZGlz
ayBwb2ludHMgZGV2aWNlIG5vZGUsIG5vdCBhbnkgc3lzZnMgZW50cnkuCj4gRG8geW91IG1lYW4g
d2UgbmVlZCB0byBjcmVhdGUgc3ltbGluayB0byAvc3lzL2ZzL2YyZnMvZG0tWCBpbiAvZGV2L2Rp
c2s/CgpIdWgsIG5vISAgSXQncyBhbGwgZG9uZSBmb3IgeW91IHRvZGF5IGF1dG9tYWdpY2FsbHkg
YnkgdXNlcnNwYWNlOgoKJCB0cmVlIC9kZXYvZGlzay9ieS1sYWJlbC8KL2Rldi9kaXNrL2J5LWxh
YmVsLwrilJzilIDilIAgYm9vdCAtPiAuLi8uLi9zZGExCuKUnOKUgOKUgCBmYXN0X2Rpc2sgLT4g
Li4vLi4vbWQwCuKUnOKUgOKUgCByb290IC0+IC4uLy4uL3NkYTIK4pSU4pSA4pSAIHN0dWZmIC0+
IC4uLy4uL2RtLTAKCkxvb2sgb24geW91ciBsYXB0b3AvZGVza3RvcC9zZXJ2ZXIgdG9kYXkgZm9y
IHRob3NlLCB0aGVyZSdzIGxvdHMgb2YKc3ltbGlua3MgaW4gL2Rldi9kaXNrLwoKPiA+IEFnYWlu
LCBubyBuZWVkIHRvIGRvIHRoaXMgb24gYSBwZXItZmlsZXN5c3RlbS1iYXNpcyB3aGVuIHdlIGFs
cmVhZHkgaGF2ZQo+ID4gdGhpcyBhcm91bmQgZm9yIGFsbCBmaWxlc3lzdGVtcywgYW5kIGhhdmUg
aGFkIGl0IGZvciAxNSsgeWVhcnMgbm93Lgo+IAo+IENvdWxkIHlvdSBwb2ludCBvdXQgd2hlcmUg
d2UgY2FuIGdldCB0aGlzPyBBbmQsIHRoZSBsYWJlbCBzdXBwb3J0IGRlcGVuZHMKPiBvbiBwZXIt
ZmlsZXN5c3RlbSBkZXNpZ24uIEknbSBub3Qgc3VyZSBob3cgdGhpcyBjYW4gYmUgZ2VuZXJpYyBl
bm91Z2guCgpVc2Vyc3BhY2Uga25vd3MgaG93IHRvIHJlYWQgbGFiZWxzIG9uIGEgcGVyLWZpbGVz
eXN0ZW0tYmFzaXMgYW5kIGRvZXMgc28KanVzdCBmaW5lLiAgVGhhdCdzIGhvdyBpdCBjcmVhdGVz
IHRob3NlIHN5bWxpbmtzLCBubyBrZXJuZWwgc3VwcG9ydCBpcwpuZWVkZWQuCgpUaGlzIGhhcyBi
ZWVuIGltcGxlbWVudGVkIGZvciAxNSsgeWVhcnMgbm93LCBpdCdzIG5vdCBhIG5ldyB0aGluZy4u
LgoKTm93IGlmIHlvdXIgZW1iZWRkZWQgc3lzdGVtIGRvZXNuJ3Qgc3VwcG9ydCBpdCwgdGhhdCdz
IHRoZSB1c2Vyc3BhY2Ugb2YKdGhhdCBzeXN0ZW0ncyBmYXVsdCwgaXQncyBub3QgdGhlIGtlcm5l
bCdzIGZhdWx0IGF0IGFsbC4gIEdvIGZpeCB5b3VyCnVzZXJzcGFjZSBpZiB5b3Ugd2FudCB0aG9z
ZSB0aGluZ3MuCgp0aGFua3MsCgpncmVnIGstaAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4
LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9y
Z2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
