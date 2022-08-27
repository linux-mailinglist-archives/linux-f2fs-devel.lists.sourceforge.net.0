Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 019C95A3863
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 27 Aug 2022 17:35:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oRxqB-0006pK-C2;
	Sat, 27 Aug 2022 15:35:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1oRxq5-0006pD-Nt
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 Aug 2022 15:35:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UssBGHde679aoByEO6ICrafDapNqX3H7AriUxIeYzDk=; b=BX12LujL0p8sbiQHS5KU3Kwiu9
 oyRPp9yRLlC8uneqP03OS0sETsweaV+eSBHfJQxj5AhgxLujFmx6PM4aAFdDFKj8TwvBb5xPg75BO
 vUyUAe9HJeoDfdVEU2tE3+97muVfh1Tc3cjzonI4yB7EawAjmkmdLD63Y/M5swKULMVg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UssBGHde679aoByEO6ICrafDapNqX3H7AriUxIeYzDk=; b=A5qOQNxQcgrgXoyOB6R5pVkYa8
 ro4GPBhPAP0+8kouv/Z+67ESGe0ZzSdLMxOP75b+8QUk0itorasVpeaVMYAvZtMLpS6VneUq0mQnw
 9Q2nbIt45H1baGSlk0Np+ve5YMsVu7wJHAmnJLQ5dTLZo/BEPfkjbh2jiOovRR/KfXbc=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oRxq0-002qCJ-6e for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 Aug 2022 15:35:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 84F62B8074D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 27 Aug 2022 15:34:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D4B3C433D6;
 Sat, 27 Aug 2022 15:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661614494;
 bh=OwdC3zQvx/KCzeSOjSzdhVsw26TrxSO5sfbmeSj3vF8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bXmb0bD8ESyNwnRhmb8IR14oLDFELGHgM5LbDriucEEumr3NzmxZa3KYqDkTDA84U
 ob5PwgU3nlrEsIUThmRhklgxtfWxXONGAo3XfnYjJ/K0R5ZHrHSASCq5WFXqxGxZbA
 pnl2HIEXo3yTpIt6sSXX07EEcxRGw5QnhFmjNbCuwvt1bk5dbaShy30tgXRfh6VWCb
 +lleWEXp6G02g40n6LJx5+RIz77SsYmEqsElHu0c6tTJzFso2fF1DMd+yWC2HyEbKI
 a0Fu1555e1QfSccC1hDHagmRilh25cKV8qw9KrbXliotwabiE6mxisiJYjtHwwc3ZX
 cCABO4ZAwi3vA==
Date: Sat, 27 Aug 2022 08:34:53 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <Ywo5nQpqKNUzm/0y@magnolia>
References: <20220827065851.135710-1-ebiggers@kernel.org>
 <20220827065851.135710-9-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220827065851.135710-9-ebiggers@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Aug 26, 2022 at 11:58:51PM -0700, Eric Biggers wrote:
 > From: Eric Biggers <ebiggers@google.com> > > Add support for STATX_DIOALIGN
 to xfs, so that direct I/O alignment > restrictions are expo [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oRxq0-002qCJ-6e
Subject: Re: [f2fs-dev] [PATCH v5 8/8] xfs: support STATX_DIOALIGN
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
Cc: linux-block@vger.kernel.org, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Keith Busch <kbusch@kernel.org>,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Aug 26, 2022 at 11:58:51PM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Add support for STATX_DIOALIGN to xfs, so that direct I/O alignment
> restrictions are exposed to userspace in a generic way.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Looks good to me; I particularly like the adjustment to report the
device's DMA alignment.  Someone should probably fix DIONINFO, or
perhaps turn it into a getattr wrapper and hoist it?  IMHO none of those
suggestions are necessary to land this patch, though.

Reviewed-by: Darrick J. Wong <djwong@kernel.org>

--D

> ---
>  fs/xfs/xfs_iops.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/fs/xfs/xfs_iops.c b/fs/xfs/xfs_iops.c
> index 45518b8c613c9a..f51c60d7e2054a 100644
> --- a/fs/xfs/xfs_iops.c
> +++ b/fs/xfs/xfs_iops.c
> @@ -604,6 +604,16 @@ xfs_vn_getattr(
>  		stat->blksize = BLKDEV_IOSIZE;
>  		stat->rdev = inode->i_rdev;
>  		break;
> +	case S_IFREG:
> +		if (request_mask & STATX_DIOALIGN) {
> +			struct xfs_buftarg	*target = xfs_inode_buftarg(ip);
> +			struct block_device	*bdev = target->bt_bdev;
> +
> +			stat->result_mask |= STATX_DIOALIGN;
> +			stat->dio_mem_align = bdev_dma_alignment(bdev) + 1;
> +			stat->dio_offset_align = bdev_logical_block_size(bdev);
> +		}
> +		fallthrough;
>  	default:
>  		stat->blksize = xfs_stat_blksize(ip);
>  		stat->rdev = 0;
> -- 
> 2.37.2
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
