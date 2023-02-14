Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4DA696C29
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Feb 2023 19:00:49 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pRzbf-000553-SB;
	Tue, 14 Feb 2023 18:00:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1pRzbe-00054x-OU
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Feb 2023 18:00:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fZFQC6yXndwbSOI8inK7r7k4TqSSjrxWQ9IIDBTUs5M=; b=PEM248yqc0APW4CeSWgK0W6s9f
 V3pZzMwMC0joVZozO9wi4oDit0yPGADUxFjgvZ2j4kDBhGYFxOW7i1OJPtHKpWhj4liX3Ru3GgzpN
 /fQfyA1Uyp76Nuyu/s+YDc03gyEp4Oa30uQF9Aoj//JAaJV0W6neyUuG0oc1xJaoRPYs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fZFQC6yXndwbSOI8inK7r7k4TqSSjrxWQ9IIDBTUs5M=; b=aXNURCPer2VE43Kk2uQSeL0eKC
 O6DigY0l5WJfTVYmVTrsbjj/uQ+VKK/uXux9UrtfsMKz9AY1rzT2p0x1dq6d4q5KJhzGDq+edWsJS
 /XbYOgIEUIdYI7zS9Pn4X9NrMB6C2petB2C7yzTLWdNudBMGhn1M7UC4rlSPncspN/Zo=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pRzbc-0000xz-HZ for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Feb 2023 18:00:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E0BC3617A5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 14 Feb 2023 18:00:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35607C433EF;
 Tue, 14 Feb 2023 18:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676397635;
 bh=QWPRQNPeqPQ0ymGdZhWgjRi5SgQBcrZ8Gc6k7uRPv10=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oZLjwQIYKz544VwAUoZ8wzr7Wia6sqdKJdaY3kbVrkw8NEkwTaYhV8OpRGOZVy9SU
 rpiqmhbhNgSNSQ2kNiH7ODH16gtyxthYb+mOal4DGV8KtMkX2W9EjxQPef2NZmqRbX
 85K4qou1bFDsj4Gwv83no2FsCv1r65smy8CjeBM3e8fxZCUaZHEJ6JMahS3DGlZ8Ek
 mNL3XSQDuUHjbyu0JLT0i5+3AzDrLpX+Zxvx2icVoOYTokNixfvpjcQi7uij9XryWL
 eCwH0Xfs6/3KKNTeJM55syPPefAGikJM8rBBa2ibgfdycpNt0cDiKW2OKeWNvyjr79
 lDP+SVG4fV6xw==
Date: Tue, 14 Feb 2023 10:00:33 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <Y+vMQURYclERhJmK@google.com>
References: <20230210213250.3471246-1-jaegeuk@kernel.org>
 <1a66e32b-efc0-626b-b585-7f2bfac506a7@kernel.org>
 <Y+p311Vi/odYKuC2@google.com>
 <a7ccac95-384c-f4de-a60f-ee6b8680c9d7@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a7ccac95-384c-f4de-a60f-ee6b8680c9d7@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 02/14, Chao Yu wrote: > On 2023/2/14 1:48, Jaegeuk Kim
 wrote: > > On 02/13, Chao Yu wrote: > > > On 2023/2/11 5:32, Jaegeuk Kim wrote:
 > > > > MAIN_SEGS is for data area, while TOTAL_SEGS includes [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pRzbc-0000xz-HZ
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix wrong segment count
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

On 02/14, Chao Yu wrote:
> On 2023/2/14 1:48, Jaegeuk Kim wrote:
> > On 02/13, Chao Yu wrote:
> > > On 2023/2/11 5:32, Jaegeuk Kim wrote:
> > > > MAIN_SEGS is for data area, while TOTAL_SEGS includes data and metadata.
> > > 
> > > Good catch!
> > > 
> > > Could you please add fixes line?
> > 
> > It seems this is not a bug case, and exisits from the first F2FS patch. :)
> 
> Alright, anyway, it looks good to me.
> 
> Reviewed-by: Chao Yu <chao@kernel.org>

I assumed this for v2. Let me know if you have other concern.

> 
> Thanks,
> 
> > 
> > > 
> > > Thanks,
> > > 
> > > > 
> > > > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > > > ---
> > > >    fs/f2fs/segment.h | 4 ++--
> > > >    1 file changed, 2 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> > > > index 8ee5e5db9287..6003fbaf4b7d 100644
> > > > --- a/fs/f2fs/segment.h
> > > > +++ b/fs/f2fs/segment.h
> > > > @@ -720,7 +720,7 @@ static inline unsigned char curseg_alloc_type(struct f2fs_sb_info *sbi,
> > > >    static inline void check_seg_range(struct f2fs_sb_info *sbi, unsigned int segno)
> > > >    {
> > > > -	f2fs_bug_on(sbi, segno > TOTAL_SEGS(sbi) - 1);
> > > > +	f2fs_bug_on(sbi, segno > MAIN_SEGS(sbi) - 1);
> > > >    }
> > > >    static inline void verify_fio_blkaddr(struct f2fs_io_info *fio)
> > > > @@ -775,7 +775,7 @@ static inline int check_block_count(struct f2fs_sb_info *sbi,
> > > >    	/* check segment usage, and check boundary of a given segment number */
> > > >    	if (unlikely(GET_SIT_VBLOCKS(raw_sit) > usable_blks_per_seg
> > > > -					|| segno > TOTAL_SEGS(sbi) - 1)) {
> > > > +					|| segno > MAIN_SEGS(sbi) - 1)) {
> > > >    		f2fs_err(sbi, "Wrong valid blocks %d or segno %u",
> > > >    			 GET_SIT_VBLOCKS(raw_sit), segno);
> > > >    		set_sbi_flag(sbi, SBI_NEED_FSCK);


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
