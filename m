Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5687F5170
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 22 Nov 2023 21:21:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r5tic-0000Et-Ti;
	Wed, 22 Nov 2023 20:21:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <viro@ftp.linux.org.uk>) id 1r5tiZ-0000Ei-BG
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 22 Nov 2023 20:21:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Sender:In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uoaIxjf4dzgVF6LqwbixeuWhgvgd9c6WsrC3GpE+d/s=; b=Lh84c5LtDX7tYqpbJABqJuJc2v
 8iAPT2TODcB3xz3dYDfyg1M5yBwi9sGqsd+J63Y+7cvIgDyDIjhlQYjjqwW8cK3CB8Bja1EhWTF05
 4tDs5MXhLVycFdCy63ZgyucXrcdA8+ylONOJQDh3m979XVlke0tBydiA3Bs/I5RT+7EA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Sender:In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uoaIxjf4dzgVF6LqwbixeuWhgvgd9c6WsrC3GpE+d/s=; b=Mu6NfpGig1CWMPJUlyExsAPJRB
 8SWABB6Cf0s5SgH1ACGva/9DNt2/6vrU003xklIWx8vjAW+wowcIlredL+NqVDG9C7Fprktm6TRg8
 ZMsscWQ9exvK2h8/k2JETcuAlLF+VZl2p3lWnhL+tamh6tKJTT4WqYqfHiZncM7XiAJo=;
Received: from zeniv.linux.org.uk ([62.89.141.173])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r5tiT-00D2jZ-WD for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 22 Nov 2023 20:21:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=uoaIxjf4dzgVF6LqwbixeuWhgvgd9c6WsrC3GpE+d/s=; b=IrY2Wn5Oe5jfRXdNhzZlLs8kZo
 QFzv90A6C9COCCEZeRPKml7WibZD+hdWxYaLFriHmmxRNLsBv+sabZlS5oaVs+CTxURJVe+stqNkZ
 EKLou2k6lNa8HPq3LNL78tX92prFmoLhh12wJ0d+iO5G5NzzE38wCWYGQhBMEA6NCsr82hi6Gkuu8
 VRcW4nUCNx04ykC4wEtwmse0foWfgaia/GsDohCWp3mpwGc9C3JjIAJJqxI8KMcL/w84JA0REqVlh
 PfmQQVu8dZJUMsjeOJbqqAo3VWro3ZSkc/5b0aQnCYRn6S07XdZbfSJlDTQLZAnONowZlYVg0dyv3
 vo3Ya96A==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1r5tiG-001lqO-2f; Wed, 22 Nov 2023 20:20:44 +0000
Date: Wed, 22 Nov 2023 20:20:44 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Gabriel Krisman Bertazi <krisman@suse.de>
Message-ID: <20231122202044.GF38156@ZenIV>
References: <20230816050803.15660-1-krisman@suse.de>
 <20230816050803.15660-6-krisman@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230816050803.15660-6-krisman@suse.de>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Aug 16, 2023 at 01:07:59AM -0400, Gabriel Krisman
 Bertazi wrote: > +static int generic_ci_d_revalidate(struct dentry *dentry,
 > + const struct qstr *name, > + unsigned int flags) > +{ > + const struct
 dentry *parent; > + const struct inode *dir; > + > + if (!d_is_n [...] 
 Content analysis details:   (-0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 T_FILL_THIS_FORM_SHORT Fill in a short form with personal
 information
X-Headers-End: 1r5tiT-00D2jZ-WD
Subject: Re: [f2fs-dev] [PATCH v6 5/9] libfs: Validate negative dentries in
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
 ebiggers@kernel.org, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Aug 16, 2023 at 01:07:59AM -0400, Gabriel Krisman Bertazi wrote:

> +static int generic_ci_d_revalidate(struct dentry *dentry,
> +				   const struct qstr *name,
> +				   unsigned int flags)
> +{
> +	const struct dentry *parent;
> +	const struct inode *dir;
> +
> +	if (!d_is_negative(dentry))
> +		return 1;
> +
> +	parent = READ_ONCE(dentry->d_parent);
> +	dir = READ_ONCE(parent->d_inode);
> +
> +	if (!dir || !IS_CASEFOLDED(dir))
> +		return 1;
> +
> +	/*
> +	 * Negative dentries created prior to turning the directory
> +	 * case-insensitive cannot be trusted, since they don't ensure
> +	 * any possible case version of the filename doesn't exist.
> +	 */
> +	if (!d_is_casefolded_name(dentry))
> +		return 0;
> +
> +	/*
> +	 * If the lookup is for creation, then a negative dentry can only be
> +	 * reused if it's a case-sensitive match, not just a case-insensitive
> +	 * one.  This is needed to make the new file be created with the name
> +	 * the user specified, preserving case.
> +	 *
> +	 * LOOKUP_CREATE or LOOKUP_RENAME_TARGET cover most creations.  In these
> +	 * cases, ->d_name is stable and can be compared to 'name' without
> +	 * taking ->d_lock because the caller must hold dir->i_rwsem.  (This
> +	 * is because the directory lock blocks the dentry from being
> +	 * concurrently instantiated, and negative dentries are never moved.)
> +	 *
> +	 * All other creations actually use flags==0.  These come from the edge
> +	 * case of filesystems calling functions like lookup_one() that do a
> +	 * lookup without setting the lookup flags at all.  Such lookups might
> +	 * or might not be for creation, and if not don't guarantee stable
> +	 * ->d_name.  Therefore, invalidate all negative dentries when flags==0.
> +	 */
> +	if (flags & (LOOKUP_CREATE | LOOKUP_RENAME_TARGET)) {
> +		if (dentry->d_name.len != name->len ||
> +		    memcmp(dentry->d_name.name, name->name, name->len))
> +			return 0;

Frankly, I would rather moved that to fs/dcache.c and used dentry_cmp() instead
of memcmp() here.  Avoids the discussion of ->d_name stability for this one.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
