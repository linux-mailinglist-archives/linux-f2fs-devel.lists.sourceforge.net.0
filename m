Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2377B933979
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Jul 2024 10:57:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sU0TC-0001Xc-Bj;
	Wed, 17 Jul 2024 08:57:07 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sU0TA-0001XW-Qk
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 Jul 2024 08:57:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RDcn0+SwLLC66Ofyto5JVxsq332qU1FGYcqOxXuF/3w=; b=Fwy3/Int6LQJ7o+DhPXO6qiG4G
 2oDJQBmMhzV5lqZy51qXKqOL0FAgYxFf13PmezDliQTl2qjMrMRb0E/Ryd9bONIpltoJ9kid22lBS
 9OnpXG9O3C6NZtFXZK9dpa9x4nLMp58wPgRQ4LiofW3isKcHbY5a6I8/aUdsr0QdjrKY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=RDcn0+SwLLC66Ofyto5JVxsq332qU1FGYcqOxXuF/3w=; b=l
 8Am62mWM1Pc7lu3v/nTo6HxDoGFt3wBO2z80K/13e/sbLec4SBRe2WiUO+FFzza4dCgl9GjvN5WTs
 ovzUnY7tMIspjJiTien0mczZZ75nNpi4OXIlcs9aq6jMa+0oQyoZJ6jZqf3YYf40ms+C+0MzIRFgF
 Cve70UidSsy+6zrE=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sU0TB-0007PT-IA for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 Jul 2024 08:57:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 1FB7FCE147B
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 17 Jul 2024 08:56:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 778A1C32782;
 Wed, 17 Jul 2024 08:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721206612;
 bh=W3AX7o2Z0KOMf9lp2VcCg52cU7BwCpHSPdlSEAF8AsA=;
 h=From:To:Cc:Subject:Date:From;
 b=eepxZSYgNtuSPgyKI4VQLPFnUi8AeekTpSxBwk5kWoo8RhXE8x7dAqjCmmLhMarLk
 z065/r1oQVnhShPW7l726Qe2p8qrIwzwUFhnAerUMNsVPiD5ktHeOBcel7MlX3UvJe
 j8hSIs8L8ExjSpTORaiYFx7VUoKV3i5makjPzxotNlEElUW7yOqKVMv+yLchak7lKJ
 ywa4QA5eyug+2tLXXkfDi5H2yFLnrwJqPBjX4GRRSbOQT+XmXBJS5JlcPTywZK9eTZ
 wKephhSoC5PsrQcXjNy12UJfL7t7TqAsIWlIjC1+uFCSE5V/DcXoEtMplL+WgsiGgo
 DFoczieq9Jpxw==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Wed, 17 Jul 2024 16:56:42 +0800
Message-Id: <20240717085642.2154123-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Quoted from manual of chattr: " CHATTR(1) ... ATTRIBUTES A
 file with the 'd' attribute set is not a candidate for backup when the dump(8)
 program is run. " Once we set F2FS_NODUMP_FL flag to inode, do not allow
 dumping info from it. 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [145.40.73.55 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sU0TB-0007PT-IA
Subject: [f2fs-dev] [PATCH] f2fs-tools: fix to do not dump inode if it has
 F2FS_NODUMP_FL flag
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Quoted from manual of chattr:
"
CHATTR(1)
...

ATTRIBUTES
A file with the 'd' attribute set is not a candidate for backup when
the dump(8) program is run.
"

Once we set F2FS_NODUMP_FL flag to inode, do not allow dumping info
from it.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fsck/dump.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fsck/dump.c b/fsck/dump.c
index 8d5613e..1fb9a1d 100644
--- a/fsck/dump.c
+++ b/fsck/dump.c
@@ -605,6 +605,10 @@ static int dump_filesystem(struct f2fs_sb_info *sbi, struct node_info *ni,
 		MSG(force, "Wrong name info\n\n");
 		return -1;
 	}
+	if (le32_to_cpu(inode->i_flags) & F2FS_NODUMP_FL) {
+		MSG(force, "File has nodump flag\n\n");
+		return -1;
+	}
 	base_path = base_path ?: "./lost_found";
 	if (force)
 		goto dump;
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
