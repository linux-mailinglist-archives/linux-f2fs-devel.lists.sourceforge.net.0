Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6D223B1EF
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Aug 2020 02:56:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k2lFZ-00034U-5K; Tue, 04 Aug 2020 00:56:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1k2lFU-00034F-HR
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 04 Aug 2020 00:56:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rpx05VzxtdlU8AbLEHjejXOIoUH+WAlVKEiKrwubzS4=; b=QJonz/ViWOOKuXU8YWbpv4lYC2
 RJHiBedS6Epgvq9+GFjpAnYZv4aNhOabCb8uGaHCMnSGKwT5EfxBFaGjttSZP3kxfpXTFDb7tBG1P
 hcJEY9GgLWZsj6SiZitWDA/ShljAL6MTGM2Ns2qt6r9jnnovWVrjfpc8O8CzMiWwjfls=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rpx05VzxtdlU8AbLEHjejXOIoUH+WAlVKEiKrwubzS4=; b=UnqF3fKMcQZKpDKYFvKkxzIhSO
 +Os7Z5gTEY5gXjkMq6GXHtXQi7dnOmdNNTzUjUzzH78AjTB7NpQbZ7hYTJU/g8lbtM1mETQXDQhf/
 tmYTa4o4xqMOH9hWqhOwhaRWGWnIKAA/mHE1VWWs8tJ6c/+9OmHxQEkBucaI5r9P53nQ=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1k2lFS-0021js-JC
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 04 Aug 2020 00:56:12 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 3580CF61B8946DC49F7E;
 Tue,  4 Aug 2020 08:55:57 +0800 (CST)
Received: from [10.164.122.247] (10.164.122.247) by smtp.huawei.com
 (10.3.19.206) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 4 Aug 2020
 08:55:55 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>, <kernel-team@android.com>
References: <20200803172825.4077289-1-jaegeuk@kernel.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <9638d2c5-cfd0-359f-187a-8e23bc6d822d@huawei.com>
Date: Tue, 4 Aug 2020 08:55:55 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200803172825.4077289-1-jaegeuk@kernel.org>
Content-Language: en-US
X-Originating-IP: [10.164.122.247]
X-CFilter-Loop: Reflected
X-Spam-Score: -1.5 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.32 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -1.5 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1k2lFS-0021js-JC
Subject: Re: [f2fs-dev] [PATCH] f2fs: remove a waiter for checkpoint
 completion
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
Cc: Eric Biggers <ebiggers@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/8/4 1:28, Jaegeuk Kim wrote:
> It doesn't need to wait for checkpoint being completed triggered by end_io.
> 
> [   20.157753] ------------[ cut here ]------------
> [   20.158393] do not call blocking ops when !TASK_RUNNING; state=2 set at [<0000000096354225>] prepare_to_wait+0xcd/0x430
> [   20.159858] WARNING: CPU: 1 PID: 1152 at kernel/sched/core.c:7142 __might_sleep+0x149/0x1a0
> ...
> [   20.176110]  __submit_merged_write_cond+0x191/0x310
> [   20.176739]  f2fs_submit_merged_write+0x18/0x20
> [   20.177323]  f2fs_wait_on_all_pages+0x269/0x2d0
> [   20.177899]  ? block_operations+0x980/0x980
> [   20.178441]  ? __kasan_check_read+0x11/0x20
> [   20.178975]  ? finish_wait+0x260/0x260
> [   20.179488]  ? percpu_counter_set+0x147/0x230
> [   20.180049]  do_checkpoint+0x1757/0x2a50
> [   20.180558]  f2fs_write_checkpoint+0x840/0xaf0
> [   20.181126]  f2fs_sync_fs+0x287/0x4a0
> 
> Reported-by: Eric Biggers <ebiggers@kernel.org>
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>   fs/f2fs/checkpoint.c | 6 +-----
>   fs/f2fs/data.c       | 4 ----
>   fs/f2fs/f2fs.h       | 1 -
>   fs/f2fs/super.c      | 1 -
>   4 files changed, 1 insertion(+), 11 deletions(-)
> 
> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> index 99c8061da55b9..2bdddc725e677 100644
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@ -1255,11 +1255,7 @@ static void unblock_operations(struct f2fs_sb_info *sbi)
>   
>   void f2fs_wait_on_all_pages(struct f2fs_sb_info *sbi, int type)
>   {
> -	DEFINE_WAIT(wait);
> -
>   	for (;;) {
> -		prepare_to_wait(&sbi->cp_wait, &wait, TASK_UNINTERRUPTIBLE);

Wouldn't that case high cpu usage before io end?

> -
>   		if (!get_pages(sbi, type))
>   			break;
>   
> @@ -1271,9 +1267,9 @@ void f2fs_wait_on_all_pages(struct f2fs_sb_info *sbi, int type)
>   							FS_CP_META_IO);
>   		else if (type == F2FS_WB_CP_DATA)
>   			f2fs_submit_merged_write(sbi, DATA);
> +
>   		io_schedule_timeout(DEFAULT_IO_TIMEOUT);
>   	}
> -	finish_wait(&sbi->cp_wait, &wait);
>   }
>   
>   static void update_ckpt_flags(struct f2fs_sb_info *sbi, struct cp_control *cpc)
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index c1b676be67b9a..588d2871bbe69 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -383,10 +383,6 @@ static void f2fs_write_end_io(struct bio *bio)
>   		clear_cold_data(page);
>   		end_page_writeback(page);
>   	}
> -	if (!get_pages(sbi, F2FS_WB_CP_DATA) &&
> -				wq_has_sleeper(&sbi->cp_wait))
> -		wake_up(&sbi->cp_wait);
> -
>   	bio_put(bio);
>   }
>   
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 02811ce15059b..a036539363030 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1437,7 +1437,6 @@ struct f2fs_sb_info {
>   	struct rw_semaphore cp_rwsem;		/* blocking FS operations */
>   	struct rw_semaphore node_write;		/* locking node writes */
>   	struct rw_semaphore node_change;	/* locking node change */
> -	wait_queue_head_t cp_wait;
>   	unsigned long last_time[MAX_TIME];	/* to store time in jiffies */
>   	long interval_time[MAX_TIME];		/* to store thresholds */
>   
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 83bf9a02f83f2..5f4d9abc079d6 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -3540,7 +3540,6 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>   
>   	init_rwsem(&sbi->cp_rwsem);
>   	init_rwsem(&sbi->quota_sem);
> -	init_waitqueue_head(&sbi->cp_wait);
>   	init_sb_info(sbi);
>   
>   	err = init_percpu_info(sbi);
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
