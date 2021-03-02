Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D4D3295DE
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  2 Mar 2021 05:20:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lGwWM-0004tS-PW; Tue, 02 Mar 2021 04:20:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1lGwWL-0004tL-No
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Mar 2021 04:20:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+A4FzxF/k/6SOpy9fRhookVYjR/U9JbdUKv0UK0ndUs=; b=fspLcXmxdarcCib7Y+Jolw7OJG
 +SrOjsx51rKpnQDixH4ccPdpAyhQ0TiNkOkS3g8yxzAbOaBxNM3tPoG/yQOA866NrnBREQlqFdlfD
 hr3aC7QoeYsToaFoc79/w63dPTZtWjJZldchEH+Arn6GyStg3voowM2lbhePioJRw4Ak=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+A4FzxF/k/6SOpy9fRhookVYjR/U9JbdUKv0UK0ndUs=; b=fwiwBMVRB0v8eX5U07hIF8suYy
 dfmDpHy92B2uhkagKuDPzJS5C+Zjc2rmqifH0RifTVlmZUBiXx+v0U4H26+iNvaczq/KQ3u1xaR9n
 14nkmgq3nH762CeDFZnHJXfblcizcRVmCIYfrVjMk9aEd8MZfMX0oPvyR8qwXEQzlEEU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lGwWB-00Ajyd-EW
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Mar 2021 04:20:29 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 10601601FA;
 Tue,  2 Mar 2021 04:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614658812;
 bh=vOXe667EPdjWGQsTKUtkqDCOaVMfZzzv1gKuybI2dY0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=L1kyoFKot1Kt8f7W4hCqI5IH94AhK754adlGNmVtpxPkcbfg9avxDjyA2O0V9Qc0S
 IxkKHipP2SW9wUeu24TYYBdvLZ+4I2xR2z143/TLpjKgMbMqDAO8gBP2bfwT9zzR4V
 QC8iUBSau8+NM4+mFPpQiON1v8M6pzt2ld2Uqf7DYt/uCYJvEnEBHY+w4/GvkGaP+w
 zrdBcLTEvUSRZvrGA4BekWHPt9g6ELAMHsTlcesh86/7VH4uw8KcE8pp0Kn2QAIKl/
 Yjg73tWlyQNzE43tFugRdnXhz1G6QYFZSDawHuNU8Csnm4tInD3p86w2wgO9oTh6cc
 fsPxUuCUkmqlA==
Date: Mon, 1 Mar 2021 20:20:10 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <YD28+iVg4sjS3+22@google.com>
References: <20210227120231.136559-1-huangjianan@oppo.com>
 <20210227120231.136559-3-huangjianan@oppo.com>
 <b4ae58b2-3325-6cdf-26b4-b77810d33bbc@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b4ae58b2-3325-6cdf-26b4-b77810d33bbc@huawei.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: oppo.com]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lGwWB-00Ajyd-EW
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 zhangshiming@oppo.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 03/01, Chao Yu wrote:
> Hi Jianan,

Merged 1/3 and 2/3, so please post v2 on 3/3.

Thanks,

> 
> On 2021/2/27 20:02, Huang Jianan via Linux-f2fs-devel wrote:
> > If the swapfile isn't created by pin and fallocate, it cann't be
> 
> Typo:
> 
> can't
> 
> > guaranteed section-aligned, so it may be selected by f2fs gc. When
> > gc_pin_file_threshold is reached, the address of swapfile may change,
> > but won't be synchroniz to swap_extent, so swap will write to wrong
> 
> synchronized
> 
> > address, which will cause data corruption.
> > 
> > Signed-off-by: Huang Jianan <huangjianan@oppo.com>
> > Signed-off-by: Guo Weichao <guoweichao@oppo.com>
> > ---
> >   fs/f2fs/data.c | 63 ++++++++++++++++++++++++++++++++++++++++++++++++++
> >   1 file changed, 63 insertions(+)
> > 
> > diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> > index 4dbc1cafc55d..3e523d6e4643 100644
> > --- a/fs/f2fs/data.c
> > +++ b/fs/f2fs/data.c
> > @@ -3781,11 +3781,63 @@ int f2fs_migrate_page(struct address_space *mapping,
> >   #endif
> >   #ifdef CONFIG_SWAP
> > +static int f2fs_check_file_aligned(struct inode *inode)
> 
> f2fs_check_file_alignment() or f2fs_is_file_aligned()?
> 
> > +{
> > +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> > +	block_t main_blkaddr = SM_I(sbi)->main_blkaddr;
> > +	block_t cur_lblock;
> > +	block_t last_lblock;
> > +	block_t pblock;
> > +	unsigned long len;
> > +	unsigned long nr_pblocks;
> > +	unsigned int blocks_per_sec = sbi->blocks_per_seg * sbi->segs_per_sec;
> 
> unsigned int blocks_per_sec = BLKS_PER_SEC(sbi);
> 
> > +	int ret;
> > +
> > +	cur_lblock = 0;
> > +	last_lblock = bytes_to_blks(inode, i_size_read(inode));
> > +	len = i_size_read(inode);
> > +
> > +	while (cur_lblock < last_lblock) {
> > +		struct f2fs_map_blocks map;
> > +		pgoff_t next_pgofs;
> > +
> > +		memset(&map, 0, sizeof(map));
> > +		map.m_lblk = cur_lblock;
> > +		map.m_len = bytes_to_blks(inode, len) - cur_lblock;
> 
> map.m_len = last_lblock - cur_lblock;
> 
> > +		map.m_next_pgofs = &next_pgofs;
> 
> map.m_next_pgofs = NULL;
> map.m_next_extent = NULL;
> 
> > +		map.m_seg_type = NO_CHECK_TYPE;
> 
> map.m_may_create = false;
> 
> > +
> > +		ret = f2fs_map_blocks(inode, &map, 0, F2FS_GET_BLOCK_FIEMAP);
> > +
> 
> Unneeded blank line.
> 
> > +		if (ret)
> > +			goto err_out;
> > +
> > +		/* hole */
> > +		if (!(map.m_flags & F2FS_MAP_FLAGS))
> 
> ret = -ENOENT;
> 
> > +			goto err_out;
> > +
> > +		pblock = map.m_pblk;
> > +		nr_pblocks = map.m_len;
> > +
> > +		if ((pblock - main_blkaddr) & (blocks_per_sec - 1) ||
> > +			nr_pblocks & (blocks_per_sec - 1))
> 
> ret = -EINVAL;
> 
> > +			goto err_out;
> > +
> > +		cur_lblock += nr_pblocks;
> > +	}
> > +
> > +	return 0;
> > +err_out:
> > +	pr_err("swapon: swapfile isn't section-aligned\n");
> 
> We should show above message only after we fail in check condition:
> 
> 	if ((pblock - main_blkaddr) & (blocks_per_sec - 1) ||
> 		nr_pblocks & (blocks_per_sec - 1)) {
> 		f2fs_err(sbi, "Swapfile does not align to section");
> 		goto err_out;
> 	}
> 
> And please use f2fs_{err,warn,info..} macro rather than pr_{err,warn,info..}.
> 
> Could you please fix above related issues in check_swap_activate_fast() as well.
> 
> > +	return -EINVAL;
> 
> return ret;
> 
> > +}
> > +
> >   static int check_swap_activate_fast(struct swap_info_struct *sis,
> >   				struct file *swap_file, sector_t *span)
> >   {
> >   	struct address_space *mapping = swap_file->f_mapping;
> >   	struct inode *inode = mapping->host;
> > +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> >   	sector_t cur_lblock;
> >   	sector_t last_lblock;
> >   	sector_t pblock;
> > @@ -3793,6 +3845,7 @@ static int check_swap_activate_fast(struct swap_info_struct *sis,
> >   	sector_t highest_pblock = 0;
> >   	int nr_extents = 0;
> >   	unsigned long nr_pblocks;
> > +	unsigned int blocks_per_sec = sbi->blocks_per_seg * sbi->segs_per_sec;
> 
> Ditto,
> 
> >   	u64 len;
> >   	int ret;
> > @@ -3827,6 +3880,13 @@ static int check_swap_activate_fast(struct swap_info_struct *sis,
> >   		pblock = map.m_pblk;
> >   		nr_pblocks = map.m_len;
> > +		if ((pblock - SM_I(sbi)->main_blkaddr) & (blocks_per_sec - 1) ||
> > +			nr_pblocks & (blocks_per_sec - 1)) {
> > +			pr_err("swapon: swapfile isn't section-aligned\n");
> 
> Ditto,
> 
> > +			ret = -EINVAL;
> > +			goto out;
> > +		}
> > +
> >   		if (cur_lblock + nr_pblocks >= sis->max)
> >   			nr_pblocks = sis->max - cur_lblock;
> > @@ -3878,6 +3938,9 @@ static int check_swap_activate(struct swap_info_struct *sis,
> >   	if (PAGE_SIZE == F2FS_BLKSIZE)
> >   		return check_swap_activate_fast(sis, swap_file, span);
> > +	if (f2fs_check_file_aligned(inode))
> 
> ret = f2fs_check_file_aligned();
> if (ret)
> 	return ret;
> 
> Thanks,
> 
> > +		return -EINVAL;
> > +
> >   	blocks_per_page = bytes_to_blks(inode, PAGE_SIZE);
> >   	/*
> > 
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
