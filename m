Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 398C1206BDE
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Jun 2020 07:42:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jnyBL-0008Pr-4j; Wed, 24 Jun 2020 05:42:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jnyBK-0008Pj-31
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 24 Jun 2020 05:42:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0ckeOKo3f8F21GGnj6xUMQOKPUFe8itS18FWYP0nMbA=; b=ZMKmLA6e553JoGzhUVQ8sdpbmr
 mBzq0THt6eoPeRYEWKdZkvmUuZ8GNdWnQvz1QRVqmsjCePR1L3a6eWXc5omhlx7e4DT6E8BIFEXwS
 lwzMpjz/l01H6piIQdoOrbxvUSYo0qKy+YpAYPCnDXPLz7ILj/FhDR/GJw276rK95MSg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0ckeOKo3f8F21GGnj6xUMQOKPUFe8itS18FWYP0nMbA=; b=aLat6XkW19Axu3YlVfqy/13RK7
 MfEq8FdIUh9pc/VWmDL8fLXYuKG9MzQD18BbsjyyMUtlVPpC14XYWEpVlwa/iyI8080v3Z5xk5Snx
 kBr76FARJXEZHIDCZDDAhnl7RDwR3JVMFHjK4MPI7bBrdHkSKzUujTwvUp5Z/cxigyKk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jnyBI-00Dikb-Ku
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 24 Jun 2020 05:42:45 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AB01720768;
 Wed, 24 Jun 2020 05:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592977359;
 bh=fHdY9nn8NgJ9JVY0fSdYkbZ9nf7LPBc7XBKSfqLQLKk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rqTgVkoO7ugKxbBCHnVIerXa56LTd+UjeSduGt5xrC9wVZYLMSDLRHe5prmgK9bSs
 w26715uwkfKDky4fGd86IXyd/REcd+htJsdcqPsptwZiIvuaZgf4+wJ46fh1yiRtFC
 uofq/Ed5ofwshr3zNAKS7TkxWxOI/HJe+vwKUgCs=
Date: Tue, 23 Jun 2020 22:42:37 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Daniel Rosenberg <drosen@google.com>
Message-ID: <20200624054237.GF844@sol.localdomain>
References: <20200624043341.33364-1-drosen@google.com>
 <20200624043341.33364-3-drosen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200624043341.33364-3-drosen@google.com>
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
X-Headers-End: 1jnyBI-00Dikb-Ku
Subject: Re: [f2fs-dev] [PATCH v9 2/4] fs: Add standard casefolding support
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
Cc: kernel-team@android.com, Theodore Ts'o <tytso@mit.edu>,
 Jonathan Corbet <corbet@lwn.net>, Richard Weinberger <richard@nod.at>,
 Andreas Dilger <adilger.kernel@dilger.ca>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, linux-mtd@lists.infradead.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Jun 23, 2020 at 09:33:39PM -0700, Daniel Rosenberg wrote:
> This adds general supporting functions for filesystems that use
> utf8 casefolding. It provides standard dentry_operations and adds the
> necessary structures in struct super_block to allow this standardization.
> 
> Ext4 and F2fs will switch to these common implementations.

It would be helpful to explicitly call out anything that's "new" in this commit,
i.e. anything that isn't simply moving code into the libfs with no behavior
changes.  There's the change of ->d_hash() to use utf8_casefold_hash() instead
of allocating memory; that's not present in the ext4 and f2fs versions.

There's also the change of needs_casefold() to be aware of encrypt+casefold.
(Maybe that small change would better belong in a later patchset that actually
introduces encrypt+casefold support?)

Anything else?

> +/**
> + * generic_ci_d_hash - generic d_hash implementation for casefolding filesystems
> + * @dentry:	dentry whose name we are hashing
> + * @str:	qstr of name whose hash we should fill in
> + *
> + * Return: 0 if hash was successful, or -ERRNO
> + */

It also returns 0 if the hashing was not done because it wants to fallback to
the standard hashing.

> +static inline bool needs_casefold(const struct inode *dir)
> +{
> +	return 0;
> +}

The return type is bool, so it should 'return false', not 'return 0'.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
