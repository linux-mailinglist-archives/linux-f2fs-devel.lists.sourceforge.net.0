Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E6216842E7
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 Aug 2019 05:25:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hvCZd-0001QJ-K9; Wed, 07 Aug 2019 03:25:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <stummala@codeaurora.org>) id 1hvCZc-0001Ps-If
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 07 Aug 2019 03:25:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6Ui91b3wCZKG0jIZhrIX95M+EDq4v9EyifEFuap4ftI=; b=jy7FqS9ofcnL1H2x4gj4KbWJUe
 FSiEn3pkJUQbRGQSmUiXobG8+JDsX7Rx182X/IstIeTpeqwTB+nxEixEaCT8GORO7WZzHrFgi7y3g
 +HOyPReyenySPZfo7BQ+EvQQ0k9p24Zr5Pl3tFplYGq8IAFBLy5JS4/TNOEll+tKeqTk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6Ui91b3wCZKG0jIZhrIX95M+EDq4v9EyifEFuap4ftI=; b=Ptyg06Xi2AncvC7Jtog6UBF2bN
 U2KksSG1uhab3Q/Vs9v04LBmWpZyt9PuBppYONy4i2/4+B+NpPm45rfvBOlnUq9QhjYBjxJcmRaKD
 EIDEYrjol/kd/b/V1xEouOAt5Ov6PMjykYEiL9JjXtWs3TJf64TQqBFGLUimpirUDJvI=;
Received: from smtp.codeaurora.org ([198.145.29.96])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hvCZa-00DZVe-PH
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 07 Aug 2019 03:25:12 +0000
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 250B060909; Wed,  7 Aug 2019 03:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1565148305;
 bh=J/dns2iOH5Y3mj0RvjacseSPwgmnz4gU4UX2DLstYkc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZFJIkHf3qgVYzF5DW2WWVvAsAVqoPlAHIvw3Ohp3aDu/6zL0e2eX8cX22RiHRTzJi
 29bgxUK/hzEC9yZbStIAuRYgAimIR/y0aQFpfSH8MUy/I+CIpbFhliRJtmVz+LjDVn
 +fU3TDC3O10857bl2pHgUXUpSryImatUwG18vzhE=
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 681D16074F;
 Wed,  7 Aug 2019 03:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1565148304;
 bh=J/dns2iOH5Y3mj0RvjacseSPwgmnz4gU4UX2DLstYkc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WfvX2j5gCIfiin5e+wskAAvME6/QqKhdg7Fi+FSfE4kpj5XHQ9z+TaY5qHwAO0/OD
 51AAMEg42Puuaje36Bs2c/aSrb8xBqs/KSW18m7TSuWDfVUvvf6ARzNIXhMfz/QMoQ
 REB2l8PWgtUuB91YEFyLr/RUhBGQWmk49llVu2Vs=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 681D16074F
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none smtp.mailfrom=stummala@codeaurora.org
Date: Wed, 7 Aug 2019 08:54:58 +0530
From: Sahitya Tummala <stummala@codeaurora.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20190807032458.GI8289@codeaurora.org>
References: <1565090396-7263-1-git-send-email-stummala@codeaurora.org>
 <8766875c-1e35-22dc-48d2-45b6776e4f38@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8766875c-1e35-22dc-48d2-45b6776e4f38@huawei.com>
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
X-Headers-End: 1hvCZa-00DZVe-PH
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

Hi Chao,

On Wed, Aug 07, 2019 at 10:04:16AM +0800, Chao Yu wrote:
> Hi Sahitya,
> 
> On 2019/8/6 19:19, Sahitya Tummala wrote:
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
> > GC loop under such error scenarios.
> > 
> > Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
> > ---
> > v2: fix as per Chao's suggestion to handle this error case
> > 
> >  fs/f2fs/gc.c      | 15 ++++++++++++++-
> >  fs/f2fs/segment.c |  5 +++++
> >  fs/f2fs/segment.h |  3 +++
> >  3 files changed, 22 insertions(+), 1 deletion(-)
> > 
> > diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> > index 8974672..321a78a 100644
> > --- a/fs/f2fs/gc.c
> > +++ b/fs/f2fs/gc.c
> > @@ -382,6 +382,14 @@ static int get_victim_by_default(struct f2fs_sb_info *sbi,
> >  			nsearched++;
> >  		}
> >  
> > +		/*
> > +		 * skip selecting the invalid segno (that is failed due to block
> > +		 * validity check failed during GC) to avoid endless GC loop in
> > +		 * such cases.
> > +		 */
> > +		if (test_bit(segno, sm->invalid_segmap))
> > +			goto next;
> > +
> >  		secno = GET_SEC_FROM_SEG(sbi, segno);
> >  
> >  		if (sec_usage_check(sbi, secno))
> > @@ -975,6 +983,7 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
> >  	int off;
> >  	int phase = 0;
> >  	int submitted = 0;
> > +	struct sit_info *sit_i = SIT_I(sbi);
> >  
> >  	start_addr = START_BLOCK(sbi, segno);
> >  
> > @@ -1008,8 +1017,12 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
> >  		}
> >  
> >  		/* Get an inode by ino with checking validity */
> > -		if (!is_alive(sbi, entry, &dni, start_addr + off, &nofs))
> > +		if (!is_alive(sbi, entry, &dni, start_addr + off, &nofs)) {
> > +			if (!test_and_set_bit(segno, sit_i->invalid_segmap))
> > +				f2fs_err(sbi, "invalid blkaddr %u in seg %u is found\n",
> > +						start_addr + off, segno);
> 
> Oh, there is some normal cases in is_alive(), such as f2fs_get_node_page() or
> f2fs_get_node_info() failure due to no memory, we should bypass such cases. I

Oh, yes, I have missed this point.

> guess something like this:
> 
> if (source_blkaddr != blkaddr) {
> 	if (unlikely(check_valid_map(sbi, segno, off))) {

check_valid_map() is validated before is_alive(). So I think this check again
may not be needed. What do you think?

> 		if (!test_and_set_bit(segno, sit_i->invalid_segmap)) {
> 			f2fs_err(sbi, "invalid blkaddr %u in seg %u is found\n",
> 				start_addr + off, segno);
> 			set_sbi_flag(sbi, SBI_NEED_FSCK);
> 		}
> 	}
> 	return false;
> }
> 
> I think this will be safe to call check_valid_map(), because there should be no
> race in between is_alive() and update_sit_entry() from all paths due to node
> page lock dependence.
> 
> One more concern is should we use this under CONFIG_F2FS_CHECK_FS? If there is
> actually such a bug can cause data inconsistency, we'd better find the root
> cause in debug version.
> 

Yes, I agree with you. I will include this under CONFIG_F2FS_CHECK_FS.

Thanks,

> Thanks,
> 
> >  			continue;
> > +		}
> >  
> >  		if (phase == 2) {
> >  			f2fs_ra_node_page(sbi, dni.ino);
> > diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> > index a661ac3..d45a1d3 100644
> > --- a/fs/f2fs/segment.c
> > +++ b/fs/f2fs/segment.c
> > @@ -4017,6 +4017,10 @@ static int build_sit_info(struct f2fs_sb_info *sbi)
> >  		return -ENOMEM;
> >  #endif
> >  
> > +	sit_i->invalid_segmap = f2fs_kvzalloc(sbi, bitmap_size, GFP_KERNEL);
> > +	if (!sit_i->invalid_segmap)
> > +		return -ENOMEM;
> > +
> >  	/* init SIT information */
> >  	sit_i->s_ops = &default_salloc_ops;
> >  
> > @@ -4518,6 +4522,7 @@ static void destroy_sit_info(struct f2fs_sb_info *sbi)
> >  #ifdef CONFIG_F2FS_CHECK_FS
> >  	kvfree(sit_i->sit_bitmap_mir);
> >  #endif
> > +	kvfree(sit_i->invalid_segmap);
> >  	kvfree(sit_i);
> >  }
> >  
> > diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> > index b746028..bc5dbe8 100644
> > --- a/fs/f2fs/segment.h
> > +++ b/fs/f2fs/segment.h
> > @@ -246,6 +246,9 @@ struct sit_info {
> >  	unsigned long long min_mtime;		/* min. modification time */
> >  	unsigned long long max_mtime;		/* max. modification time */
> >  
> > +	/* list of segments to be ignored by GC in case of errors */
> > +	unsigned long *invalid_segmap;
> > +
> >  	unsigned int last_victim[MAX_GC_POLICY]; /* last victim segment # */
> >  };
> >  
> > 

-- 
--
Sent by a consultant of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
