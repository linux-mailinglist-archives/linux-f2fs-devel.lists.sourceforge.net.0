Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F0FEE4C3FFE
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Feb 2022 09:23:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nNVsW-0008EN-9D; Fri, 25 Feb 2022 08:23:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <yebin10@huawei.com>) id 1nNVsS-0008EG-K8
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 25 Feb 2022 08:22:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:CC:References:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+XphK0clpI+XuvNN+aRRi1mqCtXCRQuNAAFRRX6hZlA=; b=e5gcxB6O3aJerZLd5BcR/AtN9A
 3at1pYUCoHFxMWj70kSYNtNUs9U0HWdcKqRIpHo+OjWBfLdJ4O8L36g2lDmCw+a7q2mc35Y1JrY9R
 +JeOX14ZRtDtQTQp1wbp6aLG74OXTTh3bWbP3kBTjNOUCVC2YZCVkDozraLFavjZvrMw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:CC:References:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+XphK0clpI+XuvNN+aRRi1mqCtXCRQuNAAFRRX6hZlA=; b=cgug1aXZdJ8391uLuVs+4jCoih
 LK4bIgXr7a39gy8gdv2mPp5/176LaxnVAcdIq6NWmrSVNADXbc4usvxyv1PVBPUe7K+d0uMGuSv2k
 H/jXwUn2WloI3Wsc547brpIWifIKJyQL6e2Bho2pQQeCTiKd1Y942w7jgWojOvEIANAM=;
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nNVsM-00EdBv-EV
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 25 Feb 2022 08:22:59 +0000
Received: from canpemm500010.china.huawei.com (unknown [172.30.72.55])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4K4jNj0l4mz9sHc;
 Fri, 25 Feb 2022 16:19:17 +0800 (CST)
Received: from [10.174.178.185] (10.174.178.185) by
 canpemm500010.china.huawei.com (7.192.105.118) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 25 Feb 2022 16:22:45 +0800
To: <tytso@mit.edu>, <adilger.kernel@dilger.ca>, <linux-ext4@vger.kernel.org>
References: <20220211093527.3335518-1-yebin10@huawei.com>
Message-ID: <621891D5.2070800@huawei.com>
Date: Fri, 25 Feb 2022 16:22:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:38.0) Gecko/20100101
 Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <20220211093527.3335518-1-yebin10@huawei.com>
X-Originating-IP: [10.174.178.185]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 canpemm500010.china.huawei.com (7.192.105.118)
X-CFilter-Loop: Reflected
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  ping... On 2022/2/11 17:35,
 Ye Bin wrote: > We inject IO error
 when rmdir non empty direcory, then got issue as follows: > step1: mkfs.ext4
 -F /dev/sda > step2: mount /dev/sda test > step3: cd test > [...] 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.189 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [45.249.212.189 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 T_SPF_TEMPERROR        SPF: test of record failed (temperror)
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1nNVsM-00EdBv-EV
Subject: Re: [f2fs-dev] [PATCH -next v2] ext4:fix file system corrupted when
 rmdir non empty directory with IO error
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
From: yebin via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: yebin <yebin10@huawei.com>
Cc: jack@suse.cz, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, lczerner@redhat.com,
 jaegeuk@kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

ping...
On 2022/2/11 17:35, Ye Bin wrote:
> We inject IO error when rmdir non empty direcory, then got issue as follows:
> step1: mkfs.ext4 -F /dev/sda
> step2: mount /dev/sda  test
> step3: cd test
> step4: mkdir -p 1/2
> step5: rmdir 1
> 	[  110.920551] ext4_empty_dir: inject fault
> 	[  110.921926] EXT4-fs warning (device sda): ext4_rmdir:3113: inode #12:
> 	comm rmdir: empty directory '1' has too many links (3)
> step6: cd ..
> step7: umount test
> step8: fsck.ext4 -f /dev/sda
> 	e2fsck 1.42.9 (28-Dec-2013)
> 	Pass 1: Checking inodes, blocks, and sizes
> 	Pass 2: Checking directory structure
> 	Entry '..' in .../??? (13) has deleted/unused inode 12.  Clear<y>? yes
> 	Pass 3: Checking directory connectivity
> 	Unconnected directory inode 13 (...)
> 	Connect to /lost+found<y>? yes
> 	Pass 4: Checking reference counts
> 	Inode 13 ref count is 3, should be 2.  Fix<y>? yes
> 	Pass 5: Checking group summary information
>
> 	/dev/sda: ***** FILE SYSTEM WAS MODIFIED *****
> 	/dev/sda: 12/131072 files (0.0% non-contiguous), 26157/524288 blocks
>
> ext4_rmdir
> 	if (!ext4_empty_dir(inode))
> 		goto end_rmdir;
> ext4_empty_dir
> 	bh = ext4_read_dirblock(inode, 0, DIRENT_HTREE);
> 	if (IS_ERR(bh))
> 		return true;
> Now if read directory block failed, 'ext4_empty_dir' will return true, assume
> directory is empty. Obviously, it will lead to above issue.
> To solve this issue, if read directory block failed 'ext4_empty_dir' just assume
> directory isn't empty. To avoid making things worse when file system is already
> corrupted, 'ext4_empty_dir' also assume directory isn't empty.
> To distinguish the error type, return the exact error code to the caller.
>
> Signed-off-by: Ye Bin <yebin10@huawei.com>
> ---
>   fs/crypto/policy.c      |  4 +---
>   fs/ext4/ext4.h          |  4 ++--
>   fs/ext4/inline.c        | 23 +++++++++++------------
>   fs/ext4/ioctl.c         |  5 ++---
>   fs/ext4/namei.c         | 27 +++++++++++++++------------
>   fs/f2fs/dir.c           |  8 ++++----
>   fs/f2fs/f2fs.h          |  2 +-
>   fs/f2fs/file.c          |  7 +++++--
>   fs/f2fs/namei.c         | 10 ++++------
>   fs/ubifs/crypto.c       |  4 ++--
>   include/linux/fscrypt.h |  2 +-
>   11 files changed, 48 insertions(+), 48 deletions(-)
>
> diff --git a/fs/crypto/policy.c b/fs/crypto/policy.c
> index ed3d623724cd..373945022bb6 100644
> --- a/fs/crypto/policy.c
> +++ b/fs/crypto/policy.c
> @@ -480,9 +480,7 @@ int fscrypt_ioctl_set_policy(struct file *filp, const void __user *arg)
>   			ret = -ENOTDIR;
>   		else if (IS_DEADDIR(inode))
>   			ret = -ENOENT;
> -		else if (!inode->i_sb->s_cop->empty_dir(inode))
> -			ret = -ENOTEMPTY;
> -		else
> +		else if (!(ret = inode->i_sb->s_cop->empty_dir(inode)))
>   			ret = set_encryption_policy(inode, &policy);
>   	} else if (ret == -EINVAL ||
>   		   (ret == 0 && !fscrypt_policies_equal(&policy,
> diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
> index bcd3b9bf8069..e799cc269f7f 100644
> --- a/fs/ext4/ext4.h
> +++ b/fs/ext4/ext4.h
> @@ -3087,7 +3087,7 @@ extern int ext4_generic_delete_entry(struct inode *dir,
>   				     void *entry_buf,
>   				     int buf_size,
>   				     int csum_size);
> -extern bool ext4_empty_dir(struct inode *inode);
> +extern int ext4_empty_dir(struct inode *inode);
>   
>   /* resize.c */
>   extern void ext4_kvfree_array_rcu(void *to_free);
> @@ -3623,7 +3623,7 @@ extern int ext4_delete_inline_entry(handle_t *handle,
>   				    struct ext4_dir_entry_2 *de_del,
>   				    struct buffer_head *bh,
>   				    int *has_inline_data);
> -extern bool empty_inline_dir(struct inode *dir, int *has_inline_data);
> +extern int empty_inline_dir(struct inode *dir, int *has_inline_data);
>   extern struct buffer_head *ext4_get_first_inline_block(struct inode *inode,
>   					struct ext4_dir_entry_2 **parent_de,
>   					int *retval);
> diff --git a/fs/ext4/inline.c b/fs/ext4/inline.c
> index e42941803605..c9b02127ff95 100644
> --- a/fs/ext4/inline.c
> +++ b/fs/ext4/inline.c
> @@ -1775,22 +1775,22 @@ ext4_get_inline_entry(struct inode *inode,
>   	return (struct ext4_dir_entry_2 *)(inline_pos + offset);
>   }
>   
> -bool empty_inline_dir(struct inode *dir, int *has_inline_data)
> +int empty_inline_dir(struct inode *dir, int *has_inline_data)
>   {
> -	int err, inline_size;
> +	int inline_size;
>   	struct ext4_iloc iloc;
>   	size_t inline_len;
>   	void *inline_pos;
>   	unsigned int offset;
>   	struct ext4_dir_entry_2 *de;
> -	bool ret = true;
> +	int ret = 0;
>   
> -	err = ext4_get_inode_loc(dir, &iloc);
> -	if (err) {
> -		EXT4_ERROR_INODE_ERR(dir, -err,
> +	ret = ext4_get_inode_loc(dir, &iloc);
> +	if (ret) {
> +		EXT4_ERROR_INODE_ERR(dir, -ret,
>   				     "error %d getting inode %lu block",
> -				     err, dir->i_ino);
> -		return true;
> +				     ret, dir->i_ino);
> +		return ret;
>   	}
>   
>   	down_read(&EXT4_I(dir)->xattr_sem);
> @@ -1804,7 +1804,7 @@ bool empty_inline_dir(struct inode *dir, int *has_inline_data)
>   		ext4_warning(dir->i_sb,
>   			     "bad inline directory (dir #%lu) - no `..'",
>   			     dir->i_ino);
> -		ret = true;
> +		ret = -EFSCORRUPTED;
>   		goto out;
>   	}
>   
> @@ -1823,16 +1823,15 @@ bool empty_inline_dir(struct inode *dir, int *has_inline_data)
>   				     dir->i_ino, le32_to_cpu(de->inode),
>   				     le16_to_cpu(de->rec_len), de->name_len,
>   				     inline_size);
> -			ret = true;
> +			ret = -EFSCORRUPTED;
>   			goto out;
>   		}
>   		if (le32_to_cpu(de->inode)) {
> -			ret = false;
> +			ret = -ENOTEMPTY;
>   			goto out;
>   		}
>   		offset += ext4_rec_len_from_disk(de->rec_len, inline_size);
>   	}
> -
>   out:
>   	up_read(&EXT4_I(dir)->xattr_sem);
>   	brelse(iloc.bh);
> diff --git a/fs/ext4/ioctl.c b/fs/ext4/ioctl.c
> index a8022c2c6a58..3845fd554249 100644
> --- a/fs/ext4/ioctl.c
> +++ b/fs/ext4/ioctl.c
> @@ -620,10 +620,9 @@ static int ext4_ioctl_setflags(struct inode *inode,
>   			goto flags_out;
>   		}
>   
> -		if (!ext4_empty_dir(inode)) {
> -			err = -ENOTEMPTY;
> +		err = ext4_empty_dir(inode);
> +		if (err)
>   			goto flags_out;
> -		}
>   	}
>   
>   	/*
> diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
> index 8cf0a924a49b..2862deb374f7 100644
> --- a/fs/ext4/namei.c
> +++ b/fs/ext4/namei.c
> @@ -2976,8 +2976,11 @@ static int ext4_mkdir(struct user_namespace *mnt_userns, struct inode *dir,
>   
>   /*
>    * routine to check that the specified directory is empty (for rmdir)
> + * return value:
> + * 0: directory is empty
> + * <0: error code
>    */
> -bool ext4_empty_dir(struct inode *inode)
> +int ext4_empty_dir(struct inode *inode)
>   {
>   	unsigned int offset;
>   	struct buffer_head *bh;
> @@ -2997,14 +3000,14 @@ bool ext4_empty_dir(struct inode *inode)
>   	if (inode->i_size < ext4_dir_rec_len(1, NULL) +
>   					ext4_dir_rec_len(2, NULL)) {
>   		EXT4_ERROR_INODE(inode, "invalid size");
> -		return true;
> +		return -EFSCORRUPTED;
>   	}
>   	/* The first directory block must not be a hole,
>   	 * so treat it as DIRENT_HTREE
>   	 */
>   	bh = ext4_read_dirblock(inode, 0, DIRENT_HTREE);
>   	if (IS_ERR(bh))
> -		return true;
> +		return PTR_ERR(bh);
>   
>   	de = (struct ext4_dir_entry_2 *) bh->b_data;
>   	if (ext4_check_dir_entry(inode, NULL, de, bh, bh->b_data, bh->b_size,
> @@ -3012,7 +3015,7 @@ bool ext4_empty_dir(struct inode *inode)
>   	    le32_to_cpu(de->inode) != inode->i_ino || strcmp(".", de->name)) {
>   		ext4_warning_inode(inode, "directory missing '.'");
>   		brelse(bh);
> -		return true;
> +		return -EFSCORRUPTED;
>   	}
>   	offset = ext4_rec_len_from_disk(de->rec_len, sb->s_blocksize);
>   	de = ext4_next_entry(de, sb->s_blocksize);
> @@ -3021,7 +3024,7 @@ bool ext4_empty_dir(struct inode *inode)
>   	    le32_to_cpu(de->inode) == 0 || strcmp("..", de->name)) {
>   		ext4_warning_inode(inode, "directory missing '..'");
>   		brelse(bh);
> -		return true;
> +		return -EFSCORRUPTED;
>   	}
>   	offset += ext4_rec_len_from_disk(de->rec_len, sb->s_blocksize);
>   	while (offset < inode->i_size) {
> @@ -3035,7 +3038,7 @@ bool ext4_empty_dir(struct inode *inode)
>   				continue;
>   			}
>   			if (IS_ERR(bh))
> -				return true;
> +				return PTR_ERR(bh);
>   		}
>   		de = (struct ext4_dir_entry_2 *) (bh->b_data +
>   					(offset & (sb->s_blocksize - 1)));
> @@ -3046,12 +3049,12 @@ bool ext4_empty_dir(struct inode *inode)
>   		}
>   		if (le32_to_cpu(de->inode)) {
>   			brelse(bh);
> -			return false;
> +			return -ENOTEMPTY;
>   		}
>   		offset += ext4_rec_len_from_disk(de->rec_len, sb->s_blocksize);
>   	}
>   	brelse(bh);
> -	return true;
> +	return 0;
>   }
>   
>   static int ext4_rmdir(struct inode *dir, struct dentry *dentry)
> @@ -3087,8 +3090,8 @@ static int ext4_rmdir(struct inode *dir, struct dentry *dentry)
>   	if (le32_to_cpu(de->inode) != inode->i_ino)
>   		goto end_rmdir;
>   
> -	retval = -ENOTEMPTY;
> -	if (!ext4_empty_dir(inode))
> +	retval = ext4_empty_dir(inode);
> +	if (retval)
>   		goto end_rmdir;
>   
>   	handle = ext4_journal_start(dir, EXT4_HT_DIR,
> @@ -3787,8 +3790,8 @@ static int ext4_rename(struct user_namespace *mnt_userns, struct inode *old_dir,
>   
>   	if (S_ISDIR(old.inode->i_mode)) {
>   		if (new.inode) {
> -			retval = -ENOTEMPTY;
> -			if (!ext4_empty_dir(new.inode))
> +			retval = ext4_empty_dir(new.inode);
> +			if (retval)
>   				goto end_rename;
>   		} else {
>   			retval = -EMLINK;
> diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
> index a0e51937d92e..3de5a1343070 100644
> --- a/fs/f2fs/dir.c
> +++ b/fs/f2fs/dir.c
> @@ -953,7 +953,7 @@ void f2fs_delete_entry(struct f2fs_dir_entry *dentry, struct page *page,
>   		f2fs_drop_nlink(dir, inode);
>   }
>   
> -bool f2fs_empty_dir(struct inode *dir)
> +int f2fs_empty_dir(struct inode *dir)
>   {
>   	unsigned long bidx;
>   	struct page *dentry_page;
> @@ -970,7 +970,7 @@ bool f2fs_empty_dir(struct inode *dir)
>   			if (PTR_ERR(dentry_page) == -ENOENT)
>   				continue;
>   			else
> -				return false;
> +				return PTR_ERR(dentry_page);
>   		}
>   
>   		dentry_blk = page_address(dentry_page);
> @@ -985,9 +985,9 @@ bool f2fs_empty_dir(struct inode *dir)
>   		f2fs_put_page(dentry_page, 1);
>   
>   		if (bit_pos < NR_DENTRY_IN_BLOCK)
> -			return false;
> +			return -ENOTEMPTY;
>   	}
> -	return true;
> +	return 0;
>   }
>   
>   int f2fs_fill_dentries(struct dir_context *ctx, struct f2fs_dentry_ptr *d,
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 5c30a65467e2..09617d7b37fd 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -3465,7 +3465,7 @@ int f2fs_do_add_link(struct inode *dir, const struct qstr *name,
>   void f2fs_delete_entry(struct f2fs_dir_entry *dentry, struct page *page,
>   			struct inode *dir, struct inode *inode);
>   int f2fs_do_tmpfile(struct inode *inode, struct inode *dir);
> -bool f2fs_empty_dir(struct inode *dir);
> +int f2fs_empty_dir(struct inode *dir);
>   
>   static inline int f2fs_add_link(struct dentry *dentry, struct inode *inode)
>   {
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index cfdc41f87f5d..a3b60d6a58f7 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -1846,10 +1846,13 @@ static int f2fs_setflags_common(struct inode *inode, u32 iflags, u32 mask)
>   		return -EPERM;
>   
>   	if ((iflags ^ masked_flags) & F2FS_CASEFOLD_FL) {
> +		int ret;
> +
>   		if (!f2fs_sb_has_casefold(F2FS_I_SB(inode)))
>   			return -EOPNOTSUPP;
> -		if (!f2fs_empty_dir(inode))
> -			return -ENOTEMPTY;
> +		ret = f2fs_empty_dir(inode);
> +		if (ret)
> +			return ret;
>   	}
>   
>   	if (iflags & (F2FS_COMPR_FL | F2FS_NOCOMP_FL)) {
> diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
> index 13a0ffc39fa4..e4d1821b707b 100644
> --- a/fs/f2fs/namei.c
> +++ b/fs/f2fs/namei.c
> @@ -786,10 +786,10 @@ static int f2fs_mkdir(struct user_namespace *mnt_userns, struct inode *dir,
>   static int f2fs_rmdir(struct inode *dir, struct dentry *dentry)
>   {
>   	struct inode *inode = d_inode(dentry);
> +	int ret;
>   
> -	if (f2fs_empty_dir(inode))
> -		return f2fs_unlink(dir, dentry);
> -	return -ENOTEMPTY;
> +	ret = f2fs_empty_dir(inode);
> +	return ret ? : f2fs_unlink(dir, dentry);
>   }
>   
>   static int f2fs_mknod(struct user_namespace *mnt_userns, struct inode *dir,
> @@ -1001,9 +1001,7 @@ static int f2fs_rename(struct user_namespace *mnt_userns, struct inode *old_dir,
>   	}
>   
>   	if (new_inode) {
> -
> -		err = -ENOTEMPTY;
> -		if (old_dir_entry && !f2fs_empty_dir(new_inode))
> +		if (old_dir_entry && (err = f2fs_empty_dir(new_inode)))
>   			goto out_dir;
>   
>   		err = -ENOENT;
> diff --git a/fs/ubifs/crypto.c b/fs/ubifs/crypto.c
> index c57b46a352d8..3ef2017c1444 100644
> --- a/fs/ubifs/crypto.c
> +++ b/fs/ubifs/crypto.c
> @@ -19,9 +19,9 @@ static int ubifs_crypt_set_context(struct inode *inode, const void *ctx,
>   			       ctx, len, 0, false);
>   }
>   
> -static bool ubifs_crypt_empty_dir(struct inode *inode)
> +static int ubifs_crypt_empty_dir(struct inode *inode)
>   {
> -	return ubifs_check_dir_empty(inode) == 0;
> +	return ubifs_check_dir_empty(inode);
>   }
>   
>   int ubifs_encrypt(const struct inode *inode, struct ubifs_data_node *dn,
> diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
> index 91ea9477e9bd..9d3b8df3f5ea 100644
> --- a/include/linux/fscrypt.h
> +++ b/include/linux/fscrypt.h
> @@ -116,7 +116,7 @@ struct fscrypt_operations {
>   	/*
>   	 * Check whether a directory is empty.  i_rwsem will be held for write.
>   	 */
> -	bool (*empty_dir)(struct inode *inode);
> +	int (*empty_dir)(struct inode *inode);
>   
>   	/*
>   	 * Check whether the filesystem's inode numbers and UUID are stable,



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
