Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A85F5159F92
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Feb 2020 04:38:39 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j1irA-0003CM-8A; Wed, 12 Feb 2020 03:38:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1j1ir4-0003C7-V8
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 12 Feb 2020 03:38:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jqjp8DR9BpSBkCVT4AyTGBZkwOJQhZg/XHWI/DKBslQ=; b=P4Ld1gZQR5kWEDr5oFIoNMykvJ
 +K6uELaxej4hGr8gc60JeGNYprgWTGZ6DQm/FelnqR6rZdPosYrUDNEcCylgU8G9xA27+VyiEvOhJ
 hjcVADtVzBG1pO1ynHtjDmNt8o8v6qTy45ysMehwQWyBWWblsByQfs2yIrtcz7RhQC5A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jqjp8DR9BpSBkCVT4AyTGBZkwOJQhZg/XHWI/DKBslQ=; b=a6a4VzgSLhZs3FGhc4vQJMj5fX
 w+BZGXxK7EojGtVb7zDMhQ/hEF5NCIliM8QzQYSu5o8nDnsMKFmQyMWSqwFUVgWBuOiZqQNq6C8Fr
 Ay9oKZ3MrZDV5wzsDbmuOMj2x0PAKpa2h83Ce1oxRFdVLjtLN/z16vXMdP4W8kO49lso=;
Received: from [198.145.29.99] (helo=mail.kernel.org)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j1iqy-0015rx-0C
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 12 Feb 2020 03:38:26 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D8E112073C;
 Wed, 12 Feb 2020 03:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581478684;
 bh=QFEFG/81Rfdx+DhaJa330Iy0plXtvuXYAYlLrbnAw4s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kgLuYeSFpKxnDdxa83uM8r7H8S2iSSVhydJQbgl1WskDbn0S35JXuXY6oYMb6AFqU
 HxO5QSmEbAmJQYLuF8FimrMwI0rN+5dYv0mjVwfxsOCEj+bKApbx/sRGflnZL6TTxF
 hsjxh+dI86q2CbBRmKMiAXqhZqvYy14nr51t/CqE=
Date: Tue, 11 Feb 2020 19:38:00 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Daniel Rosenberg <drosen@google.com>
Message-ID: <20200212033800.GC870@sol.localdomain>
References: <20200208013552.241832-1-drosen@google.com>
 <20200208013552.241832-2-drosen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200208013552.241832-2-drosen@google.com>
X-Spam-Score: 0.9 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 1.0 RDNS_NONE Delivered to internal network by a host with no rDNS
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1j1iqy-0015rx-0C
Subject: Re: [f2fs-dev] [PATCH v7 1/8] unicode: Add utf8_casefold_iter
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

On Fri, Feb 07, 2020 at 05:35:45PM -0800, Daniel Rosenberg wrote:
> This function will allow other uses of unicode to act upon a casefolded
> string without needing to allocate their own copy of one.
> 
> The actor function can return an nonzero value to exit early.
> 
> Signed-off-by: Daniel Rosenberg <drosen@google.com>
> ---
>  fs/unicode/utf8-core.c  | 25 ++++++++++++++++++++++++-
>  include/linux/unicode.h | 10 ++++++++++
>  2 files changed, 34 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/unicode/utf8-core.c b/fs/unicode/utf8-core.c
> index 2a878b739115d..db050bf59a32b 100644
> --- a/fs/unicode/utf8-core.c
> +++ b/fs/unicode/utf8-core.c
> @@ -122,9 +122,32 @@ int utf8_casefold(const struct unicode_map *um, const struct qstr *str,
>  	}
>  	return -EINVAL;
>  }
> -
>  EXPORT_SYMBOL(utf8_casefold);
>  
> +int utf8_casefold_iter(const struct unicode_map *um, const struct qstr *str,
> +		    struct utf8_itr_context *ctx)
> +{
> +	const struct utf8data *data = utf8nfdicf(um->version);
> +	struct utf8cursor cur;
> +	int c;
> +	int res = 0;
> +	int pos = 0;
> +
> +	if (utf8ncursor(&cur, data, str->name, str->len) < 0)
> +		return -EINVAL;
> +
> +	while ((c = utf8byte(&cur))) {
> +		if (c < 0)
> +			return c;
> +		res = ctx->actor(ctx, c, pos);
> +		pos++;
> +		if (res)
> +			return res;
> +	}
> +	return res;
> +}
> +EXPORT_SYMBOL(utf8_casefold_iter);

Indirect function calls are expensive these days for various reasons, including
Spectre mitigations and CFI.  Are you sure it's okay from a performance
perspective to make an indirect call for every byte of the pathname?

> +typedef int (*utf8_itr_actor_t)(struct utf8_itr_context *, int byte, int pos);

The byte argument probably should be 'u8', to avoid confusion about whether it's
a byte or a Unicode codepoint.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
