Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7333834E0D7
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Mar 2021 07:48:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lR7Ef-0004iD-IR; Tue, 30 Mar 2021 05:48:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1lR7Ed-0004hv-K1
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 30 Mar 2021 05:48:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pFUVrBpFO+oOYvVjfn8kas5pBcIKHrC2uxmTqRTUYII=; b=HOJDDeZV0I4wdNTfGljRAopdBt
 9GGJCDT3aqZxBB5LS1FfHwM250W0misAhvZXMhV32fyoOB+pMy+sSM4mo23NGECeGnHb5JFv/IQCz
 vPibIyeZkt9OyBBxQjn7e9IJvp2ht7U6GsBsaeNHNYBkalRDc2vyjsU8GEIVz3z2rTeo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pFUVrBpFO+oOYvVjfn8kas5pBcIKHrC2uxmTqRTUYII=; b=QOMyYvHe5HZBQYX1OGcEsOfR0J
 XRFhPe6oTfUUdr1P8VLgEAvTNHjVFJk57cTH3fC8/EbCglf8Mbd3AkETq4GoHJT6s7MyUXFbERC8e
 Rr+NXAYt/P2UH6qbuyqAU1o8+85FvPdd/zLUUmi20QFuL0u2nx+lsNT4HoaHJsJ6CS1E=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lR7EU-0007Zk-97
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 30 Mar 2021 05:48:15 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3348A60C3E;
 Tue, 30 Mar 2021 05:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617083274;
 bh=sLNj16jz+MQWRyeegTuCAOgGNtHJE4k6qlmBk/8uBWI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D5D0VXYmafeEBMtG4ve4wxOPt1WgZvZxYhS5O2cOf3CDcG5u8Mhb4E0WwnxKqerBi
 0maG55PE9DYmIqSZnROblCGPgINK+wAy4saOuDtDFYPeNYucHsnzUBblvdVMUYa0V7
 WgI08qZovt3PTgc30I9paP4w65zc62b75G9GZ3++Cm/HsHYbesw9TUIUSrBWq3GnXz
 xoAneUB4YUsjj6/sDklBkYhXUaWtU+mt/hvkcsYVgWPU58VqPPhPpNB5XFJ+UvHxWx
 tqR88XVAfDb9fT9RTNeEdkJX9qknZGctXrGhnF2fmt8QuLFCgpVnjj+v2Ou5ghI8hg
 CQZA8PJ5oNpYQ==
Date: Mon, 29 Mar 2021 22:47:52 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Message-ID: <YGK7iNRXcMr/ahsL@sol.localdomain>
References: <20210329204240.359184-1-shreeya.patel@collabora.com>
 <20210329204240.359184-5-shreeya.patel@collabora.com>
 <YGKGhxaozX3ND6iB@gmail.com> <87v999pequ.fsf@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87v999pequ.fsf@collabora.com>
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
X-Headers-End: 1lR7EU-0007Zk-97
Subject: Re: [f2fs-dev] [PATCH v5 4/4] fs: unicode: Add utf8 module and a
 unicode layer
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
Cc: tytso@mit.edu, drosen@google.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel@collabora.com,
 adilger.kernel@dilger.ca, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 andre.almeida@collabora.com, linux-ext4@vger.kernel.org,
 Shreeya Patel <shreeya.patel@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Mar 29, 2021 at 10:16:57PM -0400, Gabriel Krisman Bertazi wrote:
> Eric Biggers <ebiggers@kernel.org> writes:
> 
> > On Tue, Mar 30, 2021 at 02:12:40AM +0530, Shreeya Patel wrote:
> >> diff --git a/fs/unicode/Kconfig b/fs/unicode/Kconfig
> >> index 2c27b9a5cd6c..ad4b837f2eb2 100644
> >> --- a/fs/unicode/Kconfig
> >> +++ b/fs/unicode/Kconfig
> >> @@ -2,13 +2,26 @@
> >>  #
> >>  # UTF-8 normalization
> >>  #
> >> +# CONFIG_UNICODE will be automatically enabled if CONFIG_UNICODE_UTF8
> >> +# is enabled. This config option adds the unicode subsystem layer which loads
> >> +# the UTF-8 module whenever any filesystem needs it.
> >>  config UNICODE
> >> -	bool "UTF-8 normalization and casefolding support"
> >> +	bool
> >> +
> >> +# utf8data.h_shipped has a large database table which is an auto-generated
> >> +# decodification trie for the unicode normalization functions and it is not
> >> +# necessary to carry this large table in the kernel.
> >> +# Enabling UNICODE_UTF8 option will allow UTF-8 encoding to be built as a
> >> +# module and this module will be loaded by the unicode subsystem layer only
> >> +# when any filesystem needs it.
> >> +config UNICODE_UTF8
> >> +	tristate "UTF-8 module"
> >>  	help
> >>  	  Say Y here to enable UTF-8 NFD normalization and NFD+CF casefolding
> >>  	  support.
> >> +	select UNICODE
> >
> > This seems problematic; it allows users to set CONFIG_EXT4_FS=y (or
> > CONFIG_F2FS_FS=y) but then CONFIG_UNICODE_UTF8=m.  Then the filesystem won't
> > work if the modules are located on the filesystem itself.
> 
> Hi Eric,
> 
> Isn't this a user problem?  If the modules required to boot are on the
> filesystem itself, you are in trouble.  But, if that is the case, your
> rootfs is case-insensitive and you gotta have utf8 as built-in or have
> it in an early userspace.
> 

We could make it the user's problem, but that seems rather unfriendly.
Especially because the utf8 module would be needed if the filesystem has the
casefold feature at all, regardless of whether any casefolded directories are
needed at boot time or not.  (Unless there is a plan to change that?)

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
