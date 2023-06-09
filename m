Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A9B729F2B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  9 Jun 2023 17:50:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q7eNK-00029o-O2;
	Fri, 09 Jun 2023 15:50:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <kbusch@kernel.org>) id 1q7eNJ-00029i-Kp
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 09 Jun 2023 15:50:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0OnG4BzavkIkRsoSKPQtFcsTzHVmQDZ4N5dtwuYHgN0=; b=h7/M4rG1ccek32eMuSBAMnpJ3v
 sW2DST3KbIaILODXLk8BTNsL+CyrP6XFM5jNwjumWSwqzqaF+M+Ok0clpY5CcAaPsBO6VDr4iz0a5
 UB+7LsIeEbSMiCF2uhhWHzkqLLbF5DLRfFsGGZ5JyLf+Wc0mvoavXQzlRzn09L1dp0ow=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0OnG4BzavkIkRsoSKPQtFcsTzHVmQDZ4N5dtwuYHgN0=; b=msCu4qI5788jLCcldrQ4eIbeRG
 bubqAZpJvmsPoSJAVf3JmKFigkQxlqfCwsRHtQC37BsgyomgJOCPXckXKSCBZy0ZIaFnYcGk8tXo6
 tfw6fTHYl8vgGi0p+mtWCLnGWNzmDhONedlVz9VIFdwFKjvjNMHne6/6l6PxWmvTH0Bk=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q7eNJ-00035e-Ht for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 09 Jun 2023 15:50:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AEE3465969;
 Fri,  9 Jun 2023 15:49:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DD00C433D2;
 Fri,  9 Jun 2023 15:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686325797;
 bh=0OnG4BzavkIkRsoSKPQtFcsTzHVmQDZ4N5dtwuYHgN0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NHtOuYp0TmsS9C41zBB8bRnNowLvmEqTLajK40KrGYXbNtm+pGnwaZIgRwj7VkfF6
 ToT8ZkmVhHIYZITuzZR8dQwIKnvzyfbSqu3MTnPYi2yHHrCzSD4+fIyFK5IRer3XSE
 XP1/X6pcw/4xghZaL8LBbcBoazv3n/axO9Egj4JkEQopsHm5F28FzihGpJtB/yUnWf
 u498nYtGJPusyoaO38WDi7BxJhU0L9Jzdyc15SGKMxUEIq6a91z46ZPKQW9cNiYeTw
 fctvLRTOSN3cJGWM77Zf1OWNHYkAvGdXMKCYo1D/Qj6F/3niSHHWcYC4L/fFNtQiR2
 L5jLwoeehBLHg==
Date: Fri, 9 Jun 2023 09:49:53 -0600
From: Keith Busch <kbusch@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <ZINKIQbBc0MB9wRz@kbusch-mbp>
References: <20230608110258.189493-1-hch@lst.de>
 <20230608110258.189493-22-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230608110258.189493-22-hch@lst.de>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Looks good. Reviewed-by: Keith Busch <kbusch@kernel.org> 
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
X-Headers-End: 1q7eNJ-00035e-Ht
Subject: Re: [f2fs-dev] [PATCH 21/30] nvme: replace the fmode_t argument to
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
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-btrfs@vger.kernel.org,
 Hannes Reinecke <hare@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Looks good.

Reviewed-by: Keith Busch <kbusch@kernel.org>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
