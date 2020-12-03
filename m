Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BE92CD1E2
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Dec 2020 09:57:22 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kkkQR-0000Me-7z; Thu, 03 Dec 2020 08:57:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kkkQ0-0000L6-U0
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Dec 2020 08:56:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3sBmPvrswxg8hUM3vMOOPx5cnGxwLmQ22jtLiOuBMrw=; b=kOo5fftlOlsAC0+b4SnEV5O/fR
 gGE3nNMAjMOmp4qdvkHxa/uwO84oQwwb3ifNAeOD9VraP0z9EDxuLs7tqS1PeyhTkU16ty03NFpoj
 FIBSrkK5xjte3BgWWgv6t2ZhxZPdkthfRfTEhtVmlX8MlFSEK0+7CGHL3DwCIfGUPZZA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3sBmPvrswxg8hUM3vMOOPx5cnGxwLmQ22jtLiOuBMrw=; b=SevXke9VcNlrkxj4iANzDCTVDT
 KyXFodrGipWwF9mOpxw769m8sSfWJ5oxe5muFtphBELB8Jxxzeox1KYhiAmGKxjgkY/n1L+h5fJwf
 CJe9VtIbWCA1nG9UHEWr4WCndiRdf+OMgS3yHdZA/4GTFwjgVUiWoGP35OsqT5tUMABk=;
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kkkPv-00HTyH-8x
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Dec 2020 08:56:52 +0000
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4CmqSX3j9wzhl8h;
 Thu,  3 Dec 2020 16:56:12 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.203) with Microsoft SMTP Server (TLS) id 14.3.487.0; Thu, 3 Dec 2020
 16:56:27 +0800
To: <jaegeuk@kernel.org>
References: <20201127090118.84235-1-yuchao0@huawei.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <af26ca56-1dbf-e59b-b7b0-63ce817fd94d@huawei.com>
Date: Thu, 3 Dec 2020 16:56:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20201127090118.84235-1-yuchao0@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.32 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kkkPv-00HTyH-8x
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Jaegeuk,

Can you comment on this patch?

On 2020/11/27 17:01, Chao Yu wrote:
> Add a new directory 'stat' in path of /sys/fs/f2fs/<devname>/, later
> we can add new readonly stat sysfs file into this directory, it will
> make <devname> directory less mess.
> 
> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> ---
>   fs/f2fs/f2fs.h  |  5 +++-
>   fs/f2fs/sysfs.c | 69 +++++++++++++++++++++++++++++++++++++++++++++----
>   2 files changed, 68 insertions(+), 6 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 0d38f2135016..a20059dece46 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1510,9 +1510,12 @@ struct f2fs_sb_info {
>   	unsigned int node_io_flag;
>   
>   	/* For sysfs suppport */
> -	struct kobject s_kobj;
> +	struct kobject s_kobj;			/* /sys/fs/f2fs/<devname> */
>   	struct completion s_kobj_unregister;
>   
> +	struct kobject s_stat_kobj;		/* /sys/fs/f2fs/<devname>/stat */
> +	struct completion s_stat_kobj_unregister;
> +
>   	/* For shrinker support */
>   	struct list_head s_list;
>   	int s_ndevs;				/* number of devices */
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index ec77ccfea923..8c63a6e61dfd 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -708,6 +708,11 @@ static struct attribute *f2fs_feat_attrs[] = {
>   };
>   ATTRIBUTE_GROUPS(f2fs_feat);
>   
> +static struct attribute *f2fs_stat_attrs[] = {
> +	NULL,
> +};
> +ATTRIBUTE_GROUPS(f2fs_stat);
> +
>   static const struct sysfs_ops f2fs_attr_ops = {
>   	.show	= f2fs_attr_show,
>   	.store	= f2fs_attr_store,
> @@ -736,6 +741,44 @@ static struct kobject f2fs_feat = {
>   	.kset	= &f2fs_kset,
>   };
>   
> +static ssize_t f2fs_stat_attr_show(struct kobject *kobj,
> +				struct attribute *attr, char *buf)
> +{
> +	struct f2fs_sb_info *sbi = container_of(kobj, struct f2fs_sb_info,
> +								s_stat_kobj);
> +	struct f2fs_attr *a = container_of(attr, struct f2fs_attr, attr);
> +
> +	return a->show ? a->show(a, sbi, buf) : 0;
> +}
> +
> +static ssize_t f2fs_stat_attr_store(struct kobject *kobj, struct attribute *attr,
> +						const char *buf, size_t len)
> +{
> +	struct f2fs_sb_info *sbi = container_of(kobj, struct f2fs_sb_info,
> +								s_stat_kobj);
> +	struct f2fs_attr *a = container_of(attr, struct f2fs_attr, attr);
> +
> +	return a->store ? a->store(a, sbi, buf, len) : 0;
> +}
> +
> +static void f2fs_stat_kobj_release(struct kobject *kobj)
> +{
> +	struct f2fs_sb_info *sbi = container_of(kobj, struct f2fs_sb_info,
> +								s_stat_kobj);
> +	complete(&sbi->s_stat_kobj_unregister);
> +}
> +
> +static const struct sysfs_ops f2fs_stat_attr_ops = {
> +	.show	= f2fs_stat_attr_show,
> +	.store	= f2fs_stat_attr_store,
> +};
> +
> +static struct kobj_type f2fs_stat_ktype = {
> +	.default_groups = f2fs_stat_groups,
> +	.sysfs_ops	= &f2fs_stat_attr_ops,
> +	.release	= f2fs_stat_kobj_release,
> +};
> +
>   static int __maybe_unused segment_info_seq_show(struct seq_file *seq,
>   						void *offset)
>   {
> @@ -942,11 +985,15 @@ int f2fs_register_sysfs(struct f2fs_sb_info *sbi)
>   	init_completion(&sbi->s_kobj_unregister);
>   	err = kobject_init_and_add(&sbi->s_kobj, &f2fs_sb_ktype, NULL,
>   				"%s", sb->s_id);
> -	if (err) {
> -		kobject_put(&sbi->s_kobj);
> -		wait_for_completion(&sbi->s_kobj_unregister);
> -		return err;
> -	}
> +	if (err)
> +		goto put_sb_kobj;
> +
> +	sbi->s_stat_kobj.kset = &f2fs_kset;
> +	init_completion(&sbi->s_stat_kobj_unregister);
> +	err = kobject_init_and_add(&sbi->s_stat_kobj, &f2fs_stat_ktype,
> +						&sbi->s_kobj, "stat");
> +	if (err)
> +		goto put_stat_kobj;
>   
>   	if (f2fs_proc_root)
>   		sbi->s_proc = proc_mkdir(sb->s_id, f2fs_proc_root);
> @@ -962,6 +1009,13 @@ int f2fs_register_sysfs(struct f2fs_sb_info *sbi)
>   				victim_bits_seq_show, sb);
>   	}
>   	return 0;
> +put_stat_kobj:
> +	kobject_put(&sbi->s_stat_kobj);
> +	wait_for_completion(&sbi->s_stat_kobj_unregister);
> +put_sb_kobj:
> +	kobject_put(&sbi->s_kobj);
> +	wait_for_completion(&sbi->s_kobj_unregister);
> +	return err;
>   }
>   
>   void f2fs_unregister_sysfs(struct f2fs_sb_info *sbi)
> @@ -973,6 +1027,11 @@ void f2fs_unregister_sysfs(struct f2fs_sb_info *sbi)
>   		remove_proc_entry("victim_bits", sbi->s_proc);
>   		remove_proc_entry(sbi->sb->s_id, f2fs_proc_root);
>   	}
> +
> +	kobject_del(&sbi->s_stat_kobj);
> +	kobject_put(&sbi->s_stat_kobj);
> +	wait_for_completion(&sbi->s_stat_kobj_unregister);
> +
>   	kobject_del(&sbi->s_kobj);
>   	kobject_put(&sbi->s_kobj);
>   	wait_for_completion(&sbi->s_kobj_unregister);
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
