Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BEE8A2B122
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  6 Feb 2025 19:33:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tg6gf-0003Ot-8T;
	Thu, 06 Feb 2025 18:33:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1tg6gd-0003Ol-OF
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Feb 2025 18:33:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0ytjpnxj9m2xLYYOCDnT2dOrfNWBt7wW4aDbiobWJu8=; b=d4NvYXmvCcdhuJeOgffSgUu4En
 czsU8ZRaVlmT7uywTgwe2vmH+A0hXSag0tB4KHXm20gJgH4Onjkal8aoIDq5mAyJN1KSlZku/iMfd
 UT2HhF5rav5Kzj0UoGM/Nr49ZNn0nzSfcPVBh7iwbi7bKu2VDJK0YAJCCxz3OCcKuDxc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0ytjpnxj9m2xLYYOCDnT2dOrfNWBt7wW4aDbiobWJu8=; b=dKhID9a/e28kEnSr9qmJYPQmGH
 ILp14jcmXVE6dDlgTVIaJWQBcTv6qR9955MVM1sUaG2+8FJcAy/G8fe0Udzi3YwzgrLlzpqNwWthl
 z1ZnX6bJkaYR6chr10vttPQzaW2SNUm2SeC47ORItzyhiCU2aQ9bFB98Y5iOa80ZygO8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tg6gc-0005mn-4W for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Feb 2025 18:33:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EDA925C6E0A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  6 Feb 2025 18:32:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45ACCC4CEDD;
 Thu,  6 Feb 2025 18:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738866783;
 bh=591sNnloYxZ7gVyCY8Ao+sjYsik5UgdF7aW6/GP+lxQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G9v7kC/JEiWtm9A0p9I5cqN8YnvTZa2cy6Y7a8xitA503NqlbgP21vjyQRpYqNbyj
 envOA7Cfiw8fnq/RGKEJ7Tt5SIK0Q+pITE/WSwzcg6O2fjUfFB1sHitzPlipFQXoq9
 4V8ON6gcmxvccaQHnd2qoXiK+7+WtjNjcfe3gEQQuiNTLRuSw53/xO6rQiSiD63we7
 mAOvSt5NHTOfBDSvkxjC0womtN4au+CmTsrr0//PLP8Z63ng5IX8vTwak9F9+YtCJ+
 LxRD3v7qQaaJyaCmIRwnCp6foIh9TKNelWnlLo0YhCkiaikgk3PPdqmIX1/OSZhOE/
 ykbnEKu/wrUvg==
Date: Thu, 6 Feb 2025 18:33:01 +0000
To: Chao Yu <chao@kernel.org>
Message-ID: <Z6UAXWFXo4-7rMWQ@google.com>
References: <20250131222914.1634961-1-jaegeuk@kernel.org>
 <20250131222914.1634961-3-jaegeuk@kernel.org>
 <8fe50d87-b395-4679-a069-a2e3a890e700@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8fe50d87-b395-4679-a069-a2e3a890e700@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 02/06, Chao Yu wrote: > On 2/1/25 06:27, Jaegeuk Kim via
 Linux-f2fs-devel wrote: > > 1. ioctl(fd1, F2FS_IOC_DONATE_RANGE, {0,3});
 > > 2. ioctl(fd2, F2FS_IOC_DONATE_RANGE, {1,2}); > > 3. ioctl(fd3, [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tg6gc-0005mn-4W
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: add a sysfs entry to request
 donate file-backed pages
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 02/06, Chao Yu wrote:
> On 2/1/25 06:27, Jaegeuk Kim via Linux-f2fs-devel wrote:
> > 1. ioctl(fd1, F2FS_IOC_DONATE_RANGE, {0,3});
> > 2. ioctl(fd2, F2FS_IOC_DONATE_RANGE, {1,2});
> > 3. ioctl(fd3, F2FS_IOC_DONATE_RANGE, {3,1});
> > 4. echo 1024 > /sys/fs/f2fs/tuning/reclaim_caches_kb
> > 
> > This gives a way to reclaim file-backed pages by iterating all f2fs mounts until
> > reclaiming 1MB page cache ranges, registered by #1, #2, and #3.
> > 
> > 5. cat /sys/fs/f2fs/tuning/reclaim_caches_kb
> > -> gives total number of registered file ranges.
> > 
> > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > ---
> >  Documentation/ABI/testing/sysfs-fs-f2fs |  7 ++
> >  fs/f2fs/f2fs.h                          |  2 +
> >  fs/f2fs/shrinker.c                      | 90 +++++++++++++++++++++++++
> >  fs/f2fs/sysfs.c                         | 63 +++++++++++++++++
> >  4 files changed, 162 insertions(+)
> > 
> > diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
> > index 3e1630c70d8a..81deae2af84d 100644
> > --- a/Documentation/ABI/testing/sysfs-fs-f2fs
> > +++ b/Documentation/ABI/testing/sysfs-fs-f2fs
> > @@ -828,3 +828,10 @@ Date:		November 2024
> >  Contact:	"Chao Yu" <chao@kernel.org>
> >  Description:	It controls max read extent count for per-inode, the value of threshold
> >  		is 10240 by default.
> > +
> > +What:		/sys/fs/f2fs/tuning/reclaim_caches_kb
> > +Date:		February 2025
> > +Contact:	"Jaegeuk Kim" <jaegeuk@kernel.org>
> > +Description:	It reclaims the given KBs of file-backed pages registered by
> > +		ioctl(F2FS_IOC_DONATE_RANGE).
> > +		For example, writing N tries to drop N KBs spaces in LRU.
> > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > index 805585a7d2b6..bd0d8138b71d 100644
> > --- a/fs/f2fs/f2fs.h
> > +++ b/fs/f2fs/f2fs.h
> > @@ -4241,6 +4241,8 @@ unsigned long f2fs_shrink_count(struct shrinker *shrink,
> >  			struct shrink_control *sc);
> >  unsigned long f2fs_shrink_scan(struct shrinker *shrink,
> >  			struct shrink_control *sc);
> > +unsigned int f2fs_donate_files(void);
> > +void f2fs_reclaim_caches(unsigned int reclaim_caches_kb);
> >  void f2fs_join_shrinker(struct f2fs_sb_info *sbi);
> >  void f2fs_leave_shrinker(struct f2fs_sb_info *sbi);
> >  
> > diff --git a/fs/f2fs/shrinker.c b/fs/f2fs/shrinker.c
> > index 83d6fb97dcae..45efff635d8e 100644
> > --- a/fs/f2fs/shrinker.c
> > +++ b/fs/f2fs/shrinker.c
> > @@ -130,6 +130,96 @@ unsigned long f2fs_shrink_scan(struct shrinker *shrink,
> >  	return freed;
> >  }
> >  
> > +unsigned int f2fs_donate_files(void)
> > +{
> > +	struct f2fs_sb_info *sbi;
> > +	struct list_head *p;
> > +	unsigned int donate_files = 0;
> > +
> > +	spin_lock(&f2fs_list_lock);
> > +	p = f2fs_list.next;
> > +	while (p != &f2fs_list) {
> > +		sbi = list_entry(p, struct f2fs_sb_info, s_list);
> > +
> > +		/* stop f2fs_put_super */
> > +		if (!mutex_trylock(&sbi->umount_mutex)) {
> > +			p = p->next;
> > +			continue;
> > +		}
> > +		spin_unlock(&f2fs_list_lock);
> > +
> > +		donate_files += sbi->donate_files;
> > +
> > +		spin_lock(&f2fs_list_lock);
> > +		p = p->next;
> > +		mutex_unlock(&sbi->umount_mutex);
> > +	}
> > +	spin_unlock(&f2fs_list_lock);
> > +
> > +	return donate_files;
> > +}
> > +
> > +static unsigned int do_reclaim_caches(struct f2fs_sb_info *sbi,
> > +				unsigned int reclaim_caches_kb)
> > +{
> > +	struct inode *inode;
> > +	struct f2fs_inode_info *fi;
> > +	unsigned int nfiles = sbi->donate_files;
> > +	pgoff_t npages = reclaim_caches_kb >> (PAGE_SHIFT - 10);
> > +
> > +	while (npages && nfiles--) {
> > +		pgoff_t len;
> > +
> > +		spin_lock(&sbi->inode_lock[DONATE_INODE]);
> > +		if (list_empty(&sbi->inode_list[DONATE_INODE])) {
> > +			spin_unlock(&sbi->inode_lock[DONATE_INODE]);
> > +			break;
> > +		}
> > +		fi = list_first_entry(&sbi->inode_list[DONATE_INODE],
> > +					struct f2fs_inode_info, gdonate_list);
> > +		list_move_tail(&fi->gdonate_list, &sbi->inode_list[DONATE_INODE]);
> > +		inode = igrab(&fi->vfs_inode);
> > +		spin_unlock(&sbi->inode_lock[DONATE_INODE]);
> > +
> > +		if (!inode)
> > +			continue;
> > +
> > +		len = fi->donate_end - fi->donate_start + 1;
> > +		npages = npages < len ? 0 : npages - len;
> > +		invalidate_inode_pages2_range(inode->i_mapping,
> > +					fi->donate_start, fi->donate_end);
> > +		iput(inode);
> > +		cond_resched();
> > +	}
> > +	return npages << (PAGE_SHIFT - 10);
> > +}
> > +
> > +void f2fs_reclaim_caches(unsigned int reclaim_caches_kb)
> > +{
> > +	struct f2fs_sb_info *sbi;
> > +	struct list_head *p;
> > +
> > +	spin_lock(&f2fs_list_lock);
> > +	p = f2fs_list.next;
> > +	while (p != &f2fs_list && reclaim_caches_kb) {
> > +		sbi = list_entry(p, struct f2fs_sb_info, s_list);
> > +
> > +		/* stop f2fs_put_super */
> > +		if (!mutex_trylock(&sbi->umount_mutex)) {
> > +			p = p->next;
> > +			continue;
> > +		}
> > +		spin_unlock(&f2fs_list_lock);
> > +
> > +		reclaim_caches_kb = do_reclaim_caches(sbi, reclaim_caches_kb);
> > +
> > +		spin_lock(&f2fs_list_lock);
> > +		p = p->next;
> > +		mutex_unlock(&sbi->umount_mutex);
> > +	}
> > +	spin_unlock(&f2fs_list_lock);
> > +}
> > +
> >  void f2fs_join_shrinker(struct f2fs_sb_info *sbi)
> >  {
> >  	spin_lock(&f2fs_list_lock);
> > diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> > index 4bd7b17a20c8..579226a05a69 100644
> > --- a/fs/f2fs/sysfs.c
> > +++ b/fs/f2fs/sysfs.c
> > @@ -916,6 +916,39 @@ static struct f2fs_base_attr f2fs_base_attr_##_name = {		\
> >  	.show	= f2fs_feature_show,				\
> >  }
> >  
> > +static ssize_t f2fs_tune_show(struct f2fs_base_attr *a, char *buf)
> > +{
> > +	unsigned int res;
> > +
> > +	if (!strcmp(a->attr.name, "reclaim_caches_kb"))
> > +		res = f2fs_donate_files();
> > +
> > +	return sysfs_emit(buf, "%u\n", res);
> > +}
> > +
> > +static ssize_t f2fs_tune_store(struct f2fs_base_attr *a,
> > +			const char *buf, size_t count)
> > +{
> > +	unsigned long t;
> > +	int ret;
> > +
> > +	ret = kstrtoul(skip_spaces(buf), 0, &t);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (!strcmp(a->attr.name, "reclaim_caches_kb"))
> > +		f2fs_reclaim_caches(t);
> > +
> > +	return ret ? ret : count;
> 
> return count;

Applied. Thanks,

> 
> Thanks,
> 
> > +}
> > +
> > +#define F2FS_TUNE_RW_ATTR(_name)				\
> > +static struct f2fs_base_attr f2fs_base_attr_##_name = {		\
> > +	.attr = {.name = __stringify(_name), .mode = 0644 },	\
> > +	.show	= f2fs_tune_show,				\
> > +	.store	= f2fs_tune_store,				\
> > +}
> > +
> >  static ssize_t f2fs_sb_feature_show(struct f2fs_attr *a,
> >  		struct f2fs_sb_info *sbi, char *buf)
> >  {
> > @@ -1368,6 +1401,14 @@ static struct attribute *f2fs_sb_feat_attrs[] = {
> >  };
> >  ATTRIBUTE_GROUPS(f2fs_sb_feat);
> >  
> > +F2FS_TUNE_RW_ATTR(reclaim_caches_kb);
> > +
> > +static struct attribute *f2fs_tune_attrs[] = {
> > +	BASE_ATTR_LIST(reclaim_caches_kb),
> > +	NULL,
> > +};
> > +ATTRIBUTE_GROUPS(f2fs_tune);
> > +
> >  static const struct sysfs_ops f2fs_attr_ops = {
> >  	.show	= f2fs_attr_show,
> >  	.store	= f2fs_attr_store,
> > @@ -1401,6 +1442,20 @@ static struct kobject f2fs_feat = {
> >  	.kset	= &f2fs_kset,
> >  };
> >  
> > +static const struct sysfs_ops f2fs_tune_attr_ops = {
> > +	.show	= f2fs_base_attr_show,
> > +	.store	= f2fs_base_attr_store,
> > +};
> > +
> > +static const struct kobj_type f2fs_tune_ktype = {
> > +	.default_groups = f2fs_tune_groups,
> > +	.sysfs_ops	= &f2fs_tune_attr_ops,
> > +};
> > +
> > +static struct kobject f2fs_tune = {
> > +	.kset	= &f2fs_kset,
> > +};
> > +
> >  static ssize_t f2fs_stat_attr_show(struct kobject *kobj,
> >  				struct attribute *attr, char *buf)
> >  {
> > @@ -1637,6 +1692,11 @@ int __init f2fs_init_sysfs(void)
> >  	if (ret)
> >  		goto unregister_out;
> >  
> > +	ret = kobject_init_and_add(&f2fs_tune, &f2fs_tune_ktype,
> > +				   NULL, "tuning");
> > +	if (ret)
> > +		goto put_feat;
> > +
> >  	f2fs_proc_root = proc_mkdir("fs/f2fs", NULL);
> >  	if (!f2fs_proc_root) {
> >  		ret = -ENOMEM;
> > @@ -1645,6 +1705,8 @@ int __init f2fs_init_sysfs(void)
> >  
> >  	return 0;
> >  put_kobject:
> > +	kobject_put(&f2fs_tune);
> > +put_feat:
> >  	kobject_put(&f2fs_feat);
> >  unregister_out:
> >  	kset_unregister(&f2fs_kset);
> > @@ -1653,6 +1715,7 @@ int __init f2fs_init_sysfs(void)
> >  
> >  void f2fs_exit_sysfs(void)
> >  {
> > +	kobject_put(&f2fs_tune);
> >  	kobject_put(&f2fs_feat);
> >  	kset_unregister(&f2fs_kset);
> >  	remove_proc_entry("fs/f2fs", NULL);


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
