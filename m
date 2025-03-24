Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DD64FA6DFA1
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Mar 2025 17:29:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1twkfa-0008Bx-3q;
	Mon, 24 Mar 2025 16:28:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1twkfY-0008Bl-F7
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Mar 2025 16:28:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+nr9aOzFQ3ynLvFpzx7RWMEer2cW7V5PNG1ynlNGP7s=; b=m2/h6uusxW4Z/l+L0m2eHPlPCv
 36ANOvoUARqgSpnUFIzFYam7L4UaPuW/MdXNz7uQTEFcV+hFCKIJxJGahGsbtUbv/h93u3k+YILoU
 jHfoMAhoQqwxpF5YDHrBG+czcUywEIhOlV5Dlfc5J4Pu5xK5BAqYZFrgOQMkY2XkgHVI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+nr9aOzFQ3ynLvFpzx7RWMEer2cW7V5PNG1ynlNGP7s=; b=Iacaguwl4IbpfEczfhMmYBOUHb
 cYMbOCFIIGxB6hOkehX9bZz8g4+pKbmuukIOpiHpVyjl1pzuYWO2aet60NvQsszrrByO5jUc40bKq
 +FJKMo22HwVrrRCk4voNoPo6Y76RlyB/WU1Az7+UgZDu0dOx8EthiF+EIIKD4b+XM/6s=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1twkfY-0001or-Iy for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Mar 2025 16:28:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 14D3D6157F;
 Mon, 24 Mar 2025 16:28:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6923EC4CEDD;
 Mon, 24 Mar 2025 16:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742833725;
 bh=aqrTfLY/lrY8xTfxHcwLv+bhNXJYhqwQeO1RoOh0ZDY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E3Bn6TkTgcdqsU5DfZ1FRKhsgAYnp8/9A7XfFyKdWmMGez/mlI7wWkmtaEAiEa406
 OxbpuTpu8/eO6hAqUAEssea9Us64zqmj9piH4jV8YvUEWOHg1rZjIBonvIZa6EMYV2
 K/KMKTecVCjLY7/odCyHUB/PC66cwzNG6FhHE9KzRfbIY7ZX8erLfMBRZ8DNVs8X+O
 bHA7TJtEuyvNh8Lb3Y0rZk5Qz+bD1xhCSkVMlLnOCz26THmDaxbYn3/o7q6+62fr4e
 H8DDtT0WYLgQvMIFtiP1KeqaurtxyMa1kK1dH4C5/tJiHwxtRRo7ROIx7scC4zTLAO
 /e4mA4eXi6+Jw==
Date: Mon, 24 Mar 2025 16:28:43 +0000
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <Z-GIOxj1reO87F6E@google.com>
References: <20250321213328.1170234-1-daeho43@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250321213328.1170234-1-daeho43@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Do we still need this patch? On 03/21, Daeho Jeong wrote:
 > From: Daeho Jeong <daehojeong@google.com> > > support a file truncation
 to zero size for device aliasing files. > > Signed-off-by: Daeho Jeong
 <daehojeong@google.com> > [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in sa-accredit.habeas.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1twkfY-0001or-Iy
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: support zero sized file truncate
 for device aliasing files
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Do we still need this patch?

On 03/21, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> support a file truncation to zero size for device aliasing files.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
> v2: make the extent length zero
> ---
>  fs/f2fs/file.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index f92a9fba9991..69952f208086 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -775,6 +775,11 @@ int f2fs_do_truncate_blocks(struct inode *inode, u64 from, bool lock)
>  		f2fs_update_time(sbi, REQ_TIME);
>  
>  		f2fs_put_page(ipage, 1);
> +
> +		write_lock(&et->lock);
> +		et->largest.len = 0;
> +		write_unlock(&et->lock);
> +
>  		goto out;
>  	}
>  
> @@ -1036,7 +1041,7 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
>  
>  	if ((attr->ia_valid & ATTR_SIZE)) {
>  		if (!f2fs_is_compress_backend_ready(inode) ||
> -				IS_DEVICE_ALIASING(inode))
> +				(IS_DEVICE_ALIASING(inode) && attr->ia_size))
>  			return -EOPNOTSUPP;
>  		if (is_inode_flag_set(inode, FI_COMPRESS_RELEASED) &&
>  			!IS_ALIGNED(attr->ia_size,
> -- 
> 2.49.0.395.g12beb8f557-goog
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
