Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 809753C7DCE
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Jul 2021 07:05:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m3X4o-00050V-OZ; Wed, 14 Jul 2021 05:04:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <djwong@kernel.org>) id 1m3X4n-00050N-3z
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 14 Jul 2021 05:04:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ep25NXGaKy7iLmv/hLzAs5+NAintJ3fq7jB/7+yc6ZY=; b=I1d14qKQTCIxIM3JIU3TfssOUd
 +CdavaU/B/NE5gwRzdbUEPXjsVzcZWWpF0NrpaxwTcrPAmk9jIQInFvRYymP6Y/UgTG7X0pFmcWJU
 /ax25kJ2FdOo0JvU4MF/l5rBhLrYWrMtnYNuWtZlQmXUbwSOwxnCZMK68OVnMWVs1wow=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ep25NXGaKy7iLmv/hLzAs5+NAintJ3fq7jB/7+yc6ZY=; b=GfYzfao2pWbo9hGd0BFYm+nGG9
 ftJ5/ITVU83DszQMka+kOyasKNindq+c3l2h15tgTMOJjuLCeiLZDY5+mP8//fbVGRFPbvFAvPGwB
 dj5ykw6jeySXqg50PKNEmVSsaEx35QZUh24iITI0CvVFoMO1azLwzMdeDWRlnPe8XYKc=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m3X4h-007fFM-AD
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 14 Jul 2021 05:04:53 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 016B960FD8;
 Wed, 14 Jul 2021 05:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626239077;
 bh=Jc1sNtDQLolCUqZGQica4040YhI273wmJsvNWUazVMU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UWnd/YzekvcZgciRPDO2VDGc5jefYAa1w8p3Vjj4SV7C/lPk0nz0bWt6/xjz0r+LN
 /vsMehsZND0VXQBUpUt+yqOmVnh0nJnnv+5jeOHtFoErWyN5uO26GhuWQGXnZYFNtx
 rZxXFverfex9HCcHFguzDqBLrC7mc41WwHaKY51njN+ELp1nH80BNjSPGnY7xW1Wh8
 WXJ/XCZ0IShzVBu2YPhe/z0Ytdvm3PViCRMF7DWftS9pUMgBxyyzamzDc1wq5GelGt
 I8To5FlidFdvSjJH5ie48P6mPDmR8ggS4bVkzvnSXWnzw4y1TT5TD1a3/A5cRrodnt
 8Gl0faYQvuXbQ==
Date: Tue, 13 Jul 2021 22:04:36 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Wang Shilong <wangshilong1991@gmail.com>
Message-ID: <20210714050436.GH22402@magnolia>
References: <20210710143959.58077-1-wangshilong1991@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210710143959.58077-1-wangshilong1991@gmail.com>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: ddn.com]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1m3X4h-007fFM-AD
Subject: Re: [f2fs-dev] [PATCH v4] fs: forbid invalid project ID
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
Cc: linux-fsdevel@vger.kernel.org, linux-xfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, Wang Shilong <wshilong@ddn.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sat, Jul 10, 2021 at 10:39:59PM +0800, Wang Shilong wrote:
> From: Wang Shilong <wshilong@ddn.com>
> 
> fileattr_set_prepare() should check if project ID
> is valid, otherwise dqget() will return NULL for
> such project ID quota.
> 
> Signed-off-by: Wang Shilong <wshilong@ddn.com>
> ---
> v3->v3:
> only check project Id if caller is allowed
> to change and being changed.
> 
> v2->v3: move check before @fsx_projid is accessed
> and use make_kprojid() helper.
> 
> v1->v2: try to fix in the VFS
>  fs/ioctl.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/fs/ioctl.c b/fs/ioctl.c
> index 1e2204fa9963..d4fabb5421cd 100644
> --- a/fs/ioctl.c
> +++ b/fs/ioctl.c
> @@ -817,6 +817,14 @@ static int fileattr_set_prepare(struct inode *inode,
>  		if ((old_ma->fsx_xflags ^ fa->fsx_xflags) &
>  				FS_XFLAG_PROJINHERIT)
>  			return -EINVAL;
> +	} else {
> +		/*
> +		 * Caller is allowed to change the project ID. If it is being
> +		 * changed, make sure that the new value is valid.
> +		 */
> +		if (old_ma->fsx_projid != fa->fsx_projid &&
> +		    !projid_valid(make_kprojid(&init_user_ns, fa->fsx_projid)))
> +			return -EINVAL;

Hmm, for XFS this is sort of a userspace-breaking change in the sense
that (technically) we've never rejected -1 before.  xfs_quota won't have
anything to do with that, and (assuming I read the helper/macro
gooeyness correctly) the vfs quota code won't either, so

Reviewed-by: Darrick J. Wong <djwong@kernel.org>

--D

>  	}
>  
>  	/* Check extent size hints. */
> -- 
> 2.27.0
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
