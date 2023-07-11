Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0332F74E980
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Jul 2023 10:54:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qJ98M-0000aC-2G;
	Tue, 11 Jul 2023 08:54:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qJ98H-0000a5-De
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Jul 2023 08:54:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QHUH5zlBexMguKvfGwjEhTF/jrAfxswmUTJyPpjZ5IU=; b=HF+mZjWEqsn1CWQCTEVrI+q7GN
 uoJLFfG+it6Bdc7ldAtdy86G+nyD3FDlY/EnvCIfZ8+BPe+gyQ3jGwxeFeDls6ylQxVAxxvvpGbk2
 yvNNEcqYRo4GYTvZEcPP7Jw9tC6cvAd5FFQ6Dkf+bFAF//WMRa1190263z9Iy2s/aiV4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QHUH5zlBexMguKvfGwjEhTF/jrAfxswmUTJyPpjZ5IU=; b=jie6YlMaaIfWjMGh75Z2s6uqmT
 10O+G19cu29NKYbhW/BKpZNRDm6Ldj1JLxhDfj/hDjZkmRZZYzlEl+gP4zTrRNF8UBQMKNWifSYgi
 fffR+s03+XDid3fYX7gwa3uv7Y79q0QecFCgqjEYDTFiI+gz1CTuSFwuarOEySL4rDLk=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qJ98G-004AS6-TE for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Jul 2023 08:54:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6C41061384;
 Tue, 11 Jul 2023 08:53:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D952C433C7;
 Tue, 11 Jul 2023 08:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689065638;
 bh=s0Ui7MxnciCydraCEjHzngOSBAQ9dkb9Vl5INw0OUpA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=WZe4hcpj2wPeN9hguHAqfalg0lwP8SsH16jAuxyGZHFfWqzstiIgwTHELh6fQVDd0
 tdtKTq1yADGinAIgw+bxiJMQuv5Y/GP3Ut1SOJ8w+SgoDfI8z8Yu3fxXueWJXhs+F7
 1uG+ZpOusE4vempJ1FQ8SiwRWrNdBB+a8enovR506Ur3kcKXySL/jNah8ABorSVF0P
 sC4jmlSTzP1Ck1XVAfEjoUZw9EoQsHqc8pIOiFNoU8qb4YTibWK8WEI1ki7i7eVvTy
 d2hxfyBKq+vjkU+ZIDdrrnWZIhecOMrQEI2MlUU1gH7Q5iyq8sZeKjww4iyaYrJBMz
 uh8vBrjOcwEqA==
Message-ID: <55418c89-b1b2-5aec-34d3-0dbf9510c551@kernel.org>
Date: Tue, 11 Jul 2023 16:53:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20230707141142.2276510-1-jaegeuk@kernel.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230707141142.2276510-1-jaegeuk@kernel.org>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/7/7 22:11, Jaegeuk Kim wrote: > Let's flush the inode
 being aborted atomic operation to avoid stale dirty > inode during eviction
 in this call stack: > > f2fs_mark_inode_dirty_sync+0x22/0x40 [ [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qJ98G-004AS6-TE
Subject: Re: [f2fs-dev] [PATCH] f2fs: flush inode if atomic file is aborted
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
Cc: stable@vger.kernel.org,
 syzbot+e1246909d526a9d470fa@syzkaller.appspotmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/7/7 22:11, Jaegeuk Kim wrote:
> Let's flush the inode being aborted atomic operation to avoid stale dirty
> inode during eviction in this call stack:
> 
>    f2fs_mark_inode_dirty_sync+0x22/0x40 [f2fs]
>    f2fs_abort_atomic_write+0xc4/0xf0 [f2fs]
>    f2fs_evict_inode+0x3f/0x690 [f2fs]
>    ? sugov_start+0x140/0x140
>    evict+0xc3/0x1c0
>    evict_inodes+0x17b/0x210
>    generic_shutdown_super+0x32/0x120
>    kill_block_super+0x21/0x50
>    deactivate_locked_super+0x31/0x90
>    cleanup_mnt+0x100/0x160
>    task_work_run+0x59/0x90
>    do_exit+0x33b/0xa50
>    do_group_exit+0x2d/0x80
>    __x64_sys_exit_group+0x14/0x20
>    do_syscall_64+0x3b/0x90
>    entry_SYSCALL_64_after_hwframe+0x63/0xcd
> 
> This triggers f2fs_bug_on() in f2fs_evict_inode:
>   f2fs_bug_on(sbi, is_inode_flag_set(inode, FI_DIRTY_INODE));
> 
> This fixes the syzbot report:
> 
> loop0: detected capacity change from 0 to 131072
> F2FS-fs (loop0): invalid crc value
> F2FS-fs (loop0): Found nat_bits in checkpoint
> F2FS-fs (loop0): Mounted with checkpoint version = 48b305e4
> ------------[ cut here ]------------
> kernel BUG at fs/f2fs/inode.c:869!
> invalid opcode: 0000 [#1] PREEMPT SMP KASAN
> CPU: 0 PID: 5014 Comm: syz-executor220 Not tainted 6.4.0-syzkaller-11479-g6cd06ab12d1a #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/27/2023
> RIP: 0010:f2fs_evict_inode+0x172d/0x1e00 fs/f2fs/inode.c:869
> Code: ff df 48 c1 ea 03 80 3c 02 00 0f 85 6a 06 00 00 8b 75 40 ba 01 00 00 00 4c 89 e7 e8 6d ce 06 00 e9 aa fc ff ff e8 63 22 e2 fd <0f> 0b e8 5c 22 e2 fd 48 c7 c0 a8 3a 18 8d 48 ba 00 00 00 00 00 fc
> RSP: 0018:ffffc90003a6fa00 EFLAGS: 00010293
> RAX: 0000000000000000 RBX: 0000000000000001 RCX: 0000000000000000
> RDX: ffff8880273b8000 RSI: ffffffff83a2bd0d RDI: 0000000000000007
> RBP: ffff888077db91b0 R08: 0000000000000007 R09: 0000000000000000
> R10: 0000000000000001 R11: 0000000000000001 R12: ffff888029a3c000
> R13: ffff888077db9660 R14: ffff888029a3c0b8 R15: ffff888077db9c50
> FS:  0000000000000000(0000) GS:ffff8880b9800000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007f1909bb9000 CR3: 00000000276a9000 CR4: 0000000000350ef0
> Call Trace:
>   <TASK>
>   evict+0x2ed/0x6b0 fs/inode.c:665
>   dispose_list+0x117/0x1e0 fs/inode.c:698
>   evict_inodes+0x345/0x440 fs/inode.c:748
>   generic_shutdown_super+0xaf/0x480 fs/super.c:478
>   kill_block_super+0x64/0xb0 fs/super.c:1417
>   kill_f2fs_super+0x2af/0x3c0 fs/f2fs/super.c:4704
>   deactivate_locked_super+0x98/0x160 fs/super.c:330
>   deactivate_super+0xb1/0xd0 fs/super.c:361
>   cleanup_mnt+0x2ae/0x3d0 fs/namespace.c:1254
>   task_work_run+0x16f/0x270 kernel/task_work.c:179
>   exit_task_work include/linux/task_work.h:38 [inline]
>   do_exit+0xa9a/0x29a0 kernel/exit.c:874
>   do_group_exit+0xd4/0x2a0 kernel/exit.c:1024
>   __do_sys_exit_group kernel/exit.c:1035 [inline]
>   __se_sys_exit_group kernel/exit.c:1033 [inline]
>   __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1033
>   do_syscall_x64 arch/x86/entry/common.c:50 [inline]
>   do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
>   entry_SYSCALL_64_after_hwframe+0x63/0xcd
> RIP: 0033:0x7f309be71a09
> Code: Unable to access opcode bytes at 0x7f309be719df.
> RSP: 002b:00007fff171df518 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
> RAX: ffffffffffffffda RBX: 00007f309bef7330 RCX: 00007f309be71a09
> RDX: 000000000000003c RSI: 00000000000000e7 RDI: 0000000000000001
> RBP: 0000000000000001 R08: ffffffffffffffc0 R09: 00007f309bef1e40
> R10: 0000000000010600 R11: 0000000000000246 R12: 00007f309bef7330
> R13: 0000000000000001 R14: 0000000000000000 R15: 0000000000000001
>   </TASK>
> Modules linked in:
> ---[ end trace 0000000000000000 ]---
> RIP: 0010:f2fs_evict_inode+0x172d/0x1e00 fs/f2fs/inode.c:869
> Code: ff df 48 c1 ea 03 80 3c 02 00 0f 85 6a 06 00 00 8b 75 40 ba 01 00 00 00 4c 89 e7 e8 6d ce 06 00 e9 aa fc ff ff e8 63 22 e2 fd <0f> 0b e8 5c 22 e2 fd 48 c7 c0 a8 3a 18 8d 48 ba 00 00 00 00 00 fc
> RSP: 0018:ffffc90003a6fa00 EFLAGS: 00010293
> RAX: 0000000000000000 RBX: 0000000000000001 RCX: 0000000000000000
> RDX: ffff8880273b8000 RSI: ffffffff83a2bd0d RDI: 0000000000000007
> RBP: ffff888077db91b0 R08: 0000000000000007 R09: 0000000000000000
> R10: 0000000000000001 R11: 0000000000000001 R12: ffff888029a3c000
> R13: ffff888077db9660 R14: ffff888029a3c0b8 R15: ffff888077db9c50
> FS:  0000000000000000(0000) GS:ffff8880b9800000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007f1909bb9000 CR3: 00000000276a9000 CR4: 0000000000350ef0
> 
> Cc: <stable@vger.kernel.org>
> Reported-by: syzbot+e1246909d526a9d470fa@syzkaller.appspotmail.com
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,

> ---
>   fs/f2fs/segment.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 0457d620011f..6e5d1039ca76 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -205,6 +205,8 @@ void f2fs_abort_atomic_write(struct inode *inode, bool clean)
>   		f2fs_i_size_write(inode, fi->original_i_size);
>   		fi->original_i_size = 0;
>   	}
> +	/* avoid stale dirty inode during eviction */
> +	sync_inode_metadata(inode, 0);
>   }
>   
>   static int __replace_atomic_write_block(struct inode *inode, pgoff_t index,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
