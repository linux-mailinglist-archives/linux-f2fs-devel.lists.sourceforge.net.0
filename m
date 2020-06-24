Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F6E207F52
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Jun 2020 00:31:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1joDvO-0005Xs-Rp; Wed, 24 Jun 2020 22:31:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1joDvN-0005Xl-Fh
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 24 Jun 2020 22:31:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DRVugW/SjbjElfzegAHJUAh6m8n1qPIPxnfOvw+iXVc=; b=A3D+dxTMHtuVknfiwui/xktiCd
 9lvOLZeFot8H/FlkXEXg35p3XY02edXnn3g/zcOm16fYilhBVkUnllUytD1gd+FfUIB4Oioh/RRga
 BH6/vbmrvr5mjw42nlj+quUXIo0GwwctLbsgrZ2ArLt3XhOKBDBtfvr0Y2MexG2Ryo58=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DRVugW/SjbjElfzegAHJUAh6m8n1qPIPxnfOvw+iXVc=; b=Qxmyku8S9P144m+JxO2Ytw+hi2
 bSo8lCQ3G0YXm/fRnheYQknnVGQf6VqoiBCOMsgRM414L0+PkzbJOT7dFurXmIxXF6lRsbPMZm4FQ
 fD3e4VlHKt4ujLoPy2T2FpDUmT8ke29UPNdSg5NT0TxDumtSNr3zxnTrnl6YjYQTo0mg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1joDvM-00HPBl-5G
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 24 Jun 2020 22:31:21 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A9FB220720;
 Wed, 24 Jun 2020 22:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593037874;
 bh=b0I9CFl8gqSvhvJoPFAwk/2J/WfPhv+Dp/MUWb6bqRo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S2jZBOw1an015d2mFROHqozGpByKNC6X91ofYiYPEAKrFqKRRA1B7T1t+lRYWi8Lp
 q9pfGhQDE6XE0y4hUVuPs6xld30rY/zuBTy5I7St0zsXoyAnIABMwq/MdeLsCa0oaY
 tJT2vJ/qLbc/H7vIMVhSSwB5rSRA8eCu2Z4eIjy8=
Date: Wed, 24 Jun 2020 15:31:14 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200624223114.GA192472@google.com>
References: <20200618063625.110273-1-yuchao0@huawei.com>
 <20200618063625.110273-5-yuchao0@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200618063625.110273-5-yuchao0@huawei.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1joDvM-00HPBl-5G
Subject: Re: [f2fs-dev] [PATCH 5/5] f2fs: show more debug info for
 per-temperature log
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

On 06/18, Chao Yu wrote:
> - Add to account and show per-log dirty_seg, full_seg and valid_blocks
> in debugfs.
> - reformat printed info.
> 
>     TYPE            segno    secno   zoneno  dirty_seg   full_seg  valid_blk
>   - COLD   data:     1523     1523     1523          1          0        399
>   - WARM   data:      769      769      769         20        255     133098
>   - HOT    data:      767      767      767          9          0        167
>   - Dir   dnode:       22       22       22          3          0         70
>   - File  dnode:      722      722      722         14         10       6505
>   - Indir nodes:        2        2        2          1          0          3
> 
> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> ---
>  fs/f2fs/debug.c | 67 ++++++++++++++++++++++++++++++++++++++++---------
>  fs/f2fs/f2fs.h  |  3 +++
>  2 files changed, 58 insertions(+), 12 deletions(-)
> 
> diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
> index 0dbcb0f9c019..aa1fd2de11ba 100644
> --- a/fs/f2fs/debug.c
> +++ b/fs/f2fs/debug.c
> @@ -174,6 +174,29 @@ static void update_general_status(struct f2fs_sb_info *sbi)
>  	for (i = META_CP; i < META_MAX; i++)
>  		si->meta_count[i] = atomic_read(&sbi->meta_count[i]);
>  
> +	for (i = 0; i < NO_CHECK_TYPE; i++) {
> +		si->dirty_seg[i] = 0;
> +		si->full_seg[i] = 0;
> +		si->valid_blks[i] = 0;
> +	}
> +
> +	for (i = 0; i < MAIN_SEGS(sbi); i++) {
> +		int blks = get_seg_entry(sbi, i)->valid_blocks;
> +		int type = get_seg_entry(sbi, i)->type;
> +
> +		if (!blks)
> +			continue;
> +
> +		if (IS_CURSEG(sbi, i))
> +			continue;

How about adding current segments as well? Especially, it's hard to see any
valid blocks for cold node with this.

> +
> +		if (blks == sbi->blocks_per_seg)
> +			si->full_seg[type]++;
> +		else
> +			si->dirty_seg[type]++;
> +		si->valid_blks[type] += blks;
> +	}
> +
>  	for (i = 0; i < 2; i++) {
>  		si->segment_count[i] = sbi->segment_count[i];
>  		si->block_count[i] = sbi->block_count[i];
> @@ -329,30 +352,50 @@ static int stat_show(struct seq_file *s, void *v)
>  		seq_printf(s, "\nMain area: %d segs, %d secs %d zones\n",
>  			   si->main_area_segs, si->main_area_sections,
>  			   si->main_area_zones);
> -		seq_printf(s, "  - COLD  data: %d, %d, %d\n",
> +		seq_printf(s, "    TYPE         %8s %8s %8s %10s %10s %10s\n",
> +			   "segno", "secno", "zoneno", "dirty_seg", "full_seg", "valid_blk");
> +		seq_printf(s, "  - COLD   data: %8d %8d %8d %10u %10u %10u\n",
>  			   si->curseg[CURSEG_COLD_DATA],
>  			   si->cursec[CURSEG_COLD_DATA],
> -			   si->curzone[CURSEG_COLD_DATA]);
> -		seq_printf(s, "  - WARM  data: %d, %d, %d\n",
> +			   si->curzone[CURSEG_COLD_DATA],
> +			   si->dirty_seg[CURSEG_COLD_DATA],
> +			   si->full_seg[CURSEG_COLD_DATA],
> +			   si->valid_blks[CURSEG_COLD_DATA]);
> +		seq_printf(s, "  - WARM   data: %8d %8d %8d %10u %10u %10u\n",
>  			   si->curseg[CURSEG_WARM_DATA],
>  			   si->cursec[CURSEG_WARM_DATA],
> -			   si->curzone[CURSEG_WARM_DATA]);
> -		seq_printf(s, "  - HOT   data: %d, %d, %d\n",
> +			   si->curzone[CURSEG_WARM_DATA],
> +			   si->dirty_seg[CURSEG_WARM_DATA],
> +			   si->full_seg[CURSEG_WARM_DATA],
> +			   si->valid_blks[CURSEG_WARM_DATA]);
> +		seq_printf(s, "  - HOT    data: %8d %8d %8d %10u %10u %10u\n",
>  			   si->curseg[CURSEG_HOT_DATA],
>  			   si->cursec[CURSEG_HOT_DATA],
> -			   si->curzone[CURSEG_HOT_DATA]);
> -		seq_printf(s, "  - Dir   dnode: %d, %d, %d\n",
> +			   si->curzone[CURSEG_HOT_DATA],
> +			   si->dirty_seg[CURSEG_HOT_DATA],
> +			   si->full_seg[CURSEG_HOT_DATA],
> +			   si->valid_blks[CURSEG_HOT_DATA]);
> +		seq_printf(s, "  - Dir   dnode: %8d %8d %8d %10u %10u %10u\n",
>  			   si->curseg[CURSEG_HOT_NODE],
>  			   si->cursec[CURSEG_HOT_NODE],
> -			   si->curzone[CURSEG_HOT_NODE]);
> -		seq_printf(s, "  - File   dnode: %d, %d, %d\n",
> +			   si->curzone[CURSEG_HOT_NODE],
> +			   si->dirty_seg[CURSEG_HOT_NODE],
> +			   si->full_seg[CURSEG_HOT_NODE],
> +			   si->valid_blks[CURSEG_HOT_NODE]);
> +		seq_printf(s, "  - File  dnode: %8d %8d %8d %10u %10u %10u\n",
>  			   si->curseg[CURSEG_WARM_NODE],
>  			   si->cursec[CURSEG_WARM_NODE],
> -			   si->curzone[CURSEG_WARM_NODE]);
> -		seq_printf(s, "  - Indir nodes: %d, %d, %d\n",
> +			   si->curzone[CURSEG_WARM_NODE],
> +			   si->dirty_seg[CURSEG_WARM_NODE],
> +			   si->full_seg[CURSEG_WARM_NODE],
> +			   si->valid_blks[CURSEG_WARM_NODE]);
> +		seq_printf(s, "  - Indir nodes: %8d %8d %8d %10u %10u %10u\n",
>  			   si->curseg[CURSEG_COLD_NODE],
>  			   si->cursec[CURSEG_COLD_NODE],
> -			   si->curzone[CURSEG_COLD_NODE]);
> +			   si->curzone[CURSEG_COLD_NODE],
> +			   si->dirty_seg[CURSEG_COLD_NODE],
> +			   si->full_seg[CURSEG_COLD_NODE],
> +			   si->valid_blks[CURSEG_COLD_NODE]);
>  		seq_printf(s, "\n  - Valid: %d\n  - Dirty: %d\n",
>  			   si->main_area_segs - si->dirty_count -
>  			   si->prefree_count - si->free_segs,
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 72a667f1d678..70565d81320b 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -3536,6 +3536,9 @@ struct f2fs_stat_info {
>  	int curseg[NR_CURSEG_TYPE];
>  	int cursec[NR_CURSEG_TYPE];
>  	int curzone[NR_CURSEG_TYPE];
> +	unsigned int dirty_seg[NR_CURSEG_TYPE];
> +	unsigned int full_seg[NR_CURSEG_TYPE];
> +	unsigned int valid_blks[NR_CURSEG_TYPE];
>  
>  	unsigned int meta_count[META_MAX];
>  	unsigned int segment_count[2];
> -- 
> 2.18.0.rc1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
