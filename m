Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B76D422E071
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 26 Jul 2020 17:12:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jziKE-00007w-2n; Sun, 26 Jul 2020 15:12:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jziKC-00007n-70
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 26 Jul 2020 15:12:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cVKzH1EwDavYfwlD2i9hJxghecpWTzlkCIYT3nXSY6s=; b=BTbBrNWkbEAG2MeyQQh/QVqFOt
 cICBENKqrk/rt59AETnBvXYug8ecLtUGUS+hU7K81FkU6ZJLxIffD824tdUMn+KYMe0avKFTjHT0/
 HxMV9piJ9/luWf8vySdEL5vOcXYte2/GdORVRVpehEP3QPnx+yXPFmfPxK/kpfDaVUEI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cVKzH1EwDavYfwlD2i9hJxghecpWTzlkCIYT3nXSY6s=; b=GGaiGlQ97m4YJPaQ/wPrPYCrb5
 MMNOzd+3tAPHrJW873DcjsUPt46REvny1kwYoO4qKeWUuOaR2Xo+q1PxhBCSDsSPJFcWtD/LniJAx
 kOizep2mTODStbkj4aaCUd7wq45b6UqpgD4CMtrZESexqsyETpAIb4y52ujnkIRrscL0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jziKA-009kxu-TH
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 26 Jul 2020 15:12:28 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9F5502065F;
 Sun, 26 Jul 2020 15:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595776340;
 bh=qAhUKt2CgszGrqPhLvc38WFtPuJ/AjtFGUBH0TV437k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=wXdntH6q3QBijFsnmW/xoZS+yT4JpLcq8oZ1M8B9pOYq+kXx1UHq0OOHqs6rX5gck
 o+Sb+CstF1+pf382gnQFi+24ru2ptdS26DyA+LQIyDcmQydqh0u93iNlURn8tsqmoR
 UAWPLRpS5cz0IUrD+zw0s/ZBZMdLvncOpuqQEVbI=
Date: Sun, 26 Jul 2020 08:12:20 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Jack Qiu <jack.qiu@huawei.com>
Message-ID: <20200726151220.GA2155900@google.com>
References: <20200725031340.21934-1-jack.qiu@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200725031340.21934-1-jack.qiu@huawei.com>
X-Spam-Score: -0.3 (/)
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jziKA-009kxu-TH
Subject: Re: [f2fs-dev] [PATCH] f2fs: use macro instead of f2fs verity
 version
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 07/25, Jack Qiu wrote:
> Because fsverity_descriptor_location.version is constant,
> so use macro for better reading.
> 
> Signed-off-by: Jack Qiu <jack.qiu@huawei.com>
> ---
>  fs/f2fs/verity.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/verity.c b/fs/f2fs/verity.c
> index 865c9fb774fb..5be8a5790907 100644
> --- a/fs/f2fs/verity.c
> +++ b/fs/f2fs/verity.c
> @@ -29,6 +29,8 @@
>  #include "f2fs.h"
>  #include "xattr.h"
> 
> +#define F2FS_VERIFY_VER	cpu_to_le32(1)

Should be like this?

#define F2FS_VERITY_VER		1

And, use cpu_to_le32(F2FS_VERITY_VER) below?

> +
>  static inline loff_t f2fs_verity_metadata_pos(const struct inode *inode)
>  {
>  	return round_up(inode->i_size, 65536);
> @@ -152,7 +154,7 @@ static int f2fs_end_enable_verity(struct file *filp, const void *desc,
>  	struct inode *inode = file_inode(filp);
>  	u64 desc_pos = f2fs_verity_metadata_pos(inode) + merkle_tree_size;
>  	struct fsverity_descriptor_location dloc = {
> -		.version = cpu_to_le32(1),
> +		.version = F2FS_VERIFY_VER,
>  		.size = cpu_to_le32(desc_size),
>  		.pos = cpu_to_le64(desc_pos),
>  	};
> @@ -199,7 +201,7 @@ static int f2fs_get_verity_descriptor(struct inode *inode, void *buf,
>  			    F2FS_XATTR_NAME_VERITY, &dloc, sizeof(dloc), NULL);
>  	if (res < 0 && res != -ERANGE)
>  		return res;
> -	if (res != sizeof(dloc) || dloc.version != cpu_to_le32(1)) {
> +	if (res != sizeof(dloc) || dloc.version != F2FS_VERIFY_VER) {
>  		f2fs_warn(F2FS_I_SB(inode), "unknown verity xattr format");
>  		return -EINVAL;
>  	}
> --
> 2.17.1
> 
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
