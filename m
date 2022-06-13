Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 30072547E32
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Jun 2022 05:37:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o0atI-0006hZ-Nb; Mon, 13 Jun 2022 03:37:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <willy@infradead.org>) id 1o0atH-0006hO-EO
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 13 Jun 2022 03:37:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Bm4ARRt1HNB10/2s2wOYEo//lZze1cTnCnGg9flh8L4=; b=V07cm4CtwGgDVGf6E6TIjxdS4g
 gfc/nZaekYRRj366qV++FcAVehnCgpTKkmPTyim6QyuKVgRS4exLkVp6w3JXnFbpv7bcUNZR2qsrr
 fhctkR/EModn07uTWsfVQb25hfwsbmRu9Nk0zpFWC6NrCZ4lg6F37MjNx8mtzBBbvqcc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Bm4ARRt1HNB10/2s2wOYEo//lZze1cTnCnGg9flh8L4=; b=li4PNFXoEp1kCEoLphqlBBo46s
 /nCUooDkdUK1/RO/WNEebA4r8nBy0ZqMXgyjGYSVhxuYUjkoZAcBZ/5501ZW4xhR7MRDBsFfS330w
 sOHUz4zOqGCOvrSwa1iQ8n0LF7fG0X6XMDCLTliuMPI7Vq352uAKoV5qpqDCEr19KalM=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o0atG-00Gjqh-9e
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 13 Jun 2022 03:37:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Bm4ARRt1HNB10/2s2wOYEo//lZze1cTnCnGg9flh8L4=; b=twFTjyvmQkRTeLKn7bTrmtOcux
 WIkklfU8g2svsuj6mS0XaT2EHZt+VSHSi2g5WFl+fjjcZifI5loA62Kc9bEaCvnlATGNSvClM/ekR
 hn8YYeAYl+HN8ZTYM3U9IFazKu4WBvl5kglt2H5a1WwChJ74r/nz/DafUuttwJKEY+jHfoCsalEep
 Q9Mfk1IPsyNPJaeRkcLsd4F7mnsEjTTOnTvm85cIJOYOkPKrlivLyo6tW0bVzP6J+gsVjSdXLYvjc
 HdaeQuoFtwOmG7IhlqLZxMQruQf8B/P7mfoARgBlsNlljFSrjk/dwAIPexy7PqKy0fOrecoGjgjBF
 L9H+xsHQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1o0asv-00GU6J-Iv; Mon, 13 Jun 2022 03:37:01 +0000
Date: Mon, 13 Jun 2022 04:37:01 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Chao Liu <chaoliu719@gmail.com>
Message-ID: <Yqaw3VTD46PAMN8O@casper.infradead.org>
References: <20220613020800.3379482-1-chaoliu719@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220613020800.3379482-1-chaoliu719@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jun 13, 2022 at 10:08:00AM +0800, Chao Liu wrote:
 > v2: > - s/file size/filesize/ Why would you change it to be wrong? >
 Documentation/filesystems/f2fs.rst
 | 13 +++++++------ > 1 file changed, 7 insertions(+), 6 deletions(-) > >
 diff --git a/Documentation/filesystems/f2fs.rst
 b/Documentation/filesystems/f2fs.rst > ind [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1o0atG-00Gjqh-9e
Subject: Re: [f2fs-dev] [PATCH v2] docs: filesystems: f2fs: fix description
 about compress ioctl
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
Cc: Jonathan Corbet <corbet@lwn.net>, Chao Liu <liuchao@coolpad.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Yue Hu <huyue2@coolpad.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Wayne Zhang <zhangwen@coolpad.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jun 13, 2022 at 10:08:00AM +0800, Chao Liu wrote:
> v2:
> - s/file size/filesize/

Why would you change it to be wrong?

>  Documentation/filesystems/f2fs.rst | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
> index ad8dc8c040a2..531b0f8a3946 100644
> --- a/Documentation/filesystems/f2fs.rst
> +++ b/Documentation/filesystems/f2fs.rst
> @@ -818,10 +818,11 @@ Compression implementation
>    Instead, the main goal is to reduce data writes to flash disk as much as
>    possible, resulting in extending disk life time as well as relaxing IO
>    congestion. Alternatively, we've added ioctl(F2FS_IOC_RELEASE_COMPRESS_BLOCKS)
> -  interface to reclaim compressed space and show it to user after putting the
> -  immutable bit. Immutable bit, after release, it doesn't allow writing/mmaping
> -  on the file, until reserving compressed space via
> -  ioctl(F2FS_IOC_RESERVE_COMPRESS_BLOCKS) or truncating filesize to zero.
> +  interface to reclaim compressed space and show it to user after setting a
> +  special flag to the inode. Once the compressed space is released, the flag
> +  will block writing data to the file until either the compressed space is
> +  reserved via ioctl(F2FS_IOC_RESERVE_COMPRESS_BLOCKS) or the filesize is
> +  truncated to zero.
>  
>  Compress metadata layout::
>  
> @@ -830,12 +831,12 @@ Compress metadata layout::
>  		| cluster 1 | cluster 2 | ......... | cluster N |
>  		+-----------------------------------------------+
>  		.           .                       .           .
> -	.                       .                .                      .
> +	  .                      .                .                      .
>      .         Compressed Cluster       .        .        Normal Cluster            .
>      +----------+---------+---------+---------+  +---------+---------+---------+---------+
>      |compr flag| block 1 | block 2 | block 3 |  | block 1 | block 2 | block 3 | block 4 |
>      +----------+---------+---------+---------+  +---------+---------+---------+---------+
> -	    .                             .
> +	       .                             .
>  	    .                                           .
>  	.                                                           .
>  	+-------------+-------------+----------+----------------------------+
> -- 
> 2.36.1
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
