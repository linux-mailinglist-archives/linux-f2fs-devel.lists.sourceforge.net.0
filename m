Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 443206D703C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  5 Apr 2023 00:41:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pjpLI-00047u-Ej;
	Tue, 04 Apr 2023 22:41:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1pjpLH-00047o-Rg
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 22:41:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pUEDQOM6/7fNwfS3q2k0TcloK0gRMFl9mHLH92OUgos=; b=krj52Z4FMSGZEh4SG+9Oeba71H
 X6M5xo2ix4Qfq9ee1DOSVelD3CVRfY2d9TSvMyoBZsxkyQtL9VA3ewXT7qmVUpJu64MidrnfC4fdz
 t318SEkZlc2N1P85TpyRc5sJbZaVlbQfVq0iaQfqy+h9HESekVp3TdA7h3FkURW+JPVw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pUEDQOM6/7fNwfS3q2k0TcloK0gRMFl9mHLH92OUgos=; b=S3HRvH0+9r25RAWicuAVm86tPl
 eLPXFlnbGSzkwKJOqQTpPHjMGK5wrINXTI64ad5zRK9AhNRIHD6MwUG5vTAzZV1wcKhkwfLln4nXS
 RrVSAq2Nm43H8NQkJW/tUzckZZPwD5hM43PKimhWfEKTye2OAvfNPJm+RjKSQj2iEVGI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pjpLH-0008IW-HV for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 22:41:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1ADE563598;
 Tue,  4 Apr 2023 22:41:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E96D8C433D2;
 Tue,  4 Apr 2023 22:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680648085;
 bh=aM54U5iap6zscBuGqNsTwESIxnVITeGqVdCllwuI5x8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ml94zzFvd8sabIYbcobTwAoRXcLNGqW8xEpy1hwrJ+LGdNfLtPa8x+4xdHmRtKIUZ
 fsZ9jJ75A5lmEpmdem7n1pLxe2UYcM3MNfdc3YAKViyebklATamdLl05Y60lpWwFf5
 ofYhx2pJjFoCtq+GaiYkuINUe2JCSqF2pwFUFn6Zo0bfwhXouKVIOal+1AkwQaQ/YJ
 bk44SX4AtKjSWCU9Xb6pe+BY0KJ/BHIrDRJrYOB//ATaeXL09P9aN3BQWNzXNZuWDp
 3qrolO5LKpJQtkjeBwNaIywyLBY1yThisB/2n4A1Sn2mN235gQW98poQIAKB/WP56N
 ajfrwoO4Xp5Tw==
Date: Tue, 4 Apr 2023 15:41:23 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Andrey Albershteyn <aalbersh@redhat.com>
Message-ID: <20230404224123.GD1893@sol.localdomain>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
 <20230404145319.2057051-17-aalbersh@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230404145319.2057051-17-aalbersh@redhat.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Andrey, On Tue, Apr 04, 2023 at 04:53:12PM +0200, Andrey
 Albershteyn wrote: > Add flag to mark inodes which have fs-verity enabled
 on them (i.e. > descriptor exist and tree is built). > > Signed-off-by: Andre
 [...] Content analysis details:   (-5.9 points, 6.0 required)
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
X-Headers-End: 1pjpLH-0008IW-HV
Subject: Re: [f2fs-dev] [PATCH v2 16/23] xfs: add inode on-disk VERITY flag
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
Cc: fsverity@lists.linux.dev, linux-xfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, agruenba@redhat.com, djwong@kernel.org,
 damien.lemoal@opensource.wdc.com, linux-f2fs-devel@lists.sourceforge.net,
 hch@infradead.org, cluster-devel@redhat.com, dchinner@redhat.com,
 rpeterso@redhat.com, xiang@kernel.org, jth@kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Andrey,

On Tue, Apr 04, 2023 at 04:53:12PM +0200, Andrey Albershteyn wrote:
> Add flag to mark inodes which have fs-verity enabled on them (i.e.
> descriptor exist and tree is built).
> 
> Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
> ---
>  fs/ioctl.c                 | 4 ++++
>  fs/xfs/libxfs/xfs_format.h | 4 +++-
>  fs/xfs/xfs_inode.c         | 2 ++
>  fs/xfs/xfs_iops.c          | 2 ++
>  include/uapi/linux/fs.h    | 1 +
>  5 files changed, 12 insertions(+), 1 deletion(-)
[...]
> diff --git a/include/uapi/linux/fs.h b/include/uapi/linux/fs.h
> index b7b56871029c..5172a2eb902c 100644
> --- a/include/uapi/linux/fs.h
> +++ b/include/uapi/linux/fs.h
> @@ -140,6 +140,7 @@ struct fsxattr {
>  #define FS_XFLAG_FILESTREAM	0x00004000	/* use filestream allocator */
>  #define FS_XFLAG_DAX		0x00008000	/* use DAX for IO */
>  #define FS_XFLAG_COWEXTSIZE	0x00010000	/* CoW extent size allocator hint */
> +#define FS_XFLAG_VERITY		0x00020000	/* fs-verity sealed inode */
>  #define FS_XFLAG_HASATTR	0x80000000	/* no DIFLAG for this	*/
>  

I don't think "xfs: add inode on-disk VERITY flag" is an accurate description of
a patch that involves adding something to the UAPI.

Should the other filesystems support this new flag too?

I'd also like all ways of getting the verity flag to continue to be mentioned in
Documentation/filesystems/fsverity.rst.  The existing methods (FS_IOC_GETFLAGS
and statx) are already mentioned there.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
