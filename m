Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0B9A11D1
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 29 Aug 2019 08:35:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i3E23-0002qa-Ro; Thu, 29 Aug 2019 06:35:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=137b9bc1e=shinichiro.kawasaki@wdc.com>)
 id 1i3E22-0002qS-CU
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 29 Aug 2019 06:35:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zpc63GmP5ixcxSZ+zadn7Q9/SuBRCFPd7WcknI0UA1M=; b=T03RxgDI2yzTd6utJ/aaRmkU4u
 2Kiz6R52Ez7qqAJfIEdvt7HwQLFlareRbi1LWvG6xstS/3jKY+MCfGVBi0sV4W0I2CFQLo2d3iPfa
 QVZN6m+A3rKR1vjDS2dOr4URSdozHU64K7rzFGH3g8MH69QyIyqJo2hEJC9t6WRW/UBs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=zpc63GmP5ixcxSZ+zadn7Q9/SuBRCFPd7WcknI0UA1M=; b=m
 /7TbuQGV/othOmrIPxgcn0JQBVns6Xxh2bWx+1GlR/NG4FZUtIYGgZZa1FRV943/7kabBf6XXgRsq
 b+CMNAA2tC4tl0yBzlMt2GKlGZaxcAqIgHNG6njYCljWEnNOCotcLHNBR8C/LmiRwfO28RCnuZVEB
 1wvdnLXsJEKaBr9I=;
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i3E20-007Wnc-Gi
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 29 Aug 2019 06:35:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1567060540; x=1598596540;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9EayetHXOar3EIvSSMJSPMpgIrMohnTHlQuvJt9MDVE=;
 b=Kv0AmErZo0ig7olQfPTMGmw5aWoKewAl93CcwitxVTdEa6yMDeB6fFnc
 TYLwpgdW3gUk+9cCWf4QojlMk+9xqZQZYsVcjHHotorJsAATZaFrokY1e
 pvEs4PAttrN1NyU0aYGx7595uYhsXqgLAv9aM3jxquzzSXP5RvuNdmJQE
 pqyryuOLiJ/W8UJ87CPlzvZl0ubV4e6j5BWBg5Hf3TlDSAY7bJqBIKick
 Re1Fk+IcVMdJx0IV1Qw7JeRuSl33HbVrRQeB/A+/K8Y/ZYAP1Typ5UY9/
 Z/fYArMcPYG4jAr8JSJiEpknoWzMf8jL7I/Objw3ZM9GXoMBzsQQMB9pZ A==;
IronPort-SDR: W8RrcqSfGc9RvXDHzfOTAS9Sk7mx4MrTD+cA+3sfMPMVA8utYk5P9EEvUmwdLMk33digjiHQGM
 nOo1FxnNiddlRpP7KIVpFSZoAFTeiCkUauoIyziBV7LAy0fVpeNQWIxWEOInjjvRaMX3ub8/NX
 wDGoDua9SMJDkSsoPIn3qjMJyB6soeqEG7Y/xSQizzU3rjRI7djCxfwR8LQVqrqpPvr8vb6Qw7
 N9pvfGb6YshVexiBqs/Qw0bh/HRm1yOHvC2+GZy1G6aep/OgUQDE4U/6nkLwUNjQhTBZ3MAae3
 jUg=
X-IronPort-AV: E=Sophos;i="5.64,442,1559491200"; d="scan'208";a="118511100"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 29 Aug 2019 14:35:33 +0800
IronPort-SDR: /FI+l9BZaabsqdOi7IqlfwT2PzfhEhDjGt/UbEKRC3VLC30bLFXD4L9ao9nJXWD8fXdfEPR9LE
 /OVD4lXnopCV5GerSGVKSYKavm+Yz9dJi0MJmX9WuNvOjbAbyx9yUecAC6b6cHiIxETwFetQ3Z
 bnzKTKiKsC6DsacokhOndMvPqnpxUx6HRTcxDIzo94Cc36GDK4EhsosxtxUItaY70yN6gl4pCX
 IFCygIkSOFwoYFYlnFe4qDDWTiMXD94FAAXvisbMKCXLs8SV8luuCOiJYPKty9afvFu+VBHWym
 w2tMnSp1ga0tSMI++xOj1hqC
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2019 23:32:41 -0700
IronPort-SDR: 4nbNPQAagWEBxBGb2CnqF2s8fv3gBSdzTu+E1gn7lCpY9KNH5UHPv0R3lUtXjdhS4b/eZQ1wvM
 3rWwNQq4Hoof4KI2FmLPV+LlECNuZsgObPNHypkjLg7pcpt/IesT8az70GA514pfS122uiIp98
 4Hush4Yyv4D7YLJgxgM2S35ZZenLDu85qIHBWjHVPO5ryW4yOU2PrdIqaoEVH3o5EwuzgktCXa
 ofNR2JcIqd2G8l8b9WBfRy51u9nF7+VCIZcTmMe120Zt9+gyNgUTWrU4y9q8vit9vuNvSJ5Hji
 DMw=
WDCIronportException: Internal
Received: from shindev.dhcp.fujisawa.hgst.com (HELO shindev.fujisawa.hgst.com)
 ([10.149.52.166])
 by uls-op-cesaip01.wdc.com with ESMTP; 28 Aug 2019 23:35:32 -0700
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 29 Aug 2019 15:35:29 +0900
Message-Id: <20190829063531.658-1-shinichiro.kawasaki@wdc.com>
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
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1i3E20-007Wnc-Gi
Subject: [f2fs-dev] [PATCH v3 0/2] fsck: Check write pointers of zoned block
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

Changes from v2:
* Reflected review comments by Chao Yu
* Dropped 4th patch and 2nd patch (2nd patch was required for the 4th patch)

Changes from v1:
* Fixed build failure on dev branch

Shin'ichiro Kawasaki (2):
  libf2fs_zoned: Introduce f2fs_report_zones() helper function
  fsck.f2fs: Check write pointer consistency with current segments

 fsck/fsck.c         | 131 ++++++++++++++++++++++++++++++++++++++++++++
 fsck/fsck.h         |   3 +
 fsck/main.c         |   2 +
 include/f2fs_fs.h   |   5 ++
 lib/libf2fs_zoned.c |  59 ++++++++++++++++++++
 5 files changed, 200 insertions(+)

-- 
2.21.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
