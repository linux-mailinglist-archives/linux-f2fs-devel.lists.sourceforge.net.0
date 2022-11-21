Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3677363214A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 21 Nov 2022 12:52:34 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ox5Lj-0003H5-Ou;
	Mon, 21 Nov 2022 11:52:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <3RV97YwYKABQ052xyB08805y.w86@flex--glider.bounces.google.com>)
 id 1ox5Lh-0003Gv-Qc for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Nov 2022 11:52:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=V66iN5ZNYfCs2IKwl/XWPfYUEeh8Am+8/6YCzEI2D8c=; b=isK77YDDidnkVwB60Ko0nxOpdq
 DDKj6Dbcev8biWtmQqrxmbRL1xeegmhGSOdh2BhO2e/+fEgMQk6eVkkUEwYZCfA6JveBj9JqEHowi
 GPD+5MixPkZLmNPI/EP6M3bdRjmoIHS7pYcbtPQCihvn/jAbPd0Qxx5cg6FAywSw6gxI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=V66iN5ZNYfCs2IKwl/XWPfYUEeh8Am+8/6YCzEI2D8c=; b=NQIYNNRJDCJY2rSygrWME0Ot6i
 7pucZC91A2OEAxh+Ltl/iGusDB9hPB6TE5JmKJrNsmTSd+hkTvk8LCQolNFAX72DsIgmNcUBWnNoV
 EluNs/p/Q1P4IiGXX2ioKXK391NXKMcyy3cs6hgK+s2mtIr/ipbEtHXho+5X2D24qJ90=;
Received: from mail-wm1-f74.google.com ([209.85.128.74])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ox5Ld-0000Gf-CH for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Nov 2022 11:52:29 +0000
Received: by mail-wm1-f74.google.com with SMTP id
 e8-20020a05600c218800b003cf634f5280so3002859wme.8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 21 Nov 2022 03:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=V66iN5ZNYfCs2IKwl/XWPfYUEeh8Am+8/6YCzEI2D8c=;
 b=DrqkFhwq+x32T++mKGiLwBwBQlLcPegquOjKmY4DA36Bdlu1UHyvmrWX1hBJRhVkQ6
 CuCW3GY8rqEftTjZZrLMe7/mkVQz7UfhK+xIE67b7ScIXkJpIv8j5OGL6cLYo9+mckRB
 K7uXn7jnhwdTz8CKtd1PZLB/aUu4HHTidPyJYgxXX5idXFCZCOZVGyv8hmv6enXEqnwn
 sySci2PTifGmbTVUqgKzOGBN+JGcWBPg2j+F9wLZjNT18VaSguq8lzh50Et/vzVO1B6Q
 2Y+EGhsTlaR3AYtHfVR7KGPKNpJOX8E3kDw+u1VmZZUxfQ8uANGRO5Nfw1xQZ/dSm2xH
 GfuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=V66iN5ZNYfCs2IKwl/XWPfYUEeh8Am+8/6YCzEI2D8c=;
 b=vGbJbz6EyM02u9qkRJf2bA3/+1Uy592DN78aDs7tCeG9QHzk4LOU3D/szX81XhtuM/
 /I7q2pwBn6anhJMXT05aTT8PCGaeS9G32fGt5FMflqq1ZE0DNH+ILoSRx3JcZcOOddU0
 eS1Fv0iRiVhtWXNFD9ussOkB26Mps6xUqkppagqTVHLrzzsRwGTf+o9pATsEP8DIzcLo
 X/lgx5XYudXOPxPRZWszcstbXzbh4RaSeY28FBcZ7CFBYYb3PZ712RLD7g1ITPlqAXkO
 /G/im0XjZSNE2Fe74M/TIUEuVhg8ByHH7dI/xPEXG8jB7rnQCs2W8ibJeoAaEFd8CaGg
 okCw==
X-Gm-Message-State: ANoB5pnAK0YslE59eZg/5Nc00tcl09Xj+KlG4ysMukU4lEXNi7lg1cJh
 1qyNQmmiGEEZ5PKrEMw00w5KHGPMSHg=
X-Google-Smtp-Source: AA0mqf5PzJbpaiga2Jzsuv2QBaVRj0ECKQH/8ki+ITevGs4ly1kTH35yKTlXkQW0dHRua5gsG9D3oRFruQ0=
X-Received: from glider.muc.corp.google.com
 ([2a00:79e0:9c:201:db68:962:2bf6:6c7])
 (user=glider job=sendgmr) by 2002:adf:e50f:0:b0:22c:cc75:5aab with SMTP id
 j15-20020adfe50f000000b0022ccc755aabmr10402338wrm.143.1669029701044; Mon, 21
 Nov 2022 03:21:41 -0800 (PST)
Date: Mon, 21 Nov 2022 12:21:31 +0100
In-Reply-To: <20221121112134.407362-1-glider@google.com>
Mime-Version: 1.0
References: <20221121112134.407362-1-glider@google.com>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
Message-ID: <20221121112134.407362-2-glider@google.com>
To: glider@google.com
X-Spam-Score: -7.7 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  When aops->write_begin() does not initialize fsdata, KMSAN
 may report an error passing the latter to aops->write_end(). Fix this by
 unconditionally initializing fsdata. Suggested-by: Eric Biggers
 <ebiggers@kernel.org>
 Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2") Signed-off-by: Alexander Potapenko
 <glider@google.com> --- fs/affs/file.c | 2 +- 1 file changed, 1 insertion(+
 [...] Content analysis details:   (-7.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
 welcome-list
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.74 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.74 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1ox5Ld-0000Gf-CH
Subject: [f2fs-dev] [PATCH 2/5] fs: affs: initialize fsdata in
 affs_truncate()
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
 akpm@linux-foundation.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

When aops->write_begin() does not initialize fsdata, KMSAN may report
an error passing the latter to aops->write_end().

Fix this by unconditionally initializing fsdata.

Suggested-by: Eric Biggers <ebiggers@kernel.org>
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Alexander Potapenko <glider@google.com>
---
 fs/affs/file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/affs/file.c b/fs/affs/file.c
index cefa222f7881c..8daeed31e1af9 100644
--- a/fs/affs/file.c
+++ b/fs/affs/file.c
@@ -880,7 +880,7 @@ affs_truncate(struct inode *inode)
 	if (inode->i_size > AFFS_I(inode)->mmu_private) {
 		struct address_space *mapping = inode->i_mapping;
 		struct page *page;
-		void *fsdata;
+		void *fsdata = NULL;
 		loff_t isize = inode->i_size;
 		int res;
 
-- 
2.38.1.584.g0f3c55d4c2-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
