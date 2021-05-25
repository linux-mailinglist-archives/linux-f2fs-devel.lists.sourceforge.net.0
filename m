Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4381A3902AC
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 May 2021 15:42:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1llXKQ-0007ay-P7; Tue, 25 May 2021 13:42:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jack@suse.cz>) id 1llXKO-0007aV-TH
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 25 May 2021 13:42:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/Z36aQZqwaBYtQ3VW7FWlGBe3yKaHUC3moF1TjtA7GY=; b=k1YHWYRH598gp/7HvZxIOLCFnk
 mJeolFVO2z+YVfY3sj74pJsLQJ56a0kWEIAkLCL5u1Q+8c5tie7nCTLx83nTpVyp7rguX0iKltt4r
 eOs8XiFQ7KaSxaST+lOyOHPMsWXoUtBrGI3VSUr5C1Zq7WFIxX00X5Ri4lB9uOUhtkw0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/Z36aQZqwaBYtQ3VW7FWlGBe3yKaHUC3moF1TjtA7GY=; b=MzwjSwMicoFvnBrSiJ6OBI7OFb
 ZwTajBz43BNn7lP6B4D/jhygghbeH5+ZltVJzRuF+JJ1NIgdXaAqCxnGkxngwp/QsSa0ZKXcE98eO
 flh9G7jVD8YRqtX8oZ4wsyYnCIRb8Cn/zcQkbyUodfFIDjlhHZ75xz3s636CUmJOYb4M=;
Received: from mx2.suse.de ([195.135.220.15])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1llXKG-005N4K-7P
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 25 May 2021 13:42:37 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1621950140; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/Z36aQZqwaBYtQ3VW7FWlGBe3yKaHUC3moF1TjtA7GY=;
 b=hlOrsPO9xQfFvIjxg8Vj0wT+685SXdP6jeSD8DcDK2iuqDseCMxTZ5dLs+NwWZ31DeStkj
 JmLBAFSdwFcvHmPGN8Nwy9rWbSm+1R+PC9JpcIXHz13ZUXmP12I+6Kux6t4XB4n4xylkLe
 HHJGiooUDlEHSbW5uZPg4JEn5dz5zcs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1621950140;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/Z36aQZqwaBYtQ3VW7FWlGBe3yKaHUC3moF1TjtA7GY=;
 b=m9n6zPeY6xxEwd45SOni6kDSQo8meP40FpOMy7N3GefhjmXSVQ2vOjeBFKYNUhcHUTrFVf
 acinA4a1ywwp8qDA==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4D04CAB71;
 Tue, 25 May 2021 13:42:20 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 13DF71F2C98; Tue, 25 May 2021 15:42:20 +0200 (CEST)
Date: Tue, 25 May 2021 15:42:20 +0200
From: Jan Kara <jack@suse.cz>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20210525134220.GE4112@quack2.suse.cz>
References: <20210525113909.113486-1-yuchao0@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210525113909.113486-1-yuchao0@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [195.135.220.15 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1llXKG-005N4K-7P
Subject: Re: [f2fs-dev] [PATCH] f2fs: avoid attaching SB_ACTIVE flag during
 mount/remount
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
Cc: Jan Kara <jack@suse.cz>, Zhang Yi <yi.zhang@huawei.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue 25-05-21 19:39:09, Chao Yu wrote:
> Quoted from [1]
> 
> "I do remember that I've added this code back then because otherwise
> orphan cleanup was losing updates to quota files. But you're right
> that now I don't see how that could be happening and it would be nice
> if we could get rid of this hack"
> 
> [1] https://lore.kernel.org/linux-ext4/99cce8ca-e4a0-7301-840f-2ace67c551f3@huawei.com/T/#m04990cfbc4f44592421736b504afcc346b2a7c00
> 
> Related fix in ext4 by
> commit 72ffb49a7b62 ("ext4: do not set SB_ACTIVE in ext4_orphan_cleanup()").
> 
> f2fs has the same hack implementation in
> - f2fs_recover_orphan_inodes()
> - f2fs_recover_fsync_data()
> - f2fs_disable_checkpoint()
> 
> Let's get rid of this hack as well in f2fs.
> 
> Cc: Zhang Yi <yi.zhang@huawei.com>
> Cc: Jan Kara <jack@suse.cz>
> Signed-off-by: Chao Yu <yuchao0@huawei.com>

Makes sense to me. You can add:

Acked-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/f2fs/checkpoint.c |  3 ---
>  fs/f2fs/recovery.c   |  8 ++------
>  fs/f2fs/super.c      | 11 ++++-------
>  3 files changed, 6 insertions(+), 16 deletions(-)
> 
> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> index 6c208108d69c..a578c7d13d81 100644
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@ -691,9 +691,6 @@ int f2fs_recover_orphan_inodes(struct f2fs_sb_info *sbi)
>  	}
>  
>  #ifdef CONFIG_QUOTA
> -	/* Needed for iput() to work correctly and not trash data */
> -	sbi->sb->s_flags |= SB_ACTIVE;
> -
>  	/*
>  	 * Turn on quotas which were not enabled for read-only mounts if
>  	 * filesystem has quota feature, so that they are updated correctly.
> diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
> index 4b2f7d1d5bf4..4cfe36fa41be 100644
> --- a/fs/f2fs/recovery.c
> +++ b/fs/f2fs/recovery.c
> @@ -782,8 +782,6 @@ int f2fs_recover_fsync_data(struct f2fs_sb_info *sbi, bool check_only)
>  	}
>  
>  #ifdef CONFIG_QUOTA
> -	/* Needed for iput() to work correctly and not trash data */
> -	sbi->sb->s_flags |= SB_ACTIVE;
>  	/* Turn on quotas so that they are updated correctly */
>  	quota_enabled = f2fs_enable_quota_files(sbi, s_flags & SB_RDONLY);
>  #endif
> @@ -811,10 +809,8 @@ int f2fs_recover_fsync_data(struct f2fs_sb_info *sbi, bool check_only)
>  	err = recover_data(sbi, &inode_list, &tmp_inode_list, &dir_list);
>  	if (!err)
>  		f2fs_bug_on(sbi, !list_empty(&inode_list));
> -	else {
> -		/* restore s_flags to let iput() trash data */
> -		sbi->sb->s_flags = s_flags;
> -	}
> +	else
> +		f2fs_bug_on(sbi, sbi->sb->s_flags & SB_ACTIVE);
>  skip:
>  	fix_curseg_write_pointer = !check_only || list_empty(&inode_list);
>  
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 0a77808ebb8f..e7bd983fbddc 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -1881,17 +1881,15 @@ static int f2fs_enable_quotas(struct super_block *sb);
>  
>  static int f2fs_disable_checkpoint(struct f2fs_sb_info *sbi)
>  {
> -	unsigned int s_flags = sbi->sb->s_flags;
>  	struct cp_control cpc;
>  	int err = 0;
>  	int ret;
>  	block_t unusable;
>  
> -	if (s_flags & SB_RDONLY) {
> +	if (sbi->sb->s_flags & SB_RDONLY) {
>  		f2fs_err(sbi, "checkpoint=disable on readonly fs");
>  		return -EINVAL;
>  	}
> -	sbi->sb->s_flags |= SB_ACTIVE;
>  
>  	f2fs_update_time(sbi, DISABLE_TIME);
>  
> @@ -1909,13 +1907,13 @@ static int f2fs_disable_checkpoint(struct f2fs_sb_info *sbi)
>  	ret = sync_filesystem(sbi->sb);
>  	if (ret || err) {
>  		err = ret ? ret : err;
> -		goto restore_flag;
> +		goto out;
>  	}
>  
>  	unusable = f2fs_get_unusable_blocks(sbi);
>  	if (f2fs_disable_cp_again(sbi, unusable)) {
>  		err = -EAGAIN;
> -		goto restore_flag;
> +		goto out;
>  	}
>  
>  	down_write(&sbi->gc_lock);
> @@ -1931,8 +1929,7 @@ static int f2fs_disable_checkpoint(struct f2fs_sb_info *sbi)
>  
>  out_unlock:
>  	up_write(&sbi->gc_lock);
> -restore_flag:
> -	sbi->sb->s_flags = s_flags;	/* Restore SB_RDONLY status */
> +out:
>  	return err;
>  }
>  
> -- 
> 2.29.2
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
