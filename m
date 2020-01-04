Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A89FF1302BD
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  4 Jan 2020 15:37:06 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1inkY0-0002Dy-Px; Sat, 04 Jan 2020 14:37:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <cgxu519@mykernel.net>) id 1inkXs-0002Dc-Lq
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 04 Jan 2020 14:36:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Date:Subject:Message-ID:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6RgICWXwhvwNHztqQtPT2dhQ/f21R4V1Nli9Z29zuMM=; b=bJJo9jydRJH8anxsYn+QPtCR/w
 y8wAcADmTfjMYavc4DQ6A3U/0VuwqmzxI/JIHzn0pVijZSTJLWP+CecTNu0E8E3Q8IaudXNMQmbv3
 kSGLkNjy5TNHuRrVrcQvJ0TpjxbzvzuCOL34VsOPbwuIrgmi/V+Xh1f1yAQbddzr7QL0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Date:Subject:
 Message-ID:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6RgICWXwhvwNHztqQtPT2dhQ/f21R4V1Nli9Z29zuMM=; b=EqovaYbJkOuzVnFEehFva4/cgk
 c1ioA+KFfKAdCuOBNQhp3jUjtREy1Y+i4twrzdD6+52mRb86+G/jOk+BKWdzL5atIk0Y87doPQ2NB
 MPX+ZXR2vZWZWOV4ppX/ZjibXLklMPQNxMmY0pYbSX4YoTWePMI5fteJZF0RpHhR2ZB8=;
Received: from sender2-of-o52.zoho.com.cn ([163.53.93.247])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-SHA384:256) (Exim 4.92.2)
 id 1inkXm-009ZAC-8u
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 04 Jan 2020 14:36:51 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1578147625; cv=none; d=zoho.com.cn; s=zohoarc; 
 b=bgbpHZyY+MRw8YTJOM1WEOc7yXFt1MCmQ61SZGH2rCLHeEBVB4FX376zfIqrFHr+4TW1CmxdlgFkm71q6+heq6ihQRzsneaLjpR1TqfbZI4hxtQgahVRkRpZ/HgFO844kR/9YK4Nl6kpPECRmtWRxr345LyPkP7idrq2qrvV+eE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn;
 s=zohoarc; t=1578147625;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To;
 bh=6RgICWXwhvwNHztqQtPT2dhQ/f21R4V1Nli9Z29zuMM=; 
 b=B8LMXxqN+WYi2cB+C1WgsNs4MSabWqQN3AnbeGsdg0da3fF8Z2qJkwLk51zoErV3I1R5+bIPR69V7eR1j1vrvhNabBeQobn5ljVEYWfjYM/ETcU7veEbtogT8JhGfCoEU0lCOArv8hKlSxFb8Gx0UDz3PmSWL2H8DlLMob3UJm8=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
 dkim=pass  header.i=mykernel.net;
 spf=pass  smtp.mailfrom=cgxu519@mykernel.net;
 dmarc=pass header.from=<cgxu519@mykernel.net>
 header.from=<cgxu519@mykernel.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1578147625; 
 s=zohomail; d=mykernel.net; i=cgxu519@mykernel.net;
 h=From:To:Cc:Message-ID:Subject:Date:MIME-Version:Content-Transfer-Encoding:Content-Type;
 bh=6RgICWXwhvwNHztqQtPT2dhQ/f21R4V1Nli9Z29zuMM=;
 b=e8i109+QZvsd4wrqLK+Ybcy0JonbcvaCzWUFIG4Iwxz4G4U8UYlj1I/qUOqH64cF
 qGOUrEQYCiykqYIU6t+eIUqA/roamSoT7ILbISdwEw6MSZvg6qeMelcXj5bANQIc7Oo
 zJUYuSqTJ4leSILovkpfDaLNU+0aPpMCV9KLhQSk=
Received: from localhost.localdomain.localdomain (113.116.49.111
 [113.116.49.111]) by mx.zoho.com.cn
 with SMTPS id 15781476236011.4213776319637645;
 Sat, 4 Jan 2020 22:20:23 +0800 (CST)
From: Chengguang Xu <cgxu519@mykernel.net>
To: jaegeuk@kernel.org,
	chao@kernel.org
Message-ID: <20200104142004.12883-1-cgxu519@mykernel.net>
Date: Sat,  4 Jan 2020 22:20:03 +0800
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-ZohoCNMailClient: External
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [163.53.93.247 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: mykernel.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1inkXm-009ZAC-8u
Subject: [f2fs-dev] [PATCH 1/2] f2fs: fix miscounted block limit in
 f2fs_statfs_project()
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
Cc: Chengguang Xu <cgxu519@mykernel.net>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

statfs calculates Total/Used/Avail disk space in block unit,
so we should translate soft/hard prjquota limit to block unit
as well.

Below testing result shows the block/inode numbers of
Total/Used/Avail from df command are all correct afer
applying this patch.

[root@localhost quota-tools]\# ./repquota -P /dev/sdb1
*** Report for project quotas on device /dev/sdb1
Block grace time: 7days; Inode grace time: 7days
              Block limits                File limits
Project   used soft    hard  grace  used  soft  hard  grace
-----------------------------------------------------------
\#0   --   4       0       0         1     0     0
\#101 --   0       0       0         2     0     0
\#102 --   0   10240       0         2    10     0
\#103 --   0       0   20480         2     0    20
\#104 --   0   10240   20480         2    10    20
\#105 --   0   20480   10240         2    20    10

[root@localhost sdb1]\# lsattr -p t{1,2,3,4,5}
  101 ----------------N-- t1/a1
  102 ----------------N-- t2/a2
  103 ----------------N-- t3/a3
  104 ----------------N-- t4/a4
  105 ----------------N-- t5/a5

[root@localhost sdb1]\# df -hi t{1,2,3,4,5}
Filesystem     Inodes IUsed IFree IUse% Mounted on
/dev/sdb1        2.4M    21  2.4M    1% /mnt/sdb1
/dev/sdb1          10     2     8   20% /mnt/sdb1
/dev/sdb1          20     2    18   10% /mnt/sdb1
/dev/sdb1          10     2     8   20% /mnt/sdb1
/dev/sdb1          10     2     8   20% /mnt/sdb1

[root@localhost sdb1]\# df -h t{1,2,3,4,5}
Filesystem      Size  Used Avail Use% Mounted on
/dev/sdb1        10G  489M  9.6G   5% /mnt/sdb1
/dev/sdb1        10M     0   10M   0% /mnt/sdb1
/dev/sdb1        20M     0   20M   0% /mnt/sdb1
/dev/sdb1        10M     0   10M   0% /mnt/sdb1
/dev/sdb1        10M     0   10M   0% /mnt/sdb1

Fixes: 909110c060f2 ("f2fs: choose hardlimit when softlimit is larger than hardlimit in f2fs_statfs_project()")
Signed-off-by: Chengguang Xu <cgxu519@mykernel.net>
---
 fs/f2fs/super.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 5111e1ffe58a..78efd0e76174 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1219,6 +1219,8 @@ static int f2fs_statfs_project(struct super_block *sb,
 	if (dquot->dq_dqb.dqb_bhardlimit &&
 			(!limit || dquot->dq_dqb.dqb_bhardlimit < limit))
 		limit = dquot->dq_dqb.dqb_bhardlimit;
+	if (limit)
+		limit >>= sb->s_blocksize_bits;
 
 	if (limit && buf->f_blocks > limit) {
 		curblock = dquot->dq_dqb.dqb_curspace >> sb->s_blocksize_bits;
-- 
2.21.1





_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
