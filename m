Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5573CF133
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Jul 2021 03:16:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m5eMi-0006cc-I9; Tue, 20 Jul 2021 01:16:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <jaegeuk@kernel.org>) id 1m5eMg-0006cV-Ko
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 20 Jul 2021 01:16:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DHDppo/m4sluooc+1PmmVJhyi97SqyzgV6Z/X3bc1eE=; b=W1t9oR1wqKN9irK8J3EXTrMDWa
 s3w+X/S+Wsva1fO4dqxqQ5pdOOy4KIhfOAgqcfkXU1Tb1oMX4ZO+7tG1FgtjtiLiRsuctt5R7dn7P
 /U3ajKMkeKfM5dbYytwlyXwWYYgjsEUDjbyOWyqgiXUVy5tTYMOkMb+EaLQ7kUjrlwZE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DHDppo/m4sluooc+1PmmVJhyi97SqyzgV6Z/X3bc1eE=; b=aYf9ZwQKy2GFNQdjuGZ9bGiHs5
 KuyRKUDXUoyqhaJdP2p9OyQLQTyVGvdxbqt04eBIbNPVev3b9Xk6UNqCRJmzOzo55q3l4I8nZYF3/
 qLAcGqAan3I2L1ecHwu8Wdgpq4Q4JaCFztJ/KJWABJn7meLxRa7tHgOP1gKupAj+8WNs=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m5eMf-00E81a-Ef
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 20 Jul 2021 01:16:06 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3809760C3D;
 Tue, 20 Jul 2021 01:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626743758;
 bh=N/z62KgUlt70d52qf0rQy17/x6qmmv7qYd3KMzJ6Nxg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZETCTxX3OAOwFWGQcAzjbIPD/I1COv1rC7ci3sYpkEutIAjvPhjnXpZDg2g7o29Bt
 Vt6B8webbLluQGNANjX8IIGFxzupJzKSPCEN3z8dIdGga4f3YW2hqfrSNQiGjPhHmo
 LplsivAg9j9p95fPsnRu1DmuT+lm8o9XFKKnAXIoPb79Oaj+UjsK1CX58F71rrejZf
 Px3xJGnNpDGoSaId7+kEI364GMbEn7SpW3YSUV4a+/buy5onnZss84riksSR33t1SW
 YTEQz0IBDmW734BTktjPW6KThIJhvT0d9xVGPWLz4Dp3jb0f8kw65Z9LLrVTAXM9l+
 9Hpg4MW98X0Jg==
Date: Mon, 19 Jul 2021 18:15:56 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <YPYjzAVq04LfUO2Y@google.com>
References: <20210720010329.3975-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210720010329.3975-1-chao@kernel.org>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1m5eMf-00E81a-Ef
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: fix to force keeping write barrier
 for strict fsync mode
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
Cc: Chao Yu <chao.yu@linux.dev>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Wasn't it supposed to be v1?

On 07/20, Chao Yu wrote:
> [1] https://www.mail-archive.com/linux-f2fs-devel@lists.sourceforge.net/msg15126.html
> 
> As [1] reported, if lower device doesn't support write barrier, in below
> case:
> 
> - write page #0; persist
> - overwrite page #0
> - fsync
>  - write data page #0 OPU into device's cache
>  - write inode page into device's cache
>  - issue flush
> 
> If SPO is triggered during flush command, inode page can be persisted
> before data page #0, so that after recovery, inode page can be recovered
> with new physical block address of data page #0, however there may
> contains dummy data in new physical block address.
> 
> Then what user will see is: after overwrite & fsync + SPO, old data in
> file was corrupted, if any user do care about such case, we can suggest
> user to use STRICT fsync mode, in this mode, we will force to use atomic
> write sematics to keep write order in between data/node and last node,
> so that it avoids potential data corruption during fsync().
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/file.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 6afd4562335f..00b45876eaa1 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -301,6 +301,18 @@ static int f2fs_do_sync_file(struct file *file, loff_t start, loff_t end,
>  				f2fs_exist_written_data(sbi, ino, UPDATE_INO))
>  			goto flush_out;
>  		goto out;
> +	} else {
> +		/*
> +		 * for OPU case, during fsync(), node can be persisted before
> +		 * data when lower device doesn't support write barrier, result
> +		 * in data corruption after SPO.
> +		 * So for strict fsync mode, force to use atomic write sematics
> +		 * to keep write order in between data/node and last node to
> +		 * avoid potential data corruption.
> +		 */
> +		if (F2FS_OPTION(sbi).fsync_mode ==
> +				FSYNC_MODE_STRICT && !atomic)
> +			atomic = true;
>  	}
>  go_write:
>  	/*
> -- 
> 2.22.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
