Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 044ED2CF3FC
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Dec 2020 19:24:01 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1klFkK-0001J8-8G; Fri, 04 Dec 2020 18:23:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1klFkI-0001J1-W6
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Dec 2020 18:23:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eNTt/g2J/AQrKvoRcpwfk5csUehOFmbNS7xhT/ipFYw=; b=N48pG9EYQspQOk3+smoXEv+Zpa
 1blxGHZi0ZvlGjeRueKwBBrfClFSOKHVkCL/qa5O9I2lxMV+bdGM//rbI3fNCirivWsLWbIJ99cFp
 H2uF9vXWHWolswwIGEd21vEaLBAi2KEt3vF9GOtionkKCdpXAW59UA0QdVZTffcuCkoc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eNTt/g2J/AQrKvoRcpwfk5csUehOFmbNS7xhT/ipFYw=; b=mXtZJ1T62M/heqWhSc0PEI4vHW
 R3Wjv44XetJkDxZzT566WYFO7HIXEKt2Gu1/+3vO3EUzK5z9CgwFWSjcJ+vlXpDMJAHqFrfbwCFHr
 ilIDusWZbA/GEW+KUz8uwFmO8MBgxkpWlNvTxqn5uPkv/rYWTRXGzGggG7RDIdfaGdlI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1klFkH-00Fb8W-23
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Dec 2020 18:23:54 +0000
Date: Fri, 4 Dec 2020 10:23:40 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607106221;
 bh=frGCvVorSjGhUb+CZl2+o3Cot8SUsEXDTN1OlWl1EbQ=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=IsjJ3mvp9gloogt304bTevJHpT/RfKJMsafOaPkZoK1zw7noVonG+B1aL2e24rfxR
 bg2jR9Vx9deMPl5Jn2y2f92hOP3biDihijQcU9x3uQl3LvnY17Qh98zDxckPiMQSrt
 vKrS/aAuVwFKSNHWgKIn2KQzz0voU7t/ga3n6L8T6TISDVG4mnmXoKpzvbMU91CfRS
 l75b2q4WqezSxkRMfxdBcobyy3ATkGwyXOM7g8FyRNaFbCmNPk/sJodj9Z60LqzQcn
 dMrwPs1ESjs83xgCa3Z0Q3WAX1coOqBn0McjYGAeZs3A3RTYwNZeaOd1TxmWLPm1Ls
 YpHjLEt98zS6w==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <X8p+rK6wQsXdcG33@google.com>
References: <20201127090118.84235-1-yuchao0@huawei.com>
 <af26ca56-1dbf-e59b-b7b0-63ce817fd94d@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <af26ca56-1dbf-e59b-b7b0-63ce817fd94d@huawei.com>
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1klFkH-00Fb8W-23
Subject: Re: [f2fs-dev] [PATCH] f2fs: introduce a new per-sb directory in
 sysfs
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

On 12/03, Chao Yu wrote:
> Jaegeuk,
> 
> Can you comment on this patch?

Waiting for use-case? :)

> 
> On 2020/11/27 17:01, Chao Yu wrote:
> > Add a new directory 'stat' in path of /sys/fs/f2fs/<devname>/, later
> > we can add new readonly stat sysfs file into this directory, it will
> > make <devname> directory less mess.
> > 
> > Signed-off-by: Chao Yu <yuchao0@huawei.com>
> > ---
> >   fs/f2fs/f2fs.h  |  5 +++-
> >   fs/f2fs/sysfs.c | 69 +++++++++++++++++++++++++++++++++++++++++++++----
> >   2 files changed, 68 insertions(+), 6 deletions(-)
> > 
> > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > index 0d38f2135016..a20059dece46 100644
> > --- a/fs/f2fs/f2fs.h
> > +++ b/fs/f2fs/f2fs.h
> > @@ -1510,9 +1510,12 @@ struct f2fs_sb_info {
> >   	unsigned int node_io_flag;
> >   	/* For sysfs suppport */
> > -	struct kobject s_kobj;
> > +	struct kobject s_kobj;			/* /sys/fs/f2fs/<devname> */
> >   	struct completion s_kobj_unregister;
> > +	struct kobject s_stat_kobj;		/* /sys/fs/f2fs/<devname>/stat */
> > +	struct completion s_stat_kobj_unregister;
> > +
> >   	/* For shrinker support */
> >   	struct list_head s_list;
> >   	int s_ndevs;				/* number of devices */
> > diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> > index ec77ccfea923..8c63a6e61dfd 100644
> > --- a/fs/f2fs/sysfs.c
> > +++ b/fs/f2fs/sysfs.c
> > @@ -708,6 +708,11 @@ static struct attribute *f2fs_feat_attrs[] = {
> >   };
> >   ATTRIBUTE_GROUPS(f2fs_feat);
> > +static struct attribute *f2fs_stat_attrs[] = {
> > +	NULL,
> > +};
> > +ATTRIBUTE_GROUPS(f2fs_stat);
> > +
> >   static const struct sysfs_ops f2fs_attr_ops = {
> >   	.show	= f2fs_attr_show,
> >   	.store	= f2fs_attr_store,
> > @@ -736,6 +741,44 @@ static struct kobject f2fs_feat = {
> >   	.kset	= &f2fs_kset,
> >   };
> > +static ssize_t f2fs_stat_attr_show(struct kobject *kobj,
> > +				struct attribute *attr, char *buf)
> > +{
> > +	struct f2fs_sb_info *sbi = container_of(kobj, struct f2fs_sb_info,
> > +								s_stat_kobj);
> > +	struct f2fs_attr *a = container_of(attr, struct f2fs_attr, attr);
> > +
> > +	return a->show ? a->show(a, sbi, buf) : 0;
> > +}
> > +
> > +static ssize_t f2fs_stat_attr_store(struct kobject *kobj, struct attribute *attr,
> > +						const char *buf, size_t len)
> > +{
> > +	struct f2fs_sb_info *sbi = container_of(kobj, struct f2fs_sb_info,
> > +								s_stat_kobj);
> > +	struct f2fs_attr *a = container_of(attr, struct f2fs_attr, attr);
> > +
> > +	return a->store ? a->store(a, sbi, buf, len) : 0;
> > +}
> > +
> > +static void f2fs_stat_kobj_release(struct kobject *kobj)
> > +{
> > +	struct f2fs_sb_info *sbi = container_of(kobj, struct f2fs_sb_info,
> > +								s_stat_kobj);
> > +	complete(&sbi->s_stat_kobj_unregister);
> > +}
> > +
> > +static const struct sysfs_ops f2fs_stat_attr_ops = {
> > +	.show	= f2fs_stat_attr_show,
> > +	.store	= f2fs_stat_attr_store,
> > +};
> > +
> > +static struct kobj_type f2fs_stat_ktype = {
> > +	.default_groups = f2fs_stat_groups,
> > +	.sysfs_ops	= &f2fs_stat_attr_ops,
> > +	.release	= f2fs_stat_kobj_release,
> > +};
> > +
> >   static int __maybe_unused segment_info_seq_show(struct seq_file *seq,
> >   						void *offset)
> >   {
> > @@ -942,11 +985,15 @@ int f2fs_register_sysfs(struct f2fs_sb_info *sbi)
> >   	init_completion(&sbi->s_kobj_unregister);
> >   	err = kobject_init_and_add(&sbi->s_kobj, &f2fs_sb_ktype, NULL,
> >   				"%s", sb->s_id);
> > -	if (err) {
> > -		kobject_put(&sbi->s_kobj);
> > -		wait_for_completion(&sbi->s_kobj_unregister);
> > -		return err;
> > -	}
> > +	if (err)
> > +		goto put_sb_kobj;
> > +
> > +	sbi->s_stat_kobj.kset = &f2fs_kset;
> > +	init_completion(&sbi->s_stat_kobj_unregister);
> > +	err = kobject_init_and_add(&sbi->s_stat_kobj, &f2fs_stat_ktype,
> > +						&sbi->s_kobj, "stat");
> > +	if (err)
> > +		goto put_stat_kobj;
> >   	if (f2fs_proc_root)
> >   		sbi->s_proc = proc_mkdir(sb->s_id, f2fs_proc_root);
> > @@ -962,6 +1009,13 @@ int f2fs_register_sysfs(struct f2fs_sb_info *sbi)
> >   				victim_bits_seq_show, sb);
> >   	}
> >   	return 0;
> > +put_stat_kobj:
> > +	kobject_put(&sbi->s_stat_kobj);
> > +	wait_for_completion(&sbi->s_stat_kobj_unregister);
> > +put_sb_kobj:
> > +	kobject_put(&sbi->s_kobj);
> > +	wait_for_completion(&sbi->s_kobj_unregister);
> > +	return err;
> >   }
> >   void f2fs_unregister_sysfs(struct f2fs_sb_info *sbi)
> > @@ -973,6 +1027,11 @@ void f2fs_unregister_sysfs(struct f2fs_sb_info *sbi)
> >   		remove_proc_entry("victim_bits", sbi->s_proc);
> >   		remove_proc_entry(sbi->sb->s_id, f2fs_proc_root);
> >   	}
> > +
> > +	kobject_del(&sbi->s_stat_kobj);
> > +	kobject_put(&sbi->s_stat_kobj);
> > +	wait_for_completion(&sbi->s_stat_kobj_unregister);
> > +
> >   	kobject_del(&sbi->s_kobj);
> >   	kobject_put(&sbi->s_kobj);
> >   	wait_for_completion(&sbi->s_kobj_unregister);
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
