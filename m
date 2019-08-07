Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CC88784397
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 Aug 2019 07:15:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hvEHy-0006Y2-Gz; Wed, 07 Aug 2019 05:15:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <stummala@codeaurora.org>) id 1hvEHv-0006XN-SX
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 07 Aug 2019 05:15:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xc7/J9QoyySVKECJ90ivZI7m8G6uu/L0W6brCZDBzi0=; b=XxVlIxvF+D6Q2bDR5mcegjAN0w
 QS+cQLzegWwJinF5foL6/3icposWq0Mi48KzoM987swab1OLaJzRTn5Be+m9UP5foga1YMuT8lzgx
 r5D8+WIVwDJyJ2Bb14MXrXy1f0xgLNtx9+wV5TdiCUbelqt7b3QxkvUuvOvwwQa55BxU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xc7/J9QoyySVKECJ90ivZI7m8G6uu/L0W6brCZDBzi0=; b=jnUw4wmRx4pentLT2Ih81eXSDI
 2qs4xHN/OV1ohCjOb0tgnlqZgVagZJPh1dnNUjf5aNmuX4g23OoKYkk4SmBTUVgzVErWe1BI9leCW
 VJLaVuirPMw+yDFjKIPFMsvtrhVDRoGrIK2tSjcqYlUFiii/hHjVGNaabZ4H2JFM0yII=;
Received: from smtp.codeaurora.org ([198.145.29.96])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hvEHt-00EFQ2-Vp
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 07 Aug 2019 05:15:03 +0000
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 5F2CE608A5; Wed,  7 Aug 2019 05:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1565154896;
 bh=ez0bTbpDpuPBtcQ5H6/eqA/uGGQnkjV/1RrxwhZfFo8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kXXq4lmsF7O/FwTxcmMHNJxH43prALliIw6cL/MK51hvyl+VV8CyAfy68Hrm7Qj3Z
 4+rZcTYle0yhjpxwEvYtK341bTpmWh94pQxSYJ36iZq/ZE9j7Nt4qKDuBnCd2/6qkX
 TiLr6PODS1h8MtfIcGKQ8JnK8F5P+e5R/AMv6Fww=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
 version=3.4.0
Received: from codeaurora.org
 (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: stummala@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 8B7E5608A5;
 Wed,  7 Aug 2019 05:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1565154895;
 bh=ez0bTbpDpuPBtcQ5H6/eqA/uGGQnkjV/1RrxwhZfFo8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Sc5HEDwazQJF8wb/4wdkZZ7unmy8cLMMEWYTUNAjAayk8XuG2kLGGWvsBFA+jBcAV
 a3yqEbpqfT87LqqdiwwRRGGGK1vTYQENeGdKMaNkXyU61U0Ptef6S6EaSuLffXMHxn
 9l1Yzjd295fp9CnexEQ8iuZT6OH1taspEKt1FJzQ=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8B7E5608A5
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none smtp.mailfrom=stummala@codeaurora.org
Date: Wed, 7 Aug 2019 10:44:50 +0530
From: Sahitya Tummala <stummala@codeaurora.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20190807051449.GJ8289@codeaurora.org>
References: <1565090396-7263-1-git-send-email-stummala@codeaurora.org>
 <8766875c-1e35-22dc-48d2-45b6776e4f38@huawei.com>
 <20190807032458.GI8289@codeaurora.org>
 <28512520-d8fe-839f-67ab-45f89f12968d@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <28512520-d8fe-839f-67ab-45f89f12968d@huawei.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: codeaurora.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1hvEHt-00EFQ2-Vp
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: Fix indefinite loop in f2fs_gc()
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Aug 07, 2019 at 11:37:22AM +0800, Chao Yu wrote:
> Hi Sahitya,
> 
> On 2019/8/7 11:24, Sahitya Tummala wrote:
> > Hi Chao,
> > 
> > On Wed, Aug 07, 2019 at 10:04:16AM +0800, Chao Yu wrote:
> >> Hi Sahitya,
> >>
> >> On 2019/8/6 19:19, Sahitya Tummala wrote:
> >>> Policy - Foreground GC, LFS and greedy GC mode.
> >>>
> >>> Under this policy, f2fs_gc() loops forever to GC as it doesn't have
> >>> enough free segements to proceed and thus it keeps calling gc_more
> >>> for the same victim segment.  This can happen if the selected victim
> >>> segment could not be GC'd due to failed blkaddr validity check i.e.
> >>> is_alive() returns false for the blocks set in current validity map.
> >>>
> >>> Fix this by keeping track of such invalid segments and skip those
> >>> segments for selection in get_victim_by_default() to avoid endless
> >>> GC loop under such error scenarios.
> >>>
> >>> Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
> >>> ---
> >>> v2: fix as per Chao's suggestion to handle this error case
> >>>
> >>>  fs/f2fs/gc.c      | 15 ++++++++++++++-
> >>>  fs/f2fs/segment.c |  5 +++++
> >>>  fs/f2fs/segment.h |  3 +++
> >>>  3 files changed, 22 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> >>> index 8974672..321a78a 100644
> >>> --- a/fs/f2fs/gc.c
> >>> +++ b/fs/f2fs/gc.c
> >>> @@ -382,6 +382,14 @@ static int get_victim_by_default(struct f2fs_sb_info *sbi,
> >>>  			nsearched++;
> >>>  		}
> >>>  
> >>> +		/*
> >>> +		 * skip selecting the invalid segno (that is failed due to block
> >>> +		 * validity check failed during GC) to avoid endless GC loop in
> >>> +		 * such cases.
> >>> +		 */
> >>> +		if (test_bit(segno, sm->invalid_segmap))
> >>> +			goto next;
> >>> +
> >>>  		secno = GET_SEC_FROM_SEG(sbi, segno);
> >>>  
> >>>  		if (sec_usage_check(sbi, secno))
> >>> @@ -975,6 +983,7 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
> >>>  	int off;
> >>>  	int phase = 0;
> >>>  	int submitted = 0;
> >>> +	struct sit_info *sit_i = SIT_I(sbi);
> >>>  
> >>>  	start_addr = START_BLOCK(sbi, segno);
> >>>  
> >>> @@ -1008,8 +1017,12 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
> >>>  		}
> >>>  
> >>>  		/* Get an inode by ino with checking validity */
> >>> -		if (!is_alive(sbi, entry, &dni, start_addr + off, &nofs))
> >>> +		if (!is_alive(sbi, entry, &dni, start_addr + off, &nofs)) {
> >>> +			if (!test_and_set_bit(segno, sit_i->invalid_segmap))
> >>> +				f2fs_err(sbi, "invalid blkaddr %u in seg %u is found\n",
> >>> +						start_addr + off, segno);
> >>
> >> Oh, there is some normal cases in is_alive(), such as f2fs_get_node_page() or
> >> f2fs_get_node_info() failure due to no memory, we should bypass such cases. I
> > 
> > Oh, yes, I have missed this point.
> > 
> >> guess something like this:
> >>
> >> if (source_blkaddr != blkaddr) {
> >> 	if (unlikely(check_valid_map(sbi, segno, off))) {
> > 
> > check_valid_map() is validated before is_alive(). So I think this check again
> > may not be needed. What do you think?
> 
> > race in between is_alive() and update_sit_entry()
> 
> There will be a race case:
> 
> gc_data_segment			f2fs_truncate_data_blocks_range
> check_valid_map
> 				f2fs_invalidate_blocks
> 				update_sit_entry
> 				f2fs_test_and_clear_bit(, se->cur_valid_map);
> 				unlock_page(node_page)
> is_alive
> lock_page(node_page)
> blkaddr should be NULL and not equal to source_blkaddr, I think this is a normal
> case, right?
> 

Got it, thanks for the clarification.

> Thanks,
> 
> > 
> >> 		if (!test_and_set_bit(segno, sit_i->invalid_segmap)) {
> >> 			f2fs_err(sbi, "invalid blkaddr %u in seg %u is found\n",
> >> 				start_addr + off, segno);
> >> 			set_sbi_flag(sbi, SBI_NEED_FSCK);
> >> 		}
> >> 	}
> >> 	return false;
> >> }
> >>
> >> I think this will be safe to call check_valid_map(), because there should be no
> >> race in between is_alive() and update_sit_entry() from all paths due to node
> >> page lock dependence.
> >>
> >> One more concern is should we use this under CONFIG_F2FS_CHECK_FS? If there is
> >> actually such a bug can cause data inconsistency, we'd better find the root
> >> cause in debug version.
> >>
> > 
> > Yes, I agree with you. I will include this under CONFIG_F2FS_CHECK_FS.
> > 
> > Thanks,
> > 
> >> Thanks,
> >>
> >>>  			continue;
> >>> +		}
> >>>  
> >>>  		if (phase == 2) {
> >>>  			f2fs_ra_node_page(sbi, dni.ino);
> >>> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> >>> index a661ac3..d45a1d3 100644
> >>> --- a/fs/f2fs/segment.c
> >>> +++ b/fs/f2fs/segment.c
> >>> @@ -4017,6 +4017,10 @@ static int build_sit_info(struct f2fs_sb_info *sbi)
> >>>  		return -ENOMEM;
> >>>  #endif
> >>>  
> >>> +	sit_i->invalid_segmap = f2fs_kvzalloc(sbi, bitmap_size, GFP_KERNEL);
> >>> +	if (!sit_i->invalid_segmap)
> >>> +		return -ENOMEM;
> >>> +
> >>>  	/* init SIT information */
> >>>  	sit_i->s_ops = &default_salloc_ops;
> >>>  
> >>> @@ -4518,6 +4522,7 @@ static void destroy_sit_info(struct f2fs_sb_info *sbi)
> >>>  #ifdef CONFIG_F2FS_CHECK_FS
> >>>  	kvfree(sit_i->sit_bitmap_mir);
> >>>  #endif
> >>> +	kvfree(sit_i->invalid_segmap);
> >>>  	kvfree(sit_i);
> >>>  }
> >>>  
> >>> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> >>> index b746028..bc5dbe8 100644
> >>> --- a/fs/f2fs/segment.h
> >>> +++ b/fs/f2fs/segment.h
> >>> @@ -246,6 +246,9 @@ struct sit_info {
> >>>  	unsigned long long min_mtime;		/* min. modification time */
> >>>  	unsigned long long max_mtime;		/* max. modification time */
> >>>  
> >>> +	/* list of segments to be ignored by GC in case of errors */
> >>> +	unsigned long *invalid_segmap;
> >>> +
> >>>  	unsigned int last_victim[MAX_GC_POLICY]; /* last victim segment # */
> >>>  };
> >>>  
> >>>
> > 

-- 
--
Sent by a consultant of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
