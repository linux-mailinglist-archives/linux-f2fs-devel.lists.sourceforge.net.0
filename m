Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F1E3C55B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Jun 2019 09:46:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1habU8-0007jS-OJ; Tue, 11 Jun 2019 07:46:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1habU6-0007j3-SZ
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 Jun 2019 07:46:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VZBoz5z+klO62Xef53c8pG0v7IPxTpuPSJ+51XETAkk=; b=Due9IEGZh0Bb6XTXlOqlcxEfno
 SOCdy17wzuXlWjml2U/Yv9/Ood3H0DFhZNrgzQIq60RwMRGXuU63LATJaKa44h//E1sOl/i+nVuWo
 Z59bQud5FO3Ib9Y5VsLpoj9QsZHB6ORnpEYjbMMqJQ/2tK/mgB4qRXLX1zRmdqvAk9S0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VZBoz5z+klO62Xef53c8pG0v7IPxTpuPSJ+51XETAkk=; b=EqlO5/ISimp3ojKmtY8YQo9mDL
 Uc2A7ZR41rYyZYjL/xTmg71M4trGscp2rzlOacTaUwSc1pYeNlv63n2/0DcN9LAcoh8U5lr2P10Kk
 anyRxpyytWAQVmhzRtjfQAuXjBo3clfWgyp6HpJZEG/IqXneYT3oqAUthDO9PqE9fXCo=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1habU4-007Z9Q-Bu
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 Jun 2019 07:46:22 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id BBE85C45B3B1CCCB6600;
 Tue, 11 Jun 2019 15:46:10 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.209) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 11 Jun
 2019 15:46:05 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <20190530033115.16853-1-jaegeuk@kernel.org>
 <20190530175714.GB28719@jaegeuk-macbookpro.roam.corp.google.com>
 <20190604183619.GA8507@jaegeuk-macbookpro.roam.corp.google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <2afe0416-fe2d-8ba8-7625-0246aca9eba6@huawei.com>
Date: Tue, 11 Jun 2019 15:46:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190604183619.GA8507@jaegeuk-macbookpro.roam.corp.google.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1habU4-007Z9Q-Bu
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/6/5 2:36, Jaegeuk Kim wrote:
> Two paths to update quota and f2fs_lock_op:
> 
> 1.
>  - lock_op
>  |  - quota_update
>  `- unlock_op
> 
> 2.
>  - quota_update
>  - lock_op
>  `- unlock_op
> 
> But, we need to make a transaction on quota_update + lock_op in #2 case.
> So, this patch introduces:
> 1. lock_op
> 2. down_write
> 3. check __need_flush
> 4. up_write
> 5. if there is dirty quota entries, flush them
> 6. otherwise, good to go
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
> 
> v3 from v2:
>  - refactor to fix quota corruption issue
>   : it seems that the previous scenario is not real and no deadlock case was
>     encountered.

- f2fs_dquot_commit
 - down_read(&sbi->quota_sem)
					- block_operation
					 - f2fs_lock_all
					  - need_flush_quota
					   - down_write(&sbi->quota_sem)
  - f2fs_quota_write
   - f2fs_lock_op

Why can't this happen?

Once more question, should we hold quota_sem during checkpoint to avoid further
quota update? f2fs_lock_op can do this job as well?

Thanks,

> 
>  fs/f2fs/checkpoint.c | 41 +++++++++++++++++++----------------------
>  fs/f2fs/f2fs.h       |  1 +
>  fs/f2fs/super.c      | 26 +++++++++++++++++++++-----
>  3 files changed, 41 insertions(+), 27 deletions(-)
> 
> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> index 89825261d474..43f65f0962e5 100644
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@ -1131,17 +1131,24 @@ static void __prepare_cp_block(struct f2fs_sb_info *sbi)
>  
>  static bool __need_flush_quota(struct f2fs_sb_info *sbi)
>  {
> +	bool ret = false;
> +
>  	if (!is_journalled_quota(sbi))
>  		return false;
> -	if (is_sbi_flag_set(sbi, SBI_QUOTA_SKIP_FLUSH))
> -		return false;
> -	if (is_sbi_flag_set(sbi, SBI_QUOTA_NEED_REPAIR))
> -		return false;
> -	if (is_sbi_flag_set(sbi, SBI_QUOTA_NEED_FLUSH))
> -		return true;
> -	if (get_pages(sbi, F2FS_DIRTY_QDATA))
> -		return true;
> -	return false;
> +
> +	down_write(&sbi->quota_sem);
> +	if (is_sbi_flag_set(sbi, SBI_QUOTA_SKIP_FLUSH)) {
> +		ret = false;
> +	} else if (is_sbi_flag_set(sbi, SBI_QUOTA_NEED_REPAIR)) {
> +		ret = false;
> +	} else if (is_sbi_flag_set(sbi, SBI_QUOTA_NEED_FLUSH)) {
> +		clear_sbi_flag(sbi, SBI_QUOTA_NEED_FLUSH);
> +		ret = true;
> +	} else if (get_pages(sbi, F2FS_DIRTY_QDATA)) {
> +		ret = true;
> +	}
> +	up_write(&sbi->quota_sem);
> +	return ret;
>  }
>  
>  /*
> @@ -1160,26 +1167,22 @@ static int block_operations(struct f2fs_sb_info *sbi)
>  	blk_start_plug(&plug);
>  
>  retry_flush_quotas:
> +	f2fs_lock_all(sbi);
>  	if (__need_flush_quota(sbi)) {
>  		int locked;
>  
>  		if (++cnt > DEFAULT_RETRY_QUOTA_FLUSH_COUNT) {
>  			set_sbi_flag(sbi, SBI_QUOTA_SKIP_FLUSH);
> -			f2fs_lock_all(sbi);
> +			set_sbi_flag(sbi, SBI_QUOTA_NEED_FLUSH);
>  			goto retry_flush_dents;
>  		}
> -		clear_sbi_flag(sbi, SBI_QUOTA_NEED_FLUSH);
> +		f2fs_unlock_all(sbi);
>  
>  		/* only failed during mount/umount/freeze/quotactl */
>  		locked = down_read_trylock(&sbi->sb->s_umount);
>  		f2fs_quota_sync(sbi->sb, -1);
>  		if (locked)
>  			up_read(&sbi->sb->s_umount);
> -	}
> -
> -	f2fs_lock_all(sbi);
> -	if (__need_flush_quota(sbi)) {
> -		f2fs_unlock_all(sbi);
>  		cond_resched();
>  		goto retry_flush_quotas;
>  	}
> @@ -1201,12 +1204,6 @@ static int block_operations(struct f2fs_sb_info *sbi)
>  	 */
>  	down_write(&sbi->node_change);
>  
> -	if (__need_flush_quota(sbi)) {
> -		up_write(&sbi->node_change);
> -		f2fs_unlock_all(sbi);
> -		goto retry_flush_quotas;
> -	}
> -
>  	if (get_pages(sbi, F2FS_DIRTY_IMETA)) {
>  		up_write(&sbi->node_change);
>  		f2fs_unlock_all(sbi);
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 9674a85154b2..9bd2bf0f559b 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1253,6 +1253,7 @@ struct f2fs_sb_info {
>  	block_t unusable_block_count;		/* # of blocks saved by last cp */
>  
>  	unsigned int nquota_files;		/* # of quota sysfile */
> +	struct rw_semaphore quota_sem;		/* blocking cp for flags */
>  
>  	/* # of pages, see count_type */
>  	atomic_t nr_pages[NR_COUNT_TYPE];
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 15d7e30bfc72..5a318399a2fa 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -1964,6 +1964,7 @@ int f2fs_quota_sync(struct super_block *sb, int type)
>  	int cnt;
>  	int ret;
>  
> +	down_read(&sbi->quota_sem);
>  	ret = dquot_writeback_dquots(sb, type);
>  	if (ret)
>  		goto out;
> @@ -2001,6 +2002,7 @@ int f2fs_quota_sync(struct super_block *sb, int type)
>  out:
>  	if (ret)
>  		set_sbi_flag(F2FS_SB(sb), SBI_QUOTA_NEED_REPAIR);
> +	up_read(&sbi->quota_sem);
>  	return ret;
>  }
>  
> @@ -2094,32 +2096,40 @@ static void f2fs_truncate_quota_inode_pages(struct super_block *sb)
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
> @@ -2129,22 +2139,27 @@ static int f2fs_dquot_mark_dquot_dirty(struct dquot *dquot)
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
> @@ -3253,6 +3268,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
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
