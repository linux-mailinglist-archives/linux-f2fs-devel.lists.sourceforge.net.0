Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DFB2FCD8
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 30 May 2019 16:02:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hWLd8-0002H6-Gl; Thu, 30 May 2019 14:02:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1hWLd7-0002Gn-Bx
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 30 May 2019 14:02:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8nGjkNmBe+pIou5WBUY9uWWv86vqqH1c1srHU0wiZOo=; b=iPmLHKazinBZCYM34SK8ry5kie
 CvJD6wm6UYAp1zRjmja1/h9Ww7rBTEcquV2Fxi4DVeKIHkrdXozVmsGPV3rzHFx6WtIrnEQfojnVS
 4L6oAAsexEs4uIA4HO56ciesH6eSHw1YGjrNAeAs3J9EqK2i7vOB1DZRMG0yZgSYOj0U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8nGjkNmBe+pIou5WBUY9uWWv86vqqH1c1srHU0wiZOo=; b=grG6WW3Dr6Dp1EhPJK2nsEVaTv
 IrrXkd3tHudbDJCgyf6aDMwvzEd0iREWTFfTMTeAWoNRnKZ0U1/u1jIMbx9dYbVQ5lSXYiPFyX9tx
 3MywwfHgGC4UrsN2ZjGsfKSVJnk56g3ujCQ0Q/2Gf4/xHX9mjc9ytiOxCaItdePj1Kbo=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hWLd5-006NgO-VS
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 30 May 2019 14:02:05 +0000
Received: from [192.168.0.101] (unknown [58.212.135.189])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A059425A09;
 Thu, 30 May 2019 14:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559224918;
 bh=dxgLKyo8opa8cx62Gn4ueciBtQ7cpnCdaxk3jkJYS0c=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=DsmGlULR2oEWl1qar4mJJ9jWAeosF/eNOAJQpKu2K8xqugpP0/bHl8XN+Aqqqm52q
 /fh7hlO713/4tyhVPzCCnSrP/z9HgQNUKkaetvJZok5lwffufBiurAeLt44Et+fjhl
 CHts+kFjvSiPwYTRO2RRFWzAe+0BVMUXMtl4fPz0=
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20190530033115.16853-1-jaegeuk@kernel.org>
From: Chao Yu <chao@kernel.org>
Message-ID: <a7f6a65e-65c2-51bb-0c9a-84367ca04e44@kernel.org>
Date: Thu, 30 May 2019 22:01:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190530033115.16853-1-jaegeuk@kernel.org>
Content-Language: en-US
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
 -0.0 T_DKIMWL_WL_HIGH       DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hWLd5-006NgO-VS
Subject: Re: [f2fs-dev] [PATCH] f2fs: add a rw_sem to cover quota flag
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019-5-30 11:31, Jaegeuk Kim wrote:
> thread 1:                        thread 2:
> writeback                        checkpoint
> set QUOTA_NEED_FLUSH
>                                  clear QUOTA_NEED_FLUSH
> f2fs_dquot_commit
> dquot_commit
> clear_dquot_dirty
>                                  f2fs_quota_sync
>                                  dquot_writeback_dquots
> 				 nothing to commit
> commit_dqblk
> quota_write
> f2fs_quota_write
> waiting for f2fs_lock_op()
> 				 pass __need_flush_quota
>                                  (no F2FS_DIRTY_QDATA)

At a glance, will it cause deadlock:

- f2fs_dquot_commit
 - down_read(&sbi->quota_sem)
					- block_operation
					 - f2fs_lock_all
					  - need_flush_quota
					   - down_write(&sbi->quota_sem)
  - f2fs_quota_write
   - f2fs_lock_op

Thanks,

> 
> -> up-to-date quota is not written
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  fs/f2fs/checkpoint.c | 26 ++++++++++++++++----------
>  fs/f2fs/f2fs.h       |  1 +
>  fs/f2fs/super.c      | 27 ++++++++++++++++++++++-----
>  3 files changed, 39 insertions(+), 15 deletions(-)
> 
> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> index 89825261d474..cf3b15c963d2 100644
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@ -1131,17 +1131,23 @@ static void __prepare_cp_block(struct f2fs_sb_info *sbi)
>  
>  static bool __need_flush_quota(struct f2fs_sb_info *sbi)
>  {
> +	bool ret = false;
> +
> +	down_write(&sbi->quota_sem);
>  	if (!is_journalled_quota(sbi))
> -		return false;
> -	if (is_sbi_flag_set(sbi, SBI_QUOTA_SKIP_FLUSH))
> -		return false;
> -	if (is_sbi_flag_set(sbi, SBI_QUOTA_NEED_REPAIR))
> -		return false;
> -	if (is_sbi_flag_set(sbi, SBI_QUOTA_NEED_FLUSH))
> -		return true;
> -	if (get_pages(sbi, F2FS_DIRTY_QDATA))
> -		return true;
> -	return false;
> +		ret = false;
> +	else if (is_sbi_flag_set(sbi, SBI_QUOTA_SKIP_FLUSH))
> +		ret = false;
> +	else if (is_sbi_flag_set(sbi, SBI_QUOTA_NEED_REPAIR))
> +		ret = false;
> +	else if (is_sbi_flag_set(sbi, SBI_QUOTA_NEED_FLUSH))
> +		ret = true;
> +	else if (get_pages(sbi, F2FS_DIRTY_QDATA))
> +		ret = true;
> +	else
> +		ret = false;
> +	up_write(&sbi->quota_sem);
> +	return ret;
>  }
>  
>  /*
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 9b3d9977cd1e..692c0922f5b2 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1250,6 +1250,7 @@ struct f2fs_sb_info {
>  	block_t unusable_block_count;		/* # of blocks saved by last cp */
>  
>  	unsigned int nquota_files;		/* # of quota sysfile */
> +	struct rw_semaphore quota_sem;		/* blocking cp for flags */
>  
>  	/* # of pages, see count_type */
>  	atomic_t nr_pages[NR_COUNT_TYPE];
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 912e2619d581..5ddf5e97ee60 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -1944,7 +1944,10 @@ int f2fs_quota_sync(struct super_block *sb, int type)
>  	int cnt;
>  	int ret;
>  
> +	down_read(&sbi->quota_sem);
>  	ret = dquot_writeback_dquots(sb, type);
> +	up_read(&sbi->quota_sem);
> +
>  	if (ret)
>  		goto out;
>  
> @@ -2074,32 +2077,40 @@ static void f2fs_truncate_quota_inode_pages(struct super_block *sb)
>  
>  static int f2fs_dquot_commit(struct dquot *dquot)
>  {
> +	struct f2fs_sb_info *sbi = F2FS_SB(dquot->dq_sb);
>  	int ret;
>  
> +	down_read(&sbi->quota_sem);
>  	ret = dquot_commit(dquot);
>  	if (ret < 0)
> -		set_sbi_flag(F2FS_SB(dquot->dq_sb), SBI_QUOTA_NEED_REPAIR);
> +		set_sbi_flag(sbi, SBI_QUOTA_NEED_REPAIR);
> +	up_read(&sbi->quota_sem);
>  	return ret;
>  }
>  
>  static int f2fs_dquot_acquire(struct dquot *dquot)
>  {
> +	struct f2fs_sb_info *sbi = F2FS_SB(dquot->dq_sb);
>  	int ret;
>  
> +	down_read(&sbi->quota_sem);
>  	ret = dquot_acquire(dquot);
>  	if (ret < 0)
> -		set_sbi_flag(F2FS_SB(dquot->dq_sb), SBI_QUOTA_NEED_REPAIR);
> -
> +		set_sbi_flag(sbi, SBI_QUOTA_NEED_REPAIR);
> +	up_read(&sbi->quota_sem);
>  	return ret;
>  }
>  
>  static int f2fs_dquot_release(struct dquot *dquot)
>  {
> +	struct f2fs_sb_info *sbi = F2FS_SB(dquot->dq_sb);
>  	int ret;
>  
> +	down_read(&sbi->quota_sem);
>  	ret = dquot_release(dquot);
>  	if (ret < 0)
> -		set_sbi_flag(F2FS_SB(dquot->dq_sb), SBI_QUOTA_NEED_REPAIR);
> +		set_sbi_flag(sbi, SBI_QUOTA_NEED_REPAIR);
> +	up_read(&sbi->quota_sem);
>  	return ret;
>  }
>  
> @@ -2109,22 +2120,27 @@ static int f2fs_dquot_mark_dquot_dirty(struct dquot *dquot)
>  	struct f2fs_sb_info *sbi = F2FS_SB(sb);
>  	int ret;
>  
> +	down_read(&sbi->quota_sem);
>  	ret = dquot_mark_dquot_dirty(dquot);
>  
>  	/* if we are using journalled quota */
>  	if (is_journalled_quota(sbi))
>  		set_sbi_flag(sbi, SBI_QUOTA_NEED_FLUSH);
>  
> +	up_read(&sbi->quota_sem);
>  	return ret;
>  }
>  
>  static int f2fs_dquot_commit_info(struct super_block *sb, int type)
>  {
> +	struct f2fs_sb_info *sbi = F2FS_SB(sb);
>  	int ret;
>  
> +	down_read(&sbi->quota_sem);
>  	ret = dquot_commit_info(sb, type);
>  	if (ret < 0)
> -		set_sbi_flag(F2FS_SB(sb), SBI_QUOTA_NEED_REPAIR);
> +		set_sbi_flag(sbi, SBI_QUOTA_NEED_REPAIR);
> +	up_read(&sbi->quota_sem);
>  	return ret;
>  }
>  
> @@ -3233,6 +3249,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>  	}
>  
>  	init_rwsem(&sbi->cp_rwsem);
> +	init_rwsem(&sbi->quota_sem);
>  	init_waitqueue_head(&sbi->cp_wait);
>  	init_sb_info(sbi);
>  
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
