Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C2B591505
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Aug 2022 19:38:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oMYcQ-0003QK-7I;
	Fri, 12 Aug 2022 17:38:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1oMYcO-0003QE-AD
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Aug 2022 17:38:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+Mpbtti4uQIImMfUAU9fTHhjK3SRCWiXLd7kTtioxIY=; b=ZZtFpy+g8GbjfQzX4YRL1My9qs
 EF/9u7iDvPdcHQuO8TrYYJDRv/0WeEbyQO0cjL2dLMwq2hwdPuukga2/X5ubb/sSoFG7TCTPXq4Ao
 IywNMZlV8anIF7sN0S17QicMuEC621trsW0Xz/ganSWbKbAaZbTwrCJp3kIu+Wy3iqLg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+Mpbtti4uQIImMfUAU9fTHhjK3SRCWiXLd7kTtioxIY=; b=Lo6YdfwydZuGJfDpxsJQKs3X7X
 OjyCpI2+jn/EtQLSouLtrM4gAePRKySIQDyXiiGJ/+i8hBVaPgAHHBQsekgkDmeuWQGycPyOVfZhz
 x1oHuDSV5tcB5W1YXbf95EowDqjsu91B5UwdtcBvqOvjbspzdWPVO6JIV7XmQ585UFwA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oMYcN-00DcdG-Do
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 12 Aug 2022 17:38:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 71A726170D;
 Fri, 12 Aug 2022 17:38:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA641C433C1;
 Fri, 12 Aug 2022 17:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660325911;
 bh=rjmhqXSwqox4CdjhP5/w/has7l+KpFneuCmXpK0l/B8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HW8MMKVqcnSkryJnwaL2z0C1ndYqDxCC9+m5jLAg95L6U6EP0GlIYkXcGpQ8rZ3uO
 RaSd/hXSevHnJUuGNubNBPoiLa7o4mWd7uJlacnj64Kak56x3QEJtFDNn2u4EpGbyy
 brgpUnSAaFCA6D4Eq6068Y9pct1MQugnWS7f2EqYdUdbMdgKHu5cYy0Kza4z4ObB5n
 4Ii1yLsUoFw1Ujn+zvZOPzJNFHRd5BxnFDHkDZ/VlhfMBWsCwusuGyFRPr6uH0/EWI
 IgonUW0uxr8TA1Ftn5bfK1iJjwi4lV9nh+8ii3QjPkIdw0HSHPr+RQlrxey4/+748C
 Zb+6VdTZgr8rQ==
Date: Fri, 12 Aug 2022 10:38:30 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Weichao Guo <guoweichao@oppo.com>
Message-ID: <YvaQFmrvi5/8YcXm@google.com>
References: <1660276608-751-1-git-send-email-guoweichao@oppo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1660276608-751-1-git-send-email-guoweichao@oppo.com>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Weichao, On 08/12, Weichao Guo wrote: > When we try to
 defrag a file, its data blocks may mess with others if there > are lots of
 concurrent writes. This causes the file is still fragmented > after defrag.
 So [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oMYcN-00DcdG-Do
Subject: Re: [f2fs-dev] [PATCH] f2fs: allocate consective blkaddrs for
 defragment
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
Cc: zhangshiming@oppo.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Weichao,

On 08/12, Weichao Guo wrote:
> When we try to defrag a file, its data blocks may mess with others if there
> are lots of concurrent writes. This causes the file is still fragmented
> after defrag. So It's better to isolate defrag writes from others.

I really don't want to add more log like this. What about using
wb_sync_req[DATA] to prevent async writes at least?

> 
> Signed-off-by: Weichao Guo <guoweichao@oppo.com>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/debug.c   | 4 ++++
>  fs/f2fs/f2fs.h    | 2 ++
>  fs/f2fs/file.c    | 5 +++++
>  fs/f2fs/segment.c | 7 +++++++
>  fs/f2fs/segment.h | 5 ++++-
>  5 files changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
> index c014715..d85dc17 100644
> --- a/fs/f2fs/debug.c
> +++ b/fs/f2fs/debug.c
> @@ -442,6 +442,10 @@ static int stat_show(struct seq_file *s, void *v)
>  			   si->curseg[CURSEG_ALL_DATA_ATGC],
>  			   si->cursec[CURSEG_ALL_DATA_ATGC],
>  			   si->curzone[CURSEG_ALL_DATA_ATGC]);
> +		seq_printf(s, "  - DEFRAG   data: %8d %8d %8d\n",
> +			   si->curseg[CURSEG_COLD_DATA_DEFRAG],
> +			   si->cursec[CURSEG_COLD_DATA_DEFRAG],
> +			   si->curzone[CURSEG_COLD_DATA_DEFRAG]);
>  		seq_printf(s, "\n  - Valid: %d\n  - Dirty: %d\n",
>  			   si->main_area_segs - si->dirty_count -
>  			   si->prefree_count - si->free_segs,
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 3c7cdb7..5f9a185 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -760,6 +760,7 @@ enum {
>  	FI_COMPRESS_RELEASED,	/* compressed blocks were released */
>  	FI_ALIGNED_WRITE,	/* enable aligned write */
>  	FI_COW_FILE,		/* indicate COW file */
> +	FI_DEFRAG_WRITE,	/* indicate defragment writes need consective blkaddrs*/
>  	FI_MAX,			/* max flag, never be used */
>  };
>  
> @@ -1017,6 +1018,7 @@ enum {
>  	CURSEG_COLD_DATA_PINNED = NR_PERSISTENT_LOG,
>  				/* pinned file that needs consecutive block address */
>  	CURSEG_ALL_DATA_ATGC,	/* SSR alloctor in hot/warm/cold data area */
> +	CURSEG_COLD_DATA_DEFRAG,/* used for defragment which needs consective blkaddrs */
>  	NO_CHECK_TYPE,		/* number of persistent & inmem log */
>  };
>  
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index ce4905a0..f104e2e 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -2626,7 +2626,12 @@ static int f2fs_defragment_range(struct f2fs_sb_info *sbi,
>  
>  		clear_inode_flag(inode, FI_SKIP_WRITES);
>  
> +		set_inode_flag(inode, FI_DEFRAG_WRITE);
> +		f2fs_lock_op(sbi);
> +		f2fs_allocate_new_section(sbi, CURSEG_COLD_DATA_DEFRAG, false);
> +		f2fs_unlock_op(sbi);
>  		err = filemap_fdatawrite(inode->i_mapping);
> +		clear_inode_flag(inode, FI_DEFRAG_WRITE);
>  		if (err)
>  			goto out;
>  	}
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 0de21f8..17e7d14 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -2749,6 +2749,7 @@ static void __f2fs_save_inmem_curseg(struct f2fs_sb_info *sbi, int type)
>  void f2fs_save_inmem_curseg(struct f2fs_sb_info *sbi)
>  {
>  	__f2fs_save_inmem_curseg(sbi, CURSEG_COLD_DATA_PINNED);
> +	__f2fs_save_inmem_curseg(sbi, CURSEG_COLD_DATA_DEFRAG);
>  
>  	if (sbi->am.atgc_enabled)
>  		__f2fs_save_inmem_curseg(sbi, CURSEG_ALL_DATA_ATGC);
> @@ -2774,6 +2775,7 @@ static void __f2fs_restore_inmem_curseg(struct f2fs_sb_info *sbi, int type)
>  void f2fs_restore_inmem_curseg(struct f2fs_sb_info *sbi)
>  {
>  	__f2fs_restore_inmem_curseg(sbi, CURSEG_COLD_DATA_PINNED);
> +	__f2fs_restore_inmem_curseg(sbi, CURSEG_COLD_DATA_DEFRAG);
>  
>  	if (sbi->am.atgc_enabled)
>  		__f2fs_restore_inmem_curseg(sbi, CURSEG_ALL_DATA_ATGC);
> @@ -3161,6 +3163,9 @@ static int __get_segment_type_6(struct f2fs_io_info *fio)
>  		if (is_inode_flag_set(inode, FI_ALIGNED_WRITE))
>  			return CURSEG_COLD_DATA_PINNED;
>  
> +		if (is_inode_flag_set(inode, FI_DEFRAG_WRITE))
> +			return CURSEG_COLD_DATA_DEFRAG;
> +
>  		if (page_private_gcing(fio->page)) {
>  			if (fio->sbi->am.atgc_enabled &&
>  				(fio->io_type == FS_DATA_IO) &&
> @@ -4332,6 +4337,8 @@ static int build_curseg(struct f2fs_sb_info *sbi)
>  			array[i].seg_type = CURSEG_COLD_DATA;
>  		else if (i == CURSEG_ALL_DATA_ATGC)
>  			array[i].seg_type = CURSEG_COLD_DATA;
> +		else if (i == CURSEG_COLD_DATA_DEFRAG)
> +			array[i].seg_type = CURSEG_COLD_DATA;
>  		array[i].segno = NULL_SEGNO;
>  		array[i].next_blkoff = 0;
>  		array[i].inited = false;
> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> index d1d6376..75e2aa8 100644
> --- a/fs/f2fs/segment.h
> +++ b/fs/f2fs/segment.h
> @@ -44,7 +44,8 @@ static inline void sanity_check_seg_type(struct f2fs_sb_info *sbi,
>  	 ((seg) == CURSEG_I(sbi, CURSEG_WARM_NODE)->segno) ||	\
>  	 ((seg) == CURSEG_I(sbi, CURSEG_COLD_NODE)->segno) ||	\
>  	 ((seg) == CURSEG_I(sbi, CURSEG_COLD_DATA_PINNED)->segno) ||	\
> -	 ((seg) == CURSEG_I(sbi, CURSEG_ALL_DATA_ATGC)->segno))
> +	 ((seg) == CURSEG_I(sbi, CURSEG_ALL_DATA_ATGC)->segno) ||	\
> +	 ((seg) == CURSEG_I(sbi, CURSEG_COLD_DATA_DEFRAG)->segno))
>  
>  #define IS_CURSEC(sbi, secno)						\
>  	(((secno) == CURSEG_I(sbi, CURSEG_HOT_DATA)->segno /		\
> @@ -62,6 +63,8 @@ static inline void sanity_check_seg_type(struct f2fs_sb_info *sbi,
>  	 ((secno) == CURSEG_I(sbi, CURSEG_COLD_DATA_PINNED)->segno /	\
>  	  (sbi)->segs_per_sec) ||	\
>  	 ((secno) == CURSEG_I(sbi, CURSEG_ALL_DATA_ATGC)->segno /	\
> +	  (sbi)->segs_per_sec) ||	\
> +	 ((secno) == CURSEG_I(sbi, CURSEG_COLD_DATA_DEFRAG)->segno /	\
>  	  (sbi)->segs_per_sec))
>  
>  #define MAIN_BLKADDR(sbi)						\
> -- 
> 2.7.4


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
