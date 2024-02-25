Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 21473862967
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 25 Feb 2024 07:36:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1re881-0002Bg-Pq;
	Sun, 25 Feb 2024 06:36:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1re87z-0002BO-Po
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 25 Feb 2024 06:36:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GOuuxwqoIZC4qW+Ex9IXCfTLbQ9gLlWTmUFnBmd538Y=; b=Yi7J0H/oXhZIrNLUgG098ud7k3
 vqewRvU4Vj/Cxc6nmBVNGAIhN95EQxnneo3cLIzxU/43BfHCPCm2fAsrQOT31Wi8hl3ZBOlwJRHlU
 EQ3nt29M5MW931DBZqavfoZ+etKdPM/6i28AABJCcajlRbv15Vrzrmo4P/s4ktE8Spyc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=GOuuxwqoIZC4qW+Ex9IXCfTLbQ9gLlWTmUFnBmd538Y=; b=V
 a5nned4LEdd8JdwhZSeiimQb+MwJEZdwCNBqznNUzXNpmxjQaMNEhCaJ29mkFKKdblJu/oRkjv0TC
 H0iwBYf9pDbfr9Aou8iEqeyjtEx/4EVAI+rqAtVOT8ry6Uazh1Ygj4PpY839inaGrl9Sw/u3Qz3EB
 AzzzikltDQEZ5ka0=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1re87z-0003HC-IQ for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 25 Feb 2024 06:36:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 99F0ECE0A0A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 25 Feb 2024 06:36:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67450C433F1;
 Sun, 25 Feb 2024 06:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708842993;
 bh=v3UZ8ds5QU/o7sVmthaXo8YZ5pwg1PKZOFS3pOvns5k=;
 h=From:To:Cc:Subject:Date:From;
 b=aw9EbUxrkUgbBFiIFyVNWncZW/uSyV/yL0Ay5BeEwemq4ZzQivP3zkIAAHwq4XQ66
 XYL3GJufcu6RTH8ylqK+wzo7BnY/LokCIlyZ2uGIdnG8npkEjxJiTsKoPnetgIdSLZ
 bcWj+f9pI0JUfN1TuBy6RhPtA7OTPXpXRiqaRkIUtRQJidy82YmpDofmAsE72eSeJC
 Pcerqhkom1CUEt65F5keXkjf322+DDc0xVzKdvd5FFNkgxFaxm2E9s/uanYsNtwnYb
 ypNoDvq0N9u+lL3qkv8afnncXwGyOUO+4QCUam/hWkhkT2L12kEmJDBcGd9qsBxBJi
 OJ6fudemjgJfA==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Sun, 25 Feb 2024 14:36:28 +0800
Message-Id: <20240225063628.2086320-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  @type in f2fs_allocate_data_block() indicates log header's
 type, it can be CURSEG_COLD_DATA_PINNED or CURSEG_ALL_DATA_ATGC, rather than
 type of data/node, however IS_DATASEG()/IS_NODESEG() only accept [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1re87z-0003HC-IQ
Subject: [f2fs-dev] [PATCH v2] f2fs: fix to use correct segment type in
 f2fs_allocate_data_block()
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

@type in f2fs_allocate_data_block() indicates log header's type, it
can be CURSEG_COLD_DATA_PINNED or CURSEG_ALL_DATA_ATGC, rather than
type of data/node, however IS_DATASEG()/IS_NODESEG() only accept later
one, fix it.

Fixes: 093749e296e2 ("f2fs: support age threshold based garbage collection")
Signed-off-by: Chao Yu <chao@kernel.org>
---
v2:
- use curseg->seg_type instead of se->type due to se is valid only
in atgc allocation context.
 fs/f2fs/segment.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index d4f228e6f771..847fe0b7f29f 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3538,12 +3538,12 @@ int f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
 	locate_dirty_segment(sbi, GET_SEGNO(sbi, old_blkaddr));
 	locate_dirty_segment(sbi, GET_SEGNO(sbi, *new_blkaddr));
 
-	if (IS_DATASEG(type))
+	if (IS_DATASEG(curseg->seg_type))
 		atomic64_inc(&sbi->allocated_data_blocks);
 
 	up_write(&sit_i->sentry_lock);
 
-	if (page && IS_NODESEG(type)) {
+	if (page && IS_NODESEG(curseg->seg_type)) {
 		fill_node_footer_blkaddr(page, NEXT_FREE_BLKADDR(sbi, curseg));
 
 		f2fs_inode_chksum_set(sbi, page);
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
