Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7FA972C9A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Sep 2024 10:55:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1snweG-0008Fm-MD;
	Tue, 10 Sep 2024 08:54:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1snweF-0008FP-Qx
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Sep 2024 08:54:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FuUOv+wBdrX2Ax7UIM4Fn3VqcK7LH189kxpK/uCnPwQ=; b=VEirQTHArppFTKf0PqmVaH60UC
 KqtYqD3dwQMZAdldGNu2TvW9AL9Cch1rxEBxgHmGDfkzFYYcBEp7LW6TmkS6wcQeCzDrVYXwGfyVo
 KFFQmlg/2kE6cLJKAPeFbi9v0Jb7rk2XGI1XyxGQr5yOnlbsj2EGEFZHVZu+Kt3FV4RM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FuUOv+wBdrX2Ax7UIM4Fn3VqcK7LH189kxpK/uCnPwQ=; b=EGvc6KRgi+lh18MNHyU+dq94k6
 gIZyDBdS7GSdaBRXp/HQwRP3TqG0s8wF+khLU8xnjKClM9ylHiiLREsK39HRC5cRJrFPthMmTTCTc
 wNhG38mvsQ2+QNGLqlDY9rhMVQbKiP5BG6lYrHSZPbb2JUEz9esfb/Zrk0QaFgSzb2gU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1snweF-0007SJ-RF for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Sep 2024 08:54:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E29F15C061A;
 Tue, 10 Sep 2024 08:54:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08A11C4CEC3;
 Tue, 10 Sep 2024 08:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725958485;
 bh=6Y1ViSleBUCDmdGKI23JhY0or54xyLwoDFqx1mz5S+4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qPE/xcd52nZflCF2jO4lmSx99c0hLRO9PG/dCIRa0M0hPqM4D7SAm7s/DNbef+kDZ
 p/M1r/eq1TpryWfWaqYvZ9ie5pZjOLSd5Aip5PJem/pHM7oTnd75csisAPVbGJEQ+D
 YX2bTzKtH2yb17YfXnf15O7RyJZignkGCDcRXUGooRAjt3ou2WIUlxzEDVV46awUAc
 cLIYBY5cSc00053ZYwWyqOvCywPZE6e9j/ltnVXs11O9Aty3DNTk2OrxC11TlAvw5S
 e9X8XtBGKSAyLAF4/1BaYlWq0rfeeikag3kyjWtvcNh8mny4prqwRcW+vnVTSQuJb8
 PgsN+qmZCvUyw==
Date: Tue, 10 Sep 2024 10:54:40 +0200
To: Chao Yu <chao@kernel.org>
Message-ID: <20240910-lesesaal-missfallen-adb9485d67e7@brauner>
References: <20240910030713.3716318-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240910030713.3716318-1-chao@kernel.org>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Sep 10, 2024 at 11:07:13AM GMT,
 Chao Yu wrote: > syzbot
 reports a f2fs bug as below: > > [ cut here ] > WARNING: CPU: 1 PID: 58 at
 kernel/rcu/sync.c:177 rcu_sync_dtor+0 [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1snweF-0007SJ-RF
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to don't set SB_RDONLY in
 f2fs_handle_critical_error()
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
From: Christian Brauner via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Christian Brauner <brauner@kernel.org>
Cc: jaegeuk@kernel.org, syzbot+20d7e439f76bbbd863a7@syzkaller.appspotmail.com,
 Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Sep 10, 2024 at 11:07:13AM GMT, Chao Yu wrote:
> syzbot reports a f2fs bug as below:
> 
> ------------[ cut here ]------------
> WARNING: CPU: 1 PID: 58 at kernel/rcu/sync.c:177 rcu_sync_dtor+0xcd/0x180 kernel/rcu/sync.c:177
> CPU: 1 UID: 0 PID: 58 Comm: kworker/1:2 Not tainted 6.10.0-syzkaller-12562-g1722389b0d86 #0
> Workqueue: events destroy_super_work
> RIP: 0010:rcu_sync_dtor+0xcd/0x180 kernel/rcu/sync.c:177
> Call Trace:
>  percpu_free_rwsem+0x41/0x80 kernel/locking/percpu-rwsem.c:42
>  destroy_super_work+0xec/0x130 fs/super.c:282
>  process_one_work kernel/workqueue.c:3231 [inline]
>  process_scheduled_works+0xa2c/0x1830 kernel/workqueue.c:3312
>  worker_thread+0x86d/0xd40 kernel/workqueue.c:3390
>  kthread+0x2f0/0x390 kernel/kthread.c:389
>  ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:147
>  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
> 
> As Christian Brauner pointed out [1]: the root cause is f2fs sets
> SB_RDONLY flag in internal function, rather than setting the flag
> covered w/ sb->s_umount semaphore via remount procedure, then below
> race condition causes this bug:
> 
> - freeze_super()
>  - sb_wait_write(sb, SB_FREEZE_WRITE)
>  - sb_wait_write(sb, SB_FREEZE_PAGEFAULT)
>  - sb_wait_write(sb, SB_FREEZE_FS)
> 					- f2fs_handle_critical_error
> 					 - sb->s_flags |= SB_RDONLY
> - thaw_super
>  - thaw_super_locked
>   - sb_rdonly() is true, so it skips
>     sb_freeze_unlock(sb, SB_FREEZE_FS)
>   - deactivate_locked_super
> 
> Since f2fs has almost the same logic as ext4 [2] when handling critical
> error in filesystem if it mounts w/ errors=remount-ro option:
> - set CP_ERROR_FLAG flag which indicates filesystem is stopped
> - record errors to superblock
> - set SB_RDONLY falg
> Once we set CP_ERROR_FLAG flag, all writable interfaces can detect the
> flag and stop any further updates on filesystem. So, it is safe to not
> set SB_RDONLY flag, let's remove the logic and keep in line w/ ext4 [3].
> 
> [1] https://lore.kernel.org/all/20240729-himbeeren-funknetz-96e62f9c7aee@brauner
> [2] https://lore.kernel.org/all/20240729132721.hxih6ehigadqf7wx@quack3
> [3] https://lore.kernel.org/linux-ext4/20240805201241.27286-1-jack@suse.cz
> 
> Fixes: b62e71be2110 ("f2fs: support errors=remount-ro|continue|panic mountoption")
> Reported-by: syzbot+20d7e439f76bbbd863a7@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/all/000000000000b90a8e061e21d12f@google.com/
> Cc: Jan Kara <jack@suse.cz>
> Cc: Christian Brauner <brauner@kernel.org>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---

Thanks!
Reviewed-by: Christian Brauner <brauner@kernel.org>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
