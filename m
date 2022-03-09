Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A41AC4D3C8D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Mar 2022 23:04:13 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nS4Pk-0006nw-AD; Wed, 09 Mar 2022 22:04:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1nS4Pi-0006no-Dl
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Mar 2022 22:04:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hSsTLs8ZDilOUd+oci1dYu4dZTikbSV+GOgmdMs8jZ8=; b=l6dNnFVKgBoapouxP9mzyU/N9x
 CIteOhZS1FzzS0V2k8V147Xni/Jnj1ZY6wkxY51Gc30gE9/tuQctvpzoa9GmkXQ8KhHUAW+Z2+VGH
 csSwp1Raxa8JUQD1Nrcb/QpKw+PXJKnGxWU7NN0yQOw/DJP+3aLVEjpuqmXKzOoLbVRo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hSsTLs8ZDilOUd+oci1dYu4dZTikbSV+GOgmdMs8jZ8=; b=GNMfSMxstL49D+CA1wrJwPR5tV
 QG4vcQXPapRAJvb2rih4yADIfLKRHoPa/97Lu4UXSMgmSbXmHKpqYxjhmcLNcRde/ZAgTXiFLM7wP
 m4W91+N7XL9En6/YBSLftXBfPJc57K1GFic5dmx6+05nakCGxlRPDNG3Lfq1mBC0u6rQ=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nS4Pf-0002eE-RA
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Mar 2022 22:04:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 84A94B823FC;
 Wed,  9 Mar 2022 22:04:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E02FFC340E8;
 Wed,  9 Mar 2022 22:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646863440;
 bh=SSpfr1b2f3+DNRdsuvOihzlrhkKi+VQ6CxXUEoX5hjk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qfrxohpjXBAm8VmdaiLrg1/L0mE5flr2o/g5J2z9bsXM2YjjVlgVRo1vpfa5rLfeM
 KLQVLPxAw/KcKpAMrWlivbTtm/RQgf+JypnVFd63NHcuEZusenBsypd+0DzFbcfg+f
 csAEilzxq9SMYbOnZZFhFJ2VoPh5qE2+nb9yw4v2FuJiLYjgt4eLal3IjTCQYpce2T
 UQ3UyWiSFzn872tTqMNZVoUOVkmK9PqS4FHYcEVwZmSqdsqkfFw8iOFgVajdwUdE8S
 l7SieavFgIMUMgYvAy/wZfjh+nN5q3jJh4chBAY7V+1eU2HGd4ihmTAvveFTmu74Nc
 nOuQqqMCBDzZw==
Date: Wed, 9 Mar 2022 14:03:58 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Message-ID: <YikkTgK7aXvONopy@google.com>
References: <20220228124123.856027-1-hch@lst.de>
 <20220228124123.856027-3-hch@lst.de>
 <782226e0-5e7a-aec8-b9aa-e7fd7b3110a7@kernel.org>
 <20220308060624.GA23629@lst.de>
 <779bf1fe-7f58-51ed-27e8-1152375780ff@kernel.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <779bf1fe-7f58-51ed-27e8-1152375780ff@kernel.dk>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Jens, On 03/08, Jens Axboe wrote: > On 3/7/22 11:06 PM,
 Christoph Hellwig wrote: > > On Tue, Mar 01, 2022 at 10:49:06AM +0800, Chao
 Yu wrote: > >> On 2022/2/28 20:41, Christoph Hellwig wrote: > >>> Refactor
 [...] Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nS4Pf-0002eE-RA
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: pass the bio operation to
 bio_alloc_bioset
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
Cc: linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Jens,

On 03/08, Jens Axboe wrote:
> On 3/7/22 11:06 PM, Christoph Hellwig wrote:
> > On Tue, Mar 01, 2022 at 10:49:06AM +0800, Chao Yu wrote:
> >> On 2022/2/28 20:41, Christoph Hellwig wrote:
> >>> Refactor block I/O code so that the bio operation and known flags are set
> >>> at bio allocation time.  Only the later updated flags are updated on the
> >>> fly.
> >>>
> >>> Signed-off-by: Christoph Hellwig <hch@lst.de>
> >>
> >> Reviewed-by: Chao Yu <chao@kernel.org>
> > 
> > Is it okay for Jens to pick these two patches up in the
> > https://git.kernel.dk/cgit/linux-block/log/?h=for-5.18/alloc-cleanups
> > branch?
> 
> I have tentatively done so, let me know you prefer doing it differently.

I've acked to the patches, and it seems they need to be landed in block.
Thank you.

> 
> -- 
> Jens Axboe


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
