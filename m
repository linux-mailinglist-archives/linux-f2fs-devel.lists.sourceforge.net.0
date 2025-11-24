Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A8248C82DB8
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Nov 2025 00:48:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-Id:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2MQ3E/5+0PJzC4cFUqKu3frVdpYNQ6H3PYRF/t99XPo=; b=AoYqN9aEiQ5Ilu9WaiR4JzdwNw
	uqGailiubBpGC/5tVRLI/mdErJrQQ34X+ptxMbC3JbK6kWbcylQtZ11ZYAUwq/cEQH5N7lTSQqqXs
	SU0+O+v+QTJx0m8NHuJOc1qu46RWXmGsOm5ux9tlkuu/rGHgCw9ICyxiMckd0Z8ZumMs=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vNgIM-0003Zo-Q5;
	Mon, 24 Nov 2025 23:48:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ckulkarnilinux@gmail.com>) id 1vNgIK-0003Zh-FH
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Nov 2025 23:48:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=L8zwVcuAssRnEQZ8e7ewIMIsPfvOXMAA4RWGmHyZ+Rs=; b=RBpYXHXMD7k/Osy2Z7GSgcyLql
 p4DpfHKO7H86ObnSRU6Nw3NVwPY7Udyoi8udEgT70o5UlS/aY4CMFvTrwpssVoFBJFo14MvGC4KkQ
 B6srqBpB5UwOG0fkOcTvn3Z1bnIkTlnkhK16KAgLxbMPYfPpDpDoRG10Bcw2Bs4Unq/4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=L8zwVcuAssRnEQZ8e7ewIMIsPfvOXMAA4RWGmHyZ+Rs=; b=V
 3PxyFleSwtRdVjnL23XnA/1Bp17tOZCzIvv3DebusCWD+XUtcCsnDDM0dxV/rSflUpqx/65w+fgxq
 81EhHre4lPp6IBONyelHm69PCcpkjB7B4a1wdbNUxKxPgaSC0NLb/mvO15cDBbjDfdQTSniF9joPR
 hwOsYxUah52/cWJw=;
Received: from mail-pf1-f178.google.com ([209.85.210.178])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vNgIK-0006KV-1y for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Nov 2025 23:48:32 +0000
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-7aace33b75bso4535568b3a.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 24 Nov 2025 15:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764028101; x=1764632901; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=L8zwVcuAssRnEQZ8e7ewIMIsPfvOXMAA4RWGmHyZ+Rs=;
 b=Dnof5Z7k71TFDJsm4IX67ey0k2A7vgk2IuNzZYHMociwCorbTm3S/n7o56HQYctv7D
 +ql+N9TuXf3KUIHD7nzOG9MdLovBy1aBrF17gNDj8px86mqSSQsNqUUorvBLilB0I9BS
 RBVksPZ1fNXV0yCn5JZH+VHUwZCSwzxUtCamLgsbs/J5UWtrhnGhczheIhUCffEIVLju
 oMIKA4gbWh71Uj407cSyi/cIz8CDjaARj1svGa77F033KVzUnYOmOFlMlrv81pNT6KaC
 F5drQcnESMdqpkPmcfRkgGKPHI3RXJGJkaR1OZfIOGaA6vB1f1vVS76mCMeSoPT7PmnZ
 YRIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764028101; x=1764632901;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L8zwVcuAssRnEQZ8e7ewIMIsPfvOXMAA4RWGmHyZ+Rs=;
 b=o+mgIfoSf8Llp7I8uL/DWXqiSSmSkMuvqr7zt1BxheD9uUDqd+B9wm9FEDoYuPd3Zj
 ykzaw0OrhbMLqMlJ89RUyu1ytlZTzkFxoa0d3MbPjLwYfnK5NbQIkhH4IpenxqblAK8n
 kK5wJDEIBoYq7A3jBoEL/kzZ5/xg0QaGSPCgniorK3cv5Ac1zGz+n7mePG2GaFLV83Ep
 h/qXwkLiY3TO1M+zd7xMneG7iTpVIpVujhDR7dgB/8WHdK/3FFQzvRln3i91ueuNVvKB
 qTdIDLQ8KhqVvkQTW7wIUM+LyD+QxGWvT7cICsB/k6HkaSNc4f/Hfv1ozzkvg5PfDo3o
 Rafw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKAGBKWrpOmjUixxUzkPdo+I6Y9fAVwB7GG9ufMKvynOplFbkRn0zGYHn7s+gEtWD2RCysrOBwl01ArLjHe4Rm@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxPK1FRL5eVnGRnRYkjHPmndo0fGRwZFO5udDrYHJeknuhjjJC+
 Z7qa6JVQJ5mJ40Ep6KUOUdlS7m9pWtV189u3DobYybU1X82Ja+yIraxk
X-Gm-Gg: ASbGncsXZKuTpLyHe/EOifHezbnUM6DkQ1JP5hb+s8GRsgqSxn2fWHAiLPiRIi+9Ygl
 H6k2UjacWDEAbaXDPYkfitIi2rABCVmt47b6Lg7tVdTe6GhJzEjWm0mwvicrSgXGHA4YJxacI/B
 H7hNa/O0IWCaAGAtWnfyXaAAglWHe2TaRR8w+fGgQP45dBV6aHh1nIzF5B3+/yetrkISYJcoQn5
 F3i9rk60V1/RUXU+KxgJT9fBZyal7A93rzeD0Jf8dBz3hbpM2y6Z8uzkEgZN97HMSWzEmS9u8yk
 5wloQ2wh6wdSJwJb2499uCbDMZ4mb/boepInlruqx4mijlh5t0a8JeM/XmnCQa+waj7VeBN1YmC
 fkKfv6FzSPtGRY1e0APXv3ZRpx62+7N/R6ZB+v5TFoJYNn4vtG5tUgAk6w791PrHjcyGgBkeEoO
 2mOsoZO0ZJDIStyxvmep2K8OtaAobLj5ADYQ3Zdy59BKcLXUU=
X-Google-Smtp-Source: AGHT+IEWVgvs7HfQh1Jftv0/sg1EMetPp1p1pbe1p7lp0IBRgw/xws/S7S4QHSHoK5/x2kKFyy9WJQ==
X-Received: by 2002:a05:7022:1093:b0:11a:2ec0:dd02 with SMTP id
 a92af1059eb24-11c9d85fed4mr7996088c88.33.1764028101157; 
 Mon, 24 Nov 2025 15:48:21 -0800 (PST)
Received: from localhost (ip70-175-132-216.oc.oc.cox.net. [70.175.132.216])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-11c93db556csm74670928c88.1.2025.11.24.15.48.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Nov 2025 15:48:20 -0800 (PST)
From: Chaitanya Kulkarni <ckulkarnilinux@gmail.com>
To: axboe@kernel.dk, agk@redhat.com, snitzer@kernel.org, mpatocka@redhat.com,
 song@kernel.org, yukuai@fnnas.com, hch@lst.de, sagi@grimberg.me,
 kch@nvidia.com, jaegeuk@kernel.org, chao@kernel.org, cem@kernel.org
Date: Mon, 24 Nov 2025 15:48:00 -0800
Message-Id: <20251124234806.75216-1-ckulkarnilinux@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, __blkdev_issue_discard() only returns value 0, that makes
 post call error checking code dead. This patch series revmoes this dead code
 at all the call sites and adjust the callers. Please note that it doesn't
 change the return type of the function from int to void in this series, it
 will be done once this series gets merged smoothly. 
 Content analysis details:   (0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
 [70.175.132.216 listed in dnsbl-2.uceprotect.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [ckulkarnilinux(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.178 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vNgIK-0006KV-1y
Subject: [f2fs-dev] [PATCH V3 0/6] block: ignore __blkdev_issue_discard()
 ret value
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
Cc: dm-devel@lists.linux.dev, linux-raid@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 Chaitanya Kulkarni <ckulkarnilinux@gmail.com>, bpf@vger.kernel.org,
 linux-xfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi,

__blkdev_issue_discard() only returns value 0, that makes post call
error checking code dead. This patch series revmoes this dead code at
all the call sites and adjust the callers.

Please note that it doesn't change the return type of the function from
int to void in this series, it will be done once this series gets merged
smoothly.

For f2fs and xfs I've ran following test which includes discard
they produce same PASS and FAIL output with and without this patch
series.

  for-next (lblk-fnext)    discard-ret (lblk-discard)
  ---------------------    --------------------------
  FAIL f2fs/008            FAIL f2fs/008
  FAIL f2fs/014            FAIL f2fs/014
  FAIL f2fs/015            FAIL f2fs/015
  PASS f2fs/017            PASS f2fs/017
  PASS xfs/016             PASS xfs/016
  PASS xfs/288             PASS xfs/288
  PASS xfs/432             PASS xfs/432
  PASS xfs/449             PASS xfs/449
  PASS xfs/513             PASS xfs/513
  PASS generic/033         PASS generic/033
  PASS generic/038         PASS generic/038
  PASS generic/098         PASS generic/098
  PASS generic/224         PASS generic/224
  PASS generic/251         PASS generic/251
  PASS generic/260         PASS generic/260
  PASS generic/288         PASS generic/288
  PASS generic/351         PASS generic/351
  PASS generic/455         PASS generic/455
  PASS generic/457         PASS generic/457
  PASS generic/470         PASS generic/470
  PASS generic/482         PASS generic/482
  PASS generic/500         PASS generic/500
  PASS generic/537         PASS generic/537
  PASS generic/608         PASS generic/608
  PASS generic/619         PASS generic/619
  PASS generic/746         PASS generic/746
  PASS generic/757         PASS generic/757
 
For NVMeOF taret I've testing blktest with nvme_trtype=nvme_loop
and all the testcases are passing.

 -ck

Changes from V2:-

1. Add Reviewed-by: tags.
2. Split patch 2 into two separate patches dm and md.
3. Condense __blkdev_issue_discard() parameters for in nvmet patch.
4. Condense __blkdev_issue_discard() parameters for in f2fs patch.

Chaitanya Kulkarni (6):
  block: ignore discard return value
  md: ignore discard return value
  dm: ignore discard return value
  nvmet: ignore discard return value
  f2fs: ignore discard return value
  xfs: ignore discard return value

 block/blk-lib.c                   |  6 +++---
 drivers/md/dm-thin.c              | 12 +++++-------
 drivers/md/md.c                   |  4 ++--
 drivers/nvme/target/io-cmd-bdev.c | 28 +++++++---------------------
 fs/f2fs/segment.c                 | 10 +++-------
 fs/xfs/xfs_discard.c              | 27 +++++----------------------
 fs/xfs/xfs_discard.h              |  2 +-
 7 files changed, 26 insertions(+), 63 deletions(-)

-- 
2.40.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
