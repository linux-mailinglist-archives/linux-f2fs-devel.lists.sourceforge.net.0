Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F404F15A10C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Feb 2020 07:06:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j1lAi-0001Y9-K6; Wed, 12 Feb 2020 06:06:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1j1lAh-0001Xx-J3
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 12 Feb 2020 06:06:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FLgjWoiEq5bxpO7wNKbOzIxQUXy6M9oFvCeb+6gznng=; b=kbNd7Q/x4po5pW1grl/H/hmcq1
 OMa9agMcQqkeOUrrCzaD3eiRSe3gG4sO6/AhJBz8CGp5tPoKxbP6HvQBREUMfZYPQ0VLdp9G7NiWc
 0uFfTl5/whBKVRvUdlbcfEdrAWitAthvz7vowZWYmUYiQUw+fiwtn/RmWFZnSp3s8b2g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FLgjWoiEq5bxpO7wNKbOzIxQUXy6M9oFvCeb+6gznng=; b=edv9v5jfAuJ9ha0VFUlQZs7QXo
 sdGwAz75uMKtz0pT9F2UctwYSuj7CV0BwL4DXuX7zZ9SInaxjC4u0SCrEnuz9ZqheGfcz9Yyv5sJv
 voYq8knB9xz/ROAvFZhBf6kwrm5hxKrq4jxFr/q/PORy7ODCZOaikGuEsmksgI9uaXZo=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j1lAg-009I52-7y
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 12 Feb 2020 06:06:51 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 20AE2206ED;
 Wed, 12 Feb 2020 06:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581487604;
 bh=l14Pn3KEL9YjzF1tPgOKaV7EFnEulcGerPufvbmsbT0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=j5hgBd1bdd/1YHYNsBxsxgHhUKtp/yLRqow31sWL4QpSNfOvdiTIIPgVDMyiAGJqg
 XUT1ZKQCNzV6zDB/nYfmYOsQBd6GPJPIW692CSRtURC/qPWn7rFN0+Tggepd4CFCDC
 toZnWhAiEsjvVOMYcB1lfDxfzgO1q24ahIVd4gpI=
Date: Tue, 11 Feb 2020 22:06:42 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Message-ID: <20200212060642.GJ870@sol.localdomain>
References: <20200208013552.241832-1-drosen@google.com>
 <20200208013552.241832-7-drosen@google.com>
 <20200212051013.GG870@sol.localdomain>
 <20200212055511.GL23230@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200212055511.GL23230@ZenIV.linux.org.uk>
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
X-Headers-End: 1j1lAg-009I52-7y
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
 Daniel Rosenberg <drosen@google.com>, Jonathan Corbet <corbet@lwn.net>,
 Richard Weinberger <richard@nod.at>, Andreas Dilger <adilger.kernel@dilger.ca>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Feb 12, 2020 at 05:55:11AM +0000, Al Viro wrote:
> On Tue, Feb 11, 2020 at 09:10:13PM -0800, Eric Biggers wrote:
> 
> > How about:
> > 
> > int f2fs_ci_compare(const struct inode *parent, const struct qstr *name,
> > 		    u8 *de_name, size_t de_name_len, bool quick)
> > {
> > 	const struct super_block *sb = parent->i_sb;
> > 	const struct unicode_map *um = sb->s_encoding;
> > 	struct fscrypt_str decrypted_name = FSTR_INIT(NULL, de_name_len);
> > 	struct qstr entry = QSTR_INIT(de_name, de_name_len);
> > 	int ret;
> > 
> > 	if (IS_ENCRYPTED(parent)) {
> 
> oops.  parent->d_inode is unstable here; could have become NULL by that
> point.
> 
> > 	if (quick)
> > 		ret = utf8_strncasecmp_folded(um, name, &entry);
> > 	else
> > 		ret = utf8_strncasecmp(um, name, &entry);
> > 	if (ret < 0) {
> > 		/* Handle invalid character sequence as either an error
> > 		 * or as an opaque byte sequence.
> > 		 */
> 
> Really?  How would the callers possibly tell mismatch from an
> error?  And if they could, would would they *do* with that
> error, seeing that it might be an effect of a race with
> rename()?
> 
> Again, ->d_compare() is NOT given a stable name.  Or *parent.  Or
> (parent->d_inode).

After the patch earlier in the series that created generic_ci_d_compare() and
switched f2fs to use it, f2fs_ci_compare() is only called when the filesystem is
actually searching a directory, not from ->d_compare().  So the names and
parent->d_inode are stable in it.

But, that also means the GFP_ATOMIC isn't needed, and f2fs_ci_compare() should
be made 'static'.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
