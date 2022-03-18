Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 95AEF4DD6C2
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 18 Mar 2022 10:02:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nV8VW-0003IW-Nl; Fri, 18 Mar 2022 09:02:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nV8VV-0003IP-Hc
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 18 Mar 2022 09:02:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XJLU7b6LGp7Mjzt8kjxV84B4O7B5BgiTYHYl/oOUxOI=; b=OzrjRmOmTfL8ZW+5eoqdB6Cqlp
 XhbznjcWF2QB/HtLPVQPryJCmbQ7lNsl/1hX5n1MXqspXKkuBQmYLwOOgxioDm8HrSNm5zaKy/0M3
 qfPs0dtXMWDPU6JKG8+Ye4RbLeZvZ/IIQxsGSjHeZZZYxxL34KamwpyfxwMdV8X+KbFk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=XJLU7b6LGp7Mjzt8kjxV84B4O7B5BgiTYHYl/oOUxOI=; b=H
 n4QJwcidRduqPWHL5izHq7+GvXDtvOhw2NKHbsUTHKRYvv/RNmbTW+ROYcAFBxaNZw8vWY7Es4SZb
 yhfNLbn/siiJpEVf+C/zyxzvhStqIypAsWS0FMiZEzB89hnstKZPsiAkV2JCeafgrtTZDeq5M40EY
 P1ey8zEgrRZo7SzU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nV8VT-0006Av-In
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 18 Mar 2022 09:02:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DE4B961ACC;
 Fri, 18 Mar 2022 09:02:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABFDDC340E8;
 Fri, 18 Mar 2022 09:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647594161;
 bh=a9kcKdyy34HKkql+gG9xZK5LGjnACzCRZOb54+k9ARI=;
 h=From:To:Cc:Subject:Date:From;
 b=TUKAj841h+8McDB0ki0QIIr1ugANgJng6oCWwUYCv2gGJsyXQNnqMynhmXpZXq9xh
 TINP1p+z4vKJk2QY2KJwDccMRCjxf8bk++zK5qLrlof3nBPW6p1PezUTceqbuHIruK
 IZ+ZZqCPZJ3itiZwidrmqmPY8pmriTF41vE36vcxQH6g6szzyxHwBLMXe0mCn2xs28
 ofkWtZLDQIHqZ9LzyuugH8uF4BRRSFceeZxWtJqvkA8cF0evTF6XM2KC8MJYO1D3Iq
 6OMVaFSnGpWOauZ7E7M/MMmPyAml9xnunVxINUS38qUR1RiMGzGFyW+1J3wQQ9WbNb
 l6lmeRSxx7NIA==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Fri, 18 Mar 2022 17:02:30 +0800
Message-Id: <20220318090230.3756263-1-chao@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: -6.7 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Let's enable GC_URGENT_HIGH mode during
 f2fs_disable_checkpoint(), 
 so that we can use SSR allocator for GCed data/node persistence, it can improve
 the performance due to it avoiding migration of data/ [...] 
 Content analysis details:   (-6.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nV8VT-0006Av-In
Subject: [f2fs-dev] [PATCH v2] f2fs: use aggressive GC policy during
 f2fs_disable_checkpoint()
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

Let's enable GC_URGENT_HIGH mode during f2fs_disable_checkpoint(),
so that we can use SSR allocator for GCed data/node persistence,
it can improve the performance due to it avoiding migration of
data/node locates in selected target segment of SSR allocator.

Signed-off-by: Chao Yu <chao.yu@oppo.com>
---
v2:
- enable GC_URGENT_HIGH mode only.
 fs/f2fs/super.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 9176597fdf94..caceb80b87ec 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2080,6 +2080,7 @@ static int f2fs_disable_checkpoint(struct f2fs_sb_info *sbi)
 {
 	unsigned int s_flags = sbi->sb->s_flags;
 	struct cp_control cpc;
+	unsigned int gc_mode;
 	int err = 0;
 	int ret;
 	block_t unusable;
@@ -2092,6 +2093,9 @@ static int f2fs_disable_checkpoint(struct f2fs_sb_info *sbi)
 
 	f2fs_update_time(sbi, DISABLE_TIME);
 
+	gc_mode = sbi->gc_mode;
+	sbi->gc_mode = GC_URGENT_HIGH;
+
 	while (!f2fs_time_over(sbi, DISABLE_TIME)) {
 		f2fs_down_write(&sbi->gc_lock);
 		err = f2fs_gc(sbi, true, false, false, NULL_SEGNO);
@@ -2129,6 +2133,7 @@ static int f2fs_disable_checkpoint(struct f2fs_sb_info *sbi)
 out_unlock:
 	f2fs_up_write(&sbi->gc_lock);
 restore_flag:
+	sbi->gc_mode = gc_mode;
 	sbi->sb->s_flags = s_flags;	/* Restore SB_RDONLY status */
 	return err;
 }
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
