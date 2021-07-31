Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4CA3DC2D7
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 31 Jul 2021 05:00:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m9fF1-0006I1-4y; Sat, 31 Jul 2021 03:00:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <tytso@mit.edu>) id 1m9fEz-0006Ht-Ef
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 31 Jul 2021 03:00:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9aVbg38nXcEAhukylWn/te6uwKT45ZiVVyn60mu+cRQ=; b=G9P3j9+nP0PhNcs7Ot3sbQS/gy
 mmHnPklfvOYts48T17PfYfsVai4I1YlHUOVQ3fYvpsWptFpKHzrDQN6i+C7CQWMNRN7VfZDwDLV1j
 dIhQfOz4fVZlqxaDDUjc/tsug7fotyVYDVq4cIv0lEh+uKHzxvLhadmIEjhjLIH2/PqY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9aVbg38nXcEAhukylWn/te6uwKT45ZiVVyn60mu+cRQ=; b=H81mVYz4aeqZn54fXeHw8Jmjgw
 nBIWJevm5mK2T2J19kwJE3aHWIH4ESvUKE5LTzbowL1LoSaSng/WOY3MKhzBF5aaCBD4SDPhvmn0q
 FMks0bQiQM+e7b2H+lufATbC74fBNeEYXzHhbzuM7qc3MxUF2ASpzNmFks4wYVpMMdA8=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m9fEr-008Hru-Ao
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 31 Jul 2021 03:00:45 +0000
Received: from cwcc.thunk.org (pool-72-74-133-215.bstnma.fios.verizon.net
 [72.74.133.215]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 16V2kGk7028015
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Jul 2021 22:46:17 -0400
Received: by cwcc.thunk.org (Postfix, from userid 15806)
 id 9B17815C37C0; Fri, 30 Jul 2021 22:46:16 -0400 (EDT)
Date: Fri, 30 Jul 2021 22:46:16 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <YQS5eBljtztWwOFE@mit.edu>
References: <20210728015154.171507-1-ebiggers@kernel.org>
 <YQRQRh1zUHSIzcC/@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YQRQRh1zUHSIzcC/@gmail.com>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1m9fEr-008Hru-Ao
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
Cc: linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 stable@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jul 30, 2021 at 12:17:26PM -0700, Eric Biggers wrote:
> > Currently, non-overwrite DIO writes are fundamentally unsafe on f2fs as
> > they require preallocating blocks, but f2fs doesn't support unwritten
> > blocks and therefore has to preallocate the blocks as regular blocks.
> > f2fs has no way to reliably roll back such preallocations, so as a
> > result, f2fs will leak uninitialized blocks to users if a DIO write
> > doesn't fully complete.

There's another way of solving this problem which doesn't require
supporting unwritten blocks.  What a file system *could* do is to
allocate the blocks, but *not* update the on-disk data structures ---
so the allocation happens in memory only, so you know that the
physical blocks won't get used for another files, and then issue the
data block writes.  On the block I/O completion, trigger a workqueue
function which updates the on-disk metadata to assign physical blocks
to the inode.

That way if you crash before the data I/O has a chance to complete,
the on-disk logical block -> physical block map hasn't been updated
yet, and so you don't need to worry about leaking uninitialized blocks.

Cheers,

					- Ted


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
