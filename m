Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB6530AE22
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  1 Feb 2021 18:41:32 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l6dCW-0003FP-RX; Mon, 01 Feb 2021 17:41:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1l6dCV-0003FB-L5
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Feb 2021 17:41:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5Hn3DtnS/so6ZJ9/OT4QfdxsQfvLHfUIYDKu1MrsVvM=; b=dK9ze9iC3IWaysPyKfvY6q1+pT
 yY+NoFzyTyJD09EpkpymvZk7Bv8HnrvOv2mh4+VjnPZRm+PkHnYAxIE6ZffHlw8FPMKS++eXMH0Us
 aq8uvp1cmglWePbxA7WV+c/l1syiVWwqYC1MnwH3hxzgVoqYLBfQKpPsZHnVPkiUoBYo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5Hn3DtnS/so6ZJ9/OT4QfdxsQfvLHfUIYDKu1MrsVvM=; b=nS6LMinZ2unWFPdLt8GLcFwy8A
 e4mxsPo799A6geGToog8RufUVjoEPqowPFX6O8bZZvqm2M92tRzGY2IH2xCus7J0xCKrGhF2zAwwf
 stL5qM2rQAD63OoY0dj5HMhXBK3tJVR+HjJRaZFDZy8WN9uODyD5VHYKl2YsUYDE1Nl8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1l6dCO-0000G9-2i
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Feb 2021 17:41:23 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 73B0A64E8F;
 Mon,  1 Feb 2021 17:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612201270;
 bh=ncqmDsFhj7U/pfLjxTxIC0UUwvGuJWuBwAK+JB++wOQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=H9Bsi5wgOZQMFGgRJhKLUHxOb0pcAzQ7s9jnZXuL345ZMS8cniSig7Lauh3LCV0cF
 O2I3HtgIEhWb56LrTRFfRodPDh2lMCLHih8Z5QO16zD3Z37ypa3SOR3oS/gfNRTmPr
 zo0e6UupdR28dgJmse+3H9lUsn7EdsmCzp7OGujNQkBr+m+FBCoao5czgRfIeH09yZ
 ZK92JoAyAoGgWcVPHR2wXrVPK65JYJ/Kt08gEoN3zROuSQJsY96GJ8kxnJXYoPq6gS
 Hi70v2fF3PkL63hXeWs0/8KRlUhJ5QkcJKbTS6GMBAK7e2W6dPuXHKhOIbuB5rKePd
 Wpidxc/Uip2IQ==
Date: Mon, 1 Feb 2021 09:41:08 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Message-ID: <YBg9ND4pXqmFDE0s@sol.localdomain>
References: <20210115181819.34732-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210115181819.34732-1-ebiggers@kernel.org>
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
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1l6dCO-0000G9-2i
Subject: Re: [f2fs-dev] [PATCH 0/6] fs-verity: add an ioctl to read verity
 metadata
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
Cc: Theodore Ts'o <tytso@mit.edu>, linux-api@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Victor Hsieh <victorhsieh@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jan 15, 2021 at 10:18:13AM -0800, Eric Biggers wrote:
> [This patchset applies to v5.11-rc3]
> 
> Add an ioctl FS_IOC_READ_VERITY_METADATA which allows reading verity
> metadata from a file that has fs-verity enabled, including:
> 
> - The Merkle tree
> - The fsverity_descriptor (not including the signature if present)
> - The built-in signature, if present
> 
> This ioctl has similar semantics to pread().  It is passed the type of
> metadata to read (one of the above three), and a buffer, offset, and
> size.  It returns the number of bytes read or an error.
> 
> This ioctl doesn't make any assumption about where the metadata is
> stored on-disk.  It does assume the metadata is in a stable format, but
> that's basically already the case:
> 
> - The Merkle tree and fsverity_descriptor are defined by how fs-verity
>   file digests are computed; see the "File digest computation" section
>   of Documentation/filesystems/fsverity.rst.  Technically, the way in
>   which the levels of the tree are ordered relative to each other wasn't
>   previously specified, but it's logical to put the root level first.
> 
> - The built-in signature is the value passed to FS_IOC_ENABLE_VERITY.
> 
> This ioctl is useful because it allows writing a server program that
> takes a verity file and serves it to a client program, such that the
> client can do its own fs-verity compatible verification of the file.
> This only makes sense if the client doesn't trust the server and if the
> server needs to provide the storage for the client.
> 
> More concretely, there is interest in using this ability in Android to
> export APK files (which are protected by fs-verity) to "protected VMs".
> This would use Protected KVM (https://lwn.net/Articles/836693), which
> provides an isolated execution environment without having to trust the
> traditional "host".  A "guest" VM can boot from a signed image and
> perform specific tasks in a minimum trusted environment using files that
> have fs-verity enabled on the host, without trusting the host or
> requiring that the guest has its own trusted storage.
> 
> Technically, it would be possible to duplicate the metadata and store it
> in separate files for serving.  However, that would be less efficient
> and would require extra care in userspace to maintain file consistency.
> 
> In addition to the above, the ability to read the built-in signatures is
> useful because it allows a system that is using the in-kernel signature
> verification to migrate to userspace signature verification.
> 
> This patchset has been tested by new xfstests which call this new ioctl
> via a new subcommand for the 'fsverity' program from fsverity-utils.
> 
> Eric Biggers (6):
>   fs-verity: factor out fsverity_get_descriptor()
>   fs-verity: don't pass whole descriptor to fsverity_verify_signature()
>   fs-verity: add FS_IOC_READ_VERITY_METADATA ioctl
>   fs-verity: support reading Merkle tree with ioctl
>   fs-verity: support reading descriptor with ioctl
>   fs-verity: support reading signature with ioctl
> 
>  Documentation/filesystems/fsverity.rst |  76 ++++++++++
>  fs/ext4/ioctl.c                        |   7 +
>  fs/f2fs/file.c                         |  11 ++
>  fs/verity/Makefile                     |   1 +
>  fs/verity/fsverity_private.h           |  13 +-
>  fs/verity/open.c                       | 133 +++++++++++------
>  fs/verity/read_metadata.c              | 195 +++++++++++++++++++++++++
>  fs/verity/signature.c                  |  20 +--
>  include/linux/fsverity.h               |  12 ++
>  include/uapi/linux/fsverity.h          |  14 ++
>  10 files changed, 417 insertions(+), 65 deletions(-)
>  create mode 100644 fs/verity/read_metadata.c

All applied to fscrypt.git#fsverity for 5.12.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
