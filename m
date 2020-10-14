Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CABE28D9ED
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Oct 2020 08:22:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kSaAh-0001Se-LY; Wed, 14 Oct 2020 06:21:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kSaAf-0001SV-9o
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 14 Oct 2020 06:21:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FhAlkLrvuQXobxdRkMjlE8LxVwyu5S4n1hBzV5CGjpo=; b=UFf4QCmp0XYXHikpMP63WmFpM1
 I/vQTa3ICMQd5uvZE/AOAooIP5PymOk0xcwoE3/5+mx128q4CEzmfWNjGzyw1a1MuWtljwZCek0Se
 Ozh4ofnugyglYN+ZT/fNSA8tDSud+CQH0V4hBpXh+mvoYkZsCEluMmp8oXkixgZHPpBM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FhAlkLrvuQXobxdRkMjlE8LxVwyu5S4n1hBzV5CGjpo=; b=EZzPID4EthTwi1Yi+zjwN3LWVB
 jJhB9Jf0FzH1V1QCkNaHjUss6+U6T23/91KIEHRV6ZpGnpP2MEFufo/thj/naDOod8P8A4dvp9/LA
 ZbrHVf5jOA0EVHypL7WDJPExlayObqG1haWwgNjYBqWC+f/74GIryF3e4o3k2ayhS6Y8=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kSaAQ-009cpH-Dg
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 14 Oct 2020 06:21:56 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id AAFC89273CDCF63776A9;
 Wed, 14 Oct 2020 14:21:26 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.211) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 14 Oct
 2020 14:21:25 +0800
To: <jaegeuk@kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>, <kernel-team@android.com>
References: <20201002213226.2862930-1-jaegeuk@kernel.org>
 <20201009043135.GA1973455@google.com> <20201013030725.GA3337731@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <b5787b57-6193-c8a7-fde1-ffed9acfdcad@huawei.com>
Date: Wed, 14 Oct 2020 14:21:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20201013030725.GA3337731@google.com>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: appspotmail.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kSaAQ-009cpH-Dg
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: handle errors of
 f2fs_get_meta_page_nofail be failed
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/10/13 11:07, jaegeuk@kernel.org wrote:
> First problem is we hit BUG_ON() in f2fs_get_sum_page given EIO on
> f2fs_get_meta_page_nofail().
> 
> Quick fix was not to give any error with infinite loop, but syzbot caught
> a case where it goes to that loop from fuzzed image. In turned out we abused
> f2fs_get_meta_page_nofail() like in the below call stack.
> 
> - f2fs_fill_super
>   - f2fs_build_segment_manager
>    - build_sit_entries
>     - get_current_sit_page
> 
> INFO: task syz-executor178:6870 can't die for more than 143 seconds.
> task:syz-executor178 state:R
>   stack:26960 pid: 6870 ppid:  6869 flags:0x00004006
> Call Trace:
> 
> Showing all locks held in the system:
> 1 lock held by khungtaskd/1179:
>   #0: ffffffff8a554da0 (rcu_read_lock){....}-{1:2}, at: debug_show_all_locks+0x53/0x260 kernel/locking/lockdep.c:6242
> 1 lock held by systemd-journal/3920:
> 1 lock held by in:imklog/6769:
>   #0: ffff88809eebc130 (&f->f_pos_lock){+.+.}-{3:3}, at: __fdget_pos+0xe9/0x100 fs/file.c:930
> 1 lock held by syz-executor178/6870:
>   #0: ffff8880925120e0 (&type->s_umount_key#47/1){+.+.}-{3:3}, at: alloc_super+0x201/0xaf0 fs/super.c:229
> 
> Actually, we didn't have to use _nofail in this case, since we could return
> error to mount(2) already with the error handler.
> 
> As a result, this patch tries to 1) remove _nofail callers as much as possible,
> 2) deal with error case in last remaining caller, f2fs_get_sum_page().
> 
> Reported-by: syzbot+ee250ac8137be41d7b13@syzkaller.appspotmail.com
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

I prefer to use f2fs_get_meta_page() as much as possible except change_curseg()
path, however, it's minor, and the time is closing to merge window, so:

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,

> ---
> 
> Change log from v2:
>   - avoid _nofail and add error handler
> 
>   fs/f2fs/checkpoint.c |  2 +-
>   fs/f2fs/f2fs.h       |  2 +-
>   fs/f2fs/node.c       |  2 +-
>   fs/f2fs/segment.c    | 12 +++++++++---
>   4 files changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> index f18386d30f031..023462e80e58d 100644
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@ -107,7 +107,7 @@ struct page *f2fs_get_meta_page(struct f2fs_sb_info *sbi, pgoff_t index)
>   	return __get_meta_page(sbi, index, true);
>   }
>   
> -struct page *f2fs_get_meta_page_nofail(struct f2fs_sb_info *sbi, pgoff_t index)
> +struct page *f2fs_get_meta_page_retry(struct f2fs_sb_info *sbi, pgoff_t index)
>   {
>   	struct page *page;
>   	int count = 0;
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index ae46d44bd5211..adda53d20a399 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -3422,7 +3422,7 @@ unsigned int f2fs_usable_blks_in_seg(struct f2fs_sb_info *sbi,
>   void f2fs_stop_checkpoint(struct f2fs_sb_info *sbi, bool end_io);
>   struct page *f2fs_grab_meta_page(struct f2fs_sb_info *sbi, pgoff_t index);
>   struct page *f2fs_get_meta_page(struct f2fs_sb_info *sbi, pgoff_t index);
> -struct page *f2fs_get_meta_page_nofail(struct f2fs_sb_info *sbi, pgoff_t index);
> +struct page *f2fs_get_meta_page_retry(struct f2fs_sb_info *sbi, pgoff_t index);
>   struct page *f2fs_get_tmp_page(struct f2fs_sb_info *sbi, pgoff_t index);
>   bool f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
>   					block_t blkaddr, int type);
> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> index 93fb34d636eb5..d5d8ce077f295 100644
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -109,7 +109,7 @@ static void clear_node_page_dirty(struct page *page)
>   
>   static struct page *get_current_nat_page(struct f2fs_sb_info *sbi, nid_t nid)
>   {
> -	return f2fs_get_meta_page_nofail(sbi, current_nat_addr(sbi, nid));
> +	return f2fs_get_meta_page(sbi, current_nat_addr(sbi, nid));
>   }
>   
>   static struct page *get_next_nat_page(struct f2fs_sb_info *sbi, nid_t nid)
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 13ecd2c2c361b..05ab5ae2b5f7f 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -2379,7 +2379,9 @@ int f2fs_npages_for_summary_flush(struct f2fs_sb_info *sbi, bool for_ra)
>    */
>   struct page *f2fs_get_sum_page(struct f2fs_sb_info *sbi, unsigned int segno)
>   {
> -	return f2fs_get_meta_page_nofail(sbi, GET_SUM_BLOCK(sbi, segno));
> +	if (unlikely(f2fs_cp_error(sbi)))
> +		return ERR_PTR(-EIO);
> +	return f2fs_get_meta_page_retry(sbi, GET_SUM_BLOCK(sbi, segno));
>   }
>   
>   void f2fs_update_meta_page(struct f2fs_sb_info *sbi,
> @@ -2669,7 +2671,11 @@ static void change_curseg(struct f2fs_sb_info *sbi, int type, bool flush)
>   	__next_free_blkoff(sbi, curseg, 0);
>   
>   	sum_page = f2fs_get_sum_page(sbi, new_segno);
> -	f2fs_bug_on(sbi, IS_ERR(sum_page));
> +	if (IS_ERR(sum_page)) {
> +		/* GC won't be able to use stale summary pages by cp_error */
> +		memset(curseg->sum_blk, 0, SUM_ENTRY_SIZE);
> +		return;
> +	}
>   	sum_node = (struct f2fs_summary_block *)page_address(sum_page);
>   	memcpy(curseg->sum_blk, sum_node, SUM_ENTRY_SIZE);
>   	f2fs_put_page(sum_page, 1);
> @@ -3964,7 +3970,7 @@ int f2fs_lookup_journal_in_cursum(struct f2fs_journal *journal, int type,
>   static struct page *get_current_sit_page(struct f2fs_sb_info *sbi,
>   					unsigned int segno)
>   {
> -	return f2fs_get_meta_page_nofail(sbi, current_sit_addr(sbi, segno));
> +	return f2fs_get_meta_page(sbi, current_sit_addr(sbi, segno));
>   }
>   
>   static struct page *get_next_sit_page(struct f2fs_sb_info *sbi,
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
