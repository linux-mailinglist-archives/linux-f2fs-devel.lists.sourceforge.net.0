Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0AE1473A9
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Jan 2020 23:19:13 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iukog-0007fD-L1; Thu, 23 Jan 2020 22:19:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1iukof-0007f5-DP
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 Jan 2020 22:19:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6GCer35gNnEOSbjoRzEgrk7stT4nnLz4VTXwRDCZIm0=; b=L8OM++ZGJNqFMEFWGKXbGUEVvJ
 goOKOjlJffng4uHzF5CjXbJLbNLoZahyfAVU+NB14G7fbm9oKRnkY5qKMQ5bmBdXdQpWD2/PJ1zWM
 XtzdtQtKUixX0vcQa1x8LdZl2KdtnAoyO74WRIwhaKA1OGybv0oz+7sf36Nv91daX+qQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6GCer35gNnEOSbjoRzEgrk7stT4nnLz4VTXwRDCZIm0=; b=hynFSzJdzEj7DTmXASPV16pD6/
 UZeCuGZaU2IgUH7IM7UurMDlUbeAZk8o7beQW4AqIyx0Gxflx6mNt/4HHSsH4lezuXYDA7EmFisAi
 vg4DwrRerQpnRCN1EdZjFGKUtYVEl3Usc5VMcaQmnUR2uBRH0p/MzMgyzzzNDNOdjyZ8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iukoc-002w5Y-H5
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 Jan 2020 22:19:09 +0000
Received: from localhost (unknown [104.132.0.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0552C21734;
 Thu, 23 Jan 2020 22:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579817936;
 bh=1QEQIO8BWAIq1V8e658QCqVX3p3sFtysjrQ4cMkD+No=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mgpDd2lJHJTZW8xM52EL06pd4wP+yn6acWkQWTFTugidxxyxwfqjKHuxvzYw5Jbb3
 woOv9G0EsnPNFw7/tdtd4XYA2EZFAkoQmds+tifpbO26fY2dPu9UzFt3cIGJAMVYav
 3b9rYtyiWBdcw/Z6QIc6j0EW1arOYWgIxl3HtnRg=
Date: Thu, 23 Jan 2020 14:18:55 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200123221855.GA7917@jaegeuk-macbookpro.roam.corp.google.com>
References: <20200120100045.70210-1-yuchao0@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200120100045.70210-1-yuchao0@huawei.com>
User-Agent: Mutt/1.8.2 (2017-04-18)
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
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iukoc-002w5Y-H5
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to force keeping write barrier for
 strict fsync mode
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

On 01/20, Chao Yu wrote:
> If barrier is enabled, for strict fsync mode, we should force to
> use atomic write semantics to avoid data corruption due to no
> barrier support in lower device.
> 
> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> ---
>  fs/f2fs/file.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 86ddbb55d2b1..c9dd45f82fbd 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -241,6 +241,13 @@ static int f2fs_do_sync_file(struct file *file, loff_t start, loff_t end,
>  	};
>  	unsigned int seq_id = 0;
>  
> +	/*
> +	 * for strict fsync mode, force to keep atomic write sematics to avoid
> +	 * data corruption if lower device doesn't support write barrier.
> +	 */
> +	if (!atomic && F2FS_OPTION(sbi).fsync_mode == FSYNC_MODE_STRICT)
> +		atomic = true;

This allows to relax IO ordering and cache flush. I'm not sure that's what you
want to do here for strict mode.

> +
>  	if (unlikely(f2fs_readonly(inode->i_sb) ||
>  				is_sbi_flag_set(sbi, SBI_CP_DISABLED)))
>  		return 0;
> -- 
> 2.18.0.rc1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
