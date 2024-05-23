Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA718CD956
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 May 2024 19:45:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sACUr-0006Fr-7X;
	Thu, 23 May 2024 17:44:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1sACUq-0006Fl-HY
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 May 2024 17:44:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IdWqEHI2alFlhItRptBQJsiOkDEQN3CoPVUqIGbkZnM=; b=bkYaF1XtxT9SSAr68siSqn71zD
 icil9t/OrUvm3oZCGZflxITLY/p5TAFNKv1LuiGOBjk4HFptkrzQHPQ/mD3QYPZXDT2eGO2aZiarD
 gZdmYiHJzYy+w7B4AtpFTNlA3tMIYixfUoDwD9sWXdavgK3Y4c/HLUS5qjAe903Ab1P0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IdWqEHI2alFlhItRptBQJsiOkDEQN3CoPVUqIGbkZnM=; b=L0NtmuZ8DGxCDWfzsuCXN+1sYm
 e6pt7SDRWNE74ElxX9MRk4qINsVhElmHFNJLKlXd40KKRIZmSWoWZFBCRKMYJ/YXOONnMdVvBK+ra
 LEO1u+uFBw+CT+haCpjySg5HUbNYb5adbO2+OiZUljqd/LIRiNWaXoBIacV4lQy6YkEw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sACUq-0008HS-0l for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 May 2024 17:44:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E210162827;
 Thu, 23 May 2024 17:44:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5194BC2BD10;
 Thu, 23 May 2024 17:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716486284;
 bh=LD8LXQcK/BNxRflH3MeIZ9S6NSTfxOkxr/aQw+mnTZk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oe4SNo2xHmDpKGADKpL2CGH3AEolrW7Lvs/SsQ+/RxfnPxob7T11KP0TFeCb3Lqhs
 lMp/mgKn1oMztfc2LDRVv+1cxGqR3jWQiD2pKtZmx1xlnb1Ct/SBctZtkwucEKRGH8
 jzGA9g+ekw1CKQcHt1XLogHxgNPtyDCPKQ8JBsgM23XGO9l6FWofBCEk8ktVo6ZqUx
 TgSKyFgGIYlHRH6pVaSRJaBcbjhwUyWLA1EawZiB9QY7XwVcttlLJUB9KL6GkfLjFc
 r1pHzKjuTT7WeB38N36/lMVMBM6KHOE1pHc12wRnBMk7O7hQ9Bpigr23rr1ej0afvx
 w5w/SnYI1ZrNA==
Date: Thu, 23 May 2024 17:44:42 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-stable@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <Zk-AilUqViUaLj8b@google.com>
References: <20240520220208.1596727-1-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240520220208.1596727-1-jaegeuk@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Greg, Could you please consider to cherry-pick this patch
 in stable-6.9, since there are many users suffering from unnecessary fsck
 runs during boot? You can get this from Linus's tree by (b864ddb57eb0 "f2fs:
 fix false alarm on invalid block address") 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sACUq-0008HS-0l
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix false alarm on invalid block
 address
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
Cc: stable@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Greg,

Could you please consider to cherry-pick this patch in stable-6.9, since
there are many users suffering from unnecessary fsck runs during boot?

You can get this from Linus's tree by
(b864ddb57eb0 "f2fs: fix false alarm on invalid block address")

Thanks,

On 05/20, Jaegeuk Kim wrote:
> f2fs_ra_meta_pages can try to read ahead on invalid block address which is
> not the corruption case.
> 
> Cc: <stable@kernel.org> # v6.9+
> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=218770
> Fixes: 31f85ccc84b8 ("f2fs: unify the error handling of f2fs_is_valid_blkaddr")
> Reviewed-by: Chao Yu <chao@kernel.org>
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  fs/f2fs/checkpoint.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> index 5d05a413f451..55d444bec5c0 100644
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@ -179,22 +179,22 @@ static bool __f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
>  		break;
>  	case META_SIT:
>  		if (unlikely(blkaddr >= SIT_BLK_CNT(sbi)))
> -			goto err;
> +			goto check_only;
>  		break;
>  	case META_SSA:
>  		if (unlikely(blkaddr >= MAIN_BLKADDR(sbi) ||
>  			blkaddr < SM_I(sbi)->ssa_blkaddr))
> -			goto err;
> +			goto check_only;
>  		break;
>  	case META_CP:
>  		if (unlikely(blkaddr >= SIT_I(sbi)->sit_base_addr ||
>  			blkaddr < __start_cp_addr(sbi)))
> -			goto err;
> +			goto check_only;
>  		break;
>  	case META_POR:
>  		if (unlikely(blkaddr >= MAX_BLKADDR(sbi) ||
>  			blkaddr < MAIN_BLKADDR(sbi)))
> -			goto err;
> +			goto check_only;
>  		break;
>  	case DATA_GENERIC:
>  	case DATA_GENERIC_ENHANCE:
> @@ -228,6 +228,7 @@ static bool __f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
>  	return true;
>  err:
>  	f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
> +check_only:
>  	return false;
>  }
>  
> -- 
> 2.45.0.rc1.225.g2a3ae87e7f-goog


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
