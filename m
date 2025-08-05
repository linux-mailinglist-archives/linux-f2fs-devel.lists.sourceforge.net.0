Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B89B5B1AE4A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Aug 2025 08:29:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HAIYDQaCV/MlGt3amOZYCHxtWfZQFCnxQ7kADScQAMA=; b=gA9htVXjmd9J12rOj1I0pzH6uP
	5+2PGnDdYTeJZKscnTdpA6z1Cvyy8/rarcZAYht1Ujxhfz3as4QPqyck7bFQOnMr0dlPBMiJV2une
	gLZ9SxOPFehu0LjvfsXpiUFEVQt7yY5OtqvrTbhy4HPC2MZg4mdU9iBDKdmdMuPFMwYg=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ujBAw-00010T-P6;
	Tue, 05 Aug 2025 06:29:30 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ujBAw-00010M-7M
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Aug 2025 06:29:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Vaq9Yco3vTyBJ8qZvlsAf5lq3aFYkZW7PDRrVBSIqA4=; b=Per0YHstZxzdnDQIEkFARybuZC
 YlZd0xc0+unyOTgBB4wlHaiFAFMHrVbYeedFx2Cfsb+Htqchpyu/c3yCX8uNBa8fPZC/gyPGYBPj7
 W1jasSUqpPrWqTeMxcjqp1T45I0afyzZFqu07ECo3CwIe0ZpeB0jAK9w3lvZw+q6dxBs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Vaq9Yco3vTyBJ8qZvlsAf5lq3aFYkZW7PDRrVBSIqA4=; b=Q
 OBcKUuWarqFVZrujzICIBElpc5F1bv7A7WCtogMwoidWWjQZbfdhBiCeHr8Ajha5TxxHTWAxFHVjs
 DsDqpvs2Rl8AsMTjvryb/v/Ovcu4HP3vRyOckn3LMcGTMjLV3gy3jY1yezBEUmdaDZwybEoExTZfG
 95apx5luJ/nbYi0A=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ujBAv-0003ch-Hm for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Aug 2025 06:29:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3C37A44E49
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  5 Aug 2025 06:29:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0467CC4CEF4;
 Tue,  5 Aug 2025 06:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754375359;
 bh=nibfP85OrtQzeUHNPYnVq5ZQtUssf0yOK2wCjiWDsmE=;
 h=From:To:Cc:Subject:Date:From;
 b=J1q+hd5+nkJMEGBGayUV29fS5leHdv+JzlcpcCxaNGvsAXpafOfbwXblVvjrJb93o
 HACOvTrrKJ5DVTLDCp2f8+uA+YJsqKLJYx3/3+z6jcyL2fJ2Wd4D3AqclkK+twBx9F
 3860CebAMKDo2epd5KARPSLDrC232RywcsgfiBs0G5GWlywawQW5yoY5Y2ZHMy1qZf
 hvxBuCv7Zlxa6s7/cH2nikqDFf9mgA8mHSQhA/pmvB5BvZDV82lED0pR9XZ1mzAgwL
 /LUFspRUk6Sd/7OVfHx2HoQkdhyTTbMEqoI5XORrF1cwuO3wAmAWdHsb9FJr5kAMf5
 oPE/SRq/47PCQ==
To: jaegeuk@kernel.org
Date: Tue,  5 Aug 2025 14:29:10 +0800
Message-ID: <20250805062912.3070949-1-chao@kernel.org>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Should cast type of folio->index from pgoff_t to loff_t to
 avoid overflow while left shift operation. Fixes: 3265d3db1f16 ("f2fs: support
 partial truncation on compressed inode") Signed-off-by: Chao Yu
 <chao@kernel.org>
 --- fs/f2fs/compress.c | 2 +- 1 file changed, 1 insertion(+), 1 deletion(-)
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ujBAv-0003ch-Hm
Subject: [f2fs-dev] [PATCH v3 1/3] f2fs: fix to avoid overflow while left
 shift operation
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Should cast type of folio->index from pgoff_t to loff_t to avoid overflow
while left shift operation.

Fixes: 3265d3db1f16 ("f2fs: support partial truncation on compressed inode")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/compress.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 5c1f47e45dab..6cd8902849cf 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1245,7 +1245,7 @@ int f2fs_truncate_partial_cluster(struct inode *inode, u64 from, bool lock)
 
 		for (i = cluster_size - 1; i >= 0; i--) {
 			struct folio *folio = page_folio(rpages[i]);
-			loff_t start = folio->index << PAGE_SHIFT;
+			loff_t start = (loff_t)folio->index << PAGE_SHIFT;
 
 			if (from <= start) {
 				folio_zero_segment(folio, 0, folio_size(folio));
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
