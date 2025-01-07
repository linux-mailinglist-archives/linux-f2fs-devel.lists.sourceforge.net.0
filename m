Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5E0A04368
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  7 Jan 2025 15:55:00 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tVAyq-0008HH-5H;
	Tue, 07 Jan 2025 14:54:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tVAyo-0008H6-Mj
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 07 Jan 2025 14:54:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 Cc:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dgJe7omJgWVFwl28Lszxjnsx0X+4qvmDBYj/0WLkOyY=; b=Qr29nE6iaXAD08wZ8E2IoHjvYu
 BWtFtgr+GgNDkX1VShw6ISAxIoWMIFKbcmweU+mKsfrcBzVN4XA38xH7pk6FDqfpZweLJUk8TT4+U
 jYWcI/x/U0Q0aPKLqfu2DQa7jk1rS4RgYinq6X28+prPZTz9BordzURFtjWuLssLTNtw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Cc:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dgJe7omJgWVFwl28Lszxjnsx0X+4qvmDBYj/0WLkOyY=; b=PZY7sxv4jnoiNjBOVqNFrCiMyG
 0oWfccGlF7qB96LR4Hs/h+MVifug3jxKYHEK/lVAQrqj6QdvhXPQ6B0ZQZo/cCAVEpceWABsEh/w0
 vMS1zpWrSPmmd40pf93/7pnkgqUpa5MlNDMtm5smRn2VtGo35jm6e1MFZsQyBF9wk9GE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tVAyn-0005Sc-JK for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 07 Jan 2025 14:54:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0BD7F5C6355
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  7 Jan 2025 14:53:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D87EFC4CED6;
 Tue,  7 Jan 2025 14:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736261678;
 bh=4qDGKot4+n+hmLv0MOmy/gCToZuwpDeb4hHUjQcu/0A=;
 h=Date:Subject:To:References:From:Cc:In-Reply-To:From;
 b=kqQCpQmGLsvQSR/HC9Oz2TpSQdOMHOnnZ85XZRpIs6Id1l0EmJ+vwGKUealPi//XB
 GpkMstvUkECm6e4bXyUqPkcCueGD+tbsXeKvy2qM/SQo+ddvSwNq4jdWpMsL7xVowB
 +IfCI5zMjSTlhdONJ+nN1cMP9bpA2XnxGWJHWWkpeRgCmXDSMD54eM3Bs/aGvlQd9/
 iHnapege6q6Y8w8hNCT/CZuLXOq38n1is5mVNAz0C8O2KyVhwNDxXsqRgiil3jB7zH
 mUZQCFgIo8ZReO6ZCt7vKX74mOVEUzxmpcKS9ZO0WNJCNcSpnickQTzB2wI9wk6N/9
 IElP4IqiwuiwA==
Message-ID: <86062930-7a8d-40c5-bbe5-b5bd62fc04ec@kernel.org>
Date: Tue, 7 Jan 2025 22:54:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20250107023248.3702924-1-jaegeuk@kernel.org>
Content-Language: en-US
In-Reply-To: <20250107023248.3702924-1-jaegeuk@kernel.org>
X-Spam-Score: -5.6 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025/1/7 10:32, Jaegeuk Kim via Linux-f2fs-devel wrote:
 > This patch should avoid the below warning which does not corrupt the
 metadata
 > tho. > > [ 51.508120][ T253] F2FS-fs (dm-59): access invali [...] 
 Content analysis details:   (-5.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tVAyn-0005Sc-JK
Subject: Re: [f2fs-dev] [PATCH] f2fs: don't call block truncation for
 aliased file
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2025/1/7 10:32, Jaegeuk Kim via Linux-f2fs-devel wrote:
> This patch should avoid the below warning which does not corrupt the metadata
> tho.
> 
> [   51.508120][  T253] F2FS-fs (dm-59): access invalid blkaddr:36
> [   51.508156][  T253]  __f2fs_is_valid_blkaddr+0x330/0x384
> [   51.508162][  T253]  f2fs_is_valid_blkaddr_raw+0x10/0x24
> [   51.508163][  T253]  f2fs_truncate_data_blocks_range+0x1ec/0x438
> [   51.508177][  T253]  f2fs_remove_inode_page+0x8c/0x148
> [   51.508194][  T253]  f2fs_evict_inode+0x230/0x76c
> 
> Fixes: 128d333f0dff ("f2fs: introduce device aliasing file")
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>   fs/f2fs/node.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> index c04ee1a7ce57..06313e1eb884 100644
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -1274,6 +1274,12 @@ int f2fs_remove_inode_page(struct inode *inode)
>   		return err;
>   	}
>   
> +	/* The aliase file must be truncated successfully. */
> +	if (unlikely(IS_DEVICE_ALIASING(inode))) {
> +		f2fs_put_dnode(&dn);
> +		return 0;

Do we need to keep calling truncate_node() for device alias inode in 
f2fs_remove_inode_page()?

Thanks,

> +	}
> +
>   	/* remove potential inline_data blocks */
>   	if (S_ISREG(inode->i_mode) || S_ISDIR(inode->i_mode) ||
>   				S_ISLNK(inode->i_mode))


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
