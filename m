Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E46A81C4D1
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Dec 2023 06:59:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rGYYi-0000Ww-Fe;
	Fri, 22 Dec 2023 05:58:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1rGYYh-0000Wq-9W
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 Dec 2023 05:58:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pnG3YrkQCHQRlNg80p6QuZ0g78Rwjn2t5vCFn6fsSiA=; b=mxxewB11MBWcenVuou526EClPD
 JH6hhFDIzovIao7PXDPC06YZAR2oSDz89dOox49Syl1CUEENWQZRAjMmVUofukIJwPAFjZiiajBix
 ZAbN3Q8R9uq3a8ECdyy/HXvaVM8rniTK98VZ9xCssJKUQCs16Kx9QQ5upvi8DTJyj3ck=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pnG3YrkQCHQRlNg80p6QuZ0g78Rwjn2t5vCFn6fsSiA=; b=az4LxqUR21Iv6gwh1nJqdveEHO
 pUg1e7rAiO+PaHSIw4K7U9IRnmaeXk9q6BZbK1wQJXUzHNluuGAkLic7qITcWfooIMRv0Z2gUnb5g
 +fFwPZMwHewhu8a4NWAC0BjE/goPuGWmhvx76Q+4mcriVoaQ8CdhpRgfaLnabhJ23w7c=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rGYYb-00086T-Me for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 Dec 2023 05:58:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 2FE18CE1F83;
 Fri, 22 Dec 2023 05:58:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99CFFC433C8;
 Fri, 22 Dec 2023 05:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703224715;
 bh=koP/w5X1JGxFG62V66WQtMlBBjy2n7pRoumVVE4mK80=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GQy7cwG1M88/K4d1kfWky7jNIGI7tpT0spjp/jAvD4QZp16fVYGC9b1SZ2QKclslh
 Ku2WJTeg+6Fsa9rWOY0g7+z84e3sazJAIZxbMKPas3Omckh3RVzp337rdShFREn+xy
 2BYpycRrCGrXOnEJUFK4ddmQ7W6rlm+E8vdh5AxqnGhVJmPKTPeRUCTbclKMvatjlb
 ePwzcXji3riCebA0kDYWjA7mk+DO9O44vDAd+GZr480nTlD4J503jBEpA8jnkBYRVe
 9SqQzm+J9gU3vQ/VPwLpwE8Rsc7Cgg19XytcVkXbSlgKb9JXT/prBp/3BiRkepZOVv
 ZQS3xWLM2ciKg==
Date: Thu, 21 Dec 2023 23:58:30 -0600
From: Eric Biggers <ebiggers@kernel.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Message-ID: <20231222055830.GA97172@quark.localdomain>
References: <20231215211608.6449-1-krisman@suse.de>
 <20231215211608.6449-9-krisman@suse.de>
 <20231221073940.GC1674809@ZenIV>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231221073940.GC1674809@ZenIV>
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Dec 21, 2023 at 07:39:40AM +0000, Al Viro wrote: >
 Hmm... Could we simply set ->s_d_op to &fscrypt_dentry_ops in non-ci case
 > *AND* have __fscrypt_prepare_lookup() clear DCACHE_OP_REVALIDATE [...] 
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rGYYb-00086T-Me
Subject: Re: [f2fs-dev] [PATCH v2 8/8] fscrypt: Move d_revalidate
 configuration back into fscrypt
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
Cc: Gabriel Krisman Bertazi <krisman@suse.de>, tytso@mit.edu,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 jaegeuk@kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Dec 21, 2023 at 07:39:40AM +0000, Al Viro wrote:
> Hmm...  Could we simply set ->s_d_op to &fscrypt_dentry_ops in non-ci case
> *AND* have __fscrypt_prepare_lookup() clear DCACHE_OP_REVALIDATE in case
> when it's not setting DCACHE_NOKEY_NAME and ->d_op->d_revalidate is
> equal to fscrypt_d_revalidate?  I mean,
> 
> 	spin_lock(&dentry->d_lock);
>         if (fname->is_nokey_name)
>                 dentry->d_flags |= DCACHE_NOKEY_NAME;
>         else if (dentry->d_flags & DCACHE_OP_REVALIDATE &&
> 		 dentry->d_op->d_revalidate == fscrypt_d_revalidate)
> 		dentry->d_flags &= ~DCACHE_OP_REVALIDATE;
> 	spin_unlock(&dentry->d_lock);
> 
> here + always set ->s_d_op for ext4 and friends (conditional upon
> the CONFIG_UNICODE).
> 
> No encryption - fine, you get ->is_nokey_name false from the very
> beginning, DCACHE_OP_REVALIDATE is cleared and VFS won't ever call
> ->d_revalidate(); not even the first time.  
> 
> Yes, you pay minimal price in dentry_unlink_inode() when we hit
>         if (dentry->d_op && dentry->d_op->d_iput)
> and bugger off after the second fetch instead of the first one.
> I would be quite surprised if it turns out to be measurable,
> but if it is, we can always add DCACHE_OP_IPUT to flags.
> Similar for ->d_op->d_release (called in the end of
> __dentry_kill()).  Again, that only makes sense if we get
> a measurable overhead from that.

fscrypt_prepare_lookup() handles unencrypted directories inline, without calling
__fscrypt_prepare_lookup() which is only for encrypted directories.  So the
logic to clear DCACHE_OP_REVALIDATE would need to be there too.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
