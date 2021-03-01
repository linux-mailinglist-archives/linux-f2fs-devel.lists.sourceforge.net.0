Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E6132761F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  1 Mar 2021 03:41:59 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lGYVQ-0003kL-P9; Mon, 01 Mar 2021 02:41:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1lGYVP-0003kB-GI
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Mar 2021 02:41:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ctec3XP8Y/CXEoa8dzSCCpiP+MQQ7Ol6koFNWtJjD6Q=; b=BglHMFWDbHdbn123ZGIT5CQYgI
 TwaY4ssKda4x0f3VLc0OVZeNTvpaQ53K41FhB1DnkjMxxKUu4E3QLFdrrEA9gcu9RuHgQwYtKywqM
 Cr/ZVkp2ZqYOSTAtXSI75LbZSgtKmZY8+/GlY3zWtPJL7BVexDZG9wE/6gdA31D00PLg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ctec3XP8Y/CXEoa8dzSCCpiP+MQQ7Ol6koFNWtJjD6Q=; b=meFBnFYmAo7JVcU+oR1PfFLyoL
 HAztzuONshe0Nr7CdD1xkCCYdd5j10LnyZ/8xUmTjE8BiEGTl5i3RsZFztkqSQtwGKWgDyk8vEn5/
 sWupbKGThEgBAM6RXGMq51mkmX30vUlZ2MMl138sp7cuIah+79+q8/0r6h/lmhyfIvhc=;
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lGYVG-009KAX-D1
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Mar 2021 02:41:55 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Dpkxm1qP7z7qw3;
 Mon,  1 Mar 2021 10:39:56 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by smtp.huawei.com
 (10.3.19.208) with Microsoft SMTP Server (TLS) id 14.3.498.0; Mon, 1 Mar 2021
 10:41:32 +0800
To: Huang Jianan <huangjianan@oppo.com>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <20210227120231.136559-1-huangjianan@oppo.com>
 <20210227120231.136559-3-huangjianan@oppo.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <b4ae58b2-3325-6cdf-26b4-b77810d33bbc@huawei.com>
Date: Mon, 1 Mar 2021 10:41:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20210227120231.136559-3-huangjianan@oppo.com>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.35 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lGYVG-009KAX-D1
Subject: Re: [f2fs-dev] [PATCH 3/3] f2fs: check if swapfile is
 section-alligned
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
Cc: zhangshiming@oppo.com, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Jianan,

On 2021/2/27 20:02, Huang Jianan via Linux-f2fs-devel wrote:
> If the swapfile isn't created by pin and fallocate, it cann't be

Typo:

can't

> guaranteed section-aligned, so it may be selected by f2fs gc. When
> gc_pin_file_threshold is reached, the address of swapfile may change,
> but won't be synchroniz to swap_extent, so swap will write to wrong

synchronized

> address, which will cause data corruption.
> 
> Signed-off-by: Huang Jianan <huangjianan@oppo.com>
> Signed-off-by: Guo Weichao <guoweichao@oppo.com>
> ---
>   fs/f2fs/data.c | 63 ++++++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 63 insertions(+)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 4dbc1cafc55d..3e523d6e4643 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -3781,11 +3781,63 @@ int f2fs_migrate_page(struct address_space *mapping,
>   #endif
>   
>   #ifdef CONFIG_SWAP
> +static int f2fs_check_file_aligned(struct inode *inode)

f2fs_check_file_alignment() or f2fs_is_file_aligned()?

> +{
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> +	block_t main_blkaddr = SM_I(sbi)->main_blkaddr;
> +	block_t cur_lblock;
> +	block_t last_lblock;
> +	block_t pblock;
> +	unsigned long len;
> +	unsigned long nr_pblocks;
> +	unsigned int blocks_per_sec = sbi->blocks_per_seg * sbi->segs_per_sec;

unsigned int blocks_per_sec = BLKS_PER_SEC(sbi);

> +	int ret;
> +
> +	cur_lblock = 0;
> +	last_lblock = bytes_to_blks(inode, i_size_read(inode));
> +	len = i_size_read(inode);
> +
> +	while (cur_lblock < last_lblock) {
> +		struct f2fs_map_blocks map;
> +		pgoff_t next_pgofs;
> +
> +		memset(&map, 0, sizeof(map));
> +		map.m_lblk = cur_lblock;
> +		map.m_len = bytes_to_blks(inode, len) - cur_lblock;

map.m_len = last_lblock - cur_lblock;

> +		map.m_next_pgofs = &next_pgofs;

map.m_next_pgofs = NULL;
map.m_next_extent = NULL;

> +		map.m_seg_type = NO_CHECK_TYPE;

map.m_may_create = false;

> +
> +		ret = f2fs_map_blocks(inode, &map, 0, F2FS_GET_BLOCK_FIEMAP);
> +

Unneeded blank line.

> +		if (ret)
> +			goto err_out;
> +
> +		/* hole */
> +		if (!(map.m_flags & F2FS_MAP_FLAGS))

ret = -ENOENT;

> +			goto err_out;
> +
> +		pblock = map.m_pblk;
> +		nr_pblocks = map.m_len;
> +
> +		if ((pblock - main_blkaddr) & (blocks_per_sec - 1) ||
> +			nr_pblocks & (blocks_per_sec - 1))

ret = -EINVAL;

> +			goto err_out;
> +
> +		cur_lblock += nr_pblocks;
> +	}
> +
> +	return 0;
> +err_out:
> +	pr_err("swapon: swapfile isn't section-aligned\n");

We should show above message only after we fail in check condition:

	if ((pblock - main_blkaddr) & (blocks_per_sec - 1) ||
		nr_pblocks & (blocks_per_sec - 1)) {
		f2fs_err(sbi, "Swapfile does not align to section");
		goto err_out;
	}

And please use f2fs_{err,warn,info..} macro rather than pr_{err,warn,info..}.

Could you please fix above related issues in check_swap_activate_fast() as well.

> +	return -EINVAL;

return ret;

> +}
> +
>   static int check_swap_activate_fast(struct swap_info_struct *sis,
>   				struct file *swap_file, sector_t *span)
>   {
>   	struct address_space *mapping = swap_file->f_mapping;
>   	struct inode *inode = mapping->host;
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>   	sector_t cur_lblock;
>   	sector_t last_lblock;
>   	sector_t pblock;
> @@ -3793,6 +3845,7 @@ static int check_swap_activate_fast(struct swap_info_struct *sis,
>   	sector_t highest_pblock = 0;
>   	int nr_extents = 0;
>   	unsigned long nr_pblocks;
> +	unsigned int blocks_per_sec = sbi->blocks_per_seg * sbi->segs_per_sec;

Ditto,

>   	u64 len;
>   	int ret;
>   
> @@ -3827,6 +3880,13 @@ static int check_swap_activate_fast(struct swap_info_struct *sis,
>   		pblock = map.m_pblk;
>   		nr_pblocks = map.m_len;
>   
> +		if ((pblock - SM_I(sbi)->main_blkaddr) & (blocks_per_sec - 1) ||
> +			nr_pblocks & (blocks_per_sec - 1)) {
> +			pr_err("swapon: swapfile isn't section-aligned\n");

Ditto,

> +			ret = -EINVAL;
> +			goto out;
> +		}
> +
>   		if (cur_lblock + nr_pblocks >= sis->max)
>   			nr_pblocks = sis->max - cur_lblock;
>   
> @@ -3878,6 +3938,9 @@ static int check_swap_activate(struct swap_info_struct *sis,
>   	if (PAGE_SIZE == F2FS_BLKSIZE)
>   		return check_swap_activate_fast(sis, swap_file, span);
>   
> +	if (f2fs_check_file_aligned(inode))

ret = f2fs_check_file_aligned();
if (ret)
	return ret;

Thanks,

> +		return -EINVAL;
> +
>   	blocks_per_page = bytes_to_blks(inode, PAGE_SIZE);
>   
>   	/*
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
