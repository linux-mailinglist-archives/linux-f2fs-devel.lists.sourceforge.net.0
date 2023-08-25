Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9187F78893C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Aug 2023 15:56:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qZXJ4-0000V9-Pi;
	Fri, 25 Aug 2023 13:56:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hao.xu@linux.dev>) id 1qZXJ3-0000Ux-LW
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Aug 2023 13:56:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=W04QOWrrBuMFm18D/+g+MI2uZNnKBIsbwxq2wO1dKKw=; b=gVeTN0SxpCvWH1Zc9FjNa4d06s
 wZnWKNZ38wIfj8ijSMAIrSiP6zp+qlX7V8t+VyaByDEEB7hVnewX8Xh2Yk0Ut9A5EDxiaCAFJhNHb
 cR4ZAgTpOPgRoKKWkgtrWb1ibXM+sJb6mwe+u/QjCgmn5B3J4CopoJCmPzaJpextEOvE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=W04QOWrrBuMFm18D/+g+MI2uZNnKBIsbwxq2wO1dKKw=; b=j9XRYOjKkILKLrxZ2fJrj5r/lf
 c6SKub7NVC7eldZmZ20zwCMUEiNsRZH8sX3oDP6xVAZZEM3LWniJ4DYBap8vlVkEsA3BhGZvVsO3b
 eDnhWU0VJkETAwc/BMpK2q3nsTcDwQMMcI7vGX0GTwR/PKh+8xZGRgGaMuRlrHGKVE34=;
Received: from out-242.mta1.migadu.com ([95.215.58.242])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qZXIy-00FHe1-Eu for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Aug 2023 13:56:56 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1692971805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W04QOWrrBuMFm18D/+g+MI2uZNnKBIsbwxq2wO1dKKw=;
 b=GYR7q+ed6aYuRljJYmvSX9IH2GLL+DVsCTCg/+y32Q33mqJCInZ91y+uQeCstRhUPnoP3N
 ePQXgcigakNgh8HTbQeNs8AWnI9Lei+c8/zQ92SOW8UgAHTnrdNmJY44TCN57rW11W5x8C
 QP3i32OeE0C7qn2HcY/8yIvkb/iSTUs=
From: Hao Xu <hao.xu@linux.dev>
To: io-uring@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Date: Fri, 25 Aug 2023 21:54:07 +0800
Message-Id: <20230825135431.1317785-6-hao.xu@linux.dev>
In-Reply-To: <20230825135431.1317785-1-hao.xu@linux.dev>
References: <20230825135431.1317785-1-hao.xu@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Hao Xu <howeyxu@tencent.com> Add a vfs helper
 file_pos_lock_nowait()
 for io_uring usage. The function have conditional nowait logic, i.e. if nowait
 is needed, return -EAGAIN when trylock fails. 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1qZXIy-00FHe1-Eu
Subject: [f2fs-dev] [PATCH 05/29] vfs: add a vfs helper for io_uring file
 pos lock
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

Add a vfs helper file_pos_lock_nowait() for io_uring usage. The function
have conditional nowait logic, i.e. if nowait is needed, return -EAGAIN
when trylock fails.

Signed-off-by: Hao Xu <howeyxu@tencent.com>
---
 fs/file.c            | 13 +++++++++++++
 include/linux/file.h |  2 ++
 2 files changed, 15 insertions(+)

diff --git a/fs/file.c b/fs/file.c
index 35c62b54c9d6..8e5c38f5db52 100644
--- a/fs/file.c
+++ b/fs/file.c
@@ -1053,6 +1053,19 @@ void __f_unlock_pos(struct file *f)
 	mutex_unlock(&f->f_pos_lock);
 }
 
+int file_pos_lock_nowait(struct file *file, bool nowait)
+{
+	if (!(file->f_mode & FMODE_ATOMIC_POS))
+		return 0;
+
+	if (!nowait)
+		mutex_lock(&file->f_pos_lock);
+	else if (!mutex_trylock(&file->f_pos_lock))
+		return -EAGAIN;
+
+	return 1;
+}
+
 /*
  * We only lock f_pos if we have threads or if the file might be
  * shared with another process. In both cases we'll have an elevated
diff --git a/include/linux/file.h b/include/linux/file.h
index 6e9099d29343..bcc6ba0aec50 100644
--- a/include/linux/file.h
+++ b/include/linux/file.h
@@ -81,6 +81,8 @@ static inline void fdput_pos(struct fd f)
 	fdput(f);
 }
 
+extern int file_pos_lock_nowait(struct file *file, bool nowait);
+
 DEFINE_CLASS(fd, struct fd, fdput(_T), fdget(fd), int fd)
 
 extern int f_dupfd(unsigned int from, struct file *file, unsigned flags);
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
