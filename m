Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CE6379A12
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 May 2021 00:29:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lgEOa-0000jV-FB; Mon, 10 May 2021 22:29:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1lgEOZ-0000jI-9f
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 10 May 2021 22:28:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bydNcs1leSo1czBmZwD8X0R8FnBten5/6Thln7KUJXQ=; b=bpLTX5p1WoE8vLRgHtzLnPqHc9
 AAJBcBm8BJLW5ccdt2OY9SeS+mMhHkBxWw/xaunKcA92ACqgyFV2ww5hGXNg8tCZXO+DhisPrNhqz
 3enGJRzAJo4jVxQTXM1o3QT7j7HhY+xwGr66vgJHBROiypNI/JWyNw+l/Sz/AfGRkxmc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bydNcs1leSo1czBmZwD8X0R8FnBten5/6Thln7KUJXQ=; b=h5K1NRJDATX73mn5UcDmOEBx3H
 1flKr4cfhtM8Culwmw0QC6MJ5VpmhGfSevoiCgnoFes+mQNz0UKyMD9eehjg33XNIOzVf7B+nRorS
 SJjQBqSHh6kHXpSLZMo4zxYQm/akXN6u4A02qWmBwElByFlIpaP7T92j4HFDwxCJgk90=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lgEOT-0034p5-9H
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 10 May 2021 22:28:59 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 96BD561581;
 Mon, 10 May 2021 22:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620685727;
 bh=3C3Zjb9pNSFpD04fv+dCc1YcggEBha54szgnBBnl+sA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MVu+bRWUCCiGCkhtEwhjniehelzKgsO5DO9wTktyaKAaB6ZGZlG6ZMUk5FHazKbBu
 QzRQ1J+TxhAjZS9/XYTDZDcKuctPcJqOQzlBwtHOMg9EpTE/YAu1RGC4Lx88UW+3mf
 6jXkdU7ocwMyPDdbIR7kb1aAtUflbosTqrRZxU6pc6+COgxU0TgV32khFfxo8WRyQ8
 iHiKY3sx7ItIslpie4C9LkCXPxGRtCR/vvFG70Bt1nf86KbK0INzc/Va9J/+GqWUqA
 1RpqgtryD+MDg3ZS1rykyjvATjKpfNMeWbl/hBBMq1j/mLnS6MMF3U3OhQhhROIZVY
 g0E/xiU+jw+GA==
Date: Mon, 10 May 2021 15:28:44 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <YJmznEhGCZTaER0+@gmail.com>
References: <20210506191347.1242802-1-jaegeuk@kernel.org>
 <YJlGU+STYD5geyIc@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YJlGU+STYD5geyIc@google.com>
X-Spam-Score: -0.8 (/)
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
X-Headers-End: 1lgEOT-0034p5-9H
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: support iflag change given the mask
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, May 10, 2021 at 07:42:27AM -0700, Jaegeuk Kim wrote:
> In f2fs_fileattr_set(),
> 
> 	if (!fa->flags_valid)
> 		mask &= FS_COMMON_FL;
> 
> In this case, we can set supported flags by mask only instead of BUG_ON.
> 
> /* Flags shared betwen flags/xflags */
> 	(FS_SYNC_FL | FS_IMMUTABLE_FL | FS_APPEND_FL | \
> 	 FS_NODUMP_FL |	FS_NOATIME_FL | FS_DAX_FL | \
> 	 FS_PROJINHERIT_FL)
> 
> Fixes: 4c5b47997521 ("vfs: add fileattr ops")

Shouldn't it be:

Fixes: 9b1bb01c8ae7 ("f2fs: convert to fileattr")


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
