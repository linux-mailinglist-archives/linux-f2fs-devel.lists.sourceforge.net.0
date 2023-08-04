Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E221770501
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Aug 2023 17:40:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qRwu2-0005DI-O1;
	Fri, 04 Aug 2023 15:39:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1qRwtx-0005DB-GM
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 04 Aug 2023 15:39:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4nSuSrRvB/eUIaQUwnw+BXiKf+G16D7ch+jFXNS9l8Y=; b=h4DNguGLBA1MpSpZ9vX9lkG2Rh
 bH7hAZ2QCwjHSeIg7iucqVKTYL57bIefSMIxWjZSvXziJ2UAj0R1osjz+9q2J2EsDKE92/LncBYZN
 5nLidXMDhNg70m2p+LK5tNkO5qbI0gLHmrcXqGYuomYeSledL9Od9LUy3BIiVJn7Pjes=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4nSuSrRvB/eUIaQUwnw+BXiKf+G16D7ch+jFXNS9l8Y=; b=DXrryQ6AfTwb7WHZWYL9Kp0F2G
 DuIeMw2ELk/LYveGgLseGF+KZZQB/G0tsCDOaPv/UAkPu+/dDJVZiddFLqoyivgRLoHFlQ/UsvyAI
 Lor0I19Eln+06R5lu0p91RthY6fUpm4bIFZebQ7/YyOE1ey5xr9RYrURv432IN5ZBwK8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qRwts-0006YI-KL for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 04 Aug 2023 15:39:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 09BF56208A;
 Fri,  4 Aug 2023 15:39:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31522C433C9;
 Fri,  4 Aug 2023 15:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691163570;
 bh=WBKOiXxNnEcmIAXLd9bFnF2KFmCPgIBMmS+a6ZOzWKY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=guM3dTEfPj9gzW4hZVBn+/1D3e6V0oGJa3WQkuaCaRJm+YEkO/j0g28vpLcq+8KPx
 00I5JDimR9O6GRpM1sCbRoDBeqI3dA0US5iDcvRFH1wRzLZGMG/AKi+37CHK3OiKfl
 Pd3WUGjQp78CvSWurtOz9TKUp2R8T9+xWekamZzkpVJreEREn7gcZJVUpwDMtQgJPa
 oNlJ1Fd+Wv/UAECk8iLUJUaVzEv4k+34Xo4z1QJAK3CSDmvC6vv3w+O4TwoqgSUVxv
 yOZLQQe40+3upkBEjN2TRg8dq8CL62TzVM9oUzcd7edWypJQ/9r8RDeBu3CtctpdP3
 S7Paz1gf4bygw==
From: Christian Brauner <brauner@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Date: Fri,  4 Aug 2023 17:39:20 +0200
Message-Id: <20230804-wegelagerei-nagel-e5ba7e7cedd5@brauner>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230802154131.2221419-1-hch@lst.de>
References: <20230802154131.2221419-1-hch@lst.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3062; i=brauner@kernel.org;
 h=from:subject:message-id; bh=7FNUYW+x5CSjf6yCNgXxulkGn+cMsTW366YHSfu1h4A=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMaSclU4X5tucveB9lDl37gJ9jlmvFGN+KNg9TprAwbY/er8W
 31PtjlIWBjEuBlkxRRaHdpNwueU8FZuNMjVg5rAygQxh4OIUgIncNWf4K3Hkgdv/npvLfSQ798adms
 9ScvSZ2rptQtc471tqdUeIZzMyHOPQmly1SzxZ11D73stJc0XjnmfPNpO6vb5+SlL6wynWPAA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, 02 Aug 2023 17:41:19 +0200, Christoph Hellwig wrote:
 > this series sits on top of the vfs.super branch in the VFS tree and does
 a > few closely related things: > > 1) it also converts nilfs2 a [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qRwts-0006YI-KL
Subject: Re: [f2fs-dev] more blkdev_get and holder work
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
 Christian Brauner <brauner@kernel.org>, linux-nilfs@vger.kernel.org,
 Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org,
 "Darrick J. Wong" <djwong@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Chris Mason <clm@fb.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Al Viro <viro@zeniv.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>,
 David Sterba <dsterba@suse.com>, Theodore Ts'o <tytso@mit.edu>,
 linux-ext4@vger.kernel.org, Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, 02 Aug 2023 17:41:19 +0200, Christoph Hellwig wrote:
> this series sits on top of the vfs.super branch in the VFS tree and does a
> few closely related things:
> 
>   1) it also converts nilfs2 and btrfs to the new scheme where the file system
>      only opens the block devices after we know that a new super_block was
>      allocated.
>   2) it then makes sure that for all file system openers the super_block is
>      stored in bd_holder, and makes use of that fact in the mark_dead method
>      so that it doesn't have to fall get_super and thus can also work on
>      block devices that sb->s_bdev doesn't point to
>   3) it then drops the fs-specific holder ops in ext4 and xfs and uses the
>      generic fs_holder_ops there
> 
> [...]

Let's pick this up now so it still has ample time in -next even though
we're still missing a nod from the btrfs people. The nilfs to
mount_bdev() conversion is probably not super urgent but if wanted a
follow-up patch won't be frowned upon.

---

Applied to the vfs.super branch of the vfs/vfs.git tree.
Patches in the vfs.super branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: vfs.super

[01/12] fs: export setup_bdev_super
        https://git.kernel.org/vfs/vfs/c/71c00ec51d83
[02/12] nilfs2: use setup_bdev_super to de-duplicate the mount code
        https://git.kernel.org/vfs/vfs/c/c820df38784a
[03/12] btrfs: always open the device read-only in btrfs_scan_one_device
        https://git.kernel.org/vfs/vfs/c/75029e14cea6
[04/12] btrfs: open block devices after superblock creation
        https://git.kernel.org/vfs/vfs/c/364820697dbb
[05/12] ext4: make the IS_EXT2_SB/IS_EXT3_SB checks more robust
        https://git.kernel.org/vfs/vfs/c/4cf66c030db1
[06/12] fs: use the super_block as holder when mounting file systems
        https://git.kernel.org/vfs/vfs/c/c0188baf8f7e
[07/12] fs: stop using get_super in fs_mark_dead
        https://git.kernel.org/vfs/vfs/c/2a8402f9db25
[08/12] fs: export fs_holder_ops
        https://git.kernel.org/vfs/vfs/c/ee62b0ec9ff8
[09/12] ext4: drop s_umount over opening the log device
        https://git.kernel.org/vfs/vfs/c/644ab8c64a12
[10/12] ext4: use fs_holder_ops for the log device
        https://git.kernel.org/vfs/vfs/c/fba3de1aad77
[11/12] xfs: drop s_umount over opening the log and RT devices
        https://git.kernel.org/vfs/vfs/c/9470514a171c
[12/12] xfs use fs_holder_ops for the log and RT devices
        https://git.kernel.org/vfs/vfs/c/c6fb2ed736e3


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
