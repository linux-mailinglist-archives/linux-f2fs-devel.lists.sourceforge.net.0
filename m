Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C583D707B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 27 Jul 2021 09:38:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m8Hfp-0007H2-NW; Tue, 27 Jul 2021 07:38:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <ebiggers@kernel.org>) id 1m8Hfo-0007Gq-EK
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 27 Jul 2021 07:38:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=S0FkByEbJimk4Oyz3cB6C+L7S+VldlHagVsds2dh414=; b=m/d8rh2H8i+v/4GvSU+IL5+ujP
 XZ3i+jYXJJoRfqu9RjAINyIm4XB1DeEL3u/7YFIXc49VuKMQLH9G0AP+1lFyD3YqdWu4eP+SIjzDM
 aeYIyqIxZnN++MQUafZpNn78d76veWF9vh4rBNm8b2zUY25aeV2SVleIkF5SZibnXWFg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=S0FkByEbJimk4Oyz3cB6C+L7S+VldlHagVsds2dh414=; b=c6SvvcIgAaMIhGye+GwTkTzBMz
 eli2NBXEOTv/LABT1lcQt7LQ5KnDcFg39cv8yG4ZxfN1HdlRFucOmO2A8DZgYN0ILlhia3vxOhT1V
 /6dYHS0bhyTrFRXRc4kAaju0T4YlIW7XnaGiaXf9bpmEnoRlGXPC6ytyHMIxNy/dsaFY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m8Hfi-003wvu-2a
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 27 Jul 2021 07:38:44 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D7E0861108;
 Tue, 27 Jul 2021 07:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627371507;
 bh=hH6uQTAHdrrSIaY1aFLgH9BCERIskl+VRH3TTckavQs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=asexRtT3wtpqPwdGLVkXyWga3WEH2h1pOVDgsN63yGun/2/Wg4kw5DUF/M3NtGukX
 lu+a5+HfT7nqoRLRmjGNa55Nt0kwdXFBO9tsngMciZFCWzLQRDBeITI5eG5hCU7MOz
 FpD5OApj7eNGcv8TWb70SJiTuHLFKtHzKnim4QqUCf1Rgjwk3P1Vfgk7MU5ZEWiIXR
 aqRjEou+YRBAjqzE56cuIDu9wOHbtgaVGnxB+0xKLWeYZllYzfxErWfZtwXiO6lylK
 NXCTIsZhptfrd/8RY37Fm6NDGu9Q+z7H+kOEQYJLid/+J9C+YhysLsoG9B9GGeJ7oT
 BQ2pyvqpuYoMA==
Date: Tue, 27 Jul 2021 00:38:25 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <YP+38QzXS6kpLGn0@sol.localdomain>
References: <20210716143919.44373-1-ebiggers@kernel.org>
 <20210716143919.44373-4-ebiggers@kernel.org>
 <14782036-f6a5-878a-d21f-e7dd7008a285@kernel.org>
 <YP2l+1umf9ct/4Sp@sol.localdomain> <YP9oou9sx4oJF1sc@google.com>
 <70f16fec-02f6-cb19-c407-856101cacc23@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <70f16fec-02f6-cb19-c407-856101cacc23@kernel.org>
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
X-Headers-End: 1m8Hfi-003wvu-2a
Subject: Re: [f2fs-dev] [PATCH 3/9] f2fs: rework write preallocations
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
Cc: Satya Tangirala <satyaprateek2357@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Matthew Bobrowski <mbobrowski@mbobrowski.org>,
 Changheun Lee <nanich.lee@samsung.com>, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Jul 27, 2021 at 11:23:03AM +0800, Chao Yu wrote:
> > > 
> > > Do you have a proper explanation for why preallocations shouldn't be done in
> 
> See commit f847c699cff3 ("f2fs: allow out-place-update for direct IO in LFS mode"),
> f2fs_map_blocks() logic was changed to force allocating a new block address no matter
> previous block address was existed if it is called from write path of DIO. So, in such
> condition, if we preallocate new block address in f2fs_file_write_iter(), we will
> suffer the problem which my trace indicates.
> 
> > > this case?  Note that preallocations are still done for buffered writes, which
> > > may be out-of-place as well; how are those different?
> Got your concern.
> 
> For buffered IO, we use F2FS_GET_BLOCK_PRE_AIO, in this mode, we just preserve
> filesystem block count and tag NEW_ADDR in dnode block, so, it's fine, double
> new block address allocation won't happen during data page writeback.
> 
> For direct IO, we use F2FS_GET_BLOCK_PRE_DIO, in this mode, we will allocate
> physical block address, after preallocation, if we fallback to buffered IO, we
> may suffer double new block address allocation issue... IIUC.
> 
> Well, can we relocate preallocation into f2fs_direct_IO() after all cases which
> may cause fallbacking DIO to buffered IO?
> 

That's somewhat helpful, but I've been doing some more investigation and now I'm
even more confused.  How can f2fs support non-overwrite DIO writes at all
(meaning DIO writes in LFS mode as well as DIO writes to holes in non-LFS mode),
given that it has no support for unwritten extents?  AFAICS, as-is users can
easily leak uninitialized disk contents on f2fs by issuing a DIO write that
won't complete fully (or might not complete fully), then reading back the blocks
that got allocated but not written to.

I think that f2fs will have to take the ext2 approach of not allowing
non-overwrite DIO writes at all...

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
