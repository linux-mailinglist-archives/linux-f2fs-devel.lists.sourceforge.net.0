Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3667F749A75
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  6 Jul 2023 13:19:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qHN0i-0007MP-Ez;
	Thu, 06 Jul 2023 11:18:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1qHN0e-0007M5-2G
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Jul 2023 11:18:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bNWOwCeijVQu39TCNyMx4jDcCgDMzhDDr3Benyw4k+c=; b=JxEJKVOmTvFq3hJTNOfNYQ4nSq
 ajMn5F7MDRcB7uhGSmSbHgs2MOTkbPBQbJyrQuZAn/X+WckgJhbTZhwOdlXaDakqGLMO/dT0MMF0+
 YkKeSICuEesgDHfI4Q7dSTtX2eDHNiVzNNaERuc+/+Yu4wgOOMezorVQB2pQYw5n4tK4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bNWOwCeijVQu39TCNyMx4jDcCgDMzhDDr3Benyw4k+c=; b=j/l3nyi4OHVXXRIuzjEqFYOmpw
 W3L7YSuDKrDtnnm9c5/JInbJ5maOWzTt7sqS8+Yh4tWzCprX9x8xyE4ZlESE78coHtRHMOT7HINu2
 UvHPxhcUs/Oa19Ef1Gh6lVRienBPiPD/lgDF4Wd1dtTsVVYnO6dGK1FyzBw2sQBFCFfc=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qHN0L-000631-JF for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Jul 2023 11:18:51 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 71673221FB;
 Thu,  6 Jul 2023 11:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1688642302; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bNWOwCeijVQu39TCNyMx4jDcCgDMzhDDr3Benyw4k+c=;
 b=Eg0QKvvkQky9Z832ffpoReMmbeBkIYwy5MVEGVAdUe08eUSoq8kPo1/GkiOXRVTcdpemL4
 S3uPOOVpffY4d5dAFkkMbEcu1vE24AvZrsFhG190l2J5/GBJA9tFe0sWGZssNfZVPQGQ4z
 GXMgz4KNn/ZLJF4VYdK/1YSXQvC1oDs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1688642302;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bNWOwCeijVQu39TCNyMx4jDcCgDMzhDDr3Benyw4k+c=;
 b=d22fZVRVWnbY397E8l6JYaZcioXg23kocjG2dGvbTJkbSJet3cKa/Y4m2qaYPtUmG3J8Ps
 7auhB3BuUmK6VsBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 60F74138EE;
 Thu,  6 Jul 2023 11:18:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QC2mF/6ipmQXEgAAMHmgww
 (envelope-from <jack@suse.cz>); Thu, 06 Jul 2023 11:18:22 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id EDC3BA0707; Thu,  6 Jul 2023 13:18:21 +0200 (CEST)
Date: Thu, 6 Jul 2023 13:18:21 +0200
From: Jan Kara <jack@suse.cz>
To: Jeff Layton <jlayton@kernel.org>
Message-ID: <20230706111821.754meunnkqb6xuyl@quack3>
References: <20230705185755.579053-1-jlayton@kernel.org>
 <20230705190309.579783-1-jlayton@kernel.org>
 <20230705190309.579783-41-jlayton@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230705190309.579783-41-jlayton@kernel.org>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed 05-07-23 15:01:08,
 Jeff Layton wrote: > In later patches, 
 we're going to change how the inode's ctime field is > used. Switch to using
 accessor functions instead of raw accesses of > inode->i_c [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.28 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qHN0L-000631-JF
Subject: Re: [f2fs-dev] [PATCH v2 43/92] f2fs: convert to ctime accessor
 functions
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
Cc: Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Al Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed 05-07-23 15:01:08, Jeff Layton wrote:
> In later patches, we're going to change how the inode's ctime field is
> used. Switch to using accessor functions instead of raw accesses of
> inode->i_ctime.
> 
> Signed-off-by: Jeff Layton <jlayton@kernel.org>

Looks good to me. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/f2fs/dir.c      |  8 ++++----
>  fs/f2fs/f2fs.h     |  4 +++-
>  fs/f2fs/file.c     | 20 ++++++++++----------
>  fs/f2fs/inline.c   |  2 +-
>  fs/f2fs/inode.c    | 10 +++++-----
>  fs/f2fs/namei.c    | 12 ++++++------
>  fs/f2fs/recovery.c |  4 ++--
>  fs/f2fs/super.c    |  2 +-
>  fs/f2fs/xattr.c    |  2 +-
>  9 files changed, 33 insertions(+), 31 deletions(-)
> 
> diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
> index d635c58cf5a3..8aa29fe2e87b 100644
> --- a/fs/f2fs/dir.c
> +++ b/fs/f2fs/dir.c
> @@ -455,7 +455,7 @@ void f2fs_set_link(struct inode *dir, struct f2fs_dir_entry *de,
>  	de->file_type = fs_umode_to_ftype(inode->i_mode);
>  	set_page_dirty(page);
>  
> -	dir->i_mtime = dir->i_ctime = current_time(dir);
> +	dir->i_mtime = inode_set_ctime_current(dir);
>  	f2fs_mark_inode_dirty_sync(dir, false);
>  	f2fs_put_page(page, 1);
>  }
> @@ -609,7 +609,7 @@ void f2fs_update_parent_metadata(struct inode *dir, struct inode *inode,
>  			f2fs_i_links_write(dir, true);
>  		clear_inode_flag(inode, FI_NEW_INODE);
>  	}
> -	dir->i_mtime = dir->i_ctime = current_time(dir);
> +	dir->i_mtime = inode_set_ctime_current(dir);
>  	f2fs_mark_inode_dirty_sync(dir, false);
>  
>  	if (F2FS_I(dir)->i_current_depth != current_depth)
> @@ -858,7 +858,7 @@ void f2fs_drop_nlink(struct inode *dir, struct inode *inode)
>  
>  	if (S_ISDIR(inode->i_mode))
>  		f2fs_i_links_write(dir, false);
> -	inode->i_ctime = current_time(inode);
> +	inode_set_ctime_current(inode);
>  
>  	f2fs_i_links_write(inode, false);
>  	if (S_ISDIR(inode->i_mode)) {
> @@ -919,7 +919,7 @@ void f2fs_delete_entry(struct f2fs_dir_entry *dentry, struct page *page,
>  	}
>  	f2fs_put_page(page, 1);
>  
> -	dir->i_ctime = dir->i_mtime = current_time(dir);
> +	dir->i_mtime = inode_set_ctime_current(dir);
>  	f2fs_mark_inode_dirty_sync(dir, false);
>  
>  	if (inode)
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index c7cb2177b252..e18272ae3119 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -3303,9 +3303,11 @@ static inline void clear_file(struct inode *inode, int type)
>  
>  static inline bool f2fs_is_time_consistent(struct inode *inode)
>  {
> +	struct timespec64 ctime = inode_get_ctime(inode);
> +
>  	if (!timespec64_equal(F2FS_I(inode)->i_disk_time, &inode->i_atime))
>  		return false;
> -	if (!timespec64_equal(F2FS_I(inode)->i_disk_time + 1, &inode->i_ctime))
> +	if (!timespec64_equal(F2FS_I(inode)->i_disk_time + 1, &ctime))
>  		return false;
>  	if (!timespec64_equal(F2FS_I(inode)->i_disk_time + 2, &inode->i_mtime))
>  		return false;
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 093039dee992..b018800223c4 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -794,7 +794,7 @@ int f2fs_truncate(struct inode *inode)
>  	if (err)
>  		return err;
>  
> -	inode->i_mtime = inode->i_ctime = current_time(inode);
> +	inode->i_mtime = inode_set_ctime_current(inode);
>  	f2fs_mark_inode_dirty_sync(inode, false);
>  	return 0;
>  }
> @@ -905,7 +905,7 @@ static void __setattr_copy(struct mnt_idmap *idmap,
>  	if (ia_valid & ATTR_MTIME)
>  		inode->i_mtime = attr->ia_mtime;
>  	if (ia_valid & ATTR_CTIME)
> -		inode->i_ctime = attr->ia_ctime;
> +		inode_set_ctime_to_ts(inode, attr->ia_ctime);
>  	if (ia_valid & ATTR_MODE) {
>  		umode_t mode = attr->ia_mode;
>  		vfsgid_t vfsgid = i_gid_into_vfsgid(idmap, inode);
> @@ -1008,7 +1008,7 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
>  			return err;
>  
>  		spin_lock(&F2FS_I(inode)->i_size_lock);
> -		inode->i_mtime = inode->i_ctime = current_time(inode);
> +		inode->i_mtime = inode_set_ctime_current(inode);
>  		F2FS_I(inode)->last_disk_size = i_size_read(inode);
>  		spin_unlock(&F2FS_I(inode)->i_size_lock);
>  	}
> @@ -1835,7 +1835,7 @@ static long f2fs_fallocate(struct file *file, int mode,
>  	}
>  
>  	if (!ret) {
> -		inode->i_mtime = inode->i_ctime = current_time(inode);
> +		inode->i_mtime = inode_set_ctime_current(inode);
>  		f2fs_mark_inode_dirty_sync(inode, false);
>  		f2fs_update_time(F2FS_I_SB(inode), REQ_TIME);
>  	}
> @@ -1937,7 +1937,7 @@ static int f2fs_setflags_common(struct inode *inode, u32 iflags, u32 mask)
>  	else
>  		clear_inode_flag(inode, FI_PROJ_INHERIT);
>  
> -	inode->i_ctime = current_time(inode);
> +	inode_set_ctime_current(inode);
>  	f2fs_set_inode_flags(inode);
>  	f2fs_mark_inode_dirty_sync(inode, true);
>  	return 0;
> @@ -2874,10 +2874,10 @@ static int f2fs_move_file_range(struct file *file_in, loff_t pos_in,
>  	if (ret)
>  		goto out_unlock;
>  
> -	src->i_mtime = src->i_ctime = current_time(src);
> +	src->i_mtime = inode_set_ctime_current(src);
>  	f2fs_mark_inode_dirty_sync(src, false);
>  	if (src != dst) {
> -		dst->i_mtime = dst->i_ctime = current_time(dst);
> +		dst->i_mtime = inode_set_ctime_current(dst);
>  		f2fs_mark_inode_dirty_sync(dst, false);
>  	}
>  	f2fs_update_time(sbi, REQ_TIME);
> @@ -3073,7 +3073,7 @@ static int f2fs_ioc_setproject(struct inode *inode, __u32 projid)
>  		goto out_unlock;
>  
>  	fi->i_projid = kprojid;
> -	inode->i_ctime = current_time(inode);
> +	inode_set_ctime_current(inode);
>  	f2fs_mark_inode_dirty_sync(inode, true);
>  out_unlock:
>  	f2fs_unlock_op(sbi);
> @@ -3511,7 +3511,7 @@ static int f2fs_release_compress_blocks(struct file *filp, unsigned long arg)
>  	}
>  
>  	set_inode_flag(inode, FI_COMPRESS_RELEASED);
> -	inode->i_ctime = current_time(inode);
> +	inode_set_ctime_current(inode);
>  	f2fs_mark_inode_dirty_sync(inode, true);
>  
>  	f2fs_down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
> @@ -3710,7 +3710,7 @@ static int f2fs_reserve_compress_blocks(struct file *filp, unsigned long arg)
>  
>  	if (ret >= 0) {
>  		clear_inode_flag(inode, FI_COMPRESS_RELEASED);
> -		inode->i_ctime = current_time(inode);
> +		inode_set_ctime_current(inode);
>  		f2fs_mark_inode_dirty_sync(inode, true);
>  	}
>  unlock_inode:
> diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
> index 4638fee16a91..88fc9208ffa7 100644
> --- a/fs/f2fs/inline.c
> +++ b/fs/f2fs/inline.c
> @@ -698,7 +698,7 @@ void f2fs_delete_inline_entry(struct f2fs_dir_entry *dentry, struct page *page,
>  	set_page_dirty(page);
>  	f2fs_put_page(page, 1);
>  
> -	dir->i_ctime = dir->i_mtime = current_time(dir);
> +	dir->i_mtime = inode_set_ctime_current(dir);
>  	f2fs_mark_inode_dirty_sync(dir, false);
>  
>  	if (inode)
> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> index 09e986b050c6..c1c2ba9f28e5 100644
> --- a/fs/f2fs/inode.c
> +++ b/fs/f2fs/inode.c
> @@ -403,7 +403,7 @@ static void init_idisk_time(struct inode *inode)
>  	struct f2fs_inode_info *fi = F2FS_I(inode);
>  
>  	fi->i_disk_time[0] = inode->i_atime;
> -	fi->i_disk_time[1] = inode->i_ctime;
> +	fi->i_disk_time[1] = inode_get_ctime(inode);
>  	fi->i_disk_time[2] = inode->i_mtime;
>  }
>  
> @@ -434,10 +434,10 @@ static int do_read_inode(struct inode *inode)
>  	inode->i_blocks = SECTOR_FROM_BLOCK(le64_to_cpu(ri->i_blocks) - 1);
>  
>  	inode->i_atime.tv_sec = le64_to_cpu(ri->i_atime);
> -	inode->i_ctime.tv_sec = le64_to_cpu(ri->i_ctime);
> +	inode_set_ctime(inode, le64_to_cpu(ri->i_ctime),
> +			le32_to_cpu(ri->i_ctime_nsec));
>  	inode->i_mtime.tv_sec = le64_to_cpu(ri->i_mtime);
>  	inode->i_atime.tv_nsec = le32_to_cpu(ri->i_atime_nsec);
> -	inode->i_ctime.tv_nsec = le32_to_cpu(ri->i_ctime_nsec);
>  	inode->i_mtime.tv_nsec = le32_to_cpu(ri->i_mtime_nsec);
>  	inode->i_generation = le32_to_cpu(ri->i_generation);
>  	if (S_ISDIR(inode->i_mode))
> @@ -714,10 +714,10 @@ void f2fs_update_inode(struct inode *inode, struct page *node_page)
>  	set_raw_inline(inode, ri);
>  
>  	ri->i_atime = cpu_to_le64(inode->i_atime.tv_sec);
> -	ri->i_ctime = cpu_to_le64(inode->i_ctime.tv_sec);
> +	ri->i_ctime = cpu_to_le64(inode_get_ctime(inode).tv_sec);
>  	ri->i_mtime = cpu_to_le64(inode->i_mtime.tv_sec);
>  	ri->i_atime_nsec = cpu_to_le32(inode->i_atime.tv_nsec);
> -	ri->i_ctime_nsec = cpu_to_le32(inode->i_ctime.tv_nsec);
> +	ri->i_ctime_nsec = cpu_to_le32(inode_get_ctime(inode).tv_nsec);
>  	ri->i_mtime_nsec = cpu_to_le32(inode->i_mtime.tv_nsec);
>  	if (S_ISDIR(inode->i_mode))
>  		ri->i_current_depth =
> diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
> index bee0568888da..193b22a2d6bf 100644
> --- a/fs/f2fs/namei.c
> +++ b/fs/f2fs/namei.c
> @@ -243,7 +243,7 @@ static struct inode *f2fs_new_inode(struct mnt_idmap *idmap,
>  
>  	inode->i_ino = ino;
>  	inode->i_blocks = 0;
> -	inode->i_mtime = inode->i_atime = inode->i_ctime = current_time(inode);
> +	inode->i_mtime = inode->i_atime = inode_set_ctime_current(inode);
>  	F2FS_I(inode)->i_crtime = inode->i_mtime;
>  	inode->i_generation = get_random_u32();
>  
> @@ -420,7 +420,7 @@ static int f2fs_link(struct dentry *old_dentry, struct inode *dir,
>  
>  	f2fs_balance_fs(sbi, true);
>  
> -	inode->i_ctime = current_time(inode);
> +	inode_set_ctime_current(inode);
>  	ihold(inode);
>  
>  	set_inode_flag(inode, FI_INC_LINK);
> @@ -1052,7 +1052,7 @@ static int f2fs_rename(struct mnt_idmap *idmap, struct inode *old_dir,
>  		f2fs_set_link(new_dir, new_entry, new_page, old_inode);
>  		new_page = NULL;
>  
> -		new_inode->i_ctime = current_time(new_inode);
> +		inode_set_ctime_current(new_inode);
>  		f2fs_down_write(&F2FS_I(new_inode)->i_sem);
>  		if (old_dir_entry)
>  			f2fs_i_links_write(new_inode, false);
> @@ -1086,7 +1086,7 @@ static int f2fs_rename(struct mnt_idmap *idmap, struct inode *old_dir,
>  		f2fs_i_pino_write(old_inode, new_dir->i_ino);
>  	f2fs_up_write(&F2FS_I(old_inode)->i_sem);
>  
> -	old_inode->i_ctime = current_time(old_inode);
> +	inode_set_ctime_current(old_inode);
>  	f2fs_mark_inode_dirty_sync(old_inode, false);
>  
>  	f2fs_delete_entry(old_entry, old_page, old_dir, NULL);
> @@ -1251,7 +1251,7 @@ static int f2fs_cross_rename(struct inode *old_dir, struct dentry *old_dentry,
>  		f2fs_i_pino_write(old_inode, new_dir->i_ino);
>  	f2fs_up_write(&F2FS_I(old_inode)->i_sem);
>  
> -	old_dir->i_ctime = current_time(old_dir);
> +	inode_set_ctime_current(old_dir);
>  	if (old_nlink) {
>  		f2fs_down_write(&F2FS_I(old_dir)->i_sem);
>  		f2fs_i_links_write(old_dir, old_nlink > 0);
> @@ -1270,7 +1270,7 @@ static int f2fs_cross_rename(struct inode *old_dir, struct dentry *old_dentry,
>  		f2fs_i_pino_write(new_inode, old_dir->i_ino);
>  	f2fs_up_write(&F2FS_I(new_inode)->i_sem);
>  
> -	new_dir->i_ctime = current_time(new_dir);
> +	inode_set_ctime_current(new_dir);
>  	if (new_nlink) {
>  		f2fs_down_write(&F2FS_I(new_dir)->i_sem);
>  		f2fs_i_links_write(new_dir, new_nlink > 0);
> diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
> index 4e7d4ceeb084..b8637e88d94f 100644
> --- a/fs/f2fs/recovery.c
> +++ b/fs/f2fs/recovery.c
> @@ -321,10 +321,10 @@ static int recover_inode(struct inode *inode, struct page *page)
>  
>  	f2fs_i_size_write(inode, le64_to_cpu(raw->i_size));
>  	inode->i_atime.tv_sec = le64_to_cpu(raw->i_atime);
> -	inode->i_ctime.tv_sec = le64_to_cpu(raw->i_ctime);
> +	inode_set_ctime(inode, le64_to_cpu(raw->i_ctime),
> +			le32_to_cpu(raw->i_ctime_nsec));
>  	inode->i_mtime.tv_sec = le64_to_cpu(raw->i_mtime);
>  	inode->i_atime.tv_nsec = le32_to_cpu(raw->i_atime_nsec);
> -	inode->i_ctime.tv_nsec = le32_to_cpu(raw->i_ctime_nsec);
>  	inode->i_mtime.tv_nsec = le32_to_cpu(raw->i_mtime_nsec);
>  
>  	F2FS_I(inode)->i_advise = raw->i_advise;
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index ca31163da00a..28aeffc0048c 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -2703,7 +2703,7 @@ static ssize_t f2fs_quota_write(struct super_block *sb, int type,
>  
>  	if (len == towrite)
>  		return err;
> -	inode->i_mtime = inode->i_ctime = current_time(inode);
> +	inode->i_mtime = inode_set_ctime_current(inode);
>  	f2fs_mark_inode_dirty_sync(inode, false);
>  	return len - towrite;
>  }
> diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
> index 476b186b90a6..4ae93e1df421 100644
> --- a/fs/f2fs/xattr.c
> +++ b/fs/f2fs/xattr.c
> @@ -764,7 +764,7 @@ static int __f2fs_setxattr(struct inode *inode, int index,
>  same:
>  	if (is_inode_flag_set(inode, FI_ACL_MODE)) {
>  		inode->i_mode = F2FS_I(inode)->i_acl_mode;
> -		inode->i_ctime = current_time(inode);
> +		inode_set_ctime_current(inode);
>  		clear_inode_flag(inode, FI_ACL_MODE);
>  	}
>  
> -- 
> 2.41.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
