Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C6068E03B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  7 Feb 2023 19:40:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pPSsu-0004KI-5i;
	Tue, 07 Feb 2023 18:40:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1pPSss-0004K0-Ge
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 07 Feb 2023 18:40:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ac8lCrl6hPPaFjP65rAqzxwuN2vqxhZ/bEEZ4X1tVG8=; b=LbmglfiUYWjnA1Jme/nbi2oCJI
 wmllUjeMZwFxQU9Y5calKOV4sPljhMyqbKlvrz9KRTBqqDQrG7Exyshpx7Xn6LinfEotgyL5az24B
 ZvIiSAnAgGP97LbqHtVp0/W5DJOzWbXKO2ADFQyG4C7rAqYZHx1mAOkJJHX8BBduFEIc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ac8lCrl6hPPaFjP65rAqzxwuN2vqxhZ/bEEZ4X1tVG8=; b=K02T57ceWR1C7kWKaQ8/Z86GfQ
 coVeqfypijUC7wG5uIc9+PusWtHTILRGYlwWhap/Ay5UG3Tn73AFMBOnXaCwJTffWSkCPohau9Vvz
 1gy7XAoosSkZ88U1HZXK9RRE/0BWJKH1v7NjpNgMOXyl/g271RsDd3atMpPb+w50iDxI=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pPSsq-00DrsS-Ja for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 07 Feb 2023 18:40:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 404B5B81AB0;
 Tue,  7 Feb 2023 18:39:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3E58C433D2;
 Tue,  7 Feb 2023 18:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675795187;
 bh=kuFm3PbCYEBSCb27li2FWOvTczSe7QfhNjRsq9s9KRE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B8B1Zv37Xdg0TxhLX3aJcZ3+LFa6VoSQcwAcmjQvXOtLcgCX8wQVwlsCsnUEwJ2ok
 gyBeoVvVRv26t3LT3P6c9OUaSAwEu29y0aphppjxZW/0Wodtvx/vIQm0EFr+W2N3PM
 fb7tGE70guZfFo2D1NDdqNeOu2GrXNx+MmPyvHFIEN0w1MoZysvAWpdKmO6GYnhRML
 76AtlqyTa+ZZT0TM7hcdQuzxj/AMrmH+RaLu9PFIJ4pU2QeNBx+Lq3xTufyLXA987J
 yAtE2kdjyKLdkdAFk7Hvii9GCLp+0DFXd0MMnvFM+Ph5GdZaN/PHgMZm2oBOb2v/MN
 Huu/lNP+tIy7w==
Date: Tue, 7 Feb 2023 10:39:45 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <Y+Ka8cbf0j+/NzJv@google.com>
References: <3589331b-a3ec-87e1-790d-387439672ea5@kernel.org>
 <20230204094345.591407-1-qixiaoyu1@xiaomi.com>
 <ecce441d-845f-caf1-d7a8-e3c30a21ae60@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ecce441d-845f-caf1-d7a8-e3c30a21ae60@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 02/07, Chao Yu wrote: > On 2023/2/4 17:43,
 qixiaoyu1 wrote:
 > > Signed-off-by: qixiaoyu1 <qixiaoyu1@xiaomi.com> > > Signed-off-by:
 xiongping1
 <xiongping1@xiaomi.com> > > --- > > change log v3 -> v4 [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pPSsq-00DrsS-Ja
Subject: Re: [f2fs-dev] [PATCH 2/2 v4] f2fs: add sysfs nodes to set
 last_age_weight
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
Cc: linux-f2fs-devel@lists.sourceforge.net, Xiaoyu Qi <qixiaoyu1@xiaomi.com>,
 linux-kernel@vger.kernel.org, Ping Xiong <xiongping1@xiaomi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 02/07, Chao Yu wrote:
> On 2023/2/4 17:43, qixiaoyu1 wrote:
> > Signed-off-by: qixiaoyu1 <qixiaoyu1@xiaomi.com>
> > Signed-off-by: xiongping1 <xiongping1@xiaomi.com>
> > ---
> > change log v3 -> v4:
> >    - allow 0 and 100 to a valid value
> > 
> >   Documentation/ABI/testing/sysfs-fs-f2fs |  5 +++++
> >   fs/f2fs/extent_cache.c                  | 15 +++++++++------
> >   fs/f2fs/f2fs.h                          |  1 +
> >   fs/f2fs/sysfs.c                         | 11 +++++++++++
> >   4 files changed, 26 insertions(+), 6 deletions(-)
> > 
> > diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
> > index 9e3756625a81..11af7dbb6bc9 100644
> > --- a/Documentation/ABI/testing/sysfs-fs-f2fs
> > +++ b/Documentation/ABI/testing/sysfs-fs-f2fs
> > @@ -669,3 +669,8 @@ Contact:	"Ping Xiong" <xiongping1@xiaomi.com>
> >   Description:	When DATA SEPARATION is on, it controls the age threshold to indicate
> >   		the data blocks as warm. By default it was initialized as 2621440 blocks
> >   		(equals to 10GB).
> > +
> > +What:           /sys/fs/f2fs/<disk>/last_age_weight
> > +Date:           January 2023
> > +Contact:        "Ping Xiong" <xiongping1@xiaomi.com>
> > +Description:    When DATA SEPARATION is on, it controls the weight of last data block age.
> > diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
> > index d9f12f404beb..ce99882ba81c 100644
> > --- a/fs/f2fs/extent_cache.c
> > +++ b/fs/f2fs/extent_cache.c
> > @@ -871,19 +871,21 @@ void f2fs_update_read_extent_tree_range_compressed(struct inode *inode,
> >   }
> >   #endif
> > -static unsigned long long __calculate_block_age(unsigned long long new,
> > +static unsigned long long __calculate_block_age(struct f2fs_sb_info *sbi,
> > +						unsigned long long new,
> >   						unsigned long long old)
> >   {
> >   	unsigned int rem_old, rem_new;
> >   	unsigned long long res;
> > +	unsigned int weight = sbi->last_age_weight;
> > -	res = div_u64_rem(new, 100, &rem_new) * (100 - LAST_AGE_WEIGHT)
> > -		+ div_u64_rem(old, 100, &rem_old) * LAST_AGE_WEIGHT;
> > +	res = div_u64_rem(new, 100, &rem_new) * (100 - weight)
> > +		+ div_u64_rem(old, 100, &rem_old) * weight;
> >   	if (rem_new)
> > -		res += rem_new * (100 - LAST_AGE_WEIGHT) / 100;
> > +		res += rem_new * (100 - weight) / 100;
> >   	if (rem_old)
> > -		res += rem_old * LAST_AGE_WEIGHT / 100;
> > +		res += rem_old * weight / 100;
> >   	return res;
> >   }
> > @@ -917,7 +919,7 @@ static int __get_new_block_age(struct inode *inode, struct extent_info *ei,
> >   			cur_age = ULLONG_MAX - tei.last_blocks + cur_blocks;
> >   		if (tei.age)
> > -			ei->age = __calculate_block_age(cur_age, tei.age);
> > +			ei->age = __calculate_block_age(sbi, cur_age, tei.age);
> >   		else
> >   			ei->age = cur_age;
> >   		ei->last_blocks = cur_blocks;
> > @@ -1233,6 +1235,7 @@ void f2fs_init_extent_cache_info(struct f2fs_sb_info *sbi)
> >   	atomic64_set(&sbi->allocated_data_blocks, 0);
> >   	sbi->hot_data_age_threshold = DEF_HOT_DATA_AGE_THRESHOLD;
> >   	sbi->warm_data_age_threshold = DEF_WARM_DATA_AGE_THRESHOLD;
> > +	sbi->last_age_weight = LAST_AGE_WEIGHT;
> >   }
> >   int __init f2fs_create_extent_cache(void)
> > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > index e8953c3dc81a..c3609cbc28c7 100644
> > --- a/fs/f2fs/f2fs.h
> > +++ b/fs/f2fs/f2fs.h
> > @@ -1679,6 +1679,7 @@ struct f2fs_sb_info {
> >   	/* The threshold used for hot and warm data seperation*/
> >   	unsigned int hot_data_age_threshold;
> >   	unsigned int warm_data_age_threshold;
> > +	unsigned int last_age_weight;
> >   	/* basic filesystem units */
> >   	unsigned int log_sectors_per_block;	/* log2 sectors per block */
> > diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> > index 83a366f3ee80..cd2fb52d1f3c 100644
> > --- a/fs/f2fs/sysfs.c
> > +++ b/fs/f2fs/sysfs.c
> > @@ -686,6 +686,15 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
> >   		return count;
> >   	}
> > +	if (!strcmp(a->attr.name, "last_age_weight")) {
> > +		if (t < 0 || t > 100)
> 
> t is unsigned long variable, should never be less than 0.
> 
> Otherwise, it looks good to me, maybe Jaegeuk could fix it manually.

Ok, applied.

> 
> Reviewed-by: Chao Yu <chao@kernel.org>
> 
> Thanks,
> 
> > +			return -EINVAL;
> > +		if (t == *ui)
> > +			return count;
> > +		*ui = (unsigned int)t;
> > +		return count;
> > +	}
> > +
> >   	*ui = (unsigned int)t;
> >   	return count;
> > @@ -944,6 +953,7 @@ F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, revoked_atomic_block, revoked_atomic_block)
> >   /* For block age extent cache */
> >   F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, hot_data_age_threshold, hot_data_age_threshold);
> >   F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, warm_data_age_threshold, warm_data_age_threshold);
> > +F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, last_age_weight, last_age_weight);
> >   #define ATTR_LIST(name) (&f2fs_attr_##name.attr)
> >   static struct attribute *f2fs_attrs[] = {
> > @@ -1042,6 +1052,7 @@ static struct attribute *f2fs_attrs[] = {
> >   	ATTR_LIST(revoked_atomic_block),
> >   	ATTR_LIST(hot_data_age_threshold),
> >   	ATTR_LIST(warm_data_age_threshold),
> > +	ATTR_LIST(last_age_weight),
> >   	NULL,
> >   };
> >   ATTRIBUTE_GROUPS(f2fs);


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
