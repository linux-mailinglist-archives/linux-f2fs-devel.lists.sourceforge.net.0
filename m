Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 010D639A530
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Jun 2021 18:00:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lopmB-0006lc-DA; Thu, 03 Jun 2021 16:00:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1lopmA-0006lT-Qd
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Jun 2021 16:00:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8wHvGKFx0SJwxuq5qlwRIh/zqvZuAXwAMRdelbTuPUs=; b=Z4Dfc1yvfH1nyg818GKm0Zh7+r
 n7Ohi8mGBortIuIhMr7qaNZ4/rO1y4wb01F+qkZB0jtju8cH6a2kQdSCHKqJ2j3nTEVh37Eq1DhdZ
 xaA8hyJDuADVPGPFfoaqu30QQuP+3Mhz1OT6nczwNkul5Oe3F/BqtTNYV5WmnH7q55lQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8wHvGKFx0SJwxuq5qlwRIh/zqvZuAXwAMRdelbTuPUs=; b=fK7QjjVsGeWNvb+k+4KJBS8T2T
 WIO5HcBmr/eUPC9SaJHlHJlqOk3dhykSqbodJaDZhEuBUc6gtTXbjqfn0IZ/zEllEQ2Y4j3VnDR9D
 soygJZWVVzCdjUE8dhAeBgQ/R02ZSfEHaNOv3F+vTfLiv1hc+ByYOV9amKxzeM6GwjVM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1loplp-00079k-J2
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Jun 2021 16:00:54 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 36CCE613E4;
 Thu,  3 Jun 2021 16:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622736029;
 bh=M9GUJBcQqn8H5w/RTpySxCTtdT8isktpYnd50U1/Vmc=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=myqghbSx06FqpWxgcCThF9ESiJDrnltHdhLkxrkVPLCdKCjxuLDgZRXaiWbHFnoO5
 /30vLT4QDqqgFgz3Cp7OfbyMffC4aMAIO+Q/9oBThvdqLDUdFwTVOgFhc6soToQBMZ
 6hZdAXOxzLHHdUrLXO7L9bTw01YvNpap9Eqd3Nzxhg8XwcpUVYgd1AIZ78TVItfSm8
 0Ptyrq30WuDHtB0caHU9fBXRhIu+IyMtGfNfA8TikMYU9zhc0xSqlIpc8TJ/0j6eJi
 Z7QQY6DhffX6kEzfl/qFQEfIvh9SJGyWmJ1V/Vxenv7t82q56bTvgYgnYGMo6sxvv9
 sQGqQDGn/V01w==
To: Chao Yu <yuchao0@huawei.com>, jaegeuk@kernel.org
References: <20210601101024.119356-1-yuchao0@huawei.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <9b43a461-e348-f16c-31da-fb70e064d6f8@kernel.org>
Date: Fri, 4 Jun 2021 00:00:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210601101024.119356-1-yuchao0@huawei.com>
Content-Language: en-US
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: mail-archive.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.1 DKIM_INVALID           DKIM or DK signature exists, but is not valid
 -0.6 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1loplp-00079k-J2
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Jaegeuk,

Any comments on this patch?

On 2021/6/1 18:10, Chao Yu wrote:
> [1] https://www.mail-archive.com/linux-f2fs-devel@lists.sourceforge.net/msg15126.html
> 
> As [1] reported, if lower device doesn't support write barrier, in below
> case:
> 
> - write page #0; persist
> - overwrite page #0
> - fsync
>   - write data page #0 OPU into device's cache
>   - write inode page into device's cache
>   - issue flush
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
>   fs/f2fs/file.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 7d5311d54f63..238ca2a733ac 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -301,6 +301,20 @@ static int f2fs_do_sync_file(struct file *file, loff_t start, loff_t end,
>   				f2fs_exist_written_data(sbi, ino, UPDATE_INO))
>   			goto flush_out;
>   		goto out;
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
>   	}
>   go_write:
>   	/*
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
