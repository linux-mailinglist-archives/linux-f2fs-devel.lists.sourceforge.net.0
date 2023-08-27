Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8F3789F04
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 27 Aug 2023 15:33:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qaFtG-0006pa-E6;
	Sun, 27 Aug 2023 13:33:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hao.xu@linux.dev>) id 1qaFtF-0006pU-O6
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 27 Aug 2023 13:33:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/w6lIGuCSX5M2SzS7SE+A2P7DaEhoFOZKnfxuRd6M0g=; b=hivIH7uTG7vJApXazkhjnC0Tyi
 hs4jp/peuZ2rPXjXLmWs17uLsYo0JOXw6Z9SLYW/8k796W1bz6+F0KOsME1m4fGXwtDFpLOFd2xg7
 8iyTMBjZC05570tDE0CNAhIGgYs4460QMXf1F8IwonjmaonNivvW2RFzAexCQPa3CX8Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/w6lIGuCSX5M2SzS7SE+A2P7DaEhoFOZKnfxuRd6M0g=; b=KZw2h75PrTo/aKXTFxDfxuqasG
 WHTJDJjmgfjMNGAO0lYn3JZIXsdvYHUjRw5I4Zzu4ew+WWbagRVkSZgYdbvYXYm0y6bC0y0tJ6+1S
 plEiPI9H/l2wLqQs1W+nTxk86zAM1zgvbFpJdrZghP9Aw9SGkqge80xCwuKsYuS9fnA8=;
Received: from out-245.mta1.migadu.com ([95.215.58.245])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qaFtF-00H3qc-TY for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 27 Aug 2023 13:33:18 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1693143191;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/w6lIGuCSX5M2SzS7SE+A2P7DaEhoFOZKnfxuRd6M0g=;
 b=nFii2RaAVtERxLk40QaUcpRmI8KsgMix1y0E+FJbochLiKUgvfCEHVlGKzl74Le3vQdKIX
 Ic8HKxNSkSYAWoFe69ooiMlQ7zn66y3ibRq5sWqNObX5lM32Ml0OMzA1739KowhZg9B8i9
 pdpKOlIaZIJj3teGeY/OKxpoMDEzjMc=
From: Hao Xu <hao.xu@linux.dev>
To: io-uring@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Date: Sun, 27 Aug 2023 21:28:29 +0800
Message-Id: <20230827132835.1373581-6-hao.xu@linux.dev>
In-Reply-To: <20230827132835.1373581-1-hao.xu@linux.dev>
References: <20230827132835.1373581-1-hao.xu@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Hao Xu <howeyxu@tencent.com> Add a helper to unlock
 f_pos_lock without any condition. Introduce this since io_uring handles
 f_pos_lock
 not with a fd struct, thus FDPUT_POS_UNLOCK isn't used. Signed-off-by: Hao
 Xu <howeyxu@tencent.com> --- include/linux/file.h | 5 +++++ 1 file changed,
 5 insertions(+) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1qaFtF-00H3qc-TY
Subject: [f2fs-dev] [PATCH 05/11] vfs: add file_pos_unlock() for io_uring
 usage
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
Cc: Wanpeng Li <wanpengli@tencent.com>, "Darrick J . Wong" <djwong@kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Dave Chinner <david@fromorbit.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Stefan Roesch <shr@fb.com>, Clay Harris <bugs@claycon.org>,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
 codalist@coda.cs.cmu.edu, cluster-devel@redhat.com, linux-cachefs@redhat.com,
 linux-ext4@vger.kernel.org, devel@lists.orangefs.org,
 linux-cifs@vger.kernel.org, ecryptfs@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-block@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, netdev@vger.kernel.org,
 samba-technical@lists.samba.org, linux-unionfs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
 bpf@vger.kernel.org, Pavel Begunkov <asml.silence@gmail.com>,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Hao Xu <howeyxu@tencent.com>

Add a helper to unlock f_pos_lock without any condition. Introduce this
since io_uring handles f_pos_lock not with a fd struct, thus
FDPUT_POS_UNLOCK isn't used.

Signed-off-by: Hao Xu <howeyxu@tencent.com>
---
 include/linux/file.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/file.h b/include/linux/file.h
index bcc6ba0aec50..a179f4794341 100644
--- a/include/linux/file.h
+++ b/include/linux/file.h
@@ -81,6 +81,11 @@ static inline void fdput_pos(struct fd f)
 	fdput(f);
 }
 
+static inline void file_pos_unlock(struct file *file)
+{
+	__f_unlock_pos(file);
+}
+
 extern int file_pos_lock_nowait(struct file *file, bool nowait);
 
 DEFINE_CLASS(fd, struct fd, fdput(_T), fdget(fd), int fd)
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
