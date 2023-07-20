Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1199675A602
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 20 Jul 2023 08:07:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qMMoj-0000si-9r;
	Thu, 20 Jul 2023 06:07:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1qMMoi-0000sZ-Df
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 20 Jul 2023 06:07:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6yYqOLlw+U0LW+DM0SBeFz1/hir+3X2XlJ2V2uFpGLs=; b=QmsjXOybozA2jHhQLyvycGeZYB
 pPzSWY76DIRgzc65P26lQqqqieaDl7Sq9CCfbCTikFPuHUsquTv7JONZytrF2NjUuAY2vPVvwobVK
 z2CvKivzVb3hboUj1zxDRg7BsJH/TWA0mk3KTU7iZibrT7/+sMTWvWeQMDOYyx1DiXrc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6yYqOLlw+U0LW+DM0SBeFz1/hir+3X2XlJ2V2uFpGLs=; b=bd0ZG9LYVCgRco1XK/Er+EtFP6
 wfwTHKzRhtxc7QZamaXdwxTPtGeIRBeQVKrsG7rjbdhvtGNLeuw1O9DjPCm811DHRQWoHyiUQBKiI
 IktEBUdyu4+YXaH8wvH6K04yKitlEzvIfOpJcvZsp4fuR85ka0LfvAMijiCj5nMpA1pc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qMMod-00077S-PQ for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 20 Jul 2023 06:07:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1AE76618CD;
 Thu, 20 Jul 2023 06:07:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A63CC433C8;
 Thu, 20 Jul 2023 06:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689833219;
 bh=ATRHNxsx0KOdc01QXU+SmoK3XGS6Va9sh8ZyyVbVPfQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AyPUMMUxvNkv3yZ/FSAU7kqaddkPFQJJu8GTD+JhuUwd9t7XriZJ54UoryX00sLaz
 9KREbqaLO0tWpbm3Y1/K4qJ00zOObyA0nufudEWRCzCaK02rgzeogQo5Bt2JuwzPOh
 DxiXfTovTbr+8rAjEJD+/7VV08HRHGZGM6P7VkE28IiQB4XkvFlXzOw2Ex48RqS2i5
 STzrAeWCEBcv9Z2/owqBuyGez4JOjdsi0WuW+g2u0yafgS/Ecf5yk/LhdPQAU/SXT/
 YCgMyCwAXUBrzgzdI8onrcDS7r3dG+X3X6PYC5AJmABkqlkDxHMoCw7F4sz83++Tjn
 mYKWcFj7MEa4w==
Date: Wed, 19 Jul 2023 23:06:57 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Gabriel Krisman Bertazi <krisman@suse.de>
Message-ID: <20230720060657.GB2607@sol.localdomain>
References: <20230719221918.8937-1-krisman@suse.de>
 <20230719221918.8937-4-krisman@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230719221918.8937-4-krisman@suse.de>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Jul 19, 2023 at 06:19:14PM -0400, Gabriel Krisman
 Bertazi wrote: > +static inline int generic_ci_d_revalidate(struct dentry
 *dentry, > + const struct qstr *name, > + unsigned int flags) This shouldn't
 be 'inline', since it can't be inlined into anywhere anyway. 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 0.0 T_FILL_THIS_FORM_SHORT Fill in a short form with personal
 information
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qMMod-00077S-PQ
Subject: Re: [f2fs-dev] [PATCH v3 3/7] libfs: Validate negative dentries in
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
 linux-ext4@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Jul 19, 2023 at 06:19:14PM -0400, Gabriel Krisman Bertazi wrote:
> +static inline int generic_ci_d_revalidate(struct dentry *dentry,
> +					  const struct qstr *name,
> +					  unsigned int flags)

This shouldn't be 'inline', since it can't be inlined into anywhere anyway.

> +		if (dir && needs_casefold(dir)) {
> +			/*
> +			 * Filesystems will call into d_revalidate without
> +			 * setting LOOKUP_ flags even for file creation(see
> +			 * lookup_one* variants).  Reject negative dentries in
> +			 * this case, since we can't know for sure it won't be
> +			 * used for creation.
> +			 */
> +			if (!flags)
> +				return 0;
> +
> +			/*
> +			 * Negative dentries created prior to turning the
> +			 * directory case-insensitive cannot be trusted, since
> +			 * they don't ensure any possible case version of the
> +			 * filename doesn't exist.
> +			 */
> +			if (!d_is_casefold_lookup(dentry))
> +				return 0;
> +
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

This would be easier to follow if the '!flags' and 'flags & (LOOKUP_CREATE |
LOOKUP_RENAME_TARGET)' sections were adjacent to each other.  They group
together logically, since they both deal with the following problem: "when the
lookup might be for creation, invalidate the negative dentry if it might not be
a case-sensitive match".  (And it would help if there was a comment explaining
that problem.)  The d_is_casefold_lookup() check solves a different problem.

I'm also having trouble understanding exactly when ->d_name is stable here.
AFAICS, unfortunately the VFS has an edge case where a dentry can be moved
without its parent's ->i_rwsem being held.  It happens when a subdirectory is
"found" under multiple names.  The VFS doesn't support directory hard links, so
if it finds a second link to a directory, it just moves the whole dentry tree to
the new location.  This can happen if a filesystem image is corrupted and
contains directory hard links.  Coincidentally, it can also happen in an
encrypted directory due to the no-key name => normal name transition...

But, negative dentries are never moved, at all.  (__d_move() even WARNs if you
ask it to move a negative dentry.)  That feels like that would make everything
else irrelevant here, though your patchset doesn't mention this.  I suppose the
problem would be what if the dentry is made positive concurrently.

I'm struggling to find an ideal solution here.  Maybe ->d_lock should just be
taken for the name comparison.  That is legal here, and it reliably synchronizes
with the dentry being moved, without having to consider anything else.

So, the following is probably what I'd do.  I'd be interested to hear your
thoughts, though:

			/*
			 * A negative dentry that was created before the
			 * directory became case-insensitive can't be trusted,
			 * since it doesn't ensure any possible case version of
			 * the filename doesn't exist.
			 */
			if (!d_is_casefold_lookup(dentry))
				return 0;

			/*
			 * If the lookup is for creation, then a negative dentry
			 * can only be reused if it's a case-sensitive match,
			 * not just a case-insensitive one.  This is required to
			 * provide case-preserving semantics.
			 *
			 * In some cases (lookup_one_*()), the lookup intent is
			 * unknown, resulting in flags==0 here.  So we have to
			 * assume that flags==0 is potentially a creation.
			 */
			if (flags == 0 ||
			    (flags & (LOOKUP_CREATE | LOOKUP_RENAME_TARGET))) {
				bool match;

				spin_lock(&dentry->d_lock);
				match = (dentry->d_name.len == name->len &&
					 memcmp(dentry->d_name.name, name->name,
						name->len) == 0);
				spin_unlock(&dentry->d_lock);
				if (!match)
					return 0;
			}


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
