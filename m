Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 31910A1082
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 29 Aug 2019 06:38:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i3CCX-00065n-Kg; Thu, 29 Aug 2019 04:38:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <deepa.kernel@gmail.com>)
 id 1i3CCW-00065U-VI; Thu, 29 Aug 2019 04:38:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ph2TDX0t8VD1IALiSLotxXSH3Hc7LzlyzCWrbeW7KEM=; b=iCpuZvCWWgeWsKUQTQxROFwiFG
 qyCshIwcVooSx7YoqDiEHxjN+dqpQu5OUZ7TbSbPqI+fLFA5tITh4LHyQxtOD/1+wc45deW4LjDco
 zcZaZCNq4Kj5xyD6EkVMa211/Dj/RNR+BC36vyGgTDCFmDQX0IhpGjaLGLb1Vc2ua638=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ph2TDX0t8VD1IALiSLotxXSH3Hc7LzlyzCWrbeW7KEM=; b=Q7KNMbrwulgf77lG8ArKpaeYNw
 bls7F3qTVsK9d0DVdG+CVSuDxD++X2D6rnQOqDgKJxn2HV/BtOykJyiZ7DSeRRg7TTEGgRvfMUJii
 andvr6M29TTVCSNktulK286kIAW7LZzn7moaZ5bSgRuLrtQ4iWJ6BH8AAhJYmYuGABhQ=;
Received: from mail-io1-f65.google.com ([209.85.166.65])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1i3CCT-001oI6-GW; Thu, 29 Aug 2019 04:38:24 +0000
Received: by mail-io1-f65.google.com with SMTP id u185so417222iod.10;
 Wed, 28 Aug 2019 21:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ph2TDX0t8VD1IALiSLotxXSH3Hc7LzlyzCWrbeW7KEM=;
 b=Ad4yH+QK5ygrblSOoyxD0tbvjV1ue9nzyr8wf1rjkD8nTQtAUxNZJKQHZoLxHgRk2B
 TEAoeI524dxNfHCqzBGvK8fuiw+bAamqjZzPjGzpO4q1JaVUUDD9ax94jSI09AwQIEcQ
 WVE9Kk/mYHro0Fu7Hu8WrE90Mi3tlpvW3ZwrAo0k7GoHIwwQC60Y8Y9lhWHQ2x0r9tnz
 jSaqwnIO0Z4sBYO3fglWtXsmzhw2k5YPG8bbqxvl5SmNtQPBiiKKdIu9pdlVPfuYLf7e
 1REmXyzixgNc7NV2Y7fqiRSpx+wDxIJjwki+5Yj33Yn9bHcHOqns04S9V/iNntVln4qf
 JFkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ph2TDX0t8VD1IALiSLotxXSH3Hc7LzlyzCWrbeW7KEM=;
 b=FpbaScNh8g1QeFoJRuO4qZlvH5GiHJKNM5JZ0IfMtjIXGhYkxkI06ImTYaccmsRtBg
 GUK4GHRkiLHX3RpRUMu2TXSoQNRToK4ke7FzEX0AMwMusu97ml3mWF3VgOUnH1Rzy6ls
 mYSuWlCG8x4Zn7kNmgf+2aIQZjwi5czXKv7/4uY0pY//8EvW8ONrELgzNQGOnzL2/SbL
 vcJb+bgnQ+B8vjAEOgplXFzJFVxd/VyRODz0iHZ7SwpHLDNIFkwaJF3W4gubCceNbT73
 xBVLbj0rNsaA8S6nZQib974CYA9A/BunnXcY/jaVO/UTzNUNz2WBVwl+Hm29+sPbRI21
 g7XQ==
X-Gm-Message-State: APjAAAU42PJB9OimBI5K+L25e/dYmRFB7RZi8aqRsSV4lMeLjjIgnaJk
 WbeZcLf6hcJhaY5csI2SJA/r5XgHcCI3pwfFtFM=
X-Google-Smtp-Source: APXvYqxGcrhx04qhhiztO9h7tEg9eaTJ/omReFf3uThdfVv9L98okzDLYj6+TF/LNCwbU0Ps8hWzB+I1empnbI4Uys0=
X-Received: by 2002:a02:23cc:: with SMTP id u195mr8401832jau.136.1567053495481; 
 Wed, 28 Aug 2019 21:38:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190829041132.26677-1-deepa.kernel@gmail.com>
In-Reply-To: <20190829041132.26677-1-deepa.kernel@gmail.com>
From: Deepa Dinamani <deepa.kernel@gmail.com>
Date: Wed, 28 Aug 2019 21:38:03 -0700
Message-ID: <CABeXuvoKD83B7iUqE33Y9E2OVtf61DKv-swZr-N=ozz-cMmGOA@mail.gmail.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.65 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (deepa.kernel[at]gmail.com)
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1i3CCT-001oI6-GW
Subject: Re: [f2fs-dev] [GIT PULL] vfs: Add support for timestamp limits
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
Cc: Latchesar Ionkov <lucho@ionkov.net>, martin@omnibond.com,
 jfs-discussion@lists.sourceforge.net, Dave Kleikamp <shaggy@kernel.org>,
 al@alarsen.net, Bob Copeland <me@bobcopeland.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>, mikulas@artax.karlin.mff.cuni.cz,
 stoph Hellwig <hch@lst.de>, nico@fluxnic.net,
 Mike Marshall <hubcap@omnibond.com>, linux-cifs@vger.kernel.org, "Yan,
 Zheng" <zyan@redhat.com>, Sage Weil <sage@redhat.com>,
 "Darrick J. Wong" <darrick.wong@oracle.com>,
 y2038 Mailman List <y2038@lists.linaro.org>,
 Richard Weinberger <richard@nod.at>, Steve French <sfrench@samba.org>,
 Anton Vorontsov <anton@enomsg.org>, linux@armlinux.org.uk,
 codalist@coda.cs.cmu.edu, Christoph Hellwig <hch@infradead.org>,
 coda@cs.cmu.edu, V9FS Developers <v9fs-developer@lists.sourceforge.net>,
 Ilya Dryomov <idryomov@gmail.com>,
 Ext4 Developers List <linux-ext4@vger.kernel.org>, salah.triki@gmail.com,
 asmadeus@codewreck.org, devel@lists.orangefs.org,
 Evgeniy Dushistov <dushistov@mail.ru>, Kees Cook <keescook@chromium.org>,
 Eric Van Hensbergen <ericvh@gmail.com>, Jan Kara <jack@suse.com>,
 reiserfs-devel@vger.kernel.org, Tejun Heo <tj@kernel.org>,
 Joel Becker <jlbec@evilplan.org>, aivazian.tigran@gmail.com,
 phillip@squashfs.org.uk, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel <ceph-devel@vger.kernel.org>,
 trond.myklebust@hammerspace.com, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Andreas Dilger <adilger@dilger.ca>, Jan Harkes <jaharkes@cs.cmu.edu>,
 Linux NFS Mailing List <linux-nfs@vger.kernel.org>,
 Tony Luck <tony.luck@intel.com>, Theodore Ts'o <tytso@mit.edu>,
 luisbg@kernel.org, Artem Bityutskiy <dedekind1@gmail.com>,
 linux-ntfs-dev@lists.sourceforge.net, Greg KH <gregkh@linuxfoundation.org>,
 linux-karma-devel@lists.sourceforge.net, jlayton@kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Linux F2FS DEV,
 Mailing List" <linux-f2fs-devel@lists.sourceforge.net>,
 linux-xfs@vger.kernel.org, Colin Cross <ccross@android.com>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Anna Schumaker <anna.schumaker@netapp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Adding the others who were on original cc, just in case.
- Deepa

On Wed, Aug 28, 2019 at 9:12 PM Deepa Dinamani <deepa.kernel@gmail.com> wrote:
>
> Hi Al, Arnd,
>
> This is a pull request for filling in min and max timestamps for filesystems.
> I've added all the acks, and dropped the adfs patch. That will be merged through
> Russell's tree.
>
> Thanks,
> Deepa
>
> The following changes since commit 5d18cb62218608a1388858880ad3ec76d6cb0d3b:
>
>   Add linux-next specific files for 20190828 (2019-08-28 19:59:14 +1000)
>
> are available in the Git repository at:
>
>   https://github.com/deepa-hub/vfs limits
>
> for you to fetch changes up to f0f216afa4c7e4dee9121fde52ccf57f76119188:
>
>   isofs: Initialize filesystem timestamp ranges (2019-08-28 19:19:36 -0700)
>
> ----------------------------------------------------------------
> Deepa Dinamani (19):
>       vfs: Add file timestamp range support
>       vfs: Add timestamp_truncate() api
>       timestamp_truncate: Replace users of timespec64_trunc
>       mount: Add mount warning for impending timestamp expiry
>       utimes: Clamp the timestamps before update
>       fs: Fill in max and min timestamps in superblock
>       9p: Fill min and max timestamps in sb
>       ext4: Initialize timestamps limits
>       fs: nfs: Initialize filesystem timestamp ranges
>       fs: cifs: Initialize filesystem timestamp ranges
>       fs: fat: Initialize filesystem timestamp ranges
>       fs: affs: Initialize filesystem timestamp ranges
>       fs: sysv: Initialize filesystem timestamp ranges
>       fs: ceph: Initialize filesystem timestamp ranges
>       fs: orangefs: Initialize filesystem timestamp ranges
>       fs: hpfs: Initialize filesystem timestamp ranges
>       fs: omfs: Initialize filesystem timestamp ranges
>       pstore: fs superblock limits
>       isofs: Initialize filesystem timestamp ranges
>
>  fs/9p/vfs_super.c        |  6 +++++-
>  fs/affs/amigaffs.c       |  2 +-
>  fs/affs/amigaffs.h       |  3 +++
>  fs/affs/inode.c          |  4 ++--
>  fs/affs/super.c          |  4 ++++
>  fs/attr.c                | 21 ++++++++++++---------
>  fs/befs/linuxvfs.c       |  2 ++
>  fs/bfs/inode.c           |  2 ++
>  fs/ceph/super.c          |  2 ++
>  fs/cifs/cifsfs.c         | 22 ++++++++++++++++++++++
>  fs/cifs/netmisc.c        | 14 +++++++-------
>  fs/coda/inode.c          |  3 +++
>  fs/configfs/inode.c      | 12 ++++++------
>  fs/cramfs/inode.c        |  2 ++
>  fs/efs/super.c           |  2 ++
>  fs/ext2/super.c          |  2 ++
>  fs/ext4/ext4.h           | 10 +++++++++-
>  fs/ext4/super.c          | 17 +++++++++++++++--
>  fs/f2fs/file.c           | 21 ++++++++++++---------
>  fs/fat/inode.c           | 12 ++++++++++++
>  fs/freevxfs/vxfs_super.c |  2 ++
>  fs/hpfs/hpfs_fn.h        |  6 ++----
>  fs/hpfs/super.c          |  2 ++
>  fs/inode.c               | 33 ++++++++++++++++++++++++++++++++-
>  fs/isofs/inode.c         |  7 +++++++
>  fs/jffs2/fs.c            |  3 +++
>  fs/jfs/super.c           |  2 ++
>  fs/kernfs/inode.c        |  7 +++----
>  fs/minix/inode.c         |  2 ++
>  fs/namespace.c           | 33 ++++++++++++++++++++++++++++++++-
>  fs/nfs/super.c           | 20 +++++++++++++++++++-
>  fs/ntfs/inode.c          | 21 ++++++++++++---------
>  fs/omfs/inode.c          |  4 ++++
>  fs/orangefs/super.c      |  2 ++
>  fs/pstore/ram.c          |  2 ++
>  fs/qnx4/inode.c          |  2 ++
>  fs/qnx6/inode.c          |  2 ++
>  fs/reiserfs/super.c      |  3 +++
>  fs/romfs/super.c         |  2 ++
>  fs/squashfs/super.c      |  2 ++
>  fs/super.c               |  2 ++
>  fs/sysv/super.c          |  5 ++++-
>  fs/ubifs/file.c          | 21 ++++++++++++---------
>  fs/ufs/super.c           |  7 +++++++
>  fs/utimes.c              |  6 ++----
>  fs/xfs/xfs_super.c       |  2 ++
>  include/linux/fs.h       |  5 +++++
>  include/linux/time64.h   |  2 ++
>  48 files changed, 298 insertions(+), 72 deletions(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
