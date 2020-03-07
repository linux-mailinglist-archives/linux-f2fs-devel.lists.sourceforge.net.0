Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA2617CC55
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  7 Mar 2020 06:41:34 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jASDJ-00040I-1f; Sat, 07 Mar 2020 05:41:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jASDH-000407-Bb
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 07 Mar 2020 05:41:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zulusoVqhUgvWvph0i5LBbviSoTMjBE9o4i5FkW0e6c=; b=DFUQXlOOxpUviHMOZvTcMgcrcm
 HmGQloQ2p1ivYwfQNr3Rs+MShKgNr37U6jnbe0s20roXNbHbIp7vIGa8rW5fpyl7jl7xSc3oAj9Ev
 Idhbnare1Ah6i43oT0QEi4rRYU+2x2oFSLo7gxNLY+lo2/x+8NKGd6xoBSr5UaHJHCH8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zulusoVqhUgvWvph0i5LBbviSoTMjBE9o4i5FkW0e6c=; b=Ww5CkUXtgMffILIcND9NrBpgNA
 hyz2SjVIaebU0Fzs26AS97VV0xfQ2aG0BJEy/VZIeiQPV3faH6Br9rslekMMCW5+UXpfbW9/ONEmJ
 TgrR2CHiGrRTtFr+wYO7HBhbQgTA1oDauHPOHf3MukjMDByDPx1W7ySMgdLRoCNp/wU8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jASDG-000xQS-5o
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 07 Mar 2020 05:41:27 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A95492070A;
 Sat,  7 Mar 2020 05:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583559677;
 bh=Z5bTJVp50KuWeymYhYAdxIiTXYzyTVmZsP2BigxcerM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=wI3oLIQFFHIL5ICoqkDZhrwLR+OMO+a4KW9PZo0HtYoZzUNdytbzjj1R7kofMI0br
 YhDNzK3xcG6s3VWGMLkjJzhFlcnB4XxIl9N4MXpPOM/wD3zWgocEAg5wVV81E/VRTI
 7AlRaoulsSD655PjM30iHYYdYN0zupK+ODogkYjw=
Date: Fri, 6 Mar 2020 21:41:15 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Daniel Rosenberg <drosen@google.com>
Message-ID: <20200307054115.GC1069@sol.localdomain>
References: <20200307023611.204708-1-drosen@google.com>
 <20200307023611.204708-7-drosen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200307023611.204708-7-drosen@google.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jASDG-000xQS-5o
Subject: Re: [f2fs-dev] [PATCH v8 6/8] libfs: Add generic function for
 setting dentry_ops
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
Cc: kernel-team@android.com, Theodore Ts'o <tytso@mit.edu>,
 Jonathan Corbet <corbet@lwn.net>, Richard Weinberger <richard@nod.at>,
 Andreas Dilger <adilger.kernel@dilger.ca>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, linux-mtd@lists.infradead.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Mar 06, 2020 at 06:36:09PM -0800, Daniel Rosenberg wrote:
> This adds a function to set dentry operations at lookup time that will
> work for both encrypted files and casefolded filenames.
> 
> A filesystem that supports both features simultaneously can use this
> function during lookup preperations to set up its dentry operations once
> fscrypt no longer does that itself.
> 
> Signed-off-by: Daniel Rosenberg <drosen@google.com>
> ---
>  fs/libfs.c         | 50 ++++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/fs.h |  2 ++
>  2 files changed, 52 insertions(+)
> 
> diff --git a/fs/libfs.c b/fs/libfs.c
> index 0eaa63a9ae037..bdda03c8ece9e 100644
> --- a/fs/libfs.c
> +++ b/fs/libfs.c
> @@ -1474,4 +1474,54 @@ int generic_ci_d_hash(const struct dentry *dentry, struct qstr *str)
>  	return ret;
>  }
>  EXPORT_SYMBOL(generic_ci_d_hash);
> +
> +static const struct dentry_operations generic_ci_dentry_ops = {
> +	.d_hash = generic_ci_d_hash,
> +	.d_compare = generic_ci_d_compare,
> +};
> +#endif
> +
> +#ifdef CONFIG_FS_ENCRYPTION
> +static const struct dentry_operations generic_encrypted_dentry_ops = {
> +	.d_revalidate = fscrypt_d_revalidate,
> +};
> +#endif
> +
> +#if IS_ENABLED(CONFIG_UNICODE) && IS_ENABLED(CONFIG_FS_ENCRYPTION)
> +static const struct dentry_operations generic_encrypted_ci_dentry_ops = {
> +	.d_hash = generic_ci_d_hash,
> +	.d_compare = generic_ci_d_compare,
> +	.d_revalidate = fscrypt_d_revalidate,
> +};
> +#endif
> +
> +/**
> + * generic_set_encrypted_ci_d_ops - helper for setting d_ops for given dentry
> + * @dir:	parent of dentry whose ops to set
> + * @dentry:	dentry to set ops on
> + *
> + * This function sets the dentry ops for the given dentry to handle both
> + * casefolding and encryption of the dentry name.
> + */
> +void generic_set_encrypted_ci_d_ops(struct inode *dir, struct dentry *dentry)
> +{
> +#ifdef CONFIG_FS_ENCRYPTION
> +	if (dentry->d_flags & DCACHE_ENCRYPTED_NAME) {
> +#ifdef CONFIG_UNICODE
> +		if (dir->i_sb->s_encoding) {
> +			d_set_d_op(dentry, &generic_encrypted_ci_dentry_ops);
> +			return;
> +		}
>  #endif
> +		d_set_d_op(dentry, &generic_encrypted_dentry_ops);
> +		return;
> +	}
> +#endif
> +#ifdef CONFIG_UNICODE
> +	if (dir->i_sb->s_encoding) {
> +		d_set_d_op(dentry, &generic_ci_dentry_ops);
> +		return;
> +	}
> +#endif
> +}
> +EXPORT_SYMBOL(generic_set_encrypted_ci_d_ops);

What's wrong with using dentry->d_sb?  Then the 'dir' parameter wouldn't be
needed.

Also, can you please document why the dentry_operations for casefolding are set
per-filesystem while the dentry_operations for encryption are set per-dentry,
despite both features actually being per-directory things?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
