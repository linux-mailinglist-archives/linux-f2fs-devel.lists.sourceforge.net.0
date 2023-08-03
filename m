Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8437976F18A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Aug 2023 20:12:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qRcny-0005aD-TH;
	Thu, 03 Aug 2023 18:12:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1qRcnx-0005a7-Ax
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 03 Aug 2023 18:12:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uThKvCesp1pPRQ58CfmvaR6GJypGeJeD/7LXvjJ8S5k=; b=R+04NfVcwADpx2DVqc6EfW6dv4
 3VUgOIBgJ0xnC3KxLvI1wPDaiFefyfvmZnKj4jQoiV/kaUh4umVj/dWrCldeQWAGhJTtkwuKMiNAW
 5PuZJE7rE8hJBP1QyOMgC/ggIDS07FpuUovMs2ow2uG9/gxyc8M0+uhfREICxmjT0D7k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uThKvCesp1pPRQ58CfmvaR6GJypGeJeD/7LXvjJ8S5k=; b=E7gSU/oDoY51j7I1BeoA4A6Z4b
 ceiRJ7NcJhkjOtwumVQrJmttnDoUCDxjJrfkeb2ROtMtUaAodYmBiIJX9FP6K2urHY2fNxaKiPt5I
 FyisfMBtLMWkRXUip59O6TBBpPo26ulXmbSWBeDl45KgXIOD7nFRAdKRDrIPMpsfNzQU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qRcnx-0007SQ-6o for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 03 Aug 2023 18:12:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 97DE861E4E;
 Thu,  3 Aug 2023 18:12:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1541C433C8;
 Thu,  3 Aug 2023 18:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691086323;
 bh=FvE8CcpTg/rwFyIjkGKpbi4sVFpEPrWRcbOUHH0og0E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pW7WFuTLRAPoN8tiK+U2RXIY2N8l9VIKhr4v5EuwvrjQjf3HdRQf7xbN68UZZ46zH
 SO1MA9DuRBFsu/t101HYGMhge4PpqCvyyFdCSiM6yxB5L2rIj/XJaXXMMh9Zh/Cuu+
 co+kKz1UN7oez5C8+giAJgZwdFug00bKSW2NUiG/NmUDxnk6vUU0SV5iwwzbS7c9PV
 ENMI160o/kjEUAuSQu7B0b9aiWQQ359FaQygUVE6PTlsN667YIfLe7I1yKSIAq18O6
 t1BukcVZsqtEKb564oyOfYihvq+7U4lXIKeLsRGPjRhjk5Iylovvs66qrt9tj6OKwC
 WUm7iF7kPoIZQ==
Date: Thu, 3 Aug 2023 20:11:56 +0200
From: Christian Brauner <brauner@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20230803-zornig-drucken-7e2a53465a15@brauner>
References: <20230802154131.2221419-1-hch@lst.de>
 <20230802154131.2221419-7-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230802154131.2221419-7-hch@lst.de>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Aug 02, 2023 at 05:41:25PM +0200, Christoph Hellwig
 wrote: > The file system type is not a very useful holder as it doesn't allow
 us > to go back to the actual file system instance. Pass the s [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qRcnx-0007SQ-6o
Subject: Re: [f2fs-dev] [PATCH 06/12] fs: use the super_block as holder when
 mounting file systems
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 linux-nilfs@vger.kernel.org, Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org, "Darrick J. Wong" <djwong@kernel.org>,
 Josef Bacik <josef@toxicpanda.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Chris Mason <clm@fb.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>, Al Viro <viro@zeniv.linux.org.uk>,
 Jaegeuk Kim <jaegeuk@kernel.org>, David Sterba <dsterba@suse.com>,
 Theodore Ts'o <tytso@mit.edu>, linux-ext4@vger.kernel.org,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Aug 02, 2023 at 05:41:25PM +0200, Christoph Hellwig wrote:
> The file system type is not a very useful holder as it doesn't allow us
> to go back to the actual file system instance.  Pass the super_block instead
> which is useful when passed back to the file system driver.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---

Looks good to me,
Reviewed-by: Christian Brauner <brauner@kernel.org>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
