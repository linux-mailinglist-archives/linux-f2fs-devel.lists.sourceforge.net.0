Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 975C642E1D1
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 14 Oct 2021 21:05:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mb62g-0001Gh-KS; Thu, 14 Oct 2021 19:05:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1mb62e-0001GT-W4
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 14 Oct 2021 19:05:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=I5G1Z7zdFjuQv3OgjKzHJqIpbQjtxeWAIqHbYudxE9M=; b=VEohmdLe9AyruLCX1lpBl+/3t5
 QIFOtUX8e99b7fNPvr5XyVA3al3Zd+TFm45OLmcvvIUzrSzmwkG1mwWj5hVp6zwKUgIar93Y6QpfJ
 6gf4zfYl7m/IYLrUQltsr6GFxasAlBKpKhl2U83bIajJTWylV0O7RUO3w82RW7h2yLTI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=I5G1Z7zdFjuQv3OgjKzHJqIpbQjtxeWAIqHbYudxE9M=; b=B
 q2LhjTyWDBM7R24XZM6KyuH/7OD3x/ZRDAjFNSD4QnttaierzbmqN3Z1Ww7cyCU362YliZkoN6d8y
 Ga/GJcPX1A0F/DxbiQQBTieV1dU3cBka1uGGWMDYJFcBK9zSr+zONhoZTd4b3bQZuaipTjknHBVoz
 PNmCtodPkl5u79G4=;
Received: from mail-pf1-f170.google.com ([209.85.210.170])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1mb62W-0003Fv-Jn
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 14 Oct 2021 19:05:24 +0000
Received: by mail-pf1-f170.google.com with SMTP id 187so6251641pfc.10
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 14 Oct 2021 12:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I5G1Z7zdFjuQv3OgjKzHJqIpbQjtxeWAIqHbYudxE9M=;
 b=mLotX/DKZtpaXvvJqOeci5zOTa59irH0vZ9c+N7SGXeVHVz79wT/MkYwrSsTzQQL/W
 f9JaXuDYgE5RqWGuHz8lB+nklGHaYsIm0w3IktJkzfvEiqy1hz4uvSuRtJy0qLnFBDDV
 vNxp5T86Qtq51D2MNd1Mx9DTgTcLVMHwb86zO4OyzknkTQceAiBdXoTKn9dCBMs6qr1J
 jaFHKLnXZ4Dw1fBSJiimyxUoBpvzl3WjqajbRJ1bQPzgUFG80WigBTPBraGLZKfvs0Ng
 BGOlTUh+AOTgq4p4MHysDV6s4kUn5ovlXcUtxBM7s5DtZBZ4vg7fNu/toQuPu7/ad8FM
 oGrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I5G1Z7zdFjuQv3OgjKzHJqIpbQjtxeWAIqHbYudxE9M=;
 b=Y3EGgr/UNZmubZSx1q/2dTkOsWTl3F8hjp5F+uhKU3ppQ2HRCoHz4nSuqUOBZGgzvh
 4xlMCb+M+AcIALmf8tC5cusOqb/i+JiPchDhL309y7mxbvTZj6GhZ9GJ3v1uyUd2vNz9
 fR5/VgLpmMLbe+kSc6e2b1YDxjGox2W4CSlT9GNQRjZtpSoM6e3YlSN6SpqINeNXkM5R
 FUJ65jMKUqa1sTzHQT22LqRnJstztauCX9xw3sahLeuD4MjhkMy8zyHQ1gh15FvgxEhG
 dZZ+6qWFopbGA5cWArbybvFRop3NFSpbdmoKgcdNjZdIKeIjoZrE5ivVNx1CE2dJNoLa
 kvsA==
X-Gm-Message-State: AOAM532fhfIKTnp3Is8zFHBB2lZYz4fr+slAR9FDy3CY25c7rqbMb+VS
 ZplsJGDt1H8rrBYhwS9I3Qw=
X-Google-Smtp-Source: ABdhPJyn78db7DKSxkPDgSKP11vWPzSExNwqSJ0yfUi7m1VTMuv6blAIWPgV84C17qfchgHKXuqliA==
X-Received: by 2002:a63:1cd:: with SMTP id 196mr5534401pgb.39.1634238310672;
 Thu, 14 Oct 2021 12:05:10 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:15c:211:201:d1c9:d6a2:4655:3944])
 by smtp.gmail.com with ESMTPSA id t3sm3134098pfb.100.2021.10.14.12.05.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 12:05:07 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Thu, 14 Oct 2021 12:05:03 -0700
Message-Id: <20211014190503.717830-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Daeho Jeong We detected the below circular locking
 dependency between sb_internal and fs_reclaim. So,
 removed it by calling dquot_initialize()
 before sb_start_intwrite().
 ======================================================
 WARNING: possible circular locking dependency detected kswapd0/133 is trying
 to acquire l [...] 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.170 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.170 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1mb62W-0003Fv-Jn
Subject: [f2fs-dev] [PATCH] f2fs: remove circular locking between
 sb_internal and fs_reclaim
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Daeho Jeong <daehojeong@google.com>

We detected the below circular locking dependency between sb_internal
and fs_reclaim. So, removed it by calling dquot_initialize() before
sb_start_intwrite().

 ======================================================
 WARNING: possible circular locking dependency detected
 ------------------------------------------------------
 kswapd0/133 is trying to acquire lock:
ffffff80d5fb9680 (sb_internal#2){.+.+}-{0:0}, at: evict+0xd4/0x2f8

but task is already holding lock:
ffffffda597c93a8 (fs_reclaim){+.+.}-{0:0}, at:
__fs_reclaim_acquire+0x4/0x50

which lock already depends on the new lock.
...
other info that might help us debug this:

 Chain exists of:

sb_internal#2 --> &s->s_dquot.dqio_sem --> fs_reclaim

  Possible unsafe locking scenario:

        CPU0                    CPU1
        ----                    ----
   lock(fs_reclaim);
                                lock(&s->s_dquot.dqio_sem);
                                lock(fs_reclaim);
   lock(sb_internal#2);

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/super.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 86eeb019cc52..a133932333c5 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1370,6 +1370,8 @@ static int f2fs_drop_inode(struct inode *inode)
 			/* should remain fi->extent_tree for writepage */
 			f2fs_destroy_extent_node(inode);
 
+			dquot_initialize(inode);
+
 			sb_start_intwrite(inode->i_sb);
 			f2fs_i_size_write(inode, 0);
 
-- 
2.33.0.1079.g6e70778dc9-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
