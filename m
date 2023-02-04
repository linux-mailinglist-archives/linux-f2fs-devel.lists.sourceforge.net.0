Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9503C68A921
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  4 Feb 2023 10:07:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pOEVl-0003I6-7s;
	Sat, 04 Feb 2023 09:07:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qxy65535@gmail.com>) id 1pOEVe-0003Hn-Nq
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 04 Feb 2023 09:06:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tf2haQZAvqOYFO7mP/ikX0sl8c5419t6vefPZS0+RVU=; b=HHL8TrmjEOCiOnriJZB2N6KggW
 6GBzMRn+/JNifB0VEAvmioyrgUHLHs3ouq+Zv1VdwnZ+OPpGRonBXdsrie+JIRugRcF4RQEg9tdUc
 Y0yuqWuNc9A1FjR6yLG4VaKN/KWMyC21m3v34BiT+nHW/mP0iAxW13UEdD7q/44UdkHk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tf2haQZAvqOYFO7mP/ikX0sl8c5419t6vefPZS0+RVU=; b=V2KLmkdGSqSBGtZdzcB96QQRd3
 0lo2w+se6EEsmcWPzdBaG8fIVrgeExh3BEJk6fBUaHM+uDBqudERQkwKGnm2eiIOe+VufKfYQ8gIU
 /n6yF4Ye+WVUZysA4AwDcz7ziNl+T36+dxAkto27lcAFh9iID+lyRDWYacLrcnJikH9M=;
Received: from mail-pg1-f172.google.com ([209.85.215.172])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pOEVa-0002k3-NY for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 04 Feb 2023 09:06:57 +0000
Received: by mail-pg1-f172.google.com with SMTP id 143so5171766pgg.6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 04 Feb 2023 01:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=tf2haQZAvqOYFO7mP/ikX0sl8c5419t6vefPZS0+RVU=;
 b=NHVbFkh09qxWx82o7msi/BePAgBvjhlyXaUT4f9fLbOSURdduhXYaw66gdytfx6M4W
 nIfKZzFekFZfrb176+N9VOgnjIb/2PHY6xDa+9AHydoK0aZUgHW57bkQ8QzvEjSZViIM
 9fNCD+zQ0rQU3kTIFgedPU1zC+rGFkC9T9xNBvT9A9ODPl9tLTmC7RngFy0P9Ce4Pkz4
 Wx7mlq/OnnncW8q5mQ/bqldQcsRa5agczgoqbEtY4wisHpkKXRrtxt6FYSli/84LDuZW
 u4cv2OebTHvIVvxeciWWVArNWqmyBXVk1xDCyD3jhpHbnWykWPsQDCFKSHIywm2ObLgx
 Yxtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tf2haQZAvqOYFO7mP/ikX0sl8c5419t6vefPZS0+RVU=;
 b=A1lkbcGQ8BkFADiw/SU9ni648ImPE56CiJlHhlT2zoEdWS3/lbG0zpJbi+QuBgr7IJ
 jxooD3q5cjQxOGwv0EP3FMbf1uH0sCEld5jUwQgXDXZKHBVSH+er9SMPnyWoU7ie7BPl
 w6utFIp+PYNc8hfWIvxHLIaP0X0kNLR7JF4X6uPJY1MP+Vc4rMpuqqwQkKnKCpG/aGjT
 +wOXa0HhhU9USsjKQsh+Bp47PZfnUmB4IJh1Iu+bULgfYY4n3TYZvDc835digT6Ny8OL
 AejiwCQbZvsPpOx1iU1KIjM5NobPsrPqEpMI4/J0bfRBGaBdDCSI9K/YXw806iDfK0mt
 Oczw==
X-Gm-Message-State: AO0yUKVMrgUvSoAi5F7TfrcJ+cKox2gTUgVjZBdm+uUSFnx9AbIgSfeY
 JKzZyoTh1+tjELovegrw9iU=
X-Google-Smtp-Source: AK7set+09PaTOq64k/lcVz6HAay5lSe5zNfHWTjIbZ/2ea7k8+S641z5gw4r1w97boNsUbcqs0j1ww==
X-Received: by 2002:aa7:9911:0:b0:592:5dd5:7655 with SMTP id
 z17-20020aa79911000000b005925dd57655mr11728250pff.28.1675501609788; 
 Sat, 04 Feb 2023 01:06:49 -0800 (PST)
Received: from qxy-XPS-13-9360 ([43.224.245.234])
 by smtp.gmail.com with ESMTPSA id
 m8-20020a62f208000000b005891c98e1aasm3204430pfh.119.2023.02.04.01.06.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Feb 2023 01:06:49 -0800 (PST)
Date: Sat, 4 Feb 2023 17:06:43 +0800
From: qixiaoyu <qxy65535@gmail.com>
To: Chao Yu <chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <Y94gI9acVXF+LHPb@qxy-XPS-13-9360>
References: <938a8e61-4e47-1acc-938c-c90d213d2c86@kernel.org>
 <20230202082028.9013-1-qixiaoyu1@xiaomi.com>
 <20230202082028.9013-2-qixiaoyu1@xiaomi.com>
 <3589331b-a3ec-87e1-790d-387439672ea5@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3589331b-a3ec-87e1-790d-387439672ea5@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Feb 03, 2023 at 04:31:58PM +0800, Chao Yu wrote: >
 On 2023/2/2 16:20,
 qixiaoyu1 wrote: > > Signed-off-by: qixiaoyu1 > > Signed-off-by:
 xiongping1 > > --- > > Documentation/ABI/testing/sysf [...] 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [qxy65535[at]gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [qxy65535[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.215.172 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.215.172 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pOEVa-0002k3-NY
Subject: Re: [f2fs-dev] [PATCH 2/2 v3] f2fs: add sysfs nodes to set
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
Cc: Ping Xiong <xiongping1@xiaomi.com>, Xiaoyu Qi <qixiaoyu1@xiaomi.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Feb 03, 2023 at 04:31:58PM +0800, Chao Yu wrote:
> On 2023/2/2 16:20, qixiaoyu1 wrote:
> > Signed-off-by: qixiaoyu1 <qixiaoyu1@xiaomi.com>
> > Signed-off-by: xiongping1 <xiongping1@xiaomi.com>
> > ---
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
> > index 83a366f3ee80..a70cf674d8e7 100644
> > --- a/fs/f2fs/sysfs.c
> > +++ b/fs/f2fs/sysfs.c
> > @@ -686,6 +686,15 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
> >   		return count;
> >   	}
> > +	if (!strcmp(a->attr.name, "last_age_weight")) {
> > +		if (t <= 0 || t >= 100)
> 
> Could 0 or 100 be a valid value?
> 
> Thanks,
> 

0 and 100 can both be a valid value:

We may use 0 to set the new block age without refering to the previous
age. 100 doesn't make so much sence since the age will only be set
to a non-zero value on the first updated (after create, truncate,
etc.), but maybe we can do some tricks with a value of 100.

Let me update the patch.

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
