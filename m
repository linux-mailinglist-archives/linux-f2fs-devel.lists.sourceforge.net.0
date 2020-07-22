Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8333F22A319
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Jul 2020 01:27:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jyO8Z-0000Xq-Fn; Wed, 22 Jul 2020 23:26:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jyO8H-0000XF-3O
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 Jul 2020 23:26:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=P8Sqp5bCBNA6BIRzWsT5Ijb6b48+wRl7wlVSJZTmNHs=; b=aVS/lep5godGMGnUjCwTYHJrDz
 CqIRh5ac8p21YrbrA/3W3U2TG6OT80FDBFQ9JUpi1OGQ5QJHrbxvDhVJI0yNoiIgJGCuDyIoxVybg
 mk8kEPhfQaxmOUODhy6psRykqBvkojN4vBH5nX6cjmDVVL7QRTIW4kt8q0WYlSPJtNQo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=P8Sqp5bCBNA6BIRzWsT5Ijb6b48+wRl7wlVSJZTmNHs=; b=NGs9jD5CvzBlhd+230rdGnAlvz
 B3Ds1II7k5UQ0CkbkD2yyXw8t8mLm5PhXngwOlBFqtVmvCN2yeSAyA5lbCynGNlevOhIWncdbYnsW
 ENrQECiF+9tZJM2EuS+ipYmdXuz5ZucpuXDof/DzSMyIMbYeAdSNNRTn1iigK7NYPPm4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jyO8G-00ECSP-0z
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 Jul 2020 23:26:41 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7CB54206E3;
 Wed, 22 Jul 2020 23:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595460386;
 bh=V9trLkUFJYAMyFKA/1meM08ujEXVHEc7LNqv69S5GpE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=1d1DqX/gictuOp3LaVtqdX9rXHFtYOgW0vHODNQAInHZ9LTw1DVDF6W/ElRvm03jp
 PRlIyPPMKp5xFPXvGrMUiRU+5p+CJgf/eRkjmre2XAM0349UwcdiNR4HcmaYSU7d3z
 mYi37IUaWUWxByy9kmqOyCDIyjpBrlQe09hnK0k0=
Date: Wed, 22 Jul 2020 16:26:25 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <20200722232625.GB83434@sol.localdomain>
References: <20200720233739.824943-1-satyat@google.com>
 <20200720233739.824943-4-satyat@google.com>
 <20200722211629.GE2005@dread.disaster.area>
 <20200722223404.GA76479@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200722223404.GA76479@sol.localdomain>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jyO8G-00ECSP-0z
Subject: Re: [f2fs-dev] [PATCH v4 3/7] iomap: support direct I/O with
 fscrypt using blk-crypto
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
Cc: Satya Tangirala <satyat@google.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Jul 22, 2020 at 03:34:04PM -0700, Eric Biggers wrote:
> So, something like this:
> 
> diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
> index 44bad4bb8831..2816194db46c 100644
> --- a/fs/ext4/inode.c
> +++ b/fs/ext4/inode.c
> @@ -3437,6 +3437,15 @@ static int ext4_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
>  	map.m_len = min_t(loff_t, (offset + length - 1) >> blkbits,
>  			  EXT4_MAX_LOGICAL_BLOCK) - map.m_lblk + 1;
>  
> +	/*
> +	 * When inline encryption is enabled, sometimes I/O to an encrypted file
> +	 * has to be broken up to guarantee DUN contiguity.  Handle this by
> +	 * limiting the length of the mapping returned.
> +	 */
> +	if (!(flags & IOMAP_REPORT))
> +		map.m_len = fscrypt_limit_io_blocks(inode, map.m_lblk,
> +						    map.m_len);
> +
>  	if (flags & IOMAP_WRITE)
>  		ret = ext4_iomap_alloc(inode, &map, flags);
>  	else
> 
> 
> That also avoids any confusion between pages and blocks, which is nice.

Correction: for fiemap, ext4 actually uses ext4_iomap_begin_report() instead of
ext4_iomap_begin().  So we don't need to check for !IOMAP_REPORT.

Also it could make sense to limit map.m_len after ext4_iomap_alloc() rather than
before, so that we don't limit the length of the extent that gets allocated but
rather just the length that gets returned to iomap.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
