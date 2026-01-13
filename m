Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB75D1A849
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Jan 2026 18:06:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gIRsjEffb+UYQAbf6LX2xHiyCDYPuu8UD2bcRni/C4k=; b=FzjYRg9TWky6vWKhN2vwH80DzE
	yML4zXhmrfCegmRGoWKfawkyRS7dpMLA5M1744A7DBNFeMW9RDqPr9X+4Yh7e+Qdn+ns1lBVrrlZ2
	na3BvHdrmODUCIifIXeIgMZ8WQ8bfBlpwTpk0bzQQBDIkkpdl29XASU7DOVtJhmOEOAY=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vfhqs-0003SB-CB;
	Tue, 13 Jan 2026 17:06:42 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1vfhqq-0003S5-Ts
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jan 2026 17:06:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iI0rAuR2X4hf0XpTJCXdAuwewXbFB2E/eZyGRLfpfEk=; b=Q3qZDrjAMxUBEdidRC2LuRAQGF
 zGX0jiUwDKVcvRh9wpD5GCxPc23SIIOPcl996tipIEUIOh1L8sH5byG67mOXvbXEzhTUKflNQ6Vy8
 RlhJBVtzRg9/eVATfcTWQOUx+srr+smFOToPVa7XvgKHNgbiItxT/01ZmmlMQmQn7Acc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iI0rAuR2X4hf0XpTJCXdAuwewXbFB2E/eZyGRLfpfEk=; b=GfK+6v455qp6FXUbTfrWPZzfTG
 J0EmR4vGe+qYCZip4FisH4v+PTxYnsdwA5oqR9vWMMCDrjgJ4Dfnwr1eCHPEl5PqrJug83VmybEHU
 49c+vc11nmMnf0uZRDLOPGycyGksX9I9VbiEapIuOVm8hdn/Jihyt3NV5eLMPbEHoeVk=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vfhqq-0007iP-FD for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jan 2026 17:06:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 210CD418BB
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 13 Jan 2026 17:06:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D24CAC116C6;
 Tue, 13 Jan 2026 17:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768323990;
 bh=4Ax4QF1tuXYNM0R7x6yl/zMu6ltbxUvbV3GJQ0fGBFM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nk8cREB0XWxQdz/kCMR/fGV6IHgMXM5QDLCe2sXo9/eat6WK0YA3Knb2K+YfHU8wf
 Qn+11uRzksDkUxZ4VYJGiMdVPdZpiHwkosRDmiKu8oQfz8wWujFRXpYbMTc+LZkwv1
 Bn5akE+36iBbhuavkth+Y42h5viNugzOODzLLlGLU8rQ93343jlcGW+3X3lCT8IyjE
 FoDAlQifn5c4ves7X1cGF85sG09GIOyl5MfS/1zgIcAxOdCJ3i5ajd37W2nOPKbSun
 9ZiWAFVdzGGb74IIaPHeDPhO5aNmdsDGH5KGeWJcC6e4CfSVZi/xcV37DPlw/bDhw8
 oqHUc5TDreCnA==
Date: Tue, 13 Jan 2026 17:06:28 +0000
To: Chao Yu <chao@kernel.org>
Message-ID: <aWZ7lJ2s7BILOps8@google.com>
References: <20260112013052.7623-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260112013052.7623-1-chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 01/12, Chao Yu wrote: > We missed to unlock folio in error
 path of f2fs_read_data_large_folio(), > fix it. > > With below testcase,
 it can reproduce the bug. > > touch /mnt/f2fs/file > truncate -s [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vfhqq-0007iP-FD
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to unlock folio in
 f2fs_read_data_large_folio()
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

On 01/12, Chao Yu wrote:
> We missed to unlock folio in error path of f2fs_read_data_large_folio(),
> fix it.
> 
> With below testcase, it can reproduce the bug.
> 
> touch /mnt/f2fs/file
> truncate -s $((1024*1024*1024)) /mnt/f2fs/file
> f2fs_io setflags immutable /mnt/f2fs/file
> sync
> echo 3 > /proc/sys/vm/drop_caches
> time dd if=/mnt/f2fs/file of=/dev/null bs=1M count=1024
> f2fs_io clearflags immutable /mnt/f2fs/file
> echo 1 > /proc/sys/vm/drop_caches
> time dd if=/mnt/f2fs/file of=/dev/null bs=1M count=1024
> time dd if=/mnt/f2fs/file of=/dev/null bs=1M count=1024
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
> Changelog:
> - this patch is based on Nanzhe Zhao's patchset

Please rebase on top of dev-test?

>  fs/f2fs/data.c | 28 ++++++++++++----------------
>  1 file changed, 12 insertions(+), 16 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index eeeb70bff101..a2c4769d0ae1 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -2462,11 +2462,11 @@ static int f2fs_read_data_large_folio(struct inode *inode,
>  	int ret = 0;
>  	bool folio_in_bio;
>  
> -	if (!IS_IMMUTABLE(inode))
> -		return -EOPNOTSUPP;
> -
> -	if (f2fs_compressed_file(inode))
> +	if (!IS_IMMUTABLE(inode) || f2fs_compressed_file(inode)) {
> +		if (folio)
> +			folio_unlock(folio);
>  		return -EOPNOTSUPP;
> +	}
>  
>  	map.m_seg_type = NO_CHECK_TYPE;
>  
> @@ -2569,22 +2569,18 @@ static int f2fs_read_data_large_folio(struct inode *inode,
>  		last_block_in_bio = block_nr;
>  	}
>  	trace_f2fs_read_folio(folio, DATA);
> -	if (rac) {
> -		if (!folio_in_bio) {
> -			if (!ret)
> -				folio_mark_uptodate(folio);
> -			folio_unlock(folio);
> -		}
> -		folio = readahead_folio(rac);
> -		goto next_folio;
> -	}
> +
>  err_out:
> -	/* Nothing was submitted. */
> -	if (!bio) {
> +	if (!folio_in_bio) {
>  		if (!ret)
>  			folio_mark_uptodate(folio);
>  		folio_unlock(folio);
> -		return ret;
> +		if (ret)
> +			return ret;
> +	}
> +	if (rac) {
> +		folio = readahead_folio(rac);
> +		goto next_folio;
>  	}
>  out:
>  	f2fs_submit_read_bio(F2FS_I_SB(inode), bio, DATA);
> -- 
> 2.40.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
