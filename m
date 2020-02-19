Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C831163B48
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Feb 2020 04:29:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j4G3U-00060Z-4n; Wed, 19 Feb 2020 03:29:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1j4G3S-00060O-Sm
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Feb 2020 03:29:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BxHqMJnK5CxjkwkJhCkFLWCzA6lKsqohMftNfU7zRy0=; b=lKCAP8FNh5679VOGujKHmRC/G8
 SZpmhSOZ8bCMXP8saHz0xSfb8NgJ8vLt6fv/EoIK+owkOnKJYVBBdqoPLD1sXzosbWoP4oQwWBeKY
 E5X0gYQadDeK4Refec/3k4wWLujp4o9NtyK8D+UEDDdj2FxREUG6iSRbdEhCDk53CInk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BxHqMJnK5CxjkwkJhCkFLWCzA6lKsqohMftNfU7zRy0=; b=Pz+180vtEeLQ88zCNATuQjGNVG
 ot8V6agdT3ItxK7uxuZ9IiVz1H/5dosTzVAaTu9SHJGkZ5aoT+Z3Gpn2bmV8aDBeFXm3TmA4mgyNy
 458EZ/vVf3jzGMoya35zXrCHv6veRgtuVd6v4IwuS5Tk3s/G1cZ+dE1A+NpHeLIVMgcs=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j4G3R-007WkI-Jj
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Feb 2020 03:29:42 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AB6A824658;
 Wed, 19 Feb 2020 03:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582082976;
 bh=Be/ShAdVvoVw7PIhz4RQ5k4za6c4aizt0SASf/qexgY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=plo0B7tNDe57VbC/yC0rOzcAei0YUXdc1f4dr2CWVcw7e0qg9AgP+rj6qu8UrLaSF
 gewq1595Ti6GJCQLWG0bqUD0ydY7Gq+C+nxwRKtF05o+5dxf/CzPCrGZ495V+t6U4e
 Fy0nGJuZP4V+WRQbsVvNFY4o4dZo13ulK1XTogiE=
Date: Tue, 18 Feb 2020 19:29:34 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200219032934.GC1075@sol.localdomain>
References: <20200217184613.19668-1-willy@infradead.org>
 <20200217184613.19668-25-willy@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200217184613.19668-25-willy@infradead.org>
X-Spam-Score: -0.3 (/)
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
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j4G3R-007WkI-Jj
Subject: Re: [f2fs-dev] [PATCH v6 14/19] ext4: Convert from readpages to
 readahead
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
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-mm@kvack.org, linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 ocfs2-devel@oss.oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Feb 17, 2020 at 10:46:05AM -0800, Matthew Wilcox wrote:
> diff --git a/fs/ext4/readpage.c b/fs/ext4/readpage.c
> index c1769afbf799..e14841ade612 100644
> --- a/fs/ext4/readpage.c
> +++ b/fs/ext4/readpage.c
> @@ -7,8 +7,8 @@
>   *
>   * This was originally taken from fs/mpage.c
>   *
> - * The intent is the ext4_mpage_readpages() function here is intended
> - * to replace mpage_readpages() in the general case, not just for
> + * The ext4_mpage_readahead() function here is intended to
> + * replace mpage_readahead() in the general case, not just for
>   * encrypted files.  It has some limitations (see below), where it
>   * will fall back to read_block_full_page(), but these limitations
>   * should only be hit when page_size != block_size.
> @@ -222,8 +222,7 @@ static inline loff_t ext4_readpage_limit(struct inode *inode)
>  }

This says ext4_mpage_readahead(), but it's actually still called
ext4_mpage_readpages().

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
