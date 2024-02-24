Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 80202862226
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 24 Feb 2024 03:00:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rdhL6-0006bt-Da;
	Sat, 24 Feb 2024 02:00:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1rdhL4-0006bl-CQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 24 Feb 2024 02:00:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gSKPG8bUr+JU4srEqZ+CKTntYZG9+Q2zkufSqgw2OdQ=; b=aQ+y5pU3ubjdw0bOuufgi0lHJ5
 Bhx/eNHQp5IEKluE7iz4S7Ux7f6grKPSuwrfxylpgktVjVZafX4q56U6XEjMkGWuIXNxliaimBgpp
 7HRh30tkm6YiVfSYrl2zZXPal7RePUl65S4ZrWWCPuEprwhEM0TtHLlW9WFtbcnf22fA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gSKPG8bUr+JU4srEqZ+CKTntYZG9+Q2zkufSqgw2OdQ=; b=KkM/rYy97qRHrK+Ttg5w2DamUp
 dWgcpJiXyVQJt+JARGzDWEEbU2cpucGFIYBeSKc48IH6aUb7cBdjC+TM+uc98ANZI0o+zyf//jH1E
 Ope5+5vf6/5opEhTJE0RBvi6jbjRVHiN/DETVOUDr0gC8JRFIqTDPOb460V23qASzxZI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rdhL4-0007Qh-3d for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 24 Feb 2024 02:00:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B520B61BC8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 24 Feb 2024 02:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C354C433C7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 24 Feb 2024 02:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708740024;
 bh=cz9VfEuF2D3hvQ3rlIxxB/Pjyqt4ExHe9N6F2Dh0raY=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=Sb9cwnD7Z1l/NIOKly7iAtV6TcIE/MWRZ3kBjYKMDzBnfG3w5CJN7w3WZsoHqo87H
 HRDvZA6vTYDBPJlQYFs/fG1IYbDHCQgDAxqKh6RbaSqxrCvnDd4Q7GtHeQJydtqlcj
 4aK12qqcTiRVY8yzy71sCdd5uwMejWQjmIwRNyQeuapaB9YUvvTQMzYuwKYeGbADoB
 HsmxgljSde9GvH1hlgqjowMUCXFH4iHwnB5jg4+VnQnLDzEijepmM9IfcvkvShl7fb
 X8rP9NUWkLuZTEJkuzGq7bFLSbdXXuxsVkq5ZU6578ikWaQ18bJVvS36PdXeGohbvy
 4bBTgAIK8wj6A==
Date: Fri, 23 Feb 2024 18:00:22 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Message-ID: <ZdlNtvzBXOXmUBg8@google.com>
References: <20240224011411.3820719-1-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240224011411.3820719-1-jaegeuk@kernel.org>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The reserved segments should be aligned to the section
 boundary.
 Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> --- v2: - fix bug 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rdhL4-0007Qh-3d
Subject: Re: [f2fs-dev] [PATCH v2] mkfs.f2fs: should give section-aligned
 reserved segments
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The reserved segments should be aligned to the section boundary.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---

  v2:
  - fix bug

 include/f2fs_fs.h | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 9056e02acd29..fc56396fa358 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -1760,25 +1760,27 @@ extern uint32_t f2fs_get_usable_segments(struct f2fs_super_block *sb);
 #define ZONE_ALIGN(blks)	SIZE_ALIGN(blks, c.blks_per_seg * \
 					c.segs_per_zone)
 
-static inline double get_reserved(struct f2fs_super_block *sb, double ovp)
+static inline uint32_t get_reserved(struct f2fs_super_block *sb, double ovp)
 {
-	double reserved;
 	uint32_t usable_main_segs = f2fs_get_usable_segments(sb);
 	uint32_t segs_per_sec = round_up(usable_main_segs, get_sb(section_count));
+	uint32_t reserved;
 
 	if (c.conf_reserved_sections)
 		reserved = c.conf_reserved_sections * segs_per_sec;
 	else
 		reserved = (100 / ovp + 1 + NR_CURSEG_TYPE) * segs_per_sec;
 
-	return reserved;
+	/* Let's keep the section alignment */
+	return round_up(reserved, segs_per_sec) * segs_per_sec;
 }
 
 static inline double get_best_overprovision(struct f2fs_super_block *sb)
 {
-	double reserved, ovp, candidate, end, diff, space;
+	double ovp, candidate, end, diff, space;
 	double max_ovp = 0, max_space = 0;
 	uint32_t usable_main_segs = f2fs_get_usable_segments(sb);
+	uint32_t reserved;
 
 	if (get_sb(segment_count_main) < 256) {
 		candidate = 10;
@@ -1795,7 +1797,7 @@ static inline double get_best_overprovision(struct f2fs_super_block *sb)
 		ovp = (usable_main_segs - reserved) * candidate / 100;
 		if (ovp < 0)
 			continue;
-		space = usable_main_segs - max(reserved, ovp) -
+		space = usable_main_segs - max((double)reserved, ovp) -
 					2 * get_sb(segs_per_sec);
 		if (max_space < space) {
 			max_space = space;
-- 
2.44.0.rc0.258.g7320e95886-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
