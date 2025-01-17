Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 300D4A158D9
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 17 Jan 2025 22:10:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tYtbh-0005NN-38;
	Fri, 17 Jan 2025 21:10:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1tYtbf-0005N9-MM
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 17 Jan 2025 21:10:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=J9fvPNHn6A7u76wZg9aTQQFuRWgz6twWKegBGfFlyyw=; b=f5YttuXdJJkF9goBSFjja0zDNv
 dnWGc3L13we0RcV/bYT6TvXBlo1NoHb8HoKSfFfiBUjIZCYXw16wfVbAxvtwgbts0j3vfxABvCsWS
 99TgSBhX0CVuAY5dFZGiGf0nP6ZXkXYrBvm58SHs32F+9U1dHVbCpNbOzuYip2uczXkA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=J9fvPNHn6A7u76wZg9aTQQFuRWgz6twWKegBGfFlyyw=; b=areTOyG+xfVlsn1wLky1Ly+V9V
 rjCNxUxzNeoFTnryvj4odU7hmooscBF5CNXMBDjyUoqpFIkicwSoFcW4uF2zZZZRzBRcGZF+wl+J+
 hpWeNWc8rutHdSz60aFicXYG/tVilppmzulvZODCEr5Qb8AlfA9jv754Y/LJq8arD+zY=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tYtbf-0006mc-0b for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 17 Jan 2025 21:10:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 623AAA4342D;
 Fri, 17 Jan 2025 21:08:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 165ABC4CEDF;
 Fri, 17 Jan 2025 21:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737148213;
 bh=qRolW1YoS3b7VeN7NKBaLu/+Fiy8aLWYOxeDEibNaWA=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Z19l+IBMPBWZ3WQ6uOkoIDzMKHEzeWNblXUnLH7BGaCoStv1ndS7+1raY8T10Aw/R
 Xntuc1Nt8oI7JbHTssdWkwtNfhqloD8dHq/OfitwrrVGyamMV+3HANFfa0YV4zRbRR
 lHSPF/c3BJ5RUJrcm+C4jTbBYwiL9Uimm5Lv0KIE76ctKbtURb1rsi4xjiudCwg1Fo
 QbHBAs+MciXd5poDKlAZ+8eJnN44lxSNziiNr2xy6Xk1K7J9wFR769M2HqI5mSWd7I
 fd2Q2PQmJENG7Xm1cqSUfv3I0Q39P3PREf5Xqq20vRs3xfMpmNIXDJfQvLlKNldzDN
 m69DtaIys8yRg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 ADD94380AA62; Fri, 17 Jan 2025 21:10:37 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <173714823625.2259050.15101235212593164792.git-patchwork-notify@kernel.org>
Date: Fri, 17 Jan 2025 21:10:36 +0000
References: <20250114123410.29123-1-chao@kernel.org>
In-Reply-To: <20250114123410.29123-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Tue, 14 Jan 2025 20:34:10 +0800 you
 wrote: > syzbot reported an out-of-range access issue as below: > > UBSAN:
 array-index-out-of-bounds in fs/f2fs/f2fs.h:3292:19 > index
 18446744073709550491 is ou [...] 
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
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
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tYtbf-0006mc-0b
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix to do sanity check correctly on
 i_inline_xattr_size
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
Cc: qasdev00@gmail.com, linux-kernel@vger.kernel.org,
 syzbot+69f5379a1717a0b982a1@syzkaller.appspotmail.com,
 linux-f2fs-devel@lists.sourceforge.net,
 syzbot+f5e74075e096e757bdbf@syzkaller.appspotmail.com, jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Tue, 14 Jan 2025 20:34:10 +0800 you wrote:
> syzbot reported an out-of-range access issue as below:
> 
> UBSAN: array-index-out-of-bounds in fs/f2fs/f2fs.h:3292:19
> index 18446744073709550491 is out of range for type '__le32[923]' (aka 'unsigned int[923]')
> CPU: 0 UID: 0 PID: 5338 Comm: syz.0.0 Not tainted 6.12.0-syzkaller-10689-g7af08b57bcb9 #0
> Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
> Call Trace:
>  <TASK>
>  __dump_stack lib/dump_stack.c:94 [inline]
>  dump_stack_lvl+0x241/0x360 lib/dump_stack.c:120
>  ubsan_epilogue lib/ubsan.c:231 [inline]
>  __ubsan_handle_out_of_bounds+0x121/0x150 lib/ubsan.c:429
>  read_inline_xattr+0x273/0x280
>  lookup_all_xattrs fs/f2fs/xattr.c:341 [inline]
>  f2fs_getxattr+0x57b/0x13b0 fs/f2fs/xattr.c:533
>  vfs_getxattr_alloc+0x472/0x5c0 fs/xattr.c:393
>  ima_read_xattr+0x38/0x60 security/integrity/ima/ima_appraise.c:229
>  process_measurement+0x117a/0x1fb0 security/integrity/ima/ima_main.c:353
>  ima_file_check+0xd9/0x120 security/integrity/ima/ima_main.c:572
>  security_file_post_open+0xb9/0x280 security/security.c:3121
>  do_open fs/namei.c:3830 [inline]
>  path_openat+0x2ccd/0x3590 fs/namei.c:3987
>  do_file_open_root+0x3a7/0x720 fs/namei.c:4039
>  file_open_root+0x247/0x2a0 fs/open.c:1382
>  do_handle_open+0x85b/0x9d0 fs/fhandle.c:414
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v2] f2fs: fix to do sanity check correctly on i_inline_xattr_size
    https://git.kernel.org/jaegeuk/f2fs/c/5c1768b67250

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
