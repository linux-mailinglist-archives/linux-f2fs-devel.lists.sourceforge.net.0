Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E713467DF
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 23 Mar 2021 19:40:02 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lOlwe-0007rG-Uw; Tue, 23 Mar 2021 18:40:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1lOlwP-0007nW-FK
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 23 Mar 2021 18:39:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Oo93yrYbholyPHnSCbhY2bAqDKMeiBa61G2tTjIchWk=; b=FNaY5PEvUaBEcDooWp/yoQdl5y
 9WY5vpUyKD3VpK0u4bpWmbwp2KQoklkIpr1TPvefSp7U0YYjFR5Yb9ALyTPMZ9dER54tF3G7GxcRi
 kQwsn174528l+uDmi5Va8DDMNbdeZ7BF1YtHDcwYlUPIUPwlaq7NXk0L7Bhoi0WtmYRc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Oo93yrYbholyPHnSCbhY2bAqDKMeiBa61G2tTjIchWk=; b=BEAbGyB3uxE8Ruh/ut+h1MJ6+F
 agm2l8vf0Zh3muFY1NkNNcn33ObYJBaf98fO3kATcYQG+6fujwDcEmDM3lrcxCvu9glZYnJgrX2EP
 0twgqqqluhQRkn33xsWoM/4Yuk2gEA6fYHgqbZbhs4BkpF0BVNxBQuq7Dl+IiSXgRs2k=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lOlwN-0007d2-SW
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 23 Mar 2021 18:39:45 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5A1BC60200;
 Tue, 23 Mar 2021 18:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616524778;
 bh=0kSLNKQSz2QSG9wMkW2lNiXkYaK/wjl031Wzl1gMSKw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C+LdZ8jkgyoBNkl83dF6ABdg/ZAXCReS5ebQzZcimeguVxw6jp7cQTGb6c0Db7r99
 GZJAEQ7YfS2KrOl4HkBLzCN1DE6vprvuDg9kVKBExKM0gZC+Y0Ijd8bEbBzCWtH5D+
 EonLO53/BAJgRoayhuNDGua77kW4mqUYrp7AaZcIuc0qm9ZJcEQRBZm3+sIB42/aDn
 goZI52amaT7XobuN7JfHmxZPJEedh0Ya9OlUScXW3HXj4UQAE/+NOylE4izexRvI5U
 JtrUjQyjUjjLSxt2j/yVVes+xkcafqTIJ1ixW0cl+sZEks9yFsJV4j4vGIM8otrOaK
 V/u1ywkOeddKw==
Date: Tue, 23 Mar 2021 11:39:36 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <YFo16ADpWJ7OUAvK@google.com>
References: <20210323064155.12582-1-yuchao0@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210323064155.12582-1-yuchao0@huawei.com>
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lOlwN-0007d2-SW
Subject: Re: [f2fs-dev] [PATCH] Revert "f2fs: give a warning only for
 readonly partition"
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

On 03/23, Chao Yu wrote:
> This reverts commit 938a184265d75ea474f1c6fe1da96a5196163789.
> 
> Because that commit fails generic/050 testcase which expect failure
> during mount a recoverable readonly partition.

I think we need to change generic/050, since f2fs can recover this partition,
even though using it as readonly. And, valid checkpoint can allow for user to
read all the data without problem.

> 
> Fixes: 938a184265d7 ("f2fs: give a warning only for readonly partition")
> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> ---
>  fs/f2fs/super.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index b48281642e98..2b78ee11f093 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -3952,10 +3952,12 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>  		 * previous checkpoint was not done by clean system shutdown.
>  		 */
>  		if (f2fs_hw_is_readonly(sbi)) {
> -			if (!is_set_ckpt_flags(sbi, CP_UMOUNT_FLAG))
> +			if (!is_set_ckpt_flags(sbi, CP_UMOUNT_FLAG)) {
> +				err = -EROFS;
>  				f2fs_err(sbi, "Need to recover fsync data, but write access unavailable");
> -			else
> -				f2fs_info(sbi, "write access unavailable, skipping recovery");
> +				goto free_meta;
> +			}
> +			f2fs_info(sbi, "write access unavailable, skipping recovery");
>  			goto reset_checkpoint;
>  		}
>  
> -- 
> 2.29.2


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
