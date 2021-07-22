Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4E93D2527
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Jul 2021 16:06:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m6ZKs-0005BO-AP; Thu, 22 Jul 2021 14:06:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1m6ZKr-0005BI-Mq
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Jul 2021 14:06:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MgCcyj8rztffieuJyj5TKz5QX3deW3ZnVrJv0Z+dbps=; b=ftky6pa/ndp88eXE9SUjl2jDZE
 LbQBCt/jMEAFTb23rQHCQhOUK3J6rGU5vL51xgyjtmv20qm4CHp+7jce+8p6Djh1PgGX5YLWE3r5R
 iN1EgupIiyLr7a3KyqxXOu2uge6E2841g+fcVUReLYOXU8xMMscZRQB3nsg/xV7XgpiU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MgCcyj8rztffieuJyj5TKz5QX3deW3ZnVrJv0Z+dbps=; b=VRodd/khwEQzYAapUP6L9CdKaT
 Om9/ZslzHFm01wN+zsf5kjoqfwljOV68kPX4d+YblJ4awaEqQ4gJqAbg7rq/hVILGfTH8PB62Jwbh
 eeOIyiY5aYoobvHkxse4nvSSj12h8yv4cVgdE8dSm+5p5LNbUNaR7zshGwpbjR8l2n7U=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m6ZKl-0002Kp-CR
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Jul 2021 14:06:01 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5B0366128C;
 Thu, 22 Jul 2021 14:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626962750;
 bh=k0WLyxljN1lFQrsWH/WuHjp6RYk43aCC0xHEYFb6wpY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=HH4fGv7kpnbFl5CaWzBIrv7+a4mcMDxlVPfp26/UzqdDwUnVkhOyd6Z3QStQO4PO5
 ts1xnclYpa+QAjFqk2xpge6kl/m3+h5/o4YuWh9hzJtip5BBlKhJKkhkwCKNxTbhg4
 7YquXJuhs4tZ5mjTFOmyEOalIMdJ3UvEPZscbGrs6AFuIpAa1xI0C+95ZjFnSSGQ1i
 TdS8pvKnSh/n+AWqcDc2sWkpbI9sawumQJyADM1di5OswVLtqSRc+ZFo7xL1jS28Ob
 gDeqQuEKsTqVyQbx+d1ESNiCFrOch+kk65qnyEtYIVqtuxl1KLdiB9QDPGeaNqAEpk
 TUpGUuLALE+Tw==
To: Jack Qiu <jack.qiu@huawei.com>, jaegeuk@kernel.org
References: <20210722044130.44591-1-jack.qiu@huawei.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <630147dc-4f73-f985-347a-c4933c312edd@kernel.org>
Date: Thu, 22 Jul 2021 22:05:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210722044130.44591-1-jack.qiu@huawei.com>
Content-Language: en-US
X-Spam-Score: -1.5 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 NICE_REPLY_A           Looks like a legit reply (A)
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1m6ZKl-0002Kp-CR
Subject: Re: [f2fs-dev] [PATCH -next] f2fs: fix use after free in
 f2fs_fill_super
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/7/22 12:41, Jack Qiu wrote:
> The root cause is shrink_dcache_sb after sbi has been freed.
> So call shrink_dcache_sb before free sbi and other resources.
> 
> ==================================================================
> BUG: KASAN: use-after-free in f2fs_evict_inode+0x31c/0xde5
> Read of size 4 at addr ffff8881d97f0d50 by task syz-executor.3/8729
> 
> PU: 1 PID: 8729 Comm: syz-executor.3 Not tainted
> 4.19.195-00002-g67dceea04431-dirty #31

Does this bug below to 4.19.195?

> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
> ?-20190727_073836-buildvm-ppc64le-16.ppc.fedoraproject.org-3.fc31
> 04/01/2014
> Call Trace:
>   dump_stack+0xe5/0x14b
>   ? f2fs_evict_inode+0x31c/0xde5
>   print_address_description+0x6c/0x237
>   ? f2fs_evict_inode+0x31c/0xde5
>   kasan_report.cold+0x88/0x2a3
>   f2fs_evict_inode+0x31c/0xde5
>   ? full_proxy_open.cold+0x12/0x12
>   evict+0x2cd/0x5f0
>   iput+0x3d9/0x6f0
>   dentry_unlink_inode+0x273/0x330
>   __dentry_kill+0x340/0x5e0
>   dentry_kill+0xb7/0x740
>   shrink_dentry_list+0x256/0x660
>   shrink_dcache_sb+0x11f/0x1d0
>   ? shrink_dentry_list+0x660/0x660
>   ? __kasan_slab_free+0x144/0x180
>   f2fs_fill_super+0x2a34/0x4a80
>   ? f2fs_sanity_check_ckpt.cold+0x2b6/0x2b6
>   ? wait_for_completion+0x3c0/0x3c0
>   ? set_blocksize+0x230/0x2b0
>   mount_bdev+0x2c1/0x370
>   ? f2fs_sanity_check_ckpt.cold+0x2b6/0x2b6
>   mount_fs+0x4c/0x1c0
>   vfs_kern_mount.part.0+0x60/0x3d0
>   do_mount+0x367/0x2570
>   ? kasan_unpoison_shadow+0x33/0x40
>   ? copy_mount_string+0x40/0x40
>   ? kmem_cache_alloc_trace+0x13f/0x2b0
>   ? _copy_from_user+0x94/0x100
>   ? copy_mount_options+0x1f1/0x2e0
>   ksys_mount+0xa0/0x100
>   __x64_sys_mount+0xbf/0x160
>   do_syscall_64+0xc2/0x190
>   entry_SYSCALL_64_after_hwframe+0x49/0xbe
> RIP: 0033:0x47938e
> Code: 48 c7 c1 b4 ff ff ff f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f 84
> 00 00 00 00 00 90 f3 0f 1e fa 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01
> f0 ff ff 73 01 c3 48 c7 c1 b4 ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007fed673b6a48 EFLAGS: 00000246 ORIG_RAX: 00000000000000a5
> RAX: ffffffffffffffda RBX: 0000000020000200 RCX: 000000000047938e
> RDX: 0000000020000000 RSI: 0000000020000100 RDI: 00007fed673b6aa0
> RBP: 00007fed673b6ae0 R08: 00007fed673b6ae0 R09: 0000000020000000
> R10: 0000000000000000 R11: 0000000000000246 R12: 0000000020000000
> R13: 0000000020000100 R14: 00007fed673b6aa0 R15: 0000000020000b00
> 
> Allocated by task 8729:
>   kasan_kmalloc+0xc2/0xe0
>   kmem_cache_alloc_trace+0x13f/0x2b0
>   f2fs_fill_super+0x124/0x4a80
>   mount_bdev+0x2c1/0x370
>   mount_fs+0x4c/0x1c0
>   vfs_kern_mount.part.0+0x60/0x3d0
>   do_mount+0x367/0x2570
>   ksys_mount+0xa0/0x100
>   __x64_sys_mount+0xbf/0x160
>   do_syscall_64+0xc2/0x190
>   entry_SYSCALL_64_after_hwframe+0x49/0xbe
> 
> Freed by task 8729:
>   __kasan_slab_free+0x12f/0x180
>   kfree+0xfa/0x2a0
>   f2fs_fill_super+0x2a00/0x4a80
>   mount_bdev+0x2c1/0x370
>   mount_fs+0x4c/0x1c0
>   vfs_kern_mount.part.0+0x60/0x3d0
>   do_mount+0x367/0x2570
>   ksys_mount+0xa0/0x100
>   __x64_sys_mount+0xbf/0x160
>   do_syscall_64+0xc2/0x190
>   entry_SYSCALL_64_after_hwframe+0x49/0xbe
> 
> Signed-off-by: Jack Qiu <jack.qiu@huawei.com>
> ---
>   fs/f2fs/super.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 8fecd3050ccd..b041625e06ce 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -4229,6 +4229,8 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>   free_compress_inode:
>   	f2fs_destroy_compress_inode(sbi);
>   free_root_inode:
> +	if (retry_cnt > 0 && skip_recovery)
> +		shrink_dcache_sb(sb);

Compare to 4.19, last f2fs adds evict_inodes() before f2fs_unregister_sysfs(),
could you please check whether this can fix the issue?

Thanks,

>   	dput(sb->s_root);
>   	sb->s_root = NULL;
>   free_node_inode:
> @@ -4285,7 +4287,6 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>   	/* give only one another chance */
>   	if (retry_cnt > 0 && skip_recovery) {
>   		retry_cnt--;
> -		shrink_dcache_sb(sb);
>   		goto try_onemore;
>   	}
>   	return err;
> --
> 2.17.1
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
