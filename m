Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E403DBEE1
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 30 Jul 2021 21:17:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m9Y0w-0005Vq-80; Fri, 30 Jul 2021 19:17:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1m9Y0u-0005Vg-Jt
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 30 Jul 2021 19:17:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IbvE+Fy7xp2eqKsUnzkxegiUclABW9T6Aw+9uuEiLs0=; b=WUFDEgUxmwJxhQ5CP5yPByHekL
 4ayQE1Mdlko0JPVjFZCxNnhKXXpjpQa10ZO7RMyvOmSe10M3O+aTbdm8NN/Y3dYBgApfu+mjIF0V5
 CNvE7cKQ+3TbIG/gil5pDsZB+UA3GlyZ9Yml6q6ZxCFUPRnQvKi/0yawI2MYgdrSZujU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IbvE+Fy7xp2eqKsUnzkxegiUclABW9T6Aw+9uuEiLs0=; b=J50U4NdgqiiW93EVgBMoeV4z09
 Q/Myx+gtTagTrGEQbiubM2erqS9mxJKYfDfpVTnTof0INMFLrsiUctOOIoKoJ7/2kXWoZymOOxPLI
 XgrgXYGmsuOv5k6NZkCWhqj7qLQiPkC6AzhdtARCnNQjFZWsJkQzew+QVZXBkSh4/Bmc=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m9Y0j-0082RY-EY
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 30 Jul 2021 19:17:44 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DB70060F00;
 Fri, 30 Jul 2021 19:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627672648;
 bh=XqeK93rCzU12KUxQ403dIfNb2X2IjmU3CuGxNcDcqD0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uFAppH6m2GqYRVPI4E09rzh1UCs2/hwjV7QKLXAh/XdlJoZ6cFF95s1//f6n9fnrd
 6vVQYLJQZYuFlgTOIWVWWb0+y4O73t6zO2JHqsPLYdxibg++14iGjcjEz7de8Yw1Hk
 0gX5shHMyJ/GymU70LeE7/PZVdmvu8JuZbCMFBo3a5kYzENhwDglZo5Ltrm/kWv8Sj
 MHSFyj7JTcFtA4spdJFWrHVxv8iCeiO5ONFT2HFJavoLcm6yK9MVLdIwuNI2FsTp0o
 d10tItZDVBGSPeiOZPvhrUEYUNVEnzfAaDBUoGW82AQdSi+Uw+qtzPOMuwPmkYrzo2
 jirN/MYC1Wh6Q==
Date: Fri, 30 Jul 2021 12:17:26 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net,
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
Message-ID: <YQRQRh1zUHSIzcC/@gmail.com>
References: <20210728015154.171507-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210728015154.171507-1-ebiggers@kernel.org>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1m9Y0j-0082RY-EY
Subject: Re: [f2fs-dev] [PATCH] f2fs: remove broken support for allocating
 DIO writes
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
Cc: linux-fsdevel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Jul 27, 2021 at 06:51:54PM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Currently, non-overwrite DIO writes are fundamentally unsafe on f2fs as
> they require preallocating blocks, but f2fs doesn't support unwritten
> blocks and therefore has to preallocate the blocks as regular blocks.
> f2fs has no way to reliably roll back such preallocations, so as a
> result, f2fs will leak uninitialized blocks to users if a DIO write
> doesn't fully complete.  This can be easily reproduced by issuing a DIO
> write that will fail due to misalignment, e.g.:
> 
> 	rm -f file
> 	truncate -s 1000000 file
> 	dd if=/dev/zero bs=999999 oflag=direct conv=notrunc of=file
> 	od -tx1 file  # shows uninitialized disk blocks
> 
> Until a proper design for non-overwrite DIO writes on f2fs can be
> designed and implemented, remove support for them and make them fall
> back to buffered I/O.  This is what other filesystems that don't support
> unwritten blocks, e.g. ext2, also do, at least for non-extending DIO
> writes.  However, f2fs can't do extending DIO writes either, as f2fs
> appears to have no mechanism for guaranteeing that leftover allocated
> blocks past EOF will get truncated.  (f2fs does have an orphan list, but
> it's only used for deleting inodes, not truncating them.)
> 
> This patch doesn't attempt to remove the F2FS_GET_BLOCK_{DIO,PRE_DIO}
> cases in f2fs_map_blocks(); that can be cleaned up later.
> 
> Fixes: bfad7c2d4033 ("f2fs: introduce a new direct_IO write path")
> Cc: stable@vger.kernel.org
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---

Any opinion on this patch?  This really needs to be fixed one way or another.
Probably before the conversion to iomap, as this fix will need to be backported.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
