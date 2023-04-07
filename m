Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9856DB590
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  7 Apr 2023 22:59:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pktBG-0002bX-DQ;
	Fri, 07 Apr 2023 20:59:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1pktBF-0002bQ-Sw
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Apr 2023 20:59:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fcObKQ18X4QENw5z5wgy3RbMSH7kIsRP9wdBVD6F7VI=; b=HWfSlNA8mx3Z/aKM8mw0Icuspc
 EB7++yAGryUBwCPKUdcFw3zVwPeFuCE4Wwtj1wWZUYqQux4Qv0HRXyhtXfGUp6mBJGjyVoGJPioLY
 vKzZe5Nb8F4sP5zXfIL5euLmt6SNESaQZ6CZlI/TnnpNpBqr7bPl/1v1XZnYn7GDxc58=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fcObKQ18X4QENw5z5wgy3RbMSH7kIsRP9wdBVD6F7VI=; b=kumFugQnTdmXKw6+K+/k1RNCEy
 UUjM/Bgk8jWht5AVObeH2bYjbChrx7pTycsQmw3dlu+mR91bAvW+NgbB0+K4a0F9mmdAZ7h1rzvpY
 v72uExY/IPOIOJ23ABdBnfRQqkhUAv7pFsIf/WHhF4IsSjWxDdHwEmNUEz/nBYTzFGWo=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pktBE-000U5I-Bw for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Apr 2023 20:59:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 305DC6129A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  7 Apr 2023 20:59:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AE92C433EF;
 Fri,  7 Apr 2023 20:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680901165;
 bh=T9eB8QdjMGMVT/DK1Yt9pviXcxgW+FQv8ahMZ8rJJWs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NT08vvwvuEn44vtimLvpex7KgTITAUypeP1kRh/nV+MPl2DY8iwEhVVlRAD9c6bLg
 Fr0JvThfh+vv8zLbAQ1QYfqVAd9sNXAm4EoJR40iox0D8lFL4ZWplQuWTIhNaCphDA
 +ARBw5eA4XQZEiHXy6CPWIxTJNjWprfwYC3aylbEv5a45rdjq/NXOU3iDyTcz4LDAF
 xHJb+zbwLcvejNthoA5UwBfE3dL6T1NmzHPQsEufr9N6T9y1N/aWymvWwvadIHl+tP
 GyX47hXgeltx7u2ecnIpXS//PHRHzamJhCeMmXsskEB/RJSQIGj/2GswKmJuIciZ0L
 xZhFibWav8wyg==
Date: Fri, 7 Apr 2023 13:59:23 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <ZDCEK2OPkhTmRZrq@google.com>
References: <20230405144359.930253-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230405144359.930253-1-chao@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This breaks generic/009? On 04/05, Chao Yu wrote: > xfstest
 generic/614 fails to run due below reason: > > generic/614 1s ... [not run]
 test requires delayed allocation buffered writes > > The root cause is f2fs
 tags wrong fi [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pktBE-000U5I-Bw
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to tag FIEMAP_EXTENT_DELALLOC in
 fiemap() for delay allocated extent
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

This breaks generic/009?

On 04/05, Chao Yu wrote:
> xfstest generic/614 fails to run due below reason:
> 
> generic/614 1s ... [not run] test requires delayed allocation buffered writes
> 
> The root cause is f2fs tags wrong fiemap flag for delay allocated
> extent.
> 
> Quoted from fiemap.h:
> FIEMAP_EXTENT_UNKNOWN		0x00000002 /* Data location unknown. */
> FIEMAP_EXTENT_DELALLOC		0x00000004 /* Location still pending.
> 						    * Sets EXTENT_UNKNOWN. */
> FIEMAP_EXTENT_UNWRITTEN		0x00000800 /* Space allocated, but
> 						    * no data (i.e. zero). */
> 
> FIEMAP_EXTENT_UNWRITTEN means block address is preallocated, but w/o
> been written any data, which status f2fs is not supported now, for all
> NEW_ADDR block addresses, it means delay allocated blocks, so let's
> tag FIEMAP_EXTENT_DELALLOC instead.
> 
> Testcase:
> xfs_io -f -c 'pwrite 0 64k' /mnt/f2fs/file;
> filefrag -v /mnt/f2fs/file
> 
> Output:
> - Before
> Filesystem type is: f2f52010
> Fize of /mnt/f2fs/file is 65536 (16 blocks of 4096 bytes)
>  ext:     logical_offset:        physical_offset: length:   expected: flags:
>    0:        0..      15:          0..        15:     16:             last,unwritten,merged,eof
> /mnt/f2fs/file: 1 extent found
> 
> After:
> Filesystem type is: f2f52010
> File size of /mnt/f2fs/file is 65536 (16 blocks of 4096 bytes)
>  ext:     logical_offset:        physical_offset: length:   expected: flags:
>    0:        0..      15:          0..         0:      0:             last,unknown_loc,delalloc,eof
> /mnt/f2fs/file: 1 extent found
> 
> Fixes: 7f63eb77af7b ("f2fs: report unwritten area in f2fs_fiemap")
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/data.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 359de650772e..3afc9764743e 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -1995,7 +1995,10 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
>  	}
>  
>  	if (size) {
> -		flags |= FIEMAP_EXTENT_MERGED;
> +		if (flags & FIEMAP_EXTENT_DELALLOC)
> +			phys = 0;
> +		else
> +			flags |= FIEMAP_EXTENT_MERGED;
>  		if (IS_ENCRYPTED(inode))
>  			flags |= FIEMAP_EXTENT_DATA_ENCRYPTED;
>  
> @@ -2035,7 +2038,7 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
>  				size += blks_to_bytes(inode, 1);
>  			}
>  		} else if (map.m_flags & F2FS_MAP_DELALLOC) {
> -			flags = FIEMAP_EXTENT_UNWRITTEN;
> +			flags = FIEMAP_EXTENT_DELALLOC;
>  		}
>  
>  		start_blk += bytes_to_blks(inode, size);
> -- 
> 2.36.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
