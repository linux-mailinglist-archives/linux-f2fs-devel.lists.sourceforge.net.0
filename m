Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C3AE6C98
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Oct 2019 07:58:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iOyym-0004dF-53; Mon, 28 Oct 2019 06:58:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=1975423da=shinichiro.kawasaki@wdc.com>)
 id 1iOyyk-0004cj-79
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Oct 2019 06:58:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KFNGX33NcbYHqMMkbJu0gdgIK68UyGIB14K2y0Z7Ta0=; b=c4JDFtNbdWottuyva2Wuj7c+yW
 1fG8uC1OxXm8zTK8S1O6uji47NriBccXKZzDuM9e9fxl9QJNNYKD+MYN5y64gVcs3ABVOYqh+htwL
 dQGClFKghHe8NkP+aK2h+kOsRAkM4ehxIzkv2oUFZQgTSeE6zoItEUSVpLaMatcDLpYk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=KFNGX33NcbYHqMMkbJu0gdgIK68UyGIB14K2y0Z7Ta0=; b=O
 hcztP53ZCr9g45EpDVb+W57KCczOaSIdjNVXyQPtCCokr86ej2if/kud9w760Fx3IXheeqn3eLZ5V
 DnkeTvTJGWNDvWn7h8XQ0rtZpGUnqxkzHMYVd/lPO2r1JFDyGgzCzT1o15Ol1ArTlkiHYQ9hoMxhW
 o3sy7BZSJL1TZR/c=;
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iOyyg-0031Si-DR
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Oct 2019 06:58:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1572245917; x=1603781917;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1N9mBro7ebcdoJeQcM4EfXA9Rdq8b8Wd5jSTSSars1A=;
 b=GvOU2cG/gYGdnTpoAPGThE6CykDndLWNkRSJ6k3lYX1t4UV4VKBcr6pk
 YD02wb8ksc9+7I1RV3Un3SD0ZO+xEA5FR7Slx55UfVIdTwa8Q3YUWfc4M
 NwdNYccGnK2Fvbuh1pyo9nw18c/3sLrCq0yV0D1CeqfMJ73qDLK0Ntno2
 xh+ol6c7axrz7/h010AIlicyZJQHiVnouCDJiQhv9Gib/9151VcyImbCP
 JcJ8BvzvHeuySnzDNN7Qacp2M/H3Ie4dwrhVpB8jgnHRlz/Tx3L2kkt0N
 qqukmokLALG2ZEEvDulhMheoZdlwov0NpBhEil1H2SRZYImgMlMbQ9UqI w==;
IronPort-SDR: xnkEJQP+2mDJdxQsxSdqiwvRLcVsPqpPtaK2wLpJteccZ2Iue4oCL6AumM+icrUisEIEDhXyNJ
 yGbqdIKjxtsXnpt2g5vL5eqgoggCzlV2RiXEk+JyBYCMbvpG35uMe6K7jBVvQk+uzNA0AwTnVj
 /Bw/nkvvjmyYxyOw5tKufNQ8l3XdRBMkdS8SHIlWl+h0+8FIplBrj65RBWwBM/QHTsf1tZfV6v
 t486/kSQjeI6/OAmYuSFwCct+Zr3TplNJfUWyq1FRsPHbqPpZlkwZUm++iQqCT/WZzUcvj7468
 qD8=
X-IronPort-AV: E=Sophos;i="5.68,239,1569254400"; d="scan'208";a="222612149"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 28 Oct 2019 14:58:29 +0800
IronPort-SDR: hu1w6y/8FQOURmZ9rgpu7QMqY0PuH1yZhkHVsbRwBLbgtjdgwfqAwdfJu8S180IQokixASv6MJ
 RHQYlQhAI7ik5UP2GdoyOlpgc9w0IAM+oORFQDO+Tw0pcJKjT3gUPEDHeZxcMYjgEbK+nxbkIe
 4N0o1P9OyDuciD3li4KO8PTi5W01vSzZf8Ih9vqbqU/a9VdXeiRGee0ez3+xidt61MofJcMaMD
 1/8vPq4+z47lSZj3Px/XcqrPyGRGt2R72ZDogJTH7LrQYqEH0Kq3O5EgMjnYpHUedawOhslpX1
 HA4X3UCBt27cmQ2ddvWgv4CY
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2019 23:53:32 -0700
IronPort-SDR: aoQZi3prEtvJ5ivbaao0SeJyoaOxe3323v+wMgNfsd+QmpkySWP1oyLT05gOH+iXF56KhBkO02
 ih1nyXNYVJq+hVyClsVH0JglOcHTrpWcEE9SeRPtdRjPj04OJoFU/FUAOnXRvKexKJFCEk+iUZ
 MgLH7ds+oSBKRBbg9R4yUcPeCYZXmZMo27glvzc+vHJrYmpypj8gYX8bvFDocHh4cMCMoZN2u7
 ysCFCtK/8cJubuXEZGkmOY4NZkn6xRciATLdE3nE18KsSMckGulimlXbPloVg/oflQhcDVLp4D
 29A=
WDCIronportException: Internal
Received: from shindev.dhcp.fujisawa.hgst.com (HELO shindev.fujisawa.hgst.com)
 ([10.149.52.166])
 by uls-op-cesaip01.wdc.com with ESMTP; 27 Oct 2019 23:58:04 -0700
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 28 Oct 2019 15:57:59 +0900
Message-Id: <20191028065801.28220-1-shinichiro.kawasaki@wdc.com>
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
X-Headers-End: 1iOyyg-0031Si-DR
Subject: [f2fs-dev] [PATCH v2 0/2] f2fs: Check write pointers of zoned block
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

Changes from v1:
* 2nd patch: Added check to ensure zones are in main segments

Shin'ichiro Kawasaki (2):
  f2fs: Check write pointer consistency of open zones
  f2fs: Check write pointer consistency of non-open zones

 fs/f2fs/f2fs.h     |   4 +
 fs/f2fs/recovery.c |   6 +
 fs/f2fs/segment.c  | 274 +++++++++++++++++++++++++++++++++++++++++++++
 fs/f2fs/super.c    |  17 ++-
 4 files changed, 298 insertions(+), 3 deletions(-)

-- 
2.21.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
