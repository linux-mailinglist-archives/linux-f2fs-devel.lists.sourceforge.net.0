Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ED04483EBA3
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 27 Jan 2024 08:18:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rTcwz-0004Hf-SL;
	Sat, 27 Jan 2024 07:18:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1rTcww-0004HO-GD
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 Jan 2024 07:17:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XP5B03EPL5vwwWEfwr8VvYZolJj37Lu/H8a+Rpv+dgM=; b=l8WL1kVPW0q57vM46TX4yN5MK2
 gx89OJ9HTxj0PC6JCFe+etG8npkULyH4V4SnlcwSHN5na83+NUJqAj4JXqkQ2/oOHlW29EYqqNjS1
 qaJRDccfUgsUH/WHbubzBLAjbox9u/AbN5Y+HwrDesqUsw0i8x6ynk0vPkwVROmMe2eo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XP5B03EPL5vwwWEfwr8VvYZolJj37Lu/H8a+Rpv+dgM=; b=VvWBq4MeKUeM6u1SARzpIoWNu+
 s5ykmoCq53J1bOVbyfmTtRP+127H62lQQeNznovu+0P0u9fIwc3P+H9vDh/msEuCbIvCZcVcCT5s1
 bvcchjUwSU8+zH2l7J8Fz1tUo2sQsCwhMt6qRl+bSTCqDWJD2iExt9U28MBJfgKGfyKs=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rTcwv-0001Lp-GV for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 Jan 2024 07:17:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 6993FCE335B;
 Sat, 27 Jan 2024 07:17:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60EC8C433C7;
 Sat, 27 Jan 2024 07:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706339864;
 bh=2sb2qVxt6PrgAJqmZv6M7/Y6R04t+vvkBE5DfqST5ok=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QYspIfFu81fmBkiTLdK61JeZiCDlltocBkCBZfhPSLEcIETq0mgrTlexbUkIYiRB8
 3jmCOCeeJ+vYB8WyyRcpnzT6HCkaDrVQSpGG9H8sOoKhd1kYgNIbSAbn7ETdYv422+
 i9CJynZWA4ZYQG5YDNvP9V4vOc88ZSt9ObVv1qKELukHbI2qHsR0ukiLZ8XBTozMpO
 jQj62mTGi1+LSoe9WOh73mr59q+Jskojd8zWGSCsqUsoES9ZD+R4phP/7NqL0NSIjR
 oSAcW8ohaBQPqBuLcfgvuYI66L5bN/rjgp4b6DRQqLHiF6hiFpI51wF0B7RfsHb3Oo
 3KKnhK2fjT6IQ==
Date: Fri, 26 Jan 2024 23:17:42 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Gabriel Krisman Bertazi <krisman@suse.de>
Message-ID: <20240127071742.GE11935@sol.localdomain>
References: <20240119184742.31088-1-krisman@suse.de>
 <20240119184742.31088-5-krisman@suse.de>
 <20240125031251.GC52073@sol.localdomain>
 <875xzhxizb.fsf@mailhost.krisman.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <875xzhxizb.fsf@mailhost.krisman.be>
X-Spam-Score: -3.8 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jan 25, 2024 at 05:20:56PM -0300, Gabriel Krisman
 Bertazi wrote: > Eric Biggers <ebiggers@kernel.org> writes: > > > On Fri,
 Jan 19, 2024 at 03:47:36PM -0300, Gabriel Krisman Bertazi wrote: > > [...]
 Content analysis details:   (-3.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rTcwv-0001Lp-GV
Subject: Re: [f2fs-dev] [PATCH v3 04/10] fscrypt: Drop d_revalidate once the
 key is added
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
Cc: tytso@mit.edu, amir73il@gmail.com, linux-f2fs-devel@lists.sourceforge.net,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jan 25, 2024 at 05:20:56PM -0300, Gabriel Krisman Bertazi wrote:
> Eric Biggers <ebiggers@kernel.org> writes:
> 
> > On Fri, Jan 19, 2024 at 03:47:36PM -0300, Gabriel Krisman Bertazi wrote:
> >> /*
> >>  * When d_splice_alias() moves a directory's no-key alias to its plaintext alias
> >>  * as a result of the encryption key being added, DCACHE_NOKEY_NAME must be
> >>  * cleared.  Note that we don't have to support arbitrary moves of this flag
> >>  * because fscrypt doesn't allow no-key names to be the source or target of a
> >>  * rename().
> >>  */
> >>  static inline void fscrypt_handle_d_move(struct dentry *dentry)
> >>  {
> >>  	dentry->d_flags &= ~DCACHE_NOKEY_NAME;
> >> +
> >> +	/*
> >> +	 * Save the d_revalidate call cost during VFS operations.  We
> >> +	 * can do it because, when the key is available, the dentry
> >> +	 * can't go stale and the key won't go away without eviction.
> >> +	 */
> >> +	if (dentry->d_op && dentry->d_op->d_revalidate == fscrypt_d_revalidate)
> >> +		dentry->d_flags &= ~DCACHE_OP_REVALIDATE;
> >>  }
> >
> > Is there any way to optimize this further for the case where fscrypt is not
> > being used?  This is called unconditionally from d_move().  I've generally been
> > trying to avoid things like this where the fscrypt support slows things down for
> > everyone even when they're not using the feature.
> 
> The problem would be figuring out whether the filesystem has fscrypt
> enabled.  I think we can rely on sb->s_cop always being set:
> 
> if (sb->s_cop)
>    fscrypt_handle_d_move(dentry);
> 
> What do you think?

That's better, I just wonder if there's an even better way.  Do you need to do
this for dentries that don't have DCACHE_NOKEY_NAME set?  If not, it would be
more efficient to test for DCACHE_NOKEY_NAME before clearing the flags.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
