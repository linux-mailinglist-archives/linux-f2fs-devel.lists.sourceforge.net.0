Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BD0BAC74
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Sep 2019 03:56:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iCDaY-0008Vf-Nh; Mon, 23 Sep 2019 01:56:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1iCDaX-0008VX-1G
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Sep 2019 01:56:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LriA3ZVExoMaXJ1C5Q4aDlit9CiNrtTYm6BusB5aGM8=; b=lMelJu/OBPi8tzWHOgA7XHoyLA
 Dr9ezh48YfD5LAapkNmoixdfYn7tjzaTYEp36XtwQwOG4VK5LxyyE2pWlg1kQHD7ikvJeVHopxmxI
 Zxh0kuGurd/bMH51zGzYG4CjHyQOCU2344CzB0/cprErccqJNh/IJBCzpRpe5rS9hMUY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LriA3ZVExoMaXJ1C5Q4aDlit9CiNrtTYm6BusB5aGM8=; b=EMuMeD8dbsTVoHCuWpTgLpypyV
 na4wjHf7Wk6uakzKeC9hASDgXJnkkm0JI+YKyRw8nLzukCfLFVTqjVWL1QKI9duUl5ztz15B3nf0B
 tKyAlMhdNsNwEWrVTfVKKvv9axOmaR0pK7yO68sS8zfYD0nmAegjcO217BdFpvregI4A=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iCDaV-004XK5-1I
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Sep 2019 01:56:28 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id EFF74F41318306BA7B05;
 Mon, 23 Sep 2019 09:56:19 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.205) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 23 Sep
 2019 09:56:13 +0800
To: sunqiuyang <sunqiuyang@huawei.com>, <linux-kernel@vger.kernel.org>,
 <linux-fsdevel@vger.kernel.org>, <linux-f2fs-devel@lists.sourceforge.net>,
 <jaegeuk@kernel.org>
References: <20190918125158.12126-1-sunqiuyang@huawei.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <1bb74096-8499-7779-503e-5fc7c3350a1b@huawei.com>
Date: Mon, 23 Sep 2019 09:55:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190918125158.12126-1-sunqiuyang@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1iCDaV-004XK5-1I
Subject: Re: [f2fs-dev] [PATCH 1/1] f2fs: update multi-dev metadata in
 resize_fs
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

On 2019/9/18 20:51, sunqiuyang wrote:
> From: Qiuyang Sun <sunqiuyang@huawei.com>
> 
> Multi-device metadata should be updated in resize_fs as well.
> 
> Also, we check that the new FS size still reaches the last device.
> 
> Signed-off-by: Qiuyang Sun <sunqiuyang@huawei.com>
> ---
>  fs/f2fs/gc.c | 32 ++++++++++++++++++++++++++++++--
>  1 file changed, 30 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 5877bd7..a2b8cbe 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -1431,26 +1431,46 @@ static void update_sb_metadata(struct f2fs_sb_info *sbi, int secs)
>  	int segment_count_main = le32_to_cpu(raw_sb->segment_count_main);
>  	long long block_count = le64_to_cpu(raw_sb->block_count);
>  	int segs = secs * sbi->segs_per_sec;
> +	int ndevs = sbi->s_ndevs;
>  
>  	raw_sb->section_count = cpu_to_le32(section_count + secs);
>  	raw_sb->segment_count = cpu_to_le32(segment_count + segs);
>  	raw_sb->segment_count_main = cpu_to_le32(segment_count_main + segs);
>  	raw_sb->block_count = cpu_to_le64(block_count +
>  					(long long)segs * sbi->blocks_per_seg);
> +	if (ndevs > 1) {

if (f2fs_is_multi_device(sbi)) {
	int last_ndev = sbi->s_ndevs - 1;


> +		int dev_segs =
> +			le32_to_cpu(raw_sb->devs[ndevs - 1].total_segments);
> +
> +		raw_sb->devs[ndevs - 1].total_segments =
> +						cpu_to_le32(dev_segs + segs);
> +	}
>  }
>  
>  static void update_fs_metadata(struct f2fs_sb_info *sbi, int secs)
>  {
>  	int segs = secs * sbi->segs_per_sec;
> +	long long blks = (long long)segs * sbi->blocks_per_seg;
>  	long long user_block_count =
>  				le64_to_cpu(F2FS_CKPT(sbi)->user_block_count);
> +	int ndevs = sbi->s_ndevs;
>  
>  	SM_I(sbi)->segment_count = (int)SM_I(sbi)->segment_count + segs;
>  	MAIN_SEGS(sbi) = (int)MAIN_SEGS(sbi) + segs;
>  	FREE_I(sbi)->free_sections = (int)FREE_I(sbi)->free_sections + secs;
>  	FREE_I(sbi)->free_segments = (int)FREE_I(sbi)->free_segments + segs;
> -	F2FS_CKPT(sbi)->user_block_count = cpu_to_le64(user_block_count +
> -					(long long)segs * sbi->blocks_per_seg);
> +	F2FS_CKPT(sbi)->user_block_count = cpu_to_le64(user_block_count + blks);
> +
> +	if (ndevs > 1) {

if (f2fs_is_multi_device(sbi)) {
	int last_ndev = sbi->s_ndevs - 1;

> +		FDEV(ndevs - 1).total_segments =
> +				(int)FDEV(ndevs - 1).total_segments + segs;
> +		FDEV(ndevs - 1).end_blk =
> +				(long long)FDEV(ndevs - 1).end_blk + blks;
> +#ifdef CONFIG_BLK_DEV_ZONED
> +		FDEV(ndevs - 1).nr_blkz = (int)FDEV(ndevs - 1).nr_blkz +
> +					(int)(blks >> sbi->log_blocks_per_blkz);
> +#endif
> +	}
>  }
>  
>  int f2fs_resize_fs(struct f2fs_sb_info *sbi, __u64 block_count)
> @@ -1465,6 +1485,14 @@ int f2fs_resize_fs(struct f2fs_sb_info *sbi, __u64 block_count)
>  	if (block_count > old_block_count)
>  		return -EINVAL;
>  
> +	if (sbi->s_ndevs > 1) {

if (f2fs_is_multi_device(sbi)) {
	int last_ndev = sbi->s_ndevs - 1;

Otherwise it looks good to me.

Thanks,

> +		__u64 last_segs = FDEV(sbi->s_ndevs - 1).total_segments;
> +
> +		if (block_count + last_segs * sbi->blocks_per_seg <=
> +								old_block_count)
> +			return -EINVAL;
> +	}
> +
>  	/* new fs size should align to section size */
>  	div_u64_rem(block_count, BLKS_PER_SEC(sbi), &rem);
>  	if (rem)
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
