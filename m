Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8D084D70F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  8 Feb 2024 01:18:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rXs7p-0000nl-W5;
	Thu, 08 Feb 2024 00:18:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1rXs7o-0000nV-GI
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Feb 2024 00:18:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3PhpbzObQawUII/NXo5WG+V+Bh0k58a93oOzdOI/kKo=; b=jZoCyngizzQW+dhLfB5RzR33kc
 PEGDMerEGy7P2xFGskrAewxGoLw1YqupJJFdr7MX7SDa8y/a66osbYDP1Eos7eQ9mzgwHvx3VtzdZ
 vOo7UPeQE92wvUvZAkLbA0qQYBzBjsxeyFWvAIzcT10QPVEnLxkcsqmg5zHNF65CsMEk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3PhpbzObQawUII/NXo5WG+V+Bh0k58a93oOzdOI/kKo=; b=EhWDEC3raIIlPRz0yrv59rYVL2
 He7w6/plUvTh47c7sTOzR0Gamzi5gfIjc/Nw2gXQ2sWWs65P2ZNG2FBfVFba1BZ7c+ZV5/hVpIpnF
 GI24QKEUKo/C4X9wC/pV2RmPxmnEXDGvoGT7o4zNG0NHGolHbTNpQeIxj5Vlo6mpxECo=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rXs7n-00022B-KX for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Feb 2024 00:18:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E98776196F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  8 Feb 2024 00:18:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DB04C433F1;
 Thu,  8 Feb 2024 00:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707351518;
 bh=sPGBKRP7Mk3ojRHbadujeGjzZuRfVVNuZG0fT9/kT78=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=j21ZKIjvUsZYb4RtuvAKxGHmF9VW9J792YECBE6SzlLXoD7k4vIgAK59865lInoIg
 f/LEzyyIJcOC1YdMSnZi6Oiv4QpM5wGh+dVR5MEDSXr6J+976X4aJW2CxGMTEXrvlw
 1CcE4F8qHPzU2m7vBQsHPDHwIiMGcZQmgB/ui5fPHIOVn0XUToYQCn2oJevV5g/GQ5
 f3lo9Q9xGORmGd25iQaEi7e7lPsn8FNOpOelgtkg2Gf1AOskQYAUZMcXzm4VEhM7/1
 lZzqJkBkO/yqP6Q/iqRN3ayVNhhsEebIZ3L2h89geM0VunkI8Czc9l57nNzKuGRyGC
 /EAxAYOCZvYQw==
Date: Wed, 7 Feb 2024 16:18:36 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <ZcQd3DtIpiA5P9DQ@google.com>
References: <20240206032513.2495025-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240206032513.2495025-1-chao@kernel.org>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 02/06,
 Chao Yu wrote: > generic/730 2s ... - output mismatch
 (see /media/fstests/results//generic/730.out.bad) > --- tests/generic/730.out
 2023-08-07 01:39:51.055568499 +0000 > +++ /media/fstests/r [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rXs7n-00022B-KX
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to return EIO when reading after
 device removal
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

On 02/06, Chao Yu wrote:
> generic/730 2s ... - output mismatch (see /media/fstests/results//generic/730.out.bad)
>     --- tests/generic/730.out	2023-08-07 01:39:51.055568499 +0000
>     +++ /media/fstests/results//generic/730.out.bad	2024-02-06 02:26:43.000000000 +0000
>     @@ -1,2 +1 @@
>      QA output created by 730
>     -cat: -: Input/output error
>     ...
>     (Run 'diff -u /media/fstests/tests/generic/730.out /media/fstests/results//generic/730.out.bad'  to see the entire diff)
> Ran: generic/730
> Failures: generic/730
> Failed 1 of 1 tests
> 
> This patch adds a check condition in f2fs_file_read_iter() to
> detect cp_error status after device removal, and retrurn -EIO
> for such case.

Can we check device removal?

> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/file.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 45b7e3610b0f..9e4386d4144c 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -4462,6 +4462,9 @@ static ssize_t f2fs_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
>  	const loff_t pos = iocb->ki_pos;
>  	ssize_t ret;
>  
> +	if (unlikely(f2fs_cp_error(F2FS_I_SB(inode))))
> +		return -EIO;
> +
>  	if (!f2fs_is_compress_backend_ready(inode))
>  		return -EOPNOTSUPP;
>  
> -- 
> 2.40.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
