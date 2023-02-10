Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A4EA669294B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Feb 2023 22:33:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pQb0v-0007t5-L8;
	Fri, 10 Feb 2023 21:33:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1pQb0u-0007sz-UJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Feb 2023 21:33:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EL6W5emnmivlXeG1YEhXRBAOcS1npi8mWtqG8Erd8mE=; b=MYU4P82h8/EZ198QuFwtXbd6ld
 upRal9FQJObnFzNQp2pdvJcs52mGVd9OVYsXrVcYIUNqpTO1GHLtWzey55DMdXJZoxjPQg8sUbLP9
 SGUvI9jTi4AF0klfUZRdAj+/lhmvQqagkAmIi2mucsVhYAUi1sI4VTJhxILdAvHGcaz4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=EL6W5emnmivlXeG1YEhXRBAOcS1npi8mWtqG8Erd8mE=; b=W
 PQzJXbIolVmYRTGfjs62WyUXBPgtcw0jjwwoyjQCK3t0hwadJeoOA8o0kZ6gNsOwdL90qEubG08PF
 UHUVKdl7IDWSteY1E8RJuUD9MrZo6YMR2yB64DxVIe1/gKpj05xRiNYo0b24TFVvbcoWxROSLPYjJ
 g3hDBGrZQ+Y6fvPU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pQb0t-0005EJ-L3 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Feb 2023 21:33:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 086FD61EAC
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 10 Feb 2023 21:32:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54472C433D2;
 Fri, 10 Feb 2023 21:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676064774;
 bh=J3Gyaseg7yhQVMzzAFVCsvKsCGLb9pPjdnQxlIuqQSM=;
 h=From:To:Cc:Subject:Date:From;
 b=UlHZ7Wr9nKKcfNOZ+RrvVsHagvQ1NcpyDMwY0EEiuLVJIv/32rh11KQzSYSt6eNBm
 0WoXa3ggxLx7SE11k1rpBpLPbjN+cjSA/qHiDN44gOtzMQCpQ12FsU2ynCUxsDrX32
 EzGfEGwGjsnkGsc7sIDzTLJ/Eek7fkEsLH24TdmAEZPbKe87+wWEu5j+JfQwUqxgbR
 Z9024rKOqhd7Pbqvd48GC2SHHXefCfURVsiyVTKIi32EsT5+VKhtcAIJSGohaDU2pL
 LBFEYUvjpEZ4JWYKCNTdACxDwasYtaeI6/G7j1B0DU7NUGl2y7wgTMpPFbyJ87mydl
 IcWBcCuWaD4PQ==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 10 Feb 2023 13:32:50 -0800
Message-Id: <20230210213250.3471246-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.39.1.581.gbfd45094c4-goog
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  MAIN_SEGS is for data area, while TOTAL_SEGS includes data
 and metadata. Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> ---
 fs/f2fs/segment.h
 | 4 ++-- 1 file changed, 2 insertions(+), 2 deletions(-) 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pQb0t-0005EJ-L3
Subject: [f2fs-dev] [PATCH] f2fs: fix wrong segment count
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

MAIN_SEGS is for data area, while TOTAL_SEGS includes data and metadata.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/segment.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 8ee5e5db9287..6003fbaf4b7d 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -720,7 +720,7 @@ static inline unsigned char curseg_alloc_type(struct f2fs_sb_info *sbi,
 
 static inline void check_seg_range(struct f2fs_sb_info *sbi, unsigned int segno)
 {
-	f2fs_bug_on(sbi, segno > TOTAL_SEGS(sbi) - 1);
+	f2fs_bug_on(sbi, segno > MAIN_SEGS(sbi) - 1);
 }
 
 static inline void verify_fio_blkaddr(struct f2fs_io_info *fio)
@@ -775,7 +775,7 @@ static inline int check_block_count(struct f2fs_sb_info *sbi,
 
 	/* check segment usage, and check boundary of a given segment number */
 	if (unlikely(GET_SIT_VBLOCKS(raw_sit) > usable_blks_per_seg
-					|| segno > TOTAL_SEGS(sbi) - 1)) {
+					|| segno > MAIN_SEGS(sbi) - 1)) {
 		f2fs_err(sbi, "Wrong valid blocks %d or segno %u",
 			 GET_SIT_VBLOCKS(raw_sit), segno);
 		set_sbi_flag(sbi, SBI_NEED_FSCK);
-- 
2.39.1.581.gbfd45094c4-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
