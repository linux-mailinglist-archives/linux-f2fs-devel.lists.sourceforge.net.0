Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF8034BCBD
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 28 Mar 2021 17:08:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lQX1K-0007iE-9O; Sun, 28 Mar 2021 15:08:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <willy@infradead.org>) id 1lQX1D-0007hG-Sx
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 28 Mar 2021 15:07:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=U3VUBgSWmtuhj2eaOcurajScUzkTC8xyuO2uGbgOuaE=; b=F+tofEvb939VNU2GKY1mjQD3Sa
 m8D5EJjY513HQhHk3d0o/2sQ7eqQXuIbtieLtgqPIQZfCq2Tin/t0f0CmBo/AtOTQ/dSYtuXs3IjQ
 4Lo+vIwpkc3Wo/dB5vNcBm9UJlh/u+07v/TzCt97M4bi7uWSC44VdVshfvY4m3Z0dIwc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=U3VUBgSWmtuhj2eaOcurajScUzkTC8xyuO2uGbgOuaE=; b=OjQHoyjvWcrATu8NRvQD3x+8b/
 p1T3RhlcSOYZ8aCxHZ2iSeYK4pRdV0TKs6b4cPtP9GG0sBET24lmyUmTbICxs5Q2jSQLpMynMA075
 U7/8ijA8qIQJH8fEW5rt7Ef3iMDpwOvMSp4sfOY67BN/WydbWKYNBVGBK3CRLKLAZCP0=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lQX13-004pVp-VW
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 28 Mar 2021 15:07:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=U3VUBgSWmtuhj2eaOcurajScUzkTC8xyuO2uGbgOuaE=; b=aSLec8BLfvM6s8JuxKcmT1Wg2W
 m/And3P1jFN2IW/L1JYvNroaUyFxLz1W6U6oz2tM0c5Sp4BKZUJNortM4lqrYuDyQgFOu7KQfKV26
 NE/GIoPujfo70lzZ3SrNV6WgavKVz7Mddbw9+fBhoAZuak+LqRB9jlhYNddifLa4BckCw1fK+2XZt
 zaMHXwj84B8anfi9sKC1D8iIJj788XdTVYqtxEE9t9kVqlZcoc9xa3IdPN4IA4PPLZ5iTdV+QRT+d
 bqgwGE1tdJzUh/NLuFafHWioh96XJcCZRhZ1Wg1yckv0WTHCdvtIBvJCBz4e0ODFl5hZk9rrMfG9V
 OVKMzBeg==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lQX0V-000CDn-KJ; Sun, 28 Mar 2021 15:07:20 +0000
Date: Sun, 28 Mar 2021 16:07:15 +0100
From: Matthew Wilcox <willy@infradead.org>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@collabora.com>
Message-ID: <20210328150715.GA33249@casper.infradead.org>
References: <20210328144356.12866-1-andrealmeid@collabora.com>
 <20210328144356.12866-2-andrealmeid@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210328144356.12866-2-andrealmeid@collabora.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lQX13-004pVp-VW
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

This is quite the landmine of a function.  It _assumes_ that the directory
is empty, and clears all dentries in it.

> +void d_clear_dir_neg_dentries(struct inode *dir)
> +{
> +	struct dentry *alias, *dentry;
> +
> +	hlist_for_each_entry(alias, &dir->i_dentry, d_u.d_alias) {
> +		list_for_each_entry(dentry, &alias->d_subdirs, d_child) {
> +			d_drop(dentry);
> +			dput(dentry);
> +		}

I would be happier if it included a check for negativity.  d_is_negative()
or maybe this newfangled d_really_is_negative() (i haven't stayed up
to speed on the precise difference between the two)

> +	}
> +}
> +EXPORT_SYMBOL(d_clear_dir_neg_dentries);

I'd rather see this _GPL for such an internal thing.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
