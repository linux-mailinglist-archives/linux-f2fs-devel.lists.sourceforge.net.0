Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A2E4C3C20
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Feb 2022 04:05:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nNQv3-0000Lv-Jm; Fri, 25 Feb 2022 03:05:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nNQv0-0000Lo-Kc
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 25 Feb 2022 03:05:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Uy7rvUzDBaeiGCtOBxwO1qB3rqHIJa75gsjuGRbMU74=; b=B/rT5VjB62JNQCRSZRTTjDsc1j
 uSjxES9Y7Du1y1BhbQn/67ZjLgPfsjRmZ4e4LdJ7Td3ccnhG5F3KAi/F8vopwr35edHa3jkqLA9P5
 7270m1pHsVD1gEDUzGzn6cl8gZBvzKhRcWzqdAJflAbAmNuLdER2lpsaaYdCgn2eXChc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Uy7rvUzDBaeiGCtOBxwO1qB3rqHIJa75gsjuGRbMU74=; b=arWn1izDfxPTqvLlB5Yxf5yy+0
 TJLllWQ9sJcyJEofT806ClgkGyCY4r5fXhg2Vzj/AHhkqTg+zcFx9Xy+QL0F/BSUYeM13NM4CFCAp
 3leJezk1Ma5XWKAV1EVHQBw+Us4qialGOA6uPwXvG+lEj/tvwWurTldy28KIDW7wKLrU=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nNQuw-00EPgf-H5
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 25 Feb 2022 03:05:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6BD23B82198
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 25 Feb 2022 03:05:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 227ABC340EB;
 Fri, 25 Feb 2022 03:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645758302;
 bh=T6pkLY6rw0+KU7D1QrVBbujSs/RRnpQpsJjJV5tT37c=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=Nfoy3t+2/7qNBajEd3bKYF1USO+zo2JlPq8hOxC+xepjtwYTqekC4PI1Du7DxwmcC
 j9td4DCfuq4OqyIfVOhCkVN3vHV5r7lhqlgTlRdkTAHd5TKVxqCwUQ+SRO00jgaLn+
 hbhCjC8+LSC72tqaW09LRKP61cvZMvc4oYCR1RWtZI6RdeLcsU1LZr5rb74EyyG1C0
 zfXJbb0gMlrODpq112gYMgBeYuG8r+jeXekbET6EW4XBnBUtcfajYKMlkk8LkrvJUw
 +o4hb7zLG0cdNphQKg5vXEFd9NK0w7ge6z8Y36N72MXFbuuyPbHsg7O0UEx4MQXxMY
 Li+2c5GuzUBNw==
Message-ID: <09683b83-b6c0-fe05-0dae-b93cab2f4b63@kernel.org>
Date: Fri, 25 Feb 2022 11:04:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20220215220039.1477906-1-jaegeuk@kernel.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220215220039.1477906-1-jaegeuk@kernel.org>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/2/16 6:00, Jaegeuk Kim wrote: > 1. this thread is
 stuck in f2fs_evict_inode by #2: > [210757.653718] __schedule+0x2e3/0x740
 > [210757.654811] schedule+0x42/0xb0 > [210757.655829] rwsem_down_re [...]
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nNQuw-00EPgf-H5
Subject: Re: [f2fs-dev] [PATCH] f2fs: avoid sb_start_intwrite during eviction
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/2/16 6:00, Jaegeuk Kim wrote:
> 1. this thread is stuck in f2fs_evict_inode by #2:
> [210757.653718]  __schedule+0x2e3/0x740
> [210757.654811]  schedule+0x42/0xb0
> [210757.655829]  rwsem_down_read_slowpath+0x16c/0x4a0

Who has held sb->s_writers.rw_sem?

Thanks,

> [210757.657161]  __down_read+0x6b/0x80
> [210757.658254]  __percpu_down_read+0x54/0x80
> [210757.659413]  __sb_start_write+0x79/0x80
> [210757.660546]  f2fs_evict_inode+0x354/0x5c0 [f2fs]
> [210757.661808]  ? var_wake_function+0x30/0x30
> [210757.663016]  evict+0xd2/0x1b0
> [210757.664007]  dispose_list+0x39/0x50
> [210757.665083]  prune_icache_sb+0x5c/0x80
> [210757.666226]  super_cache_scan+0x132/0x1b0
> [210757.667373]  do_shrink_slab+0x150/0x2a0
> [210757.668510]  shrink_slab+0x20c/0x2a0
> [210757.669574]  drop_slab_node+0x33/0x60
> [210757.670646]  drop_slab+0x3e/0x70
> [210757.671633]  drop_caches_sysctl_handler+0x75/0x85
> [210757.672904]  proc_sys_call_handler+0x1a2/0x1c0
> [210757.674104]  proc_sys_write+0x14/0x20
> [210757.675189]  __vfs_write+0x1b/0x40
> [210757.676208]  vfs_write+0xb9/0x1a0
> [210757.677219]  ksys_write+0x67/0xe0
> [210757.678251]  __x64_sys_write+0x1a/0x20
> 
> 2. another thread is waiting for #1:
> [210757.754646]  schedule+0x42/0xb0
> [210757.755680]  rwsem_down_write_slowpath+0x244/0x4d0
> [210757.757016]  ? _cond_resched+0x19/0x30
> [210757.758140]  down_write+0x41/0x50
> [210757.759223]  prealloc_shrinker+0x6a/0x120
> [210757.760397]  alloc_super+0x275/0x2d0
> [210757.761500]  sget_fc+0x74/0x220
> [210757.762547]  ? set_anon_super+0x20/0x20
> [210757.763711]  ? shmem_create+0x20/0x20
> [210757.764842]  vfs_get_super+0x3d/0x100
> [210757.765925]  get_tree_nodev+0x16/0x20
> [210757.767046]  shmem_get_tree+0x15/0x20
> [210757.768165]  vfs_get_tree+0x2a/0xc0
> [210757.769248]  ? ns_capable+0x10/0x20
> [210757.770361]  do_mount+0x7b6/0x9c0
> [210757.771423]  ksys_mount+0x82/0xd0
> [210757.772469]  __x64_sys_mount+0x25/0x30
> [210757.773592]  do_syscall_64+0x57/0x190
> 
> 3. thaw_super is waiting for #2, resulting in xfstests/generic/068 being stuck.
> [210757.695823]  __schedule+0x2e3/0x740
> [210757.696897]  ? sched_clock+0x9/0x10
> [210757.697959]  schedule+0x42/0xb0
> [210757.698963]  rwsem_down_write_slowpath+0x244/0x4d0
> [210757.700247]  down_write+0x41/0x50
> [210757.701259]  thaw_super+0x17/0x30
> [210757.702235]  do_vfs_ioctl+0x56f/0x670
> [210757.703247]  ? do_user_addr_fault+0x216/0x450
> [210757.704395]  ? _copy_to_user+0x2c/0x30
> [210757.705443]  ksys_ioctl+0x67/0x90
> [210757.706419]  __x64_sys_ioctl+0x1a/0x20
> [210757.707437]  do_syscall_64+0x57/0x190
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>   fs/f2fs/inode.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> index ab8e0c06c78c..882db4bd917b 100644
> --- a/fs/f2fs/inode.c
> +++ b/fs/f2fs/inode.c
> @@ -778,7 +778,6 @@ void f2fs_evict_inode(struct inode *inode)
>   	f2fs_remove_ino_entry(sbi, inode->i_ino, UPDATE_INO);
>   	f2fs_remove_ino_entry(sbi, inode->i_ino, FLUSH_INO);
>   
> -	sb_start_intwrite(inode->i_sb);
>   	set_inode_flag(inode, FI_NO_ALLOC);
>   	i_size_write(inode, 0);
>   retry:
> @@ -809,7 +808,6 @@ void f2fs_evict_inode(struct inode *inode)
>   		if (dquot_initialize_needed(inode))
>   			set_sbi_flag(sbi, SBI_QUOTA_NEED_REPAIR);
>   	}
> -	sb_end_intwrite(inode->i_sb);
>   no_delete:
>   	dquot_drop(inode);
>   


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
