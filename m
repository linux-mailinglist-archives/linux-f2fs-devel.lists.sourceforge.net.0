Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DDEC1734997
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jun 2023 03:01:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qB3Gn-0003bR-2B;
	Mon, 19 Jun 2023 01:01:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qB3Gl-0003bJ-6I
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jun 2023 01:01:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QQhKh3XQERAYIBN9mpvuEliGvREZxjByg3odAnA1XzU=; b=Vp8wUZlBSUNipVwLdfL3LIVC67
 rJA2ovjVZgo4OaYUKbLcQ9tgLoBoaC5N0gSKl6k4KUiNqgGnEx0OC+BlNPYpuc7BwyLUz+ch2Ro3i
 /aHhArFmF9JlDCOAuvijh59Xng/ZrWEM2byOoZQjy2bGgvOlCf+1I5cuhdHkRBxuTNms=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QQhKh3XQERAYIBN9mpvuEliGvREZxjByg3odAnA1XzU=; b=RtRC+CtOJ0gVCDUthtZ2br5kKc
 Uz4Y3/jpGgsj6YLVTztxNMjN0NBvN/niEoO/4OD4Ocng40Cp42I2fqanTCde8KBSsqS3Tz6ZDErRK
 OCPLxonPqWfJ8f7PV7McRGlEDIaxY/OTLD4ZIbbpw9kX9uVQQBTyr9/PZYHJMtwi+bsw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qB3Gl-0006hd-Gf for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jun 2023 01:01:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E09B860DBA;
 Mon, 19 Jun 2023 01:01:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F0D3C433C0;
 Mon, 19 Jun 2023 01:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687136477;
 bh=0yBXOWC+sGbvgh0ahDkRtxdfWqQ6lj+N8XLvthihCmo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=M5rD5E3Ze2nXZwcc+ZT7BY5+u9m/Yd34459/26YyOIIqIV6+3wbZ2kBwi+CrPksQU
 JmWq4EI+0ZERTnqOmn8D0rbqqplv9RTLNjdvSfFahLM0+scWkhl5ZxCKhD37B3PcEn
 lsJ119Ik8kCd9GokQSnnCc3UBAOYjgx/Wy2qE+PbgJHAFXpsoFI6TnFSgc4MQBrrVd
 1x2k0Rd27lEOvHDmArXJjFjbLK82FcnuAhrsHa4xH+W0giltepbM7M+yjquh7eOoBY
 u+KmW5hz7+vtzdRQ2GAUzonaQCBsGjMhhFagry+kjHCmEcK4UitTVhpaZiwY/b8L2B
 6aH3iAc6KrdyA==
Message-ID: <700bd4aa-20ac-a73d-2fb8-416e41ba208b@kernel.org>
Date: Mon, 19 Jun 2023 09:01:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Content-Language: en-US
To: Yunlei He <heyunlei@oppo.com>, jaegeuk@kernel.org
References: <20230613065135.3517335-1-heyunlei@oppo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230613065135.3517335-1-heyunlei@oppo.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/6/13 14:51, Yunlei He wrote: > This patch count mmap
 write io more accurately and remove > redundant PageUptodate judgement in
 f2fs_vm_page_mkwrite. Yunlei, What about separating this patch: - remove
 unneeded uptodate check/set. - fix incorrect PageMappedToDisk check and goto
 logic. Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qB3Gl-0006hd-Gf
Subject: Re: [f2fs-dev] [PATCH] f2fs: count mmap write io more accurately
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

On 2023/6/13 14:51, Yunlei He wrote:
> This patch count mmap write io more accurately and remove
> redundant PageUptodate judgement in f2fs_vm_page_mkwrite.

Yunlei,

What about separating this patch:
- remove unneeded uptodate check/set.
- fix incorrect PageMappedToDisk check and goto logic.

Thanks,

> 
> Signed-off-by: Yunlei He <heyunlei@oppo.com>
> ---
>   fs/f2fs/file.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 4dd4e2bd000a..34a6177c64a4 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -149,14 +149,12 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
>                  zero_user_segment(page, offset, PAGE_SIZE);
>          }
>          set_page_dirty(page);
> -       if (!PageUptodate(page))
> -               SetPageUptodate(page);
> 
> +out_sem:
>          f2fs_update_iostat(sbi, inode, APP_MAPPED_IO, F2FS_BLKSIZE);
>          f2fs_update_time(sbi, REQ_TIME);
> 
>          trace_f2fs_vm_page_mkwrite(page, DATA);
> -out_sem:
>          filemap_invalidate_unlock_shared(inode->i_mapping);
> 
>          sb_end_pagefault(inode->i_sb);
> --


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
