Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E0199C50011
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Nov 2025 23:51:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9MPi2GjRbIrDnQ/WjgwU9KirOkyiWu9Q6TdGN58CeyY=; b=dT2woPhTXV9vPBWzAZpe/OwOyB
	OFJy8I96NtpN3UOx/JLrP57zQLkKfJUIininP0SKEN6oiVTP6FAyqNsmVmgTmbGG0Ju0L82oGNNpa
	L94VSlmCqvl/BfVPpw+BzXzNGTewuyzN5VcQUpMXcIIutmoQqysu9CJI2yxAlDL7irF0=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vIxCX-0008QT-9m;
	Tue, 11 Nov 2025 22:51:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1vIxCS-0008PY-6C
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Nov 2025 22:50:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fXLYXXYHRVUVuCk9mLVH4Tk+BXh5X8rFYEqwvuKylC8=; b=Y5rn7tytHZA2GcEubcXG9cOALW
 iASjhjzyM1g7026xq6c8IHWb8N+72Hkv+mChyITK20odJ6zSSk1cgmTchGz+/bdMB6c0t333q1pyY
 yJM0RtoECfemeCHGkxqZXQ2H1ROQIweCJ3dXgNfFjnR2LpOrRBDZt9594nRDLFQ+nRxg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fXLYXXYHRVUVuCk9mLVH4Tk+BXh5X8rFYEqwvuKylC8=; b=EDu17pOzRNsqyfMLIx/ghrwHr3
 yMPjhMI0aanxtG9xjdkNejsPF2+vlQD/L6lUoC+Rhzv412w9iQEnZU7Rl+5SkRFOJTJlrldNLr3sX
 lti2erR8mbP4ofOY/yS1bSY+3BBS2C0zx4pzVd8vQuZQ8sYgvByobgEv6+r4jEtmMr9U=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vIxCQ-00046J-BV for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Nov 2025 22:50:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C48AF600AE;
 Tue, 11 Nov 2025 22:50:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74829C4CEFB;
 Tue, 11 Nov 2025 22:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762901443;
 bh=lih0+RXTcTkySeeNC8FObDIyhadckjqvtxvgziMdxKM=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=P4GKc0FrEEmjyGjVA8TrDBvlLo0hVhDxj5alX1V3SBgjjgT7QU14ioqnUwnNInx1V
 11fof0S7M2jKqRFSJB0vlBvXjMqdVLExDAGb/LlFoel2OOfwcE5wQqYjsEDusCmhx2
 +e/feemJkd3tOMP9Zn2UjizjcnLqd0EqnFO/NvcAjDA+5Y+6IOR4NOLPYvBSk9GXpk
 NUwdhjKHIvHxsJDNowiokwdmJXs223EH7k6Bl2IIGhmAIfv/QycwySt2EVpdQI1lWq
 5o4hA1vo94WTLKYozONfOVGg/Ksj9iAzt5/Sd05BSxl44YHNEtrVFzdJIFcmRw8ZWC
 j5JuKkr5o1CLw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 C5F27380DBCD; Tue, 11 Nov 2025 22:50:14 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <176290141374.3596344.17459931762153462182.git-patchwork-notify@kernel.org>
Date: Tue, 11 Nov 2025 22:50:13 +0000
References: <20251021034856.739272-1-chao@kernel.org>
In-Reply-To: <20251021034856.739272-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Tue, 21 Oct 2025 11:48:56 +0800 you
 wrote: > As Hong Yun reported in mailing list: > > loop7: detected capacity
 change from 0 to 131072 > [ cut here ] > kmem_cache of name ' [...] 
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
X-Headers-End: 1vIxCQ-00046J-BV
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: use global inline_xattr_slab
 instead of per-sb slab cache
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
From: patchwork-bot+f2fs--- via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: patchwork-bot+f2fs@kernel.org
Cc: jaegeuk@kernel.org, yhong@link.cuhk.edu.hk,
 linux-f2fs-devel@lists.sourceforge.net, stable@kernel.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGVsbG86CgpUaGlzIHBhdGNoIHdhcyBhcHBsaWVkIHRvIGphZWdldWsvZjJmcy5naXQgKGRldikK
YnkgSmFlZ2V1ayBLaW0gPGphZWdldWtAa2VybmVsLm9yZz46CgpPbiBUdWUsIDIxIE9jdCAyMDI1
IDExOjQ4OjU2ICswODAwIHlvdSB3cm90ZToKPiBBcyBIb25nIFl1biByZXBvcnRlZCBpbiBtYWls
aW5nIGxpc3Q6Cj4gCj4gbG9vcDc6IGRldGVjdGVkIGNhcGFjaXR5IGNoYW5nZSBmcm9tIDAgdG8g
MTMxMDcyCj4gLS0tLS0tLS0tLS0tWyBjdXQgaGVyZSBdLS0tLS0tLS0tLS0tCj4ga21lbV9jYWNo
ZSBvZiBuYW1lICdmMmZzX3hhdHRyX2VudHJ5LTc6NycgYWxyZWFkeSBleGlzdHMKPiBXQVJOSU5H
OiBDUFU6IDAgUElEOiAyNDQyNiBhdCBtbS9zbGFiX2NvbW1vbi5jOjExMCBrbWVtX2NhY2hlX3Nh
bml0eV9jaGVjayBtbS9zbGFiX2NvbW1vbi5jOjEwOSBbaW5saW5lXQo+IFdBUk5JTkc6IENQVTog
MCBQSUQ6IDI0NDI2IGF0IG1tL3NsYWJfY29tbW9uLmM6MTEwIF9fa21lbV9jYWNoZV9jcmVhdGVf
YXJncysweGE2LzB4MzIwIG1tL3NsYWJfY29tbW9uLmM6MzA3Cj4gQ1BVOiAwIFVJRDogMCBQSUQ6
IDI0NDI2IENvbW06IHN5ei43LjEzNzAgTm90IHRhaW50ZWQgNi4xNy4wLXJjNCAjMSBQUkVFTVBU
KGZ1bGwpCj4gSGFyZHdhcmUgbmFtZTogUUVNVSBTdGFuZGFyZCBQQyAoaTQ0MEZYICsgUElJWCwg
MTk5NiksIEJJT1MgMS4xMy4wLTF1YnVudHUxLjEgMDQvMDEvMjAxNAo+IFJJUDogMDAxMDprbWVt
X2NhY2hlX3Nhbml0eV9jaGVjayBtbS9zbGFiX2NvbW1vbi5jOjEwOSBbaW5saW5lXQo+IFJJUDog
MDAxMDpfX2ttZW1fY2FjaGVfY3JlYXRlX2FyZ3MrMHhhNi8weDMyMCBtbS9zbGFiX2NvbW1vbi5j
OjMwNwo+IENhbGwgVHJhY2U6Cj4gwqBfX2ttZW1fY2FjaGVfY3JlYXRlIGluY2x1ZGUvbGludXgv
c2xhYi5oOjM1MyBbaW5saW5lXQo+IMKgZjJmc19rbWVtX2NhY2hlX2NyZWF0ZSBmcy9mMmZzL2Yy
ZnMuaDoyOTQzIFtpbmxpbmVdCj4gwqBmMmZzX2luaXRfeGF0dHJfY2FjaGVzKzB4YTUvMHhlMCBm
cy9mMmZzL3hhdHRyLmM6ODQzCj4gwqBmMmZzX2ZpbGxfc3VwZXIrMHgxNjQ1LzB4MjYyMCBmcy9m
MmZzL3N1cGVyLmM6NDkxOAo+IMKgZ2V0X3RyZWVfYmRldl9mbGFncysweDFmYi8weDI2MCBmcy9z
dXBlci5jOjE2OTIKPiDCoHZmc19nZXRfdHJlZSsweDQzLzB4MTQwIGZzL3N1cGVyLmM6MTgxNQo+
IMKgZG9fbmV3X21vdW50KzB4MjAxLzB4NTUwIGZzL25hbWVzcGFjZS5jOjM4MDgKPiDCoGRvX21v
dW50IGZzL25hbWVzcGFjZS5jOjQxMzYgW2lubGluZV0KPiDCoF9fZG9fc3lzX21vdW50IGZzL25h
bWVzcGFjZS5jOjQzNDcgW2lubGluZV0KPiDCoF9fc2Vfc3lzX21vdW50KzB4Mjk4LzB4MmYwIGZz
L25hbWVzcGFjZS5jOjQzMjQKPiDCoGRvX3N5c2NhbGxfeDY0IGFyY2gveDg2L2VudHJ5L3N5c2Nh
bGxfNjQuYzo2MyBbaW5saW5lXQo+IMKgZG9fc3lzY2FsbF82NCsweDhlLzB4M2EwIGFyY2gveDg2
L2VudHJ5L3N5c2NhbGxfNjQuYzo5NAo+IMKgZW50cnlfU1lTQ0FMTF82NF9hZnRlcl9od2ZyYW1l
KzB4NzYvMHg3ZQo+IAo+IFsuLi5dCgpIZXJlIGlzIHRoZSBzdW1tYXJ5IHdpdGggbGlua3M6CiAg
LSBbZjJmcy1kZXYsdjJdIGYyZnM6IHVzZSBnbG9iYWwgaW5saW5lX3hhdHRyX3NsYWIgaW5zdGVh
ZCBvZiBwZXItc2Igc2xhYiBjYWNoZQogICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9qYWVnZXVr
L2YyZnMvYy82NzBiNjc2ZDgzNDMKCllvdSBhcmUgYXdlc29tZSwgdGhhbmsgeW91IQotLSAKRGVl
dC1kb290LWRvdCwgSSBhbSBhIGJvdC4KaHR0cHM6Ly9rb3JnLmRvY3Mua2VybmVsLm9yZy9wYXRj
aHdvcmsvcHdib3QuaHRtbAoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZl
bEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlz
dHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
