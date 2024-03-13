Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 900CA87A0C2
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 Mar 2024 02:30:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rkDSE-0006eh-76;
	Wed, 13 Mar 2024 01:30:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1rkDSA-0006eD-Ss
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 Mar 2024 01:30:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WbPXZgGXTHSb47y1qbGm5bUE6CQzO3Veg5wmd+l7UwM=; b=m9S+6hAYRuH2qxT2iifL5hvK2t
 75LPBc+MVk3/jI2Iakxv+nCZbghsVhAjtC3oJDhEwHDG14dAOV4gSrrQYQvvCJ8qge68yT7hCWNfS
 aD4MmDEOJb69Pb2d4tBG88t/pihW+b8Y3MNaIPPV7cnOtVspRgpLepJmAPqFq4SAESb8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WbPXZgGXTHSb47y1qbGm5bUE6CQzO3Veg5wmd+l7UwM=; b=UUjsorwVJ7Ski1X2mdSI3X76zP
 TB379uTcHXRkhF1fQ8xE6scM/qRYdlQt8i+ImWVl+IXbe79tAT/CYHoNGXb2Pdu3+gHbGIm7y6XpD
 +nk/0Jtj3wlzjhnTxCypWTCKjEA69jHqptLbhbq4c0xAmWt4XWIX8Ndw/AmYsGHEH3K0=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rkDS0-00023w-SW for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 Mar 2024 01:30:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 32EC3CE19FD;
 Wed, 13 Mar 2024 01:30:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 181E1C43399;
 Wed, 13 Mar 2024 01:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710293430;
 bh=OQb9DEIyewBv8qB6meNGfkMEIZr3SBbCQwUHZtkIEF8=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=ajGNHnJ6J3T7uBEQayjD+YFUqTfrBNs6ZBpiYtKbHykLDcRAfc6Bjs+eG5QPux4ov
 kxJUE795cSh2H8u+jGpcaHDmOtfln+brgUgZHLxlhyYN1BkAGPLh+PWTagyEozQ9Yh
 YOLvz8erKyVKQDJIbmJQV1u2mbOdezWJUJora0He4SJ+eW1H8yqMRdTnpixp/zYHW7
 nIqUZ64FbfE3rBGMkEHO+oV4ZP79GjXnJd76gGJBXpo+M1auuk3ktMPBpJKZyH+xr4
 B6RFsucug9CzKLgVSmL9BWXLm1stCkTSON0R8xd0ICL5GqXNVbYbe6pD4gCbqnYLn/
 NaEZ2abPLStvg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 EB71AD84BAD; Wed, 13 Mar 2024 01:30:29 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <171029342995.17296.13814508095953932881.git-patchwork-notify@kernel.org>
Date: Wed, 13 Mar 2024 01:30:29 +0000
References: <20240306034746.3722986-1-xiuhong.wang@unisoc.com>
In-Reply-To: <20240306034746.3722986-1-xiuhong.wang@unisoc.com>
To: Xiuhong Wang <xiuhong.wang@unisoc.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Wed, 6 Mar 2024 11:47:45 +0800 you wrote:
 > The following f2fs_io test will get a "0" result instead of -EINVAL, >
 unisoc # ./f2fs_io compress file > unisoc # ./f2fs_io reserve_cblocks file
 > 0 > i [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rkDS0-00023w-SW
Subject: Re: [f2fs-dev] [PATCH V2 1/2] f2fs: compress: relocate some
 judgments in f2fs_reserve_compress_blocks
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
Cc: hongyu.jin.cn@gmail.com, ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, xiuhong.wang.cn@gmail.com,
 jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Wed, 6 Mar 2024 11:47:45 +0800 you wrote:
> The following f2fs_io test will get a "0" result instead of -EINVAL,
> unisoc # ./f2fs_io compress file
> unisoc # ./f2fs_io reserve_cblocks file
>  0
> it's not reasonable, so the judgement of
> atomic_read(&F2FS_I(inode)->i_compr_blocks) should be placed after
> the judgement of is_inode_flag_set(inode, FI_COMPRESS_RELEASED).
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,V2,1/2] f2fs: compress: relocate some judgments in f2fs_reserve_compress_blocks
    https://git.kernel.org/jaegeuk/f2fs/c/b7d797d241c1
  - [f2fs-dev,V2,2/2] f2fs: compress: fix reserve_cblocks counting error when out of space
    https://git.kernel.org/jaegeuk/f2fs/c/2f6d721e14b6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
