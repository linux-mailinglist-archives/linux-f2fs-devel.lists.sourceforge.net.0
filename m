Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B942779CAA
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 12 Aug 2023 04:42:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qUeZi-0001kq-VX;
	Sat, 12 Aug 2023 02:42:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1qUeZd-0001kg-Bo
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 12 Aug 2023 02:41:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8r5rfkI/f0JWxTa0P0wyT+P3RB7GX5WL1neTUGTiUmY=; b=TqywrnYgfhE7drmUUpokfMTF2K
 ety28lBpOIzof/SPIkmWviiafNxRzYbD5kNeOKDt0jtsT9KnBRhyymPCTbCGgeJvPgwTzBhSVCD/t
 KZkjGKyrk/eWOQRxn3vJEji87gl88mmMN2hUqKqxlcO/WQSDqghMxA6hqLnqW/N93xWE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8r5rfkI/f0JWxTa0P0wyT+P3RB7GX5WL1neTUGTiUmY=; b=b7TVML+D/9r1CPPiIvdt1plbCR
 TZ8+8LgjyW8Gx1YHEC+Vh6ZvqX0R8w5SshC5oVLK64KQtiBaHbZxCEx64Xu1yl38lTYeba/RWqRz+
 JsYHk56LfT1YJhYGeggb/FeYFO1bdSjmXMqSN76TNRu8kxCPWWn1tgOWGdbhBBnRGhWw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qUeZd-0031YI-Hr for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 12 Aug 2023 02:41:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EFCB4611E9;
 Sat, 12 Aug 2023 02:41:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C349C433C8;
 Sat, 12 Aug 2023 02:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691808107;
 bh=Qf0UrKAKMrDNExp3AQ1BgZvKh1gbqbBiuVEpYRftFYQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M6JQnBlN6gPmRaJcxSle3PgLqulDOpl6MrlQtLwU2djzM9v6MFqzrfW6iIL/vNYkq
 gyUqetOQzUya+qHJC1Iib0L83q+CcCH1k5F0DSldK6nDNEtrIm27bd0u+0BmbqdIGO
 kqvHWyLhLuGQhhLVgSA4mHpu4ROacoNAnqfDXILsLNG1hjjPOpvUSvIDMNpGRTFuD7
 yDNPaTg+KF2/Mp7m0iQuw7WQo00MtYitS4Dya2TPmbQz9WA/y2cVFyaMaJKoaWLdU5
 mf8dAbv724oV7pG6f+83UyqYnnPVW5Y+lNKTuUqt7yJwDVqxZMZ94P9itFMgTBbM3h
 Ru3S/R+5TgO/A==
Date: Fri, 11 Aug 2023 19:41:45 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Gabriel Krisman Bertazi <krisman@suse.de>
Message-ID: <20230812024145.GD971@sol.localdomain>
References: <20230812004146.30980-1-krisman@suse.de>
 <20230812004146.30980-7-krisman@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230812004146.30980-7-krisman@suse.de>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Aug 11, 2023 at 08:41:42PM -0400, Gabriel Krisman
 Bertazi wrote: > + /* > + * Filesystems will call into d_revalidate without
 setting > + * LOOKUP_ flags even for file creation (see lookup_one [...] 
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
X-Headers-End: 1qUeZd-0031YI-Hr
Subject: Re: [f2fs-dev] [PATCH v5 06/10] libfs: Validate negative dentries
 in case-insensitive directories
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

On Fri, Aug 11, 2023 at 08:41:42PM -0400, Gabriel Krisman Bertazi wrote:
> +	/*
> +	 * Filesystems will call into d_revalidate without setting
> +	 * LOOKUP_ flags even for file creation (see lookup_one*
> +	 * variants).  Reject negative dentries in this case, since we
> +	 * can't know for sure it won't be used for creation.
> +	 */
> +	if (!flags)
> +		return 0;
> +
> +	/*
> +	 * If the lookup is for creation, then a negative dentry can
> +	 * only be reused if it's a case-sensitive match, not just a
> +	 * case-insensitive one.  This is needed to make the new file be
> +	 * created with the name the user specified, preserving case.
> +	 */
> +	if (flags & (LOOKUP_CREATE | LOOKUP_RENAME_TARGET)) {
> +		/*
> +		 * ->d_name won't change from under us in the creation
> +		 * path only, since d_revalidate during creation and
> +		 * renames is always called with the parent inode
> +		 * locked.  It isn't the case for all lookup callpaths,
> +		 * so ->d_name must not be touched outside
> +		 * (LOOKUP_CREATE|LOOKUP_RENAME_TARGET) context.
> +		 */
> +		if (dentry->d_name.len != name->len ||
> +		    memcmp(dentry->d_name.name, name->name, name->len))
> +			return 0;
> +	}

This is still really confusing to me.  Can you consider the below?  The code is
the same except for the reordering, but the explanation is reworked to be much
clearer (IMO).  Anything I am misunderstanding?

	/*
	 * If the lookup is for creation, then a negative dentry can only be
	 * reused if it's a case-sensitive match, not just a case-insensitive
	 * one.  This is needed to make the new file be created with the name
	 * the user specified, preserving case.
	 *
	 * LOOKUP_CREATE or LOOKUP_RENAME_TARGET cover most creations.  In these
	 * cases, ->d_name is stable and can be compared to 'name' without
	 * taking ->d_lock because the caller holds dir->i_rwsem for write.
	 * (This is because the directory lock blocks the dentry from being
	 * concurrently instantiated, and negative dentries are never moved.)
	 *
	 * All other creations actually use flags==0.  These come from the edge
	 * case of filesystems calling functions like lookup_one() that do a
	 * lookup without setting the lookup flags at all.  Such lookups might
	 * or might not be for creation, and if not don't guarantee stable
	 * ->d_name.  Therefore, invalidate all negative dentries when flags==0.
	 */
	if (flags & (LOOKUP_CREATE | LOOKUP_RENAME_TARGET)) {
		if (dentry->d_name.len != name->len ||
		    memcmp(dentry->d_name.name, name->name, name->len))
			return 0;
	}
	if (!flags)
		return 0;


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
