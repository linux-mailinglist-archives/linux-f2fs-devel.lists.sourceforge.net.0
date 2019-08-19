Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C44491EED
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Aug 2019 10:30:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hzd3t-0007VX-1v; Mon, 19 Aug 2019 08:30:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=127c8b87f=shinichiro.kawasaki@wdc.com>)
 id 1hzd3r-0007VQ-DW
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 19 Aug 2019 08:30:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2VAN8nj6Op59/o9BBOZGvD64L4OrjcM5RCj83YUqNFs=; b=WwglPWpzMgWL6FWgeCjrt9KQzm
 rKvXmSfUUAQueimjlgczpWSwWWIwhzox7Akg7yZxrQ+duHp+eH/sdlGqTwfX1MMglA9/YJ1cYQq/1
 3UpC02zZgYRIOdbnhRpZompdo6rrXei8jo1ySGVYvhbK6y/B+tbS44PC3CkAiZYzcOpo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=2VAN8nj6Op59/o9BBOZGvD64L4OrjcM5RCj83YUqNFs=; b=L
 htFI0s6bsmcqBl8qGm9U/x4Iu8guaklTvvZciLE7hHLWItAcsdczbM7vv06w/Sp+Pc2TorGR6+vlC
 N50T2IVM5BiyUMYRlS39kjoNRlCwDxLFr5pAs5qOMAnAbGqJh3N3DiR3c395DinAgiXrpeVGCZOpp
 qyKIpia9LHBKiDjU=;
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hzd3p-008W8j-HQ
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 19 Aug 2019 08:30:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1566203457; x=1597739457;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=C8LVN5orpWAg/Anfq4yBRnD6DhO2H0WjYSjwwwG6Xns=;
 b=arzhaYuiSilUk9fv/DF6vLTPbicDznnCFAHJ9PQQkFMQArCPcGBpaRlr
 YjW9bWg2rrmYsg7pEOCw6OMO3GZ0/FkskSEiUAsw46sGRey9m/nSoEt2b
 cgiPK4fka5bWO1twCy1TSoC14wWvef+WRqy9zvHnA2zvEBh1pyAPNOtqz
 XEP+9s0uuIjgt4nfwP2kcs3eJs7i5SQOOKV62k1wUaYEGsn2fa/qzw1p6
 Q48i47SZbMiINBOzOIkVXsiekJVxlWTr13NnXCl0LibcW+OaGat638lLX
 Nx8bA80q0Jf46mRmjyQ8vLpcrCmmwZB4vp579f0bMzvCODFPL+sCSIEdb Q==;
IronPort-SDR: exWkdzIGXJ5uCJB0VMpyqzZGcW8c0eEnhBGD05wP4xjTJ9Aq43wO6Rfn/ydqbkuyn5Nsfwb9tx
 S1RoWFOJi47jYi8ETNCuOH7k0suoyI1iegIBRbLdIehalGkK/t7wk75YNBZR4mrN9bGEEaD0XB
 l2FXSjIGYwMTg4C3HZu2+ZDSwCLqHYDbCCaCTICVcq4bmaoDsFHWUb/3ssUgTZjSI4BxB0TzMw
 7T3O/RV4rYXKwNlQ2vmJZOm7m49gL7obwjXC2A6fQsSwroVl6n0H/BBob1erBQgSjqt2OPmglp
 slY=
X-IronPort-AV: E=Sophos;i="5.64,403,1559491200"; d="scan'208";a="216517043"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 19 Aug 2019 16:30:49 +0800
IronPort-SDR: kGXXgKZsWSBEw13qMEU+UMyELcLCscJrJ+/DvKGhRBVib12GczbBbMqBgkl2A/yHKSVaQl88tN
 sepeJwme59Hi6mWI8VkUUYqlUvCZBNUXuxu2P2ydN6qILl8HfWqEk06Ut7x6mqsOMeWHPg02x5
 665JrM2CmpglDq5S/C+SMo19eMS5wVAKLOheQTiIBaEVwjwMhf1aGRRxvHz9p/AO6PqaHlIlaI
 kOslT49orttdMEGPLktbKUaO6WKvQBf3tLKdnVQnxH+czpeMk3rYN4KV/MsKzJ04c9oPA/eCMX
 CP3ZMn027121nUU/AKPCtf8R
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2019 01:28:01 -0700
IronPort-SDR: qNSI9UHdGrmV2uF+geK5K21sHsjS6pdh+dN8hrs2wjyd25hy2ucrPmjUZS+3ZYoduT6+tQR2u+
 qB8B2t096c5rmfX6Rbyft4uqsRgO1L8fdg1K02i0IU3MP6emYVc9PAx+UtB91PJDINUQoy/aTh
 pvaIV+lL2EJjfmoqdpQU1YJ7huRoloOmqnzCzDo44qUaDWWAy2qjqRh1KcH/K10768OStyo+b9
 VqJM23HGnprlHeYGCDd9K2MXHQGYUkT8sYG7W0mBMGHI1ZVC1MzcNiFbVlXYs3YfobksbqJpF5
 D+M=
Received: from shinexp.dhcp.fujisawa.hgst.com ([10.149.53.85])
 by uls-op-cesaip01.wdc.com with ESMTP; 19 Aug 2019 01:30:35 -0700
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 19 Aug 2019 17:30:30 +0900
Message-Id: <20190819083034.18218-1-shinichiro.kawasaki@wdc.com>
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
X-Headers-End: 1hzd3p-008W8j-HQ
Subject: [f2fs-dev] [PATCH 0/4] fsck: Check write pointers of zoned block
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
