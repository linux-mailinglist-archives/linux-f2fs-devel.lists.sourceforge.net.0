Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ACCC188D786
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 27 Mar 2024 08:42:48 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rpNvn-0005GZ-DW;
	Wed, 27 Mar 2024 07:42:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rpNvj-0005G4-8e
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 27 Mar 2024 07:42:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=19h5DNBdP4vMa3IhEw3YP1lqgeYfXOgKc0YVKFYgPyY=; b=TvtRsS/hFPFBkEB4zkh14TX6g0
 dvAItF7Xlgw+ANfalvPbSXkm/i/i8ChlsD2XWTgr4zqPO1P3D3e+mxY622NZBCoybbxR6Fc+lSha0
 ok9R0+bM+9fD2NHpYw3Lh2Nz8sY2LdET3VZuLa4E/tQPgjx+AswI9IL4ou1587A+mo2o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=19h5DNBdP4vMa3IhEw3YP1lqgeYfXOgKc0YVKFYgPyY=; b=U
 VoPGHjQ1Rn/r4M9QoFteVeTR81TTbXat282Dy6eb/KpxybP0/3GcU02tfuO70Qqlz4PCY4tA52b2P
 BDPREynDiO/orX0keIIGpET3Pl+7Zi79nvbDByfLtcN8tVkGbCi7eAuEW2vTXvx1Yg8pOx4xLeme7
 ZEPM7a2t8n2eCXUs=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rpNvh-0003ZK-Aq for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 27 Mar 2024 07:42:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D8E58CE250F;
 Wed, 27 Mar 2024 07:42:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84F45C433F1;
 Wed, 27 Mar 2024 07:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711525350;
 bh=TD71V4olm06QmOSssnupFr6nfPYdbww3XJe4yFkCmgU=;
 h=From:To:Cc:Subject:Date:From;
 b=qDLB564J1OPwdwaFjSwzPzdcxFpNkqvpBadoGyDILaGBfDQtBKe/wBFp6J7UZRqe4
 3B4IhdXATZKPWzkkeNGod/WFIl34byKVQo9bQp4Y5uN0anx0XaluWog960yH453uj7
 clvqPz2bXb6vZ1f4GZAvNFJyT7hefXy7eaN8tpnGzOLQLQXEV68PFZzRf7SdSD0+ho
 IRg7DAtqPwDnygmq9gNwQ/rxsX5x8rB4si4+3UHSCLKHiGrhDG/mBb19qzjPr/FCRo
 x7yWe4cey05PBTvVRXUpto7GmnUjZH6scZvsl7ifQGcj1t/U/thHhQFIS+bYPxVKqn
 q8EeEn2uWvZtA==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Wed, 27 Mar 2024 15:42:23 +0800
Message-Id: <20240327074223.2216487-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  As reported by Yi Zhang in mailing list [1], kernel warning
 was catched during zbd/010 test as below: ./check zbd/010 zbd/010 (test gap
 zone support with F2FS) [failed] runtime ... 3.752s something found in dmesg:
 [ 4378.146781] run blktests zbd/010 at 2024-02-18 11:31:13 [ 4378.192349]
 null_blk: modu [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rpNvh-0003ZK-Aq
Subject: [f2fs-dev] [PATCH v2] f2fs: multidev: fix to recognize valid zero
 block address
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
Cc: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
 Yi Zhang <yi.zhang@redhat.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

As reported by Yi Zhang in mailing list [1], kernel warning was catched
during zbd/010 test as below:

./check zbd/010
zbd/010 (test gap zone support with F2FS)                    [failed]
    runtime    ...  3.752s
    something found in dmesg:
    [ 4378.146781] run blktests zbd/010 at 2024-02-18 11:31:13
    [ 4378.192349] null_blk: module loaded
    [ 4378.209860] null_blk: disk nullb0 created
    [ 4378.413285] scsi_debug:sdebug_driver_probe: scsi_debug: trim
poll_queues to 0. poll_q/nr_hw = (0/1)
    [ 4378.422334] scsi host15: scsi_debug: version 0191 [20210520]
                     dev_size_mb=1024, opts=0x0, submit_queues=1, statistics=0
    [ 4378.434922] scsi 15:0:0:0: Direct-Access-ZBC Linux
scsi_debug       0191 PQ: 0 ANSI: 7
    [ 4378.443343] scsi 15:0:0:0: Power-on or device reset occurred
    [ 4378.449371] sd 15:0:0:0: Attached scsi generic sg5 type 20
    [ 4378.449418] sd 15:0:0:0: [sdf] Host-managed zoned block device
    ...
    (See '/mnt/tests/gitlab.com/api/v4/projects/19168116/repository/archive.zip/storage/blktests/blk/blktests/results/nodev/zbd/010.dmesg'

WARNING: CPU: 22 PID: 44011 at fs/iomap/iter.c:51
CPU: 22 PID: 44011 Comm: fio Not tainted 6.8.0-rc3+ #1
RIP: 0010:iomap_iter+0x32b/0x350
Call Trace:
 <TASK>
 __iomap_dio_rw+0x1df/0x830
 f2fs_file_read_iter+0x156/0x3d0 [f2fs]
 aio_read+0x138/0x210
 io_submit_one+0x188/0x8c0
 __x64_sys_io_submit+0x8c/0x1a0
 do_syscall_64+0x86/0x170
 entry_SYSCALL_64_after_hwframe+0x6e/0x76

Shinichiro Kawasaki helps to analyse this issue and proposes a potential
fixing patch in [2].

Quoted from reply of Shinichiro Kawasaki:

"I confirmed that the trigger commit is dbf8e63f48af as Yi reported. I took a
look in the commit, but it looks fine to me. So I thought the cause is not
in the commit diff.

I found the WARN is printed when the f2fs is set up with multiple devices,
and read requests are mapped to the very first block of the second device in the
direct read path. In this case, f2fs_map_blocks() and f2fs_map_blocks_cached()
modify map->m_pblk as the physical block address from each block device. It
becomes zero when it is mapped to the first block of the device. However,
f2fs_iomap_begin() assumes that map->m_pblk is the physical block address of the
whole f2fs, across the all block devices. It compares map->m_pblk against
NULL_ADDR == 0, then go into the unexpected branch and sets the invalid
iomap->length. The WARN catches the invalid iomap->length.

This WARN is printed even for non-zoned block devices, by following steps.

 - Create two (non-zoned) null_blk devices memory backed with 128MB size each:
   nullb0 and nullb1.
 # mkfs.f2fs /dev/nullb0 -c /dev/nullb1
 # mount -t f2fs /dev/nullb0 "${mount_dir}"
 # dd if=/dev/zero of="${mount_dir}/test.dat" bs=1M count=192
 # dd if="${mount_dir}/test.dat" of=/dev/null bs=1M count=192 iflag=direct

..."

So, the root cause of this issue is: when multi-devices feature is on,
f2fs_map_blocks() may return zero blkaddr in non-primary device, which is
a verified valid block address, however, f2fs_iomap_begin() treats it as
an invalid block address, and then it triggers the warning in iomap
framework code.

Finally, as discussed, we decide to use a more simple and direct way that
checking (map.m_flags & F2FS_MAP_MAPPED) condition instead of
(map.m_pblk != NULL_ADDR) to fix this issue.

Thanks a lot for the effort of Yi Zhang and Shinichiro Kawasaki on this
issue.

[1] https://lore.kernel.org/linux-f2fs-devel/CAHj4cs-kfojYC9i0G73PRkYzcxCTex=-vugRFeP40g_URGvnfQ@mail.gmail.com/
[2] https://lore.kernel.org/linux-f2fs-devel/gngdj77k4picagsfdtiaa7gpgnup6fsgwzsltx6milmhegmjff@iax2n4wvrqye/

Reported-by: Yi Zhang <yi.zhang@redhat.com>
Closes: https://lore.kernel.org/linux-f2fs-devel/CAHj4cs-kfojYC9i0G73PRkYzcxCTex=-vugRFeP40g_URGvnfQ@mail.gmail.com/
Tested-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Tested-by: Yi Zhang <yi.zhang@redhat.com>
Fixes: 1517c1a7a445 ("f2fs: implement iomap operations")
Fixes: 8d3c1fa3fa5e ("f2fs: don't rely on F2FS_MAP_* in f2fs_iomap_begin")
Signed-off-by: Chao Yu <chao@kernel.org>
---
v2:
- add Tested-by tag of Yi Zhang.
 fs/f2fs/data.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 08815394223a..fa5398ac4505 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -4196,7 +4196,7 @@ static int f2fs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
 	if (WARN_ON_ONCE(map.m_pblk == COMPRESS_ADDR))
 		return -EINVAL;
 
-	if (map.m_pblk != NULL_ADDR) {
+	if (map.m_flags & F2FS_MAP_MAPPED) {
 		iomap->length = blks_to_bytes(inode, map.m_len);
 		iomap->type = IOMAP_MAPPED;
 		iomap->flags |= IOMAP_F_MERGED;
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
