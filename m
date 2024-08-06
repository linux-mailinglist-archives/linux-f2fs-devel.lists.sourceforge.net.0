Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BAFC9487AC
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 Aug 2024 04:44:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sbAB0-00028P-CN;
	Tue, 06 Aug 2024 02:43:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1sbAAz-00028J-JF
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Aug 2024 02:43:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OLyj2RUlWkDLTR+NehXcDV2TwIH5G94v7zIOBSqpv2Y=; b=gBdUP6UN5dJAnH43f2Bezg66ao
 Pg9s90aHN2pi3yOvBCycLbtzpkCIapOXgOWPxAGg3n0RL8ljKbXzp3pPBfy5ujeX7z3ieERKzNTgp
 dR+31hU+2LeIO2ewqUdMUnPtTLzgkHpJUgxjvG9FOeZnVGnN8Ey76/h/FdvEIgtNzO+U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OLyj2RUlWkDLTR+NehXcDV2TwIH5G94v7zIOBSqpv2Y=; b=bYE42t/zGz7+gExqju7IThSklt
 TixE8l75xjjeB8jpMHhr7yioOenvNNVjJxWfd1thxUiwvej/sOvbwS1kzzq0IGrteB6W0vyXMEwsQ
 VEipJlk+1monBqzDW2QTs8BKe2k/jNaIoaSqXOYv/848CSyMqQGSd3OiiFVxBHBXMwJ4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sbAAz-00065L-LW for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Aug 2024 02:43:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4310660E93
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  6 Aug 2024 02:43:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5B10C32782;
 Tue,  6 Aug 2024 02:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722912223;
 bh=1gQt/xGiNzbNxHjkcFls8MV62aqxPJqo4osSDIzjg5M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p4vt2xXgNp2e8HCJlCzpA1pTKzEmRd4zdAfLkKdxneYhNTihGUp6ix0Fh4D9eGF8P
 DmAAMpI71pzEVsnLUO1FTpkZbzGB+DH5r8EMe1JOuYkkC8+6vYmTBarjVJv1XRHtD4
 9Qu27mD1XlTueCmN93PCb96KgOPkLoBqlm4gP1gU/BWx4/h6N3F2fA0e8ltTX9D7Bn
 dJ0o2UrNf7MmSG19BtiAC7QJKqtQCg74AANwmJ+9BYOeTqm2oVghanSthBlzq9NIyc
 +8lQh70cFUn3Zp1rCRML2fgn1YTyooT+Mc7aiULXYgOIKRtDfnKylw4G5KLkzuRVXA
 1HM6nvYEcO9cw==
Date: Tue, 6 Aug 2024 02:43:41 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <ZrGN3ed4pN5Ii67m@google.com>
References: <20240801011337.3772536-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240801011337.3772536-1-chao@kernel.org>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 08/01,
 Chao Yu wrote: > We should always truncate pagecache
 while truncating on-disk data. > > Fixes: a46bebd502fe ("f2fs: synchronize
 atomic write aborts") > Signed-off-by: Chao Yu <chao@kernel.or [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sbAAz-00065L-LW
Subject: Re: [f2fs-dev] [PATCH v3 3/4] f2fs: atomic: fix to truncate
 pagecache before on-disk metadata truncation
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 08/01, Chao Yu wrote:
> We should always truncate pagecache while truncating on-disk data.
> 
> Fixes: a46bebd502fe ("f2fs: synchronize atomic write aborts")
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
> v3:
> - check dirty page before truncation
> - use invalidate_mapping_pages() instead of truncate_inode_pages()
> - set i_size to zero after truncation
>  fs/f2fs/file.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index ac61c88f7688..a316c21539d1 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -2199,11 +2199,17 @@ static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
>  		F2FS_I(fi->cow_inode)->atomic_inode = inode;
>  	} else {
>  		/* Reuse the already created COW inode */
> +		f2fs_bug_on(sbi, get_dirty_pages(fi->cow_inode));
> +
> +		invalidate_mapping_pages(fi->cow_inode->i_mapping, 0, -1);
> +
>  		ret = f2fs_do_truncate_blocks(fi->cow_inode, 0, true);
>  		if (ret) {
>  			f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
>  			goto out;
>  		}
> +
> +		i_size_write(fi->cow_inode, 0);

Do we really need this?

>  	}
>  
>  	f2fs_write_inode(inode, NULL);
> -- 
> 2.40.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
