Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 165644A6FD
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Jun 2019 18:33:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hdH2f-0004QR-Fg; Tue, 18 Jun 2019 16:33:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hdH2e-0004QC-GU
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 Jun 2019 16:33:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1w1hyKTyhl4SCSZyOJyoK5JDN6pu3iTZX5tAcLyuM0w=; b=SDiT5GaZQwRQOA0i0w81YWACMs
 X2bAc3X6ktjsz2/yEQVNMRBwxnAgC4/1Nis9fY1fhoKhtY3ovthTJJFt5E3R3MsncBhyyglWaMNbL
 9DNnF1K909LTnvogz+dVIFac3hta7YqM1tLtUy6lYXTaMsnPrrmDRUt6xXALAiA7olh8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1w1hyKTyhl4SCSZyOJyoK5JDN6pu3iTZX5tAcLyuM0w=; b=SfAwRD2MVG/44SjhnnJHhAB1IZ
 lb8vryaGBIPpb4qPnvvAC750hO0xEiR17d2F3bvriC2n+Dmy1+QzJbxhhecglyX1asGHUiZR5xBqb
 7jEUVL1KW2AQQh8VmgPg45xVDCnB+EiJxFC16gY8SutkRGq2HBUYgrhzyelyXttHTL6I=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hdH2d-003cqT-OL
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 Jun 2019 16:33:04 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C47A220673;
 Tue, 18 Jun 2019 16:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560875578;
 bh=c+umwQIh0bq3RoOE7M7YQapUsBWn1clXKm5dtzKnwjI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZnooGdOeFDR5eiKPevy+1NBVA7DV3HmHSIp0MGKqX+kds9e9W/++UaNr1Z6zF7DAQ
 vbB+JX+pEG5QdiD0IKvFvzq/9TGBH2j/cMzjQoiMJNZmSJP5weUk/Sxg+fy/ejIStN
 z3QukToLd3+GkKLZHn8B/laefXDpx2QhOp83dh6w=
Date: Tue, 18 Jun 2019 09:32:56 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Theodore Ts'o <tytso@mit.edu>
Message-ID: <20190618163255.GB184520@gmail.com>
References: <20190606155205.2872-1-ebiggers@kernel.org>
 <20190606155205.2872-6-ebiggers@kernel.org>
 <20190615125731.GF6142@mit.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190615125731.GF6142@mit.edu>
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
X-Headers-End: 1hdH2d-003cqT-OL
Subject: Re: [f2fs-dev] [PATCH v4 05/16] fs-verity: add Kconfig and the
 helper functions for hashing
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

On Sat, Jun 15, 2019 at 08:57:31AM -0400, Theodore Ts'o wrote:
> On Thu, Jun 06, 2019 at 08:51:54AM -0700, Eric Biggers wrote:
> > From: Eric Biggers <ebiggers@google.com>
> > 
> > Add the beginnings of the fs/verity/ support layer, including the
> > Kconfig option and various helper functions for hashing.  To start, only
> > SHA-256 is supported, but other hash algorithms can easily be added.
> > 
> > Signed-off-by: Eric Biggers <ebiggers@google.com>
> 
> Looks good; you can add:
> 
> Reviewed-off-by: Theodore Ts'o <tytso@mit.edu>
> 
> One thought for consideration below...
> 
> 
> > +
> > +/*
> > + * Maximum depth of the Merkle tree.  Up to 64 levels are theoretically possible
> > + * with a very small block size, but we'd like to limit stack usage during
> > + * verification, and in practice this is plenty.  E.g., with SHA-256 and 4K
> > + * blocks, a file with size UINT64_MAX bytes needs just 8 levels.
> > + */
> > +#define FS_VERITY_MAX_LEVELS		16
> 
> Maybe we should make FS_VERITY_MAX_LEVELS 8 for now?  This is an
> implementation-level restriction, and currently we don't support any
> architectures that have a page size < 4k.  We can always bump this
> number up in the future if it ever becomes necessary, and limiting max
> levels to 8 saves almost 100 bytes of stack space in verify_page().
> 
> 						- Ted

Yes, I agree.  I'll reduce MAX_LEVELS to 8 for now and tweak the comment.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
