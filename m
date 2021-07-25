Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0073D4F57
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 25 Jul 2021 19:57:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m7iNV-0001NE-OG; Sun, 25 Jul 2021 17:57:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1m7iNU-0001N2-Nn
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 25 Jul 2021 17:57:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kMw+uT/nKJm9ybZn7/EvTmD+lMIw5LsXxswiUubIQnk=; b=RqMl9TI5BeOpjxcRvExwsaTV0c
 37TP9dxuLuq0hW4CJZ++1u327y+dsR09LVv3lwc7YIr1lE6mp6qqlle8APRB+4sXOGbYv58xTmD52
 i3cMmKK8X2ea4wdlCgi0CPdM+EIKjAJVtvIrYLkfFHWMNHTNRFltg4aUX5ouCCgwAQLQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kMw+uT/nKJm9ybZn7/EvTmD+lMIw5LsXxswiUubIQnk=; b=ikCc0kZ/Tej5P4qlu9yTdY3+VY
 BKW5NfuWIFxIgzly45doVKr3pRsWrdGFQb4FG3Lh0GwDaDra/Lq7enS0mV/rA8xyUsmvEm27XFBhe
 mfrw+YqOGIlabEnvSry0+ZFqojNd1UCidYO9cYt0Ji6Zsd0uwxyb5MEJRBXYwSZ3A3u4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m7iNO-0001DH-PH
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 25 Jul 2021 17:57:28 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2FCE06052B;
 Sun, 25 Jul 2021 17:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627235837;
 bh=e/IOT6aLgM/vFCn/0MMYqLC9/0uViRF4ZtqRX35F+sU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VYXgZljB7L/v8+LISB1zPqkBLZ+KVdE58D8YU92HaY2sNgpnh191qmRSdAcIcf9xr
 fCG0bnZeif5q/Jol0JhZANiZXv7veDY0bCgaMITJuU8wbJgy6VhOxtby/83Epde6/d
 wdzpa9GDDhL1A7IJPK1SEHrkPQDdVfoT9Rq/5nh7mDh0+fKqypOZXaDwahKTqZGHi4
 aUAcH1jNsgAPZyYQB4UF8D1a97/UnXwAwIL/S+5yZ70lRmAua9TnpX0UL/epsVNYpL
 yicORP/grKkfV2Z+yysiNyZAnie7wJouR/8OgVFCPne6LxmVjow/UGhZF6dQMhn6o0
 6q7tk9egQI7Xw==
Date: Sun, 25 Jul 2021 10:57:15 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <YP2l+1umf9ct/4Sp@sol.localdomain>
References: <20210716143919.44373-1-ebiggers@kernel.org>
 <20210716143919.44373-4-ebiggers@kernel.org>
 <14782036-f6a5-878a-d21f-e7dd7008a285@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <14782036-f6a5-878a-d21f-e7dd7008a285@kernel.org>
X-Spam-Score: -1.2 (-)
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
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1m7iNO-0001DH-PH
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

On Sun, Jul 25, 2021 at 06:50:51PM +0800, Chao Yu wrote:
> On 2021/7/16 22:39, Eric Biggers wrote:
> > From: Eric Biggers <ebiggers@google.com>
> > 
> > f2fs_write_begin() assumes that all blocks were preallocated by
> > default unless FI_NO_PREALLOC is explicitly set.  This invites data
> > corruption, as there are cases in which not all blocks are preallocated.
> > Commit 47501f87c61a ("f2fs: preallocate DIO blocks when forcing
> > buffered_io") fixed one case, but there are others remaining.
> 
> Could you please explain which cases we missed to handle previously?
> then I can check those related logic before and after the rework.

Any case where a buffered write happens while not all blocks were preallocated
but FI_NO_PREALLOC wasn't set.  For example when ENOSPC was hit in the middle of
the preallocations for a direct write that will fall back to a buffered write,
e.g. due to f2fs_force_buffered_io() or page cache invalidation failure.

> 
> > -			/*
> > -			 * If force_buffere_io() is true, we have to allocate
> > -			 * blocks all the time, since f2fs_direct_IO will fall
> > -			 * back to buffered IO.
> > -			 */
> > -			if (!f2fs_force_buffered_io(inode, iocb, from) &&
> > -					f2fs_lfs_mode(F2FS_I_SB(inode)))
> > -				goto write;
> 
> We should keep this OPU DIO logic, otherwise, in lfs mode, write dio
> will always allocate two block addresses for each 4k append IO.
> 
> I jsut test based on codes of last f2fs dev-test branch.

Yes, I had misread that due to the weird goto and misleading comment and
translated it into:

        /* If it will be an in-place direct write, don't bother. */
        if (dio && !f2fs_lfs_mode(sbi))
                return 0;

It should be:

        if (dio && f2fs_lfs_mode(sbi))
                return 0;

Do you have a proper explanation for why preallocations shouldn't be done in
this case?  Note that preallocations are still done for buffered writes, which
may be out-of-place as well; how are those different?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
