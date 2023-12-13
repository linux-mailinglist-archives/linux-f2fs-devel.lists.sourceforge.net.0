Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DC4810CD3
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 Dec 2023 09:57:28 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rDL3N-0006SG-JP;
	Wed, 13 Dec 2023 08:57:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1rDL3K-0006S2-Tq
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 Dec 2023 08:57:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dkkiwplReJT1Tqb2v+m7SExaMgX/Diz/74MN5QMkq70=; b=HnUK/D9a/QqBFc9+AACBLKxdsq
 4DYJvl5suV1HoXpKXHz78QSBpDZgtUfaZEfuHcDHD8irOjvnCNa4plLHPa45AQOnklypdSbjORrQZ
 MK+2NQVAumUAteEJQZXR2aYieqd5+ss6jAQbihYc4gN7yVXv4bQ14BpHxLjD323GwYx0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dkkiwplReJT1Tqb2v+m7SExaMgX/Diz/74MN5QMkq70=; b=SktU6jAgFiTJbNDi8674jKx7oF
 0WUnfwKzBovdsjgeBV6brUKO8YelqxLZ3Wf5IzUQ49tdUnRonlGwvK9/9rpBbYaeqVe9rsbaT/UuL
 IhAhlehUHbG2lkzn0WVVr6TTT3dVFU6a5px8UWC2gyjbR4RadF+Olrgq6ljfi49jZVTw=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rDL3I-0002xP-KL for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 Dec 2023 08:57:14 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 5D36767373; Wed, 13 Dec 2023 09:41:23 +0100 (CET)
Date: Wed, 13 Dec 2023 09:41:23 +0100
From: Christoph Hellwig <hch@lst.de>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20231213084123.GA6184@lst.de>
References: <20231213040018.73803-1-ebiggers@kernel.org>
 <20231213040018.73803-2-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231213040018.73803-2-ebiggers@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Dec 12, 2023 at 08:00:16PM -0800, Eric Biggers wrote:
 > From: Christoph Hellwig <hch@lst.de> > > blkdev_put must not be called
 under sb->s_umount to avoid a lock order > reversal with disk->op [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rDL3I-0002xP-KL
Subject: Re: [f2fs-dev] [PATCH 1/3] btrfs: call btrfs_close_devices from
 ->kill_sb
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
Cc: Christian Brauner <brauner@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Dec 12, 2023 at 08:00:16PM -0800, Eric Biggers wrote:
> From: Christoph Hellwig <hch@lst.de>
> 
> blkdev_put must not be called under sb->s_umount to avoid a lock order
> reversal with disk->open_mutex once call backs from block devices to
> the file system using the holder ops are supported.  Move the call
> to btrfs_close_devices into btrfs_free_fs_info so that it is closed
> from ->kill_sb (which is also called from the mount failure handling
> path unlike ->put_super) as well as when an fs_info is freed because
> an existing superblock already exists.

Thanks, this looks roughly the same to what I have locally.

I did in fact forward port everything missing from the get_super
series yesterday, but on my test setup btrfs/142 hangs even in the
baseline setup.  I went back to Linux before giving up for now.

Josef, any chane you could throw this branch:

    git://git.infradead.org/users/hch/misc.git btrfs-holder

into your CI setup and see if it sticks?  Except for the trivial last
three patches this is basically what you reviewed already, although
there was some heavy rebasing due to the mount API converison.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
