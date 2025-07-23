Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4E5B0F538
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 23 Jul 2025 16:25:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=B5qZdM1pcU+87b1OWUSzlp3/egALF13gU+C3K3enKaQ=; b=fzzM2BRABHSyKfDiT5dMIxCgGh
	VC9kJ0rNTub3xCKonzFOjhfAx+rMUepV1hHWI7yUoPVU8DoUvgaEmmuYTuzvCwZwn77jJjp8EMsBn
	dtj91pKI7htiKH/GST4wSFJMBC6Xk3c7lYlnVu1OJp8OvdVANAHBAofTXsjYPR5ZH+Is=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ueaPH-00058k-Ez;
	Wed, 23 Jul 2025 14:25:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong2021@gmail.com>) id 1ueaPG-00058Y-Fo
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 23 Jul 2025 14:25:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xrJTE7O1/qPha3zwn2HxeCgRRmWdtz/w14Hn/0lyZSw=; b=IlXBfzqUJgi2IB/jGQihppHqg3
 poe1haqd47/zt618J/V6xYdo2ytdqf1Umv851wVrEv0r3X8X54cygYxYhCH4w2JoXTR3WrDFpu/I3
 +GS2vN1CCufA5/tk9Jfi3OPxvsULm6WcqzjuBMYQDYsXRTezj6lNBextq2LcwQdg5qxI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=xrJTE7O1/qPha3zwn2HxeCgRRmWdtz/w14Hn/0lyZSw=; b=d
 3+ZwUlvSfRo6l4DQOgua/7p34Y2b9XOZ4MCYCfA4KE5HC4RFdtlnCDZWfdNrCbNvJnDQLeZRT5IU+
 NEvqFYgqlQrADkWcmauoCHE+Ijvk3IFqCfGDr7O+kycFsV/f+pNLUhfzt5t9ltct7EzYmnczHI6/u
 vkOkiwxb3Cs9qRx0=;
Received: from mail-pg1-f176.google.com ([209.85.215.176])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ueaPG-0000MX-VA for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 23 Jul 2025 14:25:19 +0000
Received: by mail-pg1-f176.google.com with SMTP id
 41be03b00d2f7-b3bad2f99f5so950175a12.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 23 Jul 2025 07:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753280708; x=1753885508; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xrJTE7O1/qPha3zwn2HxeCgRRmWdtz/w14Hn/0lyZSw=;
 b=XH1fGuVs6pKK1qpolEyRD060/fwaclxamGgsQpn1858pVy+snFh9kSt6MFvaIYNivG
 U6C514UCpPokdj8Nl+lE7NiZl0vKNBmdAHuU0uHY80SAhbBhWhUq1PEp4Tc8AB0vW5dB
 aOKfOFLLWOisHbwLB6WJAo6nzgHIELSTZ8SXa1WhxnwQMtYNHBjX/RcpVSVYQ7tg4lmg
 2USeeMOqV0O3NJ5FoX297Tx93qR+Hz8fMuhveGeIla3Y0r5POA+XfxtfkIWx/9PwAc4Q
 NH/9jgjDxfR94dVxi0M+1miDc45uV3318vqrBsPt+TFr7R8xE9PE4Ifap8ObqNiankIh
 YCuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753280708; x=1753885508;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xrJTE7O1/qPha3zwn2HxeCgRRmWdtz/w14Hn/0lyZSw=;
 b=GQmmFqEAv6MVhn3cVUFQsFKu+gfo4XMsJQ3hPxB7CTo1wb01gHErc9uF42rXQcGeou
 53JSK28TnOLZj6osTmTLrejrMYxU4gpWvnORq+pZ3fygdCG8uT5kfJDQg57tWyAmHfrk
 vcUww2SwYaxJsjLTzYLNom1JbGC+0EMPvuhpSojv0TiIxc2O9IdHLvNEoZH0PY5++9h7
 LmvKDYDq9zsL7K88Cjc8maifBVilO4G5GKBqkXriAOXlcP+gHncmWuML3ua9lu6DTeje
 uRFvrYeVmJnnxXnyNsfKJIoF8jRRkTJ0bEqtWLIClAUWUxuTlzJ7+B14vRI95xRrA3jW
 CtZQ==
X-Gm-Message-State: AOJu0YzQ61HTnKEo5V/P6kz26CWJqLqCI1+Foivlw8vcEpVQE6b0pOv3
 WKylVejJiqeM1Ee/3qQcZzdrVauS6QH/BFiAJH6ZMKvH9hi7j3k12ZxX
X-Gm-Gg: ASbGncs5ApyyTWnIV92+m4WpyPbg0XM72QA10yTi2I98MAdMf0TmG9Xze/fu5E3Kmlh
 ObmmMhZMwN8fPwwYCBOnnk9vhgC91wGzVlJKS/AxXmKi6OJKWwgP+noAANSs5UA3iO601GXN7zL
 GkhLAI3jY0N2UzKfai7YFPKNRwIIDrACJLhkARz/XatsyTD6Udim1fXKnkmVDPvIYxvsqny4RM5
 +9zSw3HXHuhbGk1eVtxYFa+3EWxBBMRgQpudlVy8BowPTMPDTLotQaVYCimK/pUOMRq4HtTGdRD
 Wpjq3FOq1GdQ6wVmBHNQWpddBvC5xKxAA7orL/qvCW88CI2gZgRhCUATD0KsIvgRb8BP+3xDkCP
 ko9mPtjP9zBtkyffKdu7FYq3ARUyc
X-Google-Smtp-Source: AGHT+IGTsJzIbEQm5HV2vmpaRW5RsnVce+YqtFX9PtY/+Yvicme9nLHhJs9s7xWg7oZD6V/vVBop0g==
X-Received: by 2002:a17:903:a90:b0:215:6c5f:d142 with SMTP id
 d9443c01a7336-23f9832e69dmr45488815ad.20.1753280708031; 
 Wed, 23 Jul 2025 07:25:08 -0700 (PDT)
Received: from PC.mioffice.cn ([43.224.245.249])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b6eef80sm97689315ad.181.2025.07.23.07.25.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jul 2025 07:25:07 -0700 (PDT)
From: Sheng Yong <shengyong2021@gmail.com>
X-Google-Original-From: Sheng Yong <shengyong1@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Wed, 23 Jul 2025 22:24:56 +0800
Message-ID: <20250723142456.2328461-1-shengyong1@xiaomi.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Sheng Yong There is no extra work before
 trace_f2fs_[dataread|datawrite]_end(), 
 so there is no need to check trace_<tracepoint>_enabled(). Signed-off-by:
 Sheng Yong --- fs/f2fs/file.c | 9 +++------ 1 file changed, 3 insertions(+),
 6 deletions(-) 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [shengyong2021(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [shengyong2021(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.215.176 listed in wl.mailspike.net]
X-Headers-End: 1ueaPG-0000MX-VA
Subject: [f2fs-dev] [PATCH] f2fs: remove unnecessary tracepoint enabled check
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
Cc: Sheng Yong <shengyong1@xiaomi.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Sheng Yong <shengyong1@xiaomi.com>

There is no extra work before trace_f2fs_[dataread|datawrite]_end(),
so there is no need to check trace_<tracepoint>_enabled().

Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
---
 fs/f2fs/file.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index bd835c4f874a..a96115584203 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -4855,8 +4855,7 @@ static ssize_t f2fs_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
 			f2fs_update_iostat(F2FS_I_SB(inode), inode,
 						APP_BUFFERED_READ_IO, ret);
 	}
-	if (trace_f2fs_dataread_end_enabled())
-		trace_f2fs_dataread_end(inode, pos, ret);
+	trace_f2fs_dataread_end(inode, pos, ret);
 	return ret;
 }
 
@@ -4879,8 +4878,7 @@ static ssize_t f2fs_file_splice_read(struct file *in, loff_t *ppos,
 		f2fs_update_iostat(F2FS_I_SB(inode), inode,
 				   APP_BUFFERED_READ_IO, ret);
 
-	if (trace_f2fs_dataread_end_enabled())
-		trace_f2fs_dataread_end(inode, pos, ret);
+	trace_f2fs_dataread_end(inode, pos, ret);
 	return ret;
 }
 
@@ -5225,8 +5223,7 @@ static ssize_t f2fs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 			f2fs_dio_write_iter(iocb, from, &may_need_sync) :
 			f2fs_buffered_write_iter(iocb, from);
 
-		if (trace_f2fs_datawrite_end_enabled())
-			trace_f2fs_datawrite_end(inode, orig_pos, ret);
+		trace_f2fs_datawrite_end(inode, orig_pos, ret);
 	}
 
 	/* Don't leave any preallocated blocks around past i_size. */
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
