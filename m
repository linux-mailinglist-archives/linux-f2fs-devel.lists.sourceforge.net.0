Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B7D4A709
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Jun 2019 18:35:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hdH4n-0005KG-2U; Tue, 18 Jun 2019 16:35:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hdH4l-0005K8-Oq
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 Jun 2019 16:35:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8DKgm6PrfnpRt8q5yz/6pwsS2FA2tAPr9IEJwXFoa0c=; b=RwAXfmrpQeDukRbvXFbAnIUotL
 YNgp1yLe+5KNgxV7QcZaCQ9ym0DjWyfpXW96uvGife1WODYgKyTZV2eCSrz02WAgDuXCKXqKd13Nl
 YIJ1uZvKqFuu+xI9XxV+IYIpRQdwSqKoH2Mjex5E/KHQJAdmSqmplY/fv1QpZ/v4LA7A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8DKgm6PrfnpRt8q5yz/6pwsS2FA2tAPr9IEJwXFoa0c=; b=TZ0APgSIAO7X7LAum33EA+qtNq
 5BpUUCnc2JLCLefsSyGa5OfiKxRpJi524WWerBzpDprYviHR/luh7GMiae3zVr1g4lHon4URtgfsy
 KmkeyEO4E82+FAWtj/mmlA5xbtSV391o8fsFGanWfzOyNdGPx/yYkdbcGjp5WOb38fng=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hdH4i-003djt-0G
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 Jun 2019 16:35:13 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0758720673;
 Tue, 18 Jun 2019 16:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560875706;
 bh=GeIvHcqxM8GaaYPQkIqVTtuvhdr1Xv+rCU27pAM0CSg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=yo9Vew7Bm0+5tZyNbxb/SXmKNcf/bFXBgzKVl3flNIxOzH8wbcJTYEsVheeLxJoNA
 PwmDSlPYT48h693vme8664sJ0r3s1gRftmE9pqtaT1HaMiWQbV9OgBggVcgDorla1v
 aOgwjKhoYToWhR4vzNmuDK39hClHFyzbqh2cXHWA=
Date: Tue, 18 Jun 2019 09:35:04 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Theodore Ts'o <tytso@mit.edu>
Message-ID: <20190618163503.GC184520@gmail.com>
References: <20190606155205.2872-1-ebiggers@kernel.org>
 <20190606155205.2872-8-ebiggers@kernel.org>
 <20190615144207.GH6142@mit.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190615144207.GH6142@mit.edu>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 3.7 (+++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 3.8 FSL_HELO_FAKE          No description available.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hdH4i-003djt-0G
Subject: Re: [f2fs-dev] [PATCH v4 07/16] fs-verity: add the hook for file
 ->open()
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
Cc: "Darrick J . Wong" <darrick.wong@oracle.com>, linux-api@vger.kernel.org,
 Dave Chinner <david@fromorbit.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-integrity@vger.kernel.org,
 linux-ext4@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, Victor Hsieh <victorhsieh@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sat, Jun 15, 2019 at 10:42:07AM -0400, Theodore Ts'o wrote:
> On Thu, Jun 06, 2019 at 08:51:56AM -0700, Eric Biggers wrote:
> > From: Eric Biggers <ebiggers@google.com>
> > 
> > Add the fsverity_file_open() function, which prepares an fs-verity file
> > to be read from.  If not already done, it loads the fs-verity descriptor
> > from the filesystem and sets up an fsverity_info structure for the inode
> > which describes the Merkle tree and contains the file measurement.  It
> > also denies all attempts to open verity files for writing.
> > 
> > This commit also begins the include/linux/fsverity.h header, which
> > declares the interface between fs/verity/ and filesystems.
> > 
> > Signed-off-by: Eric Biggers <ebiggers@google.com>
> 
> Looks good; you can add:
> 
> Reviewed-off-by: Theodore Ts'o <tytso@mit.edu>
> 
> 						- Ted
> 
> > +/*
> > + * Validate the given fsverity_descriptor and create a new fsverity_info from
> > + * it.  The signature (if present) is also checked.
> > + */
> > +struct fsverity_info *fsverity_create_info(const struct inode *inode,
> > +					   const void *_desc, size_t desc_size)
> 
> Well, technically it's not checked (yet).  It doesn't get checked
> until [PATCH 13/16]: support builtin file signatures.  If we want to
> be really nit-picky, that portion of the comment could be moved to
> later in the series.
> 

Yes, I missed this when splitting out the patches.  I'll move it to patch 13.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
