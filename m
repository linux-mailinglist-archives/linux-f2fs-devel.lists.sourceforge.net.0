Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C436C275103
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 23 Sep 2020 08:07:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kKxwB-0001J2-8j; Wed, 23 Sep 2020 06:07:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kKxw9-0001Im-OC
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 23 Sep 2020 06:07:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=i6Hg10SQBbaDoG7zUsTuZy0VHpq0G8cgHwFnshvQKqg=; b=B/YmuJa7yVS+cVx4ItzXo8cTXH
 lDvMP0r808mAztfUieCJb+9ZTl2JzzKEJ/cCQUglqw+v1ogISW6w7xs2asmjLL2zq1HhOJ8Nb6F8O
 mQZUmAjtnjnQ97XBZdy4yAaQ1Tp6B9TMpOs5Ql16h/ptCQ3qhkRul/qhucJVyzoOEyvQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=i6Hg10SQBbaDoG7zUsTuZy0VHpq0G8cgHwFnshvQKqg=; b=SN4qRRRpKyI4gxx+odVVJffPnY
 CtbKlYVdJYsNJ1cm7Y4gRqHECQcvv8wPvmpLwdcl13rjHGF385qWNzXYNeg1A+pC2IDqV0T7/BeFn
 2jdPsAVQecqLW1XLMB5h2wlW6uev5PRTM/sHvl/Fh8iOypaywUTGa2We5J1LKRlQQqgU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kKxw2-00263c-Al
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 23 Sep 2020 06:07:29 +0000
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
 [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7BEC9235FC;
 Wed, 23 Sep 2020 06:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600841236;
 bh=kyWQ8LYf7qzECEdXjAoNSqNNVC8G8Y8QllK22Douvts=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lDlsAnvlLTFfh5gvzZnIhu6t8x8513xuoBHUj/FJRyY6n5ixwf7t/gfjtYU2abUJE
 2ANdE+NbEuR3FdILpOGpbTXLaRP3o1THWDT+g2nbv/P27sYI3n3sxUEW6aIt4GnFmx
 0qPYtcS2uf+FibkrZAMT596HZyf3H9QGvUW8bUz0=
Date: Tue, 22 Sep 2020 23:07:15 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Daniel Rosenberg <drosen@google.com>
Message-ID: <20200923060715.GD9538@sol.localdomain>
References: <20200923010151.69506-1-drosen@google.com>
 <20200923010151.69506-4-drosen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200923010151.69506-4-drosen@google.com>
X-Spam-Score: -1.3 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kKxw2-00263c-Al
Subject: Re: [f2fs-dev] [PATCH 3/5] libfs: Add generic function for setting
 dentry_ops
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

On Wed, Sep 23, 2020 at 01:01:49AM +0000, Daniel Rosenberg wrote:
> This adds a function to set dentry operations at lookup time that will
> work for both encrypted files and casefolded filenames.

"encrypted files" => "encrypted filenames"

> 
> A filesystem that supports both features simultaneously can use this
> function during lookup preperations to set up its dentry operations once
> fscrypt no longer does that itself.

"preperations" => "preparations"

> 
> Currently the casefolding dentry operation are always set because the
> feature is toggleable on empty directories. Since we don't know what
> set of functions we'll eventually need, and cannot change them later,
> we add just add them.

"are always set" => "are always set if the filesystem defines an encoding"

> +/**
> + * generic_set_encrypted_ci_d_ops - helper for setting d_ops for given dentry
> + * @dentry:	dentry to set ops on
> + *
> + * This function sets the dentry ops for the given dentry to handle both
> + * casefolding and encryption of the dentry name.
> + */

But it also seems that some of the information in the commit message should go
into this comment so that it isn't lost.  It's not clear to someone reading this
code what "handling encryption of the dentry name" means (hint: it doesn't
actually mean handling encryption...), and why setting the casefolding
operations isn't conditional on IS_CASEFOLDED(dir).

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
