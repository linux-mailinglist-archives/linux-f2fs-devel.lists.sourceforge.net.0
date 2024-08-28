Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A833962CA0
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 28 Aug 2024 17:42:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sjKoq-0006NQ-Lb;
	Wed, 28 Aug 2024 15:42:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1sjKom-0006NG-1N
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Aug 2024 15:42:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=X4ItMOEGKSWGZYRnga6f3XHhmVIN/u24hLwcyEHww14=; b=PbA4qrTPqyH9Xj7Fq++/g9Ed1c
 OqddBobPzaYJk9sbbGc0Xhl00Dw/Qv4oV7hcfKy69xNqhpTTrIRExRd88r4toV4jb45y5XyJJgfPZ
 K1pjLut3tCRc15ITWeI63ZuOXMASRqZ90LOXtp0YbXsX5LV2ONnBA5DoGOuQi9AweI8s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=X4ItMOEGKSWGZYRnga6f3XHhmVIN/u24hLwcyEHww14=; b=AdZY6oRifgkDFE/cFcv8l6LI+0
 ZVtkRMZNPTKEZtymoIQR5V6o9pNr217cLij7WKB6wzFmut8uT6uV/U/ERjDDFtggCo55VMNi6LJ6g
 9QrWtT6vhevxzX433yOrxZz493xwdMFAqnkZgjQ3xpR7PxAMNQWUDmYa+XTrNWokaFh0=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sjKok-0001aW-Hn for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Aug 2024 15:42:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 27350A41AB2;
 Wed, 28 Aug 2024 15:42:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7912DC51587;
 Wed, 28 Aug 2024 15:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724858802;
 bh=k/WDgLr9ilvDDJLyAzEJMBsgISgafN8ICne+o59PpEk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lUqNmsuZvbVGjv7neQUwIXMLnFoL6zT9+9mJzsNv7nwZ9dwAlbNVa9DE6lHwFG3gG
 I9Vf25s1nzhN06UW+1DtsfvSFa4N3YoOqPw1bHcRAHXFPUU5IvWElsm+Xw35LNLOLS
 xGxXA0JraHYPCJSR5531sYWo1xcyyN8y32pT5CkhbavciuwPMAtNB78JkvGcEWMSnh
 sCVfGAqx/cvoa09sqMVtVxs2ZtlW0CaGNUN7/mS8xzZAdvEp0RLSAiK/tFdAJzoPOe
 /cXKbwnPCOHwFyZKAQg7eoOF0f7Y/YDB5/W56E1Aqdbed/AutgR5Yt66H5dgnp+zOf
 cNZrvfYaRvFHA==
Date: Wed, 28 Aug 2024 15:26:40 +0000
To: Julian Sun <sunjunchao2870@gmail.com>
Message-ID: <Zs9BsP1UdFn4FoK5@google.com>
References: <000000000000b0231406204772a1@google.com>
 <20240827034324.339129-1-sunjunchao2870@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240827034324.339129-1-sunjunchao2870@gmail.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 08/27, Julian Sun wrote: > Hi, all. > > Recently syzbot
 reported a bug as following: > > kernel BUG at fs/f2fs/inode.c:896! > CPU:
 1 UID: 0 PID: 5217 Comm: syz-executor605 Not tainted 6.11.0-rc4-sy [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: syzkaller.appspot.com]
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
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [147.75.193.91 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sjKok-0001aW-Hn
Subject: Re: [f2fs-dev] [PATCH] f2fs: Do not check the FI_DIRTY_INODE flag
 when umounting a ro fs.
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: syzbot+ebea2790904673d7c618@syzkaller.appspotmail.com,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 08/27, Julian Sun wrote:
> Hi, all.
> 
> Recently syzbot reported a bug as following:
> 
> kernel BUG at fs/f2fs/inode.c:896!
> CPU: 1 UID: 0 PID: 5217 Comm: syz-executor605 Not tainted 6.11.0-rc4-syzkaller-00033-g872cf28b8df9 #0
> RIP: 0010:f2fs_evict_inode+0x1598/0x15c0 fs/f2fs/inode.c:896
> Call Trace:
>  <TASK>
>  evict+0x532/0x950 fs/inode.c:704
>  dispose_list fs/inode.c:747 [inline]
>  evict_inodes+0x5f9/0x690 fs/inode.c:797
>  generic_shutdown_super+0x9d/0x2d0 fs/super.c:627
>  kill_block_super+0x44/0x90 fs/super.c:1696
>  kill_f2fs_super+0x344/0x690 fs/f2fs/super.c:4898
>  deactivate_locked_super+0xc4/0x130 fs/super.c:473
>  cleanup_mnt+0x41f/0x4b0 fs/namespace.c:1373
>  task_work_run+0x24f/0x310 kernel/task_work.c:228
>  ptrace_notify+0x2d2/0x380 kernel/signal.c:2402
>  ptrace_report_syscall include/linux/ptrace.h:415 [inline]
>  ptrace_report_syscall_exit include/linux/ptrace.h:477 [inline]
>  syscall_exit_work+0xc6/0x190 kernel/entry/common.c:173
>  syscall_exit_to_user_mode_prepare kernel/entry/common.c:200 [inline]
>  __syscall_exit_to_user_mode_work kernel/entry/common.c:205 [inline]
>  syscall_exit_to_user_mode+0x279/0x370 kernel/entry/common.c:218
>  do_syscall_64+0x100/0x230 arch/x86/entry/common.c:89
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
> The syzbot constructed the following scenario: concurrently
> creating directories and setting the file system to read-only.
> In this case, while f2fs was making dir, the filesystem switched to
> readonly, and when it tried to clear the dirty flag, it triggered this
> code path: f2fs_mkdir()-> f2fs_sync_fs()->f2fs_write_checkpoint()
> ->f2fs_readonly(). This resulted FI_DIRTY_INODE flag not being cleared,
> which eventually led to a bug being triggered during the FI_DIRTY_INODE
> check in f2fs_evict_inode().
> 
> In this case, we cannot do anything further, so if filesystem is readonly,
> do not trigger the BUG. Instead, clean up resources to the best of our
> ability to prevent triggering subsequent resource leak checks.
> 
> If there is anything important I'm missing, please let me know, thanks.
> 
> Reported-by: syzbot+ebea2790904673d7c618@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=ebea2790904673d7c618
> Fixes: ca7d802a7d8e ("f2fs: detect dirty inode in evict_inode")
> CC: stable@vger.kernel.org
> Signed-off-by: Julian Sun <sunjunchao2870@gmail.com>
> ---
>  fs/f2fs/inode.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> index aef57172014f..52d273383ec2 100644
> --- a/fs/f2fs/inode.c
> +++ b/fs/f2fs/inode.c
> @@ -892,8 +892,12 @@ void f2fs_evict_inode(struct inode *inode)
>  			atomic_read(&fi->i_compr_blocks));
>  
>  	if (likely(!f2fs_cp_error(sbi) &&
> -				!is_sbi_flag_set(sbi, SBI_CP_DISABLED)))
> -		f2fs_bug_on(sbi, is_inode_flag_set(inode, FI_DIRTY_INODE));
> +				!is_sbi_flag_set(sbi, SBI_CP_DISABLED))) {
> +		if (!f2fs_readonly(sbi->sb))
> +			f2fs_bug_on(sbi, is_inode_flag_set(inode, FI_DIRTY_INODE));
> +		else
> +			f2fs_inode_synced(inode);
> +	}
>  	else
>  		f2fs_inode_synced(inode);

What about:

  	if (likely(!f2fs_cp_error(sbi) &&
		   !is_sbi_flag_set(sbi, SBI_CP_DISABLED)) &&
		   !f2fs_readonly(sbi->sb)))
		f2fs_bug_on(sbi, is_inode_flag_set(inode, FI_DIRTY_INODE));
	else
		f2fs_inode_synced(inode);

>

>  
> -- 
> 2.39.2


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
