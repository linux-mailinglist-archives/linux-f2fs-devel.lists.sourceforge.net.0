Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A502EA27
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 30 May 2019 03:19:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UsM9CGY2EacwXe175zrrysttLbT/5L5QkHQufQ1/dBI=; b=eVvr1onqhiIvYtA7WLeMLLCOs
	n+6hCpwtM+vhWY2OPwBqwe+XpgkkoXorgDs+BMJCHCSValRy0j984fzQp98o8Mx4djNxsGF2pMbce
	m2UPBbV8nla1+tQRvsCWaCcY3yQJWwWBCapcOvWUE6smXD2mR4wjiHE6SZfgWv07QyFO4=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hW9ip-0004Vw-OX; Thu, 30 May 2019 01:19:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3fynvXAYKAHwiwtxjslttlqj.htr@flex--drosen.bounces.google.com>)
 id 1hW9io-0004Vp-6z
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 30 May 2019 01:19:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1zLLzunRacIsvbkfTaWpC4CoBmiOmCh3qurXkU7Ik8U=; b=E5XKvKdBfWKXemYHb07y6egQs
 DykDfbXMD2xBFWxvW8jwlOyxq5yIUaHA+bqRFNLYA2A5o+4Wiypf50EDTlwchrU9ko8/osoodNINh
 mYOanA5fpnA08zTor79BIsStEw3P68/zbMk028xQ04lv5Zgk3PW1nOeWY04BZag3mWqTI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1zLLzunRacIsvbkfTaWpC4CoBmiOmCh3qurXkU7Ik8U=; b=SE0P0czOa+zJFldphnN7JtbM4y
 a1oVt9cslBxvBSVji39jcHcE0M+8WhEUYvbzoKxkG1FDr+YNCUTx7+JPbFJF9q9ibTw4hvMO7YeNN
 BsiQ4BkbQsPH+XRCloLtq1QPxm2mmaU4UnQgLIas/NkcmQQSeu1ZhyeBTY5B86devK/4=;
Received: from mail-pf1-f202.google.com ([209.85.210.202])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hW9in-004fMt-0w
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 30 May 2019 01:19:10 +0000
Received: by mail-pf1-f202.google.com with SMTP id i123so3296995pfb.19
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 29 May 2019 18:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=1zLLzunRacIsvbkfTaWpC4CoBmiOmCh3qurXkU7Ik8U=;
 b=h8FHABKxdlBN53cFTYJ5d0UiBL7PihQINuldUv4FTl0bNIxkuNBt/0Vhf2uJoL5oHc
 ntnxQeBd3+C8qEPYr5NVptJ+q35h8Vb6fgT/+ZS105INBTY18oRGfX0xwxo1L6VPNRA5
 c22OcQrAt10dKzRjCahiaTgdDbZ/vBceEd0fjRMjFH/6+q0u9FQKKJf/x+fsZdfIY04A
 Vc4TLPxz0LbwxUj10798jCsJzwt35n5zYTHpIofjFuIp+AqXXRE63vKbMXk1C/H9oUB6
 yHBPeUJEjTFKYiZzaX0gOwoHu4F0VQMZ+O+jfseDir1gYMx+VP4rwUkz9NYSSctfnSkb
 q/KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=1zLLzunRacIsvbkfTaWpC4CoBmiOmCh3qurXkU7Ik8U=;
 b=EzHRr6aZeyUyLq2bvVRhDcsxUBdrH5C2BBiF2yDXAzFfj/lFjjRMyoHAtVvvRGyhy1
 km5wBaXlBoS3V0ZxR1W5RK8HxPl+ku5JGoyaOGT9dNIgHaIH/V4ZUke0qJ/mPpdbSpLd
 XlFkRKV7CzTStzvk0H4Jmlm3yREBC777JfRhGEjwErRC/OeGAlLFu9MWrINx93/VE4cG
 penKKuC1tZvrYyY02PT2cP0oViHJoXWMGCckmDoTURsECav3XAsLJu5lCTxOBsWTv6UT
 cXkv40zawAAF/8Vv235uOXTUlmgN1ShEQ0vraE46a47sof7p2/ufs+Wgp3T0H2Zaj4IY
 MdTw==
X-Gm-Message-State: APjAAAWo+8DDxJvh0r8ztl/3zLSL5cixTYtPmF5HLUHy2AjCJTisXF0O
 p69zB5YFuLUQjoxQ8tSW2T6piybOemk=
X-Google-Smtp-Source: APXvYqyldr1oA4bszRUF74gO+ABbvOdB1x8BeqSdaTU/ourXVmDB1Vf2L9oUISnK4Rb3ipD8ZuMVYmiiBMg=
X-Received: by 2002:a63:1622:: with SMTP id w34mr958542pgl.45.1559177599505;
 Wed, 29 May 2019 17:53:19 -0700 (PDT)
Date: Wed, 29 May 2019 17:49:03 -0700
In-Reply-To: <20190530004906.261170-1-drosen@google.com>
Message-Id: <20190530004906.261170-2-drosen@google.com>
Mime-Version: 1.0
References: <20190530004906.261170-1-drosen@google.com>
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>, 
 Jonathan Corbet <corbet@lwn.net>, linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.202 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 T_DKIMWL_WL_MED        DKIMwl.org - Medium sender
X-Headers-End: 1hW9in-004fMt-0w
Subject: [f2fs-dev] [PATCH v3 1/4] f2fs: Lower threshold for disable_cp_again
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
From: Daniel Rosenberg via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Daniel Rosenberg <drosen@google.com>
Cc: linux-fsdevel@vger.kernel.org, kernel-team@android.com,
 linux-kernel@vger.kernel.org, Daniel Rosenberg <drosen@google.com>,
 linux-doc@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The existing threshold for allowable holes at checkpoint=disable time is
too high. The OVP space contains reserved segments, which are always in
the form of free segments. These must be subtracted from the OVP value.

The current threshold is meant to be the maximum value of holes of a
single type we can have and still guarantee that we can fill the disk
without failing to find space for a block of a given type.

If the disk is full, ignoring current reserved, which only helps us,
the amount of unused blocks is equal to the OVP area. Of that, there
are reserved segments, which must be free segments, and the rest of the
ovp area, which can come from either free segments or holes. The maximum
possible amount of holes is OVP-reserved.

Now, consider the disk when mounting with checkpoint=disable.
We must be able to fill all available free space with either data or
node blocks. When we start with checkpoint=disable, holes are locked to
their current type. Say we have H of one type of hole, and H+X of the
other. We can fill H of that space with arbitrary typed blocks via SSR.
For the remaining H+X blocks, we may not have any of a given block type
left at all. For instance, if we were to fill the disk entirely with
blocks of the type with fewer holes, the H+X blocks of the opposite type
would not be used. If H+X > OVP-reserved, there would be more holes than
could possibly exist, and we would have failed to find a suitable block
earlier on, leading to a crash in update_sit_entry.

If H+X <= OVP-reserved, then the holes end up effectively masked by the OVP
region in this case.

Signed-off-by: Daniel Rosenberg <drosen@google.com>
---
 fs/f2fs/segment.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 1a83115284b93..ec59cbd0e661d 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -876,7 +876,9 @@ void f2fs_dirty_to_prefree(struct f2fs_sb_info *sbi)
 int f2fs_disable_cp_again(struct f2fs_sb_info *sbi)
 {
 	struct dirty_seglist_info *dirty_i = DIRTY_I(sbi);
-	block_t ovp = overprovision_segments(sbi) << sbi->log_blocks_per_seg;
+	int ovp_hole_segs =
+		(overprovision_segments(sbi) - reserved_segments(sbi));
+	block_t ovp_holes = ovp_hole_segs << sbi->log_blocks_per_seg;
 	block_t holes[2] = {0, 0};	/* DATA and NODE */
 	struct seg_entry *se;
 	unsigned int segno;
@@ -891,10 +893,10 @@ int f2fs_disable_cp_again(struct f2fs_sb_info *sbi)
 	}
 	mutex_unlock(&dirty_i->seglist_lock);
 
-	if (holes[DATA] > ovp || holes[NODE] > ovp)
+	if (holes[DATA] > ovp_holes || holes[NODE] > ovp_holes)
 		return -EAGAIN;
 	if (is_sbi_flag_set(sbi, SBI_CP_DISABLED_QUICK) &&
-		dirty_segments(sbi) > overprovision_segments(sbi))
+		dirty_segments(sbi) > ovp_hole_segs)
 		return -EAGAIN;
 	return 0;
 }
-- 
2.22.0.rc1.257.g3120a18244-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
