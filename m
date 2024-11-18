Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCEC9D179D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 18 Nov 2024 19:08:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tD6AQ-0001CE-VP;
	Mon, 18 Nov 2024 18:08:07 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1tD6AP-0001C6-Sk
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 18 Nov 2024 18:08:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5QiR+TupzqXNhrLFmV2P044xlgRqINzGnNHyI5Vy3sE=; b=QBipcPvb1163ZjxSJGw6Fd1Faw
 fQxkIJGfzMHm3M04PnylvDauVDH00ixTbRJ2VeTxxW3iMEhwpA3YWelNZ6Ti7VIiDs/SojH0i6dcB
 P5xSBSIFsgGuWOFeuW/rEDZs+VZ8wwU9J1BHz4474MC4c7XxPvwaZOpZaeqtp1774zmo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5QiR+TupzqXNhrLFmV2P044xlgRqINzGnNHyI5Vy3sE=; b=XvGWOu07+b9Bw17W0Uzq+zZDcK
 TAiYLX2EQwMLM4nJRNaKNzb4EpXy69hFnMLIaQUDjyFjFaDE88yCCLKoIgFWiBtKKBslvlSRWvSBp
 IxBR04zpfkgiEB76bE8CRVNhjIoVNepQJyTEdim8uV2AXL7DEos2z6YvL5sGATk7AGGM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tD6AP-0005Z8-TI for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 18 Nov 2024 18:08:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3E2675C5C17
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 18 Nov 2024 18:07:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D73F2C4CECC;
 Mon, 18 Nov 2024 18:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731953280;
 bh=XN8H4LzvUQloDuTy+U3peh1JPPNd1rvnX1i2XbCnODw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fvrRXRXm1PaVd7qlQfzj3ZHm+iQnSJTNNW/ir0rL4WwYMK0nH7vZ/rz1wm+Tteuw9
 2zZzyuoZatN325HZsyVMgD0tc4nS1DrZodE1Cii85oceol/X8hrg0iM6L8AbC89o1w
 BRWUARzZhRbXeAhL9MtR/3acf8yVbZXiGpeTYhzN+FL57bAYLjedP/OlXg7ineiJ9c
 Qt09+CgBVUDmh+jJpYNyELh4J0+JGb+nAoQyYJw1/khNbMV992RzP2/JDG/njcs6pj
 /m99tx5P/cZScdXpbzajiyHnTimBSovYH0Tt4IZtqIc8qo38FhqITFz0kxPRAxTLXe
 XUz8L2lwZGTXA==
Date: Mon, 18 Nov 2024 18:07:58 +0000
To: Chao Yu <chao@kernel.org>
Message-ID: <ZzuCfgTp9m1eqIGa@google.com>
References: <20241108012557.572782-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241108012557.572782-1-chao@kernel.org>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: I applied this with the below change to avoid build failure.
 --- a/fs/f2fs/super.c +++ b/fs/f2fs/super.c @@ -3336,7 +3336,7 @@ loff_t
 max_file_blocks(struct inode *inode) * fit within U32_MAX + 1 data units.
 */ Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tD6AP-0005Z8-TI
Subject: Re: [f2fs-dev] [PATCH 1/4] f2fs: fix to do cast in
 F2FS_{BLK_TO_BYTES, BTYES_TO_BLK} to avoid overflow
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

I applied this with the below change to avoid build failure.

--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3336,7 +3336,7 @@ loff_t max_file_blocks(struct inode *inode)
         * fit within U32_MAX + 1 data units.
         */

-       result = min(result, F2FS_BYTES_TO_BLK(((loff_t)U32_MAX + 1) * 4096));
+       result = umin(result, F2FS_BYTES_TO_BLK(((loff_t)U32_MAX + 1) * 4096));

        return result;
 }

On 11/08, Chao Yu wrote:
> It missed to cast variable to unsigned long long type before
> bit shift, which will cause overflow, fix it.
> 
> Fixes: f7ef9b83b583 ("f2fs: introduce macros to convert bytes and blocks in f2fs")
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  include/linux/f2fs_fs.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
> index b0b821edfd97..3b2ad444c002 100644
> --- a/include/linux/f2fs_fs.h
> +++ b/include/linux/f2fs_fs.h
> @@ -24,10 +24,10 @@
>  #define NEW_ADDR		((block_t)-1)	/* used as block_t addresses */
>  #define COMPRESS_ADDR		((block_t)-2)	/* used as compressed data flag */
>  
> -#define F2FS_BYTES_TO_BLK(bytes)	((bytes) >> F2FS_BLKSIZE_BITS)
> -#define F2FS_BLK_TO_BYTES(blk)		((blk) << F2FS_BLKSIZE_BITS)
> +#define F2FS_BYTES_TO_BLK(bytes)	((unsigned long long)(bytes) >> F2FS_BLKSIZE_BITS)
> +#define F2FS_BLK_TO_BYTES(blk)		((unsigned long long)(blk) << F2FS_BLKSIZE_BITS)
>  #define F2FS_BLK_END_BYTES(blk)		(F2FS_BLK_TO_BYTES(blk + 1) - 1)
> -#define F2FS_BLK_ALIGN(x)			(F2FS_BYTES_TO_BLK((x) + F2FS_BLKSIZE - 1))
> +#define F2FS_BLK_ALIGN(x)		(F2FS_BYTES_TO_BLK((x) + F2FS_BLKSIZE - 1))
>  
>  /* 0, 1(node nid), 2(meta nid) are reserved node id */
>  #define F2FS_RESERVED_NODE_NUM		3
> -- 
> 2.40.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
