Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E3A2B7649
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Nov 2020 07:27:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kfGwO-00035N-UZ; Wed, 18 Nov 2020 06:27:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kfGwN-00035G-Nz
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Nov 2020 06:27:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gSMmH39bSscBO+8TGu+F9q+yi66EsYPiqVxCHjjZR3w=; b=imCrjRYdaZEnNr/N5LO0NsFbMb
 NTYo0LT6hR84wrFEYPBoBgMmCvvsnfZg4pKT2sdtnNd0mFfyylHBZ+ijCrUIruj5ru1oDulgfyTnV
 o5H2K8mTzF7cxmpWgq/uSA1+KGpP8QV/YA18OxBDE2wpaL4QOOM3ludyMzC64x1uxJAA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gSMmH39bSscBO+8TGu+F9q+yi66EsYPiqVxCHjjZR3w=; b=ZRq/FsOMw0iY3IH45sRlnbEwSP
 lenxnqDrWXjSF/3shg7sRPqKzHd/ZxvBM/2kCJl2PHMFQI5LOzrVKA7Tzm5A/EFaASNVjLHJ0UkhF
 ARKSYmx4w1M4fLBhaNKeNg5xxMscq7e6QDXuAyKcKQ0Wl4le8omBMGbFXiVV1gCygDIM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kfGwC-002ibO-Oa
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Nov 2020 06:27:39 +0000
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
 [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 967CC24655;
 Wed, 18 Nov 2020 06:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605680843;
 bh=RpCSS3y/duXfmLEcUn3G8/pHSXmT8ukKU/5AG+m0bT8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V58yRoepyagZTKlr+aW6gb29AshdnBnmgDiYwKqMm3jlLRYkgNPd33jvY3404zhqF
 f0Vq1eeZw/pwKC17YrReXC+eB7OqJ3I2z/UF/rbyQKIjkyufDOUzj36PJr33VOANJ1
 46Slhm5EzAs0u5/ypJRRtVFkLqUibL9cremOd1dY=
Date: Tue, 17 Nov 2020 22:27:20 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Daniel Rosenberg <drosen@google.com>
Message-ID: <X7S+yK05aX+zB+k9@sol.localdomain>
References: <20201117040315.28548-1-drosen@google.com>
 <20201117040315.28548-4-drosen@google.com>
 <X7QbX9Q4xzhg+5UU@sol.localdomain>
 <CA+PiJmRQGJP5uHf-yXs=efo++JE+SUmjRizwzH-RGG92RdAxyw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+PiJmRQGJP5uHf-yXs=efo++JE+SUmjRizwzH-RGG92RdAxyw@mail.gmail.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kfGwC-002ibO-Oa
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

On Tue, Nov 17, 2020 at 10:22:28PM -0800, Daniel Rosenberg wrote:
> > > @@ -273,10 +308,14 @@ struct f2fs_dir_entry *f2fs_find_target_dentry(const struct f2fs_dentry_ptr *d,
> > >                       continue;
> > >               }
> > >
> > > -             if (de->hash_code == fname->hash &&
> > > -                 f2fs_match_name(d->inode, fname, d->filename[bit_pos],
> > > -                                 le16_to_cpu(de->name_len)))
> > > -                     goto found;
> > > +             if (de->hash_code == fname->hash) {
> > > +                     res = f2fs_match_name(d->inode, fname, d->filename[bit_pos],
> > > +                                 le16_to_cpu(de->name_len));
> > > +                     if (res < 0)
> > > +                             return ERR_PTR(res);
> > > +                     else if (res)
> > > +                             goto found;
> > > +             }
> >
> > Overly long line here.  Also 'else if' is unnecessary, just use 'if'.
> >
> > - Eric
> The 0 case is important, since that reflects that the name was not found.

I meant doing the following:

	if (res < 0)
		return ERR_PTR(res);
	if (res)
		goto found;

It doesn't really matter, but usually kernel code doesn't use 'else' after an
early return.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
