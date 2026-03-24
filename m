Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OOMLLtddwml5cAQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Mar 2026 10:48:07 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 58883305DE2
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Mar 2026 10:48:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6gI6z3DQj0Dt8xwF+jBF64SCP8CwjjndVmxfy1X+HKk=; b=jg19Oao2whJv4s+L83UZfEVKV5
	zYr8VyrdQUxmecGV81N9kcofQ1KyksSL+JnOubzl1A2iUX98H4/rKlO3064V+qBFvbo25sLdp/ETV
	/tZ35ttTVDkFNXvb7v+/BwFikq7TAYlIl2/SPAwIk2I/znpOjsCAkXZCg8d6LALcGzus=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w4yMi-0003Ob-Ej;
	Tue, 24 Mar 2026 09:48:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <monty_pavel@sina.com>) id 1w4yMh-0003OV-1n
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Mar 2026 09:47:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jIF8BD/WPjznWyIaCFmU9q7EmMwolIsxTqrUv2SNg/M=; b=j45mTTRdM/iPS7CJwx7b+p6yJq
 4fWMXbkFgSbjoLbNDnd571kEbJcN376P3B7R0uQ/bMZo6AptcOiHsUXrokyTxaNMhEL7vWPoHoH+n
 eCBdWgJR0krG2CIBw3XouCVf4pnSgz3d5bylXP9Fxx6stwrMIgkaZLx4jwpiyQSdI7pA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=jIF8BD/WPjznWyIaCFmU9q7EmMwolIsxTqrUv2SNg/M=; b=H
 i7gvdRNqLOO47w1nvvrBfknTURIpQisN+92yMCzk8gfxy9CwVrWCO6dG/xO4W7cQ+SYy9vmXObRmc
 ie0ICJadKpkogiUd6M4XvPJ2b9c8lp98H84tNMYROSSymXeASv9nctKTMbEzpF/VEhUFWPQk4YEp6
 4qz3t+I9Wh83NBe0=;
Received: from smtp153-162.sina.com.cn ([61.135.153.162])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w4yMe-0006gk-SN for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Mar 2026 09:47:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208;
 t=1774345677; bh=jIF8BD/WPjznWyIaCFmU9q7EmMwolIsxTqrUv2SNg/M=;
 h=From:Subject:Date:Message-ID;
 b=rxuvcSpn7pScjkZslYf3ftLm/SVV+Re2AhI3AYDINFoULII0PeW6MbhNFQHut5wv0
 pcGsQ/NkvVM2RqXuTJ6KFAaCgAzu8BvVQ1kgPzypYu2Ogz1d7daj77BiXLHr0qHUd6
 prom+sbsVCZ/6OXv8cdWhNeDhW5ldru7qO2Cmt4g=
X-SMAIL-HELO: xiaomi-ThinkCentre-M760t.mioffice.cn
Received: from unknown (HELO
 xiaomi-ThinkCentre-M760t.mioffice.cn)([114.247.175.249])
 by sina.com (10.54.253.31) with ESMTP
 id 69C25DC200006D98; Tue, 24 Mar 2026 17:47:48 +0800 (CST)
X-Sender: monty_pavel@sina.com
X-Auth-ID: monty_pavel@sina.com
Authentication-Results: sina.com; spf=none smtp.mailfrom=monty_pavel@sina.com;
 dkim=none header.i=none;
 dmarc=none action=none header.from=monty_pavel@sina.com
X-SMAIL-MID: 3262426816220
X-SMAIL-UIID: EE0C8DC5BBFB4A789B08267766266A55-20260324-174748-1
From: Yongpeng Yang <monty_pavel@sina.com>
To: Chao Yu <chao@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Tue, 24 Mar 2026 17:47:08 +0800
Message-ID: <20260324094707.3959420-2-monty_pavel@sina.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Yongpeng Yang Neither F2FS nor VFS invalidates the
 block
 device page cache, which results in reading stale metadata. An example scenario
 is shown below: Terminal A Terminal B mount /dev/vdb /mnt/f2fs touch mx //
 ino = 4 sync dump.f2fs -i 4 /dev/vdb// block on "[Y/N]" touch mx2 // ino
 = 5 sync umount /mnt/f2fs dump.f2fs -i 5 /dev/vdb // block addr is 0 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [monty_pavel(at)sina.com]
X-Headers-End: 1w4yMe-0006gk-SN
Subject: [f2fs-dev] [PATCH v2] f2fs: invalidate block device page cache on
 umount
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 Yongpeng Yang <monty_pavel@sina.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-0.01 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[sina.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[monty_pavel@sina.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:monty_pavel@sina.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_FROM(0.00)[sina.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DKIM_MIXED(0.00)[];
	FREEMAIL_CC(0.00)[xiaomi.com,sina.com,lists.sourceforge.net];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[monty_pavel@sina.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,sina.com:s=201208];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,sina.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim,mail-archive.com:url]
X-Rspamd-Queue-Id: 58883305DE2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Yongpeng Yang <yangyongpeng@xiaomi.com>

Neither F2FS nor VFS invalidates the block device page cache, which
results in reading stale metadata. An example scenario is shown below:

Terminal A                  Terminal B
mount /dev/vdb /mnt/f2fs
touch mx // ino = 4
sync
dump.f2fs -i 4 /dev/vdb// block on "[Y/N]"
                            touch mx2 // ino = 5
                            sync
                            umount /mnt/f2fs
                            dump.f2fs -i 5 /dev/vdb // block addr is 0

After umount, the block device page cache is not purged, causing
`dump.f2fs -i 5 /dev/vdb` to read stale metadata and see inode 5 with
block address 0.

Btrfs has encountered a similar issue before, the solution there was to
call sync_blockdev() and invalidate_bdev() when the device is closed:

mail-archive.com/linux-btrfs@vger.kernel.org/msg54188.html

For the root user, the f2fs kernel calls sync_blockdev() on umount to
flush all cached data to disk, and f2fs-tools can release the page cache
by issuing ioctl(fd, BLKFLSBUF) when accessing the device. However,
non-root users are not permitted to drop the page cache, and may still
observe stale data.

This patch calls sync_blockdev() and invalidate_bdev() during umount to
invalidate the block device page cache, thereby preventing stale
metadata from being read.

Note that this may result in an extra sync_blockdev() call on the first
device, in both f2fs_put_super() and kill_block_super(). The second call
do nothing, as there are no dirty pages left to flush. It ensures that
non-root users do not observe stale data.

Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
---
v2:
- Add commit message explaining why sync_blockdev is called redundantly
for the first device.
---
 fs/f2fs/super.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 40079fd7886b..b624ed253a95 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2088,6 +2088,12 @@ static void f2fs_put_super(struct super_block *sb)
 #if IS_ENABLED(CONFIG_UNICODE)
 	utf8_unload(sb->s_encoding);
 #endif
+	sync_blockdev(sb->s_bdev);
+	invalidate_bdev(sb->s_bdev);
+	for (i = 1; i < sbi->s_ndevs; i++) {
+		sync_blockdev(FDEV(i).bdev);
+		invalidate_bdev(FDEV(i).bdev);
+	}
 }
 
 int f2fs_sync_fs(struct super_block *sb, int sync)
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
