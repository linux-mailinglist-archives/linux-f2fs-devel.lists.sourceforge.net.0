Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8840B2794AC
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 26 Sep 2020 01:26:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kLx6I-0001jQ-4J; Fri, 25 Sep 2020 23:26:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1kLx6H-0001j8-6Q
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 25 Sep 2020 23:26:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2JAmI6QU5iL3bIHBZVX8rVQiqf32UWkCuF5mHQRBAZk=; b=W+B+wkTz+crR/6BlI6vX2BOKOT
 hvWe4TlXu2BiN26DisJFD0qcbnDPv9FMifcc/udYCjFakpO9BPijpYfhS/KpoNjI34IlJ7wEsCy/0
 e/0HZrX+piVyz/ipFXuVcP5bJ+8RQPQUyxZl/n8DgkOliDPMoyaY6ASxOV+y68Ct9i+Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2JAmI6QU5iL3bIHBZVX8rVQiqf32UWkCuF5mHQRBAZk=; b=GBikN49zsdq6tVxMAGYpy/bhRq
 LiqjU2ATgKFjWoJSJg9gEuIwitAzcODwH9s90gFbKe/H5UWXqVYVnn6M48ysm34/Ke2OWl2deITHq
 HX7pbi6sbw08TjT6hxIvLcFPDQ7SWrT4u1xeZPvdzp/Oz2du4fCUixGoQkHJArCpLROg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kLx6C-0067Dy-TW
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 25 Sep 2020 23:26:01 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6113720829;
 Fri, 25 Sep 2020 23:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601076351;
 bh=PElNvGAUW7d5o1SL4TyJ+zEN+ZPPnj6i5Xl77vtxpl4=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=LF1tpOeJ3GQmMcm85OEZhVyzanZoQT0TqHI2cYrrqZZLwoN8jjH4ibi5+qlW+t3FE
 9TrY4UPRm/mVxKXNw9XjjqUrNH/SzAWokmJj7+Zjga46TjLcZN3rYpOlCY6JyWpFMW
 zkp9/EZby7E7MH2WZaPZQZ2acVxS8VMTtbeF+d60=
Date: Fri, 25 Sep 2020 16:25:50 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Message-ID: <20200925232550.GB4136545@google.com>
References: <20200923084512.2947439-1-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200923084512.2947439-1-jaegeuk@kernel.org>
X-Spam-Score: -1.3 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kLx6C-0067Dy-TW
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix slab leak of rpages pointer
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

I missed the f2fs mailing list by gitconfig. :)

On 09/23, Jaegeuk Kim wrote:
> This fixes the below mem leak.
> 
> [  130.157600] =============================================================================
> [  130.159662] BUG f2fs_page_array_entry-252:16 (Tainted: G        W  O     ): Objects remaining in f2fs_page_array_entry-252:16 on __kmem_cache_shutdown()
> [  130.162742] -----------------------------------------------------------------------------
> [  130.162742]
> [  130.164979] Disabling lock debugging due to kernel taint
> [  130.166188] INFO: Slab 0x000000009f5a52d2 objects=22 used=4 fp=0x00000000ba72c3e9 flags=0xfffffc0010200
> [  130.168269] CPU: 7 PID: 3560 Comm: umount Tainted: G    B   W  O      5.9.0-rc4+ #35
> [  130.170019] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.13.0-1 04/01/2014
> [  130.171941] Call Trace:
> [  130.172528]  dump_stack+0x74/0x9a
> [  130.173298]  slab_err+0xb7/0xdc
> [  130.174044]  ? kernel_poison_pages+0xc0/0xc0
> [  130.175065]  ? on_each_cpu_cond_mask+0x48/0x90
> [  130.176096]  __kmem_cache_shutdown.cold+0x34/0x141
> [  130.177190]  kmem_cache_destroy+0x59/0x100
> [  130.178223]  f2fs_destroy_page_array_cache+0x15/0x20 [f2fs]
> [  130.179527]  f2fs_put_super+0x1bc/0x380 [f2fs]
> [  130.180538]  generic_shutdown_super+0x72/0x110
> [  130.181547]  kill_block_super+0x27/0x50
> [  130.182438]  kill_f2fs_super+0x76/0xe0 [f2fs]
> [  130.183448]  deactivate_locked_super+0x3b/0x80
> [  130.184456]  deactivate_super+0x3e/0x50
> [  130.185363]  cleanup_mnt+0x109/0x160
> [  130.186179]  __cleanup_mnt+0x12/0x20
> [  130.187003]  task_work_run+0x70/0xb0
> [  130.187841]  exit_to_user_mode_prepare+0x18f/0x1b0
> [  130.188917]  syscall_exit_to_user_mode+0x31/0x170
> [  130.189989]  do_syscall_64+0x45/0x90
> [  130.190828]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> [  130.191986] RIP: 0033:0x7faf868ea2eb
> [  130.192815] Code: 7b 0c 00 f7 d8 64 89 01 48 83 c8 ff c3 66 90 f3 0f 1e fa 31 f6 e9 05 00 00 00 0f 1f 44 00 00 f3 0f 1e fa b8 a6 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 75 7b 0c 00 f7 d8 64 89 01
> [  130.196872] RSP: 002b:00007fffb7edb478 EFLAGS: 00000246 ORIG_RAX: 00000000000000a6
> [  130.198494] RAX: 0000000000000000 RBX: 00007faf86a18204 RCX: 00007faf868ea2eb
> [  130.201021] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 000055971df71c50
> [  130.203415] RBP: 000055971df71a40 R08: 0000000000000000 R09: 00007fffb7eda1f0
> [  130.205772] R10: 00007faf86a04339 R11: 0000000000000246 R12: 000055971df71c50
> [  130.208150] R13: 0000000000000000 R14: 000055971df71b38 R15: 0000000000000000
> [  130.210515] INFO: Object 0x00000000a980843a @offset=744
> [  130.212476] INFO: Allocated in page_array_alloc+0x3d/0xe0 [f2fs] age=1572 cpu=0 pid=3297
> [  130.215030] 	__slab_alloc+0x20/0x40
> [  130.216566] 	kmem_cache_alloc+0x2a0/0x2e0
> [  130.218217] 	page_array_alloc+0x3d/0xe0 [f2fs]
> [  130.219940] 	f2fs_init_compress_ctx+0x1f/0x40 [f2fs]
> [  130.221736] 	f2fs_write_cache_pages+0x3db/0x860 [f2fs]
> [  130.223591] 	f2fs_write_data_pages+0x2c9/0x300 [f2fs]
> [  130.225414] 	do_writepages+0x43/0xd0
> [  130.226907] 	__filemap_fdatawrite_range+0xd5/0x110
> [  130.228632] 	filemap_write_and_wait_range+0x48/0xb0
> [  130.230336] 	__generic_file_write_iter+0x18a/0x1d0
> [  130.232035] 	f2fs_file_write_iter+0x226/0x550 [f2fs]
> [  130.233737] 	new_sync_write+0x113/0x1a0
> [  130.235204] 	vfs_write+0x1a6/0x200
> [  130.236579] 	ksys_write+0x67/0xe0
> [  130.237898] 	__x64_sys_write+0x1a/0x20
> [  130.239309] 	do_syscall_64+0x38/0x90
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  fs/f2fs/compress.c | 2 +-
>  fs/f2fs/data.c     | 2 ++
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index 10a9f39b9d6a2..f086ac43ca825 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -159,7 +159,7 @@ struct page *f2fs_compress_control_page(struct page *page)
>  
>  int f2fs_init_compress_ctx(struct compress_ctx *cc)
>  {
> -	if (cc->nr_rpages)
> +	if (cc->rpages)
>  		return 0;
>  
>  	cc->rpages = page_array_alloc(cc->inode);
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index db020a74fd849..ee87407602fa7 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -3129,6 +3129,8 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
>  			retry = 0;
>  		}
>  	}
> +	if (f2fs_compressed_file(inode))
> +		f2fs_destroy_compress_ctx(&cc);
>  #endif
>  	if (retry) {
>  		index = 0;
> -- 
> 2.28.0.681.g6f77f65b4e-goog


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
