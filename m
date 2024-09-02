Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA679680A1
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  2 Sep 2024 09:32:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sl1YO-0002UN-1U;
	Mon, 02 Sep 2024 07:32:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sl1YK-0002UF-3F
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Sep 2024 07:32:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EStTnbcSneByi5Wq7OApyeW97eFAGkf8iRKWC+vMDdM=; b=CK9dx1P7EWrbSMBs1PbcOYwK4w
 8ySbfyeuopoGmi7+yZ0n8xIrkdb8IAvSiPpb10EYjyXEOczEaO7XmoEboK3L0d9aQ6l/AcvkAnIe1
 KBj6wP3k3ICBROLqDljaD18kbdqVjmG0PjnHRjHI+DefqTFMdnHlStgrW4hXdms41I4U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EStTnbcSneByi5Wq7OApyeW97eFAGkf8iRKWC+vMDdM=; b=WK0GJPHfaBDayHkG5IMGzTg3UP
 IXv/0gzFTMMdiVqA+59rRKOSx9aeBQWy8Yh0TrjXoF/65LHGnxAJ9kPcu1nXpT+aQtotZdVTEjeeV
 gHhNV/30tx+rufWG9dgfc0PsROPy6B4Abcji2s7VlorpFkB6PRt7iq2ELf7Ikwp+qECY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sl1YJ-0006Y1-Ef for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Sep 2024 07:32:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A88795C56E4;
 Mon,  2 Sep 2024 07:32:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60D87C4CEC2;
 Mon,  2 Sep 2024 07:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725262357;
 bh=dVuVc86J5b6OHhIlLTRhxSstrU4YAQzxLh10N76gTQo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=sci4iq/HrBHDanQRfrc7SyyAlOd+dZFkkWqJNfJpgL1uGzaGAoOu4yMhrQyMDIo9w
 NGo+GO7oNZZvf/AwErVfp94eprDZjpJ5JduwX2KQYj1L/GbJe1ASlyQS2/u8KilJ/e
 jfkcIrSCIg/aTBcuiqRzeAWdtIqonHMvCa2S1N341CCY9Lbn+OOdWQc6FKieTU0CRG
 ZRsArh73A+yD+cv5sLUnJQkQGj94ICUBB4tVtiesAGb9PcQdPkkEtusDIoYXyh1frD
 lNW7W+Cvjxklfi0OHXyBgGI/x3LNC6WjGNawMRXwK+Gvr0n/vfTL1Che5f3beCPclr
 x6ZA0cf6ck5Rw==
Message-ID: <52ced02d-728b-4e3b-9079-73efd91c90e3@kernel.org>
Date: Mon, 2 Sep 2024 15:32:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: wangzijie <wangzijie1@honor.com>, jaegeuk@kernel.org
References: <20240827062242.776881-1-wangzijie1@honor.com>
Content-Language: en-US
In-Reply-To: <20240827062242.776881-1-wangzijie1@honor.com>
X-Spam-Score: -5.4 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/8/27 14:22,
 wangzijie wrote: > Thread A > -dquot_initialize
 > -dqget > -f2fs_dquot_acquire > -v2_read_dquot > -qtree_read_dquot >
 -find_tree_dqentry
 > -f2fs_quota_read > -read_cache_page_gfp > [...] 
 Content analysis details:   (-5.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sl1YJ-0006Y1-Ef
Subject: Re: [f2fs-dev] [RFC PATCH] f2fs: don't set SBI_QUOTA_NEED_REPAIR
 flag if receive SIGKILL
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/8/27 14:22, wangzijie wrote:
> Thread A
> -dquot_initialize
>   -dqget
>    -f2fs_dquot_acquire
>     -v2_read_dquot
>      -qtree_read_dquot
>       -find_tree_dqentry
>        -f2fs_quota_read
>         -read_cache_page_gfp
>          -do_read_cache_folio
>           -fiemap_read_folio
>            -folio_wait_locked_killable
>             -receive SIGKILL : return -EINTR
>         -set SBI_QUOTA_NEED_REPAIR
>     -set SBI_QUOTA_NEED_REPAIR
> 
> When calling read_cache_page_gfp in quota read, thread may receive SIGKILL and
> set SBI_QUOTA_NEED_REPAIR, should we set SBI_QUOTA_NEED_REPAIR in this error path?

f2fs_quota_read() can be called in a lot of contexts, can we just ignore -EINTR
for f2fs_dquot_initialize() case?

Thanks,

> 
> Signed-off-by: wangzijie <wangzijie1@honor.com>
> ---
>   fs/f2fs/inode.c | 3 ++-
>   fs/f2fs/super.c | 6 +++---
>   2 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> index ed629dabb..2af98e2b7 100644
> --- a/fs/f2fs/inode.c
> +++ b/fs/f2fs/inode.c
> @@ -837,8 +837,9 @@ void f2fs_evict_inode(struct inode *inode)
>   
>   	err = f2fs_dquot_initialize(inode);
>   	if (err) {
> +		if (err != -EINTR)
> +			set_sbi_flag(sbi, SBI_QUOTA_NEED_REPAIR);
>   		err = 0;
> -		set_sbi_flag(sbi, SBI_QUOTA_NEED_REPAIR);
>   	}
>   
>   	f2fs_remove_ino_entry(sbi, inode->i_ino, APPEND_INO);
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 1f1b3647a..f99a36ff3 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -2650,8 +2650,8 @@ static ssize_t f2fs_quota_read(struct super_block *sb, int type, char *data,
>   			if (PTR_ERR(page) == -ENOMEM) {
>   				memalloc_retry_wait(GFP_NOFS);
>   				goto repeat;
> -			}
> -			set_sbi_flag(F2FS_SB(sb), SBI_QUOTA_NEED_REPAIR);
> +			} else if (PTR_ERR(page) != -EINTR)
> +				set_sbi_flag(F2FS_SB(sb), SBI_QUOTA_NEED_REPAIR);
>   			return PTR_ERR(page);
>   		}
>   
> @@ -3070,7 +3070,7 @@ static int f2fs_dquot_acquire(struct dquot *dquot)
>   
>   	f2fs_down_read(&sbi->quota_sem);
>   	ret = dquot_acquire(dquot);
> -	if (ret < 0)
> +	if (ret < 0 && ret != -EINTR)
>   		set_sbi_flag(sbi, SBI_QUOTA_NEED_REPAIR);
>   	f2fs_up_read(&sbi->quota_sem);
>   	return ret;



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
