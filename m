Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0313F1802EE
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Mar 2020 17:15:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jBhXZ-0005cK-62; Tue, 10 Mar 2020 16:15:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jBhXY-0005cC-6Y
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 10 Mar 2020 16:15:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zpaZhoMUunj88BHY3NfG0x16W3xhAElcZ9TFvoVj6Ns=; b=E6zQs3YJwgj5SkIffCVnE5UUuH
 7lrzQ270oQa/Jfjy5XgEmBZbKD+IhlOnIIjkf11DMKbpdSCHp9cz+zHVSITKJE1ol4d3LCjAfXdHU
 BSlZdFdHL5XDUOux8oPdVSgf08cgOVot+/wTMd1yzw8B6Kur//U8ZlIoBxxbkAXx+EjM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zpaZhoMUunj88BHY3NfG0x16W3xhAElcZ9TFvoVj6Ns=; b=ifcpGGeLRIxx8jc8ZXhH+I9kEb
 aXtFFGS70Kx21f8evAXEXRODZk9XHRMY+lUFSJ5g9K37Yr1ImW0sULB0sUATDDqnLyg0e3MdLlM2h
 4MvE91DCxDgnYALKeTxurNNHRrmRAhCWz/M0GM/HwWMIUMb4gN1ISZUeW3fodQ9nrOWk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jBhXT-007lwf-KT
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 10 Mar 2020 16:15:32 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E0C6A20873;
 Tue, 10 Mar 2020 16:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583856917;
 bh=5B7f7iMicXNmubmqlX5vKEndbJydDCOLljZZexLnsC0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HGGaSYt+LLXeCifV5rE2zEG9j8k3JLp9ZtvnClVAmGdIMNY+uF+1Ifdv7nRqqH58s
 9gv6S4+LS7+4lSysbdYlMsAIS1YZpcZQSzK4wGkvs1/uq8ne7MlxnIceSlPfNiMWRW
 q4hEF4zU4b5Nm0A7+lRgncmeIuVCCSOzFD8hy7Xs=
Date: Tue, 10 Mar 2020 09:15:15 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200310161515.GA1067@sol.localdomain>
References: <20200310125009.12966-1-yuchao0@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200310125009.12966-1-yuchao0@huawei.com>
X-Spam-Score: -0.1 (/)
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1jBhXT-007lwf-KT
Subject: Re: [f2fs-dev] [PATCH 1/5] f2fs: change default compression
 algorithm
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Mar 10, 2020 at 08:50:05PM +0800, Chao Yu wrote:
> Use LZ4 as default compression algorithm, as compared to LZO, it shows
> almost the same compression ratio and much better decompression speed.
> 
> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> ---
>  fs/f2fs/super.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index db3a63f7c769..ebffe7aa08ee 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -1577,7 +1577,7 @@ static void default_options(struct f2fs_sb_info *sbi)
>  	F2FS_OPTION(sbi).test_dummy_encryption = false;
>  	F2FS_OPTION(sbi).s_resuid = make_kuid(&init_user_ns, F2FS_DEF_RESUID);
>  	F2FS_OPTION(sbi).s_resgid = make_kgid(&init_user_ns, F2FS_DEF_RESGID);
> -	F2FS_OPTION(sbi).compress_algorithm = COMPRESS_LZO;
> +	F2FS_OPTION(sbi).compress_algorithm = COMPRESS_LZ4;
>  	F2FS_OPTION(sbi).compress_log_size = MIN_COMPRESS_LOG_SIZE;
>  	F2FS_OPTION(sbi).compress_ext_cnt = 0;
>  	F2FS_OPTION(sbi).bggc_mode = BGGC_MODE_ON;

This makes sense, but it's unclear to me why comparing the different compression
algorithms is happening just now, after support for both LZO and LZ4 was already
merged into mainline and now has to be supported forever.  During review months
ago, multiple people suggested that LZ4 is better than LZO, so there's not much
reason to support LZO at all.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
