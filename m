Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2765ECDF383
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 27 Dec 2025 02:58:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YuLx2lpaauFApC1aTUTpvcX1y7hjrlFb9KicQAP7R7o=; b=Zo4qq45Z0HYqincy9KmVKsJQcC
	cZx6PMh441lLZaTgILgZuCOza+2AFqe+Khtai71Q/kyvQfgteibL0vd0YznA4LC7SC9jd68tHbd9D
	AK3fvwThAC0v005pr7KD9cww30OJhkrqB/IySqamVaOIvzccwk6FrAVlkS4253Xb8ryY=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vZJZh-0000iU-I4;
	Sat, 27 Dec 2025 01:58:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vZJZg-0000iM-9d
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 Dec 2025 01:58:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2AnjBRjB9TvrU9UtPNz4N0CGJvoBXwnpTQ+ukB+9R+Q=; b=Y3n1Fh75ShrDJmkXs9seyjvXKn
 88I2GyLyuvTEELQW2ZuUPQp57Y10BfFWdnjdrC3hgMqhxwj4KL/VO4eZLvr7NjCDi+qbyZP8tEejz
 H0Y+vkGF0mKRVqRj+y4j8F4AjsXSrngTiXaQr7wBAStnF/sFI1cP6vsgmblmyCCHdlM8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2AnjBRjB9TvrU9UtPNz4N0CGJvoBXwnpTQ+ukB+9R+Q=; b=C4sLQXKXqxjCFVEie/ZpETv05v
 b41mvLX6/yIHlrG4wXbjtGT2Cjv9yOuDBjy2/PM7AfAb5zFq8AxQjoyLw2uVN56dzbIZaQglM6s+8
 Xf9avqbnS7oQl/i9aLK/PtVf4bnJzbhtF8eY63Vh30MOTxFbaJFKfGKqRQbC1qdR1h6g=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vZJZf-000269-G7 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 Dec 2025 01:58:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1EA1643467;
 Sat, 27 Dec 2025 01:58:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EFCAC4CEF7;
 Sat, 27 Dec 2025 01:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766800700;
 bh=wVL1FdYC/q35IrTx4f+vuJb7pYG9XVckj8oj5aa4Z8E=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=um36jg/mbl8xgAHJVgqAo7x2mT2jd9v0VJioD79yOHHAbg34P754RXz+MQ3VK2HbO
 g/BEH3KG9YhBPYOfX4HUJFqu+80PZ4/1HiMjsXAWuclc/N3EtycLhfPPY+yFst7WFY
 ghSY5XSWjV1iVPvovky/OoT0OezmH0QVBH1rI7q836BX5n7ctN97DO9FFm2FZKn9Uw
 km2Ii8VGi+k9QnB8BRCCdTb1u+z3svjqwpst8r1hxFuPF5ebFXAKmGlrAQP0qZAYD7
 mvQP2j+3IihEyDfET1G7Kr/oryyUqUm7uBDw7UnJjEdFUX+LPI8g+RUm0qbCjZ0IKN
 1QZq/dFUfre2A==
Message-ID: <744bc43e-8ef4-440a-9b9e-219620ee6586@kernel.org>
Date: Sat, 27 Dec 2025 09:58:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Szymon Wilczek <swilczek.lx@gmail.com>, jaegeuk@kernel.org
References: <20251223162823.23606-1-swilczek.lx@gmail.com>
 <20251226142024.48837-1-swilczek.lx@gmail.com>
Content-Language: en-US
In-Reply-To: <20251226142024.48837-1-swilczek.lx@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/26/2025 10:20 PM,
 Szymon Wilczek wrote: > Syzbot reported
 a slab-use-after-free issue in f2fs_write_end_io(): > > BUG: KASAN:
 slab-use-after-free
 in f2fs_write_end_io+0x9b9/0xb60 > Read of size [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vZJZf-000269-G7
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix use-after-free in
 f2fs_write_end_io
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: syzbot+b4444e3c972a7a124187@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 12/26/2025 10:20 PM, Szymon Wilczek wrote:
> Syzbot reported a slab-use-after-free issue in f2fs_write_end_io():
> 
> BUG: KASAN: slab-use-after-free in f2fs_write_end_io+0x9b9/0xb60
> Read of size 4 at addr ffff88804357d170 by task kworker/u4:4/45
> 
> The race condition occurs between the filesystem unmount path
> (kill_f2fs_super) and the asynchronous I/O completion handler
> (f2fs_write_end_io).
> 
> When unmounting, kill_f2fs_super() frees the sbi structure. However, if
> there are pending CP_DATA writes, the f2fs_write_end_io() callback might
> still be running in softirq context and attempt to access sbi->cp_wait,
> causing a use-after-free.
> 
> To fix this:
> 
> 1. In f2fs_write_end_io(), check SBI_IS_CLOSE flag early and skip the
>     wake_up() call if the filesystem is shutting down. Move the wake_up
>     inside the loop for correct synchronization.
> 
> 2. In kill_f2fs_super(), after f2fs_wait_on_all_pages() returns (meaning
>     the page count is zero), call synchronize_rcu() before kfree(sbi).
>     Since bio completion callbacks run in softirq context, which is an
>     implicit RCU read-side critical section, synchronize_rcu() ensures
>     all in-flight callbacks have completed before we free sbi.
> 
> The combination of these two changes eliminates the UAF window: the
> is_close check provides fast-path optimization (skip wake_up when no
> one is waiting), while synchronize_rcu() provides the hard guarantee
> that no callback is accessing sbi when we free it.
> 
> Reported-by: syzbot+b4444e3c972a7a124187@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=b4444e3c972a7a124187
> Signed-off-by: Szymon Wilczek <swilczek.lx@gmail.com>
> ---
> v2: Add synchronize_rcu() to wait for softirq bio callbacks to complete,
>      addressing the race condition pointed out by Chao Yu where sbi could
>      be freed while f2fs_write_end_io() was still accessing sbi->cp_wait.
> ---
>   fs/f2fs/data.c  | 11 ++++++++---
>   fs/f2fs/super.c |  2 ++
>   2 files changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index c30e69392a62..5808d73c2598 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -318,10 +318,13 @@ static void f2fs_write_end_io(struct bio *bio)
>   {
>   	struct f2fs_sb_info *sbi;
>   	struct folio_iter fi;
> +	bool is_close;
>   
>   	iostat_update_and_unbind_ctx(bio);
>   	sbi = bio->bi_private;
>   
> +	is_close = is_sbi_flag_set(sbi, SBI_IS_CLOSE);
> +
>   	if (time_to_inject(sbi, FAULT_WRITE_IO))
>   		bio->bi_status = BLK_STS_IOERR;
>   
> @@ -360,10 +363,12 @@ static void f2fs_write_end_io(struct bio *bio)
>   			f2fs_del_fsync_node_entry(sbi, folio);
>   		folio_clear_f2fs_gcing(folio);
>   		folio_end_writeback(folio);
> -	}
> -	if (!get_pages(sbi, F2FS_WB_CP_DATA) &&
> +
> +		if (!is_close && type == F2FS_WB_CP_DATA &&
> +				!get_pages(sbi, F2FS_WB_CP_DATA) &&
>   				wq_has_sleeper(&sbi->cp_wait))
> -		wake_up(&sbi->cp_wait);
> +			wake_up(&sbi->cp_wait);
> +	}

Do we still need above change? due to below change may guarantee sbi
won't be released before soft-irq completion?

Thanks,

>   
>   	bio_put(bio);
>   }
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index c4c225e09dc4..924bc30d08b6 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -5454,6 +5454,8 @@ static void kill_f2fs_super(struct super_block *sb)
>   	kill_block_super(sb);
>   	/* Release block devices last, after fscrypt_destroy_keyring(). */
>   	if (sbi) {
> +		f2fs_wait_on_all_pages(sbi, F2FS_WB_CP_DATA);
> +		synchronize_rcu();
>   		destroy_device_list(sbi);
>   		kfree(sbi);
>   		sb->s_fs_info = NULL;



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
