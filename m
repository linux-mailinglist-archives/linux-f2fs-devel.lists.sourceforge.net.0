Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E69629316FC
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jul 2024 16:40:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sTMsd-0003NS-AG;
	Mon, 15 Jul 2024 14:40:43 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1sTMsa-0003N7-MH
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jul 2024 14:40:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ax320unGh53sOpZwViqSYEqP6tB3Y97B5Yp1xUZtbDc=; b=GU4ox4P670jrQ0md3SKPTOmH7/
 ea096rei0ijRO629wg1mWxjGlvK9seTRMJemZFXEHwmh1ajR2baKYoKz5r16WKoC/uVUxHJ2orTVK
 cO9w2BSIdTxYZXTwEOaT9q6AAybCY/uwUgvqvHqc5E9XxjNawQrQMujHY+tkBcWdPPz4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ax320unGh53sOpZwViqSYEqP6tB3Y97B5Yp1xUZtbDc=; b=BT87SzGh/UK0cvtQIFJ3DzKUej
 ZS+z6xgt88nuYod9bLzu8omwuXQG08kEYHhb+HXCqcyg+7zuZXPnIFTETeAiveajWfQ3BAV1yt1w4
 ytuooJ1602ltE0hvrGC09YfClDRkne7kHILSZhaDKa0oXT4qF7Rr9+cKTLOn6EAJaXCU=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sTMsa-0003Dp-Gs for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jul 2024 14:40:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 11CB6CE0FCB
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 15 Jul 2024 14:40:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 55488C4AF10;
 Mon, 15 Jul 2024 14:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721054432;
 bh=pzlx/tMbvXkzfRiRUmI4MX/JAOn9gs9uWE/iXLcsQqY=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=kJvRySsxr9IiHoKOmgNM1aNAIDwwlP51pJ9aRnjMvxOSIImAyVaQb87f80NdXwXWb
 6s5+8AgYQwdnGOvdmQuLTs6Ir5yfOkvTb00XzJ2aPvwmiLbOV0a2MCzWA52UNs+fsI
 nv/VvU0UpFzbfe2H1gp/fJ/NjKmLoAjF+Tkie6tJKCsqTEQZ73nLezBdqyGn+Dqn19
 ar3Snq9CWk09K0l7OR8QGzlFqiU4t+TRzyZO3Se0wojWF0rcOwly7jwsLYPdoM8rIy
 b4SvBfZABAm+1E6o4LQ+Q4pmPjlmxqxxLQ99umjqUK5TqcJRFA8H8hF2jjYyK6uf9R
 5WjXr28PYVTxA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 43C71C4332E; Mon, 15 Jul 2024 14:40:32 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <172105443227.17443.11712744166407927088.git-patchwork-notify@kernel.org>
Date: Mon, 15 Jul 2024 14:40:32 +0000
References: <20240625031604.3587691-1-chao@kernel.org>
In-Reply-To: <20240625031604.3587691-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Tue, 25 Jun 2024 11:16:02 +0800 you
 wrote: > Use temporary variable instead of F2FS_I() for cleanup. > >
 Signed-off-by:
 Chao Yu <chao@kernel.org> > --- > fs/f2fs/f2fs.h | 32 ++++++++++ [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sTMsa-0003Dp-Gs
Subject: Re: [f2fs-dev] [PATCH 1/3] f2fs: clean up F2FS_I()
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Tue, 25 Jun 2024 11:16:02 +0800 you wrote:
> Use temporary variable instead of F2FS_I() for cleanup.
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/f2fs.h     | 32 ++++++++++-------------
>  fs/f2fs/file.c     | 64 ++++++++++++++++++++++++----------------------
>  fs/f2fs/inode.c    | 54 +++++++++++++++++---------------------
>  fs/f2fs/namei.c    | 20 ++++++++-------
>  fs/f2fs/recovery.c | 11 ++++----
>  5 files changed, 88 insertions(+), 93 deletions(-)

Here is the summary with links:
  - [f2fs-dev,1/3] f2fs: clean up F2FS_I()
    https://git.kernel.org/jaegeuk/f2fs/c/7309871c03be
  - [f2fs-dev,2/3] f2fs: clean up addrs_per_{inode,block}()
    https://git.kernel.org/jaegeuk/f2fs/c/bed6b0317441
  - [f2fs-dev,3/3] f2fs: clean up data_blkaddr() and get_dnode_addr()
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
