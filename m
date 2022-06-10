Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB2054670A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Jun 2022 15:06:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nzeLC-0002Dj-Da; Fri, 10 Jun 2022 13:06:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nzeL7-0002DZ-3b
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Jun 2022 13:06:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+ENZFfDnbzILi+cmvy/mV7hYyC34+MIvzq/NU6bj1Lg=; b=TxUPQbmr+9vSJbRMgnAGcwe3O9
 ejND/RDvCF+P3Glulsyem4naRcgENZ3/B6Zmsnj1Zuong+pr5piTAKd08BLuTtkwASl9DrGdhcGeE
 hZWYGw2KZYGLvcSCxc3wqX7IhpDhTlO4Qs78G+9jy8WUm9Z6N64k31+sDPmaAxzuVu4c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+ENZFfDnbzILi+cmvy/mV7hYyC34+MIvzq/NU6bj1Lg=; b=m/XcLuBUttxmtXRLsOYTLIjKmJ
 IwuklNqR1zaGcrk6erJE/FXYcYpsl9HBgM5ueIOL84HSSEz63TllwjIETjLuTObNbEzPgKBAC6gPp
 xOXzxoC7Fb5BSK+fLEjo0HQzzgdiis8f9AoXgTCQTzTrhjxO/lZmTcQYRr9b4PUN7+Kg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nzeL1-00DWVx-Tu
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Jun 2022 13:06:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E203160BD6;
 Fri, 10 Jun 2022 13:06:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40AAFC34114;
 Fri, 10 Jun 2022 13:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654866360;
 bh=xkCJiA855qlPrws/61dN5ylG/Dd/FlQB186Hu3KHC2I=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Nf/UQFyu0Gb6hxnCkffPqNTS5oF5hm4QLJRJWaWGbxDS2n4VemEepH3dO2SobKZ76
 iBYTPCh3mX5ldY79S5Bwe1dvGN7+9pFRhXJhyL/R94YGBWrIsyWo65utQfXa1EZ1/+
 AZ26IMyqOA04h2+4VbhNfTjGr6TLuIb7zltPIdrAdiIWRRmzxD2IRQEqsiyzxg7EA0
 gsTgru0aXRtmwbn7aExCICJb9GM9z/FlkaBLC2UiVevHX80wyDFVH8ZAj7tOK8L4TT
 KO0ccMbpqDHZkyXLYnjKhjg0USQC6dGYSvrh4TYr6rAmvNSUYuj81waLQX2uYvoOaU
 RX0ip3KKyuRGw==
Message-ID: <0e451780-31c8-b1e9-0205-b9e68a57e958@kernel.org>
Date: Fri, 10 Jun 2022 21:05:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Chao Liu <chaoliu719@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
References: <20220602072540.998638-1-chaoliu719@gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220602072540.998638-1-chaoliu719@gmail.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/6/2 15:25,
 Chao Liu wrote: > From: Chao Liu <liuchao@coolpad.com>
 > > Since commit c61404153eb6 ("f2fs: introduce FI_COMPRESS_RELEASED > instead
 of using IMMUTABLE bit"), we no longer use the [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nzeL1-00DWVx-Tu
Subject: Re: [f2fs-dev] [PATCH] docs: filesystems: f2fs: fix description
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
Cc: linux-doc@vger.kernel.org, Chao Liu <liuchao@coolpad.com>,
 linux-kernel@vger.kernel.org, Wayne Zhang <zhangwen@coolpad.com>,
 Yue Hu <huyue2@coolpad.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/6/2 15:25, Chao Liu wrote:
> From: Chao Liu <liuchao@coolpad.com>
> 
> Since commit c61404153eb6 ("f2fs: introduce FI_COMPRESS_RELEASED
> instead of using IMMUTABLE bit"), we no longer use the IMMUTABLE
> bit to prevent writing data for compression. Let's correct the
> corresponding documentation.
> 
> BTW, this patch fixes some alignment issues in the compress
> metadata layout.
> 
> Signed-off-by: Chao Liu <liuchao@coolpad.com>
> ---
>   Documentation/filesystems/f2fs.rst | 13 +++++++------
>   1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
> index ad8dc8c040a2..98dc24f5c6f0 100644
> --- a/Documentation/filesystems/f2fs.rst
> +++ b/Documentation/filesystems/f2fs.rst
> @@ -818,10 +818,11 @@ Compression implementation
>     Instead, the main goal is to reduce data writes to flash disk as much as
>     possible, resulting in extending disk life time as well as relaxing IO
>     congestion. Alternatively, we've added ioctl(F2FS_IOC_RELEASE_COMPRESS_BLOCKS)
> -  interface to reclaim compressed space and show it to user after putting the
> -  immutable bit. Immutable bit, after release, it doesn't allow writing/mmaping
> -  on the file, until reserving compressed space via
> -  ioctl(F2FS_IOC_RESERVE_COMPRESS_BLOCKS) or truncating filesize to zero.
> +  interface to reclaim compressed space and show it to user after setting a
> +  special flag to the inode. Once the compressed space is released, the flag
> +  will block writing data to the file until either the compressed space is
> +  reserved via ioctl(F2FS_IOC_RESERVE_COMPRESS_BLOCKS) or the file size is

s/file size/filesize/

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,

> +  truncated to zero.
>   
>   Compress metadata layout::
>   
> @@ -830,12 +831,12 @@ Compress metadata layout::
>   		| cluster 1 | cluster 2 | ......... | cluster N |
>   		+-----------------------------------------------+
>   		.           .                       .           .
> -	.                       .                .                      .
> +	  .                      .                .                      .
>       .         Compressed Cluster       .        .        Normal Cluster            .
>       +----------+---------+---------+---------+  +---------+---------+---------+---------+
>       |compr flag| block 1 | block 2 | block 3 |  | block 1 | block 2 | block 3 | block 4 |
>       +----------+---------+---------+---------+  +---------+---------+---------+---------+
> -	    .                             .
> +	       .                             .
>   	    .                                           .
>   	.                                                           .
>   	+-------------+-------------+----------+----------------------------+


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
