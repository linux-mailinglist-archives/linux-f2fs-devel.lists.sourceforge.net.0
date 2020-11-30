Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE282C8CF8
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 30 Nov 2020 19:40:03 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kjo5f-0003S0-Lm; Mon, 30 Nov 2020 18:39:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kjo5E-0003OI-B7
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 30 Nov 2020 18:39:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+jYPlYW2+kIL2fH4iLIvh97UqkMmrses5jDliPk9bmk=; b=F0qtlTSH60OcaqLlrJVQJ1Dv4U
 Ukz1nNLkaSKqrI9oe+knRNZyPDM2Yu6SmhEH0PuwQocAeOO7M+LsjaDd1HhusVsYFz8wqYzhp35J3
 coD+w+P9mQNO/nHVRNw6LHG/ULAolueUL/3zh1SHxu0vk5bIXrItREXpaMvm+gCeHIS8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+jYPlYW2+kIL2fH4iLIvh97UqkMmrses5jDliPk9bmk=; b=MY7Vhrprx6/+2WAhbsgrTTnhXi
 xAQHjBXGEwnfgjGTKzERV0yW2Yb91t+b/pQtB0ZMOwchkdcQNsW164Xhl5wZf3mur+Dp2ZGSdiZI2
 E+mRU/NI7mmKGWz0T1dJ/nwXteqJyoyaR2fYMEZzzGambIGoMzDlNg3ZX/olB2Vz6H9I=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kjo59-00CKUV-OS
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 30 Nov 2020 18:39:32 +0000
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
 [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CEB7C20725;
 Mon, 30 Nov 2020 18:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606761550;
 bh=iyiVXouYuLi8CR86GzyUdOgKT90WbpSteoJW5M4oEVk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aXy2QaN2MB+nWvfSaoJBWlS6qrs0U5NvQwY+332G7XNAe4FwosH+SNz7wPXVbNa/U
 8cpYTs4w421Ab3JmQ4JYYMBNqH+VWqSiI28EqPoL3V3zlKDxwHSP+oZPJlAIrvhPzM
 wf04wz61EO5+cSNbuIxLWXFNc3DxWAHE1Ufapupw=
Date: Mon, 30 Nov 2020 10:39:08 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Andreas Dilger <adilger@dilger.ca>
Message-ID: <X8U8TG2ie77YiCF5@sol.localdomain>
References: <D1AD7D55-94D6-4C19-96B4-BAD0FD33CF49@dilger.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <D1AD7D55-94D6-4C19-96B4-BAD0FD33CF49@dilger.ca>
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kjo59-00CKUV-OS
Subject: Re: [f2fs-dev] backup/restore of fscrypt files
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
Cc: Theodore Ts'o <tytso@mit.edu>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, Sebastien Buisson <sbuisson@ddn.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Ext4 Developers List <linux-ext4@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Andreas,

On Thu, Nov 26, 2020 at 12:12:26AM -0700, Andreas Dilger wrote:
> Currently it is not possible to do backup/restore of fscrypted files without the
> encryption key for a number of reasons.  However, it is desirable to be able to
> backup/restore filesystems with encrypted files for numerous reasons.
> 
> My understanding is that there are two significant obstacles for this to work:
> - the file size reported to userspace for an encrypted file is the "real" file size,
>   but there is data stored beyond "i_size" that is required for decrypting the file
> - the per-inode 16-byte nonce that would need to be backed up and restored for
>   later decryption to be possible
> 
> I'm wondering if it makes sense for stat() to report the size rounded up to the end
> of the encryption block for encrypted files, and then report the "real" size and
> nonce in virtual xattrs (e.g. "trusted.fscrypt_size" and "trusted.fscrypt_nonce")
> so that encrypted files can be backed up and restored using normal utilities like
> tar and rsync if the xattrs are also copied.
> 
> A (small) added benefit of rounding the size of encrypted files up to the end of the
> encryption block is that it makes fingerprinting of files by their size a bit harder.
> Changing the size returned by stat() is not (IMHO) problematic, since it is not
> currently possible to directly read encrypted files without the key anyway.
> 
> The use of "trusted" xattrs would limit the backup/restore of encrypted files to
> privileged users.  We could use "user" xattrs to allow backup by non-root users, but
> that would re-expose the real file size to userspace (not worse than today), and
> would corrupt the file if the size or nonce xattrs were modified by the user.
> 
> It isn't clear whether there is a huge benefit of users to be able to backup/restore
> their own files while encrypted.  For single-user systems, the user will have root
> access anyway, while administrators of multi-user systems need privileged access for
> shared filesystems backup/restore anyway.
> 
> I'm probably missing some issues here, but hopefully this isn't an intractable problem.
> 

There would be a lot more to it than what you describe.

First, filenames are encrypted too.  As a result, there would have to be new
ioctls to allow backing up and restoring encrypted filenames.  The existing
no-key names (the names the kernel shows when you list an encrypted dir) don't
work for this, as due to the NAME_MAX limit, they don't necessarily encode the
whole ciphertext.  There would have to be new APIs which operate on raw
ciphertexts (which may contain the '/' or '\0' bytes) of up to NAME_MAX bytes.

Similarly for symlinks; there would have to be new ioctls to read and create
them, as the existing readlink() and symlink() system calls won't necessarily
work.  Granted, handling symlinks correctly is less critical than filenames, as
we *could* just encode the whole symlink target in base64 and say that if you
create a symlink target over 3072 bytes you're out of luck.  That would be
problematic, but less so than limiting encrypted filenames to ~180 bytes...

So for that and various other reasons such as the ordering of different
operations (when restoring a directory, will it be marked as encrypted before or
after the files are created in it, etc.), I think allowing 'rsync' or 'tar' to
work transparently isn't going to be possible.  Instead, a new tool that knows
how to use ioctls to back up and restore encrypted files would be needed.

Then there is the issue of ordering and how different operations would interact
with each other.  This proposal would require the ability to open() a regular
file that doesn't have its encryption key available, and read and write from it.
open() gives you a file descriptor on which lots of other things could be called
too, so we'd need to make sure to explicitly prevent a lot of things which we
didn't have to worry about before, like fallocate() and various ioctl()s.  Then,
what happens if someone adds an encryption key -- when does the file's page
cache get invalidated, and how does it get synchronized with any ongoing I/O, or
memory maps that may exist, and so on.  (Allowing only direct I/O on files that
don't have encryption key unavailable may help...)

Or what happens if an encrypted directory is "under construction", and someone
tries to access it with the key, but its fscrypt_nonce hasn't been restored yet.
And how are such directories represented on-disk -- what does the encryption
xattr actually contain.  Requiring the encryption policy and nonce to be set
*before* anything is created in the directory would make things simpler, I
think...  Also similarly for setting the real file size -- requiring that it be
set before anything can be written to the file may help.

As for changing the i_size reported to userspace on encrypted files without the
key to include the whole final encrypted block, I don't think that would be an
issue by itself.  Note that it doesn't really "make fingerprinting of files by
their size a bit harder", as i_size would still be unencrypted on-disk.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
