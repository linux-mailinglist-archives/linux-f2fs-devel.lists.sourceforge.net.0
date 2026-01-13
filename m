Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BEFD19D6E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Jan 2026 16:22:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hsG0TWL7Lsb61q9f5xB8oQ2UGOMo11Wv4h5eJWwpOv8=; b=Cx4Ab2rH5ll9Y+IwZ68Kqez5Ay
	dqjdviOuuaM8apwpNoAqd8DVxyXD8OWBtC4hLHv/aagw8GAgDlEk/cgj2chAru4CpX9+9f9R5c1of
	Q1MZyUal9qsowPDAsOtDCqayunyuNQyrlkkws4fbd+TelX/+wt56T8IpXikhtA56HmuI=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vfgDk-0005Xd-GZ;
	Tue, 13 Jan 2026 15:22:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <monty_pavel@sina.com>) id 1vfgDj-0005XV-Di
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jan 2026 15:22:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H22AcHuiR0ExBMnRiIccUO0FrvsGRsw0BoqQ1fiy5P8=; b=CZn5dQ+Nb4DvZqTRZmnbZ/OsPv
 H7jIbNnmHP2HpmN4XLgtXxq3ETk+utMl/I+B8wGaLrvnzwMp1D8dE33wEssfpcZfhuyM8jPxgtu/t
 lVv1n8o+sptypnGoqMAqwSMknvmkb0uYbLSk8oki3AbnYHIesadRmgDDoqVViX7WIExQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=H22AcHuiR0ExBMnRiIccUO0FrvsGRsw0BoqQ1fiy5P8=; b=U
 Q6fYpvNkT2G1GYnIP6CvOHaZ8nc2+Y32vaoP7pAgQHPcPiunxOpa7vjw800bQ8VxXPume4b7JZt1/
 zTtnKE49gfmOLzhC3sXST834WwKRBmTL0BrSN+UUC59PwTRcKgJN6vFrEyQUfqX6lQWW6MixvYZUF
 ar7bd2DK3jUn8fT8=;
Received: from smtp153-168.sina.com.cn ([61.135.153.168])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vfgDh-00014u-Ja for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jan 2026 15:22:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208;
 t=1768317729; bh=H22AcHuiR0ExBMnRiIccUO0FrvsGRsw0BoqQ1fiy5P8=;
 h=From:Subject:Date:Message-ID;
 b=yn0F1tu7RDgDlCcHNH0yf7Ks/1PcvZ6a+a9u9veZ9V2oOBYmGtSffJM79jQCTpVrE
 KdIqIYlxlf+W5s15sINFynowRhhBS92d/G4vfcSLj0juwZmeILCkX1E01wL3qwgvw7
 jh6BWd3G+UucOm/ESk1lqRqpqyccqWagr93fkMo8=
X-SMAIL-HELO: monty-pavel..
Received: from unknown (HELO monty-pavel..)([120.245.114.32])
 by sina.com (10.54.253.33) with ESMTP
 id 6966631000006BDA; Tue, 13 Jan 2026 23:21:56 +0800 (CST)
X-Sender: monty_pavel@sina.com
X-Auth-ID: monty_pavel@sina.com
Authentication-Results: sina.com; spf=none smtp.mailfrom=monty_pavel@sina.com;
 dkim=none header.i=none;
 dmarc=none action=none header.from=monty_pavel@sina.com
X-SMAIL-MID: 286156685043
X-SMAIL-UIID: FAC065323FA54D0F8B63C11F1B108CB9-20260113-232156-1
From: Yongpeng Yang <monty_pavel@sina.com>
To: Chao Yu <chao@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Tue, 13 Jan 2026 23:21:36 +0800
Message-ID: <20260113152138.15979-2-monty_pavel@sina.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Yongpeng Yang This patch series addresses long
 checkpoint
 write latency observed under workloads with frequent metadata operations.
 Analysis shows that the main bottleneck is high synchronous read latency
 of NAT bl [...] 
 Content analysis details:   (0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
 [120.245.114.32 listed in dnsbl-2.uceprotect.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [monty_pavel(at)sina.com]
X-Headers-End: 1vfgDh-00014u-Ja
Subject: [f2fs-dev] [PATCH v2 0/3] f2fs: reduce checkpoint write latency
 under metadata-intensive workloads
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

---
v2:
- Replace list_for_each_entry_safe with list_for_each_entry in patch
3/3.

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
