Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAE5398EBF
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Jun 2021 17:34:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1loSss-0002A5-CB; Wed, 02 Jun 2021 15:34:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1loSsq-00029w-TB
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 02 Jun 2021 15:34:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YrxNVYHTEsrv2kHU2MjA0QIN5Z65fraBt1QGqZXSnRg=; b=GabjdH/SO9lrjnzMRG/1RZ3XbT
 ps7RmBmJBFCTpY1Je7aHXtcuwmd1gBP9nqGTvsopyKLk/Z8/HfJv/8ZabqdTGYr9eWM6mpqLOgT6y
 FSwUBysy+7pWBb/9tecD2Rq7INL8PzjVmSaVQ9LYeAvMVR79nbTl8abw9i/BK+NBMT1o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YrxNVYHTEsrv2kHU2MjA0QIN5Z65fraBt1QGqZXSnRg=; b=bD/xcbkz2G/15xOXrjThD21MPf
 4h8E+6Dte73J+96A08zmY9UDTrqDnk/LwTX3j3qrtSPMwo1Fyi3kgK0qs7IEsh97w/9JaF5WsFXI/
 XGApiJ1mAOqUPLOYJHQSAY6xCQn5zuVbthBgGDTsAV64yWx4czgfEcM06ZuH3fETVlDE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1loSsm-007RsW-4O
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 02 Jun 2021 15:34:19 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9D961610C8;
 Wed,  2 Jun 2021 15:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622648046;
 bh=WzRkpqDT9rtR1tyCqRm6HCqhGHlRRytAMLxNBfRtvog=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mokpwC/70BJAIpYvej+U+p2/Gy2cR9+72MgG2F8S7yBor3wtu43Mupnh2JB7qWXqb
 361ScpUm80wo+5iIQzAkHP7xSi8lBFCP+ZJY3CaurD1m0qP3OE7UR9weYQEi6AGbP5
 kkEmWjBiXnmvPfnfj5vtU0P9kvNkY22VoDT+osZ6qhwQbpnNN/ytWH00U/hBhubwKM
 UU8LzTyTiC/bV/G492UUcVhfUa4QSZfFS+jheoG7hGa9hsuqUHl7fNJsm3Hs5eDqk0
 3Zr82ohFORTyzT7xn8JGfLL4n1mOvGFSqVXLI05nY4r/U12db4rYldVp2fVxaP2VkP
 2ncYHU+3iI1pw==
Date: Wed, 2 Jun 2021 08:34:05 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <YLek7U+BaFvHhz58@google.com>
References: <YKz0VJSYYBEnF75V@google.com> <YKz1gGctmOJ+LjOn@google.com>
 <2c4db877-b5e6-1139-98b5-be2d9e7872be@kernel.org>
 <YK0DVi4aTNdXDN3L@google.com>
 <dda2400f-4a06-0ef6-b4f5-8aafe86bd81d@huawei.com>
 <YK5Mewfb3gMg1yGM@google.com>
 <5140516c-e4c6-fd6a-69b2-7566c903cb53@kernel.org>
 <YLZc0y0S3sGkU6f4@google.com> <YLZt+rFClf7xEzOa@google.com>
 <09fa74d3-a9df-028f-3ebc-2b845e5cd609@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <09fa74d3-a9df-028f-3ebc-2b845e5cd609@kernel.org>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1loSsm-007RsW-4O
Subject: Re: [f2fs-dev] [PATCH v6] f2fs: compress: add compress_inode to
 cache compressed blocks
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 06/02, Chao Yu wrote:
> On 2021/6/2 1:27, Jaegeuk Kim wrote:
> > On 06/01, Jaegeuk Kim wrote:
> > > On 05/26, Chao Yu wrote:
> > > > On 2021/5/26 21:26, Jaegeuk Kim wrote:
> > > > > On 05/26, Chao Yu wrote:
> > > > > > On 2021/5/25 22:01, Jaegeuk Kim wrote:
> > > > > > > On 05/25, Chao Yu wrote:
> > > > > > > > On 2021/5/25 21:02, Jaegeuk Kim wrote:
> > > > > > > > > On 05/25, Jaegeuk Kim wrote:
> > > > > > > > > > On 05/25, Chao Yu wrote:
> > > > > > > > > > > Also, and queue this?
> > > > > > > > > > 
> > > > > > > > > > Easy to get this?
> > > > > > > > > 
> > > > > > > > > need GFP_NOFS?
> > > > > > > > 
> > > > > > > > Not sure, I use __GFP_IO intentionally here to avoid __GFP_RECLAIM from
> > > > > > > > GFP_NOFS, because in low memory case, I don't want to instead page cache
> > > > > > > > of normal file with page cache of sbi->compress_inode.
> > > > > > > > 
> > > > > > > > What is memory size in your vm?
> > > > > > > 
> > > > > > > 4GB. If I set GFP_NOFS, I don't see the error anymore, at least.
> > > > > > 
> > > > > > I applied below patch and don't see the warning message anymore.
> > > > > > 
> > > > > > ---
> > > > > >    fs/f2fs/compress.c | 2 +-
> > > > > >    1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > > 
> > > > > > diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> > > > > > index 701dd0f6f4ec..ed5b7fabc604 100644
> > > > > > --- a/fs/f2fs/compress.c
> > > > > > +++ b/fs/f2fs/compress.c
> > > > > > @@ -1703,7 +1703,7 @@ void f2fs_cache_compressed_page(struct f2fs_sb_info *sbi, struct page *page,
> > > > > >    	avail_ram = si.totalram - si.totalhigh;
> > > > > > 
> > > > > >    	/* free memory is lower than watermark, deny caching compress page */
> > > > > > -	if (free_ram <= sbi->compress_watermark / 100 * avail_ram)
> > > > 
> > > > This is buggy, because sbi->compress_watermark equals to 20, so that
> > > > sbi->compress_watermark / 100 * avail_ram always be zero...
> > > > 
> > > > After this change, if free ram is lower, we may just skip caching
> > > > compressed blocks here.
> > > 
> > > Can we move this in f2fs_available_free_memory()?
> 
> More clean.
> 
> One comment below:
> 
> > 
> > Testing this.
> > 
> > ---
> >   fs/f2fs/compress.c | 14 +-------------
> >   fs/f2fs/node.c     | 11 ++++++++++-
> >   fs/f2fs/node.h     |  1 +
> >   3 files changed, 12 insertions(+), 14 deletions(-)
> > 
> > diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> > index 9fd62a0a646b..455561826c7d 100644
> > --- a/fs/f2fs/compress.c
> > +++ b/fs/f2fs/compress.c
> > @@ -1688,8 +1688,6 @@ void f2fs_cache_compressed_page(struct f2fs_sb_info *sbi, struct page *page,
> >   {
> >   	struct page *cpage;
> >   	int ret;
> > -	struct sysinfo si;
> > -	unsigned long free_ram, avail_ram;
> >   	if (!test_opt(sbi, COMPRESS_CACHE))
> >   		return;
> > @@ -1697,17 +1695,7 @@ void f2fs_cache_compressed_page(struct f2fs_sb_info *sbi, struct page *page,
> >   	if (!f2fs_is_valid_blkaddr(sbi, blkaddr, DATA_GENERIC_ENHANCE_READ))
> >   		return;
> > -	si_meminfo(&si);
> > -	free_ram = si.freeram;
> > -	avail_ram = si.totalram - si.totalhigh;
> > -
> > -	/* free memory is lower than watermark, deny caching compress page */
> > -	if (free_ram <= sbi->compress_watermark / 100 * avail_ram)
> > -		return;
> > -
> > -	/* cached page count exceed threshold, deny caching compress page */
> > -	if (COMPRESS_MAPPING(sbi)->nrpages >=
> 
> Need to cover COMPRESS_MAPPING() with CONFIG_F2FS_FS_COMPRESSION.

Added like this.

--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -99,6 +99,7 @@ bool f2fs_available_free_memory(struct f2fs_sb_info *sbi, int type)
                                sizeof(struct discard_cmd)) >> PAGE_SHIFT;
                res = mem_size < (avail_ram * nm_i->ram_thresh / 100);
        } else if (type == COMPRESS_PAGE) {
+#ifdef CONFIG_F2FS_FS_COMPRESSION
                /*
                 * free memory is lower than watermark or cached page count
                 * exceed threshold, deny caching compress page.
@@ -106,6 +107,9 @@ bool f2fs_available_free_memory(struct f2fs_sb_info *sbi, int type)
                res = (free_ram > avail_ram * sbi->compress_watermark / 100) &&
                        (COMPRESS_MAPPING(sbi)->nrpages <
                         free_ram * sbi->compress_percent / 100);
+#else
+               res = false;
+#endif
        } else {
                if (!sbi->sb->s_bdi->wb.dirty_exceeded)
                        return true;

> 
> Thanks,
> 
> > -			free_ram / 100 * sbi->compress_percent)
> > +	if (!f2fs_available_free_memory(sbi, COMPRESS_PAGE))
> >   		return;
> >   	cpage = find_get_page(COMPRESS_MAPPING(sbi), blkaddr);
> > diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> > index 3a8f7afa5059..67093416ce9c 100644
> > --- a/fs/f2fs/node.c
> > +++ b/fs/f2fs/node.c
> > @@ -45,7 +45,7 @@ bool f2fs_available_free_memory(struct f2fs_sb_info *sbi, int type)
> >   	struct f2fs_nm_info *nm_i = NM_I(sbi);
> >   	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
> >   	struct sysinfo val;
> > -	unsigned long avail_ram;
> > +	unsigned long avail_ram, free_ram;
> >   	unsigned long mem_size = 0;
> >   	bool res = false;
> > @@ -56,6 +56,7 @@ bool f2fs_available_free_memory(struct f2fs_sb_info *sbi, int type)
> >   	/* only uses low memory */
> >   	avail_ram = val.totalram - val.totalhigh;
> > +	free_ram = val.freeram;
> >   	/*
> >   	 * give 25%, 25%, 50%, 50%, 50% memory for each components respectively
> > @@ -97,6 +98,14 @@ bool f2fs_available_free_memory(struct f2fs_sb_info *sbi, int type)
> >   		mem_size = (atomic_read(&dcc->discard_cmd_cnt) *
> >   				sizeof(struct discard_cmd)) >> PAGE_SHIFT;
> >   		res = mem_size < (avail_ram * nm_i->ram_thresh / 100);
> > +	} else if (type == COMPRESS_PAGE) {
> > +		/*
> > +		 * free memory is lower than watermark or cached page count
> > +		 * exceed threshold, deny caching compress page.
> > +		 */
> > +		res = (free_ram > avail_ram * sbi->compress_watermark / 100) &&
> > +			(COMPRESS_MAPPING(sbi)->nrpages <
> > +			 free_ram * sbi->compress_percent / 100);
> >   	} else {
> >   		if (!sbi->sb->s_bdi->wb.dirty_exceeded)
> >   			return true;
> > diff --git a/fs/f2fs/node.h b/fs/f2fs/node.h
> > index d85e8659cfda..84d45385d1f2 100644
> > --- a/fs/f2fs/node.h
> > +++ b/fs/f2fs/node.h
> > @@ -148,6 +148,7 @@ enum mem_type {
> >   	EXTENT_CACHE,	/* indicates extent cache */
> >   	INMEM_PAGES,	/* indicates inmemory pages */
> >   	DISCARD_CACHE,	/* indicates memory of cached discard cmds */
> > +	COMPRESS_PAGE,	/* indicates memory of cached compressed pages */
> >   	BASE_CHECK,	/* check kernel status */
> >   };
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
