Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA00BEE9F1
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 19 Oct 2025 18:26:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FVOguDYUUTT+7B4+BqDwmKmErffXTD+xhb6jjYjc+d8=; b=QzFMDVC7eHhjnpuZd/0r3qnRQo
	O+16i8TnQHCTKl+5RSL8NPEZ4lGuHbYNFRqhDjDLgbWmgcTtmMZrM5Cs7mdwpRev4iCbMh+C7ZPgt
	gypYQXyOe3du5WAQgNo+UyalETECaCelWXEodwlxOoRhkxcM9vFTF83wxRWN1hUpdC8E=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vAWEX-0000jl-5t;
	Sun, 19 Oct 2025 16:26:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1vAWDp-0000gU-PB
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 19 Oct 2025 16:25:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Karn116GYjTx2H81CntcrkAvTygSq7TejQKGOkTyXIM=; b=M+05Ti9w1eogdSfCoZBES1/9MG
 vbsdU7tlTBjuKbfHoqpZ7hXog6WBiYUbal9ynhRiFneCZhcL5JzgsOIpcMedSKd5rdWLK1pyn4I5b
 PY//A6DWWtSJcqO8oEsg1KGb1zoxXfaNv16DEP+hpSgDUO3/Iqllr8QOxbNsf9SDWI0c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Karn116GYjTx2H81CntcrkAvTygSq7TejQKGOkTyXIM=; b=fmL5BFd39/7ZGRxbUDWsy9Mcyr
 Mn6/nM4MZ8qKK0/4LBtE0f2opnnFz/JJRj1cmCCVnnSKesBoGQeHsj4lRG+i6rXh3NVgGxYt8pTW0
 +KVbmkUaL9QmCc/HliJcc+LR11f2C2Ds6zCg2opOnSYMmm8smDoR7tYsn53lU51yjP1I=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vAWDq-00045a-0v for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 19 Oct 2025 16:25:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8C9C944476;
 Sun, 19 Oct 2025 16:25:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7610C4CEE7;
 Sun, 19 Oct 2025 16:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760891119;
 bh=AqeDRU1eKSmQXUiCZ7pwi0Bd8BGGXBM48O4Ou5Xs+sw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=F2EokHRLd68kZBeDRRdhxJ1rDW2elFlh8EnkyaTJnHSCfqkoujh7BohpZc68H407D
 6bUXmBrNoq7Ww0jTMF1QQwGeMEpfXz0BrGd0k+T8PJbgWDRrKfDcnhwumf2RRZV3Tp
 M1nqa0cZRI89OYqyvuvRWeFwctcqJgDf9nK43gHk2G3mRl3usq7ey6ziFEp5oxVwef
 8ha/lyEniLuE2fegL9ApZJO+lst38G6OUrwAE6O/NFZ/Mz1YaBFZd+ociss1pkQv9d
 0MzWPAoBwoLUZ5+ACw5ohULeXVrjB6+3sdA7UiNPKC79wDn4zGf7+6LA7UKkZ5vUk5
 GbYsQCDUj5ADg==
Date: Sun, 19 Oct 2025 09:23:46 -0700
To: Askar Safin <safinaskar@gmail.com>
Message-ID: <20251019162346.GB1604@sol>
References: <20241202010844.144356-16-ebiggers@kernel.org>
 <20251019060845.553414-1-safinaskar@gmail.com>
 <CAPnZJGAb7AM4p=HdsDhYcANCzD8=gpGjuP4wYfr2utLp3WMSNQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPnZJGAb7AM4p=HdsDhYcANCzD8=gpGjuP4wYfr2utLp3WMSNQ@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sun, Oct 19, 2025 at 11:10:25AM +0300, Askar Safin wrote:
 > On Sun, Oct 19, 2025 at 9:09 AM Askar Safin <safinaskar@gmail.com> wrote:
 > > > > Eric Biggers <ebiggers@kernel.org>: > > > Now that the [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vAWDq-00045a-0v
Subject: Re: [f2fs-dev] [PATCH v4 15/19] lib/crc32: make crc32c() go
 directly to lib
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
From: Eric Biggers via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-mips@vger.kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-crypto@vger.kernel.org,
 loongarch@lists.linux.dev, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-ext4@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, ardb@kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gU3VuLCBPY3QgMTksIDIwMjUgYXQgMTE6MTA6MjVBTSArMDMwMCwgQXNrYXIgU2FmaW4gd3Jv
dGU6Cj4gT24gU3VuLCBPY3QgMTksIDIwMjUgYXQgOTowOeKAr0FNIEFza2FyIFNhZmluIDxzYWZp
bmFza2FyQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gRXJpYyBCaWdnZXJzIDxlYmlnZ2Vyc0Br
ZXJuZWwub3JnPjoKPiA+ID4gTm93IHRoYXQgdGhlIGxvd2VyIGxldmVsIF9fY3JjMzJjX2xlKCkg
bGlicmFyeSBmdW5jdGlvbiBpcyBvcHRpbWl6ZWQgZm9yCj4gPgo+ID4gVGhpcyBwYXRjaCAoaS4g
ZS4gMzhhOWE1MTIxYzNiICgibGliL2NyYzMyOiBtYWtlIGNyYzMyYygpIGdvIGRpcmVjdGx5IHRv
IGxpYiIpKQo+ID4gc29sdmVzIGFjdHVhbCBidWcgSSBmb3VuZCBpbiBwcmFjdGljZS4gU28sIHBs
ZWFzZSwgYmFja3BvcnQgaXQKPiA+IHRvIHN0YWJsZSBrZXJuZWxzLgo+IAo+IE9vcHMuIEkganVz
dCBub3RpY2VkIHRoYXQgdGhpcyBwYXRjaCByZW1vdmVzIG1vZHVsZSAibGliY3JjMzJjIi4KPiBB
bmQgdGhpcyBicmVha3MgYnVpbGQgZm9yIERlYmlhbiBrZXJuZWwgdjYuMTIuNDguCj4gUHJldmlv
dXNseSBJIHRlc3RlZCBtaW5pbWFsIGJ1aWxkIHVzaW5nICJtYWtlIGxvY2FsbW9kY29uZmlnIi4K
PiBOb3cgSSB0cmllZCBmdWxsIGJ1aWxkIG9mIERlYmlhbiBrZXJuZWwgdXNpbmcgImRwa2ctYnVp
bGRwYWNrYWdlIi4KPiBBbmQgaXQgZmFpbGVkLCBiZWNhdXNlIHNvbWUgb2YgRGViaWFuIGZpbGVz
IHJlZmVyZW5jZSAibGliY3JjMzJjIiwKPiB3aGljaCBpcyBub3QgYXZhaWxhYmxlLgo+IAo+IFNv
LCBwbGVhc2UsIGRvbid0IGJhY2twb3J0IHRoaXMgcGF0Y2ggdG8gc3RhYmxlIGtlcm5lbHMuCj4g
SSdtIHNvcnJ5LgoKUmlnaHQsIHRoaXMgY29tbWl0IHNpbXBsaWZpZWQgdGhlIENSQyBsaWJyYXJ5
IGRlc2lnbiBieSByZW1vdmluZyB0aGUKbGliY3JjMzJjIG1vZHVsZS4gIGluaXRyYW1mcyBidWls
ZCBzY3JpcHRzIHRoYXQgaGFyZC1jb2RlZCB0aGUgYWRkaXRpb24Kb2YgbGliY3JjMzJjLmtvIGlu
dG8gdGhlIHJhbWRpc2sgKHdoaWNoIEkgZG9uJ3QgdGhpbmsgd2FzIGV2ZXIgbmVjZXNzYXJ5Cmlu
IHRoZSBmaXJzdCBwbGFjZSwgdGhvdWdoIGl0IGRpZCB1c2VkIHRvIGJlIHVzZWZ1bCB0byBoYXJk
LWNvZGUgc29tZSBvZgp0aGUgKm90aGVyKiBDUkMgbW9kdWxlcyBsaWtlIGNyYzMyYy1pbnRlbCkg
aGFkIHRvIGJlIHVwZGF0ZWQgdG8gcmVtb3ZlCml0LiAgSXQgbG9va3MgbGlrZSBEZWJpYW4gZGlk
IGluZGVlZCBkbyB0aGF0LCBhbmQgdGhleSB1cGRhdGVkIGl0IGluCmh0dHBzOi8vc2Fsc2EuZGVi
aWFuLm9yZy9rZXJuZWwtdGVhbS9saW51eC8tL2NvbW1pdC82YzI0MmM2NDdmODRiZmRiZGMyMmE2
YTc1OGZhNTlkYTRlOTQxYTEwIzEyNTFmOTQwMGE4NTQ4NWQyNzVlMTcwOTc1ODM1MGFhMDk4NzA5
YTgKCkFzIGZvciB5b3VyIG9yaWdpbmFsIHByb2JsZW0sIEknZCBnbGFkIHRvIHNlZSB0aGF0IHRo
ZSBzaW1wbGlmaWVkIGRlc2lnbgppcyBwcmV2ZW50aW5nIHByb2JsZW1zLiAgVGhlcmUncyBhbiBp
c3N1ZSB3aXRoIGJhY2twb3J0aW5nIHRoaXMgY29tbWl0CmFsb25lLCB0aG91Z2guICBUaGlzIHdh
cyBwYXRjaCAxNSBvZiBhIDE5LXBhdGNoIHNlcmllcyBmb3IgYSBnb29kCnJlYXNvbjogdGhlIENS
Qy0zMkMgaW1wbGVtZW50YXRpb24gaW4gbGliLyB3YXNuJ3QgYXJjaGl0ZWN0dXJlLW9wdGltaXpl
ZAp1bnRpbCBhZnRlciBwYXRjaGVzIDEtMTQgb2YgdGhpcyBzZXJpZXMuICBCYWNrcG9ydGluZyB0
aGlzIGNvbW1pdCBhbG9uZQp3b3VsZCBtYWtlIGNyYzMyYygpIG5vIGxvbmdlciB1dGlsaXplIGFy
Y2hpdGVjdHVyZS1vcHRpbWl6ZWQgY29kZS4KCk5vdywgaXQgYWxyZWFkeSBkaWRuJ3QgZG8gc28g
cmVsaWFibHkgKGFuZCB0aGlzIHBhdGNoIHNlcmllcyBmaXhlZAp0aGF0KS4gIEhvd2V2ZXIsIGJh
Y2twb3J0aW5nIHRoaXMgY29tbWl0IGFsb25lIHdvdWxkIG1ha2UgaXQgbmV2ZXIgZG8Kc28uICBT
byBpdCB3b3VsZCByZWdyZXNzIHBlcmZvcm1hbmNlIGluIHNvbWUgY2FzZXMuCgpTaW5jZSB0aGUg
ZXJyb3JzIHlvdSdyZSBhY3R1YWxseSBnZXR0aW5nIGFyZToKCiAgICBbICAgMTkuNjE5NzMxXSBJ
bnZhbGlkIEVMRiBoZWFkZXIgbWFnaWM6ICE9IEVMRgogICAgbW9kcHJvYmU6IGNhbid0IGxvYWQg
bW9kdWxlIGxpYmNyYzMyYyAoa2VybmVsL2xpYi9saWJjcmMzMmMua28ueHopOiB1bmtub3duIHN5
bWJvbCBpbiBtb2R1bGUsIG9yIHVua25vd24gcGFyYW1ldGVyCgpJIGRvIGhhdmUgdG8gd29uZGVy
IGlmIHRoaXMgaXMgYWN0dWFsbHkgYSBidXN5Ym94IGJ1ZyBvcgptaXNjb25maWd1cmF0aW9uLCB3
aGVyZSBpdCdzIHBhc3NpbmcgYSBjb21wcmVzc2VkIG1vZHVsZSB0byB0aGUga2VybmVsCndpdGhv
dXQgZGVjb21wcmVzc2luZyBpdD8gIEFuZCByZW1vdmluZyB0aGUgbW9kdWxlIGp1c3QgaGlkIHRo
ZSBwcm9ibGVtLgoKLSBFcmljCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZl
bEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlz
dHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
