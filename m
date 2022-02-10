Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFAC4B0539
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Feb 2022 06:38:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nI2AI-00046c-2S; Thu, 10 Feb 2022 05:38:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <neilb@suse.de>) id 1nI2AG-00046W-HF
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 10 Feb 2022 05:38:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Cc:To:From:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TNOQTzqXc1dwn0sxVclyo5qS7TsZyCY45jkw8WmjP7o=; b=kYPzy2O2YYITtDLbYkVzN4nuOj
 3ut7fpvUj7ls5Xk8ONDFHxRSI60hJD/+fHTBpVen2QY52Krb/3mOsD/r3M2by6ZhqXmrKpDS+OQ7G
 CQ2r4LwvW2JrJ9pFW4xNLM9QgO/2yNm1lwWxU1E4ar5xK5Blgc9vgkIFlUwmNAr5mOuk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Cc:To:From:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TNOQTzqXc1dwn0sxVclyo5qS7TsZyCY45jkw8WmjP7o=; b=dj+bX7sCl0iVGzL0phGxKuPzip
 JeVVzNr4m/kP0KEGacTyyCqooYEfcMgX7MvYrPf1MXfulog+sKMkadoNhv29mHOHVH0bHEuKPG9jJ
 JGrwCfEKSBpqQrVmEzMMBmJE61Jzwb/VwsqdOgyUV3i7+f2krDEXgsgQmlXq3OD+V8l0=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nI2AB-00CdyL-Ud
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 10 Feb 2022 05:38:43 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 807BD212BF;
 Thu, 10 Feb 2022 05:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644471509; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TNOQTzqXc1dwn0sxVclyo5qS7TsZyCY45jkw8WmjP7o=;
 b=auHoL5UkDA+g+STXd2fTFeL3cTfMH9KQgn4il9BORLboaA+LBd59sP0b5doGLioeVsK7jS
 NShc0YB+A9Hl8fbDJUMCdNeyKFFuCjUVWYjrf+jYzzgjFshprl/gW+8UNyMq+HxYzzky2n
 Df0gmTbPZ1tSdb71oNen1V3bKLmTvAs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644471509;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TNOQTzqXc1dwn0sxVclyo5qS7TsZyCY45jkw8WmjP7o=;
 b=Kanl6OTnMHXJGXAfirc08l5F/NB5YY6FVkspt6BY1Mm/9aCVURAybuHge0yPu9tXIJs/5P
 A9fVQ05kFoLISgCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C124B13519;
 Thu, 10 Feb 2022 05:38:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id i2fSHs2kBGKsOAAAMHmgww
 (envelope-from <neilb@suse.de>); Thu, 10 Feb 2022 05:38:21 +0000
From: NeilBrown <neilb@suse.de>
To: Andrew Morton <akpm@linux-foundation.org>, Jan Kara <jack@suse.cz>,
 Wu Fengguang <fengguang.wu@intel.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <chao@kernel.org>, Jeff Layton <jlayton@kernel.org>,
 Ilya Dryomov <idryomov@gmail.com>, Miklos Szeredi <miklos@szeredi.hu>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Anna Schumaker <anna.schumaker@netapp.com>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 "Darrick J. Wong" <djwong@kernel.org>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 Lars Ellenberg <lars.ellenberg@linbit.com>,
 Paolo Valente <paolo.valente@linaro.org>, Jens Axboe <axboe@kernel.dk>
Date: Thu, 10 Feb 2022 16:37:52 +1100
Message-ID: <164447147255.23354.3738954641174277133.stgit@noble.brown>
In-Reply-To: <164447124918.23354.17858831070003318849.stgit@noble.brown>
References: <164447124918.23354.17858831070003318849.stgit@noble.brown>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Various DOC: sections in gfp.h have subsection headers (~~~)
 but the place where they are included in mm-api.rst does not have section,
 only chapters. So convert to section headers (---) to avoid conf [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [195.135.220.28 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1nI2AB-00CdyL-Ud
Subject: [f2fs-dev] [PATCH 01/11] DOC: convert 'subsection' to 'section' in
 gfp.h
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
Cc: linux-nfs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org, drbd-dev@lists.linbit.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Various DOC: sections in gfp.h have subsection headers (~~~) but the
place where they are included in mm-api.rst does not have section, only
chapters.
So convert to section headers (---) to avoid confusion.  Specifically if
section are added later in mm-api.rst, an error results.

Signed-off-by: NeilBrown <neilb@suse.de>
---
 include/linux/gfp.h |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/linux/gfp.h b/include/linux/gfp.h
index 80f63c862be5..20f6fbe12993 100644
--- a/include/linux/gfp.h
+++ b/include/linux/gfp.h
@@ -79,7 +79,7 @@ struct vm_area_struct;
  * DOC: Page mobility and placement hints
  *
  * Page mobility and placement hints
- * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+ * ---------------------------------
  *
  * These flags provide hints about how mobile the page is. Pages with similar
  * mobility are placed within the same pageblocks to minimise problems due
@@ -112,7 +112,7 @@ struct vm_area_struct;
  * DOC: Watermark modifiers
  *
  * Watermark modifiers -- controls access to emergency reserves
- * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+ * ------------------------------------------------------------
  *
  * %__GFP_HIGH indicates that the caller is high-priority and that granting
  * the request is necessary before the system can make forward progress.
@@ -144,7 +144,7 @@ struct vm_area_struct;
  * DOC: Reclaim modifiers
  *
  * Reclaim modifiers
- * ~~~~~~~~~~~~~~~~~
+ * -----------------
  * Please note that all the following flags are only applicable to sleepable
  * allocations (e.g. %GFP_NOWAIT and %GFP_ATOMIC will ignore them).
  *
@@ -224,7 +224,7 @@ struct vm_area_struct;
  * DOC: Action modifiers
  *
  * Action modifiers
- * ~~~~~~~~~~~~~~~~
+ * ----------------
  *
  * %__GFP_NOWARN suppresses allocation failure reports.
  *
@@ -256,7 +256,7 @@ struct vm_area_struct;
  * DOC: Useful GFP flag combinations
  *
  * Useful GFP flag combinations
- * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+ * ----------------------------
  *
  * Useful GFP flag combinations that are commonly used. It is recommended
  * that subsystems start with one of these combinations and then set/clear




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
