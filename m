Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B36157258DA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 Jun 2023 10:56:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q6oyE-00042H-6o;
	Wed, 07 Jun 2023 08:56:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1q6oyC-00042B-IH
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jun 2023 08:56:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=p9mZbvVzpDfX5g7iD0OIB5CwRcLk/SMbu6Nf043CLVk=; b=boLc57omYUlBLBOh8b2jff+E7S
 SJ04n8YdBvVxNXL6hAKgl0Kb/clOcxfyTmLNApBSO3wtJuoiEP2O6QFrf4mSxVwRFgLn+boTGQOvN
 bOEB1AV0hau/IQgBwxV6OqPsgje3z/1pyni6DE9/DeppGPLE1pUaTYmyO/hBTQfjKZok=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=p9mZbvVzpDfX5g7iD0OIB5CwRcLk/SMbu6Nf043CLVk=; b=lFI62dYu4P/hMdUp8Un8jL7t82
 B0Za0Zn6E00mgIx78kFsQY2IswpGMGBNbAJDZsLLVBxaqROf1RfeGa80LsqZIygI7Ufna7slg/qSI
 rRKYG7uCQU3d4diUuNviF3BTV+1MMEePruDhUqQHPfBwq8J4TlMsnqT8wPF0UhPrPy4k=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q6oyC-00DXMr-CD for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jun 2023 08:56:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BDFE163429;
 Wed,  7 Jun 2023 08:56:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1335C433EF;
 Wed,  7 Jun 2023 08:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686128198;
 bh=XuHwZ7uaJVjyv+iO/vUQkX77q29hjzoGO5w56uvjEOo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DeEXqe9gjxY57lITqd/lXcoE1Ca1KQPvngcywi2EuF55EYz48E3pBAh+rBHch2qBA
 ypy5YdNuEogegS0vPCR+mV99Mk5TjM1rLBF97+R9HX9ukYW6ykKDq2gqNInuZMB6Ay
 XHzbm7kvaBLnWy14BEPIjrerESWXdSFPaBlrm0swncJDI/92I5eylBFX/moeEz7CG1
 vaPZG0fzC0csi3IKOuDwjj7N745wxtG3agr3NgG0FuEl8trHhZ//gdGhKV06s6qy39
 mpg9F8OAP6YYyEg/4+2k3U5GSd1wxRxtUnh4mR7ZFx9c5gnEAxwjVBNp5aPITn0SFx
 tka8Sp1jBTEXw==
Date: Wed, 7 Jun 2023 10:56:29 +0200
From: Christian Brauner <brauner@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20230607-fliehen-abwurf-56e4abb8cc2a@brauner>
References: <20230606073950.225178-1-hch@lst.de>
 <20230606073950.225178-19-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230606073950.225178-19-hch@lst.de>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Jun 06, 2023 at 09:39:37AM +0200, Christoph Hellwig
 wrote: > There is no real need to store the open mode in the super_block
 now. > It is only used by f2fs, which can easily recalculate it. > [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q6oyC-00DXMr-CD
Subject: Re: [f2fs-dev] [PATCH 18/31] fs: remove sb->s_mode
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

On Tue, Jun 06, 2023 at 09:39:37AM +0200, Christoph Hellwig wrote:
> There is no real need to store the open mode in the super_block now.
> It is only used by f2fs, which can easily recalculate it.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---

Looks good to me,
Acked-by: Christian Brauner <brauner@kernel.org>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
