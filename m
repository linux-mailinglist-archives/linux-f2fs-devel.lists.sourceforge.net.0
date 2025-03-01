Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CC997A4A7AF
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  1 Mar 2025 02:50:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1toBzd-0005Cq-U9;
	Sat, 01 Mar 2025 01:50:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1toBzS-0005Cc-G7
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 01 Mar 2025 01:50:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oIs/vBQLmPJMqiRcp3N2OPsW5XN6YLJgmEWhjMyqU8o=; b=ft96/P1+10mTQojhPdKuOqq9cN
 gKbRbtEQ+yLlcReycfsuguRbvPUTujg+lpfHRoZ48bQ7W4apQLIqC+S+/14v9lWuEdl4wBQ0zRput
 r2F1tb7p8S2B64E2CL/geYYOO0ztMCVGRtNjdC4LAK1cZtjLFRAWbqIgGnsWioRz9I4M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oIs/vBQLmPJMqiRcp3N2OPsW5XN6YLJgmEWhjMyqU8o=; b=hOko93UwvTqMt9Kkh8iE36lptL
 9381w73jWYrhq0M46pxIhuKp/nl+ipIZgBiVbwUkQ8it/fGDeBujjvjKFptgZLJEMI0qV4TjfKpgE
 o+irePW2D2a3BlwMByDXG0jDlDRMGYckm9WbezZw5Q/KrVSscHeSa1tf7LUZ7+8A/S9E=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1toBzR-00089p-Ro for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 01 Mar 2025 01:50:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 689E25C5843;
 Sat,  1 Mar 2025 01:47:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBB4CC4CED6;
 Sat,  1 Mar 2025 01:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740793800;
 bh=MYDE1/k5EPm0g4TLh6eFIYHvetoDAA5BI1FDuKoNU/g=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=eTWZNtFFiv3rRUt+wBxlkMsQ30kIOve/Yry4u5wCQq9htFICdDxgRfNoFAvu3MH8o
 n3QwtFijFAKgpNtpkDqBK6Ppk6a9TW5X88tm71ow+nC//3uAYOTBbAzEVWVIjRFeBq
 f9or+buqHr4uHe4QvemAg/ifF0DcW6lCgYo88cOpjA/Qcgyr+IH9WVuIZuFp8f4wbv
 doacS17Kcaw90Vx1lifzQXw0BiUErzC8Jx4mQS63qjdk5EZGyxjdgnd24g6SvOzY6J
 l+vF8JHv66l/ZKMoXlgG6AUWtrNbh2L29BjnGshvbVG7IfMQEr8QJaKL4dI3eCTNyS
 XFmhOSbEGCUSg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 70F85380CFF1; Sat,  1 Mar 2025 01:50:33 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <174079383202.2336000.16821475492671345149.git-patchwork-notify@kernel.org>
Date: Sat, 01 Mar 2025 01:50:32 +0000
References: <20250227155420.48885-1-chao@kernel.org>
In-Reply-To: <20250227155420.48885-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -5.6 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Thu, 27 Feb 2025 23:54:20 +0800 you
 wrote: > From: Leo Stone <leocstone@gmail.com> > > The syzbot reproducer
 mounts
 a f2fs image, then tries to unlink an > existing file. However, the unlinked
 file [...] 
 Content analysis details:   (-5.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1toBzR-00089p-Ro
Subject: Re: [f2fs-dev] [PATCH v5] f2fs: add check for deleted inode
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
 linux-kernel@vger.kernel.org, leocstone@gmail.com,
 syzbot+b01a36acd7007e273a83@syzkaller.appspotmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Thu, 27 Feb 2025 23:54:20 +0800 you wrote:
> From: Leo Stone <leocstone@gmail.com>
> 
> The syzbot reproducer mounts a f2fs image, then tries to unlink an
> existing file. However, the unlinked file already has a link count of 0
> when it is read for the first time in do_read_inode().
> 
> Add a check to sanity_check_inode() for i_nlink == 0.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v5] f2fs: add check for deleted inode
    https://git.kernel.org/jaegeuk/f2fs/c/81edb983b3f5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
