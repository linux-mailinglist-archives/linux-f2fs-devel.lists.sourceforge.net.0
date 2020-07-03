Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C0D213FD7
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  3 Jul 2020 21:21:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jrRFL-00028I-3q; Fri, 03 Jul 2020 19:21:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jrRFI-000286-Rz
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 03 Jul 2020 19:21:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PZ1CWQ2oZOftmCp0xm6Cw5IBSVB3wpuBRpxl11xavR4=; b=UQ5n3nwgvo8u/eUG2XUfnQSrJ8
 7m9pZ1JaqeKeFs16NOuXbsM+6NQcrojgvS8HeYW+ufgiW8u8q0mSwkr0pDKhtgpwQLp8bEed8baFR
 vYd2yWwz4fxflh44Gh2KmUMOgcNCQMVsyuNYlf2fV+e7jP1dIbzHwtIza5G0bVAaw3F8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PZ1CWQ2oZOftmCp0xm6Cw5IBSVB3wpuBRpxl11xavR4=; b=Bo4HkvX3/ynsNeD2azBHm2Ircw
 5FyCYibUd0HfinB3uzjBPe6ef5P3gE0U3VKbmvpJeQvg8RMO8ZIFEEUGnuEH65kZ5C/je/SouV/Bd
 obyKl0zGQ7RFKYwdgcju4EN6F8lPdYid+BPwg09S1lE4Qn8d9wHcCjW/tQ59uaGf4TRs=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jrRFE-00CFMz-0z
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 03 Jul 2020 19:21:12 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EB37F207FF;
 Fri,  3 Jul 2020 19:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593804057;
 bh=PEmsm7KiYhEynj7JM9OkcWwJJEMC5FTZ1MgB7GC3/kw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cZz3+cYtChLGxVGtGhI0iqF8NG4vRe7SyHyKP6rwlrniscYuLOgqOM9tC5bBvh6V9
 rCNuVMRKKdD1/I05cjOph+0nERO2OeeH/Y1QSjn/3szq+YCjsBxWz49TxA/V8HiT6F
 N6pBBTbIdf7MhFFMTY1BRtmYQCvTyvOSvJ4M/pzg=
Date: Fri, 3 Jul 2020 12:20:55 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Daniel Rosenberg <drosen@google.com>
Message-ID: <20200703192055.GA2825@sol.localdomain>
References: <20200624043341.33364-1-drosen@google.com>
 <20200624043341.33364-3-drosen@google.com>
 <20200624055707.GG844@sol.localdomain>
 <CA+PiJmTDXTKnccJdADX=ir+PtqsDD72xHGbzObpntkjkVmKHxQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+PiJmTDXTKnccJdADX=ir+PtqsDD72xHGbzObpntkjkVmKHxQ@mail.gmail.com>
X-Spam-Score: -0.5 (/)
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
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jrRFE-00CFMz-0z
Subject: Re: [f2fs-dev] [PATCH v9 2/4] fs: Add standard casefolding support
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

On Thu, Jul 02, 2020 at 06:01:37PM -0700, Daniel Rosenberg wrote:
> On Tue, Jun 23, 2020 at 10:57 PM Eric Biggers <ebiggers@kernel.org> wrote:
> >
> > Note that the '!IS_ENCRYPTED(dir) || fscrypt_has_encryption_key(dir)' check can
> > be racy, because a process can be looking up a no-key token in a directory while
> > concurrently another process initializes the directory's ->i_crypt_info, causing
> > fscrypt_has_encryption_key(dir) to suddenly start returning true.
> >
> > In my rework of filename handling in f2fs, I actually ended up removing all
> > calls to needs_casefold(), thus avoiding this race.  f2fs now decides whether
> > the name is going to need casefolding early on, in __f2fs_setup_filename(),
> > where it knows in a race-free way whether the filename is a no-key token or not.
> >
> > Perhaps ext4 should work the same way?  It did look like there would be some
> > extra complexity due to how the ext4 directory hashing works in comparison to
> > f2fs's, but I haven't had a chance to properly investigate it.
> >
> > - Eric
> 
> Hm. I think I should be able to just check for DCACHE_ENCRYPTED_NAME
> in the dentry here, right? I'm just trying to avoid casefolding the
> no-key token, and that flag should indicate that.

Ideally yes, but currently the 'struct dentry' isn't always available.  See how
fscrypt_setup_filename(), f2fs_setup_filename(), f2fs_find_entry(),
ext4_find_entry(), etc. take a 'struct qstr', not a 'struct dentry'.

At some point we should fix that by passing down the dentry whenever it's
available, so that we reliably know whether the name is a no-key name or not.

So even my new f2fs code is still racy.  But it at least handles each filename
in a consistent way within each directory operation.  In comparison, your
proposed ext4 code can treat a filename as a no-key name while matching one
dir_entry and then as a regular filename while matching the next.  I think the
f2fs way is more on the right track, both correctness-wise and efficiency-wise.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
