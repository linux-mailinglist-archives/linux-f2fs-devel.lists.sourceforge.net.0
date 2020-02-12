Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABFB15A0FE
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Feb 2020 06:59:27 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j1l3T-0000Eh-Cl; Wed, 12 Feb 2020 05:59:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1j1l3O-000099-38
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 12 Feb 2020 05:59:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=236SDhOJYb2PSRTIVk3LUYCyXE+FjZMj2ht2QGpn988=; b=AgPpQ+OfgfF3lu6XidjNpU/a2Y
 nfo4K4psvYjj7/uiUb3QhcXgEEH6cdxH9KbV/BU/XvojUC44RzOs4V6+8x6PrYgOgUS+XH5S6xaWk
 127GW2mEKXTgGbDGlOap7Stc5/9PCboR0eHgnRq3wi9RpuXj6By+g18DqWj+PVwTpCP8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=236SDhOJYb2PSRTIVk3LUYCyXE+FjZMj2ht2QGpn988=; b=GBymuyHx1MnP3XLqm0tYe2vYma
 o7k4QdY767POHo5ejY6tLF7VNA83KflfMh/7Yj+YzpCb28QILqz9eLYpUHts6rCBwH6K1C/4Vd805
 XBrXWQQumJ20nK1BYSjlpvSGEkpseFoLxMBpWAtrEANs8l/QrDhwQSjIdVtrIK0z1yrk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j1l3N-0019wH-0G
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 12 Feb 2020 05:59:18 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DEDE12073C;
 Wed, 12 Feb 2020 05:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581487151;
 bh=xQFnOudKqb/kbsLlYNKBDsIDCJCWea6054v8vCNp2FQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EsE7XRDFHHOJfmDnCHM815qhGLMokCKAMN0ADFh7v0kZYkXrKVyCmg3ov9QmVtxw8
 yU3nMgZ5d6TS7d8e5dmazqBXjtQqTTJgUxJkjAKkGUCuNYVAgrkKkuG4uNoWXxC9u9
 l1eeoPbZjmyRuFtYZGF48Bp8fihJgKHWSZUymX7w=
Date: Tue, 11 Feb 2020 21:59:09 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Daniel Rosenberg <drosen@google.com>
Message-ID: <20200212055909.GI870@sol.localdomain>
References: <20200208013552.241832-1-drosen@google.com>
 <20200208013552.241832-8-drosen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200208013552.241832-8-drosen@google.com>
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
X-Headers-End: 1j1l3N-0019wH-0G
Subject: Re: [f2fs-dev] [PATCH v7 7/8] ext4: Hande casefolding with
 encryption
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

On Fri, Feb 07, 2020 at 05:35:51PM -0800, Daniel Rosenberg wrote:
> This adds support for encryption with casefolding.
> 
> Since the name on disk is case preserving, and also encrypted, we can no
> longer just recompute the hash on the fly. Additionally, to avoid
> leaking extra information from the hash of the unencrypted name, we use
> siphash via an fscrypt v2 policy.
> 
> The hash is stored at the end of the directory entry for all entries
> inside of an encrypted and casefolded directory apart from those that
> deal with '.' and '..'. This way, the change is backwards compatible
> with existing ext4 filesystems.
> 
> Signed-off-by: Daniel Rosenberg <drosen@google.com>
> ---
>  Documentation/filesystems/ext4/directory.rst |  27 ++
>  fs/ext4/dir.c                                |  27 +-
>  fs/ext4/ext4.h                               |  64 +++-
>  fs/ext4/hash.c                               |  24 +-
>  fs/ext4/ialloc.c                             |   5 +-
>  fs/ext4/inline.c                             |  41 +--
>  fs/ext4/namei.c                              | 291 +++++++++++++------
>  fs/ext4/super.c                              |   6 -
>  8 files changed, 343 insertions(+), 142 deletions(-)

How was this tested?  I tried it (using a patched version of 'mke2fs' that
allows the encrypt and encoding options to be combined), and I immediately got
an ext4 error about a bad directory entry:

~/e2fsprogs/misc/mke2fs -F -t ext4 -O encrypt -E encoding=utf8 /dev/vdb
mount /dev/vdb /mnt
fscrypt setup /mnt
mkdir /mnt/dir
# (assumes /etc/fscrypt.conf contains policy_version 2)
echo hunter2 | fscrypt encrypt /mnt/dir --quiet --source=custom_passphrase --name=dir
chattr +F /mnt/dir
echo contents > /mnt/dir/file
umount /mnt
mount /dev/vdb /mnt
ls /mnt/dir/
[  391.292067] EXT4-fs error (device vdb): htree_dirblock_to_tree:1038: inode #8193: block 4251: comm ls: bad entry in directory: directory entry too close to block end - offset=80, inode=18, rec_len=4004, lblk=0, size=4096


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
