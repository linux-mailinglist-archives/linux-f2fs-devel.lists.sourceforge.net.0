Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E552A3AE5
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 30 Aug 2019 17:48:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i3j8l-0005OJ-Uk; Fri, 30 Aug 2019 15:48:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <deepa.kernel@gmail.com>)
 id 1i3j8k-0005Ns-Ii; Fri, 30 Aug 2019 15:48:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4oHQ/J6gD7m5a2hZJIzg30k30/iTJHkHY5qB+o+D4cE=; b=BwME/or6nUTsEk2ITBqYR/HXEs
 h8jWm6bsJ24/FTVIITXAfz4GJdgBAyWWSZ7iGBdnO7CcmTU4a4Yi5dKi3Z5LyLEFLIXiCBDctzMoZ
 uFRmCf14h1JR4VFV2zhfqa9MjcyNFMAryKPisuCOFlIEAwC1nI9sa1G8FPxudgq1MXiQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4oHQ/J6gD7m5a2hZJIzg30k30/iTJHkHY5qB+o+D4cE=; b=WrpgqEkk+9xuiwbfbLhcwCJTcn
 HxavzeLW3CsblLh3AmyK63GyC//o6fobnPyDFD9nquBlmWhbwWkqT83td190Ytqp5NfHbCNw2y3qi
 iTWfOorROUoSHPdE1isajf+pVB0J7jV8hjRFE84JYINZt2kzOaFDX4z8UhumK5FQJkjM=;
Received: from mail-pg1-f196.google.com ([209.85.215.196])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1i3j8i-009RYf-Gw; Fri, 30 Aug 2019 15:48:42 +0000
Received: by mail-pg1-f196.google.com with SMTP id p3so3731506pgb.9;
 Fri, 30 Aug 2019 08:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=4oHQ/J6gD7m5a2hZJIzg30k30/iTJHkHY5qB+o+D4cE=;
 b=h7oWCY6wHIupyilklhVw3zKKmS4N6rNYStKFd6M4mXY2zoBod9UZ8VCkDGXpvOwPEx
 y0aASnlb2KjG+wF+/aUT2biKn+NEObcgE8m7DGPrZYueZa0oebuiKl0kXOBZW/YvAFgG
 wiNfxFX1BU+QMvruLmfNr9RwuUgTVgZhni7EzWpQBGg9w69s5GjxRS3CR8rDUkEmFDvX
 StbzvePxJ6JAeogsEcWDy1lOLEazKGBM7XSWMidYvC4oTqL+OIaD7n27qxye/p6T0bld
 MAh4tx6oguKUb4RPv6qhdVfxJi3jyYGLfFoX32P7ntEtN8+5CPxBMCDh7sUKz71y0419
 8ZHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=4oHQ/J6gD7m5a2hZJIzg30k30/iTJHkHY5qB+o+D4cE=;
 b=mQvxqpSII/508600wdYUaO0UI2GYUDuccxMPqhLd6V+pdTi+gZGfLU626a4mq1fM23
 4ewWj+Dmy451XAd++pFtqKUY+rdgzn6Z9mneuyftwcI64w7WIh070sM+cVap0JZXCIdN
 kh0yCqLW4uvNikylr+Zlooz/6dTUc/D10NMWO3TnuakRooo/1n8OzC2UkHBMdjcfp7cR
 VisjTBq0R0xxhjg1QeeXNv7sLGyd2tfvfi/tfwcUDE1LsgwBGMUcbNI0to0sxScehArk
 sEG3+NHazLHQeRx1V1fN+hKPUh019OqsKGk0XTx8dWynmUeW/LUa1L4Tc984lBmoNG2C
 qd6w==
X-Gm-Message-State: APjAAAV4wW1n/6l0+FrdlwKUeUXHsBbebl8XswGR9ur2QpnYhejq+FfG
 d9mLPAE/IR0yGmw8WGawano=
X-Google-Smtp-Source: APXvYqw+TTjvl6C13mK+Kx+U+c7BoLzOucbYEU3GqDfQjm5bxaW7IFfh1q/TNPR40tNdaKG3mocNEw==
X-Received: by 2002:a17:90a:c386:: with SMTP id
 h6mr16090687pjt.122.1567180114546; 
 Fri, 30 Aug 2019 08:48:34 -0700 (PDT)
Received: from deepa-ubuntu.lan (c-98-234-52-230.hsd1.ca.comcast.net.
 [98.234.52.230])
 by smtp.gmail.com with ESMTPSA id z28sm8093085pfj.74.2019.08.30.08.48.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2019 08:48:33 -0700 (PDT)
From: Deepa Dinamani <deepa.kernel@gmail.com>
To: arnd@arndb.de,
	viro@zeniv.linux.org.uk
Date: Fri, 30 Aug 2019 08:47:44 -0700
Message-Id: <20190830154744.4868-1-deepa.kernel@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CAK8P3a1XjOMpuS12Xao1xqOLFOuz1Jb8dTAfrhLcE643sSkC5g@mail.gmail.com>
References: <CAK8P3a1XjOMpuS12Xao1xqOLFOuz1Jb8dTAfrhLcE643sSkC5g@mail.gmail.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (deepa.kernel[at]gmail.com)
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.196 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.196 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1i3j8i-009RYf-Gw
Subject: [f2fs-dev] [GIT PULL RESEND] vfs: Add support for timestamp limits
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
Cc: lucho@ionkov.net, martin@omnibond.com, jfs-discussion@lists.sourceforge.net,
 shaggy@kernel.org, al@alarsen.net, me@bobcopeland.com, adrian.hunter@intel.com,
 linux-mtd@lists.infradead.org, deepa.kernel@gmail.com,
 mikulas@artax.karlin.mff.cuni.cz, hch@lst.de, nico@fluxnic.net,
 hubcap@omnibond.com, linux-cifs@vger.kernel.org, zyan@redhat.com,
 sage@redhat.com, darrick.wong@oracle.com, y2038@lists.linaro.org,
 richard@nod.at, sfrench@samba.org, anton@enomsg.org, linux@armlinux.org.uk,
 codalist@coda.cs.cmu.edu, hch@infradead.org, coda@cs.cmu.edu,
 v9fs-developer@lists.sourceforge.net, idryomov@gmail.com,
 linux-ext4@vger.kernel.org, salah.triki@gmail.com, asmadeus@codewreck.org,
 devel@lists.orangefs.org, dushistov@mail.ru, keescook@chromium.org,
 ericvh@gmail.com, jack@suse.com, reiserfs-devel@vger.kernel.org, tj@kernel.org,
 jlbec@evilplan.org, aivazian.tigran@gmail.com, dsterba@suse.com,
 jaegeuk@kernel.org, ceph-devel@vger.kernel.org,
 trond.myklebust@hammerspace.com, hirofumi@mail.parknet.co.jp,
 adilger@dilger.ca, jaharkes@cs.cmu.edu, linux-nfs@vger.kernel.org,
 tony.luck@intel.com, tytso@mit.edu, luisbg@kernel.org, dedekind1@gmail.com,
 linux-ntfs-dev@lists.sourceforge.net, gregkh@linuxfoundation.org,
 linux-karma-devel@lists.sourceforge.net, jlayton@kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, ccross@android.com, linux-fsdevel@vger.kernel.org,
 phillip@squashfs.org.uk, dwmw2@infradead.org, anna.schumaker@netapp.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

[resending, rebased onto linux v5.3-rc6, and dropped orangefs patch from the series]

Hi Al, Arnd,

This is a pull request for filling in min and max timestamps for filesystems.
I've added all the acks, and dropped the adfs patch. That will be merged through
Russell's tree.

Dropped orangefs until the maintainers decide what its limits should be.

The following changes since commit a55aa89aab90fae7c815b0551b07be37db359d76:

  Linux 5.3-rc6 (2019-08-25 12:01:23 -0700)

are available in the Git repository at:

  https://github.com/deepa-hub/vfs limits

for you to fetch changes up to 5ad32b3acded06183f40806f76b030c3143017bb:

  isofs: Initialize filesystem timestamp ranges (2019-08-30 08:11:25 -0700)

----------------------------------------------------------------

- Deepa

Deepa Dinamani (18):
      vfs: Add file timestamp range support
      vfs: Add timestamp_truncate() api
      timestamp_truncate: Replace users of timespec64_trunc
      mount: Add mount warning for impending timestamp expiry
      utimes: Clamp the timestamps before update
      fs: Fill in max and min timestamps in superblock
      9p: Fill min and max timestamps in sb
      ext4: Initialize timestamps limits
      fs: nfs: Initialize filesystem timestamp ranges
      fs: cifs: Initialize filesystem timestamp ranges
      fs: fat: Initialize filesystem timestamp ranges
      fs: affs: Initialize filesystem timestamp ranges
      fs: sysv: Initialize filesystem timestamp ranges
      fs: ceph: Initialize filesystem timestamp ranges
      fs: hpfs: Initialize filesystem timestamp ranges
      fs: omfs: Initialize filesystem timestamp ranges
      pstore: fs superblock limits
      isofs: Initialize filesystem timestamp ranges

 fs/9p/vfs_super.c        |  6 +++++-
 fs/affs/amigaffs.c       |  2 +-
 fs/affs/amigaffs.h       |  3 +++
 fs/affs/inode.c          |  4 ++--
 fs/affs/super.c          |  4 ++++
 fs/attr.c                | 21 ++++++++++++---------
 fs/befs/linuxvfs.c       |  2 ++
 fs/bfs/inode.c           |  2 ++
 fs/ceph/super.c          |  2 ++
 fs/cifs/cifsfs.c         | 22 ++++++++++++++++++++++
 fs/cifs/netmisc.c        | 14 +++++++-------
 fs/coda/inode.c          |  3 +++
 fs/configfs/inode.c      | 12 ++++++------
 fs/cramfs/inode.c        |  2 ++
 fs/efs/super.c           |  2 ++
 fs/ext2/super.c          |  2 ++
 fs/ext4/ext4.h           | 10 +++++++++-
 fs/ext4/super.c          | 17 +++++++++++++++--
 fs/f2fs/file.c           | 21 ++++++++++++---------
 fs/fat/inode.c           | 12 ++++++++++++
 fs/freevxfs/vxfs_super.c |  2 ++
 fs/hpfs/hpfs_fn.h        |  6 ++----
 fs/hpfs/super.c          |  2 ++
 fs/inode.c               | 33 ++++++++++++++++++++++++++++++++-
 fs/isofs/inode.c         |  7 +++++++
 fs/jffs2/fs.c            |  3 +++
 fs/jfs/super.c           |  2 ++
 fs/kernfs/inode.c        |  7 +++----
 fs/minix/inode.c         |  2 ++
 fs/namespace.c           | 33 ++++++++++++++++++++++++++++++++-
 fs/nfs/super.c           | 20 +++++++++++++++++++-
 fs/ntfs/inode.c          | 21 ++++++++++++---------
 fs/omfs/inode.c          |  4 ++++
 fs/pstore/ram.c          |  2 ++
 fs/qnx4/inode.c          |  2 ++
 fs/qnx6/inode.c          |  2 ++
 fs/reiserfs/super.c      |  3 +++
 fs/romfs/super.c         |  2 ++
 fs/squashfs/super.c      |  2 ++
 fs/super.c               |  2 ++
 fs/sysv/super.c          |  5 ++++-
 fs/ubifs/file.c          | 21 ++++++++++++---------
 fs/ufs/super.c           |  7 +++++++
 fs/utimes.c              |  6 ++----
 fs/xfs/xfs_super.c       |  2 ++
 include/linux/fs.h       |  5 +++++
 include/linux/time64.h   |  2 ++
 47 files changed, 296 insertions(+), 72 deletions(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
