Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AC24D2D2C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Mar 2022 11:35:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nRtf5-0001mk-4a; Wed, 09 Mar 2022 10:35:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nRtez-0001mT-QT
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Mar 2022 10:35:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VO7HuTq842cnAVlmUa/WBNvDOlzEYvqF3SiuIJu5J4c=; b=K8JviRyG5Oa21PbrX/nR3pwu8T
 AaZFVRuZfNbeuuICH4LQMLUMgPwNTyeFzWOLTqnvJkphsPOZwcFFN4XFvsZ656oB0bPAAIyPKvr/3
 oi73UORPRyFKAEoTmYcasYo7axTrbyLTeECFZFSO6PtsLNEtl2u/OQ7WyfBoyHluNH88=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VO7HuTq842cnAVlmUa/WBNvDOlzEYvqF3SiuIJu5J4c=; b=EkplrKTxIngG2ntqFu0sS1KgU0
 xP9stglD0/6Qo7lfBCUglWhO3vM0Tu+FQa/tCM+t6c0D8zTiPubFqVAqK9Fb97PMW5DLkUPEnoBk1
 f+WAuMXnNZXHjLoudRHvroQt7kxBQW72nYR7Kp/kUCjdU6ZPBbe8XFuvJ65zIhE4CXTA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nRtex-0007dM-Ht
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Mar 2022 10:35:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 25BAC61761;
 Wed,  9 Mar 2022 10:35:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B91AC340E8;
 Wed,  9 Mar 2022 10:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646822101;
 bh=jmAhCrQ6F1xK43yWCy7k3BjDnuVitW/NnZJHP1n+msI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=hgHc0lpJAubYQbbQlMrpzC4ExjfmtBfHGdgsSzv4SW9msSlgbzQaH4ChOlDX5NZA1
 7nEAAwWUwJ/kdwXSKe8ZFDt9+UxUOc1QWBUPKJzf5yHvYzuqoplxP5q4WDFY9eaI9Q
 OE7lVrkY3uHIRRXyUU7IcjbfltQyvnoKNFASL8TVdsYb4t3K+D0FBMp0cVrKXKqrpm
 isaxivEUbjMaGnMC5ZYlH4iSdScs8UQM+87lCA05moZKHmPiL63ff7VmGs3io5isTA
 ph8a2gyPY7Q1t41I9zB61fU9QZxSRTrHPJmSls1M1TFxbmS6ve9Y9XJna5sB1YA62W
 K5GoNtGNZ7Nxw==
Message-ID: <d53954fc-191a-d8b7-0385-5c3dd0664de8@kernel.org>
Date: Wed, 9 Mar 2022 18:34:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-US
To: Fengnan Chang <changfengnan@vivo.com>, jaegeuk@kernel.org
References: <20220309093721.68497-1-changfengnan@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220309093721.68497-1-changfengnan@vivo.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/3/9 17:37, Fengnan Chang wrote: > When compressed
 file has blocks, f2fs_ioc_start_atomic_write will succeed, > but compressed
 flag will be remained in inode. If write partial compreseed > clus [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nRtex-0007dM-Ht
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix compressed file start atomic write
 may cause data corruption
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/3/9 17:37, Fengnan Chang wrote:
> When compressed file has blocks, f2fs_ioc_start_atomic_write will succeed,
> but compressed flag will be remained in inode. If write partial compreseed
> cluster and commit atomic write will cause data corruption.
> 
> This is the reproduction process:
> Step 1:
> create a compressed file ,write 64K data , call fsync(), then the blocks
> are write as compressed cluster.
> Step2:
> iotcl(F2FS_IOC_START_ATOMIC_WRITE)  --- this should be fail, but not.
> write page 0 and page 3.
> iotcl(F2FS_IOC_COMMIT_ATOMIC_WRITE)  -- page 0 and 3 write as normal file,
> Step3:
> drop cache.
> read page 0-4   -- Since page 0 has a valid block address, read as
> non-compressed cluster, page 1 and 2 will be filled with compressed data
> or zero.
> 
> And before f2fs: compress: remove unneeded read when rewrite whole cluster,
> even Step 2 is not right, but whole cluster will mark dirty in write_begin,
Nitpick here... could you please update as below:

The root cause is, after commit 7eab7a696827 ("f2fs: compress: remove unneeded
read when rewrite whole cluster"), in step 2, f2fs_write_begin() only set target
page dirty, and in f2fs_commit_inmem_pages(), we will write partial raw pages
into compressed cluster, result in corrupting compressed cluster layout.

> and whole cluster will be rewrite as no-compressed cluster, so it's ok.
> 
> Fixes: 4c8ff7095bef (f2fs: support data compression)

Fixes: 4c8ff7095bef ("f2fs: support data compression")

> Fixes: 7eab7a696827 (f2fs: compress: remove unneeded read when rewrite whole
> cluster)

Fixes: 7eab7a696827 ("f2fs: compress: remove unneeded read when rewrite whole cluster")

Thanks,

> Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
> ---
>   fs/f2fs/data.c | 2 +-
>   fs/f2fs/file.c | 3 ++-
>   2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index b09f401f8960..5675af1b6916 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -3363,7 +3363,7 @@ static int f2fs_write_begin(struct file *file, struct address_space *mapping,
> 
>   		*fsdata = NULL;
> 
> -		if (len == PAGE_SIZE)
> +		if (len == PAGE_SIZE && !(f2fs_is_atomic_file(inode)))
>   			goto repeat;
> 
>   		ret = f2fs_prepare_compress_overwrite(inode, pagep,
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index cfdc41f87f5d..2a07568ee61e 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -2009,7 +2009,8 @@ static int f2fs_ioc_start_atomic_write(struct file *filp)
> 
>   	inode_lock(inode);
> 
> -	f2fs_disable_compressed_file(inode);
> +	if (!f2fs_disable_compressed_file(inode))
> +		return -EINVAL;
> 
>   	if (f2fs_is_atomic_file(inode)) {
>   		if (is_inode_flag_set(inode, FI_ATOMIC_REVOKE_REQUEST))
> --
> 2.32.0
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
