Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D00585CC4
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 31 Jul 2022 03:22:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oHxfA-0000HK-0W; Sun, 31 Jul 2022 01:22:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1oHxf8-0000HD-CH
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 31 Jul 2022 01:22:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qGj47q4U4eWFtFInEPXN82v0q9c9JAnOMKZy8uCAcr4=; b=F4/hhVPY8Y7FEXAgC40rZl8Dsr
 nMlNR7OvA7wlPlMymE3nn1OPfQWyiKt3Z/+VcRVR79SIYcdbFByamI0GhpD/D5oSCh+P3k5bMetsO
 Ff1+OYza7Tcke7CpTz5v1wL0Vuqd/U75tycCXG517zOs0Q3kQ9o+5QcpLgzWdheQaS4s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qGj47q4U4eWFtFInEPXN82v0q9c9JAnOMKZy8uCAcr4=; b=Jg+5oFMj2SvraLzcHUp75phAix
 wBGfY626pM9ZhDgcz9RM+UWtEFNfH+zMDmd0s3vpCqPh0l2x4XrALy3h543qpAx3ViG4u7nb16QAJ
 sXu0iWvWDIN+jhVghWsTQ3RYF/EgQZcdnQ5jR9zjr1v90pvuGsRrPXrxS09TjCNGbSis=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oHxf4-0006kj-BL
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 31 Jul 2022 01:22:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A0708B80978;
 Sun, 31 Jul 2022 01:22:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32D43C433C1;
 Sun, 31 Jul 2022 01:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659230539;
 bh=+JDFzr0rIHbOOzwsVagV8xXUPfCyfziwvLXSfsBNeR0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Gqzl88ia55Ui5VHLB6miDo0pdctIC5Q8hh2HKpECT/grdBP0+22WCMvIoxEDR+nDt
 Wvq72HAVzcJa7/0aKQDVAyKDKLiL9XlvwntvQn/Aw+9KV/+a6ORsOTki7HOB28I/FC
 wgL7YZMb+beK21aEKyE6bAYyXv0z/VkafPIM/5YeWqomRQHhOlWwYIWr0nB1UToa+o
 XVI0xe8oieflGXlH+edthBmUepMJrRkftJTi3MqGNbm5tC4R3Xzh9NzvYzjchvnJiS
 XyblyC1FdMXHYechJn9CToWTApwdpBZTTzaLkKHi1dEuAZRw0KpY0qOiJtwjRdiJoY
 1+brv9oTWs57A==
Date: Sat, 30 Jul 2022 18:22:17 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Eunhee Rho <eunhee83.rho@samsung.com>
Message-ID: <YuXZSTw4reBDtLgk@google.com>
References: <CGME20220729002517epcms2p35eed262c3349287436c1848ab350c2d4@epcms2p3>
 <20220729002517epcms2p35eed262c3349287436c1848ab350c2d4@epcms2p3>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220729002517epcms2p35eed262c3349287436c1848ab350c2d4@epcms2p3>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 07/29, Eunhee Rho wrote: > For zoned devices, f2fs forbids
 direct IO and forces buffered IO > to serialize write IOs. However,
 the constraint
 does not apply to > read IOs. > > Signed-off-by: Eunhee [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oHxf4-0006kj-BL
Subject: Re: [f2fs-dev] [PATCH v0] f2fs: allow direct read for zoned device
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 07/29, Eunhee Rho wrote:
> For zoned devices, f2fs forbids direct IO and forces buffered IO
> to serialize write IOs. However, the constraint does not apply to
> read IOs.
> 
> Signed-off-by: Eunhee Rho <eunhee83.rho@samsung.com>
> ---
>  fs/f2fs/f2fs.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index d0f428aef34b..f69731f17402 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -4471,7 +4471,7 @@ static inline bool f2fs_force_buffered_io(struct inode *inode,
>  	 * for blkzoned device, fallback direct IO to buffered IO, so
>  	 * all IOs can be serialized by log-structured write.
>  	 */
> -	if (f2fs_sb_has_blkzoned(sbi))
> +	if (f2fs_sb_has_blkzoned(sbi) && (rw == WRITE))
>  		return true;

Actually we don't need to check the device type, but rely on the
filesystem allocation policy like the below lfs mode. Can we remove this
line simply?

>  	if (f2fs_lfs_mode(sbi) && (rw == WRITE)) {
>  		if (block_unaligned_IO(inode, iocb, iter))
> -- 
> 2.25.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
