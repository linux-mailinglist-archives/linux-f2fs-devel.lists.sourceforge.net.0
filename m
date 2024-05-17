Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3FC8C85AC
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 17 May 2024 13:28:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s7vko-0005xS-8q;
	Fri, 17 May 2024 11:28:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Zhiguo.Niu@unisoc.com>) id 1s7vkm-0005xE-Gn
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 17 May 2024 11:27:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jv8cVr1368WUcWefUzbz/93iDXCRiDPYaAXGOZHgLZA=; b=e21Ai+m/35ac4dEMd2ydQTVsPs
 j9zSdNl/gNaG5Dt4ASUKnv72VwnAhvPYQfUaCj5WW9tzU+u3mukW1SXcDURtf4ST+WGwl7ffjDaFZ
 pmnV5LkxOBS7CLVAGDRwZm7KCdm0lSepuGx6qOilobWU3XABZTjsyVbpEYN213K9lB2Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=jv8cVr1368WUcWefUzbz/93iDXCRiDPYaAXGOZHgLZA=; b=L
 88eJnmkZxBjPuznrxwu1T04/4pKu/KFPgZqD0CpWImQ1MxYA8pTeDqzajR5JuK4AKqTpUWsu5QpxD
 6j92hVTY0BUjv9SqqCMgpaC2qVjMzpTvmERBuUP12nyOpXH52KhcLMFkHcjqmnLXhDNiC7D+ay7GS
 uqio/QaZHWqONc9Q=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1s7vkk-0005bn-Nf for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 17 May 2024 11:27:59 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 44HBRIr9071358;
 Fri, 17 May 2024 19:27:18 +0800 (+08)
 (envelope-from Zhiguo.Niu@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx02.spreadtrum.com [10.0.64.8])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4Vgl300WpXz2PdW2s;
 Fri, 17 May 2024 19:23:56 +0800 (CST)
Received: from bj08434pcu.spreadtrum.com (10.0.73.87) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Fri, 17 May 2024 19:27:10 +0800
From: Zhiguo Niu <zhiguo.niu@unisoc.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Fri, 17 May 2024 19:26:42 +0800
Message-ID: <1715945202-30045-1-git-send-email-zhiguo.niu@unisoc.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.0.73.87]
X-ClientProxiedBy: SHCAS01.spreadtrum.com (10.0.1.201) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL: SHSQR01.spreadtrum.com 44HBRIr9071358
X-Spam-Score: -5.0 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: commit 245930617c9b ("f2fs: fix to handle error paths of {new,
 change}_curseg()") missed this allocated path,
 fix it. Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
 --- fs/f2fs/segment.c | 4 +++- 1 file changed, 3 insertions(+), 1 deletion(-)
 Content analysis details:   (-5.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [222.66.158.135 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1s7vkk-0005bn-Nf
Subject: [f2fs-dev] [PATCH] f2fs: fix to check return value of
 f2fs_allocate_new_section
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
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, zhiguo.niu@unisoc.com,
 Hao_hao.Wang@unisoc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

commit 245930617c9b ("f2fs: fix to handle error paths of {new,change}_curseg()")
missed this allocated path, fix it.

Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
---
 fs/f2fs/segment.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index a0ce3d0..71dc8042 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -5190,7 +5190,9 @@ static int fix_curseg_write_pointer(struct f2fs_sb_info *sbi, int type)
 	if (cs->next_blkoff) {
 		unsigned int old_segno = cs->segno, old_blkoff = cs->next_blkoff;
 
-		f2fs_allocate_new_section(sbi, type, true);
+		err = f2fs_allocate_new_section(sbi, type, true);
+		if (err)
+			return err;
 		f2fs_notice(sbi, "Assign new section to curseg[%d]: "
 				"[0x%x,0x%x] -> [0x%x,0x%x]",
 				type, old_segno, old_blkoff,
-- 
1.9.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
