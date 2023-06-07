Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AA67E7257DD
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 Jun 2023 10:35:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q6odQ-0003eg-I4;
	Wed, 07 Jun 2023 08:35:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1q6odP-0003ea-7h
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jun 2023 08:35:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=utLozJ0+WCs5Ko5pQY5tkN1YQ8Tl20A8mAVO85MpDO8=; b=FttxcVzBN+ctiwX4hr91HuUDQO
 WbjI68jL1EFpqmURtT5xgZtjzyaNbrhwA5yKv9J9oh+iXdJTMffBVxiDfaSnKtYmwpswoYgCxWUX5
 rhuPudvtzP7bMO49zZ+Mft8kAirzREbZbt+Zd6ossMniW9r2e97b9Ek58lDnLJsgVyAY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=utLozJ0+WCs5Ko5pQY5tkN1YQ8Tl20A8mAVO85MpDO8=; b=MvNiRaHKBEvfFu1J7CFPZ+HDd2
 SPT88KbYhx5HznX9cjWxa8btghArpLKXas2ewAy/q9AiPeSjLg519thTd2YHvihreeC+KpT3QRG6o
 eoRmf29bGfulPJN+krWBd0wEWcwtGk3uu5kQ68iE9GuTSRyYKGs6jpeixWxtq51Y9vug=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q6odM-0003VP-7N for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jun 2023 08:35:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CDFCC63818;
 Wed,  7 Jun 2023 08:35:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9368FC433D2;
 Wed,  7 Jun 2023 08:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686126906;
 bh=DEpqJ01874Wcf6flpWQL4l3j+OyeWJJ1wSvscW2ZsvE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=i3CH5XZi7Ku/UmN1uNhGHrNxFPQhZ8efjNfiTbNsWjKI+qjrG2GJAlxpGl4WKzZoh
 BUa3cIn0dVM3WafUAzzbH8uuNxyByYfP8H70QxdowRN6RCs5nrCwMqpAWtTtCtkrfA
 UUoFuECYuwF6g6BZvtkz1yfF3SziUWNAxmfcDv+ZyAT15huu83Xslw1FDR3OSN3f7M
 cxo76H7oplo9/nKa80/LLfizTzZ0Gzi/jSYy7ksr7BoXSBWk0n4y6gq2zZA1zoG10d
 b82jMNFwK474uaEbmhI5IxsDz3/ABjdRxN6qmozleapT3Vy9qyc29Lz62fPrh+D/W5
 4FkCLrnTGlquQ==
Date: Wed, 7 Jun 2023 10:34:57 +0200
From: Christian Brauner <brauner@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20230607-inbetriebnahme-markieren-42711df12a4b@brauner>
References: <20230606073950.225178-1-hch@lst.de>
 <20230606073950.225178-11-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230606073950.225178-11-hch@lst.de>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Jun 06, 2023 at 09:39:29AM +0200, Christoph Hellwig
 wrote: > The mode argument to the ->release block_device_operation is never
 used, > so remove it. > > Signed-off-by: Christoph Hellwig <hch@ [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q6odM-0003VP-7N
Subject: Re: [f2fs-dev] [PATCH 10/31] block: remove the unused mode argument
 to ->release
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-nvme@lists.infradead.org,
 Phillip Potter <phil@philpotter.co.uk>, Chris Mason <clm@fb.com>,
 dm-devel@redhat.com, "Md. Haris Iqbal" <haris.iqbal@ionos.com>,
 Pavel Machek <pavel@ucw.cz>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Jack Wang <jinpu.wang@ionos.com>, linux-nilfs@vger.kernel.org,
 linux-scsi@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 linux-pm@vger.kernel.org, linux-um@lists.infradead.org,
 Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
 linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>,
 Jens Axboe <axboe@kernel.dk>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Jun 06, 2023 at 09:39:29AM +0200, Christoph Hellwig wrote:
> The mode argument to the ->release block_device_operation is never used,
> so remove it.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---

Good cleanup. Looks good to me,
Acked-by: Christian Brauner <brauner@kernel.org>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
