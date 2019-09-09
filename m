Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 068E7AD217
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  9 Sep 2019 05:04:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i79yM-0004v2-Jq; Mon, 09 Sep 2019 03:04:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1i79yK-0004ul-SA
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Sep 2019 03:04:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7HRrmjgqO95tsmURj/9Gf/7JHcb/0f2aVozAMLRKPSI=; b=HFV1IyHqlZuE+mzD4bAFTqbdVl
 X1swZjCVhovCE6P5Sgzlelxmmgqb33N/4gZGCsZiz8eyl+pGIS3EMHpHzh87xucQ60yLwr0KLhuxE
 4s7ywO5GKwK4lTbpWbg+7iHcwz9kVL05cOhdXLO512WJmTprX33m58eivWu0b3BQaMGA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7HRrmjgqO95tsmURj/9Gf/7JHcb/0f2aVozAMLRKPSI=; b=NskB2en8yzHv7z8ZON7inDwjk3
 Y9lAcb9WZatD/zpqOp6WQ+b6gRdpPL2inqId/c1MrSI1kkrrUDoLeOBDxOuvXYRNjqZSyS9UCXKxq
 b8owatJxNtqSvNn/ALd4b6hcylx92keVAdzUWlAGTtgZrMtP2QjPupg+SH7Xhx72hAkc=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i79yH-00Ee7B-60
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Sep 2019 03:04:08 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 028B022A813B78DC2CC7;
 Mon,  9 Sep 2019 11:03:58 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.207) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 9 Sep 2019
 11:03:54 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <20190909012532.20454-1-jaegeuk@kernel.org>
 <20190909012532.20454-2-jaegeuk@kernel.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <f446ff29-38a5-61fd-4056-b4067b01c630@huawei.com>
Date: Mon, 9 Sep 2019 11:03:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190909012532.20454-2-jaegeuk@kernel.org>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1i79yH-00Ee7B-60
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: avoid infinite GC loop due to
 stale atomic files
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/9/9 9:25, Jaegeuk Kim wrote:
> If committing atomic pages is failed when doing f2fs_do_sync_file(), we can
> get commited pages but atomic_file being still set like:
> 
> - inmem:    0, atomic IO:    4 (Max.   10), volatile IO:    0 (Max.    0)
> 
> If GC selects this block, we can get an infinite loop like this:
> 
> f2fs_submit_page_bio: dev = (253,7), ino = 2, page_index = 0x2359a8, oldaddr = 0x2359a8, newaddr = 0x2359a8, rw = READ(), type = COLD_DATA
> f2fs_submit_read_bio: dev = (253,7)/(253,7), rw = READ(), DATA, sector = 18533696, size = 4096
> f2fs_get_victim: dev = (253,7), type = No TYPE, policy = (Foreground GC, LFS-mode, Greedy), victim = 4355, cost = 1, ofs_unit = 1, pre_victim_secno = 4355, prefree = 0, free = 234
> f2fs_iget: dev = (253,7), ino = 6247, pino = 5845, i_mode = 0x81b0, i_size = 319488, i_nlink = 1, i_blocks = 624, i_advise = 0x2c
> f2fs_submit_page_bio: dev = (253,7), ino = 2, page_index = 0x2359a8, oldaddr = 0x2359a8, newaddr = 0x2359a8, rw = READ(), type = COLD_DATA
> f2fs_submit_read_bio: dev = (253,7)/(253,7), rw = READ(), DATA, sector = 18533696, size = 4096
> f2fs_get_victim: dev = (253,7), type = No TYPE, policy = (Foreground GC, LFS-mode, Greedy), victim = 4355, cost = 1, ofs_unit = 1, pre_victim_secno = 4355, prefree = 0, free = 234
> f2fs_iget: dev = (253,7), ino = 6247, pino = 5845, i_mode = 0x81b0, i_size = 319488, i_nlink = 1, i_blocks = 624, i_advise = 0x2c
> 
> In that moment, we can observe:
> 
> [Before]
> Try to move 5084219 blocks (BG: 384508)
>   - data blocks : 4962373 (274483)
>   - node blocks : 121846 (110025)
> Skipped : atomic write 4534686 (10)
> 
> [After]
> Try to move 5088973 blocks (BG: 384508)
>   - data blocks : 4967127 (274483)
>   - node blocks : 121846 (110025)
> Skipped : atomic write 4539440 (10)
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  fs/f2fs/file.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 7ae2f3bd8c2f..68b6da734e5f 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -1997,11 +1997,11 @@ static int f2fs_ioc_commit_atomic_write(struct file *filp)
>  			goto err_out;
>  
>  		ret = f2fs_do_sync_file(filp, 0, LLONG_MAX, 0, true);
> -		if (!ret) {
> -			clear_inode_flag(inode, FI_ATOMIC_FILE);
> -			F2FS_I(inode)->i_gc_failures[GC_FAILURE_ATOMIC] = 0;
> -			stat_dec_atomic_write(inode);
> -		}
> +
> +		/* doesn't need to check error */
> +		clear_inode_flag(inode, FI_ATOMIC_FILE);
> +		F2FS_I(inode)->i_gc_failures[GC_FAILURE_ATOMIC] = 0;
> +		stat_dec_atomic_write(inode);

If there are still valid atomic write pages linked in .inmem_pages, it may cause
memory leak when we just clear FI_ATOMIC_FILE flag.

So my question is why below logic didn't handle such condition well?

f2fs_gc()

	if (has_not_enough_free_secs(sbi, sec_freed, 0)) {
		if (skipped_round <= MAX_SKIP_GC_COUNT ||
					skipped_round * 2 < round) {
			segno = NULL_SEGNO;
			goto gc_more;
		}

		if (first_skipped < last_skipped &&
				(last_skipped - first_skipped) >
						sbi->skipped_gc_rwsem) {
			f2fs_drop_inmem_pages_all(sbi, true);
			segno = NULL_SEGNO;
			goto gc_more;
		}
		if (gc_type == FG_GC && !is_sbi_flag_set(sbi, SBI_CP_DISABLED))
			ret = f2fs_write_checkpoint(sbi, &cpc);
	}

>  	} else {
>  		ret = f2fs_do_sync_file(filp, 0, LLONG_MAX, 1, false);
>  	}
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
