Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C1F80DE0A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 Dec 2023 23:12:20 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rCoVW-00082J-Gs;
	Mon, 11 Dec 2023 22:12:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1rCoVV-00082D-Rz
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 11 Dec 2023 22:12:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oBSrVCQCpObZ3nSBRCX1NH4Upvr7ybS8muKBALBJZKQ=; b=Ij7j+KG7I9xRX6WYA1EYq+z1uZ
 khbdgCyPVpt8CXxcE3g2qfCcM58fBX9Tqwe1O+rowB/yvyAC4+NL86dFD2aJGzVK9FRHXqjP5LANe
 KpnLy1OuRBQI2PyYge0bNHCTgABTA/iY1Rf7TlRNm+qsdvWeM/ZpoNjr927vJeYWy/rM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oBSrVCQCpObZ3nSBRCX1NH4Upvr7ybS8muKBALBJZKQ=; b=iKpbDizXtYiOkoo1w+2lFKcqC0
 4c0bu8djNJS3aOv4rIBV4g2ZDPsBZSa5iQ7CR1580T5LkSC0shGARtoMl1AE3FzwbOC5MR0XkmJs0
 KqT8o8YbCDVZ0sFKrltBVCejDqKPU/NG3HcbTJiGTEO36zjvb3QHb/erl1ffodSmtr6M=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rCoVV-0005vo-CK for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 11 Dec 2023 22:12:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 8659FCE16B6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 11 Dec 2023 22:11:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA37DC433C8;
 Mon, 11 Dec 2023 22:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702332713;
 bh=p4mTC7IdUW3BAEiY7Fj43iN3lLzUWPhxoUHrJSl7/3k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E6FpIddV6KkFrsbZYmwd5978cZd8hXi0DUBNnP1fFB8t5jhRk2LSA6uAbSqbqWtDn
 hf3WEIxG8CtDMne3DwwDefG0cT1ge8VCDv+zUm9vcZ98ParJH8Ve67PiDDQd4y/Znb
 DbUOQ8Gj4XqkF/5PbwqKs4oufTkbEK2MdqY2MWwXwVKl7B2HDSUCNMDQVcq4/Pn0w5
 mOddCznAR+Y4UMbGAU52Q+TPFGAGaveohOhAHP+OmFlksfQRWFk8SaCtSEE6wweAFI
 OYvzFD3VvCY6KvGu2nPB0SsMKVHAgN6FWJbS487buXrS7azRGQ+rxzR/0l+btJzY2l
 DO+RXJPyeKHyg==
Date: Mon, 11 Dec 2023 14:11:52 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <ZXeJKCNrxcit0eTC@google.com>
References: <20231210113547.3412782-1-chao@kernel.org>
 <20231210113547.3412782-5-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231210113547.3412782-5-chao@kernel.org>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/10,
 Chao Yu wrote: > This patch adds i_size check during
 compress inode conversion in order > to avoid .page_mkwrite races w/
 conversion.
 Which race condition do you see? > > Fixes: 4c8ff7095bef ("f2fs: support
 data compression") > Signed-off-by: Chao Yu <chao@kernel.org> > --- >
 fs/f2fs/f2fs.h
 | 8 +++++++- > fs/f2fs/file.c | 5 ++--- > 2 files changed, 9 insertions(+),
 [...] Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rCoVV-0005vo-CK
Subject: Re: [f2fs-dev] [PATCH 5/6] f2fs: fix to restrict condition of
 compress inode conversion
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

On 12/10, Chao Yu wrote:
> This patch adds i_size check during compress inode conversion in order
> to avoid .page_mkwrite races w/ conversion.

Which race condition do you see?

> 
> Fixes: 4c8ff7095bef ("f2fs: support data compression")
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/f2fs.h | 8 +++++++-
>  fs/f2fs/file.c | 5 ++---
>  2 files changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 65294e3b0bef..c9b8a1953913 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -4397,13 +4397,19 @@ static inline int set_compress_context(struct inode *inode)
>  #endif
>  }
>  
> +static inline bool inode_has_data(struct inode *inode)
> +{
> +	return (S_ISREG(inode->i_mode) &&
> +		(F2FS_HAS_BLOCKS(inode) || i_size_read(inode)));
> +}
> +
>  static inline bool f2fs_disable_compressed_file(struct inode *inode)
>  {
>  	struct f2fs_inode_info *fi = F2FS_I(inode);
>  
>  	if (!f2fs_compressed_file(inode))
>  		return true;
> -	if (S_ISREG(inode->i_mode) && F2FS_HAS_BLOCKS(inode))
> +	if (inode_has_data(inode))
>  		return false;
>  
>  	fi->i_flags &= ~F2FS_COMPR_FL;
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 1a3c29a9a6a0..8af4b29c3e1a 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -1922,8 +1922,7 @@ static int f2fs_setflags_common(struct inode *inode, u32 iflags, u32 mask)
>  
>  			f2fs_down_write(&F2FS_I(inode)->i_sem);
>  			if (!f2fs_may_compress(inode) ||
> -					(S_ISREG(inode->i_mode) &&
> -					F2FS_HAS_BLOCKS(inode))) {
> +					inode_has_data(inode)) {
>  				f2fs_up_write(&F2FS_I(inode)->i_sem);
>  				return -EINVAL;
>  			}
> @@ -3996,7 +3995,7 @@ static int f2fs_ioc_set_compress_option(struct file *filp, unsigned long arg)
>  		goto out;
>  	}
>  
> -	if (F2FS_HAS_BLOCKS(inode)) {
> +	if (inode_has_data(inode)) {
>  		ret = -EFBIG;
>  		goto out;
>  	}
> -- 
> 2.40.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
