Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 329FCC681BE
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Nov 2025 09:04:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=urxI0DaAWLGcGrfEJz6iFfaIBNS4XGhHU/ONQ4+hrWY=; b=hNup4XUFROlr3PECwaMd5WwDuu
	IFzzcgcc/3c4qrpzy0ZjG4nyEUy5n4p/XbC+ysuBZIn5arcRcQrMeycLb/OE8TCKWaCqlXHdniz5N
	PE1b4v8SsuacBbIncnfdBVQrFKCSK+sazIa6KKS8EDXDMccw7v6zBVsTzvcuEwLbNpzg=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vLGhg-0006BT-Ch;
	Tue, 18 Nov 2025 08:04:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1vLGhf-0006BN-6I
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Nov 2025 08:04:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2ae9dVXaMyDnd4Kw/4lTGXVV+GojOzw7T+c7SR5U7ak=; b=lnx4NtaaEFqKcgFqR2fXhFyNEY
 YaNyVpgtNQWHcccryr/jtkdrUvJmi7yZP7LnKru46nwJUnIkGNjUGbBKPdi3LMLJOQjNkoU5qYxkY
 +wSuHbCdA1DCXGqjNRqmhMUEjKHl238NDa67WwmsWOIRdeoATlkG6w3olwYpTcysJD/U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2ae9dVXaMyDnd4Kw/4lTGXVV+GojOzw7T+c7SR5U7ak=; b=WNZSfl7Ar65ZgMiEXd1LEIPQEd
 dAo42o4IveaJ0gOCjsy2wo9mJ72hxi/JFdQQ5Rhmtr9/7uwNdBgzyapYXASC4RfYxDRyRJ4QVVB6y
 SpdJkAcgOdLt/0k0u7hznWDSlcUHqVcZDpDPzCLw6PZHllBKJOH1WNvMHPKef273r7fk=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vLGhe-0002zA-FH for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Nov 2025 08:04:43 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 4C26167373; Tue, 18 Nov 2025 09:04:27 +0100 (CET)
Date: Tue, 18 Nov 2025 09:04:27 +0100
From: Christoph Hellwig <hch@lst.de>
To: Chaitanya Kulkarni <ckulkarnilinux@gmail.com>
Message-ID: <20251118080427.GA26299@lst.de>
References: <20251118074243.636812-1-ckulkarnilinux@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251118074243.636812-1-ckulkarnilinux@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Nov 17, 2025 at 11:42:43PM -0800, Chaitanya Kulkarni
 wrote: > Due to involvement of all the subsystem making it as an RFC, ideally
 > it shuoldn't be an RFC. I think best would be a series that drops error
 checking first, and then changes the return type. That way we can maybe get
 all the callers fixed up in this merge window and then drop the return value
 [...] Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
X-Headers-End: 1vLGhe-0002zA-FH
Subject: Re: [f2fs-dev] [RFC PATCH] block: change __blkdev_issue_discard()
 return type to void
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
Cc: dm-devel@lists.linux.dev, linux-raid@vger.kernel.org, kch@nvidia.com,
 sagi@grimberg.me, cem@kernel.org, snitzer@kernel.org,
 linux-nvme@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, song@kernel.org, mpatocka@redhat.com,
 axboe@kernel.dk, jaegeuk@kernel.org, yukuai3@huawei.com, hch@lst.de,
 linux-xfs@vger.kernel.org, agk@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Nov 17, 2025 at 11:42:43PM -0800, Chaitanya Kulkarni wrote:
> Due to involvement of all the subsystem making it as an RFC, ideally
> it shuoldn't be an RFC.

I think best would be a series that drops error checking first,
and then changes the return type.  That way we can maybe get all
the callers fixed up in this merge window and then drop the return
value after -rc1.
>  			gfp_mask)))
>  		*biop = bio_chain_and_submit(*biop, bio);
> -	return 0;
>  }
>  EXPORT_SYMBOL(__blkdev_issue_discard);
>  
> @@ -90,8 +89,8 @@ int blkdev_issue_discard(struct block_device *bdev, sector_t sector,
>  	int ret;
>  
>  	blk_start_plug(&plug);
> -	ret = __blkdev_issue_discard(bdev, sector, nr_sects, gfp_mask, &bio);
> -	if (!ret && bio) {
> +	__blkdev_issue_discard(bdev, sector, nr_sects, gfp_mask, &bio);

ret now needs to be initialized to 0 above.

> index 8d246b8ca604..f26010c46c33 100644
> --- a/drivers/nvme/target/io-cmd-bdev.c
> +++ b/drivers/nvme/target/io-cmd-bdev.c
> @@ -366,16 +366,11 @@ static u16 nvmet_bdev_discard_range(struct nvmet_req *req,
>  		struct nvme_dsm_range *range, struct bio **bio)
>  {
>  	struct nvmet_ns *ns = req->ns;
> -	int ret;
>  
> -	ret = __blkdev_issue_discard(ns->bdev,
> +	__blkdev_issue_discard(ns->bdev,
>  			nvmet_lba_to_sect(ns, range->slba),
>  			le32_to_cpu(range->nlb) << (ns->blksize_shift - 9),
>  			GFP_KERNEL, bio);
> -	if (ret && ret != -EOPNOTSUPP) {
> -		req->error_slba = le64_to_cpu(range->slba);
> -		return errno_to_nvme_status(req, ret);
> -	}
>  	return NVME_SC_SUCCESS;

nvmet_bdev_discard_range can return void now.

> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index b45eace879d7..e6078176f733 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -1346,7 +1346,7 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
>  		if (time_to_inject(sbi, FAULT_DISCARD)) {
>  			err = -EIO;
>  		} else {
> -			err = __blkdev_issue_discard(bdev,
> +			__blkdev_issue_discard(bdev,
>  					SECTOR_FROM_BLOCK(start),
>  					SECTOR_FROM_BLOCK(len),
>  					GFP_NOFS, &bio);

Please fold the following 'if (err)' block directly into the injection
one, and either initialize err to 0, or use a direct return from that
block to skip the last branch in the function checking err.

>  	blk_finish_plug(&plug);
>  
> -	return error;
> +	return 0;

Please drop the error return for xfs_discard_extents entirely.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
