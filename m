Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CEC2AD853D
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Jun 2025 10:07:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GCpF5drci0HmiWS8SEIv7VTTw1aZR+5LFnRU13qjd64=; b=jWayWl4qkb1mW+LKXvrPKRmk0Z
	zDsRsy0uuGnZsiZsj6viD+RL6JezmnoH9CUesMR/z8G/4J9dn3dl1YM/iHxGfLvFuLYZlwwS5HW2u
	3b0QHEMHGYGf2JZ11yp48IZOF6xAUmaptplgJlJbR5W4+XY4CDo6Cjrwlxy8BtQ4WVok=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uPzRA-0001Ky-Ka;
	Fri, 13 Jun 2025 08:06:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <wangzijie1@honor.com>) id 1uPzR7-0001KO-MT
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Jun 2025 08:06:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/kwt3DfyY/pQjcsJgeMbpbpD1FsmU1WIt4TumBjMH0U=; b=I06lUmWOmg3qSoD+ttNK2sHSfw
 OAeVh36S/pi4UDGjQkIobnOyneWoC5zl8u18xCsoZmWuiFqn3h/ZRP8O/gDLtz1dfNwDX5g1LY1UC
 r1I5HVJMAA44EWF9HAKyOYgmZFlWrKu4Qz08laAeJmXJJ/4DZunmTveUa8O78qV6tWFk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/kwt3DfyY/pQjcsJgeMbpbpD1FsmU1WIt4TumBjMH0U=; b=MV7M1kWkfvcSlUtxNygl2rIjoQ
 KVtoxdT9eo4ZdwZJKD8VDrOMJrFqLO7hysTKwpfUQYQ1XJFxbwUQL3KkUDc+UlOKNOLCEaiz4aCvg
 W2wwqkn0rXnOMp194sfwPwVgOBdBVwpqH11pPF49FGHuhSGcjg75B01YXTSs1T8oJ0+I=;
Received: from mta21.honor.com ([81.70.160.142] helo=mta21.hihonor.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uPzR6-0000Bp-On for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Jun 2025 08:06:53 +0000
Received: from w011.hihonor.com (unknown [10.68.20.122])
 by mta21.hihonor.com (SkyGuard) with ESMTPS id 4bJX3z4g0mzYl9Bg;
 Fri, 13 Jun 2025 16:04:31 +0800 (CST)
Received: from a011.hihonor.com (10.68.31.243) by w011.hihonor.com
 (10.68.20.122) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 13 Jun
 2025 16:06:40 +0800
Received: from localhost.localdomain (10.144.23.14) by a011.hihonor.com
 (10.68.31.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 13 Jun
 2025 16:06:40 +0800
From: wangzijie <wangzijie1@honor.com>
To: <linux-f2fs-devel@lists.sourceforge.net>
Date: Fri, 13 Jun 2025 16:06:26 +0800
Message-ID: <20250613080626.1879314-1-wangzijie1@honor.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250613055109.2335-1-chao@kernel.org>
References: <20250613055109.2335-1-chao@kernel.org>
MIME-Version: 1.0
X-Originating-IP: [10.144.23.14]
X-ClientProxiedBy: w002.hihonor.com (10.68.28.120) To a011.hihonor.com
 (10.68.31.243)
X-Spam-Score: 0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: > This patch introduces
 /sys/fs/f2fs/<dev>/reserved_pin_section
 for tuning > @needed parameter of has_not_enough_free_secs(), if we configure
 it w/ > zero, it can avoid f2fs_gc() as much as possible w [...] 
 Content analysis details:   (0.4 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.4 KHOP_HELO_FCRDNS       Relay HELO differs from its IP's reverse DNS
X-Headers-End: 1uPzR6-0000Bp-On
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: introduce reserved_pin_section
 sysfs entry
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
Cc: jaegeuk@kernel.org, wangzijie <wangzijie1@honor.com>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

> This patch introduces /sys/fs/f2fs/<dev>/reserved_pin_section for tuning
> @needed parameter of has_not_enough_free_secs(), if we configure it w/
> zero, it can avoid f2fs_gc() as much as possible while fallocating on
> pinned file.
> 
> Signed-off-by: Chao Yu <chao@kernel.org>

Thanks for helping to introduce this sysfs entry.

Reviewed-by: wangzijie <wangzijie1@honor.com>

> ---
> v2:
> - assign SM_I(sbi)->ovp_segments after f2fs_build_segment_manager()
>  Documentation/ABI/testing/sysfs-fs-f2fs | 9 +++++++++
>  fs/f2fs/f2fs.h                          | 3 +++
>  fs/f2fs/file.c                          | 5 ++---
>  fs/f2fs/super.c                         | 4 ++++
>  fs/f2fs/sysfs.c                         | 9 +++++++++
>  5 files changed, 27 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
> index bf03263b9f46..c2a233f2a085 100644
> --- a/Documentation/ABI/testing/sysfs-fs-f2fs
> +++ b/Documentation/ABI/testing/sysfs-fs-f2fs
> @@ -861,3 +861,12 @@ Description:	This is a read-only entry to show the value of sb.s_encoding_flags,
>  		SB_ENC_STRICT_MODE_FL            0x00000001
>  		SB_ENC_NO_COMPAT_FALLBACK_FL     0x00000002
>  		============================     ==========
> +
> +What:		/sys/fs/f2fs/<disk>/reserved_pin_section
> +Date:		June 2025
> +Contact:	"Chao Yu" <chao@kernel.org>
> +Description:	This threshold is used to control triggering garbage collection while
> +		fallocating on pinned file, so, it can guarantee there is enough free
> +		reserved section before preallocating on pinned file.
> +		By default, the value is ovp_sections, especially, for zoned ufs, the
> +		value is 1.
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 9333a22b9a01..fa27498202a3 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1724,6 +1724,9 @@ struct f2fs_sb_info {
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
> index 57adeff5ef25..e0ecc341f1d3 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -5017,6 +5017,10 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
>  	/* get segno of first zoned block device */
>  	sbi->first_seq_zone_segno = get_first_seq_zone_segno(sbi);
>  
> +	sbi->reserved_pin_section = f2fs_sb_has_blkzoned(sbi) ?
> +			ZONED_PIN_SEC_REQUIRED_COUNT :
> +			GET_SEC_FROM_SEG(sbi, overprovision_segments(sbi));
> +
>  	/* Read accumulated write IO statistics if exists */
>  	seg_i = CURSEG_I(sbi, CURSEG_HOT_NODE);
>  	if (__exist_node_summaries(sbi))
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
> 2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
