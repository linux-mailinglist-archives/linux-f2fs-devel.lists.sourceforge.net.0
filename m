Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AA9A837AF
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Apr 2025 06:10:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u2jFJ-0006rX-9Z;
	Thu, 10 Apr 2025 04:10:32 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1u2jFG-0006rM-Hr
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Apr 2025 04:10:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SZMjIV0v4x323x3ukJjA4yjgjk2GSxJJ37idtIfp7L0=; b=ZPR97cZrPeiKZHvT+2Qgwpfyrf
 HuDPnRExyN8IqpMI/MxnQJ+Re8bI2ndcy/cSy2x6gGSFR90naduiHotO5+EVLuL7otNUXjWInkcaR
 JAR4kZ22x/Qd1qhGLujsvLbOWZSwBgBCLjsemG/2u49e0TZwT086fM7FW0SSqta09MH8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SZMjIV0v4x323x3ukJjA4yjgjk2GSxJJ37idtIfp7L0=; b=lW5oNC7tyyOrB7moMCt1UKbNl6
 yrUCXBXTCM/niFKtvuPUs753+GBCLv+p+mndHqVjmV7UVLyIpdOfGQTVsrEnhtMdtfC7AMRLewglp
 SWkcpp7Y9nFENPgvm1zsrz74fDclUgVFqrCbb9aHE4KGj1WQlhIOvmMJ+yRFgDu3duRc=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u2jEz-0001B1-Td for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Apr 2025 04:10:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 63DAB61360;
 Thu, 10 Apr 2025 04:09:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 008D6C4CEEA;
 Thu, 10 Apr 2025 04:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744258203;
 bh=e1aWT6dh170s8MiHDD2MzGXXLQwqhDLj44qxoDSx4Fo=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=hjw7MoTVyA7r1w4TsNKxC6C+aXtOHzDgW67u9EiEgLBSVw8FzMxTFW6geMl3Iu7tm
 fRKysTN1Sr7kpppAh38vyiMwR7GmCJ4OoaclguMYfOw5q9NvYzeVZEPYgPVWob4PiI
 WA1wud6X2ttjZVCWNqe8DstxYfDgW7+uOglyM1ZIsHIgJlJhcA4++AURQca7cddPiZ
 e1kLKdS82xOttnZgVPKFot9ueRcZmGCyX+Kaon+WG634+gZ7Bzs0c5qwWgMCKjda8o
 iIHpMGL6DNg8twbeSy87aXBjlnD+4ygGlF1Jrzthnd2qgBqSg9o1dpofZRCuThjR0c
 +11eDW0o8J0UQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 AF333380CEF9; Thu, 10 Apr 2025 04:10:41 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <174425824024.3146257.6460285688268624018.git-patchwork-notify@kernel.org>
Date: Thu, 10 Apr 2025 04:10:40 +0000
References: <20250324053339.2994251-1-chao@kernel.org>
In-Reply-To: <20250324053339.2994251-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 24 Mar 2025 13:33:39 +0800 you
 wrote: > syzbot reported a f2fs bug as below: > > INFO: task
 syz-executor140:5308
 blocked for more than 143 seconds. > Not tainted
 6.14.0-rc7-syzkaller-00069-g81 [...] 
 Content analysis details:   (-0.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u2jEz-0001B1-Td
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to do sanity check on ino and xnid
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
Cc: jaegeuk@kernel.org, syzbot+cc448dcdc7ae0b4e4ffa@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon, 24 Mar 2025 13:33:39 +0800 you wrote:
> syzbot reported a f2fs bug as below:
> 
> INFO: task syz-executor140:5308 blocked for more than 143 seconds.
>       Not tainted 6.14.0-rc7-syzkaller-00069-g81e4f8d68c66 #0
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> task:syz-executor140 state:D stack:24016 pid:5308  tgid:5308  ppid:5306   task_flags:0x400140 flags:0x00000006
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5378 [inline]
>  __schedule+0x190e/0x4c90 kernel/sched/core.c:6765
>  __schedule_loop kernel/sched/core.c:6842 [inline]
>  schedule+0x14b/0x320 kernel/sched/core.c:6857
>  io_schedule+0x8d/0x110 kernel/sched/core.c:7690
>  folio_wait_bit_common+0x839/0xee0 mm/filemap.c:1317
>  __folio_lock mm/filemap.c:1664 [inline]
>  folio_lock include/linux/pagemap.h:1163 [inline]
>  __filemap_get_folio+0x147/0xb40 mm/filemap.c:1917
>  pagecache_get_page+0x2c/0x130 mm/folio-compat.c:87
>  find_get_page_flags include/linux/pagemap.h:842 [inline]
>  f2fs_grab_cache_page+0x2b/0x320 fs/f2fs/f2fs.h:2776
>  __get_node_page+0x131/0x11b0 fs/f2fs/node.c:1463
>  read_xattr_block+0xfb/0x190 fs/f2fs/xattr.c:306
>  lookup_all_xattrs fs/f2fs/xattr.c:355 [inline]
>  f2fs_getxattr+0x676/0xf70 fs/f2fs/xattr.c:533
>  __f2fs_get_acl+0x52/0x870 fs/f2fs/acl.c:179
>  f2fs_acl_create fs/f2fs/acl.c:375 [inline]
>  f2fs_init_acl+0xd7/0x9b0 fs/f2fs/acl.c:418
>  f2fs_init_inode_metadata+0xa0f/0x1050 fs/f2fs/dir.c:539
>  f2fs_add_inline_entry+0x448/0x860 fs/f2fs/inline.c:666
>  f2fs_add_dentry+0xba/0x1e0 fs/f2fs/dir.c:765
>  f2fs_do_add_link+0x28c/0x3a0 fs/f2fs/dir.c:808
>  f2fs_add_link fs/f2fs/f2fs.h:3616 [inline]
>  f2fs_mknod+0x2e8/0x5b0 fs/f2fs/namei.c:766
>  vfs_mknod+0x36d/0x3b0 fs/namei.c:4191
>  unix_bind_bsd net/unix/af_unix.c:1286 [inline]
>  unix_bind+0x563/0xe30 net/unix/af_unix.c:1379
>  __sys_bind_socket net/socket.c:1817 [inline]
>  __sys_bind+0x1e4/0x290 net/socket.c:1848
>  __do_sys_bind net/socket.c:1853 [inline]
>  __se_sys_bind net/socket.c:1851 [inline]
>  __x64_sys_bind+0x7a/0x90 net/socket.c:1851
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: fix to do sanity check on ino and xnid
    https://git.kernel.org/jaegeuk/f2fs/c/061cf3a84bde

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
