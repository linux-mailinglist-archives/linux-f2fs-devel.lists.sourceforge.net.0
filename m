Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A13C5165799
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 20 Feb 2020 07:26:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j4fIO-00086F-60; Thu, 20 Feb 2020 06:26:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1j4fIM-000860-Kd
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 20 Feb 2020 06:26:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Gb/zYBEi+Na1NqSMOZsHx/o8cC8TJ2hB+ZQbf7Igz3E=; b=g3JYdHR8M5xbbkGarUO3qSSbwy
 ILvSo0WnZhb+u2wtmjPpLml8YCog0eTFFPIrX7ak1LeK9rAidrAkOclWFhzIXtYOJYMPoqCVRJovN
 5SOLyLDAa2bXzsVW4Eezs1XPa7jYdiCDK3Na36cGzw35sN6BfHX/J2dYXmG+QQnWZLPA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Gb/zYBEi+Na1NqSMOZsHx/o8cC8TJ2hB+ZQbf7Igz3E=; b=MAJ3nOfTV/6/A8to4qyAn+K/n6
 C3x36aCVfOonKjCQ7XvLha4vHfIllIbC02yz6WiffOHZolAFyWdQXlm+LYPIyt+9g3/MNyc9gCxr1
 /v6pt1CxD6KVawQLxVA7HfKpxZCVQk6ZKXj/+jfjFendDL/9XsEM6eHzLSnRCY3tOk0k=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j4fII-008hS0-L7
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 20 Feb 2020 06:26:46 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id B58305314CD405316284;
 Thu, 20 Feb 2020 14:26:32 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.214) with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 20 Feb
 2020 14:26:29 +0800
To: <jaegeuk@kernel.org>
References: <20200217094544.106429-1-yuchao0@huawei.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <722787da-92b0-6b98-17a1-79372c9baf7e@huawei.com>
Date: Thu, 20 Feb 2020 14:26:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200217094544.106429-1-yuchao0@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1j4fII-008hS0-L7
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: introduce DEFAULT_IO_TIMEOUT
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

Hi Jaegeuk,

Could you help to adapt this change for f2fs_wait_on_all_pages() manually
in your tree?

-		io_schedule_timeout(HZ/50);
+		io_schedule_timeout(DEFAULT_IO_TIMEOUT);

Thanks,

On 2020/2/17 17:45, Chao Yu wrote:
> As Geert Uytterhoeven reported:
> 
> for parameter HZ/50 in congestion_wait(BLK_RW_ASYNC, HZ/50);
> 
> On some platforms, HZ can be less than 50, then unexpected 0 timeout
> jiffies will be set in congestion_wait().
> 
> This patch introduces a macro DEFAULT_IO_TIMEOUT to wrap a determinate
> value with msecs_to_jiffies(20) to instead HZ/50 to avoid such issue.
> 
> Quoted from Geert Uytterhoeven:
> 
> "A timeout of HZ means 1 second.
> HZ/50 means 20 ms, but has the risk of being zero, if HZ < 50.
> 
> If you want to use a timeout of 20 ms, you best use msecs_to_jiffies(20),
> as that takes care of the special cases, and never returns 0."
> 
> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> ---
> v2:
> - use msecs_to_jiffies(20) instead.
>  fs/f2fs/compress.c |  3 ++-
>  fs/f2fs/data.c     |  4 ++--
>  fs/f2fs/f2fs.h     |  3 +++
>  fs/f2fs/gc.c       |  3 ++-
>  fs/f2fs/inode.c    |  2 +-
>  fs/f2fs/node.c     |  2 +-
>  fs/f2fs/recovery.c |  5 +++--
>  fs/f2fs/segment.c  | 10 ++++++----
>  fs/f2fs/super.c    |  6 ++++--
>  9 files changed, 24 insertions(+), 14 deletions(-)
> 
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index 0282149aa4c8..b9ea531ffbb6 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -985,7 +985,8 @@ static int f2fs_write_raw_pages(struct compress_ctx *cc,
>  			} else if (ret == -EAGAIN) {
>  				ret = 0;
>  				cond_resched();
> -				congestion_wait(BLK_RW_ASYNC, HZ/50);
> +				congestion_wait(BLK_RW_ASYNC,
> +						DEFAULT_IO_TIMEOUT);
>  				lock_page(cc->rpages[i]);
>  				clear_page_dirty_for_io(cc->rpages[i]);
>  				goto retry_write;
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 019c91f7b301..a877cc50a4c3 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -2332,7 +2332,7 @@ int f2fs_encrypt_one_page(struct f2fs_io_info *fio)
>  		/* flush pending IOs and wait for a while in the ENOMEM case */
>  		if (PTR_ERR(fio->encrypted_page) == -ENOMEM) {
>  			f2fs_flush_merged_writes(fio->sbi);
> -			congestion_wait(BLK_RW_ASYNC, HZ/50);
> +			congestion_wait(BLK_RW_ASYNC, DEFAULT_IO_TIMEOUT);
>  			gfp_flags |= __GFP_NOFAIL;
>  			goto retry_encrypt;
>  		}
> @@ -2923,7 +2923,7 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
>  					if (wbc->sync_mode == WB_SYNC_ALL) {
>  						cond_resched();
>  						congestion_wait(BLK_RW_ASYNC,
> -								HZ/50);
> +							DEFAULT_IO_TIMEOUT);
>  						goto retry_write;
>  					}
>  					goto next;
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 816a5adb83a4..72c91a6dd549 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -558,6 +558,9 @@ enum {
>  
>  #define DEFAULT_RETRY_IO_COUNT	8	/* maximum retry read IO count */
>  
> +/* congestion wait timeout value, default: 20ms */
> +#define	DEFAULT_IO_TIMEOUT	(msecs_to_jiffies(20))
> +
>  /* maximum retry quota flush count */
>  #define DEFAULT_RETRY_QUOTA_FLUSH_COUNT		8
>  
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 897de003e423..3db11d5a50d5 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -974,7 +974,8 @@ static int move_data_page(struct inode *inode, block_t bidx, int gc_type,
>  		if (err) {
>  			clear_cold_data(page);
>  			if (err == -ENOMEM) {
> -				congestion_wait(BLK_RW_ASYNC, HZ/50);
> +				congestion_wait(BLK_RW_ASYNC,
> +						DEFAULT_IO_TIMEOUT);
>  				goto retry;
>  			}
>  			if (is_dirty)
> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> index 78c3f1d70f1d..156cc5ef3044 100644
> --- a/fs/f2fs/inode.c
> +++ b/fs/f2fs/inode.c
> @@ -518,7 +518,7 @@ struct inode *f2fs_iget_retry(struct super_block *sb, unsigned long ino)
>  	inode = f2fs_iget(sb, ino);
>  	if (IS_ERR(inode)) {
>  		if (PTR_ERR(inode) == -ENOMEM) {
> -			congestion_wait(BLK_RW_ASYNC, HZ/50);
> +			congestion_wait(BLK_RW_ASYNC, DEFAULT_IO_TIMEOUT);
>  			goto retry;
>  		}
>  	}
> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> index 9824f055a5bc..d5edbe2ce4a1 100644
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -2602,7 +2602,7 @@ int f2fs_recover_inode_page(struct f2fs_sb_info *sbi, struct page *page)
>  retry:
>  	ipage = f2fs_grab_cache_page(NODE_MAPPING(sbi), ino, false);
>  	if (!ipage) {
> -		congestion_wait(BLK_RW_ASYNC, HZ/50);
> +		congestion_wait(BLK_RW_ASYNC, DEFAULT_IO_TIMEOUT);
>  		goto retry;
>  	}
>  
> diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
> index 348e8d463b3e..dd804c07eeb0 100644
> --- a/fs/f2fs/recovery.c
> +++ b/fs/f2fs/recovery.c
> @@ -534,7 +534,7 @@ static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
>  	err = f2fs_get_dnode_of_data(&dn, start, ALLOC_NODE);
>  	if (err) {
>  		if (err == -ENOMEM) {
> -			congestion_wait(BLK_RW_ASYNC, HZ/50);
> +			congestion_wait(BLK_RW_ASYNC, DEFAULT_IO_TIMEOUT);
>  			goto retry_dn;
>  		}
>  		goto out;
> @@ -617,7 +617,8 @@ static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
>  			err = check_index_in_prev_nodes(sbi, dest, &dn);
>  			if (err) {
>  				if (err == -ENOMEM) {
> -					congestion_wait(BLK_RW_ASYNC, HZ/50);
> +					congestion_wait(BLK_RW_ASYNC,
> +							DEFAULT_IO_TIMEOUT);
>  					goto retry_prev;
>  				}
>  				goto err;
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index c3252603ff79..1628bc8327f1 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -245,7 +245,8 @@ static int __revoke_inmem_pages(struct inode *inode,
>  								LOOKUP_NODE);
>  			if (err) {
>  				if (err == -ENOMEM) {
> -					congestion_wait(BLK_RW_ASYNC, HZ/50);
> +					congestion_wait(BLK_RW_ASYNC,
> +							DEFAULT_IO_TIMEOUT);
>  					cond_resched();
>  					goto retry;
>  				}
> @@ -312,7 +313,7 @@ void f2fs_drop_inmem_pages_all(struct f2fs_sb_info *sbi, bool gc_failure)
>  skip:
>  		iput(inode);
>  	}
> -	congestion_wait(BLK_RW_ASYNC, HZ/50);
> +	congestion_wait(BLK_RW_ASYNC, DEFAULT_IO_TIMEOUT);
>  	cond_resched();
>  	if (gc_failure) {
>  		if (++looped >= count)
> @@ -415,7 +416,8 @@ static int __f2fs_commit_inmem_pages(struct inode *inode)
>  			err = f2fs_do_write_data_page(&fio);
>  			if (err) {
>  				if (err == -ENOMEM) {
> -					congestion_wait(BLK_RW_ASYNC, HZ/50);
> +					congestion_wait(BLK_RW_ASYNC,
> +							DEFAULT_IO_TIMEOUT);
>  					cond_resched();
>  					goto retry;
>  				}
> @@ -2801,7 +2803,7 @@ static unsigned int __issue_discard_cmd_range(struct f2fs_sb_info *sbi,
>  			blk_finish_plug(&plug);
>  			mutex_unlock(&dcc->cmd_lock);
>  			trimmed += __wait_all_discard_cmd(sbi, NULL);
> -			congestion_wait(BLK_RW_ASYNC, HZ/50);
> +			congestion_wait(BLK_RW_ASYNC, DEFAULT_IO_TIMEOUT);
>  			goto next;
>  		}
>  skip:
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 1456979222cf..dcfa5836767c 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -1884,7 +1884,8 @@ static ssize_t f2fs_quota_read(struct super_block *sb, int type, char *data,
>  		page = read_cache_page_gfp(mapping, blkidx, GFP_NOFS);
>  		if (IS_ERR(page)) {
>  			if (PTR_ERR(page) == -ENOMEM) {
> -				congestion_wait(BLK_RW_ASYNC, HZ/50);
> +				congestion_wait(BLK_RW_ASYNC,
> +						DEFAULT_IO_TIMEOUT);
>  				goto repeat;
>  			}
>  			set_sbi_flag(F2FS_SB(sb), SBI_QUOTA_NEED_REPAIR);
> @@ -1938,7 +1939,8 @@ static ssize_t f2fs_quota_write(struct super_block *sb, int type,
>  							&page, NULL);
>  		if (unlikely(err)) {
>  			if (err == -ENOMEM) {
> -				congestion_wait(BLK_RW_ASYNC, HZ/50);
> +				congestion_wait(BLK_RW_ASYNC,
> +						DEFAULT_IO_TIMEOUT);
>  				goto retry;
>  			}
>  			set_sbi_flag(F2FS_SB(sb), SBI_QUOTA_NEED_REPAIR);
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
