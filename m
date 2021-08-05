Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9263E1B6B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  5 Aug 2021 20:37:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mBiEm-00088W-Uk; Thu, 05 Aug 2021 18:37:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1mBiEl-00088Q-4h
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 05 Aug 2021 18:36:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=l4gLaZC4CaRGjJpZCU0wqd8ahOCJYoWZ5WiLKyLVTsU=; b=gTazFIk2vTOmPsbO3cdIi6rpSw
 6g2CM1XYVAFkXxJd1F1urzSe0vRXFUCzkoDCS3dmiajeLmE6D337Uvb8gCzz+sWrpi3MoQ4jZLJzI
 bg7MaQ5xp3gK6lmQ+SALt5C5o1vIH7GTzIP8CbRZ4HUIlgTMw1COHkPRj7bnSogsVVrI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=l4gLaZC4CaRGjJpZCU0wqd8ahOCJYoWZ5WiLKyLVTsU=; b=eUUtpd9oWfQar1W2hp8dtyrpb5
 zvO6+A+buQx8lTBAWaYFPVO8638OM79gzFIYUz2k8hBhZUF+Zfv209c8+waN/lKKnKqhD3hFO6Pzv
 nBTGBfMCotGBHadtNY65BIvcVw6JFyqHCNuwMVstYKfs7X55CS6B8O0i3OnE14LgYpuU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mBiEj-00DeTG-9A
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 05 Aug 2021 18:36:58 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 10089601FF;
 Thu,  5 Aug 2021 18:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628188606;
 bh=jjJGKtQTGYwGJC5Qpg2vszircTQVq4pRg2okgmJ5ItQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PS0GhCzFB7gOewfiGRL1QXCy3eh329CohOaME/70H4eTrFdCVB/v98wpKXf789lND
 DU1l4jbiZnl3IJJqjx5QlWhmIgMxbuvvfp2Wm3m3Iedhq8kTXOTTipqwFQa65HBJEf
 5PecPJ2LoabK7Ou10n/N6D6co0IbEtoDM7/ArF0sLz/wle9nUHjSmFFjwMbz0FEUtj
 l+jvY0AmYhRPYl8sepqmleTCFtiydpNai/J4w5ccXJIHZLQfgcFPa0XVPHExq6uWfj
 61x4lMEhlNSgZ4NqXT5v3pt475ZyBW/lE/3gLhoxiyT/8QcEJTVyOf8aWDW9FMXMXV
 7l4niFHLX200A==
Date: Thu, 5 Aug 2021 11:36:44 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <YQwvvEh8gzEFDH1c@google.com>
References: <20210804022348.1414543-1-chao@kernel.org>
 <YQsIj0wKk6YbN/FJ@google.com> <YQsmfm3ibU6bhvZr@google.com>
 <bb635f86-b29b-384b-cfe0-c8b78e3c9ec5@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bb635f86-b29b-384b-cfe0-c8b78e3c9ec5@kernel.org>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mBiEj-00DeTG-9A
Subject: Re: [f2fs-dev] [RFC v3] f2fs: extent cache: support unaligned extent
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
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Chao Yu <chao.yu@linux.dev>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 08/05, Chao Yu wrote:
> On 2021/8/5 7:45, Jaegeuk Kim wrote:
> > Chao,
> > 
> > How about this?
> > https://github.com/jaegeuk/f2fs/commit/d6bbe121bc24dfabfedc07ba7cb6e921fb70ece0
> > 
> > I'm digging one bug in __insert_extent_tree w/ the patch tho.
> > 
> > On 08/04, Jaegeuk Kim wrote:
> > > On 08/04, Chao Yu wrote:
> > > > Compressed inode may suffer read performance issue due to it can not
> > > > use extent cache, so I propose to add this unaligned extent support
> > > > to improve it.
> > > > 
> > > > Currently, it only works in readonly format f2fs image.
> > > > 
> > > > Unaligned extent: in one compressed cluster, physical block number
> > > > will be less than logical block number, so we add an extra physical
> > > > block length in extent info in order to indicate such extent status.
> > > > 
> > > > The idea is if one whole cluster blocks are contiguous physically,
> > > > once its mapping info was readed at first time, we will cache an
> > > > unaligned (or aligned) extent info entry in extent cache, it expects
> > > > that the mapping info will be hitted when rereading cluster.
> > > > 
> > > > Merge policy:
> > > > - Aligned extents can be merged.
> > > > - Aligned extent and unaligned extent can not be merged.
> > > > 
> > > > Signed-off-by: Chao Yu <chao@kernel.org>
> > > > ---
> > > > v3:
> > > > - avoid CONFIG_F2FS_FS_COMPRESSION as much as possible
> > > > - clean up codes
> > > >   fs/f2fs/compress.c     | 24 ++++++++++++
> > > >   fs/f2fs/data.c         | 28 +++++++++++---
> > > >   fs/f2fs/extent_cache.c | 88 +++++++++++++++++++++++++++++++++++++-----
> > > >   fs/f2fs/f2fs.h         | 42 +++++++++++++++++---
> > > >   fs/f2fs/node.c         | 18 +++++++++
> > > >   5 files changed, 179 insertions(+), 21 deletions(-)
> > > > 
> > > > diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> > > > index 4aa166d3d9bf..296ff37d4b08 100644
> > > > --- a/fs/f2fs/compress.c
> > > > +++ b/fs/f2fs/compress.c
> > > > @@ -1719,6 +1719,30 @@ void f2fs_put_page_dic(struct page *page)
> > > >   	f2fs_put_dic(dic);
> > > >   }
> > > > +/*
> > > > + * check whether cluster blocks are contiguous, and add extent cache entry
> > > > + * only if cluster blocks are logically and physically contiguous.
> > > > + */
> > > > +int f2fs_cluster_blocks_are_contiguous(struct dnode_of_data *dn)
> > > > +{
> > > > +	bool compressed = f2fs_data_blkaddr(dn) == COMPRESS_ADDR;
> > > > +	int i = compressed ? 1 : 0;
> > > > +	block_t first_blkaddr = data_blkaddr(dn->inode, dn->node_page,
> > > > +						dn->ofs_in_node + i);
> > > > +
> > > > +	for (i += 1; i < F2FS_I(dn->inode)->i_cluster_size; i++) {
> > > > +		block_t blkaddr = data_blkaddr(dn->inode, dn->node_page,
> > > > +						dn->ofs_in_node + i);
> > > > +
> > > > +		if (!__is_valid_data_blkaddr(blkaddr))
> > > > +			break;
> > > > +		if (first_blkaddr + i - 1 != blkaddr)
> > > > +			return 0;
> 
> The merge condition looks wrong, shouldn't be:
> 
> if (first_blkaddr + i - compressed ? 1 : 0 != blkaddr)
> 	return 0;

Great. This works. I've queued up the patch with this fix.

Thanks,

> 
> Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
