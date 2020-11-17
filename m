Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8B02B6DBC
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Nov 2020 19:50:48 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kf63w-0003PF-GM; Tue, 17 Nov 2020 18:50:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kf63u-0003Ox-RP
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 Nov 2020 18:50:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rn2st4xvY9RrNObwjfczDb69Ue5N5TXWP+Y4Ksqnq4s=; b=VkAWp2I5KvFQP5RlJ/KqAMilyB
 6iSca6uLz0izahrJS9q7WQcJt/r2DP338wf/+iJ3yOUNuj2z3OeCAt4+heh2d9dv2no1E0qojUD9J
 KupXXBc7Lyvh2PAYnl553U5b3HRuY8WkQdDY8VS4VZazE2OaEz1rwuurOaCQ7NN5nmLg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rn2st4xvY9RrNObwjfczDb69Ue5N5TXWP+Y4Ksqnq4s=; b=YQe6kBTC5kPQwdondfxotRg85L
 DmYh9nGt+6HGQkTiy9z9gFxst204wHo8mFZuRWX1X07vIox749xHZ5lY+7SknPCZdrFPiz6+vTqbv
 elZscoBEyf5PQgNaL/VXDufj4BmEe30XekdwqgPtQDNxwQM6zpejU7tPa33/E65OFzq8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kf63Z-001MhX-N6
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 Nov 2020 18:50:41 +0000
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
 [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A480F24180;
 Tue, 17 Nov 2020 18:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605639009;
 bh=ptz9XT3UpBck0+d8VvUIsolwmj+r8a3+u1aG77tQJmI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VmVR2pAkTlpMKVjjgmbkim6ODtn1XHcuCvpY+dS/cItfgY5lVJnQyb+QKecfKG9cH
 bB2akSGX5XKm0Y290MyY1d6qvi6oF9ARKg0xqZ0rWF7bfyngwmZbo5JBR5qyfqscDa
 opfxCyeGR/g5xyvZBhCdhIHAorzvoK1oBOibSCcE=
Date: Tue, 17 Nov 2020 10:50:07 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Daniel Rosenberg <drosen@google.com>
Message-ID: <X7QbX9Q4xzhg+5UU@sol.localdomain>
References: <20201117040315.28548-1-drosen@google.com>
 <20201117040315.28548-4-drosen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201117040315.28548-4-drosen@google.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: samsung.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kf63Z-001MhX-N6
Subject: Re: [f2fs-dev] [PATCH v2 3/3] f2fs: Handle casefolding with
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
Cc: kernel-team@android.com, "Theodore Y . Ts'o" <tytso@mit.edu>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Nov 17, 2020 at 04:03:15AM +0000, Daniel Rosenberg wrote:
> Expand f2fs's casefolding support to include encrypted directories.  To
> index casefolded+encrypted directories, we use the SipHash of the
> casefolded name, keyed by a key derived from the directory's fscrypt
> master key.  This ensures that the dirhash doesn't leak information
> about the plaintext filenames.
> 
> Encryption keys are unavailable during roll-forward recovery, so we
> can't compute the dirhash when recovering a new dentry in an encrypted +
> casefolded directory.  To avoid having to force a checkpoint when a new
> file is fsync'ed, store the dirhash on-disk appended to i_name.
> 
> This patch incorporates work by Eric Biggers <ebiggers@google.com>
> and Jaegeuk Kim <jaegeuk@kernel.org>.
> 
> Co-developed-by: Eric Biggers <ebiggers@google.com>
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> Signed-off-by: Daniel Rosenberg <drosen@google.com>
> ---
>  fs/f2fs/dir.c      | 89 +++++++++++++++++++++++++++++++++++++---------
>  fs/f2fs/f2fs.h     |  8 +++--
>  fs/f2fs/hash.c     | 11 +++++-
>  fs/f2fs/inline.c   |  4 +++
>  fs/f2fs/recovery.c | 12 ++++++-
>  fs/f2fs/super.c    |  6 ----
>  6 files changed, 103 insertions(+), 27 deletions(-)
> 
> diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
> index 71fdf5076461..0adc6bcfb5c0 100644
> --- a/fs/f2fs/dir.c
> +++ b/fs/f2fs/dir.c
> @@ -5,6 +5,7 @@
>   * Copyright (c) 2012 Samsung Electronics Co., Ltd.
>   *             http://www.samsung.com/
>   */
> +#include <asm/unaligned.h>
>  #include <linux/fs.h>
>  #include <linux/f2fs_fs.h>
>  #include <linux/sched/signal.h>
> @@ -195,26 +196,53 @@ static struct f2fs_dir_entry *find_in_block(struct inode *dir,
>  {
>  	struct f2fs_dentry_block *dentry_blk;
>  	struct f2fs_dentry_ptr d;
> +	struct f2fs_dir_entry *res;
>  
>  	dentry_blk = (struct f2fs_dentry_block *)page_address(dentry_page);
>  
>  	make_dentry_ptr_block(dir, &d, dentry_blk);
> -	return f2fs_find_target_dentry(&d, fname, max_slots);
> +	res = f2fs_find_target_dentry(&d, fname, max_slots);
> +	if (IS_ERR(res)) {
> +		dentry_page = ERR_CAST(res);
> +		res = NULL;
> +	}
> +	return res;
>  }

What is the assignment to dentry_page supposed to be accomplishing?  It looks
like it's meant to pass up errors from f2fs_find_target_dentry(), but it doesn't
do that.

> @@ -222,14 +250,20 @@ static bool f2fs_match_ci_name(const struct inode *dir, const struct qstr *name,
>  		 * fall back to treating them as opaque byte sequences.
>  		 */
>  		if (sb_has_strict_encoding(sb) || name->len != entry.len)
> -			return false;
> -		return !memcmp(name->name, entry.name, name->len);
> +			res = 0;
> +		else
> +			res = memcmp(name->name, entry.name, name->len) == 0;
> +	} else {
> +		/* utf8_strncasecmp_folded returns 0 on match */
> +		res = (res == 0);
>  	}

The following might be easier to understand:

	/*
	 * In strict mode, ignore invalid names.  In non-strict mode, fall back
	 * to treating them as opaque byte sequences.
	 */
	if (res < 0 && !sb_has_strict_encoding(sb)) {
		res = name->len == entry.len &&
		      memcmp(name->name, entry.name, name->len) == 0;
	} else {
		/* utf8_strncasecmp_folded returns 0 on match */
		res = (res == 0);
	}

> @@ -273,10 +308,14 @@ struct f2fs_dir_entry *f2fs_find_target_dentry(const struct f2fs_dentry_ptr *d,
>  			continue;
>  		}
>  
> -		if (de->hash_code == fname->hash &&
> -		    f2fs_match_name(d->inode, fname, d->filename[bit_pos],
> -				    le16_to_cpu(de->name_len)))
> -			goto found;
> +		if (de->hash_code == fname->hash) {
> +			res = f2fs_match_name(d->inode, fname, d->filename[bit_pos],
> +				    le16_to_cpu(de->name_len));
> +			if (res < 0)
> +				return ERR_PTR(res);
> +			else if (res)
> +				goto found;
> +		}

Overly long line here.  Also 'else if' is unnecessary, just use 'if'.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
