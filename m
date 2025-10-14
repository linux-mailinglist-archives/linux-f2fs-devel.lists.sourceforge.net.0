Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A82EBD7E84
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Oct 2025 09:30:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p93py8YeRpiuwDbxPPeWp8/aPfCtvws66hcpmO8mmfI=; b=dwoRYgvkaqZ1M4R1ejOBA4eD7t
	oSvRpgPFMKHQ3yh25ZWa+FXMMWPYNIvWPxYJryF+JlmEMJe54tsGzz8Od06Cjh601sFDxHndHykjO
	tc2sOcU8yo5d1twAhBcgPQVHf0CHTu3DIJgpnTjwuFwvdYYc8OfMK7Rtlg7qsJV2IYzg=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v8ZUH-0004P5-8D;
	Tue, 14 Oct 2025 07:30:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1v8ZUF-0004Oz-4k
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Oct 2025 07:30:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1YYBfi8dMadv+NqXMj6SsA/TFsiUd6mJos0+icof5FE=; b=MFC1ilnhplBJIEvkJBBmc4sJmO
 ptd3DwNPWt99sVPGxnrBLS1Cj+FVBOa05Ut3ceXqnUAjPmh1FMD/hJhfQpm3nP6fkp2VS+ARWcBOl
 Kc590qvX+ADOcKT1+esLdE1203tZxEaLrwNuPD1kzxLX2AsNmC+nplwgUgUhuSPvJ5Wc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1YYBfi8dMadv+NqXMj6SsA/TFsiUd6mJos0+icof5FE=; b=A7tfyXEFrvUSP2rqmaq9R8qbFo
 2jkkjdG83cw6Cj/5xMWWGBaxi1v2boIMckAFGgR4/KHKqC7dG57PQ40m2dpnj0t+NED55LLWV7esi
 /ESdPf9koof/HD7i+XgBKQNrdUZFFiahJ9K/UR2X7vIhqDaXY689EeB345ALvAC5IIrc=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v8ZUE-0005qu-9Y for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Oct 2025 07:30:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E4B1343D26;
 Tue, 14 Oct 2025 07:30:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D31A8C4CEE7;
 Tue, 14 Oct 2025 07:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760427011;
 bh=QYnFlG6eO2U6bLyq384X7Wvxgwii9j80Rkg4QKq9O34=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=BtkdI5rTinXDpcvf0APRBXaHsNaio4OR2c+tDxR86p+PhtlqsnU1Rzpin1UYHJprY
 jdrSv4PFWg4sM8LE13hDNHMuQCzQPNeESmLmA24for+iQqSnKPRMT7AVras3WJfW08
 ywdrhyCHhBf3vexiEo1hoVgKHo+rVf0vnYFbuFlkHLtX5gTgjoSoRsQBH1pF3Ruhlh
 KdsMOS9rb7EmcZvNw2i8ev34vPHptzp0kFNyj7wLHcPjWaV0CZYRY+i1IUWz6byaqD
 kRKH6W6IrrEDQpSZ9bmLab/rcGjLBAZ3uc0ipEsierBGTMsl5IwbZqEYmnz4fN2zoL
 oDmAYiNE2/Xyg==
Message-ID: <fcbb431f-f559-447b-b65c-a8efb8c6cf1a@kernel.org>
Date: Tue, 14 Oct 2025 15:30:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "HONG, Yun" <yhong@link.cuhk.edu.hk>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>
References: <TYCP286MB3686D500C8AF350E0BE8B4F2C11BA@TYCP286MB3686.JPNP286.PROD.OUTLOOK.COM>
 <03d71905-14af-4ed8-b0e3-ebe75d5f8202@kernel.org>
 <TYCP286MB3686EE4EFAC2B76E2812C9B0C1EBA@TYCP286MB3686.JPNP286.PROD.OUTLOOK.COM>
Content-Language: en-US
In-Reply-To: <TYCP286MB3686EE4EFAC2B76E2812C9B0C1EBA@TYCP286MB3686.JPNP286.PROD.OUTLOOK.COM>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 10/14/25 15:28, HONG, Yun wrote: > Hi Chao, > > Thanks
 for the fix. I've tested it on my setup, and the crash no longer occurs with
 this fix applied. Hi Hong, Thanks for the test, let me send a formal patch
 for fix. :) 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v8ZUE-0005qu-9Y
Subject: Re: [f2fs-dev] [Crash Report] WARNING in f2fs_init_xattr_caches
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 10/14/25 15:28, HONG, Yun wrote:
> Hi Chao,
> 
> Thanks for the fix. I've tested it on my setup, and the crash no longer occurs with this fix applied.

Hi Hong,

Thanks for the test, let me send a formal patch for fix. :)

Thanks,

> 
> Best,
> Yun
> ________________________________
> From: Chao Yu <chao@kernel.org>
> Sent: Monday, October 13, 2025 20:17
> To: HONG, Yun <yhong@link.cuhk.edu.hk>; jaegeuk@kernel.org <jaegeuk@kernel.org>
> Cc: chao@kernel.org <chao@kernel.org>; linux-f2fs-devel@lists.sourceforge.net <linux-f2fs-devel@lists.sourceforge.net>
> Subject: Re: [Crash Report] WARNING in f2fs_init_xattr_caches
> 
> Hi Hong,
> 
> On 9/29/25 19:43, HONG, Yun wrote:
>> Hi,
>>
>> I would like to kindly report a crash I encountered, identified as "WARNING in f2fs_init_xattr_caches". This issue can be reproduced with a Syzlang reproducer on the mainline version downloaded from https://www.kernel.org/
>> For your convenience, I have included a sample crash report, the configuration file, and a reproduction program as attachments.
> 
> Thanks for providing your scripts and images, now I can reproduce this bug.
> 
> Could you please help to test below patch?
> 
> From 519a1cbfb1f287de5edded596f01a41af0cf25ec Mon Sep 17 00:00:00 2001
> From: Chao Yu <chao@kernel.org>
> Date: Mon, 13 Oct 2025 19:42:36 +0800
> Subject: [PATCH] f2fs: use global inline_xattr_slab instead of per-sb slab
>  cache
> MIME-Version: 1.0
> Content-Type: text/plain; charset=UTF-8
> Content-Transfer-Encoding: 8bit
> 
> As Hong Yun reported in mailing list:
> 
> loop7: detected capacity change from 0 to 131072
> ------------[ cut here ]------------
> kmem_cache of name 'f2fs_xattr_entry-7:7' already exists
> WARNING: CPU: 0 PID: 24426 at mm/slab_common.c:110 kmem_cache_sanity_check mm/slab_common.c:109 [inline]
> WARNING: CPU: 0 PID: 24426 at mm/slab_common.c:110 __kmem_cache_create_args+0xa6/0x320 mm/slab_common.c:307
> CPU: 0 UID: 0 PID: 24426 Comm: syz.7.1370 Not tainted 6.17.0-rc4 #1 PREEMPT(full)
> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.13.0-1ubuntu1.1 04/01/2014
> RIP: 0010:kmem_cache_sanity_check mm/slab_common.c:109 [inline]
> RIP: 0010:__kmem_cache_create_args+0xa6/0x320 mm/slab_common.c:307
> Call Trace:
>  __kmem_cache_create include/linux/slab.h:353 [inline]
>  f2fs_kmem_cache_create fs/f2fs/f2fs.h:2943 [inline]
>  f2fs_init_xattr_caches+0xa5/0xe0 fs/f2fs/xattr.c:843
>  f2fs_fill_super+0x1645/0x2620 fs/f2fs/super.c:4918
>  get_tree_bdev_flags+0x1fb/0x260 fs/super.c:1692
>  vfs_get_tree+0x43/0x140 fs/super.c:1815
>  do_new_mount+0x201/0x550 fs/namespace.c:3808
>  do_mount fs/namespace.c:4136 [inline]
>  __do_sys_mount fs/namespace.c:4347 [inline]
>  __se_sys_mount+0x298/0x2f0 fs/namespace.c:4324
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0x8e/0x3a0 arch/x86/entry/syscall_64.c:94
>  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> 
> The bug can be reproduced w/ below scripts:
> - mount /dev/vdb /mnt1
> - mount /dev/vdc /mnt2
> - umount /mnt1
> - mounnt /dev/vdb /mnt1
> 
> The reason is if we created two slab caches, named f2fs_xattr_entry-7:3
> and f2fs_xattr_entry-7:7, and they have the same slab size. Actually,
> slab system will only create one slab cache core structure which has
> slab name of "f2fs_xattr_entry-7:3", and two slab caches share the same
> structure and cache address.
> 
> So, if we destroy f2fs_xattr_entry-7:3 cache w/ cache address, it will
> decrease reference count of slab cache, rather than release slab cache
> entirely, since there is one more user has referenced the cache.
> 
> Then, if we try to create slab cache w/ name "f2fs_xattr_entry-7:3" again,
> slab system will find that there is existed cache which has the same name
> and trigger the warning.
> 
> Let's changes to use global inline_xattr_slab instead of per-sb slab cache
> for fixing.
> 
> Fixes: a999150f4fe3 ("f2fs: use kmem_cache pool during inline xattr lookups")
> Cc: stable@kernel.org
> Reported-by: Hong Yun <yhong@link.cuhk.edu.hk>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/f2fs.h  |  3 ---
>  fs/f2fs/super.c | 17 ++++++++---------
>  fs/f2fs/xattr.c | 32 +++++++++++---------------------
>  fs/f2fs/xattr.h | 10 ++++++----
>  4 files changed, 25 insertions(+), 37 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 839032a4da39..c589aed069d9 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1892,9 +1892,6 @@ struct f2fs_sb_info {
>          spinlock_t error_lock;                  /* protect errors/stop_reason array */
>          bool error_dirty;                       /* errors of sb is dirty */
> 
> -       struct kmem_cache *inline_xattr_slab;   /* inline xattr entry */
> -       unsigned int inline_xattr_slab_size;    /* default inline xattr slab size */
> -
>          /* For reclaimed segs statistics per each GC mode */
>          unsigned int gc_segment_mode;           /* GC state for reclaimed segments */
>          unsigned int gc_reclaimed_segs[MAX_GC_MODE];    /* Reclaimed segs for each mode */
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 6e52e36c1f1a..2ae341768a39 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -2027,7 +2027,6 @@ static void f2fs_put_super(struct super_block *sb)
>          kfree(sbi->raw_super);
> 
>          f2fs_destroy_page_array_cache(sbi);
> -       f2fs_destroy_xattr_caches(sbi);
>  #ifdef CONFIG_QUOTA
>          for (i = 0; i < MAXQUOTAS; i++)
>                  kfree(F2FS_OPTION(sbi).s_qf_names[i]);
> @@ -5016,13 +5015,9 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
>          if (err)
>                  goto free_iostat;
> 
> -       /* init per sbi slab cache */
> -       err = f2fs_init_xattr_caches(sbi);
> -       if (err)
> -               goto free_percpu;
>          err = f2fs_init_page_array_cache(sbi);
>          if (err)
> -               goto free_xattr_cache;
> +               goto free_percpu;
> 
>          /* get an inode for meta space */
>          sbi->meta_inode = f2fs_iget(sb, F2FS_META_INO(sbi));
> @@ -5351,8 +5346,6 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
>          sbi->meta_inode = NULL;
>  free_page_array_cache:
>          f2fs_destroy_page_array_cache(sbi);
> -free_xattr_cache:
> -       f2fs_destroy_xattr_caches(sbi);
>  free_percpu:
>          destroy_percpu_info(sbi);
>  free_iostat:
> @@ -5555,10 +5548,15 @@ static int __init init_f2fs_fs(void)
>          err = f2fs_create_casefold_cache();
>          if (err)
>                  goto free_compress_cache;
> -       err = register_filesystem(&f2fs_fs_type);
> +       err = f2fs_init_xattr_cache();
>          if (err)
>                  goto free_casefold_cache;
> +       err = register_filesystem(&f2fs_fs_type);
> +       if (err)
> +               goto free_xattr_cache;
>          return 0;
> +free_xattr_cache:
> +       f2fs_destroy_xattr_cache();
>  free_casefold_cache:
>          f2fs_destroy_casefold_cache();
>  free_compress_cache:
> @@ -5599,6 +5597,7 @@ static int __init init_f2fs_fs(void)
>  static void __exit exit_f2fs_fs(void)
>  {
>          unregister_filesystem(&f2fs_fs_type);
> +       f2fs_destroy_xattr_cache();
>          f2fs_destroy_casefold_cache();
>          f2fs_destroy_compress_cache();
>          f2fs_destroy_compress_mempool();
> diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
> index 58632a2b6613..9f20b67e90d1 100644
> --- a/fs/f2fs/xattr.c
> +++ b/fs/f2fs/xattr.c
> @@ -23,11 +23,12 @@
>  #include "xattr.h"
>  #include "segment.h"
> 
> +struct kmem_cache *inline_xattr_slab;
>  static void *xattr_alloc(struct f2fs_sb_info *sbi, int size, bool *is_inline)
>  {
> -       if (likely(size == sbi->inline_xattr_slab_size)) {
> +       if (likely(size == DEFAULT_XATTR_SLAB_SIZE)) {
>                  *is_inline = true;
> -               return f2fs_kmem_cache_alloc(sbi->inline_xattr_slab,
> +               return f2fs_kmem_cache_alloc(inline_xattr_slab,
>                                          GFP_F2FS_ZERO, false, sbi);
>          }
>          *is_inline = false;
> @@ -38,7 +39,7 @@ static void xattr_free(struct f2fs_sb_info *sbi, void *xattr_addr,
>                                                          bool is_inline)
>  {
>          if (is_inline)
> -               kmem_cache_free(sbi->inline_xattr_slab, xattr_addr);
> +               kmem_cache_free(inline_xattr_slab, xattr_addr);
>          else
>                  kfree(xattr_addr);
>  }
> @@ -830,25 +831,14 @@ int f2fs_setxattr(struct inode *inode, int index, const char *name,
>          return err;
>  }
> 
> -int f2fs_init_xattr_caches(struct f2fs_sb_info *sbi)
> +int __init f2fs_init_xattr_cache(void)
>  {
> -       dev_t dev = sbi->sb->s_bdev->bd_dev;
> -       char slab_name[32];
> -
> -       sprintf(slab_name, "f2fs_xattr_entry-%u:%u", MAJOR(dev), MINOR(dev));
> -
> -       sbi->inline_xattr_slab_size = F2FS_OPTION(sbi).inline_xattr_size *
> -                                       sizeof(__le32) + XATTR_PADDING_SIZE;
> -
> -       sbi->inline_xattr_slab = f2fs_kmem_cache_create(slab_name,
> -                                       sbi->inline_xattr_slab_size);
> -       if (!sbi->inline_xattr_slab)
> -               return -ENOMEM;
> -
> -       return 0;
> +       inline_xattr_slab = f2fs_kmem_cache_create("f2fs_xattr_entry",
> +                                       DEFAULT_XATTR_SLAB_SIZE);
> +       return inline_xattr_slab ? 0 : -ENOMEM;
>  }
> 
> -void f2fs_destroy_xattr_caches(struct f2fs_sb_info *sbi)
> +void f2fs_destroy_xattr_cache(void)
>  {
> -       kmem_cache_destroy(sbi->inline_xattr_slab);
> -}
> +       kmem_cache_destroy(inline_xattr_slab);
> +}
> \ No newline at end of file
> diff --git a/fs/f2fs/xattr.h b/fs/f2fs/xattr.h
> index 4fc0b2305fbd..9acf62541a71 100644
> --- a/fs/f2fs/xattr.h
> +++ b/fs/f2fs/xattr.h
> @@ -89,6 +89,8 @@ struct f2fs_xattr_entry {
>                          F2FS_TOTAL_EXTRA_ATTR_SIZE / sizeof(__le32) -   \
>                          DEF_INLINE_RESERVED_SIZE -                      \
>                          MIN_INLINE_DENTRY_SIZE / sizeof(__le32))
> +#define DEFAULT_XATTR_SLAB_SIZE        (DEFAULT_INLINE_XATTR_ADDRS *           \
> +                               sizeof(__le32) + XATTR_PADDING_SIZE)
> 
>  /*
>   * On-disk structure of f2fs_xattr
> @@ -132,8 +134,8 @@ int f2fs_setxattr(struct inode *, int, const char *, const void *,
>  int f2fs_getxattr(struct inode *, int, const char *, void *,
>                  size_t, struct folio *);
>  ssize_t f2fs_listxattr(struct dentry *, char *, size_t);
> -int f2fs_init_xattr_caches(struct f2fs_sb_info *);
> -void f2fs_destroy_xattr_caches(struct f2fs_sb_info *);
> +int __init f2fs_init_xattr_cache(void);
> +void f2fs_destroy_xattr_cache(void);
>  #else
> 
>  #define f2fs_xattr_handlers     NULL
> @@ -150,8 +152,8 @@ static inline int f2fs_getxattr(struct inode *inode, int index,
>  {
>          return -EOPNOTSUPP;
>  }
> -static inline int f2fs_init_xattr_caches(struct f2fs_sb_info *sbi) { return 0; }
> -static inline void f2fs_destroy_xattr_caches(struct f2fs_sb_info *sbi) { }
> +static int __init f2fs_init_xattr_cache(void) { return 0; }
> +static void f2fs_destroy_xattr_cache(void) { }
>  #endif
> 
>  #ifdef CONFIG_F2FS_FS_SECURITY
> --
> 2.49.0
> 
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
