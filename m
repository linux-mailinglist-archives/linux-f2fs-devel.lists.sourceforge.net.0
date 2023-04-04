Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 768166D65E2
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Apr 2023 16:55:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pji3l-0000fU-E9;
	Tue, 04 Apr 2023 14:54:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <aalbersh@redhat.com>) id 1pji3i-0000fL-WD
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 14:54:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oD3C5F3LGtukmBxzahEExE7hRIVYDTE1CCzX3qZAvIY=; b=hRSU0OLmkd6BqjJMajPUtETh2/
 yUNzSSLCKkKeaSYYEeIi9DThjVKMVCARQ/CU7t1xq337dqpc+UzkfjgdwUI21HLSN+tm1jCZAYnIY
 kqpdXJw66c7r92LxHxO16vKeZLh6/g3oD3qkxJcKqGOLTOb9hZiwTqk9lvOdFu7+TtmY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=oD3C5F3LGtukmBxzahEExE7hRIVYDTE1CCzX3qZAvIY=; b=Q
 4DrJ79YNEx3CRfiZUW6H8MQPunGpjRZq+d5Ky6UxaJAA1sGeN3MR6918HjoqQOFQBpqmz3R0hwn7q
 LBZR5hoCkTXz61teHPsfY1xOdZJWm9FuEbzRA5//8JICHC7jgxXkrrYcX0IDhTr5g/50qChPYNP+8
 LREfULEUd1Ptp6co=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pji3g-00Ez5k-9h for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 14:54:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680620086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=oD3C5F3LGtukmBxzahEExE7hRIVYDTE1CCzX3qZAvIY=;
 b=Bco5HbC1gdH1h9fk3KheKe3qNzcHt2OVvfvZPZZTbbq5NQrO+y+f+X+MskyA4etKFJI4LA
 Pj3sZEm+9mP9ROPeGBTMqDqTl1JAv9SA2v48JBpqQzZnmAkD9+VwLf10XD4o8iY+FUcrdt
 cFTpJHjwomSR493LpueDqzXUTX/ruFA=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-546-7qCeYPkhNe-VhTLvl2q3zA-1; Tue, 04 Apr 2023 10:54:44 -0400
X-MC-Unique: 7qCeYPkhNe-VhTLvl2q3zA-1
Received: by mail-qv1-f69.google.com with SMTP id
 a10-20020a0ccdca000000b005d70160fbb0so14664819qvn.21
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 04 Apr 2023 07:54:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680620081;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oD3C5F3LGtukmBxzahEExE7hRIVYDTE1CCzX3qZAvIY=;
 b=UB9rRfa80UDwp7zv707RUmQyR3mc9QHxHRzDMwBgDYd7QvROMHNKS5Iyb6Zn74CI3N
 Oy60LwnlMvtJMgWfdXC9rxonqGRrP454VNp7xQfg/85m5puvtN7UDBm9DnBY3M45l+OB
 eXxRn5On/eZ1Ke2AwEmsoOJGuGo35bFq90jV+fqqsKBa+Bs3ZJYWWEA2sVWSqlU71QuM
 r3cXzvjPjNUBNxhft+2TS9tnRFTnL5PYa4Gnj2SivNcGSfXNmEu98lTg17i96ibP1Yv1
 7k4MD+flnLjWqDl1nCynF5LQouG6ATOCMNyxOn7MIMwCrzlIj23KZswX1pcUbgsjoOqo
 8+Kw==
X-Gm-Message-State: AAQBX9fJFUnKdDk9Qyxh1d0C+BHcneM9XwY6MbeYxI2rxUEp26MgbVcg
 jRkICHMNUP/pcuBJGtgiLOf5MPgk3FuoUrj2LcxPs5ET9xcWrEsqjmG4M7pWM6Jvy/PV2FVfJad
 sNIy4Tu0k7i1eW7UvjAokaKSH0/9CsG83RXuL
X-Received: by 2002:a05:622a:183:b0:3e4:9f9a:54b2 with SMTP id
 s3-20020a05622a018300b003e49f9a54b2mr3125037qtw.65.1680620080398; 
 Tue, 04 Apr 2023 07:54:40 -0700 (PDT)
X-Google-Smtp-Source: AKy350aQaTUsx1W6QCtRYW4E/BPPbSUPOo7MRSxPdoArP74ywpcoKBragJvpDtJCE5UocjgeAZeoJA==
X-Received: by 2002:a05:622a:183:b0:3e4:9f9a:54b2 with SMTP id
 s3-20020a05622a018300b003e49f9a54b2mr3124990qtw.65.1680620080023; 
 Tue, 04 Apr 2023 07:54:40 -0700 (PDT)
Received: from aalbersh.remote.csb ([109.183.6.197])
 by smtp.gmail.com with ESMTPSA id
 j4-20020ac86644000000b003e6387431dcsm3296539qtp.7.2023.04.04.07.54.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 07:54:39 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
To: djwong@kernel.org, dchinner@redhat.com, ebiggers@kernel.org,
 hch@infradead.org, linux-xfs@vger.kernel.org, fsverity@lists.linux.dev
Date: Tue,  4 Apr 2023 16:52:56 +0200
Message-Id: <20230404145319.2057051-1-aalbersh@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi all,
 This is V2 of fs-verity support in XFS. In this series
 I did numerous changes from V1 which are described below. This patchset
 introduces
 fs-verity [5] support for XFS. This implementation utilizes extended
 attributes
 to store fs-verity metadata. The Merkle tree blocks are stored in the remote
 extended attribute [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.133.124 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [170.10.133.124 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pji3g-00Ez5k-9h
Subject: [f2fs-dev] [PATCH v2 00/23] fs-verity support for XFS
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
Cc: linux-ext4@vger.kernel.org, agruenba@redhat.com,
 damien.lemoal@opensource.wdc.com, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, rpeterso@redhat.com, xiang@kernel.org,
 jth@kernel.org, linux-erofs@lists.ozlabs.org,
 Andrey Albershteyn <aalbersh@redhat.com>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi all,

This is V2 of fs-verity support in XFS. In this series I did
numerous changes from V1 which are described below.

This patchset introduces fs-verity [5] support for XFS. This
implementation utilizes extended attributes to store fs-verity
metadata. The Merkle tree blocks are stored in the remote extended
attributes.

A few key points:
- fs-verity metadata is stored in extended attributes
- Direct path and DAX are disabled for inodes with fs-verity
- Pages are verified in iomap's read IO path (offloaded to
  workqueue)
- New workqueue for verification processing
- New ro-compat flag
- Inodes with fs-verity have new on-disk diflag
- xfs_attr_get() can return buffer with the attribute

The patchset is tested with xfstests -g auto on xfs_1k, xfs_4k,
xfs_1k_quota, and xfs_4k_quota. Haven't found any major failures.

Patches [6/23] and [7/23] touch ext4, f2fs, btrfs, and patch [8/23]
touches erofs, gfs2, and zonefs.

The patchset consist of four parts:
- [1..4]: Patches from Parent Pointer patchset which add binary
          xattr names with a few deps
- [5..7]: Improvements to core fs-verity
- [8..9]: Add read path verification to iomap
- [10..23]: Integration of fs-verity to xfs

Changes from V1:
- Added parent pointer patches for easier testing
- Many issues and refactoring points fixed from the V1 review
- Adjusted for recent changes in fs-verity core (folios, non-4k)
- Dropped disabling of large folios
- Completely new fsverity patches (fix, callout, log_blocksize)
- Change approach to verification in iomap to the same one as in
  write path. Callouts to fs instead of direct fs-verity use.
- New XFS workqueue for post read folio verification
- xfs_attr_get() can return underlying xfs_buf
- xfs_bufs are marked with XBF_VERITY_CHECKED to track verified
  blocks

kernel:
[1]: https://github.com/alberand/linux/tree/xfs-verity-v2

xfsprogs:
[2]: https://github.com/alberand/xfsprogs/tree/fsverity-v2

xfstests:
[3]: https://github.com/alberand/xfstests/tree/fsverity-v2

v1:
[4]: https://lore.kernel.org/linux-xfs/20221213172935.680971-1-aalbersh@redhat.com/

fs-verity:
[5]: https://www.kernel.org/doc/html/latest/filesystems/fsverity.html

Thanks,
Andrey

Allison Henderson (4):
  xfs: Add new name to attri/d
  xfs: add parent pointer support to attribute code
  xfs: define parent pointer xattr format
  xfs: Add xfs_verify_pptr

Andrey Albershteyn (19):
  fsverity: make fsverity_verify_folio() accept folio's offset and size
  fsverity: add drop_page() callout
  fsverity: pass Merkle tree block size to ->read_merkle_tree_page()
  iomap: hoist iomap_readpage_ctx from the iomap_readahead/_folio
  iomap: allow filesystem to implement read path verification
  xfs: add XBF_VERITY_CHECKED xfs_buf flag
  xfs: add XFS_DA_OP_BUFFER to make xfs_attr_get() return buffer
  xfs: introduce workqueue for post read IO work
  xfs: add iomap's readpage operations
  xfs: add attribute type for fs-verity
  xfs: add fs-verity ro-compat flag
  xfs: add inode on-disk VERITY flag
  xfs: initialize fs-verity on file open and cleanup on inode
    destruction
  xfs: don't allow to enable DAX on fs-verity sealsed inode
  xfs: disable direct read path for fs-verity sealed files
  xfs: add fs-verity support
  xfs: handle merkle tree block size != fs blocksize != PAGE_SIZE
  xfs: add fs-verity ioctls
  xfs: enable ro-compat fs-verity flag

 fs/btrfs/verity.c               |  15 +-
 fs/erofs/data.c                 |  12 +-
 fs/ext4/verity.c                |   9 +-
 fs/f2fs/verity.c                |   9 +-
 fs/gfs2/aops.c                  |  10 +-
 fs/ioctl.c                      |   4 +
 fs/iomap/buffered-io.c          |  89 ++++++-----
 fs/verity/read_metadata.c       |   7 +-
 fs/verity/verify.c              |   9 +-
 fs/xfs/Makefile                 |   1 +
 fs/xfs/libxfs/xfs_attr.c        |  81 +++++++++-
 fs/xfs/libxfs/xfs_attr.h        |   7 +-
 fs/xfs/libxfs/xfs_attr_leaf.c   |   7 +
 fs/xfs/libxfs/xfs_attr_remote.c |  13 +-
 fs/xfs/libxfs/xfs_da_btree.h    |   7 +-
 fs/xfs/libxfs/xfs_da_format.h   |  46 +++++-
 fs/xfs/libxfs/xfs_format.h      |  14 +-
 fs/xfs/libxfs/xfs_log_format.h  |   8 +-
 fs/xfs/libxfs/xfs_sb.c          |   2 +
 fs/xfs/scrub/attr.c             |   4 +-
 fs/xfs/xfs_aops.c               |  61 +++++++-
 fs/xfs/xfs_attr_item.c          | 142 +++++++++++++++---
 fs/xfs/xfs_attr_item.h          |   1 +
 fs/xfs/xfs_attr_list.c          |  17 ++-
 fs/xfs/xfs_buf.h                |  17 ++-
 fs/xfs/xfs_file.c               |  22 ++-
 fs/xfs/xfs_inode.c              |   2 +
 fs/xfs/xfs_inode.h              |   3 +-
 fs/xfs/xfs_ioctl.c              |  22 +++
 fs/xfs/xfs_iomap.c              |  14 ++
 fs/xfs/xfs_iops.c               |   4 +
 fs/xfs/xfs_linux.h              |   1 +
 fs/xfs/xfs_mount.h              |   3 +
 fs/xfs/xfs_ondisk.h             |   4 +
 fs/xfs/xfs_super.c              |  19 +++
 fs/xfs/xfs_trace.h              |   1 +
 fs/xfs/xfs_verity.c             | 256 ++++++++++++++++++++++++++++++++
 fs/xfs/xfs_verity.h             |  27 ++++
 fs/xfs/xfs_xattr.c              |   9 ++
 fs/zonefs/file.c                |  12 +-
 include/linux/fsverity.h        |  18 ++-
 include/linux/iomap.h           |  39 ++++-
 include/uapi/linux/fs.h         |   1 +
 43 files changed, 923 insertions(+), 126 deletions(-)
 create mode 100644 fs/xfs/xfs_verity.c
 create mode 100644 fs/xfs/xfs_verity.h

-- 
2.38.4



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
