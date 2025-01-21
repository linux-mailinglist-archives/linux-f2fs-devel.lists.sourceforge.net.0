Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BAFA18269
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Jan 2025 18:00:31 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1taHc0-0005kD-B7;
	Tue, 21 Jan 2025 17:00:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1taHby-0005k7-Gh
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Jan 2025 17:00:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VMFoekwmZRT+xO27gSfmH5u3dfoxWSP87744rta5Ayw=; b=QX8T+vczV4efTiqm8B+z1zYTHc
 hnOlZBsq6iba5v0TExHk9QmN8DuoHywRcJC6KNdWaJTsa0AK3U/lKvrT7X25FFmDBtGR+Y0AMGfnp
 +S80LKz8oIvECOaTKElQYdCmYWA9QmDDGdJIv+TkSkKWl8++z8QpHay6xzLYm8c4DiJU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VMFoekwmZRT+xO27gSfmH5u3dfoxWSP87744rta5Ayw=; b=N7tU2QV6MrjD3XUDOA8XoE6dfo
 E32KkRQypU+QIYkZ6WhCaQDlCS7+D/eP6IniS1E5aKscx57eKhHJmhFPKFNJHIKnhHB5PLErW/t3u
 bIoml52OyggCLPcbBdyYixriIFixk7LRYzdCg9GJzs4YtNxyQgH88k3f0skWdSNC3A/o=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1taHbx-0005jx-SI for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Jan 2025 17:00:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 9453DA41DB6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 21 Jan 2025 16:58:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA852C4CEDF;
 Tue, 21 Jan 2025 17:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737478810;
 bh=2qAEBj0gIIHttyMJJjx8WJhzhR4Vy4BIRoF4xlnlwvU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=mI6A4HgU2k+2Lpr4CA9X0b/Be2JU/ezWG95InDiPsDsPDk049BxHit4nmhXfAx0uU
 P16z9vfEWChmIVwtcxpwo0AgJ7T4aEvXhsBEs71KPOaOYOO6iy+Gr/N9p1EW1PTXKX
 opxSLS6k75R6cecY5m6EhwnQdKKDnrr+PSCNEzWXC8yQM2iT53gX/1Y/AY+Megu8Uz
 nDWHTO9Wq1ezf9hrIdWMHc75DTOpVi+aG6cFf+7CfLVf4Zj/qwsDkIn35ZDZAMqhl3
 eaymlWQJ6rV7QFJfk5xvttSOBdglr3rcHS1fjKMh67jcAtXsOoHNHTCSXbkCeJYFvO
 EH44Nd5opeZAA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 34725380AA75; Tue, 21 Jan 2025 17:00:36 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <173747883502.55169.8800766127346491409.git-patchwork-notify@kernel.org>
Date: Tue, 21 Jan 2025 17:00:35 +0000
References: <20250120-f2fs-fix-wformat-min_inline_xattr_size-v1-1-508cac1474fe@kernel.org>
In-Reply-To: <20250120-f2fs-fix-wformat-min_inline_xattr_size-v1-1-508cac1474fe@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
X-Spam-Score: -5.5 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 20 Jan 2025 05:59:44 -0700 you
 wrote: > When building for 32-bit platforms, for which 'size_t' is 'unsigned
 int',
 > there is a warning due to an incorrect format specifier: > > fs/f2fs/inode.c
 [...] Content analysis details:   (-5.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -3.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1taHbx-0005jx-SI
Subject: Re: [f2fs-dev] [PATCH] f2fs: Fix format specifier in
 sanity_check_inode()
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
Cc: jaegeuk@kernel.org, patches@lists.linux.dev,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon, 20 Jan 2025 05:59:44 -0700 you wrote:
> When building for 32-bit platforms, for which 'size_t' is 'unsigned int',
> there is a warning due to an incorrect format specifier:
> 
>   fs/f2fs/inode.c:320:6: error: format specifies type 'unsigned long' but the argument has type 'unsigned int' [-Werror,-Wformat]
>     318 |                 f2fs_warn(sbi, "%s: inode (ino=%lx) has corrupted i_inline_xattr_size: %d, min: %lu, max: %lu",
>         |                                                                                                 ~~~
>         |                                                                                                 %u
>     319 |                           __func__, inode->i_ino, fi->i_inline_xattr_size,
>     320 |                           MIN_INLINE_XATTR_SIZE, MAX_INLINE_XATTR_SIZE);
>         |                           ^~~~~~~~~~~~~~~~~~~~~
>   fs/f2fs/f2fs.h:1855:46: note: expanded from macro 'f2fs_warn'
>    1855 |         f2fs_printk(sbi, false, KERN_WARNING fmt, ##__VA_ARGS__)
>         |                                              ~~~    ^~~~~~~~~~~
>   fs/f2fs/xattr.h:86:31: note: expanded from macro 'MIN_INLINE_XATTR_SIZE'
>      86 | #define MIN_INLINE_XATTR_SIZE (sizeof(struct f2fs_xattr_header) / sizeof(__le32))
>         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: Fix format specifier in sanity_check_inode()
    https://git.kernel.org/jaegeuk/f2fs/c/18653662b1f5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
