Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F224C779C88
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 12 Aug 2023 04:16:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qUeAb-0007QK-Jn;
	Sat, 12 Aug 2023 02:16:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1qUeAa-0007QE-IR
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 12 Aug 2023 02:16:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jbGQKgiSRfUs6t9AftgFC1YG5FmYXwHaiZ5IOW/k/LY=; b=lZbMdqiewbjZhalNUVb1LdPWYY
 /3Riv+13mie91fsXjxkGx1vTg9zBXeDYNXhBtBbJt9I4yIieTM3tGaE2osv+SceszkgKlMtfed9Pd
 GeExBHkiSF6El3rHktrvUgrG+NxTU44aRvtHv6FbDd6AvpLjcTyAW3tDdWM9glBDXGjY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jbGQKgiSRfUs6t9AftgFC1YG5FmYXwHaiZ5IOW/k/LY=; b=A5GylFKkFFJDbIz8E6cbbIZfeC
 2qNE6gwE7AVRruvFqtbb94ER/newOhlYzkoe3IPEKl3Z3v+h0CraG1JEa5hBUlUKVPFxO1rGgViAh
 vQZp8qKJebz46LKxYLAaehCWcRVxWPGln2p2YA2eVH4mXvHkUAlaL8LkxCUb508A9Tv8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qUeAY-0004pW-QF for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 12 Aug 2023 02:16:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 37A2D63A89;
 Sat, 12 Aug 2023 02:15:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B880C433C8;
 Sat, 12 Aug 2023 02:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691806552;
 bh=KRiuSZ+g+fA52so2sUF9SK35HMY9HSY0nSS7XM1qPgA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iSq8ZX2ujqo46WGhRXpCETugPT/Q4qr5QAEG0EHPYPxqV7UKVaBd0zbqV6y3YwMYK
 h5kw/3IVRl00qubfBum/O07XD5Wa6UQCLUedj+xLvRAHDtI9p9jLlq5e7p2Qt7DB1Y
 59Lqrg5CfFzakIXzHJckj1ZOVSSQNgG62iDfaIoEQYOL2xUBRIZv4Mtq9wC0z6oXLg
 K6gjmWBsD4oRhXk4dGiGw+hHg76oaWLs/5Hk7tjpXAt2LBIH83hdNZRKO63SXmOyib
 KEMoh5nAiUgBMoL0DttOirqLBTDRUW9UI10orCLh/IATs9AAPFRcIfAqZ+50ZJTme0
 R1+LITZEICTxw==
Date: Fri, 11 Aug 2023 19:15:50 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Gabriel Krisman Bertazi <krisman@suse.de>
Message-ID: <20230812021550.GB971@sol.localdomain>
References: <20230812004146.30980-1-krisman@suse.de>
 <20230812004146.30980-5-krisman@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230812004146.30980-5-krisman@suse.de>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Aug 11, 2023 at 08:41:40PM -0400, Gabriel Krisman
 Bertazi wrote: > diff --git a/Documentation/filesystems/vfs.rst
 b/Documentation/filesystems/vfs.rst
 > index cb2a97e49872..ddd542c2a722 100644 [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qUeAY-0004pW-QF
Subject: Re: [f2fs-dev] [PATCH v5 04/10] fs: Expose name under lookup to
 d_revalidate hooks
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

On Fri, Aug 11, 2023 at 08:41:40PM -0400, Gabriel Krisman Bertazi wrote:
> diff --git a/Documentation/filesystems/vfs.rst b/Documentation/filesystems/vfs.rst
> index cb2a97e49872..ddd542c2a722 100644
> --- a/Documentation/filesystems/vfs.rst
> +++ b/Documentation/filesystems/vfs.rst
> @@ -1251,7 +1251,8 @@ defined:
>  .. code-block:: c
>  
>  	struct dentry_operations {
> -		int (*d_revalidate)(struct dentry *, unsigned int);
> +		int (*d_revalidate)(struct dentry *, const struct qstr *,
> +				    unsigned int);
>  		int (*d_weak_revalidate)(struct dentry *, unsigned int);
>  		int (*d_hash)(const struct dentry *, struct qstr *);
>  		int (*d_compare)(const struct dentry *,
> @@ -1284,6 +1285,14 @@ defined:
>  	they can change and, in d_inode case, even become NULL under
>  	us).
>  
> +	Filesystems shouldn't rely on the name under lookup, unless
> +	there are particular filename encoding semantics to be handled
> +	during revalidation.  Note the name under lookup can change from
> +	under d_revalidate, so it must be protected with ->d_lock before
> +	accessing.  The exception is when revalidating negative dentries
> +	for creation, in which case the parent inode prevents it from
> +	changing.

Actually, the "name under lookup" can never change.  It's passed as the 'name'
argument, newly added by this patch.  What this paragraph is actually about is
the ->d_name of the dentry being revalidated.  The documentation should make it
clear when it means ->d_name and when it means name, how they differ from each
other, and what the purpose of each is.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
