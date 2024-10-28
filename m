Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2E19B37E0
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Oct 2024 18:40:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t5TjW-0006ZP-LN;
	Mon, 28 Oct 2024 17:40:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1t5TjU-0006ZF-Tr
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Oct 2024 17:40:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eunP2ipoZwwc0aO0FlT9OgrEfHuufhoP7ilVVKziy7E=; b=HuzTZYGEq+0I6rXnAVgimFD2n/
 htXZoKKJppl52fcws4spvcdiD4n6gKsvt9gCTtHwOGTa1aP4u65do5KUFc9MPIUmPSgrAeXOKRD75
 iub2An9uOk39uXYgh1i2a3knrT6rSspT+s6vnVfqfMgzVM/iWvMLFcCErQUh3uvFtNww=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eunP2ipoZwwc0aO0FlT9OgrEfHuufhoP7ilVVKziy7E=; b=lQrSAXHBbSHaBovgtynAugf2Vg
 cwIkfSr/HW6bCdToAc7EoseEeJmGmuFICfuhIfEmzA4GUQeFlUOIEciuSCmV3Q3SwFGltdaN3x6Tf
 VBoQ+UGfJQjqo6AdoOGgQPrxa4hwaSKo+gndYN+C9POySK4sARto4tOeSgP0Ye3Duc1M=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t5TjU-0005Hk-Bd for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Oct 2024 17:40:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D34BB5C5DF1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 28 Oct 2024 17:39:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A514EC4AF0B;
 Mon, 28 Oct 2024 17:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730137235;
 bh=hCLTyCHZZNaVX1YHFRpV0tcuaIeZgEzJXEYYh4gvRwI=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=OKnE5Er2Y58DmhytZml+LbWwHJlKG5KZPZ5kifJso1TPuxWtD5eMtzlgqM1JejNZ+
 /b5LaTFemQ9cii+lb8vYGbdeu1tv9X0SvwKNSEXduB2g5U1Hj8H8GtqiEU4RdSQsI+
 v+EaoLb+N46hMCyPcS//8He9ga8q6A+753j+aBC34r9n6a95LURuu4tA86y0XuDMdP
 Etl6d+7DOTIm8KSCJHXycF1WdJUBdfcsGoOFSlGLvH7gokrlsKovDpYYjzL+sYHn2k
 o0dmcfFkSENMfhWKhGDppSCZuhI/LAazZDrgNLuYeqAQaewRKYfeeTWuIraQvMHcFT
 GwlKP3RZn5ZcA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EAFAE380AC1C; Mon, 28 Oct 2024 17:40:43 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <173013724273.126843.1612111639944304594.git-patchwork-notify@kernel.org>
Date: Mon, 28 Oct 2024 17:40:42 +0000
References: <20241018062638.2619214-1-chao@kernel.org>
In-Reply-To: <20241018062638.2619214-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -5.6 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Fri, 18 Oct 2024 14:26:36 +0800 you
 wrote: > first_zoned_segno() returns a fixed value,
 let's cache it in > structure
 f2fs_sb_info to avoid redundant calculation. > > Signed-off-by: Chao Yu
 <chao@k [...] 
 Content analysis details:   (-5.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t5TjU-0005Hk-Bd
Subject: Re: [f2fs-dev] [PATCH 1/3] f2fs: zone: introduce first_zoned_segno
 in f2fs_sb_info
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Fri, 18 Oct 2024 14:26:36 +0800 you wrote:
> first_zoned_segno() returns a fixed value, let's cache it in
> structure f2fs_sb_info to avoid redundant calculation.
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/f2fs.h    |  1 +
>  fs/f2fs/segment.c |  4 ++--
>  fs/f2fs/segment.h | 10 ----------
>  fs/f2fs/super.c   | 13 +++++++++++++
>  4 files changed, 16 insertions(+), 12 deletions(-)

Here is the summary with links:
  - [f2fs-dev,1/3] f2fs: zone: introduce first_zoned_segno in f2fs_sb_info
    https://git.kernel.org/jaegeuk/f2fs/c/08060c0b1414
  - [f2fs-dev,2/3] f2fs: zone: allow IPU for regular file in regular block device
    (no matching commit)
  - [f2fs-dev,3/3] f2fs: support NOCoW flag
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
