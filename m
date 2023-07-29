Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DA5767C21
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 29 Jul 2023 06:34:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qPbex-0002B7-Sv;
	Sat, 29 Jul 2023 04:34:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1qPbew-0002B1-M4
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 29 Jul 2023 04:34:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3AUsvTueriGvbombNj0OdNfmPYeyzOGl16zWi9DCfCs=; b=EnoJKBOQivUyo0yi7HNQcpp3b+
 LjtpKJHQUJyclawNjiTBzEb3D9nhVhaqHTcNRidX9LdB0yLp+ZMFqrM89cRdG9X44Je74cMu1rmsL
 2M6sbgRBN3byRRk3y517w+DWgecDFIP8QKqgIPge7hc3zzpZRDVCk22fLkLmuXcgCJ0A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3AUsvTueriGvbombNj0OdNfmPYeyzOGl16zWi9DCfCs=; b=hl6IKxGz7V6vxCVGXcwFrRLbja
 dOwXytR1d9KWTcQUVTIwUUDAbjNZILUBCr36MtBEsqxDh6eMQokeUphkjxS8j0ymxibQBtdle6Q0Q
 VLxdQi29vlpJGFPMYJ/0uyJ6y+qOhvbjpb1fpukH/C6VpfnKeU+ewSO9tSdgcfNKPH+U=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qPbew-0005iQ-Dl for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 29 Jul 2023 04:34:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B573E60C1C;
 Sat, 29 Jul 2023 04:34:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C35BAC433C8;
 Sat, 29 Jul 2023 04:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690605264;
 bh=kreUmZhVx1mtOQtL4BLyEky6B76tt7CikJVFHDwTUDM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E3ACFzB5JU4CZFIy3kz5qW/uEJymTZKy9b8a0ZW6k16Rv+cJORCna0dpWt/V/2PIN
 CcGK8y6VM1KgA2fU/WGBEhbjCepAo7/4KzC268LgpvYlL91cuzE0KN7I1W2BC6o0HK
 69PyzjLspVEBL2ZJ1C83qA4a8scAJXxGtATEH+OP7dTsG4F9GIsrEbEHxUysLaMMjG
 ximW/8wk6s2jgrpkrPgeQWZ+sPVT3ToqMYGOMc8zhNvDc3KA6c+wbhCBiTg5x8tnTi
 ST7BFkCgusvLK0zV0tIF9vbJv8eowSdcQVADWu44x9Dnc5Qy2NbWf6bSJrJaU4zE3b
 jdumDe3n3xakQ==
Date: Fri, 28 Jul 2023 21:34:22 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Gabriel Krisman Bertazi <krisman@suse.de>
Message-ID: <20230729043422.GC4171@sol.localdomain>
References: <20230727172843.20542-1-krisman@suse.de>
 <20230727172843.20542-3-krisman@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230727172843.20542-3-krisman@suse.de>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jul 27, 2023 at 01:28:38PM -0400, Gabriel Krisman
 Bertazi wrote: > From: Gabriel Krisman Bertazi <krisman@collabora.com> > >
 This flag marks a negative or positive dentry as being created afte [...]
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
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qPbew-0005iQ-Dl
Subject: Re: [f2fs-dev] [PATCH v4 2/7] fs: Add DCACHE_CASEFOLDED_NAME flag
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

On Thu, Jul 27, 2023 at 01:28:38PM -0400, Gabriel Krisman Bertazi wrote:
> From: Gabriel Krisman Bertazi <krisman@collabora.com>
> 
> This flag marks a negative or positive dentry as being created after a
> case-insensitive lookup operation.  It is useful to differentiate
> dentries this way to detect whether the negative dentry can be trusted
> during a case-insensitive lookup.
> 
> Reviewed-by: Theodore Ts'o <tytso@mit.edu>
> Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
> 
> ---
> Changes since v2:
>   -  Rename DCACHE_CASEFOLD_LOOKUP -> DCACHE_CASEFOLDED_NAME (Eric)
> ---
>  fs/dcache.c            | 8 ++++++++
>  include/linux/dcache.h | 8 ++++++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/fs/dcache.c b/fs/dcache.c
> index 98521862e58a..5791489b589f 100644
> --- a/fs/dcache.c
> +++ b/fs/dcache.c
> @@ -1958,6 +1958,14 @@ void d_set_fallthru(struct dentry *dentry)
>  }
>  EXPORT_SYMBOL(d_set_fallthru);
>  
> +void d_set_casefold_lookup(struct dentry *dentry)
> +{
> +	spin_lock(&dentry->d_lock);
> +	dentry->d_flags |= DCACHE_CASEFOLDED_NAME;
> +	spin_unlock(&dentry->d_lock);
> +}
> +EXPORT_SYMBOL(d_set_casefold_lookup);

d_set_casefolded_name()

> +static inline bool d_is_casefold_lookup(const struct dentry *dentry)
> +{
> +	return dentry->d_flags & DCACHE_CASEFOLDED_NAME;
> +}

d_is_casefolded_name().  Or even better, just write 'dentry->d_flags &
DCACHE_CASEFOLDED_NAME' directly in the one place that actually needs this?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
