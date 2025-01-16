Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E22D7A131B0
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 Jan 2025 04:15:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tYGLZ-0006iZ-20;
	Thu, 16 Jan 2025 03:15:05 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tYGLY-0006iP-9I
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 16 Jan 2025 03:15:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=o09ZrIyqegKg9ge1HGQ25jK/h+HU7kJjrRXXwROf/oU=; b=LF32/8wQl8DF7EftuVK0MXTVwd
 waBLv+K6mCMaHl1bto+apu7AVakinyeZq3w9bRV07S2MfWi01f9l9alX5UbxwGgBiCBxa1e1oW5VG
 vVQkqZfIh8icKuJfS7EuaoJqoEF3n9Y1o5QFA65mK1Q+tb9jzicsdHLrK/UQ4xOqTziE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=o09ZrIyqegKg9ge1HGQ25jK/h+HU7kJjrRXXwROf/oU=; b=BCAIzpjAn16oRYANq0nzeVG8HP
 V/5aqnHvLTVI1fxUIUNv1/OdAEl4cK7AMEFl7sg5lWtnz3IUOfVnFE/WnL11n64OJXyMfIxtZYDNi
 OLny6PsXbUJWX9Mn06Ev0+HIxBWqE93pX+v99ynKzLw5U5OQDIslaAaPLmIqNO0Opi3c=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tYGLX-0003Y7-AJ for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 16 Jan 2025 03:15:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 378755C57E3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 16 Jan 2025 03:14:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D410BC4CED1;
 Thu, 16 Jan 2025 03:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736997292;
 bh=3OHLqz3k45PS/p9b3DQZ48WfOOiekdCo5FnVBqm3RLk=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=SfyivdcesoTnCQenfjKd5vdJsz3oMXRNvKyugHhEwzOy7vghyMRG7ZZdQaUk8zhJS
 54aOT38ITeXlgfnbZJtUKBnds9T1U/soeG97JX6Rmg0mE4bN1RxGiRaKlLRTat6vdE
 I4FiPIIYxjCmiMPDLtgSLfhA4E1fds3xXURgvf2AjOKwrvXDbZ4SIdC4GA+KKJYch1
 lQDtC3ayANwWIVPC/wzDIDU9l32qdfvUuoNF1SJsfZN4HkchqkhRZ++B3ac4sHc6KY
 5vXIUZjM+i90FdY5SPF5QUKPhIyeigds5IqT2GJsAaQgoykG6Fnr5clyNT12Y91PWc
 f9Dip+2CL+efQ==
Message-ID: <b7b67469-f6e5-4aa5-ac28-107c784a81b2@kernel.org>
Date: Thu, 16 Jan 2025 11:14:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20250115221814.1920703-1-jaegeuk@kernel.org>
 <20250115221814.1920703-3-jaegeuk@kernel.org>
Content-Language: en-US
In-Reply-To: <20250115221814.1920703-3-jaegeuk@kernel.org>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 1/16/25 06:16, Jaegeuk Kim via Linux-f2fs-devel wrote:
 > 1. ioctl(fd1, F2FS_IOC_DONATE_RANGE, {0,3});
 > 2. ioctl(fd2, F2FS_IOC_DONATE_RANGE,
 {1,2}); > 3. ioctl(fd3, F2FS_IOC_DONATE_RANGE, {3,1}); > [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tYGLX-0003Y7-AJ
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: add a sysfs entry to request
 donate file-backed pages
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 1/16/25 06:16, Jaegeuk Kim via Linux-f2fs-devel wrote:
> 1. ioctl(fd1, F2FS_IOC_DONATE_RANGE, {0,3});
> 2. ioctl(fd2, F2FS_IOC_DONATE_RANGE, {1,2});
> 3. ioctl(fd3, F2FS_IOC_DONATE_RANGE, {3,1});
> 4. echo 3 > /sys/fs/f2fs/blk/donate_caches
> 
> will reclaim 3 page cache ranges, registered by #1, #2, and #3.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>   Documentation/ABI/testing/sysfs-fs-f2fs |  7 +++++++
>   fs/f2fs/f2fs.h                          |  2 ++
>   fs/f2fs/shrinker.c                      | 27 +++++++++++++++++++++++++
>   fs/f2fs/sysfs.c                         |  8 ++++++++
>   4 files changed, 44 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
> index 3e1630c70d8a..6f9d8b8889fd 100644
> --- a/Documentation/ABI/testing/sysfs-fs-f2fs
> +++ b/Documentation/ABI/testing/sysfs-fs-f2fs
> @@ -828,3 +828,10 @@ Date:		November 2024
>   Contact:	"Chao Yu" <chao@kernel.org>
>   Description:	It controls max read extent count for per-inode, the value of threshold
>   		is 10240 by default.
> +
> +What:		/sys/fs/f2fs/<disk>/donate_caches
> +Date:		December 2024
> +Contact:	"Jaegeuk Kim" <jaegeuk@kernel.org>
> +Description:	It reclaims the certian file-backed pages registered by
> +		ioctl(F2FS_IOC_DONATE_RANGE).
> +		For example, writing N tries to drop N address spaces in LRU.
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 951fbc3f94c7..399ddd10a94f 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1637,6 +1637,7 @@ struct f2fs_sb_info {
>   
>   	/* control donate caches */
>   	unsigned int donate_files;
> +	unsigned int donate_caches;
>   
>   	/* basic filesystem units */
>   	unsigned int log_sectors_per_block;	/* log2 sectors per block */
> @@ -4259,6 +4260,7 @@ unsigned long f2fs_shrink_count(struct shrinker *shrink,
>   			struct shrink_control *sc);
>   unsigned long f2fs_shrink_scan(struct shrinker *shrink,
>   			struct shrink_control *sc);
> +void f2fs_donate_caches(struct f2fs_sb_info *sbi);
>   void f2fs_join_shrinker(struct f2fs_sb_info *sbi);
>   void f2fs_leave_shrinker(struct f2fs_sb_info *sbi);
>   
> diff --git a/fs/f2fs/shrinker.c b/fs/f2fs/shrinker.c
> index 83d6fb97dcae..22f62813910b 100644
> --- a/fs/f2fs/shrinker.c
> +++ b/fs/f2fs/shrinker.c
> @@ -130,6 +130,33 @@ unsigned long f2fs_shrink_scan(struct shrinker *shrink,
>   	return freed;
>   }
>   
> +void f2fs_donate_caches(struct f2fs_sb_info *sbi)
> +{
> +	struct inode *inode;
> +	struct f2fs_inode_info *fi;
> +	int nfiles = sbi->donate_caches;
> +
> +	while (nfiles--) {
> +		spin_lock(&sbi->inode_lock[DONATE_INODE]);
> +		if (list_empty(&sbi->inode_list[DONATE_INODE])) {
> +			spin_unlock(&sbi->inode_lock[DONATE_INODE]);
> +			break;
> +		}
> +		fi = list_first_entry(&sbi->inode_list[DONATE_INODE],
> +					struct f2fs_inode_info, gdonate_list);
> +		list_move_tail(&fi->gdonate_list, &sbi->inode_list[DONATE_INODE]);
> +		inode = igrab(&fi->vfs_inode);
> +		spin_unlock(&sbi->inode_lock[DONATE_INODE]);
> +
> +		if (!inode)
> +			continue;
> +
> +		invalidate_inode_pages2_range(inode->i_mapping,
> +					fi->donate_start, fi->donate_end);

fi->donate_start and fi->donate_end can be updated in ioctl concurrently and 
become inconsistent here, is it fine?

Thanks,

> +		iput(inode);
> +	}
> +}
> +
>   void f2fs_join_shrinker(struct f2fs_sb_info *sbi)
>   {
>   	spin_lock(&f2fs_list_lock);
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index 6b99dc49f776..f81190fabdd3 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -811,6 +811,12 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
>   		return count;
>   	}
>   
> +	if (!strcmp(a->attr.name, "donate_caches")) {
> +		sbi->donate_caches = min(t, sbi->donate_files);
> +		f2fs_donate_caches(sbi);
> +		return count;
> +	}
> +
>   	*ui = (unsigned int)t;
>   
>   	return count;
> @@ -1030,6 +1036,7 @@ F2FS_SBI_GENERAL_RW_ATTR(max_victim_search);
>   F2FS_SBI_GENERAL_RW_ATTR(migration_granularity);
>   F2FS_SBI_GENERAL_RW_ATTR(migration_window_granularity);
>   F2FS_SBI_GENERAL_RW_ATTR(dir_level);
> +F2FS_SBI_GENERAL_RW_ATTR(donate_caches);
>   #ifdef CONFIG_F2FS_IOSTAT
>   F2FS_SBI_GENERAL_RW_ATTR(iostat_enable);
>   F2FS_SBI_GENERAL_RW_ATTR(iostat_period_ms);
> @@ -1178,6 +1185,7 @@ static struct attribute *f2fs_attrs[] = {
>   	ATTR_LIST(migration_granularity),
>   	ATTR_LIST(migration_window_granularity),
>   	ATTR_LIST(dir_level),
> +	ATTR_LIST(donate_caches),
>   	ATTR_LIST(ram_thresh),
>   	ATTR_LIST(ra_nid_pages),
>   	ATTR_LIST(dirty_nats_ratio),



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
