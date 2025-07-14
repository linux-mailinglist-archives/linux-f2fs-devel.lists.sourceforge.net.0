Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA1BB03474
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 14 Jul 2025 04:28:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qgvBQh5NyiK3//j2YO5+CQrkMCQfm6rcwSYroxQ9gaM=; b=FbGEC2Sbe4xceIxb3lExQq8Lzd
	GIY2erseUcHCA3DYq7pb+tMIZTXpwzKr7v0CGG0yTZ6EYh5DcsGwjxb1VPZDNlqO2DIXd4bGmeEJb
	0GqLi+kJ1aujMYZvBFQyMwtGTqwEvclrfIeEOLM1OaWDMbRqXozcXRTTb9AItv4QkXOc=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ub8v7-0000PP-W7;
	Mon, 14 Jul 2025 02:27:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ub8uk-0000Ox-CY
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Jul 2025 02:27:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=epMgS90GJAotY4hyjocKORGzG6VszoXTqCQBFnbpPKA=; b=ho3q9me/S17qZTgwWki4rjtFnt
 ZhfxQzjn3sBIklEQWNI4bVn3WQmu3pZAIysorb9zUkWTpTi53rDlIxrsPMolxAy8RdQ5X7PAM5wEp
 LF652framje0JEdFhaZnreynxUzB6RxDdBEvAcusRT1c5dZcwZ5Yll9nvCTSHIJv517Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=epMgS90GJAotY4hyjocKORGzG6VszoXTqCQBFnbpPKA=; b=VAd0vVbvl24Ag4Y0jvbZWxzOlK
 TcWhwY5aKp101Juj/0HibDnPcgDGYFv7JRt+CdAGrJ+fpxISmKgNOQieXu4m7aZWwU157JsWvFKtA
 /qikB28obdRxJjwBwsO91FEO3M8kyjkKMvk9tnguaHjz7DYO5+pKU9xoF9gTAMm0zVMM=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ub8uj-00029c-S2 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Jul 2025 02:27:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7CCFD436E4;
 Mon, 14 Jul 2025 02:27:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8016C4CEE3;
 Mon, 14 Jul 2025 02:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752460048;
 bh=7Axe8joyugX6kQZ14NmROgtOmkdcODhNEvwCi5eQuUw=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=McCMGcjqjDqC9Qoqo15VRZ3U+4XZPPudj4x6AKoVdcPIfyJFrDRKDESZ0GnGv7Cec
 J6PeYfxTmPJK/l9RxQM3XUZPq21SPKrQKHktOpYjEl/bHM44hbU99mh5E1K/YddZNP
 dK/ULCyuwhv00tBB9LVp15c+4ztq/foLQBrFTbP3DsH5uZvwGr11m4Vu0aed1Px6lx
 KJoeys1Mo8Wv6y+SWrOlZW1t/fFU3yYa3591bNKdV2pgPzR+qRHYxMtOJdTkp0/DML
 jHb3RyjPFN+IkbkjcrxcY/VXZaQY2eJvTeBLP7BfjudZELyA+zYXxrfsVAOnZEau6S
 PYBQGO0so2GLA==
Message-ID: <b12d791e-a9f6-4b9d-a299-858821ebc1b5@kernel.org>
Date: Mon, 14 Jul 2025 10:27:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Hongbo Li <lihongbo22@huawei.com>, jaegeuk@kernel.org
References: <20250710121415.628398-1-lihongbo22@huawei.com>
Content-Language: en-US
In-Reply-To: <20250710121415.628398-1-lihongbo22@huawei.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 7/10/25 20:14, Hongbo Li wrote: > In this version, we have
 finished the issues pointed in v4. > First, I'd like to express my sincere
 thanks to Jaegeuk and Chao > for reviewing this patch series an [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ub8uj-00029c-S2
Subject: Re: [f2fs-dev] [PATCH v5 0/7] f2fs: new mount API conversion
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
Cc: linux-fsdevel@vger.kernel.org, sandeen@redhat.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 7/10/25 20:14, Hongbo Li wrote:
> In this version, we have finished the issues pointed in v4.
> First, I'd like to express my sincere thanks to Jaegeuk and Chao
> for reviewing this patch series and providing corrections. I also
> appreciate Eric for rebasing the patches onto the latest branch to
> ensure forward compatibility.
> 
> The latest patch series has addressed all the issues mentioned in
> the previous set. For modified patches, I've re-added Signed-off-by
> tags (SOB) and uniformly removed all Reviewed-by tags.
> 
> v5:
>   - Add check for bggc_mode(off) with sb blkzone case.
>   - Fix the 0day-ci robot reports.

Looks good to me, feel free to add to all patches:

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,

> 
> v4: https://lore.kernel.org/all/20250602090224.485077-1-lihongbo22@huawei.com/
>   - Change is_remount as bool type in patch 2.
>   - Remove the warning reported by Dan for patch 5.
>   - Enhance sanity check and fix some coding style suggested by
>     Jaegeuk in patch 5.
>   - Change the log info when compression option conflicts in patch 5.
>   - Fix the issues reported by code-reviewing in patch 5.
>   - Context modified in patch 7.
> 
> V3: https://lore.kernel.org/all/20250423170926.76007-1-sandeen@redhat.com/
> - Rebase onto git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
>   dev branch
> - Fix up some 0day robot warnings
> 
> (Here is the origianl cover letter:)
> 
> Since many filesystems have done the new mount API conversion,
> we introduce the new mount API conversion in f2fs.
> 
> The series can be applied on top of the current mainline tree
> and the work is based on the patches from Lukas Czerner (has
> done this in ext4[1]). His patch give me a lot of ideas.
> 
> Here is a high level description of the patchset:
> 
> 1. Prepare the f2fs mount parameters required by the new mount
> API and use it for parsing, while still using the old API to
> get mount options string. Split the parameter parsing and
> validation of the parse_options helper into two separate
> helpers.
> 
>   f2fs: Add fs parameter specifications for mount options
>   f2fs: move the option parser into handle_mount_opt
> 
> 2. Remove the use of sb/sbi structure of f2fs from all the
> parsing code, because with the new mount API the parsing is
> going to be done before we even get the super block. In this
> part, we introduce f2fs_fs_context to hold the temporary
> options when parsing. For the simple options check, it has
> to be done during parsing by using f2fs_fs_context structure.
> For the check which needs sb/sbi, we do this during super
> block filling.
> 
>   f2fs: Allow sbi to be NULL in f2fs_printk
>   f2fs: Add f2fs_fs_context to record the mount options
>   f2fs: separate the options parsing and options checking
> 
> 3. Switch the f2fs to use the new mount API for mount and
> remount.
> 
>   f2fs: introduce fs_context_operation structure
>   f2fs: switch to the new mount api
> 
> [1] https://lore.kernel.org/all/20211021114508.21407-1-lczerner@redhat.com/
> 
> Hongbo Li (7):
>   f2fs: Add fs parameter specifications for mount options
>   f2fs: move the option parser into handle_mount_opt
>   f2fs: Allow sbi to be NULL in f2fs_printk
>   f2fs: Add f2fs_fs_context to record the mount options
>   f2fs: separate the options parsing and options checking
>   f2fs: introduce fs_context_operation structure
>   f2fs: switch to the new mount api
> 
>  fs/f2fs/super.c | 2101 +++++++++++++++++++++++++++--------------------
>  1 file changed, 1190 insertions(+), 911 deletions(-)
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
