Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 661B517CC16
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  7 Mar 2020 06:24:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jARx2-0004Ty-6S; Sat, 07 Mar 2020 05:24:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jARwy-0004TM-35
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 07 Mar 2020 05:24:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=K5tf6gokYikJBR0yUQ2fAAorC/+YZ1PzrcbHQBj8Ens=; b=AJbLJysVvFeMEQu58y2+dKIVQF
 djAr710YdZcEooIR7AQbKXwR2lDTirrESMhLyvJ47aD1sbFtq0vjDfE8Zjm8IDja6TXEqFmPdjNFq
 v66eBTglpqRrdHcJnjpaLLpMeO1c7fHXTGG9YfDM3/99pJsi+ouLcsTfa4/1+EoCEP1s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=K5tf6gokYikJBR0yUQ2fAAorC/+YZ1PzrcbHQBj8Ens=; b=X6OexNc84WwUVd+Eq6lrmzvvNp
 rpXjJywNwFGIK8eX4wLqINlrsENbGWUuanM69gfUaKgT5q7Kqz3uqB+0asHEvuaDOEIE2s/sJsPjO
 KpDvdZLno/vfjlxgffOF1core5lxy3PoSoROMzWDqPwQwcJXCRI8SusblllLYswRSHNg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jARwt-004eh0-U8
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 07 Mar 2020 05:24:36 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BB0F0206D5;
 Sat,  7 Mar 2020 05:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583558666;
 bh=RX0pNoVLLIpZJez+whEJRUeQ38hXRUIlXOZTSFatJPY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LuI8jDenuD9MDJb74KTi0cYu7g+PgR49RKpNM1J4/DpdTFuMztsm5BcT7iCbZLRFR
 /xk7S67Q4yYrKb0E1hrPg3TXQNbpsfTzE7JQwl+jgOyWS8u1lVtbQtSln4IssFgpap
 4js7JvYIxcRaCBJVznAVegpJWiyX1eui7nOWa3w4=
Date: Fri, 6 Mar 2020 21:24:24 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Daniel Rosenberg <drosen@google.com>
Message-ID: <20200307052424.GB1069@sol.localdomain>
References: <20200307023611.204708-1-drosen@google.com>
 <20200307023611.204708-9-drosen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200307023611.204708-9-drosen@google.com>
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
X-Headers-End: 1jARwt-004eh0-U8
Subject: Re: [f2fs-dev] [PATCH v8 8/8] f2fs: Handle casefolding with
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

On Fri, Mar 06, 2020 at 06:36:11PM -0800, Daniel Rosenberg wrote:
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
> @@ -632,7 +650,6 @@ int f2fs_add_regular_entry(struct inode *dir, const struct qstr *new_name,
>  
>  	level = 0;
>  	slots = GET_DENTRY_SLOTS(new_name->len);
> -	dentry_hash = f2fs_dentry_hash(dir, new_name, NULL);
>  
>  	current_depth = F2FS_I(dir)->i_current_depth;
>  	if (F2FS_I(dir)->chash == dentry_hash) {
> @@ -718,17 +735,19 @@ int f2fs_add_dentry(struct inode *dir, struct fscrypt_name *fname,
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
> +	dentry_hash = f2fs_dentry_hash(dir, &new_name, fname);
>  	if (err == -EAGAIN)
>  		err = f2fs_add_regular_entry(dir, &new_name, fname->usr_fname,
> -							inode, ino, mode);
> +						dentry_hash, inode, ino, mode);
>  

Why are the changes to f2fs_add_dentry(), f2fs_add_regular_entry(), and
f2fs_add_inline_entry() being made?  Directories can't be modified through
no-key names, so there's no need to make this part of the code handle grabbing
the dentry hash from the struct fscrypt_name.  And both the on-disk and original
filenames were already passed to these functions.  So what else do we need?

> +static f2fs_hash_t __f2fs_dentry_hash(const struct inode *dir,
> +				const struct qstr *name_info,
> +				const struct fscrypt_name *fname)
>  {
>  	__u32 hash;
>  	f2fs_hash_t f2fs_hash;
> @@ -79,12 +80,17 @@ static f2fs_hash_t __f2fs_dentry_hash(const struct qstr *name_info,
>  	size_t len = name_info->len;
>  
>  	/* encrypted bigname case */
> -	if (fname && !fname->disk_name.name)
> +	if (fname && !fname->is_ciphertext_name)
>  		return cpu_to_le32(fname->hash);

Isn't this check backwards?  The hash is valid if fname->is_ciphertext_name, not
if !fname->is_ciphertext_name.

(Maybe the phrase "ciphertext name" is causing confusion, as we're now calling
them "no-key names" instead?  We could rename it, if that would help.)

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
