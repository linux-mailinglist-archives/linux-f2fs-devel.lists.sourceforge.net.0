Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1951D8557EB
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Feb 2024 00:59:31 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1raP9v-00073D-2z;
	Wed, 14 Feb 2024 23:59:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1raP9t-000736-C4
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Feb 2024 23:59:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2FtKj2f173uLLcCNY9A9PsE2MP3SioixZxSyEQNKXd8=; b=MqiYqilkhzuY5oy16TrPcHPMMw
 ZpFM0My/IpiKZ7LDzfh4fgccl3ElAe4T6DrqB98wsA4R/JT0koHSMi7H9HfJHZie59uMPhANBiV8R
 WrLi179i+e7uZsI7lAxzBQVN3k12Ri/LUd/KqqCAJsG/pWdeTBShs7SJNqNhjVELao7w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2FtKj2f173uLLcCNY9A9PsE2MP3SioixZxSyEQNKXd8=; b=kP+xOdaVH6062r1mwmJU9sclJQ
 U4/h7pEHXALlGkNxDcj87hd5v1tSqJ7Opvp708ASNJtqneIz1OkviRBVAxHKuVKG3L71pNRact5HA
 4zeaV9p7HewupT+Xtp4RBycgabj1z91KzqQwkB2wlDR1h0h1b9NFcxT5QdfSIlkwAQ6o=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1raP9o-0005zu-QT for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Feb 2024 23:59:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1CC3D61B97;
 Wed, 14 Feb 2024 23:59:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 764D3C433C7;
 Wed, 14 Feb 2024 23:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707955146;
 bh=BKcXm1qqYWOlTZyU6bx2ZkL1Mu0/Nbno89RNGSj8xP8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZVSOA2rjzKIzPjyfuF+bMP9xI0wX2KW+oRcezoVimBGVPqX1z6gkl2czYeYhp9Qa+
 qg28wTTSHzAhkJoOHB3uP0x5vjFujAfhUcTnpMiZVl3WwKZpLQNfqH4ydu8VIUBQVk
 9iUYBFJVIbKv9qCLNVFjz2WwwX0GlggjnOxhoMjV9QhkpmTVch+/MEPiwmt3O+UOAp
 eObkOz8M6OadXl6RqzkcrD8XSAgXBEsiCYdGq6uqfby2sVSeOUQv5OJEHFsHaiho11
 o3wvgs5SSdtTApXmat27ugEcHl63Nzf+wUkXRYx8CdHCwQxrs+m2QyRwfMuZYCrkOT
 MGzUHWqcRIyKg==
Date: Wed, 14 Feb 2024 15:59:04 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Gabriel Krisman Bertazi <krisman@suse.de>
Message-ID: <20240214235904.GH1638@sol.localdomain>
References: <20240213021321.1804-1-krisman@suse.de>
 <20240213021321.1804-4-krisman@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240213021321.1804-4-krisman@suse.de>
X-Spam-Score: -5.7 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Feb 12, 2024 at 09:13:14PM -0500, Gabriel Krisman
 Bertazi wrote: > Finally,
 we need to clean the dentry->flags even for unencrypted
 > dentries, so the ->d_lock might be acquired even for them. [...] 
 Content analysis details:   (-5.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1raP9o-0005zu-QT
Subject: Re: [f2fs-dev] [PATCH v6 03/10] fscrypt: Drop d_revalidate for
 valid dentries during lookup
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
Cc: brauner@kernel.org, tytso@mit.edu, amir73il@gmail.com,
 linux-f2fs-devel@lists.sourceforge.net, viro@zeniv.linux.org.uk,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Feb 12, 2024 at 09:13:14PM -0500, Gabriel Krisman Bertazi wrote:
> Finally, we need to clean the dentry->flags even for unencrypted
> dentries, so the ->d_lock might be acquired even for them.  In order to

might => must?

> diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
> index 47567a6a4f9d..d1f17b90c30f 100644
> --- a/include/linux/fscrypt.h
> +++ b/include/linux/fscrypt.h
> @@ -951,10 +951,29 @@ static inline int fscrypt_prepare_rename(struct inode *old_dir,
>  static inline void fscrypt_prepare_dentry(struct dentry *dentry,
>  					  bool is_nokey_name)
>  {
> +	/*
> +	 * This code tries to only take ->d_lock when necessary to write
> +	 * to ->d_flags.  We shouldn't be peeking on d_flags for
> +	 * DCACHE_OP_REVALIDATE unlocked, but in the unlikely case
> +	 * there is a race, the worst it can happen is that we fail to
> +	 * unset DCACHE_OP_REVALIDATE and pay the cost of an extra
> +	 * d_revalidate.
> +	 */
>  	if (is_nokey_name) {
>  		spin_lock(&dentry->d_lock);
>  		dentry->d_flags |= DCACHE_NOKEY_NAME;
>  		spin_unlock(&dentry->d_lock);
> +	} else if (dentry->d_flags & DCACHE_OP_REVALIDATE &&
> +		   dentry->d_op->d_revalidate == fscrypt_d_revalidate) {
> +		/*
> +		 * Unencrypted dentries and encrypted dentries where the
> +		 * key is available are always valid from fscrypt
> +		 * perspective. Avoid the cost of calling
> +		 * fscrypt_d_revalidate unnecessarily.
> +		 */
> +		spin_lock(&dentry->d_lock);
> +		dentry->d_flags &= ~DCACHE_OP_REVALIDATE;
> +		spin_unlock(&dentry->d_lock);
>  	}
>  }

Does this all get optimized out when !CONFIG_FS_ENCRYPTION?

As-is, I don't think the d_revalidate part will be optimized out.

You may need to create a !CONFIG_FS_ENCRYPTION stub explicitly.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
