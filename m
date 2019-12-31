Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F9412D525
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 31 Dec 2019 01:07:16 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1im545-0005Rn-0E; Tue, 31 Dec 2019 00:07:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1im543-0005Rf-EG
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 31 Dec 2019 00:07:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fn0k4FdboOwMY/BxJuqJr2HlgBOr1VQSKKTaZ/hkBO0=; b=bhQtjpz/8U2S+wfS8RcXMtcAcX
 pfxN7Z7GpyJ8y7DaNTuYzlJQAhRwJHR0K450MntHtF3SZaKiS+c6rCqXaQdb35YAYfW4v5TXgnF10
 DP4ft9gI0MEF+GLBUuen0sOcvxx6db/q16KUMPIihCwFukfbNZcJPiiCvaZMhz7uywPM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fn0k4FdboOwMY/BxJuqJr2HlgBOr1VQSKKTaZ/hkBO0=; b=jtcolLZHsURc601lA4ncIVi7kL
 EQ6fSdcJ0LLv/EkWfvQZPnr7zkXm3GweUQiIDWKTDIJQX8SzkRiRsQ049RnaQS/NVzxcj7NI6TijM
 uEeB40t65CqwTiT3F7fwONKf424qtpLrxGGjbXMOQHySroMAofJWsFQ76WBD9FtNmIUk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1im53p-001m2P-0i
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 31 Dec 2019 00:07:11 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 88697206DB;
 Tue, 31 Dec 2019 00:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1577750806;
 bh=oLu9hvAP5JFqrtDYgPRnr6bZZXSB+S0Bj3Z5zHe9jyE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Mn6+5xUgh1+fVGzpjd9Aho8ty7N3eWgmuaU7YW9yVWUb/GMaMXg+8MWPGPa/WEQ5G
 6q8ImdWvVViVv0B4aRku6aQJQd/GuVjE8OYcx5yyiH5+MdTRyYFuIbYvoc3cu/IYU8
 ODkEdCHiNaNBkN+SrHsm4mVGejLR307KVnJejgFA=
Date: Mon, 30 Dec 2019 16:06:45 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20191231000645.GB77418@jaegeuk-macbookpro.roam.corp.google.com>
References: <20191218200947.20445-1-jaegeuk@kernel.org>
 <ed9a4733-9374-deae-8f70-d84a0ed686de@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ed9a4733-9374-deae-8f70-d84a0ed686de@huawei.com>
User-Agent: Mutt/1.8.2 (2017-04-18)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1im53p-001m2P-0i
Subject: Re: [f2fs-dev] [PATCH 1/4] f2fs: convert inline_dir early before
 starting rename
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 12/28, Chao Yu wrote:
> On 2019/12/19 4:09, Jaegeuk Kim wrote:
> > If we hit an error during rename, we'll get two dentries in different
> > directories.
> > 
> > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > ---
> >  fs/f2fs/f2fs.h   |  1 +
> >  fs/f2fs/inline.c | 30 ++++++++++++++++++++++++++++--
> >  fs/f2fs/namei.c  | 36 +++++++++++++-----------------------
> >  3 files changed, 42 insertions(+), 25 deletions(-)
> > 
> > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > index dbc20d33d0e1..8d64525743cb 100644
> > --- a/fs/f2fs/f2fs.h
> > +++ b/fs/f2fs/f2fs.h
> > @@ -3490,6 +3490,7 @@ void f2fs_truncate_inline_inode(struct inode *inode,
> >  int f2fs_read_inline_data(struct inode *inode, struct page *page);
> >  int f2fs_convert_inline_page(struct dnode_of_data *dn, struct page *page);
> >  int f2fs_convert_inline_inode(struct inode *inode);
> > +int f2fs_convert_inline_dir(struct inode *dir);
> >  int f2fs_write_inline_data(struct inode *inode, struct page *page);
> >  bool f2fs_recover_inline_data(struct inode *inode, struct page *npage);
> >  struct f2fs_dir_entry *f2fs_find_in_inline_dir(struct inode *dir,
> > diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
> > index 52f85ed07a15..f82c3d9cf333 100644
> > --- a/fs/f2fs/inline.c
> > +++ b/fs/f2fs/inline.c
> > @@ -530,7 +530,7 @@ static int f2fs_move_rehashed_dirents(struct inode *dir, struct page *ipage,
> >  	return err;
> >  }
> >  
> > -static int f2fs_convert_inline_dir(struct inode *dir, struct page *ipage,
> > +static int do_convert_inline_dir(struct inode *dir, struct page *ipage,
> >  							void *inline_dentry)
> >  {
> >  	if (!F2FS_I(dir)->i_dir_level)
> > @@ -539,6 +539,32 @@ static int f2fs_convert_inline_dir(struct inode *dir, struct page *ipage,
> >  		return f2fs_move_rehashed_dirents(dir, ipage, inline_dentry);
> >  }
> >  
> > +int f2fs_convert_inline_dir(struct inode *dir)
> > +{
> > +	struct f2fs_sb_info *sbi = F2FS_I_SB(dir);
> > +	struct page *ipage;
> > +	void *inline_dentry = NULL;
> > +	int err;
> > +
> > +	if (!f2fs_has_inline_dentry(dir))
> > +		return 0;
> > +
> > +	f2fs_lock_op(sbi);
> > +
> > +	ipage = f2fs_get_node_page(sbi, dir->i_ino);
> > +	if (IS_ERR(ipage))
> > +		return PTR_ERR(ipage);
> > +
> > +	inline_dentry = inline_data_addr(dir, ipage);
> > +
> > +	err = do_convert_inline_dir(dir, ipage, inline_dentry);
> > +	if (!err)
> > +		f2fs_put_page(ipage, 1);
> > +
> > +	f2fs_unlock_op(sbi);
> > +	return err;
> > +}
> > +
> >  int f2fs_add_inline_entry(struct inode *dir, const struct qstr *new_name,
> >  				const struct qstr *orig_name,
> >  				struct inode *inode, nid_t ino, umode_t mode)
> > @@ -562,7 +588,7 @@ int f2fs_add_inline_entry(struct inode *dir, const struct qstr *new_name,
> >  
> >  	bit_pos = f2fs_room_for_filename(d.bitmap, slots, d.max);
> >  	if (bit_pos >= d.max) {
> > -		err = f2fs_convert_inline_dir(dir, ipage, inline_dentry);
> > +		err = do_convert_inline_dir(dir, ipage, inline_dentry);
> >  		if (err)
> >  			return err;
> >  		err = -EAGAIN;
> > diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
> > index 5d9584281935..61615ab466c2 100644
> > --- a/fs/f2fs/namei.c
> > +++ b/fs/f2fs/namei.c
> > @@ -855,7 +855,6 @@ static int f2fs_rename(struct inode *old_dir, struct dentry *old_dentry,
> >  	struct f2fs_dir_entry *old_dir_entry = NULL;
> >  	struct f2fs_dir_entry *old_entry;
> >  	struct f2fs_dir_entry *new_entry;
> > -	bool is_old_inline = f2fs_has_inline_dentry(old_dir);
> >  	int err;
> >  
> >  	if (unlikely(f2fs_cp_error(sbi)))
> > @@ -868,6 +867,19 @@ static int f2fs_rename(struct inode *old_dir, struct dentry *old_dentry,
> >  			F2FS_I(old_dentry->d_inode)->i_projid)))
> >  		return -EXDEV;
> >  
> > +	/*
> > +	 * old entry and new entry can locate in the same inline
> > +	 * dentry in inode, when attaching new entry in inline dentry,
> > +	 * it could force inline dentry conversion, after that,
> > +	 * old_entry and old_page will point to wrong address, in
> > +	 * order to avoid this, let's do the check and update here.
> > +	 */
> 
> The comment is out-of-update here...
> 
> If there is enough room for the new dentry in old directory's inline space,
> how about just keeping inline dir state for old directory?

It'd work, but how can we deal with race conditions?

> 
> 
> ---
>  fs/f2fs/dir.c    | 14 ++++++++++++++
>  fs/f2fs/f2fs.h   |  4 +++-
>  fs/f2fs/inline.c | 22 +++++++++++++++++-----
>  fs/f2fs/namei.c  |  2 +-
>  4 files changed, 35 insertions(+), 7 deletions(-)
> 
> diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
> index c967cacf979e..b56f6060c1a6 100644
> --- a/fs/f2fs/dir.c
> +++ b/fs/f2fs/dir.c
> @@ -578,6 +578,20 @@ int f2fs_room_for_filename(const void *bitmap, int slots, int max_slots)
>  	goto next;
>  }
> 
> +bool f2fs_has_enough_room(struct inode *dir, struct page *ipage,
> +					struct fscrypt_name *fname)
> +{
> +	struct f2fs_dentry_ptr d;
> +	unsigned int bit_pos;
> +	int slots = GET_DENTRY_SLOTS(fname_len(fname));
> +
> +	make_dentry_ptr_inline(dir, &d, inline_data_addr(dir, ipage));
> +
> +	bit_pos = f2fs_room_for_filename(d.bitmap, slots, d.max);
> +
> +	return bit_pos < d.max;
> +}
> +
>  void f2fs_update_dentry(nid_t ino, umode_t mode, struct f2fs_dentry_ptr *d,
>  				const struct qstr *name, f2fs_hash_t name_hash,
>  				unsigned int bit_pos)
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 5d55cef66410..ce4ce33a40ce 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -3120,6 +3120,8 @@ ino_t f2fs_inode_by_name(struct inode *dir, const struct qstr *qstr,
>  			struct page **page);
>  void f2fs_set_link(struct inode *dir, struct f2fs_dir_entry *de,
>  			struct page *page, struct inode *inode);
> +bool f2fs_has_enough_room(struct inode *dir, struct page *ipage,
> +					struct fscrypt_name *fname);
>  void f2fs_update_dentry(nid_t ino, umode_t mode, struct f2fs_dentry_ptr *d,
>  			const struct qstr *name, f2fs_hash_t name_hash,
>  			unsigned int bit_pos);
> @@ -3662,7 +3664,7 @@ void f2fs_truncate_inline_inode(struct inode *inode,
>  int f2fs_read_inline_data(struct inode *inode, struct page *page);
>  int f2fs_convert_inline_page(struct dnode_of_data *dn, struct page *page);
>  int f2fs_convert_inline_inode(struct inode *inode);
> -int f2fs_convert_inline_dir(struct inode *dir);
> +int f2fs_try_convert_inline_dir(struct inode *dir, struct dentry *dentry);
>  int f2fs_write_inline_data(struct inode *inode, struct page *page);
>  bool f2fs_recover_inline_data(struct inode *inode, struct page *npage);
>  struct f2fs_dir_entry *f2fs_find_in_inline_dir(struct inode *dir,
> diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
> index f82c3d9cf333..4167e5408151 100644
> --- a/fs/f2fs/inline.c
> +++ b/fs/f2fs/inline.c
> @@ -539,28 +539,40 @@ static int do_convert_inline_dir(struct inode *dir, struct page *ipage,
>  		return f2fs_move_rehashed_dirents(dir, ipage, inline_dentry);
>  }
> 
> -int f2fs_convert_inline_dir(struct inode *dir)
> +int f2fs_try_convert_inline_dir(struct inode *dir, struct dentry *dentry)
>  {
>  	struct f2fs_sb_info *sbi = F2FS_I_SB(dir);
>  	struct page *ipage;
> +	struct fscrypt_name fname;
>  	void *inline_dentry = NULL;
> -	int err;
> +	int err = 0;
> 
>  	if (!f2fs_has_inline_dentry(dir))
>  		return 0;
> 
>  	f2fs_lock_op(sbi);
> 
> +	err = fscrypt_setup_filename(dir, &dentry->d_name, 0, &fname);
> +	if (err)
> +		goto out;
> +
>  	ipage = f2fs_get_node_page(sbi, dir->i_ino);
> -	if (IS_ERR(ipage))
> -		return PTR_ERR(ipage);
> +	if (IS_ERR(ipage)) {
> +		err = PTR_ERR(ipage);
> +		goto out;
> +	}
> +
> +	if (f2fs_has_enough_room(dir, ipage, &fname)) {
> +		f2fs_put_page(ipage, 1);
> +		goto out;
> +	}
> 
>  	inline_dentry = inline_data_addr(dir, ipage);
> 
>  	err = do_convert_inline_dir(dir, ipage, inline_dentry);
>  	if (!err)
>  		f2fs_put_page(ipage, 1);
> -
> +out:
>  	f2fs_unlock_op(sbi);
>  	return err;
>  }
> diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
> index 1daa54c8d8d8..856f0f984549 100644
> --- a/fs/f2fs/namei.c
> +++ b/fs/f2fs/namei.c
> @@ -927,7 +927,7 @@ static int f2fs_rename(struct inode *old_dir, struct dentry *old_dentry,
>  	 * order to avoid this, let's do the check and update here.
>  	 */
>  	if (old_dir == new_dir && !new_inode) {
> -		err = f2fs_convert_inline_dir(old_dir);
> +		err = f2fs_try_convert_inline_dir(old_dir, new_dentry);
>  		if (err)
>  			return err;
>  	}
> -- 
> 2.18.0.rc1
> 
> Thanks,
> 
> > +	if (old_dir == new_dir && !new_inode) {
> > +		err = f2fs_convert_inline_dir(old_dir);
> > +		if (err)
> > +			return err;
> > +	}
> > +
> >  	if (flags & RENAME_WHITEOUT) {
> >  		err = f2fs_create_whiteout(old_dir, &whiteout);
> >  		if (err)
> > @@ -954,28 +966,6 @@ static int f2fs_rename(struct inode *old_dir, struct dentry *old_dentry,
> >  
> >  		if (old_dir_entry)
> >  			f2fs_i_links_write(new_dir, true);
> > -
> > -		/*
> > -		 * old entry and new entry can locate in the same inline
> > -		 * dentry in inode, when attaching new entry in inline dentry,
> > -		 * it could force inline dentry conversion, after that,
> > -		 * old_entry and old_page will point to wrong address, in
> > -		 * order to avoid this, let's do the check and update here.
> > -		 */
> > -		if (is_old_inline && !f2fs_has_inline_dentry(old_dir)) {
> > -			f2fs_put_page(old_page, 0);
> > -			old_page = NULL;
> > -
> > -			old_entry = f2fs_find_entry(old_dir,
> > -						&old_dentry->d_name, &old_page);
> > -			if (!old_entry) {
> > -				err = -ENOENT;
> > -				if (IS_ERR(old_page))
> > -					err = PTR_ERR(old_page);
> > -				f2fs_unlock_op(sbi);
> > -				goto out_dir;
> > -			}
> > -		}
> >  	}
> >  
> >  	down_write(&F2FS_I(old_inode)->i_sem);
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
