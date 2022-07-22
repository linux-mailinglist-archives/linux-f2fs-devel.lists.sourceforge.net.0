Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A64BE57E44F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Jul 2022 18:24:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oEvSN-0000jC-CC; Fri, 22 Jul 2022 16:24:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <djwong@kernel.org>) id 1oEvSM-0000j6-TJ
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 22 Jul 2022 16:24:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sYdK5Po1dlw7EwssP5lS20P2VrCndDaBOTyFsmk21f4=; b=glIFw40OkDNetH+oUgc7vOSPqy
 GIQxsKQwpIVrqsCgx0g/FMbVLaeInBGMoJuffEZhDWx2q7PGjQxUpqBFhOXxHcpA+uwYZa+6x8FdL
 g1lWirSOKM+mdkPqydiHFBlGz8lJB4MpiQqzIJfSQ9mIex85tZkqdml6F5fR563+tSzU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sYdK5Po1dlw7EwssP5lS20P2VrCndDaBOTyFsmk21f4=; b=R+GnGPrL8NhrLb2USKqk5idP9K
 +HUnCdTnTYMaQufVaUZ/HWzc2eWYJ+hk5D9KcAWfyJAmsqufbkZxwWNxHAAkPY53bnG77IpolL1Zt
 QDyf6EQrjh+QWixm/YMoykrPd7wqnXPcDC449yz1n9n97h8MeH+lEaRZFjWgAtKIhDPQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oEvSJ-0001B6-BM
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 22 Jul 2022 16:24:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2AD8D621E0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 22 Jul 2022 16:24:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 801EFC341C6;
 Fri, 22 Jul 2022 16:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658507080;
 bh=ERD6L0tGWO0x9Vzt+94y6IPYs2il1yz7+hLCIIQ9VMQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M7syBNh7Q+slzlSg95Ty+U3caUx3OkvdZKYgFaT6zO7YKN9OsdTxAXKpzM/fQ8EUj
 8laTCMg9BidYfI43AVNQjAskrSgTEIhdawoWcCWFN1EAKRyOqivbfv7qK9N59+Vvnq
 ixHzlI/3Lkn2UIyRqLOaAICt3NyJKQeAO9La4LBsM3B/cUM9f6Cxa2XXZSNWSWP4n7
 eKglhO2cux23pKTuvR31k1jROOcx4Jvj6L34W3fwmJ0EjPxsmlZpViqsKNhWnWhV8U
 qZwtGZ8Kg87h7OJAYIWHEdlyKK+giZJRMb/S/JIukT8Eyn8v4Et7jPN0R8WTIdRmRv
 SETEtPcVhPZPQ==
Date: Fri, 22 Jul 2022 09:24:39 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <YtrPRysafr5KK3NQ@magnolia>
References: <20220722071228.146690-1-ebiggers@kernel.org>
 <20220722071228.146690-10-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220722071228.146690-10-ebiggers@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Jul 22, 2022 at 12:12:28AM -0700, Eric Biggers wrote:
 > From: Eric Biggers <ebiggers@google.com> > > Add support for STATX_DIOALIGN
 to xfs, so that direct I/O alignment > restrictions are expo [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oEvSJ-0001B6-BM
Subject: Re: [f2fs-dev] [PATCH v4 9/9] xfs: support STATX_DIOALIGN
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

On Fri, Jul 22, 2022 at 12:12:28AM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Add support for STATX_DIOALIGN to xfs, so that direct I/O alignment
> restrictions are exposed to userspace in a generic way.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>

LGTM
Reviewed-by: Darrick J. Wong <djwong@kernel.org>

--D

> ---
>  fs/xfs/xfs_iops.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/fs/xfs/xfs_iops.c b/fs/xfs/xfs_iops.c
> index 29f5b8b8aca69a..bac3f56141801e 100644
> --- a/fs/xfs/xfs_iops.c
> +++ b/fs/xfs/xfs_iops.c
> @@ -605,6 +605,15 @@ xfs_vn_getattr(
>  		stat->blksize = BLKDEV_IOSIZE;
>  		stat->rdev = inode->i_rdev;
>  		break;
> +	case S_IFREG:
> +		if (request_mask & STATX_DIOALIGN) {
> +			struct xfs_buftarg	*target = xfs_inode_buftarg(ip);
> +
> +			stat->result_mask |= STATX_DIOALIGN;
> +			stat->dio_mem_align = target->bt_logical_sectorsize;
> +			stat->dio_offset_align = target->bt_logical_sectorsize;
> +		}
> +		fallthrough;
>  	default:
>  		stat->blksize = xfs_stat_blksize(ip);
>  		stat->rdev = 0;
> -- 
> 2.37.0
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
