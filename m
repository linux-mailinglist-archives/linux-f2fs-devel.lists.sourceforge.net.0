Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4D77082EC
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 18 May 2023 15:39:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pzdqr-0007qi-F3;
	Thu, 18 May 2023 13:39:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pzdqq-0007qc-1m
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 18 May 2023 13:39:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BUM0rVblzo4bAVFUT7ZjvuNN9nKjJdYfvdDqfMZuWU8=; b=S8KrmflmFuYtfJJ5KiGyz8UdSQ
 5gfeGrZ5uyElnn7wDxf9blQxLWlblaYcPK3gUlap3F4G+TBI6LZbKevuc4pVimFipHzS8CEX1gkpK
 BfwzhBSNY7jULQDYbgk3KGYhnti03qPtAZUjK9Oy5bPyVEeNvWoFWTINr6mLA0iobPJg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BUM0rVblzo4bAVFUT7ZjvuNN9nKjJdYfvdDqfMZuWU8=; b=STkNs8N5AkCRIWdUeA0HEZDqfw
 HSt5bJwxgCMJJzB6+OX8VOBuzzonjzP3K/JJ1qrZ/STeN5Zcd/Ddlkw0whMfN/NN66RQSj65IkHCt
 Yio533ljvf9ves3tGcro0z2RE81RV4w80t64LDD8UEExnRBpxAJc4GjKRiV6pdUyiyg8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pzdqp-00COZd-P0 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 18 May 2023 13:39:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 62E85618C7;
 Thu, 18 May 2023 13:39:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 575AFC433EF;
 Thu, 18 May 2023 13:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684417161;
 bh=qYe+3DROGkjj/5oU1L6ZT2u5C0Jhl8xxXUrGYkc99ww=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=J9bPuSFchkcaFF5zuJ/KMraC5Afy+cM4Q/LclQ8LDkYacDcJFkLIxoqKGePCrrf/D
 LPx8pcPmyIEFdIyx7YkAX1tjPq1zWgr7ytoa4dekv25v5ydfR7TeThd4T3Oy6clVXt
 PxscEYykFGcqDIB6zh6LYpInvjD/JhJNgL471F2kz6nM1r3fUZXi+FzazPNqRo4q7E
 wnUqiCxS+/QTAgZp9C13yBUdjSibTghpubIFd8jWKeIIJpCGZCZCqaS8aVJ3hK7lJD
 T0Ih3Feh8fzxnJj8iqOPRspXclFr+hvY5Qx0Wx3v5Una0AdIA3AUVFTK5wt3Y96Yyx
 46vtNtf9AoUIA==
Message-ID: <69687629-0dbc-6b90-f231-7624e72b1801@kernel.org>
Date: Thu, 18 May 2023 21:39:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Chunhai Guo <guochunhai@vivo.com>
References: <20230518122621.62041-1-guochunhai@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230518122621.62041-1-guochunhai@vivo.com>
X-Spam-Score: -7.8 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/5/18 20:26, Chunhai Guo wrote: > find_fsync_inode()
 detect the looped node chain by comparing the loop > counter with free blocks.
 While it may take tens of seconds to quit when > the free blo [...] 
 Content analysis details:   (-7.8 points, 6.0 required)
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
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -2.5 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pzdqp-00COZd-P0
Subject: Re: [f2fs-dev] [PATCH v5] fsck.f2fs: Detect and fix looped node
 chain efficiently
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 frank.li@vivo.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/5/18 20:26, Chunhai Guo wrote:
> find_fsync_inode() detect the looped node chain by comparing the loop
> counter with free blocks. While it may take tens of seconds to quit when
> the free blocks are large enough. We can use Floyd's cycle detection
> algorithm to make the detection more efficient, and fix the issue by
> filling a NULL address in the last node of the chain.
> 
> Below is the log we encounter on a 256GB UFS storage and it takes about
> 25 seconds to detect looped node chain. After changing the algorithm, it
> takes about 20ms to finish the same job.
> 
>      [   10.822904] fsck.f2fs: Info: version timestamp cur: 17, prev: 430
>      [   10.822949] fsck.f2fs: [update_superblock: 762] Info: Done to
> update superblock
>      [   10.822953] fsck.f2fs: Info: superblock features = 1499 :
> encrypt verity extra_attr project_quota quota_ino casefold
>      [   10.822956] fsck.f2fs: Info: superblock encrypt level = 0, salt =
> 00000000000000000000000000000000
>      [   10.822960] fsck.f2fs: Info: total FS sectors = 59249811 (231444
> MB)
>      [   35.852827] fsck.f2fs:	detect looped node chain,
> blkaddr:1114802, next:1114803
>      [   35.852842] fsck.f2fs: [f2fs_do_mount:3846] record_fsync_data
> failed
>      [   35.856106] fsck.f2fs: fsck.f2fs terminated by exit(255)
> 
> Signed-off-by: Chunhai Guo <guochunhai@vivo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
