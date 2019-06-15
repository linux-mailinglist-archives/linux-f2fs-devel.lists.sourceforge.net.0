Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A15894709D
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 15 Jun 2019 17:08:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hcAIG-00087u-1I; Sat, 15 Jun 2019 15:08:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <tytso@mit.edu>) id 1hcAIE-00087n-Tl
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 15 Jun 2019 15:08:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=i9lqEJFTGPJLQh+Jx5UxSLe4/u0iv1+ABKGOLFQY+O4=; b=d4jsq7WzHevSeEMsq11Ictmxdq
 CncZjjkXc1CkSlds/AM6/BvC6Ch971O3CFHCOmdM8+OeLaYj2WWrNRL5LCuaRZlBts4a2FPj782lm
 dV+133xP0L6FeNk38M9FQ/MTmqtiJPbYF73HIozJQgRHFVyIfC+4ZRvJhpVa7gHeepp0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=i9lqEJFTGPJLQh+Jx5UxSLe4/u0iv1+ABKGOLFQY+O4=; b=Sk/94Rxatg9m9HResi39BiIgtx
 /D/L47IWnL0LZE/i5z5Ia2l7mx7QxdLSfWbuceAbr6jHlZwT+RnetRPD84n5r/eh5sS0SLyRpACVj
 U1fsZzRv8gB9lEClUUBn21tg6Lwo1R1Wlq0feAdhKYoGrQnr6jWbEKiEE09WxknSomWY=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hcAID-00FWTQ-LT
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 15 Jun 2019 15:08:35 +0000
Received: from callcc.thunk.org (rrcs-74-87-88-165.west.biz.rr.com
 [74.87.88.165]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x5FF8Lhv005865
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 15 Jun 2019 11:08:22 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id 2BC23420484; Sat, 15 Jun 2019 11:08:21 -0400 (EDT)
Date: Sat, 15 Jun 2019 11:08:21 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20190615150821.GK6142@mit.edu>
References: <20190606155205.2872-1-ebiggers@kernel.org>
 <20190606155205.2872-11-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190606155205.2872-11-ebiggers@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1hcAID-00FWTQ-LT
Subject: Re: [f2fs-dev] [PATCH v4 10/16] fs-verity: implement
 FS_IOC_ENABLE_VERITY ioctl
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

On Thu, Jun 06, 2019 at 08:51:59AM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Add a function for filesystems to call to implement the
> FS_IOC_ENABLE_VERITY ioctl.  This ioctl enables fs-verity on a file.
> 
> See the "FS_IOC_ENABLE_VERITY" section of
> Documentation/filesystems/fsverity.rst for the documentation.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>

> diff --git a/fs/verity/enable.c b/fs/verity/enable.c
> new file mode 100644
> index 000000000000..7e7ef9d3c376
> --- /dev/null
> +++ b/fs/verity/enable.c
> +	/* Tell the filesystem to finish enabling verity on the file */
> +	err = vops->end_enable_verity(filp, desc, desc_size, params.tree_size);
> +	if (err) {
> +		fsverity_err(inode, "%ps() failed with err %d",
> +			     vops->end_enable_verity, err);
> +		fsverity_free_info(vi);
> +	} else {
> +		/* Successfully enabled verity */
> +
> +		WARN_ON(!IS_VERITY(inode));
> +
> +		/*
> +		 * Readers can start using ->i_verity_info immediately, so it
> +		 * can't be rolled back once set.  So don't set it until just
> +		 * after the filesystem has successfully enabled verity.
> +		 */
> +		fsverity_set_info(inode, vi);
> +	}

If end_enable_Verity() retuns success, and IS_VERITY is not set, I
would think that we should report the error via fsverity_err() and
return an error to userspace, and *not* call fsverity_set_info().  I
don't think the stack trace printed by WARN_ON is going to very
interesting, since the call path which gets us to enable_verity() is
not going to be surprising.

> +
> +	if (inode->i_size <= 0) {
> +		err = -EINVAL;
> +		goto out_unlock;
> +	}

How hard would it be to support fsverity for zero-length files?  There
would be no Merkle tree, but there still would be an fsverity header
file on which we can calculate a checksum for the digital signature.

     	      	     	       	 - Ted



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
