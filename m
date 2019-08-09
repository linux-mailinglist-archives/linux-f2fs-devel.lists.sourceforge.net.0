Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E89E287E25
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  9 Aug 2019 17:37:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hw6wy-00026K-VV; Fri, 09 Aug 2019 15:37:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1hw6wx-00025y-A4
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 09 Aug 2019 15:37:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Oyfn/6T1QTpra0z5uEmpnHNkbGtHFOe3dg3XEnNl0RU=; b=I9t5P3an1awE7APRyA0xYLsshw
 fTJC/kaQCQPJ3ZqgWddzpYXywH7BuIHReUuTIgYbLAwK26XMFS7n38WQZdaOqgjHJ4+42WzyhkU/+
 iwNQ70hueHcvs+VkD9LimgUNDD2NTG+jHBqP0zCpMjcqjrKRHKBbF89ebpS1V4wRpiss=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Oyfn/6T1QTpra0z5uEmpnHNkbGtHFOe3dg3XEnNl0RU=; b=Y/I/I8LbTuk54tBxcH/UqKfjms
 iIKAzy3yUmVpoBpDG3QxwOcD0by9Wz7ujwUobEEW3dN6ADePXgxd4uvpdiJjX2WpZ2B0pVpFmQCJS
 bbBp3Wc2id/LB7GeAjPlqEzc4cl/ejxvPRupeRvwIh7ZOZ4D+Z/t+44H7+CBtAG3P53Y=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hw6wu-00GUU1-TU
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 09 Aug 2019 15:37:03 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6C3E520C01;
 Fri,  9 Aug 2019 15:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565365014;
 bh=xHy/aZIedO/E/iENvp78HifCYJNuF/LVZNi3PI8gW3s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=btsz1PgUwaoFljerSh/Rd04xXFZLEubJgnRY1W+UpDA8gARX9Chz4/4QiFh3sLwWt
 R5q3KWt5s+XAl0uNWkt9gCS7ad1F2PQX99CnRyie21JijF9T+U5MzVItJ+Mn4aculd
 1UtQ5FB9uMpPuKND6MDzMrBP7kVc/vvwdAa7+aKo=
Date: Fri, 9 Aug 2019 08:36:53 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <20190809153653.GD93481@jaegeuk-macbookpro.roam.corp.google.com>
References: <1565185232-11506-1-git-send-email-stummala@codeaurora.org>
 <2b8f7a88-5204-a4ea-9f80-1056abb30d98@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2b8f7a88-5204-a4ea-9f80-1056abb30d98@kernel.org>
User-Agent: Mutt/1.8.2 (2017-04-18)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hw6wu-00GUU1-TU
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: Fix indefinite loop in f2fs_gc()
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

On 08/07, Chao Yu wrote:
> On 2019-8-7 21:40, Sahitya Tummala wrote:
> > Policy - Foreground GC, LFS and greedy GC mode.
> > 
> > Under this policy, f2fs_gc() loops forever to GC as it doesn't have
> > enough free segements to proceed and thus it keeps calling gc_more
> > for the same victim segment.  This can happen if the selected victim
> > segment could not be GC'd due to failed blkaddr validity check i.e.
> > is_alive() returns false for the blocks set in current validity map.
> > 
> > Fix this by keeping track of such invalid segments and skip those
> > segments for selection in get_victim_by_default() to avoid endless
> > GC loop under such error scenarios. Currently, add this logic under
> > CONFIG_F2FS_CHECK_FS to be able to root cause the issue in debug
> > version.
> > 
> > Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
> > ---
> > v4: Cover all logic with CONFIG_F2FS_CHECK_FS
> > 
> >  fs/f2fs/gc.c      | 31 +++++++++++++++++++++++++++++--
> >  fs/f2fs/segment.c | 14 +++++++++++++-
> >  fs/f2fs/segment.h |  3 +++
> >  3 files changed, 45 insertions(+), 3 deletions(-)
> > 
> > diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> > index 8974672..cbcacbd 100644
> > --- a/fs/f2fs/gc.c
> > +++ b/fs/f2fs/gc.c
> > @@ -382,6 +382,16 @@ static int get_victim_by_default(struct f2fs_sb_info *sbi,
> >  			nsearched++;
> >  		}
> >  
> > +#ifdef CONFIG_F2FS_CHECK_FS
> > +		/*
> > +		 * skip selecting the invalid segno (that is failed due to block
> > +		 * validity check failure during GC) to avoid endless GC loop in
> > +		 * such cases.
> > +		 */
> > +		if (test_bit(segno, sm->invalid_segmap))
> > +			goto next;
> > +#endif
> > +
> >  		secno = GET_SEC_FROM_SEG(sbi, segno);
> >  
> >  		if (sec_usage_check(sbi, secno))
> > @@ -602,8 +612,15 @@ static bool is_alive(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
> >  {
> >  	struct page *node_page;
> >  	nid_t nid;
> > -	unsigned int ofs_in_node;
> > +	unsigned int ofs_in_node, segno;
> >  	block_t source_blkaddr;
> > +	unsigned long offset;
> > +#ifdef CONFIG_F2FS_CHECK_FS
> > +	struct sit_info *sit_i = SIT_I(sbi);
> > +#endif
> > +
> > +	segno = GET_SEGNO(sbi, blkaddr);
> > +	offset = GET_BLKOFF_FROM_SEG0(sbi, blkaddr);
> >  
> >  	nid = le32_to_cpu(sum->nid);
> >  	ofs_in_node = le16_to_cpu(sum->ofs_in_node);
> > @@ -627,8 +644,18 @@ static bool is_alive(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
> >  	source_blkaddr = datablock_addr(NULL, node_page, ofs_in_node);
> >  	f2fs_put_page(node_page, 1);
> >  
> > -	if (source_blkaddr != blkaddr)
> > +	if (source_blkaddr != blkaddr) {
> > +#ifdef CONFIG_F2FS_CHECK_FS
> 
> 		unsigned int segno = GET_SEGNO(sbi, blkaddr);
> 		unsigned int offset = GET_BLKOFF_FROM_SEG0(sbi, blkaddr);
> 
> Should be local, otherwise it looks good to me, I think Jaegeuk can help to fix
> this while merging.

Fixed a bit, and merged.
Thanks~

> 
> Reviewed-by: Chao Yu <yuchao0@huawei.com>
> 
> Thanks,
> 
> > +		if (unlikely(check_valid_map(sbi, segno, offset))) {
> > +			if (!test_and_set_bit(segno, sit_i->invalid_segmap)) {
> > +				f2fs_err(sbi, "mismatched blkaddr %u (source_blkaddr %u) in seg %u\n",
> > +						blkaddr, source_blkaddr, segno);
> > +				f2fs_bug_on(sbi, 1);
> > +			}
> > +		}
> > +#endif
> >  		return false;
> > +	}
> >  	return true;
> >  }
> >  
> > diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> > index a661ac3..ee795b1 100644
> > --- a/fs/f2fs/segment.c
> > +++ b/fs/f2fs/segment.c
> > @@ -806,6 +806,9 @@ static void __remove_dirty_segment(struct f2fs_sb_info *sbi, unsigned int segno,
> >  		enum dirty_type dirty_type)
> >  {
> >  	struct dirty_seglist_info *dirty_i = DIRTY_I(sbi);
> > +#ifdef CONFIG_F2FS_CHECK_FS
> > +	struct sit_info *sit_i = SIT_I(sbi);
> > +#endif
> >  
> >  	if (test_and_clear_bit(segno, dirty_i->dirty_segmap[dirty_type]))
> >  		dirty_i->nr_dirty[dirty_type]--;
> > @@ -817,9 +820,13 @@ static void __remove_dirty_segment(struct f2fs_sb_info *sbi, unsigned int segno,
> >  		if (test_and_clear_bit(segno, dirty_i->dirty_segmap[t]))
> >  			dirty_i->nr_dirty[t]--;
> >  
> > -		if (get_valid_blocks(sbi, segno, true) == 0)
> > +		if (get_valid_blocks(sbi, segno, true) == 0) {
> >  			clear_bit(GET_SEC_FROM_SEG(sbi, segno),
> >  						dirty_i->victim_secmap);
> > +#ifdef CONFIG_F2FS_CHECK_FS
> > +			clear_bit(segno, sit_i->invalid_segmap);
> > +#endif
> > +		}
> >  	}
> >  }
> >  
> > @@ -4015,6 +4022,10 @@ static int build_sit_info(struct f2fs_sb_info *sbi)
> >  	sit_i->sit_bitmap_mir = kmemdup(src_bitmap, bitmap_size, GFP_KERNEL);
> >  	if (!sit_i->sit_bitmap_mir)
> >  		return -ENOMEM;
> > +
> > +	sit_i->invalid_segmap = f2fs_kvzalloc(sbi, bitmap_size, GFP_KERNEL);
> > +	if (!sit_i->invalid_segmap)
> > +		return -ENOMEM;
> >  #endif
> >  
> >  	/* init SIT information */
> > @@ -4517,6 +4528,7 @@ static void destroy_sit_info(struct f2fs_sb_info *sbi)
> >  	kvfree(sit_i->sit_bitmap);
> >  #ifdef CONFIG_F2FS_CHECK_FS
> >  	kvfree(sit_i->sit_bitmap_mir);
> > +	kvfree(sit_i->invalid_segmap);
> >  #endif
> >  	kvfree(sit_i);
> >  }
> > diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> > index b746028..9370d53 100644
> > --- a/fs/f2fs/segment.h
> > +++ b/fs/f2fs/segment.h
> > @@ -229,6 +229,9 @@ struct sit_info {
> >  	char *sit_bitmap;		/* SIT bitmap pointer */
> >  #ifdef CONFIG_F2FS_CHECK_FS
> >  	char *sit_bitmap_mir;		/* SIT bitmap mirror */
> > +
> > +	/* bitmap of segments to be ignored by GC in case of errors */
> > +	unsigned long *invalid_segmap;
> >  #endif
> >  	unsigned int bitmap_size;	/* SIT bitmap size */
> >  
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
