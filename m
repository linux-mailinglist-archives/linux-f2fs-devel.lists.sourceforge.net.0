Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 741A6FC163
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 14 Nov 2019 09:19:22 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iVALS-0003D4-IG; Thu, 14 Nov 2019 08:19:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=2145628f9=shinichiro.kawasaki@wdc.com>)
 id 1iVALQ-0003Cb-AR
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 14 Nov 2019 08:19:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eB0hidW3GStaB2eETvXwfYpnPDFbXffueAPuvEftkLE=; b=RtXi0Y4dPN2lglTJz3gmPK+RwJ
 Ek3GSpFiUq37tr211koTa/Bsxr7NvnsCoGqWpGrorbyP6HbJTU5mr+d5Y6bvMxAKwKUlav7thfOfe
 L/Bi25Zv46nBqMmoaB40ZjkkNY93y9uQkStcavXZfDlWuB/EI5y+HMt+1G4fs9kCYkPg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=eB0hidW3GStaB2eETvXwfYpnPDFbXffueAPuvEftkLE=; b=F
 conOigVPCcdpY49Kt18CctHpf57tED2adM0f6U4M7Pa75HlOgmodxuYomYk13YdTUwVoPQIBCjdvN
 5IM1j2EGFJgFUhPmVi7KSWUnCpCRgjeRgPEb4pJfyKSm1eGYveXrEuN4ghs4VcBfjIuHDCzlVADk5
 MJ8iSKL/1PmGages=;
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iVALP-002o7p-2s
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 14 Nov 2019 08:19:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1573719551; x=1605255551;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JM9kN9C52M4aH7sDXRBDfIjAVe7XgMJdl83V2NAvgKk=;
 b=Ab1aswBsoc2xy75B/Jt+XC8LTK60t42i8lmmQ6157EOvy8s29Ll4EYri
 +rzddyjEGsM6k+cZR3x/ux9Y+069S+98vLpqOofuOBnXGjqgQRN9WJ+1g
 WUOn+0F60WAmMX2zjwLz3+Pgx2uPhlH8ovnfIn8M2IScvPmMF8VznCjPq
 /69/mOrd3G9S6ZEYKkJ8muwK1ZBn/PE2gXpDkV/NaYpW9xy+QiQ/GGYqY
 +vpU4taU2I6nciShE14pvC+5Ztjjq595H/yL/7urIRY52m1ZR+MDn4Jsv
 IokuFUa/FIdFHg0ZHJdHc1QAhVJbPkLfHcuIsexhixHCIv8N8X8kGVPDE g==;
IronPort-SDR: PitmQURJd3evKtIXI74FYQ/05dpFyPKfvCdI195uHfNSiirxxWt4QEPTy85jIEXWjzJp0o0oI9
 vMiyaIYg0UOjlzdOzDYFxABpiCunDz/cqZcsOLrRznd+QvKIVmllbfP/qUpo73oGVO/EJBosDn
 IZFeVoGDnvWeWu8jn8oKpKRL8lexpkLp1U1EectdcKT0Nkmm29dYholbw0Ldu9VlKGU+w15a9g
 5PwB/7JikvDrVXGB5AfmhhiXZm4mu1i2DaqrC3cKPTAvqOETr4zjK1/6KQF+y8tmXrnTZhVFQc
 UJE=
X-IronPort-AV: E=Sophos;i="5.68,302,1569254400"; d="scan'208";a="123753818"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 14 Nov 2019 16:19:06 +0800
IronPort-SDR: e9B4OTsVxH7uN7x3dOuAlb67HEgp+yaIO0wjPJ+dC1Zx0HfHplAqkG3OkY3t95FqNlvlQcyIuP
 rDa8aCkbA1WLH+zE991EKRkzb/zhyZZsv1lYMFJmF32qp3jXlBqS3jmut1SUj9aTK0KTchMEb8
 VaSclvH9Aak6fhlzvxW8v8WD1nF3u8ZpkHK6tYYXwqiPn34G2mrYGYjsFZioTwaHIYJjX9aeEH
 NLAxox2FJteS+eXs33aehQArktahOxrahJVzzZqja2v5IDCtvT1vr2284RUzUI0zJGVrU0fV8j
 y36fbADPeX3iLt9Vt/GG3DDf
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2019 00:14:04 -0800
IronPort-SDR: HE40wcBHYNGmvZNH0LoHs2myCzT5YJejBebKGPIehvkDWNHUBG4M+eT5BrYrWdrFJgbGATwy45
 WyZDkJgBnLMJr78zFgd5XP4zqC74WhQ/mliUCzAT79gu/lfl+364bL9XIDNRlYRqa0UWbneeDe
 TX7x1ahKCGGDcqJdkL2VAUy0Cef8eKVCCh7PI4SU2w45mIlw2wHEYEipUF4dCn7uHm+jrCReO9
 Wvmr3E2xk14xpwcFmmA4aBsKM5bIdOApI2+bybGrGBFlAsvURsOCRHlaV1cJABUE8QZpAXFj03
 ZAI=
WDCIronportException: Internal
Received: from shindev.dhcp.fujisawa.hgst.com (HELO shindev.fujisawa.hgst.com)
 ([10.149.53.87])
 by uls-op-cesaip01.wdc.com with ESMTP; 14 Nov 2019 00:19:05 -0800
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 14 Nov 2019 17:19:01 +0900
Message-Id: <20191114081903.312260-1-shinichiro.kawasaki@wdc.com>
X-Mailer: git-send-email 2.23.0
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
X-Headers-End: 1iVALP-002o7p-2s
Subject: [f2fs-dev] [PATCH v3 0/2] f2fs: Check write pointers of zoned block
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
inconsistent, report the failure. Even if fixes are required, do not have kernel
fix because SIT consistency with CP is not guaranteed because of hardware
failure or software bug possibility. In such check failure cases, fail the mount
to ask users to run fsck. Corresponding patch series is being posted for
fsck.f2fs to add the write pointer consistency check feature.

Thank goes to Chao Yu for the detailed discussion on the list.

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

 fs/f2fs/f2fs.h     |   4 +
 fs/f2fs/recovery.c |  17 ++-
 fs/f2fs/segment.c  | 269 +++++++++++++++++++++++++++++++++++++++++++++
 fs/f2fs/super.c    |  16 ++-
 4 files changed, 301 insertions(+), 5 deletions(-)

-- 
2.23.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
