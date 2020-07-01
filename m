Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF3C2103F9
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  1 Jul 2020 08:36:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jqWM2-0002Ak-4h; Wed, 01 Jul 2020 06:36:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jqWLz-0002AY-Eo
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 01 Jul 2020 06:36:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UK44QxbuzhV/Pqo6j/W/XhBKXMhEa8SZJkoJXdRp6vA=; b=aFYOaDiebW9GmWR8auwc0dWqjc
 jGoZz/kYDRT2YbURq40au2oYhjRJkSKhoVJC7dvXOdbjPOjlau4hRj5RSHz7gegTY1trpqadm/6w7
 suGBUgvCz0s9SBEdPB0pmpz5FTPHWWJ0iiEDSOqYIQ/rUIHs2By5r7kSs9QkYXZa/+4w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UK44QxbuzhV/Pqo6j/W/XhBKXMhEa8SZJkoJXdRp6vA=; b=KFfhm+xWXMUNlrIgwrxVCwBHpY
 /5edHDt31Ktm47S9aIAExPRHqpTJoSGXHWashQS63sa6hE2VJLC8K2eoD+JwIxXwQ6U1bm8FKIdql
 JeZu8HDJjGjoMA8K+UJgs7ik+spZBcb6gMyR3gM0kuBKd0IcovTSIPLmnGKun/Z+k2a4=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jqWLt-003mp9-JE
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 01 Jul 2020 06:36:19 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 33A915B5D58E87AE5F1F;
 Wed,  1 Jul 2020 14:36:04 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.212) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 1 Jul 2020
 14:36:03 +0800
To: Daeho Jeong <daeho43@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>, <kernel-team@android.com>
References: <20200630005625.2405062-1-daeho43@gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <961072bb-4c8f-b01e-666d-1f5e35a8b76d@huawei.com>
Date: Wed, 1 Jul 2020 14:36:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200630005625.2405062-1-daeho43@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.32 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jqWLt-003mp9-JE
Subject: Re: [f2fs-dev] [PATCH] f2fs: add symbolic link to kobject in sysfs
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Daeho,

On 2020/6/30 8:56, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Added a symbolic link to directory of sysfs. It will
> create a symbolic link such as "mount_0" and "mount_1" to
> each f2fs mount in the order of mounting filesystem. It will
> provide easy access to sysfs node even if not knowing the
> specific device node name like sda19 and dm-3.

Just out of curiosity, if we mount/umount as below:

mount /dev/zram0 /mnt/f2fs0
mount /dev/zram1 /mnt/f2fs1
umount /mnt/f2fs0
mount /dev/zram0 /mnt/f2fs0

Shouldn't sysfs structure be:
mount_2 -> zram0
mount_1 -> zram1
zram0
zram1

Then we can know zram0 is mounted after zram1?

However the result shows:
mount_0 -> zram0
mount_1 -> zram1
zram0
zram1

Thanks,

> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
>  fs/f2fs/f2fs.h  |  4 ++++
>  fs/f2fs/sysfs.c | 31 +++++++++++++++++++++++++++----
>  2 files changed, 31 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 4b28fd42fdbc..7d6c5f8ce16b 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1419,6 +1419,8 @@ struct decompress_io_ctx {
>  #define MAX_COMPRESS_LOG_SIZE		8
>  #define MAX_COMPRESS_WINDOW_SIZE	((PAGE_SIZE) << MAX_COMPRESS_LOG_SIZE)
>  
> +#define MOUNT_NAME_SIZE			20
> +
>  struct f2fs_sb_info {
>  	struct super_block *sb;			/* pointer to VFS super block */
>  	struct proc_dir_entry *s_proc;		/* proc entry */
> @@ -1599,6 +1601,8 @@ struct f2fs_sb_info {
>  	/* For sysfs suppport */
>  	struct kobject s_kobj;
>  	struct completion s_kobj_unregister;
> +	int s_mount_id;
> +	char s_mount_name[MOUNT_NAME_SIZE];
>  
>  	/* For shrinker support */
>  	struct list_head s_list;
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index ab40e1f89f23..64bbe0b3b830 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -18,6 +18,7 @@
>  #include <trace/events/f2fs.h>
>  
>  static struct proc_dir_entry *f2fs_proc_root;
> +static struct ida f2fs_mount_ida;
>  
>  /* Sysfs support for f2fs */
>  enum {
> @@ -906,6 +907,9 @@ int __init f2fs_init_sysfs(void)
>  	} else {
>  		f2fs_proc_root = proc_mkdir("fs/f2fs", NULL);
>  	}
> +
> +	ida_init(&f2fs_mount_ida);
> +
>  	return ret;
>  }
>  
> @@ -915,6 +919,7 @@ void f2fs_exit_sysfs(void)
>  	kset_unregister(&f2fs_kset);
>  	remove_proc_entry("fs/f2fs", NULL);
>  	f2fs_proc_root = NULL;
> +	ida_destroy(&f2fs_mount_ida);
>  }
>  
>  int f2fs_register_sysfs(struct f2fs_sb_info *sbi)
> @@ -926,12 +931,22 @@ int f2fs_register_sysfs(struct f2fs_sb_info *sbi)
>  	init_completion(&sbi->s_kobj_unregister);
>  	err = kobject_init_and_add(&sbi->s_kobj, &f2fs_sb_ktype, NULL,
>  				"%s", sb->s_id);
> -	if (err) {
> -		kobject_put(&sbi->s_kobj);
> -		wait_for_completion(&sbi->s_kobj_unregister);
> -		return err;
> +	if (err)
> +		goto err1;
> +
> +	sbi->s_mount_id = ida_simple_get(&f2fs_mount_ida, 0, 0, GFP_KERNEL);
> +	if (sbi->s_mount_id < 0) {
> +		err = sbi->s_mount_id;
> +		goto err1;
>  	}
>  
> +	snprintf(sbi->s_mount_name, MOUNT_NAME_SIZE, "mount_%d",
> +			sbi->s_mount_id);
> +	err = sysfs_create_link(&f2fs_kset.kobj, &sbi->s_kobj,
> +			sbi->s_mount_name);
> +	if (err)
> +		goto err2;
> +
>  	if (f2fs_proc_root)
>  		sbi->s_proc = proc_mkdir(sb->s_id, f2fs_proc_root);
>  
> @@ -946,6 +961,12 @@ int f2fs_register_sysfs(struct f2fs_sb_info *sbi)
>  				victim_bits_seq_show, sb);
>  	}
>  	return 0;
> +err2:
> +	ida_simple_remove(&f2fs_mount_ida, sbi->s_mount_id);
> +err1:
> +	kobject_put(&sbi->s_kobj);
> +	wait_for_completion(&sbi->s_kobj_unregister);
> +	return err;
>  }
>  
>  void f2fs_unregister_sysfs(struct f2fs_sb_info *sbi)
> @@ -957,6 +978,8 @@ void f2fs_unregister_sysfs(struct f2fs_sb_info *sbi)
>  		remove_proc_entry("victim_bits", sbi->s_proc);
>  		remove_proc_entry(sbi->sb->s_id, f2fs_proc_root);
>  	}
> +	sysfs_remove_link(&f2fs_kset.kobj, sbi->s_mount_name);
> +	ida_simple_remove(&f2fs_mount_ida, sbi->s_mount_id);
>  	kobject_del(&sbi->s_kobj);
>  	kobject_put(&sbi->s_kobj);
>  }
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
