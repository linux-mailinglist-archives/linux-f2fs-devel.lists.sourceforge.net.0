Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C856C299668
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Oct 2020 20:04:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kX7nG-0006jH-8c; Mon, 26 Oct 2020 19:04:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kX7nF-0006j3-1E
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 26 Oct 2020 19:04:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8ERcOqmIfyV9y4Dk2HZVvYFHVo/if36iDL2Fb+b8P+s=; b=Io/xa/4jiGYZXanEHbmPtjxt6T
 ilped7E+g3r7dtE3K0cF7cx7YrTcBg5mw4gaeRKpZEKtr9WMmw+OV341K4fFjvkUwKT20isjwkh55
 EZtPswxpO8wPse7Z1wZ1fjQTrAKX1TkifwmaFZ+5KfvWZ1AFPnatncDL351bq8O+bXEA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8ERcOqmIfyV9y4Dk2HZVvYFHVo/if36iDL2Fb+b8P+s=; b=gAcFPuxbxZJ0jxWI+7wbTDcm2L
 uVUSzJ28UOJXnlk8RQ1+gGnAzSmrXhiFowNeEe/hw1M/4n3jB+NWwR1zs7/VOQDyn9JxEayq6dkbf
 WDHgvnZ2kHuEbZZ0HvJNQ3ZP235Qfm/EFJEEA7egOCe4h4DhISA3H6GakL0AldmyndMA=;
Received: from [198.145.29.99] (helo=mail.kernel.org)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kX7n5-00EdKt-Ks
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 26 Oct 2020 19:04:32 +0000
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
 [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EEBF820720;
 Mon, 26 Oct 2020 19:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603739048;
 bh=AHD3Q5NMnAqW/PwhjTlDcGnCMCU3a5L5yG8ci6S0zhI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=je72NyXI3XtA5RGI7O1keBA4S4KImpY9W/vjiVJSHGSVtL2pwKwmGfA5MP6TvN5lJ
 p/fBZvTsQYNNIVnr0cVEUuAxTTbUYSjyqcOuR4cZuEp99fi2ohvYGBSmF5bebvB/Uz
 /6GjcduJqU53mmtwYXmfSYHEcxZ/8aEbiHjM6YNQ=
Date: Mon, 26 Oct 2020 12:04:06 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <20201026190406.GL858@sol.localdomain>
References: <20201026041656.2785980-1-daeho43@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201026041656.2785980-1-daeho43@gmail.com>
X-Spam-Score: 0.9 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 1.0 RDNS_NONE Delivered to internal network by a host with no rDNS
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kX7n5-00EdKt-Ks
Subject: Re: [f2fs-dev] [PATCH v3 1/2] f2fs: add
 F2FS_IOC_GET_COMPRESS_OPTION ioctl
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Oct 26, 2020 at 01:16:55PM +0900, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Added a new F2FS_IOC_GET_COMPRESS_OPTION ioctl to get file compression
> option of a file.
> 
> struct f2fs_comp_option {
>     u8 algorithm;         => compression algorithm
>                           => 0:lzo, 1:lz4, 2:zstd, 3:lzorle
>     u8 log_cluster_size;  => log scale cluster size
>                           => 2 ~ 8
> };
> 
> struct f2fs_comp_option option;
> 
> ioctl(fd, F2FS_IOC_GET_COMPRESS_OPTION, &option);
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> Reviewed-by: Eric Biggers <ebiggers@kernel.org>

Please don't add Reviewed-by until it is explicitly given.

The actual code looks fine, but there's still no mention of documentation,
tests, or use cases.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
