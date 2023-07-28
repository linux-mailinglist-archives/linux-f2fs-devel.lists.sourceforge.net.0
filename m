Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9141E766DDA
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Jul 2023 15:06:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qPNB6-00053f-EY;
	Fri, 28 Jul 2023 13:06:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1qPNB3-00053Y-SA
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Jul 2023 13:06:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=syoEwursWPUnA3L11lne9/SRYA0L4iVsj1tzYRairOU=; b=D3PNoEUPnrEE+WvZankY6Is0ju
 S0LPa33cMsZ2YRoCVzBgJKMy8MlJ43k0+vypFjoDLvEkjptG+LwpEj/X36Z9Liqofr1qfXkfbggU3
 QF5VvN0xWgfHJtKPV0RzubDjcFc66ECYjzcfdBgnfo3vARxSkzLwcukeDePuyJ2ZbNU0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=syoEwursWPUnA3L11lne9/SRYA0L4iVsj1tzYRairOU=; b=f7PXTurmpg7xutjO6wkGgCVh58
 brbdG/l2PzT04AFdCck6adt7fZyL5y1KKOM59laiACMOBJgz7+y7zwkfVM0ICbtMTYl/LQaD2Mqrz
 44tysNEODSsje328BDbM47ACL2tRHe73d2AWbwzyaXvlB7UfQGh8pmgPzEv7PbFz6MSQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qPNB4-005WXY-39 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Jul 2023 13:06:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 641D862130;
 Fri, 28 Jul 2023 13:06:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6311C433C7;
 Fri, 28 Jul 2023 13:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690549595;
 bh=B5eDKcaoTXLugVjBQrPAJwdWNhFF7TbrpxphDJEcWEg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ujq2W3motdbWyEsbwKZCMeTPTQxXd2t1I/SrcH9azhOZn/ak+gQinKrUWl0VTf2Qq
 BxXIVneSZuWTjRKw/GVZ5ZDZIO6RgPl4uY1ouAQOpfox/+IbfH4rFXKM8LOxulNxNy
 S9FhAd+MLi+W8qgg7wLIqC4UkLfKVTi1JC7hLBAN9kqj9wQzhaeD3mmieL1R05Kvzg
 SGyADjFmSatANJnLqL1/PvDvTh0RtoX0UO+/URnyM+Fq0tetNujCWjhvGS0tItAGbM
 T8eQEQGQwOk7eBnAXurQH7/IPb8QI1SKUhwFATf+bmNwNUehcgoCYj8jwpUKJVOpQc
 g+NS/HSOSid0A==
Date: Fri, 28 Jul 2023 15:06:30 +0200
From: Christian Brauner <brauner@kernel.org>
To: Gabriel Krisman Bertazi <krisman@suse.de>
Message-ID: <20230728-beckenrand-wahrlich-62d6b0505d68@brauner>
References: <20230727172843.20542-1-krisman@suse.de>
 <20230727172843.20542-4-krisman@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230727172843.20542-4-krisman@suse.de>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jul 27, 2023 at 01:28:39PM -0400, Gabriel Krisman
 Bertazi wrote: > From: Gabriel Krisman Bertazi <krisman@collabora.com> > >
 Introduce a dentry revalidation helper to be used by case-insensiti [...]
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.0 T_FILL_THIS_FORM_SHORT Fill in a short form with personal
 information
X-Headers-End: 1qPNB4-005WXY-39
Subject: Re: [f2fs-dev] [PATCH v4 3/7] libfs: Validate negative dentries in
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
Cc: tytso@mit.edu, linux-f2fs-devel@lists.sourceforge.net, ebiggers@kernel.org,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jul 27, 2023 at 01:28:39PM -0400, Gabriel Krisman Bertazi wrote:
> From: Gabriel Krisman Bertazi <krisman@collabora.com>
> 
> Introduce a dentry revalidation helper to be used by case-insensitive
> filesystems to check if it is safe to reuse a negative dentry.
> 
> A negative dentry is safe to be reused on a case-insensitive lookup if
> it was created during a case-insensitive lookup and this is not a lookup
> that will instantiate a dentry. If this is a creation lookup, we also
> need to make sure the name matches sensitively the name under lookup in
> order to assure the name preserving semantics.
> 
> dentry->d_name is only checked by the case-insensitive d_revalidate hook
> in the LOOKUP_CREATE/LOOKUP_RENAME_TARGET case since, for these cases,
> d_revalidate is always called with the parent inode read-locked, and
> therefore the name cannot change from under us.
> 
> d_revalidate is only called in 4 places: lookup_dcache, __lookup_slow,
> lookup_open and lookup_fast:
> 
>   - lookup_dcache always calls it with zeroed flags, with the exception
>     of when coming from __lookup_hash, which needs the parent locked
>     already, for instance in the open/creation path, which is locked in
>     open_last_lookups.
> 
>   - In __lookup_slow, either the parent inode is read locked by the
>     caller (lookup_slow), or it is called with no flags (lookup_one*).
>     The read lock suffices to prevent ->d_name modifications, with the
>     exception of one case: __d_unalias, will call __d_move to fix a
>     directory accessible from multiple dentries, which effectively swaps
>     ->d_name while holding only the shared read lock.  This happens
>     through this flow:
> 
>     lookup_slow()  //LOOKUP_CREATE
>       d_lookup()
>         ->d_lookup()
>           d_splice_alias()
>             __d_unalias()
>               __d_move()
> 
>     Nevertheless, this case is not a problem because negative dentries
>     are not allowed to be moved with __d_move.
> 
>   - lookup_open also requires the parent to be locked in the creation
>     case, which is done in open_last_lookups.
> 
>   - lookup_fast will indeed be called with the parent unlocked, but it
>     shouldn't be called with LOOKUP_CREATE.  Either it is called in the
>     link_path_walk, where nd->flags doesn't have LOOKUP_CREATE yet or in
>     open_last_lookups. But, in this case, it also never has LOOKUP_CREATE,
>     because it is only called on the !O_CREAT case, which means op->intent
>     doesn't have LOOKUP_CREAT (set in build_open_flags only if O_CREAT is
>     set).
> 
> Finally, for the LOOKUP_RENAME_TARGET, we are doing a rename, so the
> parents inodes are also locked.
> 
> Reviewed-by: Theodore Ts'o <tytso@mit.edu>
> Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
> 
> ---
> Changes since v3:
>   - Add comment regarding creation (Eric)
>   - Reorder checks to clarify !flags meaning (Eric)
>   - Add commit message explanaton of the inode read lock wrt.
>     __d_move. (Eric)
> Changes since v2:
>   - Add comments to all rejection cases (Eric)
>   - safeguard against filesystem creating dentries without LOOKUP flags
> ---
>  fs/libfs.c | 55 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
> 
> diff --git a/fs/libfs.c b/fs/libfs.c
> index 5b851315eeed..ed04c4dcc312 100644
> --- a/fs/libfs.c
> +++ b/fs/libfs.c
> @@ -1462,9 +1462,64 @@ static int generic_ci_d_hash(const struct dentry *dentry, struct qstr *str)
>  	return 0;
>  }
>  
> +static inline int generic_ci_d_revalidate(struct dentry *dentry,
> +					  const struct qstr *name,
> +					  unsigned int flags)
> +{
> +	if (d_is_negative(dentry)) {
> +		const struct dentry *parent = READ_ONCE(dentry->d_parent);
> +		const struct inode *dir = READ_ONCE(parent->d_inode);
> +
> +		if (dir && needs_casefold(dir)) {
> +			/*
> +			 * Negative dentries created prior to turning the
> +			 * directory case-insensitive cannot be trusted, since
> +			 * they don't ensure any possible case version of the
> +			 * filename doesn't exist.
> +			 */
> +			if (!d_is_casefold_lookup(dentry))
> +				return 0;
> +
> +			/*
> +			 * Filesystems will call into d_revalidate without
> +			 * setting LOOKUP_ flags even for file creation (see
> +			 * lookup_one* variants).  Reject negative dentries in
> +			 * this case, since we can't know for sure it won't be
> +			 * used for creation.
> +			 */
> +			if (!flags)
> +				return 0;
> +
> +			/*
> +			 * If the lookup is for creation, then a negative dentry
> +			 * can only be reused if it's a case-sensitive match,
> +			 * not just a case-insensitive one.  This is needed to
> +			 * make the new file be created with the name the user
> +			 * specified, preserving case.
> +			 */
> +			if (flags & (LOOKUP_CREATE | LOOKUP_RENAME_TARGET)) {
> +				/*
> +				 * ->d_name won't change from under us in the
> +				 * creation path only, since d_revalidate during
> +				 * creation and renames is always called with
> +				 * the parent inode locked.  It isn't the case
> +				 * for all lookup callpaths, so ->d_name must
> +				 * not be touched outside
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
> +
>  static const struct dentry_operations generic_ci_dentry_ops = {
>  	.d_hash = generic_ci_d_hash,
>  	.d_compare = generic_ci_d_compare,
> +	.d_revalidate_name = generic_ci_d_revalidate,
>  };
>  #endif

Wouldn't it make sense to get rid of all this indentation?

	const struct dentry *parent;
	const struct inode *dir;

	if (!d_is_negative(dentry))
		return 1;

	parent = READ_ONCE(dentry->d_parent);
	dir = READ_ONCE(parent->d_inode);

	if (!dir)
		return 1;

	if (!needs_casefold(dir))
		return 1;

	/*
	 * Negative dentries created prior to turning the
	 * directory case-insensitive cannot be trusted, since
	 * they don't ensure any possible case version of the
	 * filename doesn't exist.
	 */
	if (!d_is_casefold_lookup(dentry))
		return 0;

	/*
	 * Filesystems will call into d_revalidate without
	 * setting LOOKUP_ flags even for file creation (see
	 * lookup_one* variants).  Reject negative dentries in
	 * this case, since we can't know for sure it won't be
	 * used for creation.
	 */
	if (!flags)
		return 0;

	/*
	 * If the lookup is for creation, then a negative dentry
	 * can only be reused if it's a case-sensitive match,
	 * not just a case-insensitive one.  This is needed to
	 * make the new file be created with the name the user
	 * specified, preserving case.
	 */
	if (flags & (LOOKUP_CREATE | LOOKUP_RENAME_TARGET)) {
		/*
		 * ->d_name won't change from under us in the
		 * creation path only, since d_revalidate during
		 * creation and renames is always called with
		 * the parent inode locked.  It isn't the case
		 * for all lookup callpaths, so ->d_name must
		 * not be touched outside
		 * (LOOKUP_CREATE|LOOKUP_RENAME_TARGET) context.
		 */
		if (dentry->d_name.len != name->len ||
		    memcmp(dentry->d_name.name, name->name, name->len))
			return 0;
	}
	return 1;


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
