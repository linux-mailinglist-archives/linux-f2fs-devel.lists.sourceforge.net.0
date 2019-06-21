Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB244F080
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Jun 2019 23:29:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1heR6D-00009X-Vn; Fri, 21 Jun 2019 21:29:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1heR67-00009A-BY
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Jun 2019 21:29:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DJAjcRLRyFA7U2tfH5+NjqlztSuvNgOrdOXGKJjBIvk=; b=PzpTx+28EdGCdWW1IiO0yoMfWP
 xCA/S+xOs2oXt+NCiwOquiG4OcLkTskSqcSM/nrVs1AZC3ruDuFQSsKSKpbSn6I8hUjosOeMpD8Yg
 uguq+4bSH1Xq/uOsDlvNXMjb1GfD3lSR0MBYCeRoMXqWDyBXuExfcxEw+Dy16wo+Dr8Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DJAjcRLRyFA7U2tfH5+NjqlztSuvNgOrdOXGKJjBIvk=; b=m19lvbv1xRolDuK5T6XDfBMIBr
 YbdMXOvKDKQi51LXPZl57RYCmaZxGtd5qH4EXwEeB220a72WdsCSiC76qhT3EQZKGGbvsnMNFFXsN
 oPKgWXxiJP2UOVMtRr008G2JjuM1hPlgs8STAKphbUKjrsXNYZV3tlQWAGUk+wXQq1k8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1heR68-003Mgo-1b
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Jun 2019 21:29:29 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C5BDB2070B;
 Fri, 21 Jun 2019 21:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561152559;
 bh=ogVKbMJ5T5lsvd4JY0yqPnzxZx9NMvopyYs1Uuxvbkc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MabZLVIDvK/dqbb9/82A7677C+We+QwWW131tS9RhruFU5f3KRrvIUrjiD7lk55se
 SIRqU/RwWMrKxB1nTiX0VjfpkKZ3uruRgCAosYRkPQCUdAvht1BfGleBYnZjAl4zMs
 A5/rAPyXbWgnF027AlTOnDxl4RZXqCpWBmdJXaVo=
Date: Fri, 21 Jun 2019 14:29:17 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Chandan Rajendra <chandan@linux.ibm.com>
Message-ID: <20190621212916.GD167064@gmail.com>
References: <20190616160813.24464-1-chandan@linux.ibm.com>
 <20190616160813.24464-7-chandan@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190616160813.24464-7-chandan@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 2.4 (++)
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
 -1.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1heR68-003Mgo-1b
Subject: Re: [f2fs-dev] [PATCH V3 6/7] Add decryption support for
 sub-pagesized blocks
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
Cc: tytso@mit.edu, linux-f2fs-devel@lists.sourceforge.net, hch@infradead.org,
 linux-fscrypt@vger.kernel.org, adilger.kernel@dilger.ca,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sun, Jun 16, 2019 at 09:38:12PM +0530, Chandan Rajendra wrote:
> To support decryption of sub-pagesized blocks this commit adds code to,
> 1. Track buffer head in "struct read_callbacks_ctx".
> 2. Pass buffer head argument to all read callbacks.
> 3. Add new fscrypt helper to decrypt the file data referred to by a
>    buffer head.
> 
> Signed-off-by: Chandan Rajendra <chandan@linux.ibm.com>
> ---
>  fs/buffer.c                    |  55 +++++++++------
>  fs/crypto/bio.c                |  21 +++++-
>  fs/f2fs/data.c                 |   2 +-
>  fs/mpage.c                     |   2 +-
>  fs/read_callbacks.c            | 118 +++++++++++++++++++++++++--------
>  include/linux/buffer_head.h    |   1 +
>  include/linux/read_callbacks.h |  13 +++-
>  7 files changed, 158 insertions(+), 54 deletions(-)
> 

This is another patch that unnecessarily changes way too many components at
once.  My suggestions elsewhere would resolve this, though:

- This patch changes fs/f2fs/data.c and fs/mpage.c only to pass a NULL
  buffer_head to read_callbacks_setup().  But as per my comments on patch 1,
  read_callbacks_setup() should be split into read_callbacks_setup_bio() and
  read_callbacks_end_bh().

- This patch changes fs/crypto/ only to add support for the buffer_head
  decryption work.  But as per my comments on patch 1, that should be in
  read_callbacks.c instead.

And adding buffer_head support to fs/read_callbacks.c should be its own patch,
*or* should simply be folded into the patch that adds fs/read_callbacks.c.

Then the only thing remaining in this patch would be updating fs/buffer.c to
make it use the read_callbacks, which should be retitled to something like
"fs/buffer.c: add decryption support via read_callbacks".

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
