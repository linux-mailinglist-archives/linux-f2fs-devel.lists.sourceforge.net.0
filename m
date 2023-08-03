Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E2B76F19C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Aug 2023 20:15:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qRcrA-00078V-Ex;
	Thu, 03 Aug 2023 18:15:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1qRcr7-00078K-AX
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 03 Aug 2023 18:15:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+u3l9TwYlN5F0bLxygCRRfY/pzb6e3ePMnicjpEYyNw=; b=CPGTfqDXn9Wkd5js5gN7pQkzXU
 tUX0pDbXkfn2FYe4+OKn+UFH5nmClA7qhsnmMn7A6ltHqulHiU7IHpHL9MNAxPOGCsW9xYUblBTki
 CyNpblF2+WuO1UJhd/oNiGjUJK0LnL/ufCx5wd7lYVNdkaJlZ/sKVf/H/RrDTTSdnICQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+u3l9TwYlN5F0bLxygCRRfY/pzb6e3ePMnicjpEYyNw=; b=mddYlAN4zx4q2bePkGxcsI7yIm
 IA/2uWzYq1fKHlxEtUGbO/JZRbPQMxtQPrabO111C7cL7lCcqYkCpXIvlyUTJMmnapLlh33pBUl5i
 +jTf4O1+PoyMzxZzpf/ArReXZwROYULiI170rz6m19xIu9oibnqbeX9Kd8SSjM153DaU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qRcr5-0007Xe-KX for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 03 Aug 2023 18:15:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1178761E4A;
 Thu,  3 Aug 2023 18:15:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 356B0C433C7;
 Thu,  3 Aug 2023 18:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691086517;
 bh=7WvYC67Xe7oFF+cFC3hBpoW1fSKlO5ncgxOAS6uNu5M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M+0H21hPL+ViqgirVBRmgZ4PVVO0IsTWsesv9cA8GHZUL2nO1Jaskrh1hTcb8hJgn
 zcbTF80tO8RHk8SPGrBaIY1HWV9lAP9kNCAvgF90TSNFmKJ61pagPvH2VFoo87Hcb6
 R4MGzUpmn/vOw9saQfSEZSvf4/PMN97ff43Y1NGByYWS7kQY2fYrEvIo6C0QHTG02q
 khnbhGSsGhhH0hk6KEOVJA7QyCJawZo/H8HB+DK7XECpYi8elC4KWWHzdhJoLk80T6
 k6n3yR57Ezm420usiThIMT2fn0n+EuAnrG0tm69k3En+xpEtbBxuMQMsPeRVFWq9as
 HeB02bJmZTTNw==
Date: Thu, 3 Aug 2023 20:15:10 +0200
From: Christian Brauner <brauner@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20230803-umringt-aufprallen-e3adc44d2c75@brauner>
References: <20230802154131.2221419-1-hch@lst.de>
 <20230802154131.2221419-8-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230802154131.2221419-8-hch@lst.de>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Aug 02, 2023 at 05:41:26PM +0200, Christoph Hellwig
 wrote: > fs_mark_dead currently uses get_super to find the superblock for
 the > block device that is going away. This means it is limited to [...] 
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
X-Headers-End: 1qRcr5-0007Xe-KX
Subject: Re: [f2fs-dev] [PATCH 07/12] fs: stop using get_super in
 fs_mark_dead
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

On Wed, Aug 02, 2023 at 05:41:26PM +0200, Christoph Hellwig wrote:
> fs_mark_dead currently uses get_super to find the superblock for the
> block device that is going away.  This means it is limited to the
> main device stored in sb->s_dev, leading to a lot of code duplication
> for file systems that can use multiple block devices.
> 
> Now that the holder for all block devices used by file systems is set
> to the super_block, we can instead look at that holder and then check
> if the file system is born and active, so do that instead.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---

Looks good to me,
Reviewed-by: Christian Brauner <brauner@kernel.org>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
