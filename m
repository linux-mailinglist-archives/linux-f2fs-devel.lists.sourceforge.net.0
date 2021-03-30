Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B460D34DDC4
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Mar 2021 03:49:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lR3VI-00040R-6B; Tue, 30 Mar 2021 01:49:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1lR3VG-00040I-Dd
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 30 Mar 2021 01:49:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3Y1VDQRq1LfrD1XIsfEAJG7MbEKCTChZ0EmxY+Op0AM=; b=a4AXGc6oQ7A9XehD35flBudMrU
 s8ymC2tV6CjxkknMES5gvHUNhCJOMpLidWxk6NhSqzCNEExxfi+qw1R51DTG9LiHKbEdy1nOQtJmf
 yoJEkr+Qin2zqonK037F8nxPapYMekzlJqR041G4rP8ek4g1w9zGdCCmM5YcAf+SOxFc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3Y1VDQRq1LfrD1XIsfEAJG7MbEKCTChZ0EmxY+Op0AM=; b=bfTMb6Xv6WH/KczHdJyzMZaPUs
 yTttZhJxs4VDaKRhS/lz8fW1LbT+cNumzBA6UwMoKPIVbBLDt97naXu+1tenG8TaDojNBEZpoJqUd
 HW7TKVTz0BHKBe5iqlK8nTj4IrfyRZu4iQsM/x5XY5xiuabhIe4yA0FGpQ7We3PN/Nwg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lR3V4-00Asp9-KS
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 30 Mar 2021 01:49:10 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8C49360C41;
 Tue, 30 Mar 2021 01:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617068927;
 bh=iIeIM/OuGtjaYTjydbbG0UkVMkzGNNchPxEVUAEmnkM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nDxq7K9t7dlImUknG3pZavwpTDgqaPC7F9NdQLDcVbBczilmQZvhCW0eksYB8RuYt
 WjNUkzadhFtYGdO6BMlWvTRw1NW2eir9qEheqsePkacJsCdS2n/WJYmFgsXweXbnHo
 1PT+uC3kAf881vRVcH30ssY4QqHieFaZg+7iVRum4xbCXh6WBWyd4aP52uL34rkcvH
 rTPtpyumwG13TKR9pY8RmdZsGh7As/NrnVe8LDGtHCGWBLPbo4ro2YhnSCs1MvmKHl
 KaK/qtyaBcuqUh91ULqym24uAAtps7VmWan4KPhFTY2ueJ92c5xT/nlAI4snicxy2l
 clT9SDt2FfZaA==
Date: Mon, 29 Mar 2021 18:48:46 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@collabora.com>
Message-ID: <YGKDfo1vZfFXwG/v@gmail.com>
References: <20210328144356.12866-1-andrealmeid@collabora.com>
 <20210328144356.12866-2-andrealmeid@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210328144356.12866-2-andrealmeid@collabora.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: collabora.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lR3V4-00Asp9-KS
Subject: Re: [f2fs-dev] [PATCH 1/3] fs/dcache: Add d_clear_dir_neg_dentries()
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
Cc: linux-ext4@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 Daniel Rosenberg <drosen@google.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, kernel@collabora.com, krisman@collabora.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sun, Mar 28, 2021 at 11:43:54AM -0300, Andr=E9 Almeida wrote:
> For directories with negative dentries that are becoming case-insensitive
> dirs, we need to remove all those negative dentries, otherwise they will
> become dangling dentries. During the creation of a new file, if a d_hash
> collision happens and the names match in a case-insensitive way, the name
> of the file will be the name defined at the negative dentry, that may be
> different from the specified by the user. To prevent this from
> happening, we need to remove all dentries in a directory. Given that the
> directory must be empty before we call this function we are sure that
> all dentries there will be negative.
> =

> Create a function to remove all negative dentries from a directory, to
> be used as explained above by filesystems that support case-insensitive
> lookups.
> =

> Signed-off-by: Andr=E9 Almeida <andrealmeid@collabora.com>
> ---
>  fs/dcache.c            | 27 +++++++++++++++++++++++++++
>  include/linux/dcache.h |  1 +
>  2 files changed, 28 insertions(+)
> =

> diff --git a/fs/dcache.c b/fs/dcache.c
> index 7d24ff7eb206..fafb3016d6fd 100644
> --- a/fs/dcache.c
> +++ b/fs/dcache.c
> @@ -1723,6 +1723,33 @@ void d_invalidate(struct dentry *dentry)
>  }
>  EXPORT_SYMBOL(d_invalidate);
>  =

> +/**
> + * d_clear_dir_neg_dentries - Remove negative dentries in an inode
> + * @dir: Directory to clear negative dentries
> + *
> + * For directories with negative dentries that are becoming case-insensi=
tive
> + * dirs, we need to remove all those negative dentries, otherwise they w=
ill
> + * become dangling dentries. During the creation of a new file, if a d_h=
ash
> + * collision happens and the names match in a case-insensitive, the name=
 of
> + * the file will be the name defined at the negative dentry, that can be
> + * different from the specified by the user. To prevent this from happen=
ing, we
> + * need to remove all dentries in a directory. Given that the directory =
must be
> + * empty before we call this function we are sure that all dentries ther=
e will
> + * be negative.
> + */
> +void d_clear_dir_neg_dentries(struct inode *dir)
> +{
> +	struct dentry *alias, *dentry;
> +
> +	hlist_for_each_entry(alias, &dir->i_dentry, d_u.d_alias) {
> +		list_for_each_entry(dentry, &alias->d_subdirs, d_child) {
> +			d_drop(dentry);
> +			dput(dentry);
> +		}
> +	}
> +}
> +EXPORT_SYMBOL(d_clear_dir_neg_dentries);

As Al already pointed out, this doesn't work as intended, for a number of
different reasons.

Did you consider just using shrink_dcache_parent()?  That already does what=
 you
are trying to do here, I think.

The harder part (which I don't think you've considered) is how to ensure th=
at
all negative dentries really get invalidated even if there are lookups of t=
hem
happening concurrently.  Concurrent lookups can take temporary references t=
o the
negative dentries, preventing them from being invalidated.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
