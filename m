Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 009DF7530D0
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 14 Jul 2023 07:00:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qKAv6-00027P-Il;
	Fri, 14 Jul 2023 05:00:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1qKAuz-00027I-Nu
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 14 Jul 2023 05:00:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GPqulA4rEtbrK4un/p1PJKQ5meG6EXLgf+DfgPBXHdY=; b=Of3S0BrjWFCEXIOriWgA/C+lOW
 kMpvnaZVdo3kUwziYu9Pl7BcGgG3cQcU78a+Ix5BilH8Oh505QjSS741f7suiwNyaHV2xkWZEY13f
 rQqj5wARZahy4WO+rsg1NHGsS1O3aSpKEbBXFlzFsNfjer2pHaZRsmdDk//oTyjOHKCg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GPqulA4rEtbrK4un/p1PJKQ5meG6EXLgf+DfgPBXHdY=; b=DEECdNlA5aCjGZpvAFpOR3a64L
 LJcFLejRr+pXIdrmPvOJiZo4gSY1tWZOkTXNz7MqVSnEHl01JTjzWu5HH8628YfK/mrGCBa9JyI6l
 HQ6i5XCbQcqO0+UGczFgL46NmzG9n6FOmvLFLGvpaWRrJjOofYG4/DB8AzOD6+Y3P4Io=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qKAuz-00791g-1t for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 14 Jul 2023 05:00:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7122861BE3;
 Fri, 14 Jul 2023 05:00:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 934F3C433C7;
 Fri, 14 Jul 2023 05:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689310830;
 bh=QzWokqxMlJGGBJ8InXGlEOPwPkVO/C5DuMF8p5rfuaE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PduTiZ8iu1FlTJIHhn4f7FVNuGIbB4f+Z4cZT18CGgVWzGOc8C2fyxNN/yNn/qFbA
 Fwwa+isVWU5GP804E5iS2ksmvvI2/56Q9srWh4XB26UKcyeDG0nqSumlxw1dh7AB1p
 GtYK6rJ1zL+s5jgcwu7Yxyxm+d5z3oWBQEWuR5y4R2SJWasM+V9tCMKYWTFGaF0e64
 O3IoCduSBCEy9RMSIePJiMPb+t7pSu1DXpcpF+rkgpQIA9/13170cCNbadw7l+gme3
 9TqFi0uLhlpEufD+Uj87BVuRqUYmj+U3QEVobivPBn3wEIbYwG0sOpmJ+2qal9EZsX
 jLtxjZckqpiLw==
Date: Thu, 13 Jul 2023 22:00:28 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Gabriel Krisman Bertazi <krisman@suse.de>
Message-ID: <20230714050028.GC913@sol.localdomain>
References: <20230422000310.1802-1-krisman@suse.de>
 <20230422000310.1802-4-krisman@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230422000310.1802-4-krisman@suse.de>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Apr 21, 2023 at 08:03:06PM -0400, Gabriel Krisman
 Bertazi wrote: > diff --git a/fs/libfs.c b/fs/libfs.c > index
 4eda519c3002..f8881e29c5d5
 100644 > --- a/fs/libfs.c > +++ b/fs/libfs.c > @@ -14 [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.0 T_FILL_THIS_FORM_SHORT Fill in a short form with personal
 information
X-Headers-End: 1qKAuz-00791g-1t
Subject: Re: [f2fs-dev] [PATCH v2 3/7] libfs: Validate negative dentries in
 case-insensitive directories
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
Cc: brauner@kernel.org, tytso@mit.edu, linux-f2fs-devel@lists.sourceforge.net,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Apr 21, 2023 at 08:03:06PM -0400, Gabriel Krisman Bertazi wrote:
> diff --git a/fs/libfs.c b/fs/libfs.c
> index 4eda519c3002..f8881e29c5d5 100644
> --- a/fs/libfs.c
> +++ b/fs/libfs.c
> @@ -1467,9 +1467,43 @@ static int generic_ci_d_hash(const struct dentry *dentry, struct qstr *str)
>  	return 0;
>  }
>  
> +static inline int generic_ci_d_revalidate(struct dentry *dentry,
> +					  const struct qstr *name,
> +					  unsigned int flags)
> +{
> +	int is_creation = flags & (LOOKUP_CREATE | LOOKUP_RENAME_TARGET);
> +
> +	if (d_is_negative(dentry)) {
> +		const struct dentry *parent = READ_ONCE(dentry->d_parent);
> +		const struct inode *dir = READ_ONCE(parent->d_inode);
> +
> +		if (dir && needs_casefold(dir)) {
> +			if (!d_is_casefold_lookup(dentry))
> +				return 0;

A comment that explains why the !d_is_casefold_lookup() check is needed would be
helpful.  I know it's in the commit message, but that's not enough.

> +
> +			if (is_creation) {
> +				/*
> +				 * dentry->d_name won't change from under us in
> +				 * the is_creation path only, since d_revalidate
> +				 * during creation and renames is always called
> +				 * with the parent inode locked.  This isn't the
> +				 * case for all lookup callpaths, so it should
> +				 * not be accessed outside
> +				 * (LOOKUP_CREATE|LOOKUP_RENAME_TARGET) context.
> +				 */
> +				if (dentry->d_name.len != name->len ||
> +				    memcmp(dentry->d_name.name, name->name, name->len))
> +					return 0;
> +			}
> +		}
> +	}
> +	return 1;
> +}

I notice that the existing vfat_revalidate_ci() in fs/fat/namei_vfat.c behaves
differently in the 'flags == 0' case:


	/*
	 * This may be nfsd (or something), anyway, we can't see the
	 * intent of this. So, since this can be for creation, drop it.
	 */
	if (!flags)
		return 0;

I don't know whether that's really needed, but have you thought about this?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
