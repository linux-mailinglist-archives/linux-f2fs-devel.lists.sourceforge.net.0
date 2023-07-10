Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CBABA74DC1C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 Jul 2023 19:18:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qIuX4-0007Hg-Uu;
	Mon, 10 Jul 2023 17:18:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1qIuX3-0007Ha-P9
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Jul 2023 17:18:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MI0MOfEWb4yOf1eYAWsuTYDKM0uUY7q0Gdc8fMmLL7E=; b=LXEvb/cYzb7siy9uAGl/KT2XoR
 ArQuzlbEYF5BINouY7qXZUZzN2eIsBx4vr4gIyVJDFLC7JXyJF4+KMG5U+vMisEe7zYsf7CLfGl+n
 dXkzhOUBoBf5XfToXMLUEORlCU1/r5+iNagdVTPlbjR0XvavVNtb86oxFHamSEnPo27M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MI0MOfEWb4yOf1eYAWsuTYDKM0uUY7q0Gdc8fMmLL7E=; b=NcCVKPyfqmjQAjQASUGj1JOWHW
 0zsNdzNzzklJyr9Xv5cfuQevBFl3VTn7AJ3F8LtAEf2HAFyzWjzvmHwdRIN981JWDLG5ZTl1BIRqc
 2WUkuzkSTYlC/Oaom9IkBkzBrklVQkZPAhhylzDYmhpvTEOqZ8rASmw1OrtbE9Ma9ZSA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qIuX4-0002ki-Ah for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Jul 2023 17:18:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BF8C56113A;
 Mon, 10 Jul 2023 17:18:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BC0DC433C7;
 Mon, 10 Jul 2023 17:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689009514;
 bh=zQATMIAwv3OH63VR272DxL2FAWN/dvE32XZFtYd8l1c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NHEjskntmlM5Ho3+a2QW9jZEzcnVPTl5vr6rm2ckW4C0Jg1PznPLaDlb5aecNvbMS
 HGrd6mvLEQNO34QdXnM2NRR+M/B0ugxo4Jjz7PCOdrIIssU5RRJQp7ctgf2sU6Woyb
 e53tBiYXvGEBIbTHsyHloeUQ/mzySAxWE1cixH2PxHnx3YlmRSxhm/0Tmn5EUrqHT7
 8nw67Mx9KSSzJK+HYz1Qt+aMYTo5hhpXk6pthBMRrZ/UDGJRpSiuA4e0EGBIxMW3SO
 pNfpMuN4aXVUiMZ4p+Zg+weP5aQvedHCKCcSfU68Y8Os0krzAoj0r1Z5lmXij6m4l4
 iDOk+HCcJq82Q==
Date: Mon, 10 Jul 2023 10:18:32 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <ZKw9aOijIJL5w5cj@google.com>
References: <20230710061021.2303432-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230710061021.2303432-1-chao@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 07/10, Chao Yu wrote: > syzbot reports deadlock bug as
 below: > > -> #1 (&fi->i_sem){+.+.}-{3:3}: > down_write+0x3a/0x50
 kernel/locking/rwsem.c:1573
 > f2fs_down_write fs/f2fs/f2fs.h:2133 [inline] > [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qIuX4-0002ki-Ah
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix potential deadlock by reordering
 w/ i_sem
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
Cc: syzbot+e5600587fa9cbf8e3826@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 07/10, Chao Yu wrote:
> syzbot reports deadlock bug as below:
> 
> -> #1 (&fi->i_sem){+.+.}-{3:3}:
>        down_write+0x3a/0x50 kernel/locking/rwsem.c:1573
>        f2fs_down_write fs/f2fs/f2fs.h:2133 [inline]
>        f2fs_add_inline_entry+0x3a8/0x760 fs/f2fs/inline.c:644
>        f2fs_add_dentry+0xba/0x1e0 fs/f2fs/dir.c:784
>        f2fs_do_add_link+0x21e/0x340 fs/f2fs/dir.c:827
>        f2fs_add_link fs/f2fs/f2fs.h:3554 [inline]
>        f2fs_create+0x32c/0x530 fs/f2fs/namei.c:377
>        lookup_open fs/namei.c:3492 [inline]
>        open_last_lookups fs/namei.c:3560 [inline]
>        path_openat+0x13e7/0x3180 fs/namei.c:3790
>        do_filp_open+0x234/0x490 fs/namei.c:3820
>        do_sys_openat2+0x13e/0x1d0 fs/open.c:1407
>        do_sys_open fs/open.c:1422 [inline]
>        __do_sys_open fs/open.c:1430 [inline]
>        __se_sys_open fs/open.c:1426 [inline]
>        __x64_sys_open+0x225/0x270 fs/open.c:1426
>        do_syscall_x64 arch/x86/entry/common.c:50 [inline]
>        do_syscall_64+0x41/0xc0 arch/x86/entry/common.c:80
>        entry_SYSCALL_64_after_hwframe+0x63/0xcd
> 
> -> #0 (&fi->i_xattr_sem){.+.+}-{3:3}:
>        check_prev_add kernel/locking/lockdep.c:3142 [inline]
>        check_prevs_add kernel/locking/lockdep.c:3261 [inline]
>        validate_chain kernel/locking/lockdep.c:3876 [inline]
>        __lock_acquire+0x39ff/0x7f70 kernel/locking/lockdep.c:5144
>        lock_acquire+0x1e3/0x520 kernel/locking/lockdep.c:5761
>        down_read+0x47/0x2f0 kernel/locking/rwsem.c:1520
>        f2fs_down_read fs/f2fs/f2fs.h:2108 [inline]
>        f2fs_getxattr+0xb8/0x1460 fs/f2fs/xattr.c:532
>        __f2fs_get_acl+0x52/0x8e0 fs/f2fs/acl.c:179
>        f2fs_acl_create fs/f2fs/acl.c:377 [inline]
>        f2fs_init_acl+0xd7/0x9a0 fs/f2fs/acl.c:420
>        f2fs_init_inode_metadata+0x824/0x1190 fs/f2fs/dir.c:558
>        f2fs_do_tmpfile+0x34/0x170 fs/f2fs/dir.c:839
>        __f2fs_tmpfile+0x1f9/0x380 fs/f2fs/namei.c:884
>        f2fs_ioc_start_atomic_write+0x4a3/0x9e0 fs/f2fs/file.c:2099
>        __f2fs_ioctl+0x1b5c/0xb770
>        vfs_ioctl fs/ioctl.c:51 [inline]
>        __do_sys_ioctl fs/ioctl.c:870 [inline]
>        __se_sys_ioctl+0xf8/0x170 fs/ioctl.c:856
>        do_syscall_x64 arch/x86/entry/common.c:50 [inline]
>        do_syscall_64+0x41/0xc0 arch/x86/entry/common.c:80
>        entry_SYSCALL_64_after_hwframe+0x63/0xcd
> 
> The root cause is as below reversed lock order:
> - f2fs_create
>  - f2fs_add_dentry
>   - f2fs_down_write(&F2FS_I(dir)->i_xattr_sem)
> 						- f2fs_ioc_start_atomic_write
> 						 - __f2fs_tmpfile
> 						  - f2fs_do_tmpfile
> 						   - f2fs_down_write(&F2FS_I(inode)->i_sem)
> 						   - f2fs_init_inode_metadata
> 						    - f2fs_init_acl
> 						     - __f2fs_get_acl
> 						      - f2fs_getxattr
> 						       - f2fs_down_read(&F2FS_I(dir)->i_xattr_sem)
>   - f2fs_add_inline_entry
>    - f2fs_down_write(&F2FS_I(inode)->i_sem)

How is it possible to get two inode are identical?

> 
> We can break the dependency of deadlock by below change:
> - use i_sem to keep order of {get,set}xattr instead of i_xattr_sem
> - keep below lock order in inode operation to avoid deadlock:
>  dir->i_sem -> inode->i_sem
>  dir->i_sem -> dpage_lock
> 
> Fixes: 5eda1ad1aaff ("f2fs: fix deadlock in i_xattr_sem and inode page lock")
> Reported-by: syzbot+e5600587fa9cbf8e3826@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/linux-f2fs-devel/00000000000096797d06001a359d@google.com
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/acl.c    | 36 +++++++++++++++++++-----------------
>  fs/f2fs/acl.h    |  4 ++--
>  fs/f2fs/dir.c    | 22 ++++++++++++++++------
>  fs/f2fs/f2fs.h   |  1 -
>  fs/f2fs/super.c  |  5 ++---
>  fs/f2fs/verity.c |  5 +++--
>  fs/f2fs/xattr.c  | 37 +++++++++++++++++++++----------------
>  fs/f2fs/xattr.h  | 19 +++++++++++++------
>  8 files changed, 76 insertions(+), 53 deletions(-)
> 
> diff --git a/fs/f2fs/acl.c b/fs/f2fs/acl.c
> index ec2aeccb69a3..af58b38e953c 100644
> --- a/fs/f2fs/acl.c
> +++ b/fs/f2fs/acl.c
> @@ -166,7 +166,7 @@ static void *f2fs_acl_to_disk(struct f2fs_sb_info *sbi,
>  }
>  
>  static struct posix_acl *__f2fs_get_acl(struct inode *inode, int type,
> -						struct page *dpage)
> +						struct page *dpage, bool locked)
>  {
>  	int name_index = F2FS_XATTR_INDEX_POSIX_ACL_DEFAULT;
>  	void *value = NULL;
> @@ -176,13 +176,13 @@ static struct posix_acl *__f2fs_get_acl(struct inode *inode, int type,
>  	if (type == ACL_TYPE_ACCESS)
>  		name_index = F2FS_XATTR_INDEX_POSIX_ACL_ACCESS;
>  
> -	retval = f2fs_getxattr(inode, name_index, "", NULL, 0, dpage);
> +	retval = f2fs_getxattr(inode, name_index, "", NULL, 0, dpage, locked);
>  	if (retval > 0) {
>  		value = f2fs_kmalloc(F2FS_I_SB(inode), retval, GFP_F2FS_ZERO);
>  		if (!value)
>  			return ERR_PTR(-ENOMEM);
>  		retval = f2fs_getxattr(inode, name_index, "", value,
> -							retval, dpage);
> +							retval, dpage, locked);
>  	}
>  
>  	if (retval > 0)
> @@ -201,7 +201,7 @@ struct posix_acl *f2fs_get_acl(struct inode *inode, int type, bool rcu)
>  	if (rcu)
>  		return ERR_PTR(-ECHILD);
>  
> -	return __f2fs_get_acl(inode, type, NULL);
> +	return __f2fs_get_acl(inode, type, NULL, false);
>  }
>  
>  static int f2fs_acl_update_mode(struct mnt_idmap *idmap,
> @@ -226,9 +226,9 @@ static int f2fs_acl_update_mode(struct mnt_idmap *idmap,
>  	return 0;
>  }
>  
> -static int __f2fs_set_acl(struct mnt_idmap *idmap,
> -			struct inode *inode, int type,
> -			struct posix_acl *acl, struct page *ipage)
> +static int __f2fs_set_acl(struct mnt_idmap *idmap, struct inode *inode,
> +					int type, struct posix_acl *acl,
> +					struct page *ipage, bool locked)
>  {
>  	int name_index;
>  	void *value = NULL;
> @@ -266,7 +266,8 @@ static int __f2fs_set_acl(struct mnt_idmap *idmap,
>  		}
>  	}
>  
> -	error = f2fs_setxattr(inode, name_index, "", value, size, ipage, 0);
> +	error = f2fs_setxattr(inode, name_index, "", value, size,
> +						ipage, 0, locked);
>  
>  	kfree(value);
>  	if (!error)
> @@ -284,7 +285,7 @@ int f2fs_set_acl(struct mnt_idmap *idmap, struct dentry *dentry,
>  	if (unlikely(f2fs_cp_error(F2FS_I_SB(inode))))
>  		return -EIO;
>  
> -	return __f2fs_set_acl(idmap, inode, type, acl, NULL);
> +	return __f2fs_set_acl(idmap, inode, type, acl, NULL, false);
>  }
>  
>  /*
> @@ -362,7 +363,7 @@ static int f2fs_acl_create_masq(struct posix_acl *acl, umode_t *mode_p)
>  
>  static int f2fs_acl_create(struct inode *dir, umode_t *mode,
>  		struct posix_acl **default_acl, struct posix_acl **acl,
> -		struct page *dpage)
> +		struct page *dpage, bool locked)
>  {
>  	struct posix_acl *p;
>  	struct posix_acl *clone;
> @@ -374,7 +375,7 @@ static int f2fs_acl_create(struct inode *dir, umode_t *mode,
>  	if (S_ISLNK(*mode) || !IS_POSIXACL(dir))
>  		return 0;
>  
> -	p = __f2fs_get_acl(dir, ACL_TYPE_DEFAULT, dpage);
> +	p = __f2fs_get_acl(dir, ACL_TYPE_DEFAULT, dpage, locked);
>  	if (!p || p == ERR_PTR(-EOPNOTSUPP)) {
>  		*mode &= ~current_umask();
>  		return 0;
> @@ -412,28 +413,29 @@ static int f2fs_acl_create(struct inode *dir, umode_t *mode,
>  }
>  
>  int f2fs_init_acl(struct inode *inode, struct inode *dir, struct page *ipage,
> -							struct page *dpage)
> +						struct page *dpage, bool locked)
>  {
>  	struct posix_acl *default_acl = NULL, *acl = NULL;
>  	int error;
>  
> -	error = f2fs_acl_create(dir, &inode->i_mode, &default_acl, &acl, dpage);
> +	error = f2fs_acl_create(dir, &inode->i_mode, &default_acl, &acl,
> +							dpage, locked);
>  	if (error)
>  		return error;
>  
>  	f2fs_mark_inode_dirty_sync(inode, true);
>  
>  	if (default_acl) {
> -		error = __f2fs_set_acl(NULL, inode, ACL_TYPE_DEFAULT, default_acl,
> -				       ipage);
> +		error = __f2fs_set_acl(NULL, inode, ACL_TYPE_DEFAULT,
> +					default_acl, ipage, locked);
>  		posix_acl_release(default_acl);
>  	} else {
>  		inode->i_default_acl = NULL;
>  	}
>  	if (acl) {
>  		if (!error)
> -			error = __f2fs_set_acl(NULL, inode, ACL_TYPE_ACCESS, acl,
> -					       ipage);
> +			error = __f2fs_set_acl(NULL, inode, ACL_TYPE_ACCESS,
> +							acl, ipage, locked);
>  		posix_acl_release(acl);
>  	} else {
>  		inode->i_acl = NULL;
> diff --git a/fs/f2fs/acl.h b/fs/f2fs/acl.h
> index 94ebfbfbdc6f..9c14b6f549c6 100644
> --- a/fs/f2fs/acl.h
> +++ b/fs/f2fs/acl.h
> @@ -37,13 +37,13 @@ extern struct posix_acl *f2fs_get_acl(struct inode *, int, bool);
>  extern int f2fs_set_acl(struct mnt_idmap *, struct dentry *,
>  			struct posix_acl *, int);
>  extern int f2fs_init_acl(struct inode *, struct inode *, struct page *,
> -							struct page *);
> +							struct page *, bool);
>  #else
>  #define f2fs_get_acl	NULL
>  #define f2fs_set_acl	NULL
>  
>  static inline int f2fs_init_acl(struct inode *inode, struct inode *dir,
> -				struct page *ipage, struct page *dpage)
> +			struct page *ipage, struct page *dpage, bool locked)
>  {
>  	return 0;
>  }
> diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
> index d635c58cf5a3..4b5c62e18d67 100644
> --- a/fs/f2fs/dir.c
> +++ b/fs/f2fs/dir.c
> @@ -540,6 +540,8 @@ struct page *f2fs_init_inode_metadata(struct inode *inode, struct inode *dir,
>  	int err;
>  
>  	if (is_inode_flag_set(inode, FI_NEW_INODE)) {
> +		struct f2fs_xattr_arg xarg;
> +
>  		page = f2fs_new_inode_page(inode);
>  		if (IS_ERR(page))
>  			return page;
> @@ -555,12 +557,16 @@ struct page *f2fs_init_inode_metadata(struct inode *inode, struct inode *dir,
>  			put_page(page);
>  		}
>  
> -		err = f2fs_init_acl(inode, dir, page, dpage);
> +		err = f2fs_init_acl(inode, dir, page, dpage, true);
>  		if (err)
>  			goto put_error;
>  
> +		xarg.page = page;
> +		xarg.locked = true;
> +
>  		err = f2fs_init_security(inode, dir,
> -					 fname ? fname->usr_fname : NULL, page);
> +					 fname ? fname->usr_fname : NULL,
> +					 &xarg);
>  		if (err)
>  			goto put_error;
>  
> @@ -775,18 +781,20 @@ int f2fs_add_dentry(struct inode *dir, const struct f2fs_filename *fname,
>  {
>  	int err = -EAGAIN;
>  
> +	f2fs_down_read(&F2FS_I(dir)->i_sem);
> +
>  	if (f2fs_has_inline_dentry(dir)) {
>  		/*
> -		 * Should get i_xattr_sem to keep the lock order:
> -		 * i_xattr_sem -> inode_page lock used by f2fs_setxattr.
> +		 * Should get i_sem to keep the lock order:
> +		 * i_sem -> inode_page lock used by f2fs_setxattr.
>  		 */
> -		f2fs_down_read(&F2FS_I(dir)->i_xattr_sem);
>  		err = f2fs_add_inline_entry(dir, fname, inode, ino, mode);
> -		f2fs_up_read(&F2FS_I(dir)->i_xattr_sem);
>  	}
>  	if (err == -EAGAIN)
>  		err = f2fs_add_regular_entry(dir, fname, inode, ino, mode);
>  
> +	f2fs_up_read(&F2FS_I(dir)->i_sem);
> +
>  	f2fs_update_time(F2FS_I_SB(dir), REQ_TIME);
>  	return err;
>  }
> @@ -835,6 +843,7 @@ int f2fs_do_tmpfile(struct inode *inode, struct inode *dir)
>  	struct page *page;
>  	int err = 0;
>  
> +	f2fs_down_write(&F2FS_I(dir)->i_sem);
>  	f2fs_down_write(&F2FS_I(inode)->i_sem);
>  	page = f2fs_init_inode_metadata(inode, dir, NULL, NULL);
>  	if (IS_ERR(page)) {
> @@ -847,6 +856,7 @@ int f2fs_do_tmpfile(struct inode *inode, struct inode *dir)
>  	f2fs_update_time(F2FS_I_SB(inode), REQ_TIME);
>  fail:
>  	f2fs_up_write(&F2FS_I(inode)->i_sem);
> +	f2fs_up_write(&F2FS_I(dir)->i_sem);
>  	return err;
>  }
>  
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index c7cb2177b252..60ec032be48d 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -838,7 +838,6 @@ struct f2fs_inode_info {
>  
>  	/* avoid racing between foreground op and gc */
>  	struct f2fs_rwsem i_gc_rwsem[2];
> -	struct f2fs_rwsem i_xattr_sem; /* avoid racing between reading and changing EAs */
>  
>  	int i_extra_isize;		/* size of extra space located in i_addr */
>  	kprojid_t i_projid;		/* id for project quota */
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index ca31163da00a..c72fda24cffd 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -1418,7 +1418,6 @@ static struct inode *f2fs_alloc_inode(struct super_block *sb)
>  	INIT_LIST_HEAD(&fi->gdirty_list);
>  	init_f2fs_rwsem(&fi->i_gc_rwsem[READ]);
>  	init_f2fs_rwsem(&fi->i_gc_rwsem[WRITE]);
> -	init_f2fs_rwsem(&fi->i_xattr_sem);
>  
>  	/* Will be used by directory only */
>  	fi->i_dir_level = F2FS_SB(sb)->dir_level;
> @@ -3163,7 +3162,7 @@ static int f2fs_get_context(struct inode *inode, void *ctx, size_t len)
>  {
>  	return f2fs_getxattr(inode, F2FS_XATTR_INDEX_ENCRYPTION,
>  				F2FS_XATTR_NAME_ENCRYPTION_CONTEXT,
> -				ctx, len, NULL);
> +				ctx, len, NULL, false);
>  }
>  
>  static int f2fs_set_context(struct inode *inode, const void *ctx, size_t len,
> @@ -3183,7 +3182,7 @@ static int f2fs_set_context(struct inode *inode, const void *ctx, size_t len,
>  
>  	return f2fs_setxattr(inode, F2FS_XATTR_INDEX_ENCRYPTION,
>  				F2FS_XATTR_NAME_ENCRYPTION_CONTEXT,
> -				ctx, len, fs_data, XATTR_CREATE);
> +				ctx, len, fs_data, XATTR_CREATE, true);
>  }
>  
>  static const union fscrypt_policy *f2fs_get_dummy_policy(struct super_block *sb)
> diff --git a/fs/f2fs/verity.c b/fs/f2fs/verity.c
> index 4fc95f353a7a..e181528b1f26 100644
> --- a/fs/f2fs/verity.c
> +++ b/fs/f2fs/verity.c
> @@ -181,7 +181,7 @@ static int f2fs_end_enable_verity(struct file *filp, const void *desc,
>  	/* Set the verity xattr. */
>  	err = f2fs_setxattr(inode, F2FS_XATTR_INDEX_VERITY,
>  			    F2FS_XATTR_NAME_VERITY, &dloc, sizeof(dloc),
> -			    NULL, XATTR_CREATE);
> +			    NULL, XATTR_CREATE, false);
>  	if (err)
>  		goto cleanup;
>  
> @@ -226,7 +226,8 @@ static int f2fs_get_verity_descriptor(struct inode *inode, void *buf,
>  
>  	/* Get the descriptor location */
>  	res = f2fs_getxattr(inode, F2FS_XATTR_INDEX_VERITY,
> -			    F2FS_XATTR_NAME_VERITY, &dloc, sizeof(dloc), NULL);
> +			    F2FS_XATTR_NAME_VERITY, &dloc, sizeof(dloc),
> +			    NULL, false);
>  	if (res < 0 && res != -ERANGE)
>  		return res;
>  	if (res != sizeof(dloc) || dloc.version != cpu_to_le32(F2FS_VERIFY_VER)) {
> diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
> index 476b186b90a6..a6a611f8a771 100644
> --- a/fs/f2fs/xattr.c
> +++ b/fs/f2fs/xattr.c
> @@ -61,7 +61,7 @@ static int f2fs_xattr_generic_get(const struct xattr_handler *handler,
>  		return -EINVAL;
>  	}
>  	return f2fs_getxattr(inode, handler->flags, name,
> -			     buffer, size, NULL);
> +			     buffer, size, NULL, false);
>  }
>  
>  static int f2fs_xattr_generic_set(const struct xattr_handler *handler,
> @@ -84,7 +84,7 @@ static int f2fs_xattr_generic_set(const struct xattr_handler *handler,
>  		return -EINVAL;
>  	}
>  	return f2fs_setxattr(inode, handler->flags, name,
> -					value, size, NULL, flags);
> +					value, size, NULL, flags, false);
>  }
>  
>  static bool f2fs_xattr_user_list(struct dentry *dentry)
> @@ -136,15 +136,16 @@ static int f2fs_xattr_advise_set(const struct xattr_handler *handler,
>  
>  #ifdef CONFIG_F2FS_FS_SECURITY
>  static int f2fs_initxattrs(struct inode *inode, const struct xattr *xattr_array,
> -		void *page)
> +								void *fs_data)
>  {
> +	struct f2fs_xattr_arg *xarg = (struct f2fs_xattr_arg *)fs_data;
>  	const struct xattr *xattr;
>  	int err = 0;
>  
>  	for (xattr = xattr_array; xattr->name != NULL; xattr++) {
>  		err = f2fs_setxattr(inode, F2FS_XATTR_INDEX_SECURITY,
>  				xattr->name, xattr->value,
> -				xattr->value_len, (struct page *)page, 0);
> +				xattr->value_len, xarg->page, 0, xarg->locked);
>  		if (err < 0)
>  			break;
>  	}
> @@ -152,10 +153,11 @@ static int f2fs_initxattrs(struct inode *inode, const struct xattr *xattr_array,
>  }
>  
>  int f2fs_init_security(struct inode *inode, struct inode *dir,
> -				const struct qstr *qstr, struct page *ipage)
> +				const struct qstr *qstr,
> +				struct f2fs_xattr_arg *xarg)
>  {
>  	return security_inode_init_security(inode, dir, qstr,
> -				&f2fs_initxattrs, ipage);
> +				&f2fs_initxattrs, xarg);
>  }
>  #endif
>  
> @@ -512,7 +514,8 @@ static inline int write_all_xattrs(struct inode *inode, __u32 hsize,
>  }
>  
>  int f2fs_getxattr(struct inode *inode, int index, const char *name,
> -		void *buffer, size_t buffer_size, struct page *ipage)
> +				void *buffer, size_t buffer_size,
> +				struct page *ipage, bool locked)
>  {
>  	struct f2fs_xattr_entry *entry = NULL;
>  	int error;
> @@ -528,12 +531,12 @@ int f2fs_getxattr(struct inode *inode, int index, const char *name,
>  	if (len > F2FS_NAME_LEN)
>  		return -ERANGE;
>  
> -	if (!ipage)
> -		f2fs_down_read(&F2FS_I(inode)->i_xattr_sem);
> +	if (!locked)
> +		f2fs_down_read(&F2FS_I(inode)->i_sem);
>  	error = lookup_all_xattrs(inode, ipage, index, len, name,
>  				&entry, &base_addr, &base_size, &is_inline);
> -	if (!ipage)
> -		f2fs_up_read(&F2FS_I(inode)->i_xattr_sem);
> +	if (!locked)
> +		f2fs_up_read(&F2FS_I(inode)->i_sem);
>  	if (error)
>  		return error;
>  
> @@ -567,9 +570,9 @@ ssize_t f2fs_listxattr(struct dentry *dentry, char *buffer, size_t buffer_size)
>  	int error;
>  	size_t rest = buffer_size;
>  
> -	f2fs_down_read(&F2FS_I(inode)->i_xattr_sem);
> +	f2fs_down_read(&F2FS_I(inode)->i_sem);
>  	error = read_all_xattrs(inode, NULL, &base_addr);
> -	f2fs_up_read(&F2FS_I(inode)->i_xattr_sem);
> +	f2fs_up_read(&F2FS_I(inode)->i_sem);
>  	if (error)
>  		return error;
>  
> @@ -775,7 +778,7 @@ static int __f2fs_setxattr(struct inode *inode, int index,
>  
>  int f2fs_setxattr(struct inode *inode, int index, const char *name,
>  				const void *value, size_t size,
> -				struct page *ipage, int flags)
> +				struct page *ipage, int flags, bool locked)
>  {
>  	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>  	int err;
> @@ -796,9 +799,11 @@ int f2fs_setxattr(struct inode *inode, int index, const char *name,
>  	f2fs_balance_fs(sbi, true);
>  
>  	f2fs_lock_op(sbi);
> -	f2fs_down_write(&F2FS_I(inode)->i_xattr_sem);
> +	if (!locked)
> +		f2fs_down_write(&F2FS_I(inode)->i_sem);
>  	err = __f2fs_setxattr(inode, index, name, value, size, ipage, flags);
> -	f2fs_up_write(&F2FS_I(inode)->i_xattr_sem);
> +	if (!locked)
> +		f2fs_up_write(&F2FS_I(inode)->i_sem);
>  	f2fs_unlock_op(sbi);
>  
>  	f2fs_update_time(sbi, REQ_TIME);
> diff --git a/fs/f2fs/xattr.h b/fs/f2fs/xattr.h
> index b1811c392e6f..170e4a49af31 100644
> --- a/fs/f2fs/xattr.h
> +++ b/fs/f2fs/xattr.h
> @@ -52,6 +52,11 @@ struct f2fs_xattr_entry {
>  	char    e_name[];      /* attribute name */
>  };
>  
> +struct f2fs_xattr_arg {
> +	struct page *page;	/* inode page */
> +	bool locked;		/* indicate i_sem is locked */
> +};
> +
>  #define XATTR_HDR(ptr)		((struct f2fs_xattr_header *)(ptr))
>  #define XATTR_ENTRY(ptr)	((struct f2fs_xattr_entry *)(ptr))
>  #define XATTR_FIRST_ENTRY(ptr)	(XATTR_ENTRY(XATTR_HDR(ptr) + 1))
> @@ -128,9 +133,9 @@ extern const struct xattr_handler f2fs_xattr_security_handler;
>  extern const struct xattr_handler *f2fs_xattr_handlers[];
>  
>  extern int f2fs_setxattr(struct inode *, int, const char *,
> -				const void *, size_t, struct page *, int);
> +				const void *, size_t, struct page *, int, bool);
>  extern int f2fs_getxattr(struct inode *, int, const char *, void *,
> -						size_t, struct page *);
> +					size_t, struct page *, bool locked);
>  extern ssize_t f2fs_listxattr(struct dentry *, char *, size_t);
>  extern int f2fs_init_xattr_caches(struct f2fs_sb_info *);
>  extern void f2fs_destroy_xattr_caches(struct f2fs_sb_info *);
> @@ -140,13 +145,13 @@ extern void f2fs_destroy_xattr_caches(struct f2fs_sb_info *);
>  #define f2fs_listxattr		NULL
>  static inline int f2fs_setxattr(struct inode *inode, int index,
>  		const char *name, const void *value, size_t size,
> -		struct page *page, int flags)
> +		struct page *page, int flags, bool locked)
>  {
>  	return -EOPNOTSUPP;
>  }
>  static inline int f2fs_getxattr(struct inode *inode, int index,
>  			const char *name, void *buffer,
> -			size_t buffer_size, struct page *dpage)
> +			size_t buffer_size, struct page *dpage, bool locked)
>  {
>  	return -EOPNOTSUPP;
>  }
> @@ -156,10 +161,12 @@ static inline void f2fs_destroy_xattr_caches(struct f2fs_sb_info *sbi) { }
>  
>  #ifdef CONFIG_F2FS_FS_SECURITY
>  extern int f2fs_init_security(struct inode *, struct inode *,
> -				const struct qstr *, struct page *);
> +					const struct qstr *,
> +					struct f2fs_xattr_arg *xarg);
>  #else
>  static inline int f2fs_init_security(struct inode *inode, struct inode *dir,
> -				const struct qstr *qstr, struct page *ipage)
> +					const struct qstr *qstr,
> +					struct f2fs_xattr_arg *xarg)
>  {
>  	return 0;
>  }
> -- 
> 2.40.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
