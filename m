Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0062AC8DE
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  9 Nov 2020 23:50:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kcFzv-0005cK-G6; Mon, 09 Nov 2020 22:50:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kcFzu-0005cC-CO
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Nov 2020 22:50:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JGy+32ZC9e1RVqm2nKfGZgnJQAtX2OPg9/sPfw9hd/I=; b=EF6PukrAju9TA9lYZ3IeuzsYDH
 DEchC8AzLClcKOe4u3cGAoBEhHfR0sAVZUIRqIE3vf+dnDQxV5eIyTltjYp3jV9FArZiGfuwofBA5
 PvjaETr9p/x0VRs7dOnkpSE08VVbmk38eHozGgF7SZKU4NgYtkH0tBMB9euXMsNm0e54=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JGy+32ZC9e1RVqm2nKfGZgnJQAtX2OPg9/sPfw9hd/I=; b=ExJjPdQWN8lZsI7zbRmng453KG
 hHKPz4Y73rMOSXHJAW1XSGsp9e+xorgKwWR+mDZ3S0R934lJvDnmB1xtoRpWIx8gEtDe5lygTLQI4
 JjOqfM3tfv2DugkVgRaVcjddnKfj735pL+Y2hsv4QwIB1uQxxtVBIJkgoO55uiYC2XOs=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kcFzk-0066TZ-Eu
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Nov 2020 22:50:50 +0000
Received: from gmail.com (unknown [104.132.1.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 28674206C0;
 Mon,  9 Nov 2020 22:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604962234;
 bh=3zCrnmiSy4pI28U8wV8PlYqpeE16yEzdnAVoONyzohs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=x/RoupRNbJK1Pi4mHAwErVHXP/WENGRJgQMMxq9le7k+nzQ6OMr3Ik9Tg6nhy36C1
 yFvZiu/Ji96oaWBRhoIDdUt+aBI3y0PNOh3QbRN0uliX4vy/xne5YwHqkCQB5XM4I4
 qxla2lpMXWy+XbxUgITCAREeyY8g3BQp6Zc+EBOk=
Date: Mon, 9 Nov 2020 14:50:32 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Daniel Rosenberg <drosen@google.com>
Message-ID: <20201109225032.GA2652236@gmail.com>
References: <20200923010151.69506-1-drosen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200923010151.69506-1-drosen@google.com>
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
X-Headers-End: 1kcFzk-0066TZ-Eu
Subject: Re: [f2fs-dev] [PATCH 0/5] Add support for Encryption and
 Casefolding in F2FS
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

On Wed, Sep 23, 2020 at 01:01:46AM +0000, Daniel Rosenberg wrote:
> These patches are on top of the f2fs dev branch
> 
> F2FS currently supports casefolding and encryption, but not at
> the same time. These patches aim to rectify that. In a later follow up,
> this will be added for Ext4 as well. I've included one ext4 patch from
> the previous set since it isn't in the f2fs branch, but is needed for the
> fscrypt changes.
> 
> The f2fs-tools changes have already been applied.
> 
> Since both fscrypt and casefolding require their own dentry operations,
> I've moved the responsibility of setting the dentry operations from fscrypt
> to the filesystems and provided helper functions that should work for most
> cases.
> 
> These are a follow-up to the previously sent patch set
> "[PATCH v12 0/4] Prepare for upcoming Casefolding/Encryption patches"
> 
> Daniel Rosenberg (5):
>   ext4: Use generic casefolding support
>   fscrypt: Export fscrypt_d_revalidate
>   libfs: Add generic function for setting dentry_ops
>   fscrypt: Have filesystems handle their d_ops
>   f2fs: Handle casefolding with Encryption

Daniel, can you resend this for 5.11, with all remaining comments addressed?
The first two patches made 5.10, but the others didn't.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
