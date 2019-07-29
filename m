Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E218B7848B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Jul 2019 07:47:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hryVB-0004Uo-Fn; Mon, 29 Jul 2019 05:47:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1hryVA-0004Uf-5z
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 29 Jul 2019 05:47:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+y5hVpYQ5zAt8g3Y8VsYvqZ+gT+Uk1zz8LAv0s6Djaw=; b=LmbnK9urheTwUG/C0ol9yfHNL2
 x06C/7V1OLqEVzaQGks1Z+kIZ64XbM2qcHtsR/o1h+F9ZSPRFA7CITUhgUZCvZRhFxj/NCdzz0Lyj
 FejC1bUNE7a5II7c8R9Kahyoqbmhh0Nih/T7SNlh6YrTx4enIGVcRWI1o/MknaQOk49A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+y5hVpYQ5zAt8g3Y8VsYvqZ+gT+Uk1zz8LAv0s6Djaw=; b=IkyHeW4zkhy5+6D30owHu0m1HM
 VHHZJFsjBamCEC8ymoNPXuo3aXTZ40ttO5mUo3uZb1upBb+FdHHRbAYEbTBrpFSjNegULU7n0dolT
 A/03k7TF03hVGCQrWqRzrbZ96bV5nEWxgECe69L+LnxWduh4W0u62+ArZCVVlXCYPvrs=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hryV8-00D89J-LG
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 29 Jul 2019 05:47:16 +0000
Received: from localhost (c-98-234-77-170.hsd1.ca.comcast.net [98.234.77.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 948852070B;
 Mon, 29 Jul 2019 05:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564379226;
 bh=yZNgVI84KFPxzIYsaVwbo027q4ATv/wHbHzHadEmIXQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dFxOndZNPXrVMx5B9kzsiQB0+H226fN4oVSDw8vqJd4ILcT8WGVKZwNdkWGXBTLoY
 kJhN5gDp27YiIz0P73A+qjuGnKMdpUVOotYeVUgL25Gyp2OGHfiSrodipbZx8LBt9A
 XX6UWsIkSliIkcQ8UK20ajXO3wIvUU17UiKcAZsY=
Date: Sun, 28 Jul 2019 22:47:06 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20190729054706.GB94090@jaegeuk-macbookpro.roam.corp.google.com>
References: <20190424094850.118323-1-yuchao0@huawei.com>
 <20190428133802.GB37346@jaegeuk-macbookpro.roam.corp.google.com>
 <373f4633-d331-5cf3-74b7-e982072bc4b4@kernel.org>
 <20190501032242.GA84420@jaegeuk-macbookpro.roam.corp.google.com>
 <3f170d86-e556-13ae-ce19-3bba3944f5fa@huawei.com>
 <192bae92-2193-570f-7b50-00334271bd2e@huawei.com>
 <a16a0c1c-16c6-5fe8-bfc4-7cc0e0866c77@huawei.com>
 <20190723013546.GA60778@jaegeuk-macbookpro.roam.corp.google.com>
 <00726135-f210-7791-a372-ef9cb1ae209f@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <00726135-f210-7791-a372-ef9cb1ae209f@huawei.com>
User-Agent: Mutt/1.8.2 (2017-04-18)
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
X-Headers-End: 1hryV8-00D89J-LG
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to do sanity with enabled features
 in image
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

On 07/23, Chao Yu wrote:
> On 2019/7/23 9:35, Jaegeuk Kim wrote:
> > On 07/16, Chao Yu wrote:
> >> Hi Jaegeuk,
> >>
> >> On 2019/5/9 9:15, Chao Yu wrote:
> >>> On 2019/5/5 10:51, Chao Yu wrote:
> >>>> On 2019/5/1 11:22, Jaegeuk Kim wrote:
> >>>>> On 04/29, Chao Yu wrote:
> >>>>>> On 2019-4-28 21:38, Jaegeuk Kim wrote:
> >>>>>>> On 04/24, Chao Yu wrote:
> >>>>>>>> This patch fixes to do sanity with enabled features in image, if
> >>>>>>>> there are features kernel can not recognize, just fail the mount.
> >>>>>>>
> >>>>>>> We need to figure out per-feature-based rejection, since some of them can
> >>>>>>> be set without layout change.
> >>
> >> What about adding one field in superblock for compatible features in future?
> >>
> >> sb.feature(F2FS_FEATURE_LAST, max] stores uncompatible features
> >> sb.compatible_feature stores compatible features
> >>
> >> If we follow above rule when adding one feature, then, we can fail the mount if
> >> sb.feature(F2FS_FEATURE_LAST, max] is valid.
> > 
> > How about adding required_features flag in sb to check part of features only?
> 
> You mean all incompatible features can be add into sb.required_features later
> like this?
> 
> __le32 required_features;	/* incompatible feature to old kernel */
> 
> And we can check required_features with supported features in current kernel?

Yeah, I think so.

> 
> if (le32_to_cpu(raw_super->required_features) &
> 	(~NOW_SUPPORTED_FEATURES_IN_CURRENT_KERNEL)) {
> 	print msg & ret error;
> }
> 
> Thanks,
> 
> > 
> >>
> >> Thanks,
> >>
> >>>>>>
> >>>>>> So any suggestion on how to implement this?
> >>>>>
> >>>>> Which features do we need to disallow? When we introduce new features, they
> >>>>
> >>>> I guess it should be the new features.
> >>>>
> >>>>> didn't hurt the previous flow by checking f2fs_sb_has_###().
> >>>>
> >>>> Yes, but new features may use new disk layout, if old kernel handled it with old
> >>>> disk layout, there must be problematic.
> >>>>
> >>>> e.g. format image with -O extra_attr, and mount it with kernel who don't
> >>>> recognize new inode layout.
> >>>
> >>> Jaegeuk,
> >>>
> >>> Any thoughts?
> >>>
> >>> Thanks,
> >>>
> >>>>
> >>>> Thanks,
> >>>>
> >>>>>
> >>>>>>
> >>>>>> Maybe:
> >>>>>>
> >>>>>> if (LINUX_VERSION_CODE < KERNEL_VERSION(4, 14, 0))
> >>>>>> 	check 4.14+ features
> >>>>>> else if (LINUX_VERSION_CODE < KERNEL_VERSION(4, 9, 0))
> >>>>>> 	check 4.9+ features
> >>>>>> else if (LINUX_VERSION_CODE < KERNEL_VERSION(4, 4, 0))
> >>>>>> 	check 4.4+ features
> >>>>>>
> >>>>>> Thanks,
> >>>>>>
> >>>>>>>
> >>>>>>>>
> >>>>>>>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> >>>>>>>> ---
> >>>>>>>>  fs/f2fs/f2fs.h  | 13 +++++++++++++
> >>>>>>>>  fs/f2fs/super.c |  9 +++++++++
> >>>>>>>>  2 files changed, 22 insertions(+)
> >>>>>>>>
> >>>>>>>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> >>>>>>>> index f5ffc09705eb..15b640967e12 100644
> >>>>>>>> --- a/fs/f2fs/f2fs.h
> >>>>>>>> +++ b/fs/f2fs/f2fs.h
> >>>>>>>> @@ -151,6 +151,19 @@ struct f2fs_mount_info {
> >>>>>>>>  #define F2FS_FEATURE_VERITY		0x0400	/* reserved */
> >>>>>>>>  #define F2FS_FEATURE_SB_CHKSUM		0x0800
> >>>>>>>>  
> >>>>>>>> +#define F2FS_ALL_FEATURES	(F2FS_FEATURE_ENCRYPT |			\
> >>>>>>>> +				F2FS_FEATURE_BLKZONED |			\
> >>>>>>>> +				F2FS_FEATURE_ATOMIC_WRITE |		\
> >>>>>>>> +				F2FS_FEATURE_EXTRA_ATTR |		\
> >>>>>>>> +				F2FS_FEATURE_PRJQUOTA |			\
> >>>>>>>> +				F2FS_FEATURE_INODE_CHKSUM |		\
> >>>>>>>> +				F2FS_FEATURE_FLEXIBLE_INLINE_XATTR |	\
> >>>>>>>> +				F2FS_FEATURE_QUOTA_INO |		\
> >>>>>>>> +				F2FS_FEATURE_INODE_CRTIME |		\
> >>>>>>>> +				F2FS_FEATURE_LOST_FOUND |		\
> >>>>>>>> +				F2FS_FEATURE_VERITY |			\
> >>>>>>>> +				F2FS_FEATURE_SB_CHKSUM)
> >>>>>>>> +
> >>>>>>>>  #define __F2FS_HAS_FEATURE(raw_super, mask)				\
> >>>>>>>>  	((raw_super->feature & cpu_to_le32(mask)) != 0)
> >>>>>>>>  #define F2FS_HAS_FEATURE(sbi, mask)	__F2FS_HAS_FEATURE(sbi->raw_super, mask)
> >>>>>>>> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> >>>>>>>> index 4f8e9ab48b26..57f2fc6d14ba 100644
> >>>>>>>> --- a/fs/f2fs/super.c
> >>>>>>>> +++ b/fs/f2fs/super.c
> >>>>>>>> @@ -2573,6 +2573,15 @@ static int sanity_check_raw_super(struct f2fs_sb_info *sbi,
> >>>>>>>>  		return 1;
> >>>>>>>>  	}
> >>>>>>>>  
> >>>>>>>> +	/* check whether kernel supports all features */
> >>>>>>>> +	if (le32_to_cpu(raw_super->feature) & (~F2FS_ALL_FEATURES)) {
> >>>>>>>> +		f2fs_msg(sb, KERN_INFO,
> >>>>>>>> +			"Unsupported feature:%u: supported:%u",
> >>>>>>>> +			le32_to_cpu(raw_super->feature),
> >>>>>>>> +			F2FS_ALL_FEATURES);
> >>>>>>>> +		return 1;
> >>>>>>>> +	}
> >>>>>>>> +
> >>>>>>>>  	/* check CP/SIT/NAT/SSA/MAIN_AREA area boundary */
> >>>>>>>>  	if (sanity_check_area_boundary(sbi, bh))
> >>>>>>>>  		return 1;
> >>>>>>>> -- 
> >>>>>>>> 2.18.0.rc1
> >>>>> .
> >>>>>
> >>>>
> >>>>
> >>>> _______________________________________________
> >>>> Linux-f2fs-devel mailing list
> >>>> Linux-f2fs-devel@lists.sourceforge.net
> >>>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> >>>> .
> >>>>
> >>>
> >>>
> >>> _______________________________________________
> >>> Linux-f2fs-devel mailing list
> >>> Linux-f2fs-devel@lists.sourceforge.net
> >>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> >>> .
> >>>
> > .
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
