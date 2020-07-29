Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A84DC231EB9
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 Jul 2020 14:42:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k0lQ3-00053x-4K; Wed, 29 Jul 2020 12:42:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1k0lQ2-00053j-80
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 29 Jul 2020 12:42:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:Cc:References:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wW1jC8hGuaTyKQN+P0l+pQbgm9XBFi+QHPJPhflJGo4=; b=J0M4RLb0+9+ZUGSWZBiL/Jd+SD
 XTZV9Sv0otngFTw907PGomFnTzWSQIPdxlj5J8ntPeYiilQ7FBTi6l1u097fr7amJxkyfJYpfbmU3
 LXSQpLVw69+lQPQdNwylYUTF5qfmsn9jwrZ5Q6h6Mk5xTY7J+d0e+YXxMYhjq00EVySI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:Cc:References:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wW1jC8hGuaTyKQN+P0l+pQbgm9XBFi+QHPJPhflJGo4=; b=jh8IXlC2isb7L4S8jskEWBbsEk
 en8rkwelyg/kkbcPk9yOzyRVaPi1V4iE1Ls/I3tVcfo4sHTlryMsuxoeg37SkroAtaJXk4pksh9GV
 1LZfFAgImeYGghhjKennPmgNuEJ7CAmzWFmH8kDa0MkA9TMhrqGjzoWj37uxQIXlVOZ4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1k0lQ0-003DA1-Ta
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 29 Jul 2020 12:42:50 +0000
Received: from [192.168.0.108] (unknown [49.65.247.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4D2142083B;
 Wed, 29 Jul 2020 12:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596026551;
 bh=mlZ/EsaMb/ND17rYj369D7zDyCStn7kc/8QnXsr1+ks=;
 h=Subject:To:References:Cc:From:Date:In-Reply-To:From;
 b=si9k9B1A5fSTY0airfSOHiXA74mNbarCYSzoFBGKhbT3Zt1iYPV0PvKsIYd6nfZja
 xxoDG+wWK/5289wsgOpBuhPGjKRMeLE95J80+c0eZnBZiRBLB1KqwawcAV+sLtRxb0
 9gNR61RG39J1bpB63DDA7lPsipwIkQX7qEGXXoAw=
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20200729070244.584518-1-jaegeuk@kernel.org>
From: Chao Yu <chao@kernel.org>
Message-ID: <054f161c-05db-73b7-3d83-be7addcd6015@kernel.org>
Date: Wed, 29 Jul 2020 20:42:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20200729070244.584518-1-jaegeuk@kernel.org>
X-Spam-Score: -1.4 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.8 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1k0lQ0-003DA1-Ta
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix deadlock between quota writes and
 checkpoint
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020-7-29 15:02, Jaegeuk Kim wrote:
> f2fs_write_data_pages(quota_mapping)
>  __f2fs_write_data_pages             f2fs_write_checkpoint
>   * blk_start_plug(&plug);
>   * add bio in write_io[DATA]
>                                       - block_operations
>                                       - skip syncing quota by
>                                                 >DEFAULT_RETRY_QUOTA_FLUSH_COUNT
>                                       - down_write(&sbi->node_write);
>   - f2fs_write_single_data_page

After commit 79963d967b49 ("f2fs: shrink node_write lock coverage"),
node_write lock was moved to f2fs_write_single_data_page() and
f2fs_write_compressed_pages().

So it needs to update the callstack.

- down_write(node_write)

Otherwise it looks good to me.

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,

>     - f2fs_do_write_data_page
>       - f2fs_outplace_write_data
>         - do_write_page
>            - f2fs_allocate_data_block
>             - down_write(node_write)
>                                       - f2fs_wait_on_all_pages(F2FS_WB_CP_DATA);
>
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  fs/f2fs/checkpoint.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> index 8c782d3f324f0..99c8061da55b9 100644
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@ -1269,6 +1269,8 @@ void f2fs_wait_on_all_pages(struct f2fs_sb_info *sbi, int type)
>  		if (type == F2FS_DIRTY_META)
>  			f2fs_sync_meta_pages(sbi, META, LONG_MAX,
>  							FS_CP_META_IO);
> +		else if (type == F2FS_WB_CP_DATA)
> +			f2fs_submit_merged_write(sbi, DATA);
>  		io_schedule_timeout(DEFAULT_IO_TIMEOUT);
>  	}
>  	finish_wait(&sbi->cp_wait, &wait);
>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
