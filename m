Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6556797140
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Aug 2019 06:48:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i0IXc-0000JX-QX; Wed, 21 Aug 2019 04:48:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=1294c0c7a=shinichiro.kawasaki@wdc.com>)
 id 1i0IXb-0000JQ-IW
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 21 Aug 2019 04:48:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=S8pMpqHTWvD0DEJOdhseODZ8OruETsJzMLbJB/Ou/bQ=; b=m6xo/c0T4h+dEwF2vbwRTvbBJC
 DQM3Y+rmzL+4e+GKX+DUlDsPSqQ76V9zcw8u56LqWRIKwcvIozssgNP/6oLLZuRqMhHqWP9qYjP+q
 q9p4DzX+OJZtSPCD2xjTkzf5Sxt5VsAo0eMCfVesV1BLj/LiWhWn020QX+m9WxhG5cfE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=S8pMpqHTWvD0DEJOdhseODZ8OruETsJzMLbJB/Ou/bQ=; b=J
 Rv+FPMcrnrKiq4bptptXFDP1ODZm0KqE5WQ/1FxXzAOaaRZmbkbCMh8Eg/42m9N4y4+PiKBLVVAZJ
 YCL2Cc2Z/zCGh9irDlHaIFK8c7AQLlltlpP1Mg55pUcNBteUXEmfKUtaWSeL5XJF0LI/TBOG8gB5X
 seRFSL3IPtXP/NKY=;
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i0IXZ-00AeS0-Dl
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 21 Aug 2019 04:48:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1566362889; x=1597898889;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aWVGEDrBFMxQFHbxNP3D7zzQTvKs0XaOZ2Ra/RPHbnM=;
 b=NSPQx8wvGw6iTKItee2b9xwyVbxjRnUd/OY2Xnortg8hdlbzgCeeGBwE
 gnC/4ykvk6R/FGp5PeyL/o8Jk4vaLM/S4hERKQQ/lmVBk1uxigWorg5I/
 Yn0b9tK6o9yI45kG/UvH2ehQqMTb9Ml6bWhNtdaKkWQ5zT2VFkaKT3/mW
 Gx1G6PICv3cCEmiuiQqoysOyC1tLtiHyFTKx4GBgqQFNWCP/6kaALcGsB
 M/6fK2eOT8u9r/moafOTE1CP/oT+KqoLryaOOHEiqc8YqWOY3WDlo9D1Q
 9W1KajxCLion561mXTJkCaTL5oawXvQYuM/vTGIkz/v0C9PKUab5SHCtR A==;
IronPort-SDR: XU5UrYmfBbxASKBi0yVJ2sBZK8EFSkoampYqsz1LXT3q7t2buPqrJy5XV1R6O0AGmTfqmVOlF2
 Ell5H7/ouasziPuW8ZtnalvPsVH9Nx3D/7VKc3/R0xIGLjigdDWY59inmXA6pLvJQ1iNm3twPB
 CT4Cs93LrlEG0hvSCjgi2wDf7Wmx6YENARvjhzj8Mu2tL8umC4IQNBsYEDhWbL/PNDAkF2P1fy
 4eZNlyUqp7Za1ePFjYz9LJu2Cq/zzub+T2QXjQpKucAVjW5B+5dWLbXJrBYQIyzoPuYS89uije
 40E=
X-IronPort-AV: E=Sophos;i="5.64,410,1559491200"; d="scan'208";a="222876199"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 21 Aug 2019 12:48:03 +0800
IronPort-SDR: eQMO0Z1NCbmDNeTafOkNBeeIym+1a+3Dfp6/7aNyEDtli2fEqpOy9VzgPiZLuYyhB0DdgOIwKD
 ZVOjhAfrbtdK6tRdhxxa7OBYhphLtIsVsRok2VkRD+w7EI1ukQ+fJ03bWJMloK+yOIpqn/8yb4
 VAeadBQUUFA3LKK9TgXP19XVTK8ZXI/4vnTlWXl+q33yM9Vcyu1Lc3ypCMzselwS2RkSJIeC1I
 AeEljy1sOzUocw/eeUtCLe7zkbESxdAaZQkS+IIUprck8D5EETtDlWImdu88Q9PZAqUuyQenfj
 wguMjOg2UDPlijVf+PTWw5VN
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2019 21:45:25 -0700
IronPort-SDR: LP7163Db+3H2u93hC6Mm/Rt1r3sc+C0kiG+gKg+mttE20pnwy1ckGQTajISNzXEjjv0ehTjn9O
 OW+78b2NoEaER+9FVHnHxw5Sh0gzzw0CaP/ex3gdCwIjNzxP38QdFCrNyFkUn/bYbiwlQmQoEz
 6mB2RAWlv5NvgGFPyj9WYx8QE5q5X92P825gfUAg3m8eMobkcdwxAH0quBZ0rdFmgmlB/jLLFr
 lNzSZAlc3xP8YpQ9sfw8yV5eIz1L9miVIeNDvNKVAmHWkzIHQ07Ge7MiycA/WBSukYNfgvJRfz
 vSs=
WDCIronportException: Internal
Received: from shinexp.dhcp.fujisawa.hgst.com ([10.149.53.85])
 by uls-op-cesaip02.wdc.com with ESMTP; 20 Aug 2019 21:48:02 -0700
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 21 Aug 2019 13:47:58 +0900
Message-Id: <20190821044802.29702-1-shinichiro.kawasaki@wdc.com>
X-Mailer: git-send-email 2.21.0
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
X-Headers-End: 1i0IXZ-00AeS0-Dl
Subject: [f2fs-dev] [PATCH v2 0/4] fsck: Check write pointers of zoned block
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
on the device go forward but the f2fs meta data does not reflect write pointer
progress. This inconsistency will eventually cause "Unaligned write command"
error when restarting write operation after the next mount. This error can be
observed with xfstests test case generic/388, which enforces sudden shutdown
during write operation and checks the file system recovery. Once the error
happens because of the inconsistency, the file system requires fix. However,
fsck.f2fs does not have a feature to check and fix it.

This patch series adds a new feature to fsck.f2fs to check and fix the
inconsistency. First and second patches add two functions which helps fsck to
call report zone and reset zone commands to zoned block devices. Third patch
checks write pointers of zones that current segments recorded in meta data point
to. This covers the failure symptom observed with xfstests. The last patch
checks write pointers of zones that current segments do not point to, which
covers a potential failure scenario.

This patch series depends on other patches for zoned block devices, then it
conflicts with the master branch in f2fs-tools.git as of Aug/19/2019. It can be
applied without conflict to dev and dev-test branch tips.

Changes from v1:
* Fixed build failure on dev branch

Shin'ichiro Kawasaki (4):
  libf2fs_zoned: Introduce f2fs_report_zones() helper function
  libf2fs_zoned: Introduce f2fs_reset_zone() function
  fsck.f2fs: Check write pointer consistency with current segments
  fsck.f2fs: Check write pointer consistency with valid blocks count

 fsck/fsck.c         | 161 ++++++++++++++++++++++++++++++++++++++++++++
 fsck/fsck.h         |   3 +
 fsck/main.c         |   2 +
 include/f2fs_fs.h   |   3 +
 lib/libf2fs_zoned.c |  81 ++++++++++++++++++++++
 5 files changed, 250 insertions(+)

-- 
2.21.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
