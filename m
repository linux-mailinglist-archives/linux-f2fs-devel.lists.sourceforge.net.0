Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 50941C7F103
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Nov 2025 07:30:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TnhI37av0wxROuzWPn2VUKyIQ1PlD5usZS4qwkaFbds=; b=XiicX98nZIDCNtDRu8nr0XymSM
	QYfEQMBqBqAfOTJbwufdpY0KkFuIect0NnDIVVC9b0pkFSvakZhQaS6ec1VexAlY0a8mjVTftBKYL
	hNVROP8xLdW8h+2DNv1+stvEpDKXzhhvZ/yifGNWB3V1mWpInyb7jA2si7Jp8h33xUmg=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vNQ5v-0006ww-CY;
	Mon, 24 Nov 2025 06:30:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1vNQ5h-0006wf-SM
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Nov 2025 06:30:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Q35Uzhw2kUdUnX+0WJUFRb4cV3+/l9MC0GtyEz30cco=; b=PB1JEBiG25HVhw6p+IIQIqC5dx
 T5H/qJB3MDZCMf8VWMvQKhBBlhPTtZYgTVB52oZDAze4Gur6ZiRRqgu3Plhkq6pAdn4LjCiUhdYp0
 0l1pUWv1nJfrQdmP5IM/btyf3ENB8kLNUqb2WCg4XmiZ0fSpZGimJ2lgfP1mOQhhjbgY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Q35Uzhw2kUdUnX+0WJUFRb4cV3+/l9MC0GtyEz30cco=; b=DqdEm1pUdV4IO4VNH0rCo5LpCH
 /tvnPlsopaIV0Wf+i7qynBtAjoyR50X/ig6ipy8krELQMeu5YQ/dFBTnf9z7CoXZJKPzBkiA0tXvI
 8QVyVxJKU9cxYc4nohoemhg6r0zNqNj4ff7DdiXKkfp1eKTYibplgMt0GHTxGZlNXpoM=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vNQ5h-0007EM-6m for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Nov 2025 06:30:25 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id B44AD68B05; Mon, 24 Nov 2025 07:30:11 +0100 (CET)
Date: Mon, 24 Nov 2025 07:30:11 +0100
From: Christoph Hellwig <hch@lst.de>
To: Chaitanya Kulkarni <ckulkarnilinux@gmail.com>
Message-ID: <20251124063011.GA16808@lst.de>
References: <20251124025737.203571-1-ckulkarnilinux@gmail.com>
 <20251124025737.203571-5-ckulkarnilinux@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251124025737.203571-5-ckulkarnilinux@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sun, Nov 23, 2025 at 06:57:36PM -0800, Chaitanya Kulkarni
 wrote: > + __blkdev_issue_discard(bdev, > + SECTOR_FROM_BLOCK(start), > +
 SECTOR_FROM_BLOCK(len), > + GFP_NOFS, &bio); This can be shortened a bit
 as well: Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
X-Headers-End: 1vNQ5h-0007EM-6m
Subject: Re: [f2fs-dev] [PATCH V2 4/5] f2fs: ignore discard return value
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
Cc: axboe@kernel.dk, dm-devel@lists.linux.dev,
 linux-f2fs-devel@lists.sourceforge.net, kch@nvidia.com, sagi@grimberg.me,
 linux-xfs@vger.kernel.org, cem@kernel.org, snitzer@kernel.org,
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-raid@vger.kernel.org, linux-block@vger.kernel.org, song@kernel.org,
 mpatocka@redhat.com, jaegeuk@kernel.org, bpf@vger.kernel.org, yukuai@fnnas.com,
 hch@lst.de, agk@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sun, Nov 23, 2025 at 06:57:36PM -0800, Chaitanya Kulkarni wrote:
> +		__blkdev_issue_discard(bdev,
> +				SECTOR_FROM_BLOCK(start),
> +				SECTOR_FROM_BLOCK(len),
> +				GFP_NOFS, &bio);

This can be shortened a bit as well:

		__blkdev_issue_discard(bdev, SECTOR_FROM_BLOCK(start),
				SECTOR_FROM_BLOCK(len), GFP_NOFS, &bio);

Otherwise looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
