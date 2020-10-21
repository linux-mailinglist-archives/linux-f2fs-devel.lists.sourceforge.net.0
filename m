Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D88294809
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Oct 2020 08:08:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kV7IW-000325-FV; Wed, 21 Oct 2020 06:08:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kV7IT-00031u-OV
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 21 Oct 2020 06:08:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=za8fTaVRSSjlxDfXE43MetgX0TpJmwEGsKPlFCIhWjA=; b=QQLi5YGb3a2KBblnG4EXCQvnEr
 4wM07hddSDdOLzIaZlNUH6CdR4bRF1d7SA7vdA4Kpz7UAVjIJkTTELCbQkmdEq7ZZn/A4HLE5kHpv
 IEme8ewx+iT4Ml65SvL0jpcK8oEMUp+c4fAVWssZw8AeJ6vKzJJMSpDVVVy23rhbxnzU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=za8fTaVRSSjlxDfXE43MetgX0TpJmwEGsKPlFCIhWjA=; b=AuUSvDMnUaAJkZ9wnMC90tBrGb
 qhXxa6cp+4Z43HjGbLJhm6YrtLdGfHQKfKPm/FNuPwlDeKbKnFwuphK/m0ZMRQ3oiX4KQHKkiEqHH
 iSNsWRZEGf68+8jzYsFmBpROrPmdA5b+fHYgVfH2Q2Ml9rCRlZMME+fLCNnUTkd+lFVk=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kV7IL-000kRB-Jk
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 21 Oct 2020 06:08:29 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 0E811B3B115AF6520308;
 Wed, 21 Oct 2020 14:08:06 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.210) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 21 Oct
 2020 14:08:04 +0800
To: Daeho Jeong <daeho43@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>, <kernel-team@android.com>
References: <20201016051455.1913795-1-daeho43@gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <f8359dde-7e0c-b2fc-451f-2984c50fa552@huawei.com>
Date: Wed, 21 Oct 2020 14:08:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20201016051455.1913795-1-daeho43@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.35 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kV7IL-000kRB-Jk
Subject: Re: [f2fs-dev] [PATCH] f2fs: add compr_inode and compr_blocks sysfs
 nodes
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/10/16 13:14, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Added compr_inode to show compressed inode count and compr_blocks to
> show compressed block count in sysfs.

As there are so many entries in ../f2fs/<disk>/ directory, it looks a mess
there, I suggest that we can add a new directory 'stats' in ../f2fs/<disk>/,
in where we can store all readonly stats related entries there later.

How do you think?

Thanks,

> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
>   Documentation/ABI/testing/sysfs-fs-f2fs | 10 ++++++++++
>   fs/f2fs/sysfs.c                         | 17 +++++++++++++++++
>   2 files changed, 27 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
> index 834d0becae6d..a01c26484c69 100644
> --- a/Documentation/ABI/testing/sysfs-fs-f2fs
> +++ b/Documentation/ABI/testing/sysfs-fs-f2fs
> @@ -350,3 +350,13 @@ Date:		April 2020
>   Contact:	"Daeho Jeong" <daehojeong@google.com>
>   Description:	Give a way to change iostat_period time. 3secs by default.
>   		The new iostat trace gives stats gap given the period.
> +
> +What:		/sys/fs/f2fs/<disk>/compr_inode
> +Date:		October 2020
> +Contact:	"Daeho Jeong" <daehojeong@google.com>
> +Description:	Show compressed inode count
> +
> +What:		/sys/fs/f2fs/<disk>/compr_blocks
> +Date:		October 2020
> +Contact:	"Daeho Jeong" <daehojeong@google.com>
> +Description:	Show compressed block count
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index 94c98e412aa1..7139a29a00d3 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -223,6 +223,19 @@ static ssize_t avg_vblocks_show(struct f2fs_attr *a,
>   	f2fs_update_sit_info(sbi);
>   	return sprintf(buf, "%llu\n", (unsigned long long)(si->avg_vblocks));
>   }
> +
> +static ssize_t compr_inode_show(struct f2fs_attr *a,
> +				struct f2fs_sb_info *sbi, char *buf)
> +{
> +	return sprintf(buf, "%u\n", atomic_read(&sbi->compr_inode));
> +}
> +
> +static ssize_t compr_blocks_show(struct f2fs_attr *a,
> +				struct f2fs_sb_info *sbi, char *buf)
> +{
> +	return sprintf(buf, "%llu\n", atomic64_read(&sbi->compr_blocks));
> +}
> +
>   #endif
>   
>   static ssize_t main_blkaddr_show(struct f2fs_attr *a,
> @@ -591,6 +604,8 @@ F2FS_STAT_ATTR(STAT_INFO, f2fs_stat_info, gc_background_calls, bg_gc);
>   F2FS_GENERAL_RO_ATTR(moved_blocks_background);
>   F2FS_GENERAL_RO_ATTR(moved_blocks_foreground);
>   F2FS_GENERAL_RO_ATTR(avg_vblocks);
> +F2FS_GENERAL_RO_ATTR(compr_inode);
> +F2FS_GENERAL_RO_ATTR(compr_blocks);
>   #endif
>   
>   #ifdef CONFIG_FS_ENCRYPTION
> @@ -675,6 +690,8 @@ static struct attribute *f2fs_attrs[] = {
>   	ATTR_LIST(moved_blocks_foreground),
>   	ATTR_LIST(moved_blocks_background),
>   	ATTR_LIST(avg_vblocks),
> +	ATTR_LIST(compr_inode),
> +	ATTR_LIST(compr_blocks),
>   #endif
>   	NULL,
>   };
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
