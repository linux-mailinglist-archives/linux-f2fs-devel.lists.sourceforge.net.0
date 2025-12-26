Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 22940CDE422
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Dec 2025 03:58:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yuhDtJisa9AMClJUA1T4kIrbt17lwjNvYMyUwTWbgZ0=; b=WIYay812IgqiltRfrpg9x7WJhQ
	rSGxPRpaDLBgAuAkxI8fyQl3RgEMkSOO0sgMdG223BU9nT6KwIBsJBgOzKPvAFAf5sKuPOhkBvkH2
	TJfblwGnv3LzIh7234LW+ytsy7PKJJxuEMECbd/rFlnesMQ4GSAQGO4FbZLoN/3PlD50=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vYy2C-0007C6-Tk;
	Fri, 26 Dec 2025 02:58:32 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vYy2B-0007C0-SX
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Dec 2025 02:58:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IOaTbklygqR/jxjkDSPIcWebKvwHRGtGJBgi54AVO3A=; b=FI/TpRbsHyJ1B2fjDmLmyaWlLe
 vPb90UMc/7Tf1GT5xyMswNI2A0Fk0LTDuzsORaWuvrOFGcfKR59+g3xoXhTZGjMKl667scmEWhoro
 4fLIS2Ugbd8ciJDDN5kbbRQVSUGKWcENcxAdPUsRuqhkqIspxVLC6yGAqwzeUU4iMN9k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IOaTbklygqR/jxjkDSPIcWebKvwHRGtGJBgi54AVO3A=; b=hstIZyN7XIgiv7JqMrFh1ErvY2
 raHHO94I3vlo7nYlF5zTLrOF0FX0mrsuGEgAz8wkACsErLEtM6Rm59MmwGH0XXPrRGGxmxUwxQLTL
 39gsYLX6uux3H058FEcZCEvfn/BdwOUm6Ajy3n7zlISNcuoBie5C8yCT61FU+vJm4be0=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vYy2A-0000iF-KA for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Dec 2025 02:58:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D181143F66;
 Fri, 26 Dec 2025 02:58:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B40FC4CEF1;
 Fri, 26 Dec 2025 02:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766717899;
 bh=YoOPTP2+VJOFRi12WUyWoBQXyY8PiWl4NSEHhwN4mvE=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=j3KD55IRa/5O6qwzJX41kklpZhthFso7nSwhoM8Va2P5c6vz/hGp1IAidrGSoW6lI
 PdoBNZ56Ypb5SPybuc5lgviluFcZe3ufWk2Y40v+WUqy/2UENSsHuadJP+2la6gUUp
 gBJVqj1vOGTdj4j3YEGpCEcqRoSowQeaojYwsXy8h1hht7NhvX35wRw8ahHf7Q7/cQ
 qvqO7+CA0xVj4jdgw1XL69MvKXd58XyE3QODAHgFmbo3nUwqdZrE6nIZTsiQX8VqVV
 ks7DSg3aItWslW9U2z1fGgSoFgrjC+CD55NPHTr+s8uKZwA318BQfuZBgPezy4Mgn+
 fgKO6dyYS6eww==
Message-ID: <83a7a539-e7b5-4ff5-b3d9-c1e9320bf090@kernel.org>
Date: Fri, 26 Dec 2025 10:58:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Szymon Wilczek <swilczek.lx@gmail.com>, jaegeuk@kernel.org
References: <20251223162823.23606-1-swilczek.lx@gmail.com>
Content-Language: en-US
In-Reply-To: <20251223162823.23606-1-swilczek.lx@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/24/2025 12:28 AM,
 Szymon Wilczek wrote: > Syzbot reported
 a slab-use-after-free issue in f2fs_write_end_io(): > [ 86.643336] BUG: KASAN:
 slab-use-after-free in f2fs_write_end_io+0x9b9/0xb60 > [ [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vYy2A-0000iF-KA
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix use-after-free in f2fs_write_end_io
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

On 12/24/2025 12:28 AM, Szymon Wilczek wrote:
> Syzbot reported a slab-use-after-free issue in f2fs_write_end_io():
> [   86.643336] BUG: KASAN: slab-use-after-free in f2fs_write_end_io+0x9b9/0xb60
> [   86.644120] Read of size 4 at addr ffff88804357d170 by task kworker/u4:4/45
> ...
> [   86.656543] Call Trace:
> ...
> [   86.660351]  f2fs_write_end_io+0x9b9/0xb60
> ...
> [   86.685123] Allocated by task 5484:
> ...
> [   86.688325]  f2fs_fill_super+0x8c/0x6ec0
> ...
> [   86.697685] Freed by task 5484:
> ...
> [   86.702700]  kfree+0x1c0/0x660
> [   86.703273]  kill_f2fs_super+0x5b6/0x6c0
> 
> The problem is a race condition between the shutdown of the filesystem
> (kill_f2fs_super) and the asynchronous I/O completion handler
> (f2fs_write_end_io).
> 
> When unmounting, kill_f2fs_super() frees the sbi structure. However,
> if there are pending checkpoint data (CP_DATA) writes, the
> f2fs_write_end_io() callback might still be running.
> 
> In the original code, f2fs_write_end_io() accesses sbi->cp_wait after
> decrementing the page count. If the page count drops to zero,
> f2fs_wait_on_all_pages() in the unmount path returns, allowing
> kill_f2fs_super() to free sbi. If the callback then tries to wake up
> waiters on sbi->cp_wait, a UAF occurs.
> 
> To fix this, I applied a two-step solution:
> 
> 1. In kill_f2fs_super(), explicitly wait for all CP_DATA pages
>     to obtain a count of zero using f2fs_wait_on_all_pages(). This
>     ensures specific synchronization for these metadata writes.
> 
> 2. In f2fs_write_end_io(), move the wake_up() call INSIDE the
>     bio_for_each_folio_all() loop. This ensures that the wakeup
>     (which signals completion to the waiter) happens before
>     processing of the bio is effectively 'done' from the perspective
>     of the waiter. More importantly, it removes any access to 'sbi'
>     after the loop, eliminating the UAF window.
> 
> Reported-by: syzbot+b4444e3c972a7a124187@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=b4444e3c972a7a124187
> Signed-off-by: Szymon Wilczek <swilczek.lx@gmail.com>
> ---
>   fs/f2fs/data.c  | 11 ++++++++---
>   fs/f2fs/super.c |  1 +
>   2 files changed, 9 insertions(+), 3 deletions(-)
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

Seems this check may race w/ set_sbi_flag(sbi, SBI_IS_CLOSE).

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

If F2FS_WB_CP_DATA count is zero, then sbi may be released in kill_f2fs_super(),
we should not allow to access sbi->cp_wait below, right?

Thanks,

>   				wq_has_sleeper(&sbi->cp_wait))
> -		wake_up(&sbi->cp_wait);
> +			wake_up(&sbi->cp_wait);
> +	}
>   
>   	bio_put(bio);
>   }
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index c4c225e09dc4..c9ee3fae1958 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -5454,6 +5454,7 @@ static void kill_f2fs_super(struct super_block *sb)
>   	kill_block_super(sb);
>   	/* Release block devices last, after fscrypt_destroy_keyring(). */
>   	if (sbi) {
> +		f2fs_wait_on_all_pages(sbi, F2FS_WB_CP_DATA);
>   		destroy_device_list(sbi);
>   		kfree(sbi);
>   		sb->s_fs_info = NULL;



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
