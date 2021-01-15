Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 459CC2F8414
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 Jan 2021 19:21:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l0Tib-00051x-FY; Fri, 15 Jan 2021 18:21:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1l0TiY-0004vy-LB
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 15 Jan 2021 18:21:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HpfEbhiJqQaa5V9MGL8bKK8lJunaM7qGUqzg+0d9QQg=; b=OBmhX2XTy6DjJyiKpz1z0H/Gs/
 D0CdGKdiD3VfsG14X2dXRu7ZpbSWkAou4j7AOs2fjZPM/8QSSFQpMB3fo091Z/eNvTEXzrN0+vrSC
 8F+aN28+oEpKVehMUZoUfI0NXE2QncYOG03DVvrs/2IcXH+VBYl1nzw+tYeFjQBZTgXE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=HpfEbhiJqQaa5V9MGL8bKK8lJunaM7qGUqzg+0d9QQg=; b=B
 WywGCPMW/GdiqaKS7so9CwEqjvN2aWo1rP6tgTLz7u8hwGD+OPB+R1HKJCA5FthBFrVcKqlahbOIw
 mBBry0Cmm7rK5LPAElJG0QTYjr3gqFD2a2rdLWXeaiKvWrdFNGo5bMQpc1LZLytBvhUU3savkkydb
 IDYVO9tP2YrLI67M=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1l0ThJ-00GNJw-5W
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 15 Jan 2021 18:19:57 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3550423A58;
 Fri, 15 Jan 2021 18:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610734772;
 bh=7HZGCsiZfKx7k8RTP6gegLOEC7SUZGN0WL2KEa1MIqw=;
 h=From:To:Cc:Subject:Date:From;
 b=OLgSi9dXP1/YkA9HyFOY/X6hDj3RaQ6Ohe7A5+afoRqJVi76p4BsVaWFg67i7xPN+
 6tZ+JGUzOYkAc4C6Sqpk7z0yCXnts0hnTQUE9wijYEKFxyXOS+SYpEz0qXShSdLEMS
 IeVxDBKO7PWFFEmTKsOKfgQW8p3OWYonyQJLlena81DsNsqLA9MvUbaXw3qdaBVUFQ
 RlvnXyxdljEpWdHSNlQ0ZgoJ6VenS6b64yLhH9TfUezjo6pSp27OciWtK9MAPSrZ7P
 yat9Uam8Fm2+YLYUl4HU+10eRYuebg0aC9S/umMOtp6WfZpH/R0zghGYgHcWvoPGz3
 P26n77xWu0DGw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Fri, 15 Jan 2021 10:18:13 -0800
Message-Id: <20210115181819.34732-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: lwn.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1l0ThJ-00GNJw-5W
Subject: [f2fs-dev] [PATCH 0/6] fs-verity: add an ioctl to read verity
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

[This patchset applies to v5.11-rc3]

Add an ioctl FS_IOC_READ_VERITY_METADATA which allows reading verity
metadata from a file that has fs-verity enabled, including:

- The Merkle tree
- The fsverity_descriptor (not including the signature if present)
- The built-in signature, if present

This ioctl has similar semantics to pread().  It is passed the type of
metadata to read (one of the above three), and a buffer, offset, and
size.  It returns the number of bytes read or an error.

This ioctl doesn't make any assumption about where the metadata is
stored on-disk.  It does assume the metadata is in a stable format, but
that's basically already the case:

- The Merkle tree and fsverity_descriptor are defined by how fs-verity
  file digests are computed; see the "File digest computation" section
  of Documentation/filesystems/fsverity.rst.  Technically, the way in
  which the levels of the tree are ordered relative to each other wasn't
  previously specified, but it's logical to put the root level first.

- The built-in signature is the value passed to FS_IOC_ENABLE_VERITY.

This ioctl is useful because it allows writing a server program that
takes a verity file and serves it to a client program, such that the
client can do its own fs-verity compatible verification of the file.
This only makes sense if the client doesn't trust the server and if the
server needs to provide the storage for the client.

More concretely, there is interest in using this ability in Android to
export APK files (which are protected by fs-verity) to "protected VMs".
This would use Protected KVM (https://lwn.net/Articles/836693), which
provides an isolated execution environment without having to trust the
traditional "host".  A "guest" VM can boot from a signed image and
perform specific tasks in a minimum trusted environment using files that
have fs-verity enabled on the host, without trusting the host or
requiring that the guest has its own trusted storage.

Technically, it would be possible to duplicate the metadata and store it
in separate files for serving.  However, that would be less efficient
and would require extra care in userspace to maintain file consistency.

In addition to the above, the ability to read the built-in signatures is
useful because it allows a system that is using the in-kernel signature
verification to migrate to userspace signature verification.

This patchset has been tested by new xfstests which call this new ioctl
via a new subcommand for the 'fsverity' program from fsverity-utils.

Eric Biggers (6):
  fs-verity: factor out fsverity_get_descriptor()
  fs-verity: don't pass whole descriptor to fsverity_verify_signature()
  fs-verity: add FS_IOC_READ_VERITY_METADATA ioctl
  fs-verity: support reading Merkle tree with ioctl
  fs-verity: support reading descriptor with ioctl
  fs-verity: support reading signature with ioctl

 Documentation/filesystems/fsverity.rst |  76 ++++++++++
 fs/ext4/ioctl.c                        |   7 +
 fs/f2fs/file.c                         |  11 ++
 fs/verity/Makefile                     |   1 +
 fs/verity/fsverity_private.h           |  13 +-
 fs/verity/open.c                       | 133 +++++++++++------
 fs/verity/read_metadata.c              | 195 +++++++++++++++++++++++++
 fs/verity/signature.c                  |  20 +--
 include/linux/fsverity.h               |  12 ++
 include/uapi/linux/fsverity.h          |  14 ++
 10 files changed, 417 insertions(+), 65 deletions(-)
 create mode 100644 fs/verity/read_metadata.c


base-commit: 7c53f6b671f4aba70ff15e1b05148b10d58c2837
-- 
2.30.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
