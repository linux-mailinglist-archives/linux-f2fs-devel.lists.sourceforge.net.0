Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 874E12A4F7D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Nov 2020 19:58:31 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ka1Vk-0002LD-Dy; Tue, 03 Nov 2020 18:58:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1ka1Vj-0002L0-3w
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Nov 2020 18:58:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=R5a3yvopw53ViYWisVs8Lhri7Gzjm2ITxMaeDeIN6XQ=; b=jIvFhDIRdzPhbOVSxUPn+Np3yu
 p8bTq2KmFrqXSZQ6ETeecqAIjG536HkjJFwftswXcsDkSB+bFdZPS4xUjJTq3CjtvGqDh5NsAAqd0
 u3yON1E/ch5TCQIv4VPEuflZapSm6SIqTNPx6gsBwvC+hLP9zVC7R2g+LkP6yuglxZj0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=R5a3yvopw53ViYWisVs8Lhri7Gzjm2ITxMaeDeIN6XQ=; b=M27nsvoFlvOZyR+x6JXPVWXVZM
 BUXMd5hmSMCPendZ7ELIZMDL1Lmm+qF8UNg/iUYqbCS7HSoJfoPW/1dYrFE9CV30BVTxF/RlDwewg
 Zq3Y6D/qLfmVQF6GjuC91oiUoBBPs9sPaIWddDEeeHlus8kSgAPng/09fJTPoGVQsJ9o=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ka1VY-000HJV-1O
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Nov 2020 18:58:27 +0000
Received: from google.com (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0B5F720786;
 Tue,  3 Nov 2020 18:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604429890;
 bh=a0Obnq7zFjA7+lJwjIGr/YVojARoM/224HrcQIDvg3M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AAAhpE2eeEd8Ww6QiU17UcSdXQtMQaV6V3GiM1FJdX9ZIo2YFvu3bY+EqmmkvDHq+
 7ZgUWywksrRGDTqaJWSpAF6JMLHtvlLW42IEgNN4U2eBR511nlCmmlEKbXIkNJA0+b
 7AbNJ104CZham7e7CQnHDsHqORmx7TCudoIn5kBs=
Date: Tue, 3 Nov 2020 10:58:08 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Daejun Park <daejun7.park@samsung.com>
Message-ID: <20201103185808.GB1273166@google.com>
References: <CGME20201103083832epcms2p6c8b0e4470f1392772317ab2b25256b3d@epcms2p6>
 <20201103083832epcms2p6c8b0e4470f1392772317ab2b25256b3d@epcms2p6>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201103083832epcms2p6c8b0e4470f1392772317ab2b25256b3d@epcms2p6>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: samsung.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ka1VY-000HJV-1O
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: change write_hint for hot/warm nodes
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
Cc: yongmyung lee <ymhungry.lee@samsung.com>,
 Jieon Seol <jieon.seol@samsung.com>, Mankyu PARK <manq.park@samsung.com>,
 Sung-Jun Park <sungjun07.park@samsung.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 Keoseong Park <keosung.park@samsung.com>,
 Sang-yoon Oh <sangyoon.oh@samsung.com>,
 SEUNGUK SHIN <seunguk.shin@samsung.com>,
 Jinyoung CHOI <j-young.choi@samsung.com>,
 Jaemyung Lee <jaemyung.lee@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/03, Daejun Park wrote:
> In the fs-based mode of F2FS, the mapping of hot/warm node to
> WRITE_LIFE_NOT_SET should be changed to WRITE_LIFE_SHORT.
> 
> As a result of analyzing the write pattern of f2fs using real workload,
> hot/warm nodes have high update ratio close to hot data.[*]
> However, F2FS passes write hints for hot/warm nodes as WRITE_LIFE_NOT_SET.

I prefer to keep it as is, since basically node blocks should be separatly
stored from data blocks in different erase blocks in order to match F2FS GC
and FTL GC units. And, we don't do IPU for node blocks which doesn't make sense
to say *update ratio*.

> 
> Furthermore, WRITE_LIFE_NOT_SET is a default value of write hint when it is
> not provided from the file system.
> In storage, write_hint is used to distinguish streams (e.g. NVMe).
> So, the hot/warm node of F2FS is not distinguished from other write_hints,
> which can make the wrong stream seperation.
> 
> * Liang, Yu, et al. "An empirical study of F2FS on mobile devices." 2017
> IEEE 23rd International Conference on Embedded and Real-Time Computing
> Systems and Applications (RTCSA).
> 
> Signed-off-by: Daejun Park <daejun7.park@samsung.com>
> ---
> v2: update documentation and comments
> ---
>  Documentation/filesystems/f2fs.rst | 4 ++--
>  fs/f2fs/segment.c                  | 6 +++---
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
> index b8ee761c9922..afa3da7cfade 100644
> --- a/Documentation/filesystems/f2fs.rst
> +++ b/Documentation/filesystems/f2fs.rst
> @@ -717,8 +717,8 @@ WRITE_LIFE_LONG       "                        WRITE_LIFE_LONG
>  ===================== ======================== ===================
>  User                  F2FS                     Block
>  ===================== ======================== ===================
> -                      META                     WRITE_LIFE_MEDIUM;
> -                      HOT_NODE                 WRITE_LIFE_NOT_SET
> +                      META                     WRITE_LIFE_MEDIUM
> +                      HOT_NODE                 WRITE_LIFE_SHORT
>                        WARM_NODE                "
>                        COLD_NODE                WRITE_LIFE_NONE
>  ioctl(COLD)           COLD_DATA                WRITE_LIFE_EXTREME
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 1596502f7375..577ab7516c6b 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -3160,8 +3160,8 @@ int f2fs_rw_hint_to_seg_type(enum rw_hint hint)
>   *
>   * User                  F2FS                     Block
>   * ----                  ----                     -----
> - *                       META                     WRITE_LIFE_MEDIUM;
> - *                       HOT_NODE                 WRITE_LIFE_NOT_SET
> + *                       META                     WRITE_LIFE_MEDIUM
> + *                       HOT_NODE                 WRITE_LIFE_SHORT
>   *                       WARM_NODE                "
>   *                       COLD_NODE                WRITE_LIFE_NONE
>   * ioctl(COLD)           COLD_DATA                WRITE_LIFE_EXTREME
> @@ -3208,7 +3208,7 @@ enum rw_hint f2fs_io_type_to_rw_hint(struct f2fs_sb_info *sbi,
>  				return WRITE_LIFE_EXTREME;
>  		} else if (type == NODE) {
>  			if (temp == WARM || temp == HOT)
> -				return WRITE_LIFE_NOT_SET;
> +				return WRITE_LIFE_SHORT;
>  			else if (temp == COLD)
>  				return WRITE_LIFE_NONE;
>  		} else if (type == META) {
> -- 
> 2.25.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
