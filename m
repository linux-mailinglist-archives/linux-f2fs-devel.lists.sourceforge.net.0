Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D9668E069
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  7 Feb 2023 19:46:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pPSzN-0001qm-5N;
	Tue, 07 Feb 2023 18:46:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1pPSzM-0001qg-61
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 07 Feb 2023 18:46:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dErVM3jLeSfrdaB6oiDO6aCOV2h2ZtHRjF8vzY7HInM=; b=KPTFN3XcG6+KZqBSwL5D+ygmxG
 +ClNM3AOCbPs7Rmk1wu5q23ZI6ci8u2k1JgfYtn7GBXdeB05SR6KF+hxvfkgwolQ63tAtnQIoKVfI
 laNHw23PQZ+1U0s6Su3mi3OzzvJWXNTHcyvRP4pg0Q0Y3Eoy18tw176tydeZVyJTQMaI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dErVM3jLeSfrdaB6oiDO6aCOV2h2ZtHRjF8vzY7HInM=; b=AFKcWB5ryF0tVvT/LDKEBJ2RbB
 GCbC2icj+qAjTyF3xnBDHATVhxiu9BZuxyJUqvNNO037FJd07nt2BbTe8YGCymCWdS3aolgmbAvrr
 lwUutXjU4kGmqmG0iPA0c16wxYA+b9MfuECDr50J5vz+vYDIF4nmKFssvxzHF3uyLQZQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pPSzJ-0004OO-9b for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 07 Feb 2023 18:46:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AA2BA60FFF;
 Tue,  7 Feb 2023 18:46:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB3B5C433EF;
 Tue,  7 Feb 2023 18:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675795596;
 bh=4je8DQ6Wvl4DxIzB00Dv4dXmBZ+27+JwMBbzEDWzQCY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kc9d0APtXAiufKqPbIZJXDx5wQo4qdJcXBoUFY5NK0NsmidBzBNLGGaTNjB4bVd++
 Lo7mtK9OsPxplj8XQuy3j2AfKjeLbLmSAGsKffYts6Li/aoS5V4raT/rTxT9ujciIl
 Mt1vR90qSAdnLFBhn1t6ca+PVG9dq4r/aE8Noo1mJ9O0r08ucY2cBsYFAgVw5g1SpS
 uFc+hCsgb95l7pGH7h2BDy+7dgTCupmXO/DdTIxFzLgSrwX4BdBxfRgNQDRLq36Pzw
 TBSGvZWG8IwFf8d+YTrFzKS0bMxFosuisVgDZVrx9irdN8jpMysLE4O3LgMDn3DYcH
 Ovxl/7PRVhyeQ==
Date: Tue, 7 Feb 2023 10:46:34 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <Y+KcivkBV6rep3R0@google.com>
References: <20230206144310.2344-1-frank.li@vivo.com>
 <5b47f58a-4c3c-a183-777c-d4750f6b4d6c@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5b47f58a-4c3c-a183-777c-d4750f6b4d6c@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 02/07, Chao Yu wrote: > On 2023/2/6 22:43,
 Yangtao Li wrote:
 > > For LFS mode, it should update outplace and no need inplace update. >
 > When using LFS mode for small-volume devices, IPU will not b [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pPSzJ-0004OO-9b
Subject: Re: [f2fs-dev] [PATCH v4 1/3] f2fs: fix to set ipu policy
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

On 02/07, Chao Yu wrote:
> On 2023/2/6 22:43, Yangtao Li wrote:
> > For LFS mode, it should update outplace and no need inplace update.
> > When using LFS mode for small-volume devices, IPU will not be used,
> > and the OPU writing method is actually used, but F2FS_IPU_FORCE can
> > be read from the ipu_policy node, which is different from the actual
> > situation. And remount to lfs mode should be disallowed when
> > f2fs ipu is enabled, let's fix it.
> > 
> > Fixes: 84b89e5d943d ("f2fs: add auto tuning for small devices")
> > Signed-off-by: Yangtao Li <frank.li@vivo.com>
> > ---
> > v4:
> > -allow set 0 in lfs mode for ipu_policy node
> >   fs/f2fs/segment.h | 10 +++++++++-
> >   fs/f2fs/super.c   | 17 +++++++++++------
> >   fs/f2fs/sysfs.c   |  9 +++++++++
> >   3 files changed, 29 insertions(+), 7 deletions(-)
> > 
> > diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> > index 0f3f05cb8c29..8ee5e5db9287 100644
> > --- a/fs/f2fs/segment.h
> > +++ b/fs/f2fs/segment.h
> > @@ -670,6 +670,8 @@ static inline int utilization(struct f2fs_sb_info *sbi)
> >   #define SMALL_VOLUME_SEGMENTS	(16 * 512)	/* 16GB */
> > +#define F2FS_IPU_DISABLE	0
> > +
> >   enum {
> >   	F2FS_IPU_FORCE,
> >   	F2FS_IPU_SSR,
> > @@ -679,10 +681,16 @@ enum {
> >   	F2FS_IPU_ASYNC,
> >   	F2FS_IPU_NOCACHE,
> >   	F2FS_IPU_HONOR_OPU_WRITE,
> > +	F2FS_IPU_MAX,
> >   };
> > +static inline bool IS_F2FS_IPU_DISABLE(struct f2fs_sb_info *sbi)
> > +{
> > +	return SM_I(sbi)->ipu_policy == F2FS_IPU_DISABLE;
> > +}
> > +
> >   #define F2FS_IPU_POLICY(name)					\
> > -static inline int IS_##name(struct f2fs_sb_info *sbi)		\
> > +static inline bool IS_##name(struct f2fs_sb_info *sbi)		\
> >   {								\
> >   	return SM_I(sbi)->ipu_policy & BIT(name);		\
> >   }
> > diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> > index 4ec2cbbc47eb..09696fc844ab 100644
> > --- a/fs/f2fs/super.c
> > +++ b/fs/f2fs/super.c
> > @@ -1346,12 +1346,12 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
> >   	}
> >   	if (test_opt(sbi, DISABLE_CHECKPOINT) && f2fs_lfs_mode(sbi)) {
> > -		f2fs_err(sbi, "LFS not compatible with checkpoint=disable");
> > +		f2fs_err(sbi, "LFS is not compatible with checkpoint=disable");
> >   		return -EINVAL;
> >   	}
> >   	if (test_opt(sbi, ATGC) && f2fs_lfs_mode(sbi)) {
> > -		f2fs_err(sbi, "LFS not compatible with ATGC");
> > +		f2fs_err(sbi, "LFS is not compatible with ATGC");
> >   		return -EINVAL;
> >   	}
> > @@ -2304,6 +2304,12 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
> >   		}
> >   	}
> >   #endif
> > +	if (f2fs_lfs_mode(sbi) && !IS_F2FS_IPU_DISABLE(sbi)) {
> > +		err = -EINVAL;
> > +		f2fs_warn(sbi, "LFS is not compatible with IPU");
> > +		goto restore_opts;
> > +	}
> > +
> >   	/* disallow enable atgc dynamically */
> >   	if (no_atgc == !!test_opt(sbi, ATGC)) {
> >   		err = -EINVAL;
> > @@ -4083,10 +4089,9 @@ static void f2fs_tuning_parameters(struct f2fs_sb_info *sbi)
> >   	/* adjust parameters according to the volume size */
> >   	if (MAIN_SEGS(sbi) <= SMALL_VOLUME_SEGMENTS) {
> >   		if (f2fs_block_unit_discard(sbi))
> > -			SM_I(sbi)->dcc_info->discard_granularity =
> > -						MIN_DISCARD_GRANULARITY;
> > -		SM_I(sbi)->ipu_policy = BIT(F2FS_IPU_FORCE) |
> > -					BIT(F2FS_IPU_HONOR_OPU_WRITE);
> > +			SM_I(sbi)->dcc_info->discard_granularity = MIN_DISCARD_GRANULARITY;
> > +		if (!f2fs_lfs_mode(sbi))
> > +			SM_I(sbi)->ipu_policy = BIT(F2FS_IPU_FORCE) | BIT(F2FS_IPU_HONOR_OPU_WRITE);
> 
> 	SM_I(sbi)->ipu_policy = BIT(F2FS_IPU_FORCE) |
> 				BIT(F2FS_IPU_HONOR_OPU_WRITE);
> 
> I prefer to not exceed 80 lines, otherwise it looks good to me.

Applied.

> 
> Reviewed-by: Chao Yu <chao@kernel.org>
> 
> Thanks,
> 
> >   	}
> >   	sbi->readdir_ra = true;
> > diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> > index 575a5536c0e7..3c3dae3ce84e 100644
> > --- a/fs/f2fs/sysfs.c
> > +++ b/fs/f2fs/sysfs.c
> > @@ -706,6 +706,15 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
> >   		return count;
> >   	}
> > +	if (!strcmp(a->attr.name, "ipu_policy")) {
> > +		if (t >= BIT(F2FS_IPU_MAX))
> > +			return -EINVAL;
> > +		if (t && f2fs_lfs_mode(sbi))
> > +			return -EINVAL;
> > +		SM_I(sbi)->ipu_policy = (unsigned int)t;
> > +		return count;
> > +	}
> > +
> >   	*ui = (unsigned int)t;
> >   	return count;


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
