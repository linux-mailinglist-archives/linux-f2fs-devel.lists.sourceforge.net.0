Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C53D6A34D2
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 30 Aug 2019 12:19:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i3e0S-0000Mc-L0; Fri, 30 Aug 2019 10:19:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=138d41eff=shinichiro.kawasaki@wdc.com>)
 id 1i3e0Q-0000MT-AU
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 30 Aug 2019 10:19:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IqhhNG6WLDF+sEkOZ9rAIBa+j+1b9P3HVL3QmkMiSbA=; b=fZPPkDTXhNR6vt5yt4oWKCS0nF
 WbHT0oKlUmDt/+P2Hdq5jDlZvmMseUgy2p4jyqW5qOsmOdK8YK6pNwnQMrKjaXrCqG3b57DaSWI3Q
 kI4vBNKNW5LIA89eCCwKXWRODltY3c5hFzpXTGx68U0TJP+0VFpDNtzy1ibmy0GWWDA0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=IqhhNG6WLDF+sEkOZ9rAIBa+j+1b9P3HVL3QmkMiSbA=; b=e
 jsu3U+03mkhMXuPxuj1bKFMZ14sH8607OCuJBigDuInvfyg85YKBed/JIyFFEPJqEleGL8G4rfem9
 4E/+8FxkiiG+mGalW+BdkFpEsIKjegTZCrvqeS+pcsz6+tCziml1gPbHDagz8eTS/QdaBG4356emg
 EEsWR6CIT5cNU+1M=;
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i3e0N-003H6t-SK
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 30 Aug 2019 10:19:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1567160383; x=1598696383;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZCkJ8abBBVDMxRfEQwrb6gWfp3mMkHXd+iNKyFpUYsM=;
 b=FUTwUvzFDkkpdEJmAsgMp5k3GnvnO2D7Eu1TAdUgCFZEtCholbqSHbbi
 XuR480ak427iAwOpC7lsVtAtChnVNLWHDIdBQpl/wFrLjvYmgMxENqU50
 BxZ/TgfZxV/WuHSdrAfynvMrgq2J6s33x7+8ozBwKFjrccDcnYBVRjhC8
 VRHK13i1KhIqjGD3n6EKHRGKLuD9s1t7g/cTvJX9xFYOQDvHguEL3TFxE
 eG7ipOCajalAI1DD4OciW+kNwK//7LrDhv9v5aR1IWsiznWSInYO+qd1S
 LSV9s0C7nQlMU7Q55suZf3AkbJxA2VfL++SWg5pSWahqbc8RcyJH+pIQn Q==;
IronPort-SDR: rTS/M+Bz8D53emTB6eRO9CMLZDJJ1WnLhzoOppP1dDXdKnA+o0PId+NqVxaB32h24oAhm8OUEo
 s0N0JHAZ3aOa1swC6vlxahX+NsutdUBgf9Gh5+qPfWUnmLt+mGQXxyX67k1hwwDLJAwnt4TJ34
 480mivGyLNym9rJUHm7cBRxWBXyi5OcXOsHRm/NRgxg1TCvG3E4J1LRa02/I+vrTuOjX0NGY1z
 SdIT2BxBjiKEtsn5NNTkVXsElGbeuO+gF/snUlzWYLw5/g8dfYlfoIYH6HbY3DHwj+fijMaNKz
 8ww=
X-IronPort-AV: E=Sophos;i="5.64,447,1559491200"; d="scan'208";a="223697491"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 30 Aug 2019 18:19:38 +0800
IronPort-SDR: iXeeexS3/GOLhEngX2rVWOwpwZUYYXYz7exiJjNVNldgDpu1Uoj6fiOefCM+ITwEBGjRSxYqxy
 VmkI1Jf5Q6vc9mom/souAlBsupeBMaqFrDc8eTpD+Z1EYQcucMDOOJs2YZzCeGZMai6LVMEQkG
 agbWSskA32lXdtLT5u8t5UgwqASEvEPHBJu9OfIb4c+tw6xahHfX7669aZzQcsBLOYH+tC4DjW
 pVK4SlK/mGKYfsXFalpiM55AvieH4tjSlLfovAcGcMQsshySmv4SaZqPjpCxWI6FxgmFfuyqFy
 HPViKkESy/GqRID7Tq7plJbo
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2019 03:16:44 -0700
IronPort-SDR: R0TX4HlzS/5PZHbBzPtLCTcNKVXMmMPJOQ4zs9fYaPoLbmHTqqMRQ2I6lP1+zTGdV7ETwKIRgt
 1QMt/lf/17YJsGlW+HwSSmLdR/QY1MOn1DOMkS1+W8Rp1n8IF3DfvO6ruGb5UtJYAMWxju9h+3
 mGZOHD9hLaeae6iRxJjvDGc3rVEYSs5WrMcub/wSuq+WpqWjytS0+y8lxggIaopd8rqoYEpY5n
 2HweI8/bfLNkcTfRSfl+TKg8ITJZRzvWR+JsQSnTqEqhRhJnSz0GpUEnXeqHHvZn7kVgNeSlQE
 hCQ=
WDCIronportException: Internal
Received: from shindev.dhcp.fujisawa.hgst.com (HELO shindev.fujisawa.hgst.com)
 ([10.149.52.166])
 by uls-op-cesaip02.wdc.com with ESMTP; 30 Aug 2019 03:19:38 -0700
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 30 Aug 2019 19:19:34 +0900
Message-Id: <20190830101936.32265-1-shinichiro.kawasaki@wdc.com>
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
X-Headers-End: 1i3e0N-003H6t-SK
Subject: [f2fs-dev] [PATCH v4 0/2] fsck: Check write pointers of zoned block
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
progress. This inconsistency will eventually causes "Unaligned write command"
error when restarting write operation after the next mount. This error can be
observed with xfstests test case generic/388, which enforces sudden shutdown
during write operation and checks the file system recovery. Once the error
happens because of the inconsistency, the file system requires fix. However,
fsck.f2fs does not have a feature to check and fix it.

This patch series adds a new feature to fsck.f2fs to check and fix the
inconsistency. First patch adds a function which helps fsck to call report zone
command to zoned block devices. Second patch checks write pointers of zones that
current segments recorded in meta data point to.

This patch series depends on other patches for zoned block devices, then it
conflicts with the master branch in f2fs-tools.git as of Aug/19/2019. It can be
applied without conflict to dev and dev-test branch tips.

Changes from v3:
* Set curseg position at a new zone start when its write pointer is at zone end

Changes from v2:
* Reflected review comments by Chao Yu
* Dropped 4th patch and 2nd patch (2nd patch was required for the 4th patch)

Changes from v1:
* Fixed build failure on dev branch

Shin'ichiro Kawasaki (2):
  libf2fs_zoned: Introduce f2fs_report_zones() helper function
  fsck.f2fs: Check write pointer consistency with current segments

 fsck/f2fs.h         |   5 ++
 fsck/fsck.c         | 198 ++++++++++++++++++++++++++++++++++++++++++++
 fsck/fsck.h         |   3 +
 fsck/main.c         |   2 +
 include/f2fs_fs.h   |   5 ++
 lib/libf2fs_zoned.c |  59 +++++++++++++
 6 files changed, 272 insertions(+)

-- 
2.21.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
