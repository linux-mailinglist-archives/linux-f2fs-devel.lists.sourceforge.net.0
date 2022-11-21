Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 76899632233
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 21 Nov 2022 13:34:36 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ox60K-0000g5-IF;
	Mon, 21 Nov 2022 12:34:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <3Ql97YwYKABEx2zuv8x55x2v.t53@flex--glider.bounces.google.com>)
 id 1ox60J-0000fr-5g for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Nov 2022 12:34:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 Mime-Version:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ut094+1HiZ4Cjb1djYz8ZPvCLMxdVr+mJo3AtkrOKCA=; b=fMkb+mkywVmSeYjYzo1dvF+31S
 dmXd+FXQFVH/uqYCm67EF73kjjWEXKiQEfIxNvhmQXpzK43bPKzMwvKz8GPRZ5gbKjt11oGRz2/uK
 p6bC+FeHgfU33DSbZ+tbpQ+YbOpcfiJMdiAj/jdSdc5M1slrsqOYlxLkTvRJKpdiVdEk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Ut094+1HiZ4Cjb1djYz8ZPvCLMxdVr+mJo3AtkrOKCA=; b=k
 BEjV1VuAYDQj8dKdt/eQoK703ub4HC8DlPxvty9+bcNb5sbMN/3gi+aA+QA3OepiePyCga6ZJgDAq
 6rh6UjgYCgu+HETWXLaVHgFCHW/F9K4uqQczm7i6dosdgqKgza+jJu1GFVqHhZc+sCQJI5Qb4XtOb
 qFI6JopTfSmHFuBE=;
Received: from mail-ed1-f73.google.com ([209.85.208.73])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ox60H-006XiR-Fz for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Nov 2022 12:34:27 +0000
Received: by mail-ed1-f73.google.com with SMTP id
 h9-20020a05640250c900b00461d8ee12e2so6782647edb.23
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 21 Nov 2022 04:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Ut094+1HiZ4Cjb1djYz8ZPvCLMxdVr+mJo3AtkrOKCA=;
 b=PtZTUVznvnflFwUv9SKypxZQqr7i1LRYenCMrhMEOVGiPfxccwpjsY0A4YtFeeVnlF
 h2lGU/CX2UGfxpSXxpMO1krIzX7InkrGi25tw16FUZGnYRG+48rz3JaSCOEXLpqgE/EM
 opVGk0Q/rJdXGr0oIG5tziMO7oWC8RwHnTFpjZTCghBdovVeuHaJ0UfGVV+HSRF+Mevy
 v/vENEx2/1GIDj3F6RVT8uC+lujEgt6uMMFBYmaBcrnbZqaZYAVFDM7x70bVO4+mtAA4
 t18AcVUc3fi2I1HwUNs+HNibRi0u8zeQUEKGIUhxxWoUi8pcajXw5PvuDm5HDd/vf0M6
 Dc+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ut094+1HiZ4Cjb1djYz8ZPvCLMxdVr+mJo3AtkrOKCA=;
 b=1HmW4n1gBzCPyfVH3dirKGEXUDjYNe5srqdoxQCVo1cM+NhJrWy9Ar4BSXG5jVxe1R
 9i9sQZn/ueS5PIEV8xNJ8/L0vy/ndW5RU0uapXtyu6LB2AZQCv5VKu+zqYevd3n3mOHO
 Ox7eQzV3PeArDp1UsdTeCkzCqWXBlJJlj6VD09MHTfvt5jofzYILAgrNSYLi01/Hgyd8
 pQQD+Y7zTPcrhFlBte8K5lKw366LYc0LW8dNdkXm2yasqsRhTd8FdH2ZyiYpT5/TNVs2
 SE3qp3t7PxNmhZMXU24YkBt1CFZwfULRJAVjmT+FxHWVCCeNPxI2wplT3gicJZyXVE7H
 NTBA==
X-Gm-Message-State: ANoB5pkWE0s7gF03Gu1wS0JhnW0sFWwayrATj46hDFWq1ZJ/+I+pEc1T
 YZXq9KLq8q3pr0QHYuNnxUO/hj9YpmY=
X-Google-Smtp-Source: AA0mqf6ymM+aPMyFpxcfMJZ6dxw5jBiyJyJ7BqqZjljlNhaC6hbGZmGDYm3fYA/es+nh2vPHSPoyWsXw6P0=
X-Received: from glider.muc.corp.google.com
 ([2a00:79e0:9c:201:db68:962:2bf6:6c7])
 (user=glider job=sendgmr) by 2002:aa7:c788:0:b0:458:b9f9:9fba with SMTP id
 n8-20020aa7c788000000b00458b9f99fbamr16132478eds.305.1669029698340; Mon, 21
 Nov 2022 03:21:38 -0800 (PST)
Date: Mon, 21 Nov 2022 12:21:30 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
Message-ID: <20221121112134.407362-1-glider@google.com>
To: glider@google.com
X-Spam-Score: -7.7 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  When aops->write_begin() does not initialize fsdata, KMSAN
 reports an error passing the latter to aops->write_end(). Fix this by
 unconditionally
 initializing fsdata. Cc: Eric Biggers <ebiggers@kernel.org> Fixes:
 c93d8f885809 ("ext4: add basic fs-verity support") Reported-by:
 syzbot+9767be679ef5016b6082@syzkaller.appspotmail.com
 Signed-off-by: Alexander Potapenko < [...] 
 Content analysis details:   (-7.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
 welcome-list
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.208.73 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.73 listed in wl.mailspike.net]
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1ox60H-006XiR-Fz
Subject: [f2fs-dev] [PATCH 1/5] fs: ext4: initialize fsdata in
 pagecache_write()
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
From: Alexander Potapenko via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Alexander Potapenko <glider@google.com>
Cc: tytso@mit.edu, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 adilger.kernel@dilger.ca, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 akpm@linux-foundation.org, linux-ext4@vger.kernel.org,
 syzbot+9767be679ef5016b6082@syzkaller.appspotmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

When aops->write_begin() does not initialize fsdata, KMSAN reports
an error passing the latter to aops->write_end().

Fix this by unconditionally initializing fsdata.

Cc: Eric Biggers <ebiggers@kernel.org>
Fixes: c93d8f885809 ("ext4: add basic fs-verity support")
Reported-by: syzbot+9767be679ef5016b6082@syzkaller.appspotmail.com
Signed-off-by: Alexander Potapenko <glider@google.com>
---
 fs/ext4/verity.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ext4/verity.c b/fs/ext4/verity.c
index 3c640bd7ecaeb..30e3b65798b50 100644
--- a/fs/ext4/verity.c
+++ b/fs/ext4/verity.c
@@ -79,7 +79,7 @@ static int pagecache_write(struct inode *inode, const void *buf, size_t count,
 		size_t n = min_t(size_t, count,
 				 PAGE_SIZE - offset_in_page(pos));
 		struct page *page;
-		void *fsdata;
+		void *fsdata = NULL;
 		int res;
 
 		res = aops->write_begin(NULL, mapping, pos, n, &page, &fsdata);
-- 
2.38.1.584.g0f3c55d4c2-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
