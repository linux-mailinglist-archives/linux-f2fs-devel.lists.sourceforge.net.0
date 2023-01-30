Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F8D681E13
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 30 Jan 2023 23:29:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pMced-000352-01;
	Mon, 30 Jan 2023 22:29:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1pMceb-00034w-Bh
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 30 Jan 2023 22:29:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=awJaf/DNbOPklDiP0ZfhlbS989S+WKAx13kqc/3/hmQ=; b=L2WcK8CK4ktI4ng4C7p5FTNcAi
 ytmhLInPY/rciCT21Uyz3crFC3MHzeuakOaDf8HfvlXxgqxGIapsI6fxGSyHp3uRkySd+X81Y3LTV
 sjsRIUuAGKNveg94WxX9NyvrWh3sW1R34/wof87UCBt0/nBoa+Dy/UfNWEDvnuxpuWpc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=awJaf/DNbOPklDiP0ZfhlbS989S+WKAx13kqc/3/hmQ=; b=VYsJMQflaiIfZGR/XoDZ+Fsg6S
 y908y1I7BsPoCTLGYNjv+75dwroKzZc4P27ZEue+ujRKIpbBZnQqXgDnxi3tBb8MxUTtrHoURFeLo
 mNcgbaWuFZKWP0k7VOc0IVW/RP3A2ImjEacc7v1SkCJgolzfDvtl1Bhiu1Dgs/LQlrZ4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pMceY-004NDv-Vd for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 30 Jan 2023 22:29:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 90874612BF;
 Mon, 30 Jan 2023 22:29:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D452DC433D2;
 Mon, 30 Jan 2023 22:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675117761;
 bh=gR/OXNTMfFpxIjawgCPdUVe1vXsJ1pYOzxfGcgjOsPQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bPW3rrKn4b2tNtRME907UNOLde6sghcRBLMcQh1djad8Cw4A+fQgF6AZkP1sHdaFF
 0HHuGpxDH2hQyCgBxTU+Ag6sfi/KBd2HcJ/Iaw4sLjQwf8+3DSYhBnRxPx9c56DOvE
 uWZxHgztri1HcfA+ES0SunQJyoqaNtWpXDsba/gXRyxF0UsXsdMdBHEQTHTp7Zw6hC
 2qqUBg3kxITWUjDUK4K71TnoiIdxRoeNMwspyLQ8zMGyPkJ5OmCtuZJpourACQrviN
 oIM1z/rHC9L4vVvyEpDJ1eyDK5W2TdVIIEuYDwD44VmKJAew5d19FQniWCck8auvlI
 iufPnb1xsJphw==
Date: Mon, 30 Jan 2023 14:29:19 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <Y9hEv09nyVAYCcNK@google.com>
References: <20230120134029.69200-1-frank.li@vivo.com>
 <b1f8ba44-dd87-b3c1-c249-10d424c6ccd0@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b1f8ba44-dd87-b3c1-c249-10d424c6ccd0@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Please adjust the comments based on v2. On 01/28, Chao Yu
 wrote: > On 2023/1/20 21:40, Yangtao Li wrote: > > For LFS mode, it should
 update outplace and no need inplace update. > > When using LFS mode for
 small-volume devices, IPU will not [...] 
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
X-Headers-End: 1pMceY-004NDv-Vd
Subject: Re: [f2fs-dev] [PATCH 1/4] f2fs: fix to set ipu policy
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
 Yangtao Li <frank.li@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Please adjust the comments based on v2.

On 01/28, Chao Yu wrote:
> On 2023/1/20 21:40, Yangtao Li wrote:
> > For LFS mode, it should update outplace and no need inplace update.
> > When using LFS mode for small-volume devices, IPU will not be used,
> > and the OPU writing method is actually used, but F2FS_IPU_FORCE can
> > be read from the ipu_policy node, which is different from the actual
> > situation. And after remount, ipu should be disabled when convert to
> > lfs mode, let's fix it.
> > 
> > commit bdc48fa11e46 ("checkpatch/coding-style: deprecate 80-column
> > warning") increased the limit to 100 columns. BTW modify some unnecessary
> > newlines.
> > 
> > Fixes: 84b89e5d943d ("f2fs: add auto tuning for small devices")
> > Signed-off-by: Yangtao Li <frank.li@vivo.com>
> > ---
> >   fs/f2fs/segment.h |  2 ++
> >   fs/f2fs/super.c   | 20 +++++++++-----------
> >   2 files changed, 11 insertions(+), 11 deletions(-)
> > 
> > diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> > index ad6a9c19f46a..0b0eb8f03cba 100644
> > --- a/fs/f2fs/segment.h
> > +++ b/fs/f2fs/segment.h
> > @@ -670,6 +670,8 @@ static inline int utilization(struct f2fs_sb_info *sbi)
> >   #define SMALL_VOLUME_SEGMENTS	(16 * 512)	/* 16GB */
> > +#define F2FS_IPU_DISABLE	0
> > +
> >   enum {
> >   	F2FS_IPU_FORCE,
> >   	F2FS_IPU_SSR,
> > diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> > index d8a65645ee48..ebc76683f05d 100644
> > --- a/fs/f2fs/super.c
> > +++ b/fs/f2fs/super.c
> > @@ -2272,6 +2272,9 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
> >   	if (err)
> >   		goto restore_opts;
> > +	if (F2FS_OPTION(sbi).fs_mode == FS_MODE_LFS)
> 
> if (f2fs_lfs_mode())
> 
> > +		SM_I(sbi)->ipu_policy = F2FS_IPU_DISABLE;
> 
> How about adding such restriction to f2fs_tuning_parameters()? For
> f2fs_remount() and __sbi_store() cases, how about returning -EINVAL if
> there is a conflict?
> 
> Thanks,
> 
> > +
> >   	/*
> >   	 * Previous and new state of filesystem is RO,
> >   	 * so skip checking GC and FLUSH_MERGE conditions.
> > @@ -4080,10 +4083,9 @@ static void f2fs_tuning_parameters(struct f2fs_sb_info *sbi)
> >   	/* adjust parameters according to the volume size */
> >   	if (MAIN_SEGS(sbi) <= SMALL_VOLUME_SEGMENTS) {
> >   		if (f2fs_block_unit_discard(sbi))
> > -			SM_I(sbi)->dcc_info->discard_granularity =
> > -						MIN_DISCARD_GRANULARITY;
> > -		SM_I(sbi)->ipu_policy = BIT(F2FS_IPU_FORCE) |
> > -					BIT(F2FS_IPU_HONOR_OPU_WRITE);
> > +			SM_I(sbi)->dcc_info->discard_granularity = MIN_DISCARD_GRANULARITY;
> > +		if (F2FS_OPTION(sbi).fs_mode != FS_MODE_LFS)
> > +			SM_I(sbi)->ipu_policy = BIT(F2FS_IPU_FORCE) | BIT(F2FS_IPU_HONOR_OPU_WRITE);
> >   	}
> >   	sbi->readdir_ra = true;
> > @@ -4310,9 +4312,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
> >   			test_opt(sbi, MERGE_CHECKPOINT)) {
> >   		err = f2fs_start_ckpt_thread(sbi);
> >   		if (err) {
> > -			f2fs_err(sbi,
> > -			    "Failed to start F2FS issue_checkpoint_thread (%d)",
> > -			    err);
> > +			f2fs_err(sbi, "Failed to start F2FS issue_checkpoint_thread (%d)", err);
> >   			goto stop_ckpt_thread;
> >   		}
> >   	}
> > @@ -4320,14 +4320,12 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
> >   	/* setup f2fs internal modules */
> >   	err = f2fs_build_segment_manager(sbi);
> >   	if (err) {
> > -		f2fs_err(sbi, "Failed to initialize F2FS segment manager (%d)",
> > -			 err);
> > +		f2fs_err(sbi, "Failed to initialize F2FS segment manager (%d)", err);
> >   		goto free_sm;
> >   	}
> >   	err = f2fs_build_node_manager(sbi);
> >   	if (err) {
> > -		f2fs_err(sbi, "Failed to initialize F2FS node manager (%d)",
> > -			 err);
> > +		f2fs_err(sbi, "Failed to initialize F2FS node manager (%d)", err);
> >   		goto free_nm;
> >   	}


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
