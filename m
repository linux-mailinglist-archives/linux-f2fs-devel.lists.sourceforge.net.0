Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DA0705D50
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 May 2023 04:31:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pz6wc-0001eW-Ll;
	Wed, 17 May 2023 02:31:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pz6wb-0001eQ-OV
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 May 2023 02:31:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 Subject:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HPZx4nJ+q7FUcC8sCwuGCWkOXLIFkSBYHgQRF2FXg34=; b=nHOCuXTq4X+y5O4H8OiYtG4OfA
 sByY5EAZU9rnEL+482DV0oOK8j9Y/Gjtny8yasSN+kLQk6VkwZnogfSormiXyF7VILj+q+ZVEZ2mF
 A4cRte03YItamWmghh4eVpU1PtUanMfbBiyhdkOsjevG4ecYJsSokqKSfPYlguYQAT7g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:From:
 References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HPZx4nJ+q7FUcC8sCwuGCWkOXLIFkSBYHgQRF2FXg34=; b=Y23NoJll6AAXy/62OOUDhFQqsV
 mNP87stwgZvXxPPiypyrGC1YH47wfqI1/8QyeQQox72tWFsZuHkHsmANUgSOm6jH33y420sRTOqko
 wu/wXORzXFkF+9/2JkP22ql8FCAlOuuxDecm3PaW5tvf0x7G84fENtbRUAKz/lLOW9Kc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pz6wX-00AP3S-OD for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 May 2023 02:31:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5C087640DC;
 Wed, 17 May 2023 02:31:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42D41C433EF;
 Wed, 17 May 2023 02:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684290663;
 bh=U3hlYielRl+Zlfry5z+DIvZqfK56E0/XCd0A2B3lgVQ=;
 h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
 b=dspg+YXHIiktfnthq/TguCfKe+h6PuxcJxeqL71F/VnkX1rSCaOqJstrg0WDviutJ
 HiD5KnnD1cZszmksYylYXQn6VkvWwhm37EMD4kC4OtYqm1MORQ9vI4COcymY+r9r+Y
 uDZuF0yYThajzSZnv5jUatXRVEuCbXouiOGgEI1Z3Dgm3D2yBQH3nhrxZCjV9wFtpg
 Tf+RAqJTt35AQxDIhI1vBNvSTJBVqMggqCnH04M7ftGKeoIBlpET2pXpYxDkzmfXva
 rtLUoEldKFmuwMw+MQ88rCo+qnPYnxwDqS2IeFfta+kyPSR7Mm8VAw4lN/IC1pm4K+
 ebS4UiTfqlsLw==
Message-ID: <5f0218d5-f11d-92db-097a-1db76a142138@kernel.org>
Date: Wed, 17 May 2023 10:31:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20230511091308.10509-1-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230511091308.10509-1-frank.li@vivo.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/5/11 17:13, Yangtao Li wrote: > When an EFSCORRUPTED
 error occurs in f2fs, report the error to > userspace monitoring tools. >
 > Signed-off-by: Yangtao Li <frank.li@vivo.com> > --- > fs/f2fs/s [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
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
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -2.7 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pz6wX-00AP3S-OD
Subject: Re: [f2fs-dev] [PATCH] f2fs: add fsnotify_sb_error() in
 f2fs_save_errors
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

On 2023/5/11 17:13, Yangtao Li wrote:
> When an EFSCORRUPTED error occurs in f2fs, report the error to
> userspace monitoring tools.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>   fs/f2fs/super.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 51812f459581..42d5aa504afe 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -28,6 +28,7 @@
>   #include <linux/part_stat.h>
>   #include <linux/zstd.h>
>   #include <linux/lz4.h>
> +#include <linux/fsnotify.h>
>   
>   #include "f2fs.h"
>   #include "node.h"
> @@ -4000,6 +4001,8 @@ void f2fs_save_errors(struct f2fs_sb_info *sbi, unsigned char flag)
>   		sbi->error_dirty = true;
>   	}
>   	spin_unlock_irqrestore(&sbi->error_lock, flags);
> +
> +	fsnotify_sb_error(sbi->sb, NULL, EFSCORRUPTED);

Can we call this function in irq context?

- f2fs_decompress_cluster
  - f2fs_save_errors

Thanks,

>   }
>   
>   static bool f2fs_update_errors(struct f2fs_sb_info *sbi)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
