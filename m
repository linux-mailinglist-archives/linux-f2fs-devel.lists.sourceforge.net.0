Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 462D09C0FA9
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  7 Nov 2024 21:30:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t999L-0003hH-QN;
	Thu, 07 Nov 2024 20:30:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1t999K-0003hA-6d
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 Nov 2024 20:30:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mVQCNHV+mmYwX2nYFAAYQBJsCNGVtT6sRLCLWcWJTdo=; b=E6pyw3u3DbaeywsNkjgGHduoIi
 V2lhiDEu2Ab09MBWblaBoC0b4SYqxaGzRjvMkyiLt97j5GrztOYlRjWxnK7d00ihNFg+JV+yf1aai
 tq1Y7Bo2qkqmnmsJ34NtN3WHYychRtXhePhI3xsryDqz7wzb3JJAkPo/HKoAtHdGaOWs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mVQCNHV+mmYwX2nYFAAYQBJsCNGVtT6sRLCLWcWJTdo=; b=BnLj+MaMCotE+vpfm2ShUuAUb3
 HvmJME0g6zVl2N8Lhdnzv6HD5q3CPOrQZKggsyb7Yz6LeEE4R7xa5+buXAUvJylbeFkduXGhXFnZ1
 D/BdPvJTOvYYva7qnhOmfbhK0Nv6+Iigmtf7iLe2MjiF1h180yILJx82XBh4ZRWvv0R4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t999J-0003tc-1q for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 Nov 2024 20:30:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 10A5A5C515F;
 Thu,  7 Nov 2024 20:29:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79C04C4CED5;
 Thu,  7 Nov 2024 20:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731011431;
 bh=eAef36GNz7B+Ka0Ox9x43rz9yb93FE3ruONiDAzO5/c=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Agg7rmTCE62Laa8I+64QLrNBVW+y2KHLN1wVgwpDBh5nfWJGc1qLg96ANqibGgC+l
 zKRIjaOVPDYtG69ev7u2zhPCcR+5XT3mzN2fFHUkR366VY+kJ+nv1X1cdBGMbL/iRE
 qznW6BPvO49OS9snrBR33EixIQxAXmvmElk7WwNg2pGfmEhZCKQyhFnipgifi9Etvc
 h1LKezXUj/2gzW1tP9Mzh0CzF7EQjsfMM+ReDMjf1bDfZa9fcjw9HT0N6LgJe6yCJs
 1K0oeyoH4uLm//UK4WMWecDmjzPCB57NGMVjmLJJm+NttFuW9FNekTbdr4NgcZZBqF
 jMWcF4HqiZDHg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EB5353809A80; Thu,  7 Nov 2024 20:30:41 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <173101144050.2084993.16195165564628415074.git-patchwork-notify@kernel.org>
Date: Thu, 07 Nov 2024 20:30:40 +0000
References: <20241023094850.1680709-1-zengheng4@huawei.com>
In-Reply-To: <20241023094850.1680709-1-zengheng4@huawei.com>
To: Zeng Heng <zengheng4@huawei.com>
X-Spam-Score: -5.5 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
    Jaegeuk Kim <jaegeuk@kernel.org>: On Wed, 23 Oct 2024 17:48:50 +0800 you
   wrote: > Fix the following compilation warning: > fs/f2fs/data.c:2391:10:
   warning: variable ‘index’ set but not used > [-Wunused-but-set-variable]
    > 2391 | p [...] 
 
 Content analysis details:   (-5.5 points, 6.0 required)
 
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
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t999J-0003tc-1q
Subject: Re: [f2fs-dev] [PATCH] f2fs: Fix not used variable 'index'
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, bobo.shaobowang@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGVsbG86CgpUaGlzIHBhdGNoIHdhcyBhcHBsaWVkIHRvIGphZWdldWsvZjJmcy5naXQgKGRldikK
YnkgSmFlZ2V1ayBLaW0gPGphZWdldWtAa2VybmVsLm9yZz46CgpPbiBXZWQsIDIzIE9jdCAyMDI0
IDE3OjQ4OjUwICswODAwIHlvdSB3cm90ZToKPiBGaXggdGhlIGZvbGxvd2luZyBjb21waWxhdGlv
biB3YXJuaW5nOgo+IGZzL2YyZnMvZGF0YS5jOjIzOTE6MTA6IHdhcm5pbmc6IHZhcmlhYmxlIOKA
mGluZGV44oCZIHNldCBidXQgbm90IHVzZWQKPiBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0K
PiAgMjM5MSB8ICBwZ29mZl90IGluZGV4Owo+IAo+IE9ubHkgZGVmaW5lIGFuZCBzZXQgdGhlIHZh
cmlhYmxlIGluZGV4IHdoZW4gdGhlIENPTkZJR19GMkZTX0ZTX0NPTVBSRVNTSU9OCj4gaXMgZW5h
YmxlZC4KPiAKPiBbLi4uXQoKSGVyZSBpcyB0aGUgc3VtbWFyeSB3aXRoIGxpbmtzOgogIC0gW2Yy
ZnMtZGV2XSBmMmZzOiBGaXggbm90IHVzZWQgdmFyaWFibGUgJ2luZGV4JwogICAgaHR0cHM6Ly9n
aXQua2VybmVsLm9yZy9qYWVnZXVrL2YyZnMvYy8wYzNhMzhhNGI0NDIKCllvdSBhcmUgYXdlc29t
ZSwgdGhhbmsgeW91IQotLSAKRGVldC1kb290LWRvdCwgSSBhbSBhIGJvdC4KaHR0cHM6Ly9rb3Jn
LmRvY3Mua2VybmVsLm9yZy9wYXRjaHdvcmsvcHdib3QuaHRtbAoKCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5n
IGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0
cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
