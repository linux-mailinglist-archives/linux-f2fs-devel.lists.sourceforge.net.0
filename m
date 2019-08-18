Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 52233917F5
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 18 Aug 2019 18:59:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hzOWh-00088J-3t; Sun, 18 Aug 2019 16:59:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <deepa.kernel@gmail.com>)
 id 1hzOWd-00087e-Al; Sun, 18 Aug 2019 16:59:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RwcmEOVaCgQn5YcIaNY6CXwWg6zDdmkpmJl5vmh1uGs=; b=ZDVjcyc/yfrpPDbKMLdHmcNqR1
 ea9c6KbXF5f6vinwe7waDkhk59mV3wRC0c9PfuULn8EPP7mCTS/6CJLCWfzodh3Hap+DZ0DEzVJKz
 3dfmDAOZyQ8Xa6AuLIHlkOZeUPBnerL0/PumzoqKPvu+9xbx9DMl66a1j/6C/QBDavGI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RwcmEOVaCgQn5YcIaNY6CXwWg6zDdmkpmJl5vmh1uGs=; b=hO/COfdJSJUUymVw8DHGbUnK/X
 UecPaj26UoQmW5HW7WowBfsm9XPm6VXELu7VY/IWrEYal9+W8wdXzajdx9U3r3GX6Ei5/QZl5AIxW
 7T9ZfmuBJDRHDcukb6N9T5aiEA5aYzFGu3O1gBHBxdxijcMsSuxR/uXuV9+JhDg1Eung=;
Received: from mail-pl1-f196.google.com ([209.85.214.196])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hzOWb-007uMF-Jr; Sun, 18 Aug 2019 16:59:27 +0000
Received: by mail-pl1-f196.google.com with SMTP id m9so4614916pls.8;
 Sun, 18 Aug 2019 09:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=RwcmEOVaCgQn5YcIaNY6CXwWg6zDdmkpmJl5vmh1uGs=;
 b=HiJA0cs9nJZycVEklhF1ydMiEZlqYlRZ+rT3ZYhNjaom6QdwblnzQmdsqBjEZlDKMp
 jvcGaD8ig89nNQdTGe9GeJ5iFMo7AEN6bsYz2SyhceKvOz7NLf8T+g8wmTJdIYNBHCnk
 mqxSQ23qxF8fXRSxUZ0GNEzU976EBiFSVLHIFTB7kHKYVwaxjHouhX9bcoWk26Hy1rg6
 wa6ahr1JhJ39nrboMSrYmJPMJSj2dD+/CMcTQBkhDHlKdSN8HDIVcxto7SezHoUSooyb
 QXns2+TyCciABnoGJd/w5iL3xBZcmKb98RjlIRImw/72ezzY/hsvU9/c+eh37GhZ+4vQ
 xS4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=RwcmEOVaCgQn5YcIaNY6CXwWg6zDdmkpmJl5vmh1uGs=;
 b=OIyGujKTc8dtwIYcFeL8SsEu7+E9WsdQfXmV5+hubccbBu/86eReR770dfwrhjGxMl
 oGt5xyQOEiGUI4XY+K+Oi9v06lbZ5k9bbWXQPkHl4a/o90U3ycqLLxcuDJud9XnrkZOD
 gVQbHjaPGXIFck9f8fsozy2itp+QtbRw+JIMi2E3JeDbmlrHZxKH6sL5/oXdgZE9vSAN
 CFb+HC/evKyaiVbpbnyOyjml082NATHEYLAnKXhVTJEdKqvgTTyUB/jPV0w6v6Xwt8+o
 zf5rOn0In/ujyFBfGs7m548vpLHuoZQmEggfmoYqU/z3qnxUwW1/z3gkhVuRzGWaAWot
 yLyw==
X-Gm-Message-State: APjAAAVqgBEzXYaBzN54CLzwQ0C54eVtdvj7ntwpXPG6A3zC1YuUL2t1
 NMiNRItcEby76gqJvdQkerU=
X-Google-Smtp-Source: APXvYqxiQNguzmCRctY+lvOzTTOdGzSMQGETwprj26Ooqm/lMPEtm/pNLPzDafLGwlxjn+XuprqyZA==
X-Received: by 2002:a17:902:f095:: with SMTP id
 go21mr18588927plb.216.1566147559767; 
 Sun, 18 Aug 2019 09:59:19 -0700 (PDT)
Received: from deepa-ubuntu.lan (c-98-234-52-230.hsd1.ca.comcast.net.
 [98.234.52.230])
 by smtp.gmail.com with ESMTPSA id b136sm15732831pfb.73.2019.08.18.09.59.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Aug 2019 09:59:19 -0700 (PDT)
From: Deepa Dinamani <deepa.kernel@gmail.com>
To: viro@zeniv.linux.org.uk,
	linux-kernel@vger.kernel.org
Date: Sun, 18 Aug 2019 09:57:57 -0700
Message-Id: <20190818165817.32634-1-deepa.kernel@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: samba.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (deepa.kernel[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.196 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.196 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1hzOWb-007uMF-Jr
Subject: [f2fs-dev] [PATCH v8 00/20] vfs: Add support for timestamp limits
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
 shaggy@kernel.org, al@alarsen.net, me@bobcopeland.com,
 adilger.kernel@dilger.ca, mikulas@artax.karlin.mff.cuni.cz, hch@lst.de,
 nico@fluxnic.net, hubcap@omnibond.com, linux-cifs@vger.kernel.org,
 zyan@redhat.com, sage@redhat.com, darrick.wong@oracle.com,
 y2038@lists.linaro.org, richard@nod.at, sfrench@samba.org, anton@enomsg.org,
 codalist@coda.cs.cmu.edu, hch@infradead.org, coda@cs.cmu.edu,
 v9fs-developer@lists.sourceforge.net, idryomov@gmail.com,
 linux-ext4@vger.kernel.org, salah.triki@gmail.com, asmadeus@codewreck.org,
 devel@lists.orangefs.org, dushistov@mail.ru, keescook@chromium.org,
 arnd@arndb.de, ericvh@gmail.com, jack@suse.com, reiserfs-devel@vger.kernel.org,
 tj@kernel.org, jlbec@evilplan.org, aivazian.tigran@gmail.com,
 phillip@squashfs.org.uk, dsterba@suse.com, jaegeuk@kernel.org,
 ceph-devel@vger.kernel.org, trond.myklebust@hammerspace.com,
 hirofumi@mail.parknet.co.jp, jaharkes@cs.cmu.edu, linux-nfs@vger.kernel.org,
 tony.luck@intel.com, tytso@mit.edu, luisbg@kernel.org, dedekind1@gmail.com,
 linux-ntfs-dev@lists.sourceforge.net, gregkh@linuxfoundation.org,
 linux-karma-devel@lists.sourceforge.net, adrian.hunter@intel.com,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 ccross@android.com, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, dwmw2@infradead.org, anna.schumaker@netapp.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The series is an update and a more complete version of the
previously posted series at
https://lore.kernel.org/linux-fsdevel/20180122020426.2988-1-deepa.kernel@gmail.com/

Thanks to Arnd Bergmann for doing a few preliminary reviews.
They helped me fix a few issues I had overlooked.

The limits (sometimes granularity also) for the filesystems updated here are according to the
following table:

File system   Time type                      Start year Expiration year Granularity
cramfs        fixed                          0          0
romfs         fixed                          0          0
pstore        ascii seconds (27 digit ascii) S64_MIN    S64_MAX         1
coda          INT64                          S64_MIN    S64_MAX         1
omfs          64-bit milliseconds            0          U64_MAX/ 1000   NSEC_PER_MSEC
befs          unsigned 48-bit seconds        0          0xffffffffffff  alloc_super
bfs           unsigned 32-bit seconds        0          U32_MAX         alloc_super
efs           unsigned 32-bit seconds        0          U32_MAX         alloc_super
ext2          signed 32-bit seconds          S32_MIN    S32_MAX         alloc_super
ext3          signed 32-bit seconds          S32_MIN    S32_MAX         alloc_super
ext4 (old)    signed 32-bit seconds          S32_MIN    S32_MAX         alloc_super
ext4 (extra)  34-bit seconds, 30-bit ns      S32_MIN    0x37fffffff	1
freevxfs      u32 secs/usecs                 0          U32_MAX         alloc_super
jffs2         unsigned 32-bit seconds        0          U32_MAX         alloc_super
jfs           unsigned 32-bit seconds/ns     0          U32_MAX         1
minix         unsigned 32-bit seconds        0          U32_MAX         alloc_super
orangefs      u64 seconds                    0          U64_MAX         alloc_super
qnx4          unsigned 32-bit seconds        0          U32_MAX         alloc_super
qnx6          unsigned 32-bit seconds        0          U32_MAX         alloc_super
reiserfs      unsigned 32-bit seconds        0          U32_MAX         alloc_super
squashfs      unsigned 32-bit seconds        0          U32_MAX         alloc_super
ufs1          signed 32-bit seconds          S32_MIN    S32_MAX         NSEC_PER_SEC
ufs2          signed 64-bit seconds/u32 ns   S64_MIN    S64_MAX         1
xfs           signed 32-bit seconds/ns       S32_MIN    S32_MAX         1
ceph          unsigned 32-bit second/ns      0          U32_MAX         1000
sysv          unsigned 32-bit seconds        0          U32_MAX         alloc_super
affs          u32 day, min, ticks            1978       u32_max days    NSEC_PER_SEC
nfsv2         unsigned 32-bit seconds/ns     0          U32_MAX         1
nfsv3         unsigned 32-bit seconds/ns     0          U32_MAX         1000
nfsv4         u64 seconds/u32 ns             S64_MIN    S64_MAX         1000
isofs         u8 year since 1900 (fixable)   1900       2155            alloc_super
hpfs          unsigned 32-bit seconds        1970       2106            alloc_super
fat           7-bit years, 2s resolution     1980       2107
cifs (smb)    7-bit years                    1980       2107
cifs (modern) 64-bit 100ns since 1601        1601       30828
adfs          40-bit cs since 1900           1900       2248
9p (9P2000)   unsigned 32-bit seconds        1970       2106
9p (9P2000.L) signed 64-bit seconds, ns      1970       S64_MAX

Granularity column filled in by the alloc_super() in the above table indicates that
the granularity is NSEC_PER_SEC.
Note that anything not mentioned above still has the default limits
S64_MIN..S64_MAX.

The patches in the series are as structured below:
1. Add vfs support to maintain the limits per filesystem.
2. Add a new timestamp_truncate() api for clamping timestamps
   according to the filesystem limits.
3. Add a warning for mount syscall to indicate the impending
   expiry of timestamps.
4. Modify utimes to clamp the timestamps.
5. Fill in limits for filesystems.

A test for checking file system timestamp limits has been posted
at https://www.spinics.net/lists/fstests/msg12262.html

Changes since v7:
* Dropped fat modifications from timespec_truncate patch
* Leverage timestamp_truncate function in utimes
* Added a fix for pstore ramoops timestamps
* Added ext4 warning for inodes without room for extended timestamps.
* Made mount warning more human readable
Changes since v6:
* No change in mount behavior because of expiry of timestamps.
* Included limits for more filesystems.
Changes since v5:
* Dropped y2038-specific changes
Changes since v4:
* Added documentation for boot param
Changes since v3:
* Remove redundant initializations in libfs.c
* Change early_param to __setup similar to other root mount options.
* Fix documentation warning
Changes since v2:
* Introduce early boot param override for checks.
* Drop afs patch for timestamp limits.
Changes since v1:
* return EROFS on mount errors
* fix mtime copy/paste error in utimes

Deepa Dinamani (20):
  vfs: Add file timestamp range support
  vfs: Add timestamp_truncate() api
  timestamp_truncate: Replace users of timespec64_trunc
  mount: Add mount warning for impending timestamp expiry
  utimes: Clamp the timestamps before update
  fs: Fill in max and min timestamps in superblock
  9p: Fill min and max timestamps in sb
  adfs: Fill in max and min timestamps in sb
  ext4: Initialize timestamps limits
  fs: nfs: Initialize filesystem timestamp ranges
  fs: cifs: Initialize filesystem timestamp ranges
  fs: fat: Initialize filesystem timestamp ranges
  fs: affs: Initialize filesystem timestamp ranges
  fs: sysv: Initialize filesystem timestamp ranges
  fs: ceph: Initialize filesystem timestamp ranges
  fs: orangefs: Initialize filesystem timestamp ranges
  fs: hpfs: Initialize filesystem timestamp ranges
  fs: omfs: Initialize filesystem timestamp ranges
  pstore: fs superblock limits
  isofs: Initialize filesystem timestamp ranges

 fs/9p/vfs_super.c        |  6 +++++-
 fs/adfs/adfs.h           | 13 +++++++++++++
 fs/adfs/inode.c          |  8 ++------
 fs/adfs/super.c          |  2 ++
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
 fs/orangefs/super.c      |  2 ++
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
 51 files changed, 315 insertions(+), 78 deletions(-)

-- 
2.17.1

Cc: adilger.kernel@dilger.ca
Cc: adrian.hunter@intel.com
Cc: aivazian.tigran@gmail.com
Cc: al@alarsen.net
Cc: anna.schumaker@netapp.com
Cc: anton@enomsg.org
Cc: asmadeus@codewreck.org
Cc: ccross@android.com
Cc: ceph-devel@vger.kernel.org
Cc: coda@cs.cmu.edu
Cc: codalist@coda.cs.cmu.edu
Cc: darrick.wong@oracle.com
Cc: dedekind1@gmail.com
Cc: devel@lists.orangefs.org
Cc: dsterba@suse.com
Cc: dushistov@mail.ru
Cc: dwmw2@infradead.org
Cc: ericvh@gmail.com
Cc: gregkh@linuxfoundation.org
Cc: hch@infradead.org
Cc: hch@lst.de
Cc: hirofumi@mail.parknet.co.jp
Cc: hubcap@omnibond.com
Cc: idryomov@gmail.com
Cc: jack@suse.com
Cc: jaegeuk@kernel.org
Cc: jaharkes@cs.cmu.edu
Cc: jfs-discussion@lists.sourceforge.net
Cc: jlbec@evilplan.org
Cc: keescook@chromium.org
Cc: linux-cifs@vger.kernel.org
Cc: linux-ext4@vger.kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net
Cc: linux-karma-devel@lists.sourceforge.net
Cc: linux-mtd@lists.infradead.org
Cc: linux-nfs@vger.kernel.org
Cc: linux-ntfs-dev@lists.sourceforge.net
Cc: linux-xfs@vger.kernel.org
Cc: lucho@ionkov.net
Cc: luisbg@kernel.org
Cc: martin@omnibond.com
Cc: me@bobcopeland.com
Cc: mikulas@artax.karlin.mff.cuni.cz
Cc: nico@fluxnic.net
Cc: phillip@squashfs.org.uk
Cc: reiserfs-devel@vger.kernel.org
Cc: richard@nod.at
Cc: sage@redhat.com
Cc: salah.triki@gmail.com
Cc: sfrench@samba.org
Cc: shaggy@kernel.org
Cc: tj@kernel.org
Cc: tony.luck@intel.com
Cc: trond.myklebust@hammerspace.com
Cc: tytso@mit.edu
Cc: v9fs-developer@lists.sourceforge.net
Cc: yuchao0@huawei.com
Cc: zyan@redhat.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
