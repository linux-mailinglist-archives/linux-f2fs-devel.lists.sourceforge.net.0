Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 090CA57DAAD
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Jul 2022 09:14:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oEmra-0002gx-Kk; Fri, 22 Jul 2022 07:14:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1oEmrY-0002gg-PZ
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 22 Jul 2022 07:14:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PVf8tXYkAcmjL30UR6cGyERuLqU/MCJiFDIJlJDVhJ4=; b=izUz4g5LwjCfg/bEaJSw3xlRmo
 wYLRoXf0tvOA9t5aWr73q3GjncHv7tMBPEIcQyXYOtie82pFfVBmtdbEDAqcIsBJ0TLlh35Q7CLZW
 u3H9bwJLsia9jWmarGkUSNnG+skJyokzpQ+l+vYtEfctN7w2aDXh7yrC7bSKbRlTWPIE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=PVf8tXYkAcmjL30UR6cGyERuLqU/MCJiFDIJlJDVhJ4=; b=C
 r/gIlK7DXL77LQLQIWf6arlUVJomlAJXOdQoWhCWOvQNwFe/Xox3j4TrmeOidja8pcUYAQoEquHVR
 wxwD0tnmtyl1zd6vlGir8umGWZ3yATf1aEgN1E2Hd/DTGAxUYVugDTJ6NzdOis/w+l/Ru0PJEu8Xq
 FAL5HMhVxG9Dtvp4=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oEmrW-0000qX-Gp
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 22 Jul 2022 07:14:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6B679B82710
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 22 Jul 2022 07:14:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8F25C341C6;
 Fri, 22 Jul 2022 07:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658474042;
 bh=9mq8X3BGsuBzR6Ln4xciUKT8RQwcULSFGtUPi9jeosE=;
 h=From:To:Cc:Subject:Date:From;
 b=FLVRrpieLDHN39FkoGOUIAkHKLGpScI1ahdV3AgjGwfrcluvepuBzBT6F2984u3pe
 YxdD4BK8sy57CBvIm0XSdTFHQJcTcxNfBuwIZ22bE+QsqIcWOa3jZVywdVcsgMnYMl
 P8eZPra5KWYWA4zPs0rDJwnuri0qsYj5L/yrWJbb40slzWXWuRwOl/sdNhOL0RjjiZ
 t3hdZX2Thct6y6Piv8vzHp2E9U66v9l12USihLfnS30azOvbROyOeiNtaOmUZhk+ya
 QY9fg85OhHr4fbM1wBBORT+kBwT4kVrxB6luu3IFOzwg+6fTek78HFSblPNzVzfX+z
 MqEM0tbLisn/Q==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fsdevel@vger.kernel.org
Date: Fri, 22 Jul 2022 00:12:19 -0700
Message-Id: <20220722071228.146690-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
X-Spam-Score: -3.4 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This patchset makes the statx() system call return direct
 I/O (DIO) alignment information. This allows userspace to easily determine
 whether a file supports DIO, and if so with what alignment restrict [...]
 Content analysis details:   (-3.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oEmrW-0000qX-Gp
Subject: [f2fs-dev] [PATCH v4 0/9] make statx() return DIO alignment
 information
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
Cc: linux-block@vger.kernel.org, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 Keith Busch <kbusch@kernel.org>, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patchset makes the statx() system call return direct I/O (DIO)
alignment information.  This allows userspace to easily determine
whether a file supports DIO, and if so with what alignment restrictions.

Patch 1 adds the basic VFS support for STATX_DIOALIGN.  Patch 2 wires it
up for all block device files.  The remaining patches wire it up for
regular files on ext4, f2fs, and xfs.  Support for regular files on
other filesystems can be added later.

I've also written a man-pages patch, which I'm sending separately.

Note, f2fs has one corner case where DIO reads are allowed but not DIO
writes.  The proposed statx fields can't represent this.  My proposal
(patch 6) is to just eliminate this case, as it seems much too weird.
But I'd appreciate any feedback on that part.

This patchset applies to v5.19-rc7.

Changed v3 => v4:
   - Added xfs support.

   - Moved the helper function for block devices into block/bdev.c.
   
   - Adjusted the ext4 patch to not introduce a bug where misaligned DIO
     starts being allowed on encrypted files when it gets combined with
     the patch "iomap: add support for dma aligned direct-io" that is
     queued in the block tree for 5.20.

   - Made a simplification in fscrypt_dio_supported().

Changed v2 => v3:
   - Dropped the stx_offset_align_optimal field, since its purpose
     wasn't clearly distinguished from the existing stx_blksize.

   - Renamed STATX_IOALIGN to STATX_DIOALIGN, to reflect the new focus
     on DIO only.

   - Similarly, renamed stx_{mem,offset}_align_dio to
     stx_dio_{mem,offset}_align, to reflect the new focus on DIO only.

   - Wired up STATX_DIOALIGN on block device files.

Changed v1 => v2:
   - No changes.

Eric Biggers (9):
  statx: add direct I/O alignment information
  vfs: support STATX_DIOALIGN on block devices
  fscrypt: change fscrypt_dio_supported() to prepare for STATX_DIOALIGN
  ext4: support STATX_DIOALIGN
  f2fs: move f2fs_force_buffered_io() into file.c
  f2fs: don't allow DIO reads but not DIO writes
  f2fs: simplify f2fs_force_buffered_io()
  f2fs: support STATX_DIOALIGN
  xfs: support STATX_DIOALIGN

 block/bdev.c              | 25 ++++++++++++++++++++
 fs/crypto/inline_crypt.c  | 49 +++++++++++++++++++--------------------
 fs/ext4/ext4.h            |  1 +
 fs/ext4/file.c            | 37 ++++++++++++++++++++---------
 fs/ext4/inode.c           | 36 ++++++++++++++++++++++++++++
 fs/f2fs/f2fs.h            | 45 -----------------------------------
 fs/f2fs/file.c            | 45 ++++++++++++++++++++++++++++++++++-
 fs/stat.c                 | 14 +++++++++++
 fs/xfs/xfs_iops.c         |  9 +++++++
 include/linux/blkdev.h    |  4 ++++
 include/linux/fscrypt.h   |  7 ++----
 include/linux/stat.h      |  2 ++
 include/uapi/linux/stat.h |  4 +++-
 13 files changed, 190 insertions(+), 88 deletions(-)

base-commit: ff6992735ade75aae3e35d16b17da1008d753d28
-- 
2.37.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
