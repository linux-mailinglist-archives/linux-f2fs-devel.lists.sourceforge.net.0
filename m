Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3635590FBA1
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 20 Jun 2024 05:20:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sK8Lm-0004SO-Kc;
	Thu, 20 Jun 2024 03:20:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sK8Lg-0004S2-6x
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 20 Jun 2024 03:20:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qV9QCYrOoonJKSnU5+HeaEZ9BKvVWKaRAvqJHghyn3U=; b=jESvWJLi271GYEntPd0+0NPK4s
 UopmYGoVAfDDBA2vFpiOxSiedMRYeLjW6pw8YB2CMQa0MGdXYSSEd3S9dddBcXepnRgi5TJrfPbqk
 ZCk3vbd/l4HzUKzZgVCyGPIcV/ijGhEuXisYibxBM4s+ZLno6MSnrO6yJ55UQyp7LKQU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qV9QCYrOoonJKSnU5+HeaEZ9BKvVWKaRAvqJHghyn3U=; b=GkuXJUCiLY7xCF4VK+GSwF9QVg
 cXL+ucsI8+UanikS8QY5DmXXHU8rJcEPja+Ra314985DQuGCCAt8Bt4ntkEQTla11Ep4T5OL+WObZ
 M+0W00ObZoJC9yhHpNH4P3FYCdgKdy8ZTPVne+3zQCd4k7Vmz/3TuZCvArsgByCzWc6w=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sK8Lg-0003pn-D1 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 20 Jun 2024 03:20:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B5E6ACE21BC;
 Thu, 20 Jun 2024 03:20:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D380FC2BBFC;
 Thu, 20 Jun 2024 03:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718853624;
 bh=TAAgplD9oJWAcHrVyNc1Ug4UEEKEKPxmnmCOe3L5NyE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=uu4go8hK2Ieal0QhF84wVdASOEMAWKc2+vYrYSQsMpMR0XvpmLa9KH+EGSIc1bz3d
 bxaJuWKkFEdfxEW7vBHPNdAXawihAyj5UUSif4ArOXBVPhP3WM381aF/HeA/Sockg5
 Phqez3wxzWC4WehNxjZuXkwi/XkLek00MRRnHJiKvnEv9ehHjdheQfVBnwXK7c65Tp
 /H6zUk0gwidmVU/c2wN2EhOMs6mOwqIOtDFILwY77gfCaZ7KoW8rsMcsZmbxLL9n4q
 d1sbzUfaAV+bNs0Tbhlq3bCSqaDnp0IiXnvCTCsO6W0SGNoNTE5xy1L8vpn/E3OQxy
 PwkYCd6LRgIsQ==
Message-ID: <2842767c-db80-407b-a5e5-2b9fa74b0d79@kernel.org>
Date: Thu, 20 Jun 2024 11:20:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: jaegeuk@kernel.org, Wenjie Cheng <cwjhust@gmail.com>
References: <20240614004841.103114-1-cwjhust@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240614004841.103114-1-cwjhust@gmail.com>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Jaegeuk,
 Quoted commit message from commit c550e25bca66 ("f2fs:
 use flush command instead of FUA for zoned device") " The block layer for
 zoned disk can reorder the FUA'ed IOs. Let's use flush command to keep [...]
 Content analysis details:   (-0.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in sa-trusted.bondedsender.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sK8Lg-0003pn-D1
Subject: Re: [f2fs-dev] [PATCH] Revert "f2fs: use flush command instead of
 FUA for zoned device"
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
Cc: qwjhust@gmail.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Jaegeuk,

Quoted commit message from commit c550e25bca66 ("f2fs: use flush command
instead of FUA for zoned device")
"
The block layer for zoned disk can reorder the FUA'ed IOs. Let's use flush
command to keep the write order.
"

It seems mq-deadline use fifo queue and make queue depth of zone device
as 1 to IO order, so why FUA'ed write node IOs can be reordered by block
layer?

Thanks,

On 2024/6/14 8:48, Wenjie Cheng wrote:
> This reverts commit c550e25bca660ed2554cbb48d32b82d0bb98e4b1.
> 
> Commit c550e25bca660ed2554cbb48d32b82d0bb98e4b1 ("f2fs: use flush
> command instead of FUA for zoned device") used additional flush
> command to keep write order.
> 
> Since Commit dd291d77cc90eb6a86e9860ba8e6e38eebd57d12 ("block:
> Introduce zone write plugging") has enabled the block layer to
> handle this order issue, there is no need to use flush command.
> 
> Signed-off-by: Wenjie Cheng <cwjhust@gmail.com>
> ---
>   fs/f2fs/file.c | 3 +--
>   fs/f2fs/node.c | 2 +-
>   2 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index eae2e7908072..f08e6208e183 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -372,8 +372,7 @@ static int f2fs_do_sync_file(struct file *file, loff_t start, loff_t end,
>   	f2fs_remove_ino_entry(sbi, ino, APPEND_INO);
>   	clear_inode_flag(inode, FI_APPEND_WRITE);
>   flush_out:
> -	if ((!atomic && F2FS_OPTION(sbi).fsync_mode != FSYNC_MODE_NOBARRIER) ||
> -	    (atomic && !test_opt(sbi, NOBARRIER) && f2fs_sb_has_blkzoned(sbi)))
> +	if (!atomic && F2FS_OPTION(sbi).fsync_mode != FSYNC_MODE_NOBARRIER)
>   		ret = f2fs_issue_flush(sbi, inode->i_ino);
>   	if (!ret) {
>   		f2fs_remove_ino_entry(sbi, ino, UPDATE_INO);
> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> index 144f9f966690..c45d341dcf6e 100644
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -1631,7 +1631,7 @@ static int __write_node_page(struct page *page, bool atomic, bool *submitted,
>   		goto redirty_out;
>   	}
>   
> -	if (atomic && !test_opt(sbi, NOBARRIER) && !f2fs_sb_has_blkzoned(sbi))
> +	if (atomic && !test_opt(sbi, NOBARRIER))
>   		fio.op_flags |= REQ_PREFLUSH | REQ_FUA;
>   
>   	/* should add to global list before clearing PAGECACHE status */


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
