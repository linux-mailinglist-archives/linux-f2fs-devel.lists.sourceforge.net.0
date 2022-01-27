Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C617549D836
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 27 Jan 2022 03:47:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nCuoj-0002Vo-K2; Thu, 27 Jan 2022 02:47:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <neilb@suse.de>) id 1nCuoh-0002Vd-Ir
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 27 Jan 2022 02:47:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:Date:Cc:To:From:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yDPdolIqP1BqbqmgH35S+RrYDCrJz/kAXtj6i96pLsQ=; b=cDKIYhtH0RZxlfQU1GFbQ9qm4/
 6CfvI17ow4CUBt9/541ANWcbTwC9sKPxLb2q3d1jeVtM2tRnh/ApNpsibOf/cDknoe1tbr7aiP9Zz
 rbz7DUnzZIxMRbcUolLh7S8UIkY0j2IzNEvtVGyghoPgT26XFv/D8AaGJvJTy/GvkRgc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Cc:To
 :From:Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=yDPdolIqP1BqbqmgH35S+RrYDCrJz/kAXtj6i96pLsQ=; b=g
 7sPDj5U048Z1kVFpm+Y438J1Wkd7ogpfJ+6o0FygqvVTOVX/gMuco0VKxDgk+YFcj8b/mjzCPCRKa
 30xf1aFyexoVOCPh2xcf/mw6Kp2tr4KqQFAJc7VLOtQhj2nycpi9vZQl/eQ3xyu2t5qhe7orFh7w9
 jNT0glpBPZm7oEQM=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1nCuoe-0007ZE-GG
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 27 Jan 2022 02:47:18 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AB2D621905;
 Thu, 27 Jan 2022 02:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1643251625; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=yDPdolIqP1BqbqmgH35S+RrYDCrJz/kAXtj6i96pLsQ=;
 b=hAN5Dg0REL/K5jKsVHYqM3X+M7oL7DolmPiPn5nkKXAbr4U3cj5oAi65hMwxiSWo27QmOB
 cLQTty8i2cI986CYr180STDwieVyetu7kQ3qHdYo7SeahuPrc14qirLFBA73zPbrr4po2f
 zGgWZWBXgqAPi8k0xRaMTCQlkN1djpM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1643251625;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=yDPdolIqP1BqbqmgH35S+RrYDCrJz/kAXtj6i96pLsQ=;
 b=x6ydMXUFPK4DvzDKO6csSNrS9nejdxdCvtHG4Sf6wjFPHRmP2fhorasjEjQ6+4R4FunEK1
 J47b6RQj8pZ6MXBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E280813E46;
 Thu, 27 Jan 2022 02:46:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id d+tYJ6IH8mGjKwAAMHmgww
 (envelope-from <neilb@suse.de>); Thu, 27 Jan 2022 02:46:58 +0000
From: NeilBrown <neilb@suse.de>
To: Andrew Morton <akpm@linux-foundation.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
 Jeff Layton <jlayton@kernel.org>, Ilya Dryomov <idryomov@gmail.com>,
 Miklos Szeredi <miklos@szeredi.hu>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Anna Schumaker <anna.schumaker@netapp.com>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 "Darrick J. Wong" <djwong@kernel.org>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 Lars Ellenberg <lars.ellenberg@linbit.com>,
 Paolo Valente <paolo.valente@linaro.org>, Jens Axboe <axboe@kernel.dk>
Date: Thu, 27 Jan 2022 13:46:29 +1100
Message-ID: <164325106958.29787.4865219843242892726.stgit@noble.brown>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Congestion hasn't been reliably tracked for quite some time.
 Most MM uses of it for guiding writeback decisions were removed in 5.16.
 Some other uses were removed in 17-rc1. This series removes the remaining
 places that test for congestion, and the few places which still set it. 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.28 listed in list.dnswl.org]
X-Headers-End: 1nCuoe-0007ZE-GG
Subject: [f2fs-dev] [PATCH 0/9] Remove remaining parts of congestions
 tracking code.
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
Cc: linux-nfs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
 drbd-dev@lists.linbit.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Congestion hasn't been reliably tracked for quite some time.
Most MM uses of it for guiding writeback decisions were removed in 5.16.
Some other uses were removed in 17-rc1.

This series removes the remaining places that test for congestion, and
the few places which still set it.

The second patch touches a few filesystems.  I didn't think there was
much value in splitting this out by filesystems, but if maintainers
would rather I did that, I will.

The f2fs, cephfs, fuse, NFS, and block patches can go through the
respective trees proving the final patch doesn't land until after they
all do - so maybe it should be held for 5.18-rc2 if all the rest lands
by 5.18-rc1.

Thanks,
NeilBrown

---

NeilBrown (9):
      Remove inode_congested()
      Remove bdi_congested() and wb_congested() and related functions
      f2fs: change retry waiting for f2fs_write_single_data_page()
      f2f2: replace some congestion_wait() calls with io_schedule_timeout()
      cephfs: don't set/clear bdi_congestion
      fuse: don't set/clear bdi_congested
      NFS: remove congestion control.
      block/bfq-iosched.c: use "false" rather than "BLK_RW_ASYNC"
      Remove congestion tracking framework.


 block/bfq-iosched.c              |  2 +-
 drivers/block/drbd/drbd_int.h    |  3 --
 drivers/block/drbd/drbd_req.c    |  3 +-
 fs/ceph/addr.c                   | 27 ---------------
 fs/ceph/super.c                  |  2 --
 fs/ceph/super.h                  |  2 --
 fs/ext2/ialloc.c                 |  2 --
 fs/f2fs/compress.c               |  6 ++--
 fs/f2fs/data.c                   |  9 +++--
 fs/f2fs/segment.c                | 14 ++++----
 fs/f2fs/super.c                  |  8 ++---
 fs/fuse/control.c                | 17 ----------
 fs/fuse/dev.c                    |  8 -----
 fs/nfs/sysctl.c                  |  7 ----
 fs/nfs/write.c                   | 53 +----------------------------
 fs/nilfs2/segbuf.c               | 11 ------
 fs/xfs/xfs_buf.c                 |  3 --
 include/linux/backing-dev-defs.h |  8 -----
 include/linux/backing-dev.h      | 28 ----------------
 include/linux/nfs_fs.h           |  1 -
 include/linux/nfs_fs_sb.h        |  1 -
 include/trace/events/writeback.h | 28 ----------------
 mm/backing-dev.c                 | 57 --------------------------------
 mm/vmscan.c                      |  4 +--
 24 files changed, 25 insertions(+), 279 deletions(-)

--
Signature



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
