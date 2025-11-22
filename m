Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAE7C7D565
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 22 Nov 2025 19:19:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xGfIIjE8gYjbyodMhnWaYhAcP3/u2Ak9suanffVw11w=; b=ldv+1sx0kuAA3vuqq0AGsjt/zi
	1tbXhAi8gv6vPkevC4NYBxQVeRCUot/thwnSkodkCqrNOur5UA54ZVmZ/kqWnhYhWA1otx6+M0Ut2
	3dav44K6SrOfi6HjRiATTL7EVjEjCtclWCRRDLjZEcRVck8VaWD+BGtM58BV7OOxyX8c=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vMsCh-0001N2-Mq;
	Sat, 22 Nov 2025 18:19:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1vMsCg-0001Mv-EK
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 22 Nov 2025 18:19:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XOLTG9CWY0ynfgsQzTM/egAM+84nLYYtSh+xlwgZLk4=; b=H50hUieWrXKetMWY+b7CXeoZjE
 gT9aC5x03gpu/pDiwlSRO1aWKW2Zbgmkv+rl5rExlbbWNDL7AEPI/sbURc0r/9wER0RRhc5Zc/1i4
 c6NxcQE7XmEhZa1hwQnDCpnwiZVdRjdp14daCXuK1AbgyNjTefGDwf0IwnT8r/jMkLEM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XOLTG9CWY0ynfgsQzTM/egAM+84nLYYtSh+xlwgZLk4=; b=hPas+KdwS8StAkg+ASZgQWfLHb
 S+TkeMQ1nHD0qezL+aEAtGDHcvCYD4JVHeTfgVC38PziiSj1QD0TuWEnGuz7/I3ujBmP7nJzkk1nD
 ztsmnPqMLIuR6cblbZlf5ACwlBo1wkV0EdRI18sUvS9VjkDFRr4hMCBWgkNsOTWCNgRo=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vMsCg-0002J7-1S for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 22 Nov 2025 18:19:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A3AB043EE6;
 Sat, 22 Nov 2025 18:19:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01035C4CEF5;
 Sat, 22 Nov 2025 18:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763835556;
 bh=evUzKx3L4rrqlSjgN6yULWLWGPrGF5cq0KQWOKa1cCY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iJX4qxzJDek73qTk6QjQ4ZYHTwS7FNpz23Q8XgjBF79QTyAZTdVHqQXjWzEWeGbDh
 N+pMJcoxquWoZAyx8a3gQeDJHyhof/pp5esTjWUInn0N3vb28YU1y9ZdA1Zxugw9c2
 M8/LpF24kl03DYMylnggdh3TT9k8Ho/6CZ8RAC9l+Zz82tPPcPP1bKtkwhVE6r1a6I
 zMqIF6CPoR7TVxbBt9t6KlT/v1LXKbOaMAQIYlb7CjQoGBSu/numimc4grxUSxKzSg
 28Jm6KM2/KT7MLx0tW1C4g/LbrPOs7a8N9cGyQ0N/j5cTLCyLDBrZMz72DI4zDFz/2
 4ID9ZGG+tetcQ==
Date: Sat, 22 Nov 2025 10:19:14 -0800
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20251122181914.GB1626@quark>
References: <20251118062159.2358085-1-hch@lst.de>
 <20251118062159.2358085-9-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251118062159.2358085-9-hch@lst.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Nov 18, 2025 at 07:21:51AM +0100, Christoph Hellwig
 wrote: > All the callers now want a byte offset into the inode, so return
 > that from bh_get_inode_and_lblk_num. > > Signed-off-by: Christop [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vMsCg-0002J7-1S
Subject: Re: [f2fs-dev] [PATCH 08/11] fscrypt: return a byte offset from
 bh_get_inode_and_lblk_num
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
From: Eric Biggers via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Biggers <ebiggers@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>, "Theodore Y. Ts'o" <tytso@mit.edu>,
 "Darrick J. Wong" <djwong@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Nov 18, 2025 at 07:21:51AM +0100, Christoph Hellwig wrote:
> All the callers now want a byte offset into the inode, so return
> that from bh_get_inode_and_lblk_num.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/crypto/inline_crypt.c | 18 ++++++++----------
>  1 file changed, 8 insertions(+), 10 deletions(-)
> 
> diff --git a/fs/crypto/inline_crypt.c b/fs/crypto/inline_crypt.c
> index c069958c4819..128268adf960 100644
> --- a/fs/crypto/inline_crypt.c
> +++ b/fs/crypto/inline_crypt.c
> @@ -315,7 +315,7 @@ EXPORT_SYMBOL_GPL(fscrypt_set_bio_crypt_ctx);
>  /* Extract the inode and logical block number from a buffer_head. */

inode and file position

>  static bool bh_get_inode_and_lblk_num(const struct buffer_head *bh,
>  				      const struct inode **inode_ret,
> -				      u64 *lblk_num_ret)
> +				      loff_t *pos_ret)

Rename to bh_get_inode_and_pos()

> * Same as fscrypt_set_bio_crypt_ctx(), except this takes a buffer_head instead  
> * of an inode and block number directly.                                        
> */                                                                              
> void fscrypt_set_bio_crypt_ctx_bh(struct bio *bio,                               
>                                  const struct buffer_head *first_bh,            
>                                  gfp_t gfp_mask)                

inode and file position

> * Same as fscrypt_mergeable_bio(), except this takes a buffer_head instead of
> * an inode and block number directly.
> *
> * Return: true iff the I/O is mergeable
> */
> bool fscrypt_mergeable_bio_bh(struct bio *bio,
>                              const struct buffer_head *next_bh)

inode and file position

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
