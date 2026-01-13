Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8C3D18A2C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Jan 2026 13:09:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=igSpE/xOgsBzRkwLIH1fpK68egd3Bv3JRw6IQFMxPWc=; b=Y/6+0fdTp4MjEXkBMj43Y698cE
	6ZapZcyudDKfix4dU2Dac6DAGR4JLrmCPfzsw+xdb0ADCkPbjvIw1/FO4xQaxfOk1d3KMWgt3Rpqt
	AHOkdi3/TK1FqgdkV2PtWBxDnx9BmmFE/asFi2hUPI9/4/Yzmb+UX730CHUuLc4XqoMw=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vfdD2-0000sQ-Km;
	Tue, 13 Jan 2026 12:09:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <monty_pavel@sina.com>) id 1vfdD0-0000sJ-Fp
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jan 2026 12:09:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HVWqs1gkSJL6JPNWhcygtpITa+nOL7SxrmYhqlFmYwc=; b=meqYNv552hrSm/b33u4RYNQoA3
 2hN0CrpjUg4QOp4tSsWq5qiWXv1vSYaBNCq7HA83/Lwwo5rywNLT6xVFLpJDbVuUMZ1WrHMDx2p7n
 iAICXqXczc8tFd3OukSD/k+GPsmdElWyE+f733SUPFAvGNaOYFBYPgXq+p/IjKphVURg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=HVWqs1gkSJL6JPNWhcygtpITa+nOL7SxrmYhqlFmYwc=; b=T
 +IX3Zh1bunw0MBy2d1cxfpPc84uKenY5NFH7IoUPoAQaj4e/d+aWooW2H8sUCwcAqFMi1pT+JePap
 NWUvdkDod/WMm4LgxuuHlkuq8hr2A16gLcUaXSghAPAxL6jcTmqeKGHoCK5OBqK5GM482OFdVqQwV
 O+i2rhWCtEyw+3DE=;
Received: from r3-17.sinamail.sina.com.cn ([202.108.3.17])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vfdCy-0008Cl-La for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jan 2026 12:09:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208;
 t=1768306152; bh=HVWqs1gkSJL6JPNWhcygtpITa+nOL7SxrmYhqlFmYwc=;
 h=From:Subject:Date:Message-ID;
 b=rS6qG3SCAjxWuDUFdXIiqJYeO8Z6khyZ7g99yD+wyjhkTj5zexbyaRM4cufA5nMUp
 2Sgv4l3D5EKdB/QqpIcagLcnnfXtvcEinaS+a/r1ui96Cpf9Vjr8FAJFHljPNIQHah
 xTy/pSM+WyskMfQcr1dAo5Brtp7AZ9gEUH+LXZS4=
X-SMAIL-HELO: xiaomi-ThinkCentre-M760t.mioffice.cn
Received: from unknown (HELO
 xiaomi-ThinkCentre-M760t.mioffice.cn)([114.247.175.249])
 by sina.com (10.54.253.34) with ESMTP
 id 696635D90000401A; Tue, 13 Jan 2026 20:08:59 +0800 (CST)
X-Sender: monty_pavel@sina.com
X-Auth-ID: monty_pavel@sina.com
Authentication-Results: sina.com; spf=none smtp.mailfrom=monty_pavel@sina.com;
 dkim=none header.i=none;
 dmarc=none action=none header.from=monty_pavel@sina.com
X-SMAIL-MID: 7433086291922
X-SMAIL-UIID: 2663B522F6CE432B8431044AC2167D40-20260113-200859-1
From: Yongpeng Yang <monty_pavel@sina.com>
To: Chao Yu <chao@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Tue, 13 Jan 2026 20:08:35 +0800
Message-ID: <20260113120837.215336-2-monty_pavel@sina.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Yongpeng Yang This patch series addresses long
 checkpoint
 write latency observed under workloads with frequent metadata operations.
 Analysis shows that the main bottleneck is high synchronous read latency
 of NAT bl [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [monty_pavel(at)sina.com]
X-Headers-End: 1vfdCy-0008Cl-La
Subject: [f2fs-dev] [PATCH 0/3] f2fs: reduce checkpoint write latency under
 metadata-intensive workloads
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

From: Yongpeng Yang <yangyongpeng@xiaomi.com>

This patch series addresses long checkpoint write latency observed under
workloads with frequent metadata operations. Analysis shows that the main
bottleneck is high synchronous read latency of NAT blocks during checkpoint
processing.

The series implements the following improvements:

1. Add flush time stats for NAT and SIT blocks. This stats helps
identify which phase of the checkpoint thread contributes most to the
latency.

2. Readahead all NAT blocks required for the read-modify-write phase
before actual writes. This reduces the synchronous wait time for
individual NAT block reads, significantly lowering checkpoint duration.

Test results show that with NAT block readahead, the total flush time
of NAT blocks is reduced by more than 90% under similar access patterns.

Yongpeng Yang (3):
  f2fs: add write latency stats for NAT and SIT blocks in
    f2fs_write_checkpoint
  f2fs: change size parameter of __has_cursum_space() to unsigned int
  f2fs: optimize NAT block loading during checkpoint write

 fs/f2fs/checkpoint.c |  4 +++-
 fs/f2fs/f2fs.h       |  6 ++++--
 fs/f2fs/node.c       | 13 ++++++++++++-
 3 files changed, 19 insertions(+), 4 deletions(-)

-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
