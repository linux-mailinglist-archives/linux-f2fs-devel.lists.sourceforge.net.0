Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 467D613B7D8
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Jan 2020 03:41:05 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1irYc9-0002hV-N7; Wed, 15 Jan 2020 02:41:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=276f86f0a=shinichiro.kawasaki@wdc.com>)
 id 1irYc8-0002h8-WD
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Jan 2020 02:41:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kBqqq7Qux37Tb03Hi/jnQHrfnz+/J0dqWUL5xCiyb+I=; b=jRok2ByvdUwPoetIWU3cvOGzLw
 qqRt0SXXfoC3ZlVbvinCVH4z5YQkE+U6KGcrZe90ht05D23hGOD8eKOy0J2DK5hX1Mb+rb1JWKDMP
 uszPH74exR/46oxjF1bxSlM8jLXcLWA97eFLf9FWFO1YwRPC7BCBRaFtihwuzzvlCHfk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=kBqqq7Qux37Tb03Hi/jnQHrfnz+/J0dqWUL5xCiyb+I=; b=E
 KOSYVhZLRl4IKROvaLSTMvAzarmadeUI450pmLJ8lBZBvED91ZdwUtabLKRYb2Mnlwo7cIIbsTVEj
 UE93cDMam2GwbPbWbhbdygRageDXmelPu7FbDX+GTJDjSoDaidsdsdoSCbdBzwNu6SAvNxsg2xylI
 Ej52SLlcEG3bfZR8=;
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1irYc4-003pRg-HL
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Jan 2020 02:41:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1579056057; x=1610592057;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dlyrtumlplpns302Ct72feVekF1V0rrMEnsLuZRyhuk=;
 b=FjjAD8diaiihLTJoM71s9+LoOe+/xU7tjZv/Qy2Ej02iMD+uYQpZgRNA
 VDeQLb0+R3k9xrmnM8wxKOIXBUXRfniyOsn8JtHQ8+oJuYMUQQaDdK6oL
 H66irxsKvXcEtFf2/5zvAskP1jUms/U12XaPQCivjcC8dlZBSFEdmRppT
 /ezH9uKapKugoOqPcSLo1lfZmAD2MdEgptZ/Vy2eIWH6WHUdSdYK3j9Sr
 yQiyFO0ul5evegyzGTtO0S6LXPNGY+ndA1tKOy5L/4sxFIAKttCXAyjFk
 0LDhPT3NWcESDPqqdTtjBEqsmopWS7rwKlgRIY1DrSGmCARJ9xEWChxND Q==;
IronPort-SDR: hEQgncxvuB5MHQMtFMg1dXzX4tBPDvjVXeNnnr8j7ZHVd42M4BQnLZ7I2p6e0d9XP3FlNeuqi9
 jN5P29z+aISewTd3uHYCxcjh30z2yogw2p0Kj50lG6N3zdPerNV3N/0fqSPHwwxjA5hD7lZFoR
 BalvLvCd6Q+xororqjlTCuhOZY22TjTEtSTFeFsdwrr+xAItKaZ7n9sq2B4wY5RMPgfmADCqju
 hhLE0gY56hJjeBhc83CTkN7iYa8auOFfq29g86MCzmtvS4SLlzc7WM1g8JpeuibWPvyy2POOZE
 32I=
X-IronPort-AV: E=Sophos;i="5.70,320,1574092800"; d="scan'208";a="128158035"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 15 Jan 2020 10:25:11 +0800
IronPort-SDR: a2xvRweEWZyPimO6xwW98iND9rCkKBHQNLda0UbRpOxSMqYV4j2JR04GMuaDnko8fNIjixaf9/
 96lV/+n93Tg/XII48KlOiIPqUQ9e5SoTmLpaDgunq6MmfbQqshWF07kBKp/nvBR1V/HDe9M4n4
 7PR+79SiW+7/JgjYqPDSJtCI55eC/LEFKRXtYc1rPt2wHPBMoAj5H/ygrd6qdPdsysMpFNZBJ7
 rwwKsbF52t+2YBAFIQdz+KYzegi3Cu6aS0ABkNi9ItjWIZ9XB7rHFvvonuRa/srJf+fbxrAvlt
 7AIGpoNjr/lDRz6x8A1+3Xbo
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2020 18:18:48 -0800
IronPort-SDR: X+DdRcSOnIi1EAR/hm9mc6qyeegodvjrjFyLsC5iPXrjrYSC5Zm/ch7MReOZEehlIT/N34mCw9
 PdJYkwlmeYo5YzcCWAwTBmKx5xkItMb7B/+EZ4i6Z3M+bCP3sbCJRlqC57nLFWV+g0uMT+xe56
 s+KTd6SmcpuqKfdpiT+MXTPbdRRNaiD+Z5xTYJAw8jEZPuVW+ZbwUvXWThJ8waS0dfV1C4FtmG
 UvMODiTUka+ZqVLCoHTnPeK4Pj9HU6tEh+A4QTkEsRuG+hIcZMjl3Gt0c5zxcYq1Cuv/m+5k3f
 a10=
WDCIronportException: Internal
Received: from shindev.dhcp.fujisawa.hgst.com (HELO shindev.fujisawa.hgst.com)
 ([10.149.53.87])
 by uls-op-cesaip01.wdc.com with ESMTP; 14 Jan 2020 18:25:11 -0800
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 15 Jan 2020 11:25:07 +0900
Message-Id: <20200115022509.199291-1-shinichiro.kawasaki@wdc.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1irYc4-003pRg-HL
Subject: [f2fs-dev] [PATCH v6 0/2] f2fs: Check write pointers of zoned block
 devices
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On sudden f2fs shutdown, zoned block device status and f2fs meta data can be
inconsistent. When f2fs shutdown happens during write operations, write pointers
on the device go forward but the f2fs meta data does not reflect the write
pointer progress. This inconsistency will eventually cause "Unaligned write
command" error when restarting write operation after the next mount.

This error is observed with xfstests test case generic/388, which enforces
sudden shutdown during write operation and checks the file system recovery.

This patch series adds a feature to f2fs to check and fix the write pointer
consistency when zoned block devices get mounted. Per discussion on the list,
implement two checks: a check for open zones and a check for non-open zones.
The first patch add the check for open zones that current segments point to.
Check write pointer consistency with current segment positions recorded in CP,
and if they are inconsistent, assign a new zone to the current segment. When
fsync data exists, check and fix the consistency after fsync data recovery.

The second patch adds the check for non-open zones that current segments do not
point to. Compare write pointers with valid block maps in SIT, and if they are
inconsistent, report the failure or fix by resetting the write pointer.

Thank goes to Chao Yu for the detailed discussion on the list.

Changes from v5:
* Removed unused variable cs_block that YueHaibing pointed out

Changes from v4:
* Replaced blkdev_zone_mgmt() function calls with __f2fs_issue_discard_zone()

Changes from v3:
* Rebased to linux master tip and fixed conflicts for blkdev_report_zones()
* Discard zones with write pointers not at zone start but without valid blocks,
  resetting the write pointers instead of fsck run by users
* Improved readability of open-zone's check condition and indent with tab

Changes from v2:
* 1st patch: Fix write pointer in SBI_POR_DOING guard
             Removed __set_inuse() and f2fs_stop_checkpoint()
* 2nd patch: Reversed bitmap search and removed __set_inuse()
             Changed condition for disable_roll_forward/norecovery mount options

Changes from v1:
* 2nd patch: Added check to ensure zones are in main segments

Shin'ichiro Kawasaki (2):
  f2fs: Check write pointer consistency of open zones
  f2fs: Check write pointer consistency of non-open zones

 fs/f2fs/f2fs.h     |   2 +
 fs/f2fs/recovery.c |  20 +++-
 fs/f2fs/segment.c  | 257 +++++++++++++++++++++++++++++++++++++++++++++
 fs/f2fs/super.c    |  11 ++
 4 files changed, 288 insertions(+), 2 deletions(-)

-- 
2.24.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
