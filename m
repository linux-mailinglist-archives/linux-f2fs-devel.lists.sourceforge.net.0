Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F7FAD7089
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Jun 2025 14:35:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sJbGf0k8FJnc3uxbn5XS/JPrOhSBfbmiJrfQtmdV5KI=; b=CazDtO8t8j6DSr8iqsLY9s9m3q
	nsAR1X7HNHaRE6ttoet5bEVLjORA16Xmaq9a1fHOeOXZSQsQIMU5Hby+e9+ijid5sYFnr62t1zf1r
	sMCPwadx2HPoIZ6RWCwfEgp1OVrK572CCBGKJKzvNXsY0CPyoRziqQmdDQGaQ5Jn3nDA=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uPh91-0003kG-Rn;
	Thu, 12 Jun 2025 12:34:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <wangzijie1@honor.com>) id 1uPh8z-0003k8-Dl
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Jun 2025 12:34:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iohpF5ELJ29xDg90Tw/Eh49hTnoa/7W5R7ngyBMeZC0=; b=UOWRieX6mjRI9USSzocv+luYgk
 USrkqDK6w58BXItNeI+8EFTS0MQdXfLffoT5+nR03YD4puS9y192djsrPZ4B6zNfPqxPExRQTgt/i
 EEhj8o9O9W8Ujf509qDsBzXeVNKx34MiXmD8ui2Ni77As6t51tMiqNwGHRyHO0KZR/aw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iohpF5ELJ29xDg90Tw/Eh49hTnoa/7W5R7ngyBMeZC0=; b=HDpuLl5t/X3eBPKbebkg6t8jUt
 RlhmGNML8+T5gb90HG3O9oBcXLsTX/oqBg0YibV0FUu5lmbXbnFV+s6W32qDK4AvARXAGkqQkEcbP
 icgw7LdY2QNj8l0lQzSOOOIgEAmWp04prQB+jS3BOv9bTGPThiU6JrTFC95Jyxv0Gl6g=;
Received: from mta20.honor.com ([81.70.206.69] helo=mta20.hihonor.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uPh8y-0005tE-CR for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Jun 2025 12:34:57 +0000
Received: from w001.hihonor.com (unknown [10.68.25.235])
 by mta20.hihonor.com (SkyGuard) with ESMTPS id 4bJ23T2ZqkzYkxQ8;
 Thu, 12 Jun 2025 20:32:21 +0800 (CST)
Received: from a011.hihonor.com (10.68.31.243) by w001.hihonor.com
 (10.68.25.235) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 12 Jun
 2025 20:34:44 +0800
Received: from localhost.localdomain (10.144.23.14) by a011.hihonor.com
 (10.68.31.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 12 Jun
 2025 20:34:44 +0800
From: wangzijie <wangzijie1@honor.com>
To: <linux-f2fs-devel@lists.sourceforge.net>
Date: Thu, 12 Jun 2025 20:34:44 +0800
Message-ID: <20250612123444.1779509-1-wangzijie1@honor.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <f1b9209e-c2fb-4a53-8d15-a3e42dea8bca@kernel.org>
References: <f1b9209e-c2fb-4a53-8d15-a3e42dea8bca@kernel.org>
MIME-Version: 1.0
X-Originating-IP: [10.144.23.14]
X-ClientProxiedBy: w011.hihonor.com (10.68.20.122) To a011.hihonor.com
 (10.68.31.243)
X-Spam-Score: 0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  > On 6/12/25 11:27, wangzijie wrote: > > Wu Bo once mentioned
 a fallocate fail scenario in this link[1]. > > After commit
 3fdd89b452c2("f2fs:
 prevent writing without fallocate() > > for pinned files") [...] 
 Content analysis details:   (0.4 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.4 KHOP_HELO_FCRDNS       Relay HELO differs from its IP's reverse DNS
X-Headers-End: 1uPh8y-0005tE-CR
Subject: Re: [f2fs-dev] [PATCH] f2fs: continue to allocate pinned section
 when gc happens EAGAIN
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
Cc: feng.han@honor.com, linux-kernel@vger.kernel.org, bo.wu@vivo.com,
 jaegeuk@kernel.org, wangzijie1@honor.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

> On 6/12/25 11:27, wangzijie wrote:
> > Wu Bo once mentioned a fallocate fail scenario in this link[1].
> > After commit 3fdd89b452c2("f2fs: prevent writing without fallocate()
> > for pinned files"), we cannot directly generate 4K size file and
> > pin it, but we can still generate non-segment aligned pinned file:
> > 
> > touch test_file
> > ./f2fs_io pinfile set test_file
> > ./f2fs_io fallocate 0 0 8192 test_file
> > truncate -s 4096 test_file
> 
> Well, shouldn't we avoid such case by adding check condition in setattr?

Maybe like this?  

---
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 6bd3de64f..2f6537d9c 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1027,6 +1027,8 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 	struct inode *inode = d_inode(dentry);
 	struct f2fs_inode_info *fi = F2FS_I(inode);
 	int err;
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	block_t sec_blks = CAP_BLKS_PER_SEC(sbi);
 
 	if (unlikely(f2fs_cp_error(F2FS_I_SB(inode))))
 		return -EIO;
@@ -1047,6 +1049,11 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 			!IS_ALIGNED(attr->ia_size,
 			F2FS_BLK_TO_BYTES(fi->i_cluster_size)))
 			return -EINVAL;
+		if (f2fs_is_pinned_file(inode) &&
+			attr->ia_size < i_size_read(inode) &&
+			!IS_ALIGNED(attr->ia_size,
+			F2FS_BLK_TO_BYTES(sec_blks)));
+			return -EINVAL;
 	}
 
 	err = setattr_prepare(idmap, dentry, attr);
---

> > 
> > By doing this, pin+fallocate failure(gc happens EAGAIN but f2fs shows
> > enough spare space) may occurs.
> > 
> > From message in commit 2e42b7f817ac("f2fs: stop allocating pinned sections
> > if EAGAIN happens"), gc EAGAIN doesn't guarantee a free section, so we stop
> > allocating. But after commit 48ea8b200414 ("f2fs: fix to avoid panic once 
> > fallocation fails for pinfile"), we have a way to avoid panic caused by
> > concurrent pinfile allocation run out of free section, so I think that we 
> > can continue to allocate pinned section when gc happens EAGAIN. Even if we
> > don't have free section, f2fs_allocate_pinning_section() can fail with ENOSPC.
> 
> What do you think of introduce /sys/fs/f2fs/<dev>/reserved_pin_section to
> tune @needed parameter of has_not_enough_free_secs()? If we configure it
> w/ zero, it can avoid f2fs_gc() before preallocation.
> 
> ---
>  fs/f2fs/f2fs.h  | 3 +++
>  fs/f2fs/file.c  | 5 ++---
>  fs/f2fs/super.c | 3 +++
>  fs/f2fs/sysfs.c | 9 +++++++++
>  4 files changed, 17 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 785537576aa8..ffb15da570d7 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1731,6 +1731,9 @@ struct f2fs_sb_info {
>  	/* for skip statistic */
>  	unsigned long long skipped_gc_rwsem;		/* FG_GC only */
> 
> +	/* free sections reserved for pinned file */
> +	unsigned int reserved_pin_section;
> +
>  	/* threshold for gc trials on pinned files */
>  	unsigned short gc_pin_file_threshold;
>  	struct f2fs_rwsem pin_sem;
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 696131e655ed..a909f79db178 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -1887,9 +1887,8 @@ static int f2fs_expand_inode_data(struct inode *inode, loff_t offset,
>  			}
>  		}
> 
> -		if (has_not_enough_free_secs(sbi, 0, f2fs_sb_has_blkzoned(sbi) ?
> -			ZONED_PIN_SEC_REQUIRED_COUNT :
> -			GET_SEC_FROM_SEG(sbi, overprovision_segments(sbi)))) {
> +		if (has_not_enough_free_secs(sbi, 0,
> +				sbi->reserved_pin_section)) {
>  			f2fs_down_write(&sbi->gc_lock);
>  			stat_inc_gc_call_count(sbi, FOREGROUND);
>  			err = f2fs_gc(sbi, &gc_control);
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 57adeff5ef25..48b97a95fd63 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -4975,6 +4975,9 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
>  	sbi->last_valid_block_count = sbi->total_valid_block_count;
>  	sbi->reserved_blocks = 0;
>  	sbi->current_reserved_blocks = 0;
> +	sbi->reserved_pin_section = f2fs_sb_has_blkzoned(sbi) ?
> +			ZONED_PIN_SEC_REQUIRED_COUNT :
> +			GET_SEC_FROM_SEG(sbi, overprovision_segments(sbi));
>  	limit_reserve_root(sbi);
>  	adjust_unusable_cap_perc(sbi);
> 
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index 75134d69a0bd..51be7ffb38c5 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -824,6 +824,13 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
>  		return count;
>  	}
> 
> +	if (!strcmp(a->attr.name, "reserved_pin_section")) {
> +		if (t > GET_SEC_FROM_SEG(sbi, overprovision_segments(sbi)))
> +			return -EINVAL;
> +		*ui = (unsigned int)t;
> +		return count;
> +	}
> +
>  	*ui = (unsigned int)t;
> 
>  	return count;
> @@ -1130,6 +1137,7 @@ F2FS_SBI_GENERAL_RO_ATTR(unusable_blocks_per_sec);
>  F2FS_SBI_GENERAL_RW_ATTR(blkzone_alloc_policy);
>  #endif
>  F2FS_SBI_GENERAL_RW_ATTR(carve_out);
> +F2FS_SBI_GENERAL_RW_ATTR(reserved_pin_section);
> 
>  /* STAT_INFO ATTR */
>  #ifdef CONFIG_F2FS_STAT_FS
> @@ -1323,6 +1331,7 @@ static struct attribute *f2fs_attrs[] = {
>  	ATTR_LIST(last_age_weight),
>  	ATTR_LIST(max_read_extent_count),
>  	ATTR_LIST(carve_out),
> +	ATTR_LIST(reserved_pin_section),
>  	NULL,
>  };
>  ATTRIBUTE_GROUPS(f2fs);
> -- 
> 2.49.0

I think it's a good way to solve this problem. Thank you!


> > 
> > [1] https://lore.kernel.org/linux-f2fs-devel/20231030094024.263707-1-bo.wu@vivo.com/t/#u
> > 
> > Signed-off-by: wangzijie <wangzijie1@honor.com>
> > ---
> >  fs/f2fs/file.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > index 6bd3de64f..05c80d2b5 100644
> > --- a/fs/f2fs/file.c
> > +++ b/fs/f2fs/file.c
> > @@ -1859,7 +1859,7 @@ static int f2fs_expand_inode_data(struct inode *inode, loff_t offset,
> >  			f2fs_down_write(&sbi->gc_lock);
> >  			stat_inc_gc_call_count(sbi, FOREGROUND);
> >  			err = f2fs_gc(sbi, &gc_control);
> > -			if (err && err != -ENODATA) {
> > +			if (err && err != -ENODATA && err != -EAGAIN) {
> >  				f2fs_up_write(&sbi->pin_sem);
> >  				goto out_err;
> >  			}
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
