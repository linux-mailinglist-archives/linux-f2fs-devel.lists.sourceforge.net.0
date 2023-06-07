Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CDEB7258FC
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 Jun 2023 11:00:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q6p1Q-0003o0-Cg;
	Wed, 07 Jun 2023 09:00:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1q6p1P-0003nt-Ar
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jun 2023 09:00:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bmYAt8mU64Y+EIk10wPJYlkZlkmcHKj5CsXfhW6m5kY=; b=aC4NCWZ/SRnd9Ed5J7JfNoo5LO
 SjFesDz2Y6XnlMLsKNxW8AWGzJhXAlejKiSfQyjSXYk43UnGDFyYIo41aOOJGMHruu7yE93vlmPJj
 yXveW/wnxPT5z/euOCZ4he6RcixCOcZeKGKXCHKk4iU1RE/1VgVYeTI/HjCFW03sMLkA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bmYAt8mU64Y+EIk10wPJYlkZlkmcHKj5CsXfhW6m5kY=; b=Je8HRbVPKHxtTmeT+2AHzZrMxG
 GVtdWmowQmGIJ77REVrkgJeTtwDAoyf0k5ZJ4SyyFea4D8EcFx03erEE3NlpiuJqMeq9dCaqeLHZu
 0dCZIheDr/AvStqv6nbd2q1xYuZlZK2kbA84ibtQn2P+Ku7J6Hqvy9+8gah2CBF7g6+I=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q6p1O-00052c-58 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jun 2023 09:00:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BDEA3635B9;
 Wed,  7 Jun 2023 08:59:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAB4EC433D2;
 Wed,  7 Jun 2023 08:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686128396;
 bh=dWWAX+xiOcKgosI96OuwvEEnQrX5qRsaWpXnfV3wzsE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Rwe2e1Ca9g5PndSdWAR4ZxhkRR64XFN5oQuwRMk1FjfKraaCfNVTxn+BRhKyU+j/u
 jg5JQ/jKXtDHzI9Uwmc7YThBmkwPCntyA1Nizp191gMau+kmlELxOjWKjvxjAc9JC2
 RzBDL0p3j0FOCM7TOYUceH21NOI4PozRLAB2K3uQBAYBUemNsIy2dYg//LtIYEwErf
 BV8xPRNRnufBYP0cou5VW32ptS1X7HphuSax6//1cqt1yDk43UFdKboMkPJBkTDSpW
 GYhjav9dOdhYt8kknuatTMef0vgcOMh+q/hcr0bQH+Xq3sSPWUNEM6OXHtet+bxkeT
 12uBxWHxB1Ryw==
Date: Wed, 7 Jun 2023 10:59:48 +0200
From: Christian Brauner <brauner@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20230607-pechvogel-monument-a22bf628a09c@brauner>
References: <20230606073950.225178-1-hch@lst.de>
 <20230606073950.225178-23-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230606073950.225178-23-hch@lst.de>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Jun 06, 2023 at 09:39:41AM +0200, Christoph Hellwig
 wrote: > Instead of passing a fmode_t and only checking it fo0r FMODE_WRITE,
 pass > a bool open_for_write to prepare for callers that won't [...] 
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
X-Headers-End: 1q6p1O-00052c-58
Subject: Re: [f2fs-dev] [PATCH 22/31] nvme: replace the fmode_t argument to
 the nvme ioctl handlers with a simple bool
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

On Tue, Jun 06, 2023 at 09:39:41AM +0200, Christoph Hellwig wrote:
> Instead of passing a fmode_t and only checking it fo0r FMODE_WRITE, pass
> a bool open_for_write to prepare for callers that won't have the fmode_t.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---

Looks good to me,
Acked-by: Christian Brauner <brauner@kernel.org>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
