Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E07AD6AD6
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Jun 2025 10:31:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+/XxOJ443XZcwLRHI6zKr3FxUYZJEPTt20Vizq/E6ig=; b=NO0C7Oi6EkISveL+nTb7x4ZM3u
	zqZUDx97cgmx4ajB7nc7E5iV9ZvKkns42Ed1Kngwf4I42O1BK3K8w+YESm2pG0xKrIZTxElCmsdG9
	ML9AhoyB7BX3xNXXKApkKFVLtltlS9bWWCBlt4OreGtA4nfbm+zGB/5wAgjk5ra6sqwg=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uPdLI-000568-GZ;
	Thu, 12 Jun 2025 08:31:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uPdLH-00055w-CJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Jun 2025 08:31:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wGsrmNKKWHxLZIgNsysp1/sH8IAUvFYPiNtsqgCkMlk=; b=BPDodhZr3bIhKFRg9rEIjVtT4Z
 biwgmQHqkJrurElmCkoAgVrYlkOTUj1i3JCLplbt8oujhZmUj+THVtGsdN3sXL68ZHEhudPwR61mJ
 umMHk5oRrgnFAX7WpKF0CI7b/reaIJDBiqQMatydEWN7dPxUEZNUqXivjia5nVePo4MM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wGsrmNKKWHxLZIgNsysp1/sH8IAUvFYPiNtsqgCkMlk=; b=abTUYK5EKwRz3sxjv51W1Wy2KK
 Y9VclucR1c66zemLZS+5HexXRNcKPeIVfAxg3CsYwr5G+yWMhNxchc/3BJNsgAzWA5AtjrGC1bFSl
 Ys9pXQ6N9CmDAl1HNJQOxkGyDUdqCWbYG7yN4+SWin1UTtOWkxE/f0jo2DUV8cLIKKmw=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uPdLG-000351-Ql for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Jun 2025 08:31:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7D6DA44B43;
 Thu, 12 Jun 2025 08:31:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B7B1C4CEEA;
 Thu, 12 Jun 2025 08:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749717072;
 bh=KiXTzl6QEJUXCDIz97CX32nBSoUsT6AJdzJ9NXwvmRs=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=pbUaTiVkyd+eccgV1xQpVu3H8Afn1UqFuzIlX8s69JZzk1yK0yaHj6YjU5Y1efAKJ
 cLliInKdjJztdzQ/kKyZ+ja1DCnrTQ6pxleYEB9uWSiXHw2itQw9a6j/41EMNiQ7lJ
 OZmTkYlPTA+n3C8cixytNRTUWS4OFq6MBa+pWyZZzRYQaWm4uZp4vwOCY8eel4L9tT
 wq0rE1g3vM9ATgeMKRWyfTqDk559EA5YadgLdhyxfw65PEStHpILDuRkL6hZYKrns2
 MYfnxypKcFW9IeFq2E1RQYH49zldN7FZoY4sGCPsiZJLqEaZPwxuot+gE4NoYMW1io
 ziPLJOWnTMgsQ==
Message-ID: <f1b9209e-c2fb-4a53-8d15-a3e42dea8bca@kernel.org>
Date: Thu, 12 Jun 2025 16:31:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: wangzijie <wangzijie1@honor.com>, jaegeuk@kernel.org
References: <20250612032742.1734852-1-wangzijie1@honor.com>
Content-Language: en-US
In-Reply-To: <20250612032742.1734852-1-wangzijie1@honor.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/12/25 11:27, wangzijie wrote: > Wu Bo once mentioned
 a fallocate fail scenario in this link[1]. > After commit 3fdd89b452c2("f2fs:
 prevent writing without fallocate() > for pinned files"), we can [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uPdLG-000351-Ql
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, bo.wu@vivo.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 6/12/25 11:27, wangzijie wrote:
> Wu Bo once mentioned a fallocate fail scenario in this link[1].
> After commit 3fdd89b452c2("f2fs: prevent writing without fallocate()
> for pinned files"), we cannot directly generate 4K size file and
> pin it, but we can still generate non-segment aligned pinned file:
> 
> touch test_file
> ./f2fs_io pinfile set test_file
> ./f2fs_io fallocate 0 0 8192 test_file
> truncate -s 4096 test_file

Well, shouldn't we avoid such case by adding check condition in setattr?

> 
> By doing this, pin+fallocate failure(gc happens EAGAIN but f2fs shows
> enough spare space) may occurs.
> 
> From message in commit 2e42b7f817ac("f2fs: stop allocating pinned sections
> if EAGAIN happens"), gc EAGAIN doesn't guarantee a free section, so we stop
> allocating. But after commit 48ea8b200414 ("f2fs: fix to avoid panic once 
> fallocation fails for pinfile"), we have a way to avoid panic caused by
> concurrent pinfile allocation run out of free section, so I think that we 
> can continue to allocate pinned section when gc happens EAGAIN. Even if we
> don't have free section, f2fs_allocate_pinning_section() can fail with ENOSPC.

What do you think of introduce /sys/fs/f2fs/<dev>/reserved_pin_section to
tune @needed parameter of has_not_enough_free_secs()? If we configure it
w/ zero, it can avoid f2fs_gc() before preallocation.

---
 fs/f2fs/f2fs.h  | 3 +++
 fs/f2fs/file.c  | 5 ++---
 fs/f2fs/super.c | 3 +++
 fs/f2fs/sysfs.c | 9 +++++++++
 4 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 785537576aa8..ffb15da570d7 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1731,6 +1731,9 @@ struct f2fs_sb_info {
 	/* for skip statistic */
 	unsigned long long skipped_gc_rwsem;		/* FG_GC only */

+	/* free sections reserved for pinned file */
+	unsigned int reserved_pin_section;
+
 	/* threshold for gc trials on pinned files */
 	unsigned short gc_pin_file_threshold;
 	struct f2fs_rwsem pin_sem;
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 696131e655ed..a909f79db178 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1887,9 +1887,8 @@ static int f2fs_expand_inode_data(struct inode *inode, loff_t offset,
 			}
 		}

-		if (has_not_enough_free_secs(sbi, 0, f2fs_sb_has_blkzoned(sbi) ?
-			ZONED_PIN_SEC_REQUIRED_COUNT :
-			GET_SEC_FROM_SEG(sbi, overprovision_segments(sbi)))) {
+		if (has_not_enough_free_secs(sbi, 0,
+				sbi->reserved_pin_section)) {
 			f2fs_down_write(&sbi->gc_lock);
 			stat_inc_gc_call_count(sbi, FOREGROUND);
 			err = f2fs_gc(sbi, &gc_control);
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 57adeff5ef25..48b97a95fd63 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4975,6 +4975,9 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
 	sbi->last_valid_block_count = sbi->total_valid_block_count;
 	sbi->reserved_blocks = 0;
 	sbi->current_reserved_blocks = 0;
+	sbi->reserved_pin_section = f2fs_sb_has_blkzoned(sbi) ?
+			ZONED_PIN_SEC_REQUIRED_COUNT :
+			GET_SEC_FROM_SEG(sbi, overprovision_segments(sbi));
 	limit_reserve_root(sbi);
 	adjust_unusable_cap_perc(sbi);

diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 75134d69a0bd..51be7ffb38c5 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -824,6 +824,13 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		return count;
 	}

+	if (!strcmp(a->attr.name, "reserved_pin_section")) {
+		if (t > GET_SEC_FROM_SEG(sbi, overprovision_segments(sbi)))
+			return -EINVAL;
+		*ui = (unsigned int)t;
+		return count;
+	}
+
 	*ui = (unsigned int)t;

 	return count;
@@ -1130,6 +1137,7 @@ F2FS_SBI_GENERAL_RO_ATTR(unusable_blocks_per_sec);
 F2FS_SBI_GENERAL_RW_ATTR(blkzone_alloc_policy);
 #endif
 F2FS_SBI_GENERAL_RW_ATTR(carve_out);
+F2FS_SBI_GENERAL_RW_ATTR(reserved_pin_section);

 /* STAT_INFO ATTR */
 #ifdef CONFIG_F2FS_STAT_FS
@@ -1323,6 +1331,7 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(last_age_weight),
 	ATTR_LIST(max_read_extent_count),
 	ATTR_LIST(carve_out),
+	ATTR_LIST(reserved_pin_section),
 	NULL,
 };
 ATTRIBUTE_GROUPS(f2fs);
-- 
2.49.0


> 
> [1] https://lore.kernel.org/linux-f2fs-devel/20231030094024.263707-1-bo.wu@vivo.com/t/#u
> 
> Signed-off-by: wangzijie <wangzijie1@honor.com>
> ---
>  fs/f2fs/file.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 6bd3de64f..05c80d2b5 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -1859,7 +1859,7 @@ static int f2fs_expand_inode_data(struct inode *inode, loff_t offset,
>  			f2fs_down_write(&sbi->gc_lock);
>  			stat_inc_gc_call_count(sbi, FOREGROUND);
>  			err = f2fs_gc(sbi, &gc_control);
> -			if (err && err != -ENODATA) {
> +			if (err && err != -ENODATA && err != -EAGAIN) {
>  				f2fs_up_write(&sbi->pin_sem);
>  				goto out_err;
>  			}



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
