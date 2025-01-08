Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED97A064C6
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  8 Jan 2025 19:40:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tVayq-00061W-Vo;
	Wed, 08 Jan 2025 18:40:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1tVayo-000617-Ti
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 08 Jan 2025 18:40:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uDMSZD+BYr2fEEokhmfiC5ijawtEXwRT9QYUUgmbgoQ=; b=Wk6Ry9XuY99KenOWKuCv3SMOQJ
 b9YNv4jpfkmPTMGLbp3Vf0WDkVai1zdNjVQh0vtVF7cXwRicCLFkbgMg9SW80/XTpn6bU/hXCBn3T
 B3sQPKblFzMZviF/ILFoFPwqN+kZ4cXLWatWOmjSV/taWDWB6JbIR6rnbKj2+vuinQcs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uDMSZD+BYr2fEEokhmfiC5ijawtEXwRT9QYUUgmbgoQ=; b=be9uhn37jLkELwFPVxuYcNN6uT
 Au+CXSmlA8F9ZPJdsi1Up9BnaB5fThvhPSuF0MNQT+3UV8xkurZDxRNz+sa0udVwnBgGl1GFTqIfl
 I89PAVoGNO7WU+ZBiQc/+JZGqHJuDW0IPca67kmtpFxPhrPjvyLf5gBGumMnvbdzJqto=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tVayf-0007j2-EC for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 08 Jan 2025 18:40:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 17EEEA4171B;
 Wed,  8 Jan 2025 18:38:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3423EC4CEDF;
 Wed,  8 Jan 2025 18:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736361614;
 bh=2ust+GhG/kq/LZeeW7Ddk9HcDmvwms+Y6Kun2DabBPg=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=nHbsmMP/f+EGT/1jbXmIEqRV4ERAmRRC/b0drxeEtlCMjRQieieZBqXcsv0JBnosT
 X+sII3wBlOKVgiu7yCNkWKS33Bn9Bh9hV/oGBe6gIQU35w2jtMgEHold02DS7c5xCH
 aBrSkvkjmUuJootajc3mXMZHhZ6GGyGC9oY71ZDIVCC99WjxA2MJt22oAToPdPmdPp
 yakeMqPGbvr4CpMbLoEEN6ZUVkAlGqZm5Erz3mTQKjfTOAXUEDFXWGsM/7lwbrHWGC
 SThqDAL2dcqLuk/0U/gAWZFdm+Pd2UCLB5UXpHfwe/PpLWEmi7FkTrHvgegPv9Ax4S
 VsL1E0UzYZiBw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EAFD1380A965; Wed,  8 Jan 2025 18:40:36 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <173636163577.743062.15546397784828809130.git-patchwork-notify@kernel.org>
Date: Wed, 08 Jan 2025 18:40:35 +0000
References: <20241223081044.1126291-1-yi.sun@unisoc.com>
In-Reply-To: <20241223081044.1126291-1-yi.sun@unisoc.com>
To: Yi Sun <yi.sun@unisoc.com>
X-Spam-Score: -2.9 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 23 Dec 2024 16:10:40 +0800 you
 wrote: > Deleting large files is time-consuming, and a large part > of the
 time is spent in f2fs_invalidate_blocks() >
 ->down_write(sit_info->sentry_lock) and up [...] 
 Content analysis details:   (-2.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tVayf-0007j2-EC
Subject: Re: [f2fs-dev] [PATCH v4 0/4] Speed up f2fs truncate
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
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, sunyibuaa@gmail.com,
 jaegeuk@kernel.org, Hao_hao.Wang@unisoc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon, 23 Dec 2024 16:10:40 +0800 you wrote:
> Deleting large files is time-consuming, and a large part
> of the time is spent in f2fs_invalidate_blocks()
> ->down_write(sit_info->sentry_lock) and up_write().
> 
> If some blocks are continuous, we can process these blocks
> at the same time. This can reduce the number of calls to
> the down_write() and the up_write(), thereby improving the
> overall speed of doing truncate.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v4,1/4] f2fs: introduce update_sit_entry_for_release/alloc()
    https://git.kernel.org/jaegeuk/f2fs/c/66baee2b886d
  - [f2fs-dev,v4,2/4] f2fs: update_sit_entry_for_release() supports consecutive blocks.
    https://git.kernel.org/jaegeuk/f2fs/c/81ffbd224e5f
  - [f2fs-dev,v4,3/4] f2fs: add parameter @len to f2fs_invalidate_blocks()
    (no matching commit)
  - [f2fs-dev,v4,4/4] f2fs: Optimize f2fs_truncate_data_blocks_range()
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
