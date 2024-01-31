Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F2184324D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 31 Jan 2024 01:55:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rUyt0-0004rO-Kz;
	Wed, 31 Jan 2024 00:55:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1rUysv-0004qu-Mt
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 Jan 2024 00:55:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uGAMYG07CbZySgEuLQc3e4efxLczReo25n3s2LwuUWc=; b=QjQnhyKwh2no9NEL8f/8wAE1Ir
 He3SLpy6mdTOdZMZeUCn0Ah3IUGMJ8FcNGuEGg0i8FT0hLQgDxBof4KcFLlYiSftFjyB2KaUrsQgP
 fP27nP3/m+3gf5vPtYD4mPUc3JLHMViIYrbte/uJ27g2MZ3kYT8jLjmptLb/3tdG0OwY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uGAMYG07CbZySgEuLQc3e4efxLczReo25n3s2LwuUWc=; b=bl845Fyk7njgi0aGUhwiRRgrk1
 biI6rojbxKcnFuyeKhO2hVL0QGJvec7MEaSzdeKEUVrmrBh/Exh5yLE8VystaOUNrmjDKsB+VgZ5z
 5QZMW0oqAJlaRrUV5wFFrGWCfwvJ2oi7mQ6QqXC1xQthZ9eSQYrxKWokz667z344PiV8=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rUysu-0003Mp-FF for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 Jan 2024 00:55:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 6918BCE0B2E;
 Wed, 31 Jan 2024 00:55:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 638F9C433C7;
 Wed, 31 Jan 2024 00:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706662512;
 bh=b6D5tgoiY0lFGwJnyqS5OmgtxE7MvY+XGJIgjypMCCQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ULyDPVWIqpMMds9rDMvrJICLTprvo3p9XsKetIQfuD+91wA00AxEfY+5E8MsyKMvz
 gymOXOTG4mcyYaeI8lDnQIrcANzTSzz0kORRbopRcbkFjMdb6PJrUAuQzvZQr1M33+
 JUZHY1fvEipusp4AjaN0VGFjbJZZDf3aFIwd+T/TZd8bf6FQG0PRd6IKHnYIXGcd7S
 80q15tYL1S6bqf3cMQgH3YwJr8HP7rNROGfoQ4V1IojqEhX1SYHh3OiEntLviZLM57
 vv/NPSBtEdilvBR4+hfKgUbms2+BQZUxIedsrU/ku/DQxFrfV49wn5rmvIH164emH9
 MeAX/6O/eJKWw==
Date: Tue, 30 Jan 2024 16:55:10 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Gabriel Krisman Bertazi <krisman@suse.de>
Message-ID: <20240131005510.GD2020@sol.localdomain>
References: <20240129204330.32346-1-krisman@suse.de>
 <20240129204330.32346-7-krisman@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240129204330.32346-7-krisman@suse.de>
X-Spam-Score: -3.8 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jan 29, 2024 at 05:43:24PM -0300, Gabriel Krisman
 Bertazi wrote: > Now that we do more than just clear the DCACHE_NOKEY_NAME
 in > fscrypt_handle_d_move, skip it entirely for plaintext dentries [...]
 Content analysis details:   (-3.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rUysu-0003Mp-FF
Subject: Re: [f2fs-dev] [PATCH v5 06/12] fscrypt: Ignore plaintext dentries
 during d_move
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

On Mon, Jan 29, 2024 at 05:43:24PM -0300, Gabriel Krisman Bertazi wrote:
> Now that we do more than just clear the DCACHE_NOKEY_NAME in
> fscrypt_handle_d_move, skip it entirely for plaintext dentries, to avoid
> extra costs.
> 
> Note that VFS will call this function for any dentry, whether the volume
> has fscrypt on not.  But, since we only care about DCACHE_NOKEY_NAME, we
> can check for that, to avoid touching the superblock for other fields
> that identify a fscrypt volume.
> 
> Note also that fscrypt_handle_d_move is hopefully inlined back into
> __d_move, so the call cost is not significant.  Considering that
> DCACHE_NOKEY_NAME is a fscrypt-specific flag, we do the check in fscrypt
> code instead of the caller.
> 
> Signed-off-by: Gabriel Krisman Bertazi <krisman@suse.de>
> 
> ---
> Changes since v4:
>   - Check based on the dentry itself (eric)
> ---
>  include/linux/fscrypt.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
> index c1e285053b3e..ab668760d63e 100644
> --- a/include/linux/fscrypt.h
> +++ b/include/linux/fscrypt.h
> @@ -232,6 +232,15 @@ static inline bool fscrypt_needs_contents_encryption(const struct inode *inode)
>   */
>  static inline void fscrypt_handle_d_move(struct dentry *dentry)
>  {
> +	/*
> +	 * VFS calls fscrypt_handle_d_move even for non-fscrypt
> +	 * filesystems.  Since we only care about DCACHE_NOKEY_NAME
> +	 * dentries here, check that to bail out quickly, if possible.
> +	 */
> +	if (!(dentry->d_flags & DCACHE_NOKEY_NAME))
> +		return;

I think you're over-complicating this a bit.  This should be merged with patch
5, since this is basically fixing patch 5, and the end result should look like:

/*
 * When d_splice_alias() moves a directory's no-key alias to its plaintext alias
 * as a result of the encryption key being added, DCACHE_NOKEY_NAME must be
 * cleared and there might be an opportunity to disable d_revalidate.  Note that
 * we don't have to support the inverse operation because fscrypt doesn't allow
 * no-key names to be the source or target of a rename().
 */
static inline void fscrypt_handle_d_move(struct dentry *dentry)
{
	if (dentry->d_flags & DCACHE_NOKEY_NAME) {
		dentry->d_flags &= ~DCACHE_NOKEY_NAME;
		if (dentry->d_op->d_revalidate == fscrypt_d_revalidate)
			dentry->d_flags &= ~DCACHE_OP_REVALIDATE;
	}
}

Note that checking for NULL dentry->d_op is not necessary, since it's already
been verified that DCACHE_NOKEY_NAME is set, which means fscrypt is in use,
which means that there are dentry_operations.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
