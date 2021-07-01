Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B6E3B9544
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  1 Jul 2021 19:10:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lz0Cy-0007rp-UN; Thu, 01 Jul 2021 17:10:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1lz0Cx-0007rb-OF
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 01 Jul 2021 17:10:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vFf1T6uNmEtTd/iFs6IpRSy2gsh9HIKdZnXK9V+n+AU=; b=PUzDUhL+CiDD2pi2afsfUKWiGc
 pWOc86Xkv1W/gfIUH9QZnHnKvarjezfeXMBbY4EaQG/krtF1a7JoKOmVsxwRQ3jvpVujj/yXIj7De
 y/iTBFh84U0JYw5cbd4V9TRuk1Em7V8ZXAwdwrx3TmezwyYPcAl2FqobhMgRQ282OEEk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vFf1T6uNmEtTd/iFs6IpRSy2gsh9HIKdZnXK9V+n+AU=; b=A0FSHGA19RtS7GAxYrRzjxWQ2x
 pjwp/nOoWwWn1VwTn4GtvAr1vbrS55GApOICVmTe2tQqXgwpKvMmd2qccOlHNv6LJCHBI1NT2/mO1
 APNpLGTGJOTAEz6SdGwuQjBNmhIoRTcXheI3HgBRPv3ySwcKqH4V7aJqtZQcpFZ8xv3o=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lz0Cp-0007IC-SX
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 01 Jul 2021 17:10:35 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4D70661405;
 Thu,  1 Jul 2021 17:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625159422;
 bh=xdnAA7baVCohcq+q0n62eDKdetlkpnI4UjNwJ3Ih8CU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M+RhoUajTF1gDgnHS60QrdV574dAeRY/sXEy1jFcWO6rPhV07SByNFM8vKZH/auLT
 PSINIJLIG8yzSgOA8LTGfMk9heo0H5qbFim6132xUPayb9R7uvBIpgyqLis9Ej4EsF
 9FyE4zlnLw8iKeQ1hTPUN+k1IkgUcvtEhesKv3I7Lj8WyHQemeLMz1onksshmlA/jd
 0udbOX+Nwau9XcbhVdimeNGmjoeang+5BLX2GU+MHCGhbpYqGsz9dNnrGD+VQGunkF
 Vasq0rXWNNzqRrXkgsSLuzvyNZA0hlN2fMQ/ZNM331EC2MI+WcJCEAuz86T21tQOwj
 wD2WPOszA+gKA==
Date: Thu, 1 Jul 2021 10:10:20 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <YN32/NsjqJONbvz7@google.com>
References: <20210601101024.119356-1-yuchao0@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210601101024.119356-1-yuchao0@huawei.com>
X-Spam-Score: -0.5 (/)
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
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lz0Cp-0007IC-SX
Subject: Re: [f2fs-dev] [PATCH v2 RFC] f2fs: fix to force keeping write
 barrier for strict fsync mode
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

On 06/01, Chao Yu wrote:
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

Well, we have preflush for node writes, so I don't think this is the case.

 fio.op_flags |= REQ_PREFLUSH | REQ_FUA;

> 
> If SPO is triggered during flush command, inode page can be persisted
> before data page #0, so that after recovery, inode page can be recovered
> with new physical block address of data page #0, however there may
> contains dummy data in new physical block address.
> 
> Then what user will see is: after overwrite & fsync + SPO, old data in
> file was corrupted, if any user do care about such case, we can suggest
> user to use STRICT fsync mode, in this mode, we will force to trigger
> preflush command to persist data in device cache in prior to node
> writeback, it avoids potential data corruption during fsync().
> 
> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> ---
> v2:
> - fix this by adding additional preflush command rather than using
> atomic write flow.
>  fs/f2fs/file.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 7d5311d54f63..238ca2a733ac 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -301,6 +301,20 @@ static int f2fs_do_sync_file(struct file *file, loff_t start, loff_t end,
>  				f2fs_exist_written_data(sbi, ino, UPDATE_INO))
>  			goto flush_out;
>  		goto out;
> +	} else {
> +		/*
> +		 * for OPU case, during fsync(), node can be persisted before
> +		 * data when lower device doesn't support write barrier, result
> +		 * in data corruption after SPO.
> +		 * So for strict fsync mode, force to trigger preflush to keep
> +		 * data/node write order to avoid potential data corruption.
> +		 */
> +		if (F2FS_OPTION(sbi).fsync_mode == FSYNC_MODE_STRICT &&
> +								!atomic) {
> +			ret = f2fs_issue_flush(sbi, inode->i_ino);
> +			if (ret)
> +				goto out;
> +		}
>  	}
>  go_write:
>  	/*
> -- 
> 2.29.2


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
