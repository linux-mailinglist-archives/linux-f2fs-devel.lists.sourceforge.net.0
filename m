Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ED623A7731F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  1 Apr 2025 05:58:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzSlk-00083c-PV;
	Tue, 01 Apr 2025 03:58:32 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tzSlj-00083W-6j
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 01 Apr 2025 03:58:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cMr4Q+qNpowtulxHBQpkzcPBlBH/XPlra7y4M2CMyrw=; b=A7kKqj9P81jHGD8PeevMknsqTl
 /hXjr/XUEyFOPcz0OMXca3l5J9akqkq2EyYkyB9OZmBa316LJvn8csOdUJLDIr1NWjwv6TflNBK9A
 Ff0evB46baxftMrZNsx4K/HvF8KMPX0Z7o3BRR82cR0gKoZNIKTxX6meIiW2t46HMpd0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=cMr4Q+qNpowtulxHBQpkzcPBlBH/XPlra7y4M2CMyrw=; b=J
 5JkQm+7Siu4wMIADf6JPB9sVFW9bX+tQ/lRVL/OIb18f/jOuKEimikjlk8EZQQUZTeRG1QqCXmLuK
 OqyA5kO8ZK9i4PPK9jTnjGO/670toGjes1QiDxudbBMQfC06t/tOWwgofmhEpNMceA+FMed5iF5f8
 dpFOF5wGfrv22Pk0=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzSlS-0007gr-UV for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 01 Apr 2025 03:58:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 1FDCDA43F84;
 Tue,  1 Apr 2025 03:52:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69AD6C4CEE8;
 Tue,  1 Apr 2025 03:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743479888;
 bh=1TBiipQ5bL3J8DK3rX68uUimSVJ9/Yx0mbLiTLmPbCs=;
 h=From:To:Cc:Subject:Date:From;
 b=HBqiZ59IMke7Ae8d77JCZKlnF4hSWguWaWKFK960kMTJax6OQ8VyN45A8qIiZBaob
 FAZbY6evlq16Z+6eDYddOhgZ97yrrtZwJXX2nJqQ0vWVE2TaLOPtqyw8e6jUeTNGS5
 QETngR8aEy40RXFzqV0qh293cKrAiRiwwtwXoEw/VH4BggX0pifu81/nS6f66l9cLx
 LAcbTsf4aSD8D9gORa7rCzewH8OmTIbzQjAUBD8BnHK+gR4he+ixYly92eDbe8XcGg
 mSBTfbmP5rWCcZojoB0eCzbu4UlzVB5Dnbf8Vlaq/VqV3ueCDVj+ZvTT2CH8Tbyf7D
 ECAu9DQr9Ueww==
To: jaegeuk@kernel.org
Date: Tue,  1 Apr 2025 11:58:00 +0800
Message-ID: <20250401035800.51504-1-chao@kernel.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Spam-Score: -3.7 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  After commit 91b587ba79e1 ("f2fs: Introduce linear search
 for dentries"), f2fs forced to use linear lookup whenever a hash-based lookup
 fails on casefolded directory, it may affect performance for sce [...] 
 Content analysis details:   (-3.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -1.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tzSlS-0007gr-UV
Subject: [f2fs-dev] [PATCH v2] f2fs: support to disable linear lookup
 fallback
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
Cc: Gabriel Krisman Bertazi <krisman@suse.de>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

After commit 91b587ba79e1 ("f2fs: Introduce linear search for
dentries"), f2fs forced to use linear lookup whenever a hash-based
lookup fails on casefolded directory, it may affect performance
for scenarios: a) create a new file w/ filename it doesn't exist
in directory, b) lookup a file which may be removed.

This patch supports to disable linear lookup fallback, so, once there
is a solution for commit 5c26d2f1d3f5 ("unicode: Don't special case
ignorable code points") to fix red heart unicode issue, then we can
set an encodeing flag to disable the fallback for performance recovery.

The way is kept in line w/ ext4, refer to commit 9e28059d5664 ("ext4:
introduce linear search for dentries").

Cc: Daniel Lee <chullee@google.com>
Cc: Gabriel Krisman Bertazi <krisman@suse.de>
Signed-off-by: Chao Yu <chao@kernel.org>
---
v2:
- check sb_no_casefold_compat_fallback in prior to other condition
 fs/f2fs/dir.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index 5a63ff0df03b..a9f21bc1915d 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -366,7 +366,8 @@ struct f2fs_dir_entry *__f2fs_find_entry(struct inode *dir,
 
 out:
 #if IS_ENABLED(CONFIG_UNICODE)
-	if (IS_CASEFOLDED(dir) && !de && use_hash) {
+	if (!sb_no_casefold_compat_fallback(dir->i_sb) &&
+		IS_CASEFOLDED(dir) && !de && use_hash) {
 		use_hash = false;
 		goto start_find_entry;
 	}
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
