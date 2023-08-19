Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 813EB78168A
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 19 Aug 2023 04:05:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qXBLL-0000Fo-4F;
	Sat, 19 Aug 2023 02:05:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <groeck7@gmail.com>) id 1qXBLE-0000Fh-Ki
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 19 Aug 2023 02:05:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7lIiAENxS7E0msBmGFoE0fFcvtkMqskWyHDf4YDvmuw=; b=bPUZ9NKQrxUxAVDFpuKTdG3JCx
 ho/um5bUNgvT7ZU9RRhtwcRXlPt6n9U8eAY+i85vtkn8zAshAVsS3pQjlRlUW9MEheLo73rQ84ZnG
 Cta/UPinuit7WdAhjFRsm9uMFokXGihTymNfKioxGk+CPMtFrD40Bsfb2w0S2LznWv+s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7lIiAENxS7E0msBmGFoE0fFcvtkMqskWyHDf4YDvmuw=; b=E4WXyv3RK/3ZRKk8Cfxd3khe91
 6d0Y0V9h8SbvbNngVA+wXNwgrycXg4mXiUuO5jXjIrjWnzUXx1OKok/7xdQkwP43KsbLbZU1H6icN
 8sQdxqSuxOWxm9OCJIuM0R4+9PsFhRO/KLQHMqMMYQg7iGu2Td+2M5RAfkrue3zyIuFk=;
Received: from mail-pl1-f174.google.com ([209.85.214.174])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qXBLD-0003Ak-Uq for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 19 Aug 2023 02:05:28 +0000
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-1bf3a2f44ffso10154195ad.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 18 Aug 2023 19:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692410722; x=1693015522;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=7lIiAENxS7E0msBmGFoE0fFcvtkMqskWyHDf4YDvmuw=;
 b=fQTSHUqQI6PdDl3+8y24gdPneRWdTcnZqiuv+WnZNS4hbR1lo7HcMpqnfjpbL3x01q
 Ban3d/Rv7kFXB9nn91nLU93rkOr+IXuAnrFdodI4sY/IDAJhDOoGxwm3f8jD6+o6xsmF
 7bcp4IidoBo3/AjhUHfZA4TVinIkNBR9dCv6sZCIFfwj0wSdtIhuSrEAKiXUWI7EJS2O
 BJVvAwwz2ZzdjL+rMCS2ohu2U6mE+86oIv7MdkMlMU9pw6/NoJ+gUYfmtKj9B3Djv9xu
 5XTJoOV842ubB/wsN2du4EiP/W/w8sPsuqShFG6C+MFkgEMTEl2twyIaaxCHTPAA/e0e
 lT6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692410722; x=1693015522;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7lIiAENxS7E0msBmGFoE0fFcvtkMqskWyHDf4YDvmuw=;
 b=VyIsJCDQDWOkRcuYqxbLn1uBUwDMmq+Os+w549RN2rAgCcyE2BozciB1p4GGyydXJV
 StzlOSL1w3/pcBDENN5OYiunJWK2J0LxeXLr9fqNPHdt93ckbpEtKBd0SQY+BGry69FM
 eNGwbSxDhYDhr86YEErYXKQsS3F9fGZrqK+XlJdzlNK6wIS9eaJBRxaNCIHFT1txbHoP
 Ktik8msNI2l8qQfgun7NGGhpVKArylgAwjjzAk2QZJQgv4btRR7AnTOfvFyZ+rL9pKNC
 g4RdYKlAv/Tf/el54CAZUt7136J5/anPjBav8AgmpX79ad7x63cl5Sh0lUqg50och29z
 P2lA==
X-Gm-Message-State: AOJu0YwIgNzWow1X3h5IGkeKll+r1e3XxC64f3JRzbrBS4M6WoLdk+NY
 ANd86FMPs/YipAtThvdnfHY=
X-Google-Smtp-Source: AGHT+IEJqWchVD/KNu4Dr1UcBUu/uzoDromwRCHg6bLo6OALxgJKwLIxyXSM3GimtBfPASD3L6uzQA==
X-Received: by 2002:a17:903:234e:b0:1bd:aeb3:9504 with SMTP id
 c14-20020a170903234e00b001bdaeb39504mr971938plh.15.1692410722167; 
 Fri, 18 Aug 2023 19:05:22 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 21-20020a170902c11500b001bc930d4517sm2436747pli.42.2023.08.18.19.05.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Aug 2023 19:05:21 -0700 (PDT)
Date: Fri, 18 Aug 2023 19:05:20 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <30da1d43-d15d-4f8e-a36f-73428328d91c@roeck-us.net>
References: <20230819003012.3473675-1-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230819003012.3473675-1-jaegeuk@kernel.org>
X-Spam-Score: 0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Aug 18, 2023 at 05:30:12PM -0700, Jaegeuk Kim wrote:
 > ====================================================== > WARNING: possible
 circular locking dependency detected > 6.5.0-rc5-syzkaller-003 [...] 
 Content analysis details:   (0.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [groeck7[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [groeck7[at]gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.174 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.174 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
X-Headers-End: 1qXBLD-0003Ak-Uq
Subject: Re: [f2fs-dev] [PATCH] f2fs: avoid false alarm of circular locking
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

On Fri, Aug 18, 2023 at 05:30:12PM -0700, Jaegeuk Kim wrote:
> ======================================================
> WARNING: possible circular locking dependency detected
> 6.5.0-rc5-syzkaller-00353-gae545c3283dc #0 Not tainted
> ------------------------------------------------------
> syz-executor273/5027 is trying to acquire lock:
> ffff888077fe1fb0 (&fi->i_sem){+.+.}-{3:3}, at: f2fs_down_write fs/f2fs/f2fs.h:2133 [inline]
> ffff888077fe1fb0 (&fi->i_sem){+.+.}-{3:3}, at: f2fs_add_inline_entry+0x300/0x6f0 fs/f2fs/inline.c:644
> 
> but task is already holding lock:
> ffff888077fe07c8 (&fi->i_xattr_sem){.+.+}-{3:3}, at: f2fs_down_read fs/f2fs/f2fs.h:2108 [inline]
> ffff888077fe07c8 (&fi->i_xattr_sem){.+.+}-{3:3}, at: f2fs_add_dentry+0x92/0x230 fs/f2fs/dir.c:783
> 
> which lock already depends on the new lock.
> 
> the existing dependency chain (in reverse order) is:
> 
> -> #1 (&fi->i_xattr_sem){.+.+}-{3:3}:
>        down_read+0x9c/0x470 kernel/locking/rwsem.c:1520
>        f2fs_down_read fs/f2fs/f2fs.h:2108 [inline]
>        f2fs_getxattr+0xb1e/0x12c0 fs/f2fs/xattr.c:532
>        __f2fs_get_acl+0x5a/0x900 fs/f2fs/acl.c:179
>        f2fs_acl_create fs/f2fs/acl.c:377 [inline]
>        f2fs_init_acl+0x15c/0xb30 fs/f2fs/acl.c:420
>        f2fs_init_inode_metadata+0x159/0x1290 fs/f2fs/dir.c:558
>        f2fs_add_regular_entry+0x79e/0xb90 fs/f2fs/dir.c:740
>        f2fs_add_dentry+0x1de/0x230 fs/f2fs/dir.c:788
>        f2fs_do_add_link+0x190/0x280 fs/f2fs/dir.c:827
>        f2fs_add_link fs/f2fs/f2fs.h:3554 [inline]
>        f2fs_mkdir+0x377/0x620 fs/f2fs/namei.c:781
>        vfs_mkdir+0x532/0x7e0 fs/namei.c:4117
>        do_mkdirat+0x2a9/0x330 fs/namei.c:4140
>        __do_sys_mkdir fs/namei.c:4160 [inline]
>        __se_sys_mkdir fs/namei.c:4158 [inline]
>        __x64_sys_mkdir+0xf2/0x140 fs/namei.c:4158
>        do_syscall_x64 arch/x86/entry/common.c:50 [inline]
>        do_syscall_64+0x38/0xb0 arch/x86/entry/common.c:80
>        entry_SYSCALL_64_after_hwframe+0x63/0xcd
> 
> -> #0 (&fi->i_sem){+.+.}-{3:3}:
>        check_prev_add kernel/locking/lockdep.c:3142 [inline]
>        check_prevs_add kernel/locking/lockdep.c:3261 [inline]
>        validate_chain kernel/locking/lockdep.c:3876 [inline]
>        __lock_acquire+0x2e3d/0x5de0 kernel/locking/lockdep.c:5144
>        lock_acquire kernel/locking/lockdep.c:5761 [inline]
>        lock_acquire+0x1ae/0x510 kernel/locking/lockdep.c:5726
>        down_write+0x93/0x200 kernel/locking/rwsem.c:1573
>        f2fs_down_write fs/f2fs/f2fs.h:2133 [inline]
>        f2fs_add_inline_entry+0x300/0x6f0 fs/f2fs/inline.c:644
>        f2fs_add_dentry+0xa6/0x230 fs/f2fs/dir.c:784
>        f2fs_do_add_link+0x190/0x280 fs/f2fs/dir.c:827
>        f2fs_add_link fs/f2fs/f2fs.h:3554 [inline]
>        f2fs_mkdir+0x377/0x620 fs/f2fs/namei.c:781
>        vfs_mkdir+0x532/0x7e0 fs/namei.c:4117
>        ovl_do_mkdir fs/overlayfs/overlayfs.h:196 [inline]
>        ovl_mkdir_real+0xb5/0x370 fs/overlayfs/dir.c:146
>        ovl_workdir_create+0x3de/0x820 fs/overlayfs/super.c:309
>        ovl_make_workdir fs/overlayfs/super.c:711 [inline]
>        ovl_get_workdir fs/overlayfs/super.c:864 [inline]
>        ovl_fill_super+0xdab/0x6180 fs/overlayfs/super.c:1400
>        vfs_get_super+0xf9/0x290 fs/super.c:1152
>        vfs_get_tree+0x88/0x350 fs/super.c:1519
>        do_new_mount fs/namespace.c:3335 [inline]
>        path_mount+0x1492/0x1ed0 fs/namespace.c:3662
>        do_mount fs/namespace.c:3675 [inline]
>        __do_sys_mount fs/namespace.c:3884 [inline]
>        __se_sys_mount fs/namespace.c:3861 [inline]
>        __x64_sys_mount+0x293/0x310 fs/namespace.c:3861
>        do_syscall_x64 arch/x86/entry/common.c:50 [inline]
>        do_syscall_64+0x38/0xb0 arch/x86/entry/common.c:80
>        entry_SYSCALL_64_after_hwframe+0x63/0xcd
> 
> other info that might help us debug this:
> 
>  Possible unsafe locking scenario:
> 
>        CPU0                    CPU1
>        ----                    ----
>   rlock(&fi->i_xattr_sem);
>                                lock(&fi->i_sem);
>                                lock(&fi->i_xattr_sem);
>   lock(&fi->i_sem);
> 
> Reported-and-tested-by: syzbot+e5600587fa9cbf8e3826@syzkaller.appspotmail.com
> Fixes: 5eda1ad1aaff "f2fs: fix deadlock in i_xattr_sem and inode page lock"
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Tested-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  fs/f2fs/f2fs.h   | 24 +++++++++++++++---------
>  fs/f2fs/inline.c |  3 ++-
>  2 files changed, 17 insertions(+), 10 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index c602ff2403b6..c0b7417f1d87 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -2122,15 +2122,6 @@ static inline int f2fs_down_read_trylock(struct f2fs_rwsem *sem)
>  	return down_read_trylock(&sem->internal_rwsem);
>  }
>  
> -#ifdef CONFIG_DEBUG_LOCK_ALLOC
> -static inline void f2fs_down_read_nested(struct f2fs_rwsem *sem, int subclass)
> -{
> -	down_read_nested(&sem->internal_rwsem, subclass);
> -}
> -#else
> -#define f2fs_down_read_nested(sem, subclass) f2fs_down_read(sem)
> -#endif
> -
>  static inline void f2fs_up_read(struct f2fs_rwsem *sem)
>  {
>  	up_read(&sem->internal_rwsem);
> @@ -2141,6 +2132,21 @@ static inline void f2fs_down_write(struct f2fs_rwsem *sem)
>  	down_write(&sem->internal_rwsem);
>  }
>  
> +#ifdef CONFIG_DEBUG_LOCK_ALLOC
> +static inline void f2fs_down_read_nested(struct f2fs_rwsem *sem, int subclass)
> +{
> +	down_read_nested(&sem->internal_rwsem, subclass);
> +}
> +
> +static inline void f2fs_down_write_nested(struct f2fs_rwsem *sem, int subclass)
> +{
> +	down_write_nested(&sem->internal_rwsem, subclass);
> +}
> +#else
> +#define f2fs_down_read_nested(sem, subclass) f2fs_down_read(sem)
> +#define f2fs_down_write_nested(sem, subclass) f2fs_down_write(sem)
> +#endif
> +
>  static inline int f2fs_down_write_trylock(struct f2fs_rwsem *sem)
>  {
>  	return down_write_trylock(&sem->internal_rwsem);
> diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
> index 4638fee16a91..0d185ad5e469 100644
> --- a/fs/f2fs/inline.c
> +++ b/fs/f2fs/inline.c
> @@ -641,7 +641,8 @@ int f2fs_add_inline_entry(struct inode *dir, const struct f2fs_filename *fname,
>  	}
>  
>  	if (inode) {
> -		f2fs_down_write(&F2FS_I(inode)->i_sem);
> +		f2fs_down_write_nested(&F2FS_I(inode)->i_sem,
> +						SINGLE_DEPTH_NESTING);
>  		page = f2fs_init_inode_metadata(inode, dir, fname, ipage);
>  		if (IS_ERR(page)) {
>  			err = PTR_ERR(page);
> -- 
> 2.42.0.rc1.204.g551eb34607-goog
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
