Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E95F116B51
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  9 Dec 2019 11:45:03 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ieGXE-0003Ej-N8; Mon, 09 Dec 2019 10:45:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=2395697a2=shinichiro.kawasaki@wdc.com>)
 id 1ieGXD-0003EO-Je
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Dec 2019 10:44:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ee6tVEJ//RMrt3zJmQJx5rJv6xU7PcSPsClQ80rmSWo=; b=NpXwtADHpOB+3amc/Ma3MteFD7
 omslfMZ7iPR1J2XDX/hTUiFTfnnECSvqhmIH+Th5RSp7+JBWE/STFfBFAt/0EQQah59oEGuVqcjfk
 xrGkqCFR+1fK2NN3kuVuandgDXhQzWisW0rt2j8cfoO+nd+co6pdHIDBQD8T2Tmm3CsI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ee6tVEJ//RMrt3zJmQJx5rJv6xU7PcSPsClQ80rmSWo=; b=E
 V1Ktu9S//zRAr3kEPpBrsru6W23AMewOYKbQlnlWQomtBGwaEYmJenKr9MkdjeKMtZ7edYA2m36TW
 qU74pxcupoz/84sbOu6V0FSxkJ1EfjxaphbWB6AJQFODJZoZnb9HDEue8UqnbSS6Gr1UMNsYm/k8x
 tp0ydk0t8WYGV8BA=;
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ieGXB-00FMWj-Dr
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Dec 2019 10:44:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1575888306; x=1607424306;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PvOEuwndMckgxizudD2PJWekad3LlnzcFtfdhSBUj4I=;
 b=j2Q2QWvcNcf+GlbIwpBbOueSUZr1lsI2BjgxKHVO+Bni9dkXlvfXBc1R
 zav5bQ7yydvJWDDU2l5UEcn3Q/+PcqB3bezrI3KZpy+pM86meTX5Lb6eB
 9Qm5R6sbne72TOISkW+76s4InOUrAgHZ8Do4D1gLRwXXKRaKm0khrb3MU
 k5+Old1RodJgXVBuFo+doTid6XU1tQK8FfV63I0VOW93M+mAY2OmNQp9K
 7Fjp04R5lURThQ6dzH1Fu89/YFv888aBWgKb3vGG7lGo4bGpLMAfEPvgL
 Dlt3AISR6lxQkSXQIopZo/Fp5NB8uJofe/7Siw7gPcnDBzRoplT2P4OSE g==;
IronPort-SDR: vIsgMiDVce2xxUr+q2W1TWS+QOpgSInRPKIIK0wN8Rvn3upJyg4nWtyL22z4a0UT1wypFLw41R
 x7AjKCmYXX10ZdBStui1pD6jhWlDwTp8r29hj/JELl16kYc4LRhBEXFAs+sEppi8lURdyMHFJ4
 gX+6YEbHYVqStWyFiUODIFkB9DGRRTv61fk+/05d9LONm73m4CGIHJ+28WExuikQ4w/DPQZxpi
 OeRavd6BCqTLvOlV25WvT/gUrLIaN0w00/vX514W9d0ulFEx3FjpA8BR6JL3daSAPTW3nurL31
 C+o=
X-IronPort-AV: E=Sophos;i="5.69,294,1571673600"; d="scan'208";a="226385648"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 09 Dec 2019 18:44:52 +0800
IronPort-SDR: M5Uhuye4by+cKCEPfY6ZZvwh1UQJQHOqR9zP1zdyiTGuVe8cYgCGfrRK2dhRYQCSqc4ClGG+1F
 goa62gVVnT4aZdD8GM4VRruMYsQCrXYh5ExWSsM9bZBUdGcpMGXFQMWM4WLJUGSFRk7QFKG44h
 y/R53+Y03dM1bq0zP5BhBjT+2ZQfceU69ayDl3815J9z7RcB2J9EvIGVRxqmytLlDz7d+9wu7K
 VwP9zer8YM6asrm3MbG+SGxL38rQz5x4cbjCB4XB5EV5JF7SbxKHzEbngm3JBOexTTIZ3Dv9yI
 UXuiSojJZRALo2qIJQKfM6sT
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2019 02:39:26 -0800
IronPort-SDR: l82b6l47G49XQfmHBKefBROJv5pQ6NUjN7Hpx2n3LeQMsCBBwuXx6xqpowd8/lpvtzPfdKxcwo
 Az0Gd8ImC+7oJGIPbFSAPA1JxoaXFYgOGv59OVL0ed1k1KVKX+EveM+kThBcNi4ULNMF4oVOSa
 OE2mdHyS+FR8D+spoX42mIoJOJfzcR/KDowTuXHBgZOLJyTGrpq9uUzbTarIh3k9IjTdQTx3s0
 5RTgLjxbAMSAjU5KCIs4tsdtHMLsXFFXBEK51CljcmgwCBNMJJvDuhV1txQFJuGqDZjUrt4o4i
 XkI=
WDCIronportException: Internal
Received: from shindev.dhcp.fujisawa.hgst.com (HELO shindev.fujisawa.hgst.com)
 ([10.149.53.87])
 by uls-op-cesaip02.wdc.com with ESMTP; 09 Dec 2019 02:44:46 -0800
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Mon,  9 Dec 2019 19:44:43 +0900
Message-Id: <20191209104445.216327-1-shinichiro.kawasaki@wdc.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.1 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [68.232.143.124 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ieGXB-00FMWj-Dr
Subject: [f2fs-dev] [PATCH v5 0/2] f2fs: Check write pointers of zoned block
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
 fs/f2fs/segment.c  | 258 +++++++++++++++++++++++++++++++++++++++++++++
 fs/f2fs/super.c    |  11 ++
 4 files changed, 289 insertions(+), 2 deletions(-)

-- 
2.23.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
