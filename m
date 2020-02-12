Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6482315A0D1
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Feb 2020 06:47:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j1ks5-000690-CH; Wed, 12 Feb 2020 05:47:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1j1ks4-00068n-7S
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 12 Feb 2020 05:47:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nKPdE+VUvz4/HxoG8Sm9EQ9tckCdm4ogmxzx9ZYKGHs=; b=EDGVRS51pbUMZdUUhHgUbhgzjX
 qCGMR4Tf0XsGEF5tJCtF3866gbdrpeirwQtRPRGyJVa6P1DsLD+tbIfmb/EjK0pIWB3IxWPGUapXK
 RsZwC3SCWRnKA1g2ertJklVCqNCryGgUHsKOINxiCxXJLmjVOBuwPlLL5l/ZhorrY3kM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nKPdE+VUvz4/HxoG8Sm9EQ9tckCdm4ogmxzx9ZYKGHs=; b=ae8TFcfoWcWitbOqTbQzjEGiO/
 jQqJ5fXjR0cZxTZNsZj+w8SVByL1aewlw81EoqpOf/o010IB428KRu7wyp8ut0VW5ioZXha0DEwks
 sZ3OsNco+oZOZNfHORfc0hV2/JKtXKWpbCS/QhtjArXx7kzq98YXdDUC+qZ3RD+PdHgk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j1ks1-009HO4-D6
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 12 Feb 2020 05:47:36 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6D15620714;
 Wed, 12 Feb 2020 05:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581486442;
 bh=vfQCzX8Gzst/DyzbbP8Yb9hEeqTup17d6ibCA2atEQk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=16O0AgpGnIblG8wXcW2EbHRzkj93++0mtvCGjFsyUCV76OVBn3s08Rm0Tzv10tDKX
 lVogvBzynO1bch/RJ/BUyPtnWFQPHyHktHkoCQZmBDMm5mY+WEzsP8LNaRpna7Nlxp
 fGy1pIz8XmPZ5U7MkLYBItDm8Mu67V3uwnIqWsJk=
Date: Tue, 11 Feb 2020 21:47:20 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Daniel Rosenberg <drosen@google.com>
Message-ID: <20200212054720.GH870@sol.localdomain>
References: <20200208013552.241832-1-drosen@google.com>
 <20200208013552.241832-7-drosen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200208013552.241832-7-drosen@google.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: entry.name]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j1ks1-009HO4-D6
Subject: Re: [f2fs-dev] [PATCH v7 6/8] f2fs: Handle casefolding with
 Encryption
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

On Fri, Feb 07, 2020 at 05:35:50PM -0800, Daniel Rosenberg wrote:
> @@ -173,24 +193,24 @@ static inline bool f2fs_match_name(struct f2fs_dentry_ptr *d,
>  {
>  #ifdef CONFIG_UNICODE
>  	struct inode *parent = d->inode;
> -	struct super_block *sb = parent->i_sb;
> -	struct qstr entry;
> +	unsigned char *name;
> +	int len;
>  #endif
>  
>  	if (de->hash_code != namehash)
>  		return false;
>  
>  #ifdef CONFIG_UNICODE
> -	entry.name = d->filename[bit_pos];
> -	entry.len = de->name_len;
> +	name = d->filename[bit_pos];
> +	len = de->name_len;

This is missing le16_to_cpu().

>  int f2fs_add_regular_entry(struct inode *dir, const struct qstr *new_name,
>  				const struct qstr *orig_name,
> +				f2fs_hash_t dentry_hash,
>  				struct inode *inode, nid_t ino, umode_t mode)
>  {
>  	unsigned int bit_pos;
>  	unsigned int level;
>  	unsigned int current_depth;
>  	unsigned long bidx, block;
> -	f2fs_hash_t dentry_hash;
>  	unsigned int nbucket, nblock;
>  	struct page *dentry_page = NULL;
>  	struct f2fs_dentry_block *dentry_blk = NULL;
> @@ -632,7 +652,6 @@ int f2fs_add_regular_entry(struct inode *dir, const struct qstr *new_name,
>  
>  	level = 0;
>  	slots = GET_DENTRY_SLOTS(new_name->len);
> -	dentry_hash = f2fs_dentry_hash(dir, new_name, NULL);

Why was the call to f2fs_dentry_hash() moved to the caller, but for
f2fs_add_inline_entry() a different approach was taken?

> @@ -718,17 +737,19 @@ int f2fs_add_dentry(struct inode *dir, struct fscrypt_name *fname,
>  				struct inode *inode, nid_t ino, umode_t mode)
>  {
>  	struct qstr new_name;
> +	f2fs_hash_t dentry_hash;
>  	int err = -EAGAIN;
>  
>  	new_name.name = fname_name(fname);
>  	new_name.len = fname_len(fname);
>  
>  	if (f2fs_has_inline_dentry(dir))
> -		err = f2fs_add_inline_entry(dir, &new_name, fname->usr_fname,
> +		err = f2fs_add_inline_entry(dir, &new_name, fname,
>  							inode, ino, mode);

I'm really confused.  Why are you passing around both new_name and fname?
We already have new_name == fname.disk_name.  So isn't just the
'struct fscrypt_name' sufficient?

> +static f2fs_hash_t __f2fs_dentry_hash(const struct inode *dir,
> +				const struct qstr *name_info,
> +				const struct fscrypt_name *fname)
>  {
>  	__u32 hash;
>  	f2fs_hash_t f2fs_hash;
> @@ -85,6 +86,11 @@ static f2fs_hash_t __f2fs_dentry_hash(const struct qstr *name_info,
>  	if (is_dot_dotdot(name_info))
>  		return 0;
>  
> +	if (IS_CASEFOLDED(dir) && IS_ENCRYPTED(dir)) {
> +		f2fs_hash = fscrypt_fname_siphash(dir, name_info);
> +		return f2fs_hash;
> +	}

This is missing cpu_to_le32().

Also, above we have:

        /* encrypted bigname case */
        if (fname && !fname->disk_name.name)
                return cpu_to_le32(fname->hash);

That won't work with encrypted+casefolded directories without the key, because
now sometimes the hash from the no-key name is needed even when the disk_name is
available.  This will cause a crash in fscrypt_fname_siphash() being called
without the key.  I think you want:

        if (fname && fname->is_ciphertext_name)
                return cpu_to_le32(fname->hash);

Can you please write xfstests for encrypt+casefold?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
