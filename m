Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8A681AF9A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 21 Dec 2023 08:40:11 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rGDev-0001Mi-Ov;
	Thu, 21 Dec 2023 07:39:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <viro@ftp.linux.org.uk>) id 1rGDev-0001Mc-2e
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 21 Dec 2023 07:39:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Sender:In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LWqF/Y37SmpDLulc6cjBB+/HUzaRe+A8SRPSmTNrLps=; b=YMeImHhlM+Bmfa0vtyh5bcM1wk
 RMze4AOeh8e0YG/cx5DIhz3qNbQ76+MxXb2jlU7aVTd6EBEAu4q9qopOewbbS+ak2g9xEZXMKtOqy
 qCk1+6xLhO4IQg1nmwgddQnSWm7xomoxYhKoLeMHqfDfqvnojJKekjgrZnVA4cv0xWKQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Sender:In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LWqF/Y37SmpDLulc6cjBB+/HUzaRe+A8SRPSmTNrLps=; b=Jn87xGxtZtqYDsk17ZdJOTamTL
 YVtItX1OgK3wQjh6C72wm63AtaH0DN7chkgWxhqh0IY9bR14TSy+zRQjmLDpl9YhaiZFoscGk5h2o
 UlQHhJ/CszM6egUjIGB83+suZa/i9/27FIHAt2GgfHyEEI8J0y9FCMr+129lsTQ/5LEs=;
Received: from zeniv.linux.org.uk ([62.89.141.173])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rGDet-0005Qx-Na for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 21 Dec 2023 07:39:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=LWqF/Y37SmpDLulc6cjBB+/HUzaRe+A8SRPSmTNrLps=; b=CyGUP3iEahTK1hH0NTvCsSV65A
 hR5EBSWyJFMDw5Em/W73Lk0ToDAhpzo+r2qf0I0FbbaVJjb4n34g8JivJiLuafLEVZsA7BfnEq1Tt
 EhZwoLITM8IE3pgeguDCii/5IzVeW8gKUrQT5nS1Qyo9TJp88KzQfBQfhUB3uevoye4+BMKSyKOdh
 jcnZU1rCS9/d25zXM6mwp7akEeTeLX1antM5/IybK65z+GgT2X0B0OCdx19x5KGqDecYUx2/bboq+
 2qs9K2Iyx5nko5XWQ2xja1HiLXAsh5CSc9u0+2z+3RQk8rF+1sdzAhy/jXEeSAb3jr1qUO2wjRrww
 7HOtJ0UQ==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1rGDee-001Ji1-1S; Thu, 21 Dec 2023 07:39:40 +0000
Date: Thu, 21 Dec 2023 07:39:40 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Gabriel Krisman Bertazi <krisman@suse.de>
Message-ID: <20231221073940.GC1674809@ZenIV>
References: <20231215211608.6449-1-krisman@suse.de>
 <20231215211608.6449-9-krisman@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231215211608.6449-9-krisman@suse.de>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Dec 15, 2023 at 04:16:08PM -0500, Gabriel Krisman
 Bertazi wrote: > +static const struct dentry_operations fscrypt_dentry_ops
 = { > + .d_revalidate = fscrypt_d_revalidate, > +};
 > + > int __fscrypt_prepare_lookup(struct
 inode *dir, struct dentry *dentry, > struct fs [...] 
 Content analysis details:   (-0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rGDet-0005Qx-Na
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
Cc: tytso@mit.edu, linux-f2fs-devel@lists.sourceforge.net, ebiggers@kernel.org,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Dec 15, 2023 at 04:16:08PM -0500, Gabriel Krisman Bertazi wrote:

> +static const struct dentry_operations fscrypt_dentry_ops = {
> +	.d_revalidate = fscrypt_d_revalidate,
> +};
> +
>  int __fscrypt_prepare_lookup(struct inode *dir, struct dentry *dentry,
>  			     struct fscrypt_name *fname)
>  {
> @@ -106,6 +110,10 @@ int __fscrypt_prepare_lookup(struct inode *dir, struct dentry *dentry,
>  		spin_lock(&dentry->d_lock);
>  		dentry->d_flags |= DCACHE_NOKEY_NAME;
>  		spin_unlock(&dentry->d_lock);
> +
> +		/* Give preference to the filesystem hooks, if any. */
> +		if (!dentry->d_op)
> +			d_set_d_op(dentry, &fscrypt_dentry_ops);
>  	}
>  	return err;

Hmm...  Could we simply set ->s_d_op to &fscrypt_dentry_ops in non-ci case
*AND* have __fscrypt_prepare_lookup() clear DCACHE_OP_REVALIDATE in case
when it's not setting DCACHE_NOKEY_NAME and ->d_op->d_revalidate is
equal to fscrypt_d_revalidate?  I mean,

	spin_lock(&dentry->d_lock);
        if (fname->is_nokey_name)
                dentry->d_flags |= DCACHE_NOKEY_NAME;
        else if (dentry->d_flags & DCACHE_OP_REVALIDATE &&
		 dentry->d_op->d_revalidate == fscrypt_d_revalidate)
		dentry->d_flags &= ~DCACHE_OP_REVALIDATE;
	spin_unlock(&dentry->d_lock);

here + always set ->s_d_op for ext4 and friends (conditional upon
the CONFIG_UNICODE).

No encryption - fine, you get ->is_nokey_name false from the very
beginning, DCACHE_OP_REVALIDATE is cleared and VFS won't ever call
->d_revalidate(); not even the first time.  

Yes, you pay minimal price in dentry_unlink_inode() when we hit
        if (dentry->d_op && dentry->d_op->d_iput)
and bugger off after the second fetch instead of the first one.
I would be quite surprised if it turns out to be measurable,
but if it is, we can always add DCACHE_OP_IPUT to flags.
Similar for ->d_op->d_release (called in the end of
__dentry_kill()).  Again, that only makes sense if we get
a measurable overhead from that.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
