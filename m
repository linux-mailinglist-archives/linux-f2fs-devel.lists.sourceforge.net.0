Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0984FC6BB
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 Apr 2022 23:26:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ne1Y9-0000M4-NT; Mon, 11 Apr 2022 21:26:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1ne1Y7-0000Ly-Vu
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Apr 2022 21:26:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=opHw/YZ6Cin9nfZmfl78jcSHXmmA2I+mdTTzpS8/9AU=; b=QTmgPcZBx3H7qYq8PNqS4wDfJ6
 aqI85liZ2m9h5w8qesRozVh/eIE/9onTluyqw7nXYaSyo0ULXTbreX6Lkl41JQNl2Cj4Qy+R+9Edy
 GTueontGBMUHcilTJWdS6jO6eceDS4X+1nwb/eZT1Dn8i/iAkhxiC7ZOymzG4oHAONnw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=opHw/YZ6Cin9nfZmfl78jcSHXmmA2I+mdTTzpS8/9AU=; b=GYLzbXqMYd/75g07Q5TktbcDe0
 L7ZFvEENlTLhxI4Jo+QUWwbsgoQE02BA+Nk7GG9Tum3Zx3pmLyyBgWfr3i2peQOKuKtQXp3N2hV17
 Cg+gRBSQKgEtxVWBxeNU9AVLaq7ykCM3ZVKC4/Tq1k1EVWYmAQouUzm0C8ednvDXOQt4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1ne1Y3-00D7MA-N0
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Apr 2022 21:26:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 52BA56167A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 11 Apr 2022 21:25:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DBE5C385A3;
 Mon, 11 Apr 2022 21:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649712357;
 bh=oaC6xPOA91VUGaoXvosYsO/Y5SsYoSLeukkWMf5PPWo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gYTlHPebD2S8HWRv1gwLvHb3cRiKNtmbJohllz5TUEs8seoCehj7aDTXfgxceZ7mr
 E7jxCNrF7cDJDvXdlyqZ3g7f44hgyzKwptbzV25l0v9Su8Bf8gZUzZVGM9yxLAXDjj
 Z8CgC2nf5+xTP/qV5irizDIFmBKir6KyBNUYy40YTLF2oPBhGVeY42ABm9XVr3+MBP
 bghS2bQb2QdC6sX84lyLjzc5KKPD3ae9kgvOLAzVSV++KOHftLt1kg4wr+sh53Goh8
 V751MLHQn1yQ3O+EsO/hDg0wueXLqFuoOEihFW3UACC4AggxmYzm8Zpro8RBGmTTag
 YahvyE5GZlH3w==
Date: Mon, 11 Apr 2022 14:25:55 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <YlSc4xJ54jE43VPp@google.com>
References: <20220406152651.5142-1-chao@kernel.org>
 <YlSNjgQwoiENx5EK@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YlSNjgQwoiENx5EK@google.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 04/11, Jaegeuk Kim wrote: > On 04/06, Chao Yu wrote: >
 > Previously, during foreground GC, if victims contain data of pinned file,
 > > it will fail migration of the data, and meanwhile i_gc_failure [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ne1Y3-00D7MA-N0
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: give priority to select unpinned
 section for foreground GC
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

On 04/11, Jaegeuk Kim wrote:
> On 04/06, Chao Yu wrote:
> > Previously, during foreground GC, if victims contain data of pinned file,
> > it will fail migration of the data, and meanwhile i_gc_failures of that
> > pinned file may increase, and when it exceeds threshold, GC will unpin
> > the file, result in breaking pinfile's semantics.
> > 
> > In order to mitigate such condition, let's record and skip section which
> > has pinned file's data and give priority to select unpinned one.
> > 
> > Signed-off-by: Chao Yu <chao.yu@oppo.com>
> > ---
> > v3:
> > - check pin status before pinning section in pin_section().
> >  fs/f2fs/gc.c      | 56 ++++++++++++++++++++++++++++++++++++++++++++---
> >  fs/f2fs/segment.c |  7 ++++++
> >  fs/f2fs/segment.h |  2 ++
> >  3 files changed, 62 insertions(+), 3 deletions(-)
> > 
> > diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> > index 6a7e4148ff9d..df23824ae3c2 100644
> > --- a/fs/f2fs/gc.c
> > +++ b/fs/f2fs/gc.c
> > @@ -646,6 +646,37 @@ static void release_victim_entry(struct f2fs_sb_info *sbi)
> >  	f2fs_bug_on(sbi, !list_empty(&am->victim_list));
> >  }
> >  
> > +static void pin_section(struct f2fs_sb_info *sbi, unsigned int segno)
> 
> Need f2fs_...?
> 
> > +{
> > +	struct dirty_seglist_info *dirty_i = DIRTY_I(sbi);
> > +	unsigned int secno = GET_SEC_FROM_SEG(sbi, segno);
> > +
> > +	if (test_bit(secno, dirty_i->pinned_secmap))
> > +		return;
> > +	set_bit(secno, dirty_i->pinned_secmap);
> > +	dirty_i->pinned_secmap_cnt++;
> > +}
> > +
> > +static bool pinned_section_exists(struct dirty_seglist_info *dirty_i)
> > +{
> > +	return dirty_i->pinned_secmap_cnt;
> > +}
> > +
> > +static bool section_is_pinned(struct dirty_seglist_info *dirty_i,
> > +						unsigned int secno)
> > +{
> > +	return pinned_section_exists(dirty_i) &&
> > +			test_bit(secno, dirty_i->pinned_secmap);
> > +}
> > +
> > +static void unpin_all_sections(struct f2fs_sb_info *sbi)
> > +{
> > +	unsigned int bitmap_size = f2fs_bitmap_size(MAIN_SECS(sbi));
> > +
> > +	memset(DIRTY_I(sbi)->pinned_secmap, 0, bitmap_size);
> > +	DIRTY_I(sbi)->pinned_secmap_cnt = 0;
> > +}
> > +
> >  /*
> >   * This function is called from two paths.
> >   * One is garbage collection and the other is SSR segment selection.
> > @@ -787,6 +818,9 @@ static int get_victim_by_default(struct f2fs_sb_info *sbi,
> >  		if (gc_type == BG_GC && test_bit(secno, dirty_i->victim_secmap))
> >  			goto next;
> >  
> > +		if (gc_type == FG_GC && section_is_pinned(dirty_i, secno))
> > +			goto next;
> > +
> >  		if (is_atgc) {
> >  			add_victim_entry(sbi, &p, segno);
> >  			goto next;
> > @@ -1202,8 +1236,10 @@ static int move_data_block(struct inode *inode, block_t bidx,
> >  	}
> >  
> >  	if (f2fs_is_pinned_file(inode)) {
> > -		if (gc_type == FG_GC)
> > +		if (gc_type == FG_GC) {
> >  			f2fs_pin_file_control(inode, true);
> > +			pin_section(F2FS_I_SB(inode), segno);
> 
> Do we need to check unpinning the inode?
> 			if (!f2fs_pin_file_control())
> 				f2fs_set_pin_section();
> 
> > +		}
> >  		err = -EAGAIN;
> >  		goto out;
> >  	}
> > @@ -1352,8 +1388,10 @@ static int move_data_page(struct inode *inode, block_t bidx, int gc_type,
> >  		goto out;
> >  	}
> >  	if (f2fs_is_pinned_file(inode)) {
> > -		if (gc_type == FG_GC)
> > +		if (gc_type == FG_GC) {
> >  			f2fs_pin_file_control(inode, true);
> > +			pin_section(F2FS_I_SB(inode), segno);
> > +		}
> >  		err = -EAGAIN;
> >  		goto out;
> >  	}
> > @@ -1485,6 +1523,7 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
> >  							gc_type == FG_GC) {
> >  				f2fs_pin_file_control(inode, true);
> >  				iput(inode);
> > +				pin_section(sbi, segno);
> 
> We don't have this code.

Ok, you added this in other patch.

> 
> >  				return submitted;
> >  			}
> >  
> > @@ -1766,9 +1805,17 @@ int f2fs_gc(struct f2fs_sb_info *sbi, bool sync,
> >  		ret = -EINVAL;
> >  		goto stop;
> >  	}
> > +retry:
> >  	ret = __get_victim(sbi, &segno, gc_type);
> > -	if (ret)
> > +	if (ret) {
> > +		/* allow to search victim from sections has pinned data */
> > +		if (ret == -ENODATA && gc_type == FG_GC &&
> > +				pinned_section_exists(DIRTY_I(sbi))) {
> > +			unpin_all_sections(sbi);
> > +			goto retry;
> > +		}
> >  		goto stop;
> > +	}
> >  
> >  	seg_freed = do_garbage_collect(sbi, segno, &gc_list, gc_type, force);
> >  	if (gc_type == FG_GC &&
> > @@ -1811,6 +1858,9 @@ int f2fs_gc(struct f2fs_sb_info *sbi, bool sync,
> >  	SIT_I(sbi)->last_victim[ALLOC_NEXT] = 0;
> >  	SIT_I(sbi)->last_victim[FLUSH_DEVICE] = init_segno;
> >  
> > +	if (gc_type == FG_GC && pinned_section_exists(DIRTY_I(sbi)))
> > +		unpin_all_sections(sbi);
> > +
> >  	trace_f2fs_gc_end(sbi->sb, ret, total_freed, sec_freed,
> >  				get_pages(sbi, F2FS_DIRTY_NODES),
> >  				get_pages(sbi, F2FS_DIRTY_DENTS),
> > diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> > index 012524db7437..1c20d7c9eca3 100644
> > --- a/fs/f2fs/segment.c
> > +++ b/fs/f2fs/segment.c
> > @@ -4736,6 +4736,12 @@ static int init_victim_secmap(struct f2fs_sb_info *sbi)
> >  	dirty_i->victim_secmap = f2fs_kvzalloc(sbi, bitmap_size, GFP_KERNEL);
> >  	if (!dirty_i->victim_secmap)
> >  		return -ENOMEM;
> > +
> > +	dirty_i->pinned_secmap = f2fs_kvzalloc(sbi, bitmap_size, GFP_KERNEL);
> > +	if (!dirty_i->pinned_secmap)
> > +		return -ENOMEM;
> > +
> > +	dirty_i->pinned_secmap_cnt = 0;
> >  	return 0;
> >  }
> >  
> > @@ -5324,6 +5330,7 @@ static void destroy_victim_secmap(struct f2fs_sb_info *sbi)
> >  {
> >  	struct dirty_seglist_info *dirty_i = DIRTY_I(sbi);
> >  
> > +	kvfree(dirty_i->pinned_secmap);
> >  	kvfree(dirty_i->victim_secmap);
> >  }
> >  
> > diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> > index 5c94caf0c0a1..fd6f246e649c 100644
> > --- a/fs/f2fs/segment.h
> > +++ b/fs/f2fs/segment.h
> > @@ -294,6 +294,8 @@ struct dirty_seglist_info {
> >  	struct mutex seglist_lock;		/* lock for segment bitmaps */
> >  	int nr_dirty[NR_DIRTY_TYPE];		/* # of dirty segments */
> >  	unsigned long *victim_secmap;		/* background GC victims */
> > +	unsigned long *pinned_secmap;		/* pinned victims from foreground GC */
> > +	unsigned int pinned_secmap_cnt;		/* count of victims which has pinned data */
> >  };
> >  
> >  /* victim selection function for cleaning and SSR */
> > -- 
> > 2.32.0
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
