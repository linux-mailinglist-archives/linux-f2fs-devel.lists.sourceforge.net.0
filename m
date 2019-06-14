Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0501A451FD
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 14 Jun 2019 04:47:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hbcF7-0006CG-Qu; Fri, 14 Jun 2019 02:47:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1hbcF7-0006C9-0R
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 14 Jun 2019 02:47:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9y146KMXzWF0qfs+eMFzQDee3gKa2L+udjsilP6ujHo=; b=XohzgvU2xkoug3ZeMy5S/xRfsx
 5tFgEXPDTFwcqtPeq66ZuiujyJ+fxeVVfPGJHAjWxp9PXgYIcJCi0gF1dBpceAqAijT8GHUo+6c7/
 jQTQPA3L6vPaRKN9eND24JjEE3Snx203z5vbcW84HdsEVsPZCMepLaB+toPxjZ7nwBuM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9y146KMXzWF0qfs+eMFzQDee3gKa2L+udjsilP6ujHo=; b=STQpms4bxERTguFRcWKNTFgcSD
 cLJcCzwbhLkVkhfWGoC85wimtwKHvmEhCt5RBqvPuSNQ0cssXHJIm44ZWeGzwyeC8bBaaJXvmugle
 zieNKlc/VletLUHEHShevAlRvthyPullFnTDczBxLAOVqmIojbcLS+7Yv3fclFLvkPDk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hbcF3-006Dxl-Ti
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 14 Jun 2019 02:47:03 +0000
Received: from localhost (unknown [104.132.1.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2912020851;
 Fri, 14 Jun 2019 02:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560480416;
 bh=3vHYZXl6ouVNn5D/ruK3GqlESO2j6/ryohSfQ4JWHJE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uLXIRgKU2/GdDIMEFj6w5/s9k3Px87drBU2gAIjMBTUMfoQ6+VpKi1cSKaXlczeXc
 0tF6vMwgRj+wcJTfSAFUUe3pYErDFJXVuGv3DjX2MMBwxr5yZ21zaaA8oVQ4luGr6h
 ri9BGz5F0ktDaaYKdiNKT4N5g/g7oLjFNpxZBzVo=
Date: Thu, 13 Jun 2019 19:46:55 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20190614024655.GA18113@jaegeuk-macbookpro.roam.corp.google.com>
References: <20190530033115.16853-1-jaegeuk@kernel.org>
 <20190530175714.GB28719@jaegeuk-macbookpro.roam.corp.google.com>
 <20190604183619.GA8507@jaegeuk-macbookpro.roam.corp.google.com>
 <2afe0416-fe2d-8ba8-7625-0246aca9eba6@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2afe0416-fe2d-8ba8-7625-0246aca9eba6@huawei.com>
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
 0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hbcF3-006Dxl-Ti
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: add a rw_sem to cover quota flag
 changes
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

On 06/11, Chao Yu wrote:
> On 2019/6/5 2:36, Jaegeuk Kim wrote:
> > Two paths to update quota and f2fs_lock_op:
> > 
> > 1.
> >  - lock_op
> >  |  - quota_update
> >  `- unlock_op
> > 
> > 2.
> >  - quota_update
> >  - lock_op
> >  `- unlock_op
> > 
> > But, we need to make a transaction on quota_update + lock_op in #2 case.
> > So, this patch introduces:
> > 1. lock_op
> > 2. down_write
> > 3. check __need_flush
> > 4. up_write
> > 5. if there is dirty quota entries, flush them
> > 6. otherwise, good to go
> > 
> > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > ---
> > 
> > v3 from v2:
> >  - refactor to fix quota corruption issue
> >   : it seems that the previous scenario is not real and no deadlock case was
> >     encountered.
> 
> - f2fs_dquot_commit
>  - down_read(&sbi->quota_sem)
> 					- block_operation
> 					 - f2fs_lock_all
> 					  - need_flush_quota
> 					   - down_write(&sbi->quota_sem)
>   - f2fs_quota_write
>    - f2fs_lock_op
> 
> Why can't this happen?
> 
> Once more question, should we hold quota_sem during checkpoint to avoid further
> quota update? f2fs_lock_op can do this job as well?

I couldn't find write_dquot() call to make this happen, and f2fs_lock_op was not
enough to cover quota updates. Current stress & power-cut tests are running for
several days without problem with this patch.

> 
> Thanks,
> 
> > 
> >  fs/f2fs/checkpoint.c | 41 +++++++++++++++++++----------------------
> >  fs/f2fs/f2fs.h       |  1 +
> >  fs/f2fs/super.c      | 26 +++++++++++++++++++++-----
> >  3 files changed, 41 insertions(+), 27 deletions(-)
> > 
> > diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> > index 89825261d474..43f65f0962e5 100644
> > --- a/fs/f2fs/checkpoint.c
> > +++ b/fs/f2fs/checkpoint.c
> > @@ -1131,17 +1131,24 @@ static void __prepare_cp_block(struct f2fs_sb_info *sbi)
> >  
> >  static bool __need_flush_quota(struct f2fs_sb_info *sbi)
> >  {
> > +	bool ret = false;
> > +
> >  	if (!is_journalled_quota(sbi))
> >  		return false;
> > -	if (is_sbi_flag_set(sbi, SBI_QUOTA_SKIP_FLUSH))
> > -		return false;
> > -	if (is_sbi_flag_set(sbi, SBI_QUOTA_NEED_REPAIR))
> > -		return false;
> > -	if (is_sbi_flag_set(sbi, SBI_QUOTA_NEED_FLUSH))
> > -		return true;
> > -	if (get_pages(sbi, F2FS_DIRTY_QDATA))
> > -		return true;
> > -	return false;
> > +
> > +	down_write(&sbi->quota_sem);
> > +	if (is_sbi_flag_set(sbi, SBI_QUOTA_SKIP_FLUSH)) {
> > +		ret = false;
> > +	} else if (is_sbi_flag_set(sbi, SBI_QUOTA_NEED_REPAIR)) {
> > +		ret = false;
> > +	} else if (is_sbi_flag_set(sbi, SBI_QUOTA_NEED_FLUSH)) {
> > +		clear_sbi_flag(sbi, SBI_QUOTA_NEED_FLUSH);
> > +		ret = true;
> > +	} else if (get_pages(sbi, F2FS_DIRTY_QDATA)) {
> > +		ret = true;
> > +	}
> > +	up_write(&sbi->quota_sem);
> > +	return ret;
> >  }
> >  
> >  /*
> > @@ -1160,26 +1167,22 @@ static int block_operations(struct f2fs_sb_info *sbi)
> >  	blk_start_plug(&plug);
> >  
> >  retry_flush_quotas:
> > +	f2fs_lock_all(sbi);
> >  	if (__need_flush_quota(sbi)) {
> >  		int locked;
> >  
> >  		if (++cnt > DEFAULT_RETRY_QUOTA_FLUSH_COUNT) {
> >  			set_sbi_flag(sbi, SBI_QUOTA_SKIP_FLUSH);
> > -			f2fs_lock_all(sbi);
> > +			set_sbi_flag(sbi, SBI_QUOTA_NEED_FLUSH);
> >  			goto retry_flush_dents;
> >  		}
> > -		clear_sbi_flag(sbi, SBI_QUOTA_NEED_FLUSH);
> > +		f2fs_unlock_all(sbi);
> >  
> >  		/* only failed during mount/umount/freeze/quotactl */
> >  		locked = down_read_trylock(&sbi->sb->s_umount);
> >  		f2fs_quota_sync(sbi->sb, -1);
> >  		if (locked)
> >  			up_read(&sbi->sb->s_umount);
> > -	}
> > -
> > -	f2fs_lock_all(sbi);
> > -	if (__need_flush_quota(sbi)) {
> > -		f2fs_unlock_all(sbi);
> >  		cond_resched();
> >  		goto retry_flush_quotas;
> >  	}
> > @@ -1201,12 +1204,6 @@ static int block_operations(struct f2fs_sb_info *sbi)
> >  	 */
> >  	down_write(&sbi->node_change);
> >  
> > -	if (__need_flush_quota(sbi)) {
> > -		up_write(&sbi->node_change);
> > -		f2fs_unlock_all(sbi);
> > -		goto retry_flush_quotas;
> > -	}
> > -
> >  	if (get_pages(sbi, F2FS_DIRTY_IMETA)) {
> >  		up_write(&sbi->node_change);
> >  		f2fs_unlock_all(sbi);
> > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > index 9674a85154b2..9bd2bf0f559b 100644
> > --- a/fs/f2fs/f2fs.h
> > +++ b/fs/f2fs/f2fs.h
> > @@ -1253,6 +1253,7 @@ struct f2fs_sb_info {
> >  	block_t unusable_block_count;		/* # of blocks saved by last cp */
> >  
> >  	unsigned int nquota_files;		/* # of quota sysfile */
> > +	struct rw_semaphore quota_sem;		/* blocking cp for flags */
> >  
> >  	/* # of pages, see count_type */
> >  	atomic_t nr_pages[NR_COUNT_TYPE];
> > diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> > index 15d7e30bfc72..5a318399a2fa 100644
> > --- a/fs/f2fs/super.c
> > +++ b/fs/f2fs/super.c
> > @@ -1964,6 +1964,7 @@ int f2fs_quota_sync(struct super_block *sb, int type)
> >  	int cnt;
> >  	int ret;
> >  
> > +	down_read(&sbi->quota_sem);
> >  	ret = dquot_writeback_dquots(sb, type);
> >  	if (ret)
> >  		goto out;
> > @@ -2001,6 +2002,7 @@ int f2fs_quota_sync(struct super_block *sb, int type)
> >  out:
> >  	if (ret)
> >  		set_sbi_flag(F2FS_SB(sb), SBI_QUOTA_NEED_REPAIR);
> > +	up_read(&sbi->quota_sem);
> >  	return ret;
> >  }
> >  
> > @@ -2094,32 +2096,40 @@ static void f2fs_truncate_quota_inode_pages(struct super_block *sb)
> >  
> >  static int f2fs_dquot_commit(struct dquot *dquot)
> >  {
> > +	struct f2fs_sb_info *sbi = F2FS_SB(dquot->dq_sb);
> >  	int ret;
> >  
> > +	down_read(&sbi->quota_sem);
> >  	ret = dquot_commit(dquot);
> >  	if (ret < 0)
> > -		set_sbi_flag(F2FS_SB(dquot->dq_sb), SBI_QUOTA_NEED_REPAIR);
> > +		set_sbi_flag(sbi, SBI_QUOTA_NEED_REPAIR);
> > +	up_read(&sbi->quota_sem);
> >  	return ret;
> >  }
> >  
> >  static int f2fs_dquot_acquire(struct dquot *dquot)
> >  {
> > +	struct f2fs_sb_info *sbi = F2FS_SB(dquot->dq_sb);
> >  	int ret;
> >  
> > +	down_read(&sbi->quota_sem);
> >  	ret = dquot_acquire(dquot);
> >  	if (ret < 0)
> > -		set_sbi_flag(F2FS_SB(dquot->dq_sb), SBI_QUOTA_NEED_REPAIR);
> > -
> > +		set_sbi_flag(sbi, SBI_QUOTA_NEED_REPAIR);
> > +	up_read(&sbi->quota_sem);
> >  	return ret;
> >  }
> >  
> >  static int f2fs_dquot_release(struct dquot *dquot)
> >  {
> > +	struct f2fs_sb_info *sbi = F2FS_SB(dquot->dq_sb);
> >  	int ret;
> >  
> > +	down_read(&sbi->quota_sem);
> >  	ret = dquot_release(dquot);
> >  	if (ret < 0)
> > -		set_sbi_flag(F2FS_SB(dquot->dq_sb), SBI_QUOTA_NEED_REPAIR);
> > +		set_sbi_flag(sbi, SBI_QUOTA_NEED_REPAIR);
> > +	up_read(&sbi->quota_sem);
> >  	return ret;
> >  }
> >  
> > @@ -2129,22 +2139,27 @@ static int f2fs_dquot_mark_dquot_dirty(struct dquot *dquot)
> >  	struct f2fs_sb_info *sbi = F2FS_SB(sb);
> >  	int ret;
> >  
> > +	down_read(&sbi->quota_sem);
> >  	ret = dquot_mark_dquot_dirty(dquot);
> >  
> >  	/* if we are using journalled quota */
> >  	if (is_journalled_quota(sbi))
> >  		set_sbi_flag(sbi, SBI_QUOTA_NEED_FLUSH);
> >  
> > +	up_read(&sbi->quota_sem);
> >  	return ret;
> >  }
> >  
> >  static int f2fs_dquot_commit_info(struct super_block *sb, int type)
> >  {
> > +	struct f2fs_sb_info *sbi = F2FS_SB(sb);
> >  	int ret;
> >  
> > +	down_read(&sbi->quota_sem);
> >  	ret = dquot_commit_info(sb, type);
> >  	if (ret < 0)
> > -		set_sbi_flag(F2FS_SB(sb), SBI_QUOTA_NEED_REPAIR);
> > +		set_sbi_flag(sbi, SBI_QUOTA_NEED_REPAIR);
> > +	up_read(&sbi->quota_sem);
> >  	return ret;
> >  }
> >  
> > @@ -3253,6 +3268,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
> >  	}
> >  
> >  	init_rwsem(&sbi->cp_rwsem);
> > +	init_rwsem(&sbi->quota_sem);
> >  	init_waitqueue_head(&sbi->cp_wait);
> >  	init_sb_info(sbi);
> >  
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
