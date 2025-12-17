Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC89CC6672
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Dec 2025 08:47:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Yf1C8jSOBJ0k4mzp7zi2CMMj81OHtU2XfjDyvpZUzMA=; b=BZQcnm1W2wqWHevkkm1LJmJwr9
	gI4XJ0NSc9d7X0znNtmbZ3mM1BIYf9xC83MULz4wNGuHnztmaiNo5bwAzk+MbgstMon3K2uCDFTew
	XayGPRuummmKvN5rJbFxHlV9JnPuC24etTs8SHSSwuOswFhi0mWDpfaVZTVqHzm6zca4=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vVmFh-0006Mr-Hl;
	Wed, 17 Dec 2025 07:47:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Zhiguo.Niu@unisoc.com>) id 1vVmFf-0006Mg-VR
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 Dec 2025 07:47:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=P8gyT8E7UxTdv0OQvmjlOJdOlmZgOEdfmgVmUXt1ElU=; b=gZdF6QwjiNCk44SQYLrFW9ar9F
 XpeolgFgS7b3Adt2Dxz5xyIyiLgCulfFNc3YcF0vtsV0qVnT8ZDJMsGsryWw8RtIoGNBgTjqeRv8P
 Hu2antZ/RElOmmFP+HQLD1ei/jx2hkJPheAjT840ejrbtDQsxLe+0TukMCFHMHqbiFgA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=P8gyT8E7UxTdv0OQvmjlOJdOlmZgOEdfmgVmUXt1ElU=; b=R
 8TrHLAAW38cLdfmPVgdmgSjRXYrjVxKF7QPCEkrbl4oU3t7Cf1IIieeoc0o30qJym+369Yn2Vo2/a
 IUSOQoxI3pj5Dos7p6T40ZXK6tOvEAt6iTIagTMbtnAgIOH6fZ60O/DMk479HlToFQ5/t7zURrSiW
 C79pBJm/lMSOAorM=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vVmFZ-0004LI-Ns for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 Dec 2025 07:47:10 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 5BH7kaBU073927;
 Wed, 17 Dec 2025 15:46:36 +0800 (+08)
 (envelope-from Zhiguo.Niu@unisoc.com)
Received: from SHDLP.spreadtrum.com (BJMBX02.spreadtrum.com [10.0.64.8])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4dWQjm4Yhnz2LGQlt;
 Wed, 17 Dec 2025 15:42:04 +0800 (CST)
Received: from bj08434pcu.spreadtrum.com (10.0.73.87) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.48; Wed, 17 Dec 2025 15:46:34 +0800
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Wed, 17 Dec 2025 15:46:14 +0800
Message-ID: <1765957574-4386-1-git-send-email-zhiguo.niu@unisoc.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.0.73.87]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL: SHSQR01.spreadtrum.com 5BH7kaBU073927
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=unisoc.com;
 s=default; t=1765957603;
 bh=P8gyT8E7UxTdv0OQvmjlOJdOlmZgOEdfmgVmUXt1ElU=;
 h=From:To:CC:Subject:Date;
 b=o8d0yDToa9xMdy5kBb48QgjUf6czWC+3PbehNoKgNE+dMI1ZfbbhpdgfN7x/b81wr
 N8ZNn7j2p0KhoujTG+9u5am5wLrSgX4U5AadfclB6o9cwqgWLwUZVDADdISf6vsizn
 pRY+J4ccjmNEXILs0UZIEaKNOQhYUKw74+NGKlBDKreGuxPHM0psf5Lcy1hnDpn0aV
 nRNMbBac4Oq6tFcF8JUfbg7kjbuCJ5mDke889LdHYBSWu4CJSthq28f3WoP5W6veG6
 oaKM4Y1Nclouncs1fY9AvOu342m9HTTcUFge/rz5MKa6S8IBRSGZ8V2s0RiIx+fvyI
 Qa5WTfx3xO4aQ==
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  It missed the stat count in f2fs_gc_range. Signed-off-by:
 Zhiguo Niu <zhiguo.niu@unisoc.com> --- fs/f2fs/gc.c | 1 + 1 file changed,
 1 insertion(+) diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c index 6afd57f..58b291d
 100644 --- a/fs/f2fs/gc.c +++ b/fs/f2fs/gc.c @@ -2096, 6 +2096,
 7 @@ int f2fs_gc_range(struct
 f2fs_sb_info *sbi, if (unlikely(f2fs_cp_erro [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1vVmFZ-0004LI-Ns
Subject: [f2fs-dev] [PATCH] f2fs: fix to add gc count stat in f2fs_gc_range
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
From: Zhiguo Niu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Zhiguo Niu <zhiguo.niu@unisoc.com>
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, zhiguo.niu@unisoc.com,
 Hao_hao.Wang@unisoc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

It missed the stat count in f2fs_gc_range.

Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
---
 fs/f2fs/gc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 6afd57f..58b291d 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -2096,6 +2096,7 @@ int f2fs_gc_range(struct f2fs_sb_info *sbi,
 	if (unlikely(f2fs_cp_error(sbi)))
 		return -EIO;
 
+	stat_inc_gc_call_count(sbi, FOREGROUND);
 	for (segno = start_seg; segno <= end_seg; segno += SEGS_PER_SEC(sbi)) {
 		struct gc_inode_list gc_list = {
 			.ilist = LIST_HEAD_INIT(gc_list.ilist),
-- 
1.9.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
