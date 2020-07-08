Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6B5218C3F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  8 Jul 2020 17:49:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jtCKM-0006EX-N6; Wed, 08 Jul 2020 15:49:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jtCKM-0006ER-B0
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Jul 2020 15:49:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LVe5HFmQ1lfQM1G/DdOA70oh4o7oQgI/GxfYbGVddwE=; b=jq3GU8/I/GSYdekpYqhBPkyMba
 Pb1dLCMwH8GUieRprwTXzp3vYG6x15s1ZXPENy/0DD1URIMheO49AqI4U9EyJEHYwPGoqZUwhgR0q
 nMxDb2YI/jagPgi84iX8UG9RiVD+gm9/wAiU9SsTHTja1ysLEqYp9uZ0HuWbZmOGSnYY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LVe5HFmQ1lfQM1G/DdOA70oh4o7oQgI/GxfYbGVddwE=; b=VPO0fzC+iWovYQJ4GFCo/OrBWp
 GIoEFtPSJRpIzbM+jyFerKoBpYsYlzjDg9XW7D1qWHySzU7JlMz3pBXmKdB9S74ierDfvOwjTeGqB
 mbyMh/lDfJ4mraefNunwUFA3LCxl5aeAnw9p6VdmIIdlCgXWziyMYv+kUiibaEqqCVtM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jtCKK-00EIdu-F3
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Jul 2020 15:49:42 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A8132206DF;
 Wed,  8 Jul 2020 15:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594223375;
 bh=bqLj7/olahh4JFtc4EpL9q3D/iTuGstNCn11lxS2sf4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=z8Azl4TKT9W4MeG9hf8xbb9+IT4Vkm5fDqyl/WJgXll0rwBoEZZB1dPFFsJgHRItn
 xsngg1q+ZlC83YZZmLNlAPECU791bJi6VwWHLb8P6Hma4P91aEvw3Q9UZSycYmYVLW
 G94SP2CKSCoNSdtCH+2ch4YdjpCLigRyNTWJ0A8g=
Date: Wed, 8 Jul 2020 08:49:33 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Daniel Rosenberg <drosen@google.com>
Message-ID: <20200708154933.GA915@sol.localdomain>
References: <20200708091237.3922153-1-drosen@google.com>
 <20200708091237.3922153-3-drosen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200708091237.3922153-3-drosen@google.com>
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jtCKK-00EIdu-F3
Subject: Re: [f2fs-dev] [PATCH v12 2/4] fs: Add standard casefolding support
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
Cc: Theodore Ts'o <tytso@mit.edu>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Jul 08, 2020 at 02:12:35AM -0700, Daniel Rosenberg wrote:
> This adds general supporting functions for filesystems that use
> utf8 casefolding. It provides standard dentry_operations and adds the
> necessary structures in struct super_block to allow this standardization.
> 
> The new dentry operations are functionally equivalent to the existing
> operations in ext4 and f2fs, apart from the use of utf8_casefold_hash to
> avoid an allocation.
> 
> By providing a common implementation, all users can benefit from any
> optimizations without needing to port over improvements.
> 
> Signed-off-by: Daniel Rosenberg <drosen@google.com>

Reviewed-by: Eric Biggers <ebiggers@google.com>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
