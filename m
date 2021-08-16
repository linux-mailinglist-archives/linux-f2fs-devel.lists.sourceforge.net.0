Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BAD3ECCB0
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 16 Aug 2021 04:36:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mFSTw-0005XN-V7; Mon, 16 Aug 2021 02:36:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1mFSTv-0005X9-Dp
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 16 Aug 2021 02:36:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+pBQk4zver5WUy7aptKhE0o/tjSwiG5jOqSv2VshDRc=; b=mH6Lp5IHTL/jfT9BjWeSbWBXbQ
 5Kl13Q4pi+Vo13jeXhPCaHXIu2qltaoyzLrOmQ7LMmtRSZFzjEE98hXvyEoKeUQqGxUz1gzJUPWKF
 g04iemVQCmqcSefuuY3Y8R486wP94Bm3/l3jed0HqOrDAvrQZ00vUDg0GqE+q39GO6j4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+pBQk4zver5WUy7aptKhE0o/tjSwiG5jOqSv2VshDRc=; b=j/eM/hCuqXMGEVs9i+w4rRALgR
 qlgWdPqcSAQvcEVdwhcbnmafSzPz1uIyDpmUCLgfBjjHOrj+5N7ei51lX86MDWYqk9Eh29del4XH3
 hEMtpRXSBQ4ku06Qbuj3r7j82LaO2+vQKCX7R5KibvCjcdIszxiiIgUBAXUUedLzja28=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mFSTr-0002lO-MF
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 16 Aug 2021 02:36:07 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 720FA613CF;
 Mon, 16 Aug 2021 02:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629081358;
 bh=7b/38QWZKPFkBnPmu04d0vL64YFvCb5U/RY8d2wJBA8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=ltxI8YMXIYrWtCErzqMKnycZH6LV8gxiMC2xOFXIrxEjz2TBL965WEoRNUM2lj3TD
 4xHf/hsM2/vwTh9eCS0CuT5pV3UQfSpj9XMGo7U8AkTNDHIIzVMLquZAJfNvqCs5Il
 7SxwPiy5HSIvooNcVQ0yWo+3/39Q88A9ooTzE2o5z4FXvBMp4rzpqq1q4Xrc8qhPhR
 n5YVAdXY0M25/Ba96DardFEbQM6alx+tuk0+02NXvw4CIBStJtM7TQjZCIqK79Zl5E
 M2vfVmS58l5sz98D1ed15hvXd6Yd5JMPdmI2XFKXV8gr9YLa/gbjZppKKgCpY4xcTf
 UBw4zF8FQEoww==
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org
References: <20210814175840.115938-1-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <01c884b3-1250-3585-c417-5afb7b4930f0@kernel.org>
Date: Mon, 16 Aug 2021 10:35:55 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210814175840.115938-1-frank.li@vivo.com>
Content-Language: en-US
X-Spam-Score: -2.0 (--)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -2.1 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 1.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mFSTr-0002lO-MF
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: add sysfs nodes to get discard
 information
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/8/15 1:58, Yangtao Li wrote:
> I've added new sysfs nodes to show discard stat since mount, which
> will help us analyze whether the performance problem is related to
> discard.
> 
> issued_discard  - Shows the number of issued discard
> queued_discard  - Shows the number of cached discard cmd count
> discard_cmd_cnt - Shows the number of cached discard cmd count
> undiscard_blks  - Shows the number of undiscard blocks

We have exported them in debugfs, can you use that?

Thanks,

> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>   Documentation/ABI/testing/sysfs-fs-f2fs | 20 +++++++++++
>   fs/f2fs/sysfs.c                         | 44 +++++++++++++++++++++++++
>   2 files changed, 64 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
> index ef4b9218ae1e..32df6d16d74f 100644
> --- a/Documentation/ABI/testing/sysfs-fs-f2fs
> +++ b/Documentation/ABI/testing/sysfs-fs-f2fs
> @@ -493,3 +493,23 @@ Contact:	"Chao Yu" <yuchao0@huawei.com>
>   Description:	When ATGC is on, it controls age threshold to bypass GCing young
>   		candidates whose age is not beyond the threshold, by default it was
>   		initialized as 604800 seconds (equals to 7 days).
> +
> +What:		/sys/fs/f2fs/<disk>/issued_discard
> +Date:		August 2021
> +Contact:	"Yangtao Li" <frank.li@vivo.com>
> +Description:	Shows the number of issued discard.
> +
> +What:		/sys/fs/f2fs/<disk>/queued_discard
> +Date:		August 2021
> +Contact:	"Yangtao Li" <frank.li@vivo.com>
> +Description:	Shows the number of queued discard.
> +
> +What:		/sys/fs/f2fs/<disk>/discard_cmd_cnt
> +Date:		August 2021
> +Contact:	"Yangtao Li" <frank.li@vivo.com>
> +Description:	Shows the number of cached discard cmd count.
> +
> +What:		/sys/fs/f2fs/<disk>/undiscard_blks
> +Date:		August 2021
> +Contact:	"Yangtao Li" <frank.li@vivo.com>
> +Description:	Shows the number of undiscard blocks.
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index 6642246206bd..b7d6c1adc7f8 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -248,6 +248,42 @@ static ssize_t main_blkaddr_show(struct f2fs_attr *a,
>   			(unsigned long long)MAIN_BLKADDR(sbi));
>   }
>   
> +static ssize_t issued_discard_show(struct f2fs_attr *a,
> +				struct f2fs_sb_info *sbi, char *buf)
> +{
> +	struct discard_cmd_control *dcc_info = SM_I(sbi)->dcc_info;
> +
> +	return snprintf(buf, PAGE_SIZE, "%llu\n",
> +			(unsigned long long)atomic_read(&dcc_info->issued_discard));
> +}
> +
> +static ssize_t queued_discard_show(struct f2fs_attr *a,
> +				struct f2fs_sb_info *sbi, char *buf)
> +{
> +	struct discard_cmd_control *dcc_info = SM_I(sbi)->dcc_info;
> +
> +	return snprintf(buf, PAGE_SIZE, "%llu\n",
> +			(unsigned long long)atomic_read(&dcc_info->queued_discard));
> +}
> +
> +static ssize_t discard_cmd_cnt_show(struct f2fs_attr *a,
> +				struct f2fs_sb_info *sbi, char *buf)
> +{
> +	struct discard_cmd_control *dcc_info = SM_I(sbi)->dcc_info;
> +
> +	return snprintf(buf, PAGE_SIZE, "%llu\n",
> +			(unsigned long long)atomic_read(&dcc_info->discard_cmd_cnt));
> +}
> +
> +static ssize_t undiscard_blks_show(struct f2fs_attr *a,
> +				struct f2fs_sb_info *sbi, char *buf)
> +{
> +	struct discard_cmd_control *dcc_info = SM_I(sbi)->dcc_info;
> +
> +	return snprintf(buf, PAGE_SIZE, "%llu\n",
> +			(unsigned long long)dcc_info->undiscard_blks);
> +}
> +
>   static ssize_t f2fs_sbi_show(struct f2fs_attr *a,
>   			struct f2fs_sb_info *sbi, char *buf)
>   {
> @@ -690,6 +726,10 @@ F2FS_GENERAL_RO_ATTR(unusable);
>   F2FS_GENERAL_RO_ATTR(encoding);
>   F2FS_GENERAL_RO_ATTR(mounted_time_sec);
>   F2FS_GENERAL_RO_ATTR(main_blkaddr);
> +F2FS_GENERAL_RO_ATTR(issued_discard);
> +F2FS_GENERAL_RO_ATTR(queued_discard);
> +F2FS_GENERAL_RO_ATTR(discard_cmd_cnt);
> +F2FS_GENERAL_RO_ATTR(undiscard_blks);
>   #ifdef CONFIG_F2FS_STAT_FS
>   F2FS_STAT_ATTR(STAT_INFO, f2fs_stat_info, cp_foreground_calls, cp_count);
>   F2FS_STAT_ATTR(STAT_INFO, f2fs_stat_info, cp_background_calls, bg_cp_count);
> @@ -750,6 +790,10 @@ static struct attribute *f2fs_attrs[] = {
>   	ATTR_LIST(gc_urgent),
>   	ATTR_LIST(reclaim_segments),
>   	ATTR_LIST(main_blkaddr),
> +	ATTR_LIST(issued_discard),
> +	ATTR_LIST(queued_discard),
> +	ATTR_LIST(discard_cmd_cnt),
> +	ATTR_LIST(undiscard_blks),
>   	ATTR_LIST(max_small_discards),
>   	ATTR_LIST(discard_granularity),
>   	ATTR_LIST(batched_trim_sections),
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
