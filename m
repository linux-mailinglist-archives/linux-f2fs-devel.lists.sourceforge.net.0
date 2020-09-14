Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1AE26931E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 14 Sep 2020 19:27:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kHsFg-00030t-8k; Mon, 14 Sep 2020 17:26:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1kHsFf-00030l-E2
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 14 Sep 2020 17:26:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GhibN2Jk23Fk4jxVSdwog4XCm8cMfv3kEsM4DsmONgI=; b=WWunMnb8fY27MCKtY63ahydZ/9
 ZsPtw6qg6CrNlMh0F/Q9+P/3Svk4SP51USR8vsqkAtGWnSdn+hRrgY7aKvOVmtDuhTTRyjMbA823t
 d9Xg0UoF/604Ti+z0lTGUftbpXfz75Z9dNfLIPWqWG2KoWibwcojZmznhZpuyhHA4zEE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GhibN2Jk23Fk4jxVSdwog4XCm8cMfv3kEsM4DsmONgI=; b=k1BvBS9zaAwp3nY10mPABI98ni
 M4WtnO0Ku6hpUmoyDt5N+UMZrn3ZGTb+us5uKmHMnDLBlnQUqXMOlTUo4YCiggcDwwn2g+zBT9RLB
 tULyzrSWgJC6tRFfhV4YmYIPMLJBPhh6ouJIVtIMeH1zi4VSAewl4L85zps0VKMY+tEE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kHsFZ-009T0u-1u
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 14 Sep 2020 17:26:51 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5A76720771;
 Mon, 14 Sep 2020 17:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600104392;
 bh=YUeqH1XV4uJ6fcDfV4Ef0fs7JAcffDRAHHBbtRYjkUo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=zWEX0pMpAA8elGd0n7N77i+c2xaSJEQf610j8WGNnOUtqCU83gjZvcmIbJQ4Pu0q6
 ZOgBKc1nLgQT2h5G/a81dG6ajjukvp6peLcfOQHdlHlFQ+CSBfNAZ338ontu5yt0lu
 XxF9EcorDt9Yjg4DyeGUumDrixK1yZQlIhTAGiWs=
Date: Mon, 14 Sep 2020 10:26:31 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20200914172631.GA2580525@google.com>
References: <20200913083620.170627-1-ebiggers@kernel.org>
 <20200913083620.170627-5-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200913083620.170627-5-ebiggers@kernel.org>
X-Spam-Score: -1.9 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.8 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1kHsFZ-009T0u-1u
Subject: Re: [f2fs-dev] [PATCH v2 04/11] f2fs: use
 fscrypt_prepare_new_inode() and fscrypt_set_context()
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
Cc: Daniel Rosenberg <drosen@google.com>, Jeff Layton <jlayton@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 linux-mtd@lists.infradead.org, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 09/13, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Convert f2fs to use the new functions fscrypt_prepare_new_inode() and
> fscrypt_set_context().  This avoids calling
> fscrypt_get_encryption_info() from under f2fs_lock_op(), which can
> deadlock because fscrypt_get_encryption_info() isn't GFP_NOFS-safe.
> 
> For more details about this problem, see the earlier patch
> "fscrypt: add fscrypt_prepare_new_inode() and fscrypt_set_context()".
> 
> This also fixes a f2fs-specific deadlock when the filesystem is mounted
> with '-o test_dummy_encryption' and a file is created in an unencrypted
> directory other than the root directory:
> 
>     INFO: task touch:207 blocked for more than 30 seconds.
>           Not tainted 5.9.0-rc4-00099-g729e3d0919844 #2
>     "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
>     task:touch           state:D stack:    0 pid:  207 ppid:   167 flags:0x00000000
>     Call Trace:
>      [...]
>      lock_page include/linux/pagemap.h:548 [inline]
>      pagecache_get_page+0x25e/0x310 mm/filemap.c:1682
>      find_or_create_page include/linux/pagemap.h:348 [inline]
>      grab_cache_page include/linux/pagemap.h:424 [inline]
>      f2fs_grab_cache_page fs/f2fs/f2fs.h:2395 [inline]
>      f2fs_grab_cache_page fs/f2fs/f2fs.h:2373 [inline]
>      __get_node_page.part.0+0x39/0x2d0 fs/f2fs/node.c:1350
>      __get_node_page fs/f2fs/node.c:35 [inline]
>      f2fs_get_node_page+0x2e/0x60 fs/f2fs/node.c:1399
>      read_inline_xattr+0x88/0x140 fs/f2fs/xattr.c:288
>      lookup_all_xattrs+0x1f9/0x2c0 fs/f2fs/xattr.c:344
>      f2fs_getxattr+0x9b/0x160 fs/f2fs/xattr.c:532
>      f2fs_get_context+0x1e/0x20 fs/f2fs/super.c:2460
>      fscrypt_get_encryption_info+0x9b/0x450 fs/crypto/keysetup.c:472
>      fscrypt_inherit_context+0x2f/0xb0 fs/crypto/policy.c:640
>      f2fs_init_inode_metadata+0xab/0x340 fs/f2fs/dir.c:540
>      f2fs_add_inline_entry+0x145/0x390 fs/f2fs/inline.c:621
>      f2fs_add_dentry+0x31/0x80 fs/f2fs/dir.c:757
>      f2fs_do_add_link+0xcd/0x130 fs/f2fs/dir.c:798
>      f2fs_add_link fs/f2fs/f2fs.h:3234 [inline]
>      f2fs_create+0x104/0x290 fs/f2fs/namei.c:344
>      lookup_open.isra.0+0x2de/0x500 fs/namei.c:3103
>      open_last_lookups+0xa9/0x340 fs/namei.c:3177
>      path_openat+0x8f/0x1b0 fs/namei.c:3365
>      do_filp_open+0x87/0x130 fs/namei.c:3395
>      do_sys_openat2+0x96/0x150 fs/open.c:1168
>      [...]
> 
> That happened because f2fs_add_inline_entry() locks the directory
> inode's page in order to add the dentry, then f2fs_get_context() tries
> to lock it recursively in order to read the encryption xattr.  This
> problem is specific to "test_dummy_encryption" because normally the
> directory's fscrypt_info would be set up prior to
> f2fs_add_inline_entry() in order to encrypt the new filename.
> 
> Regardless, the new design fixes this test_dummy_encryption deadlock as
> well as potential deadlocks with fs reclaim, by setting up any needed
> fscrypt_info structs prior to taking so many locks.
> 
> The test_dummy_encryption deadlock was reported by Daniel Rosenberg.
> 
> Reported-by: Daniel Rosenberg <drosen@google.com>
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Thanks.

Acked-by: Jaegeuk Kim <jaegeuk@kernel.org>

> ---
>  fs/f2fs/dir.c   |  2 +-
>  fs/f2fs/f2fs.h  | 23 -----------------------
>  fs/f2fs/namei.c |  7 ++++++-
>  3 files changed, 7 insertions(+), 25 deletions(-)
> 
> diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
> index b2530b9507bd9..414bc94fbd546 100644
> --- a/fs/f2fs/dir.c
> +++ b/fs/f2fs/dir.c
> @@ -537,7 +537,7 @@ struct page *f2fs_init_inode_metadata(struct inode *inode, struct inode *dir,
>  			goto put_error;
>  
>  		if (IS_ENCRYPTED(inode)) {
> -			err = fscrypt_inherit_context(dir, inode, page, false);
> +			err = fscrypt_set_context(inode, page);
>  			if (err)
>  				goto put_error;
>  		}
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index d9e52a7f3702f..0503371f88ed4 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1315,13 +1315,6 @@ enum fsync_mode {
>  #define IS_IO_TRACED_PAGE(page) (0)
>  #endif
>  
> -#ifdef CONFIG_FS_ENCRYPTION
> -#define DUMMY_ENCRYPTION_ENABLED(sbi) \
> -	(unlikely(F2FS_OPTION(sbi).dummy_enc_ctx.ctx != NULL))
> -#else
> -#define DUMMY_ENCRYPTION_ENABLED(sbi) (0)
> -#endif
> -
>  /* For compression */
>  enum compress_algorithm_type {
>  	COMPRESS_LZO,
> @@ -4022,22 +4015,6 @@ static inline bool f2fs_lfs_mode(struct f2fs_sb_info *sbi)
>  	return F2FS_OPTION(sbi).fs_mode == FS_MODE_LFS;
>  }
>  
> -static inline bool f2fs_may_encrypt(struct inode *dir, struct inode *inode)
> -{
> -#ifdef CONFIG_FS_ENCRYPTION
> -	struct f2fs_sb_info *sbi = F2FS_I_SB(dir);
> -	umode_t mode = inode->i_mode;
> -
> -	/*
> -	 * If the directory encrypted or dummy encryption enabled,
> -	 * then we should encrypt the inode.
> -	 */
> -	if (IS_ENCRYPTED(dir) || DUMMY_ENCRYPTION_ENABLED(sbi))
> -		return (S_ISREG(mode) || S_ISDIR(mode) || S_ISLNK(mode));
> -#endif
> -	return false;
> -}
> -
>  static inline bool f2fs_may_compress(struct inode *inode)
>  {
>  	if (IS_SWAPFILE(inode) || f2fs_is_pinned_file(inode) ||
> diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
> index 84e4bbc1a64de..45f324511a19e 100644
> --- a/fs/f2fs/namei.c
> +++ b/fs/f2fs/namei.c
> @@ -28,6 +28,7 @@ static struct inode *f2fs_new_inode(struct inode *dir, umode_t mode)
>  	nid_t ino;
>  	struct inode *inode;
>  	bool nid_free = false;
> +	bool encrypt = false;
>  	int xattr_size = 0;
>  	int err;
>  
> @@ -69,13 +70,17 @@ static struct inode *f2fs_new_inode(struct inode *dir, umode_t mode)
>  		F2FS_I(inode)->i_projid = make_kprojid(&init_user_ns,
>  							F2FS_DEF_PROJID);
>  
> +	err = fscrypt_prepare_new_inode(dir, inode, &encrypt);
> +	if (err)
> +		goto fail_drop;
> +
>  	err = dquot_initialize(inode);
>  	if (err)
>  		goto fail_drop;
>  
>  	set_inode_flag(inode, FI_NEW_INODE);
>  
> -	if (f2fs_may_encrypt(dir, inode))
> +	if (encrypt)
>  		f2fs_set_encrypted_inode(inode);
>  
>  	if (f2fs_sb_has_extra_attr(sbi)) {
> -- 
> 2.28.0
> 
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
