Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DE4C3E9EF
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 07 Nov 2025 07:29:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-Id:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zDAaZTaMNODs+wJ5dq9Q2xYPju3R/SRxgEwGrErT6oY=; b=PeQWJ/Uxv1CN/uaK3Fg4xHjbuC
	0krxrWBcbX0fknjLndzTRDsfynRQPuQ9KBwtQqOCrCByUcVTtK2bdkFZ54qOUE0fiB6CRXLPITO+C
	XLfmqNgeFK6/xv36WJOkG0wgRqIbx+hBKz1gkJuFkRLbXsdb6wH9KQDTD6E9syVO9xb8=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vHFyd-0007RT-NQ;
	Fri, 07 Nov 2025 06:29:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <heyunlei1988@gmail.com>) id 1vHFyb-0007RM-Pq
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Nov 2025 06:29:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VaZVCcu/DH5DjU7IbkhLAgXsTKbn9scp6rRNZBq3dzE=; b=ULOHD4OsZg07F9GArvnS2pVbgD
 xnpxhsxUopF8Vjpl9TcIaIu1IaN0/CKyWBrTl84OpKniP/4tSGVc95aEtpNhe2s4X4kqHWq5Syf0B
 q+veDg7yQGwYngxAHN7sss9x9mD3V0AVWakrwsJ0ni4HnhngWxyRNukyjIRmM/CkiFAc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=VaZVCcu/DH5DjU7IbkhLAgXsTKbn9scp6rRNZBq3dzE=; b=Q
 0wfzImeHB10hIugMAKlNDNSett78XF71FtRUy6fZswdS7FsHL85bChVPbyvFI+xzr5QcsfHmEIPLy
 d3i43AMgoabYnuCFQMlLBMaFYCH9X1dKCSfbnb0iWsvWW2Qc87HCv4x54hHt2gFwtfTzngyhlQeFE
 rWLl01FrNC5dgpY0=;
Received: from mail-pf1-f176.google.com ([209.85.210.176])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vHFyb-0000mm-Au for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Nov 2025 06:29:37 +0000
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-7afc154e411so290226b3a.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 06 Nov 2025 22:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762496966; x=1763101766; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VaZVCcu/DH5DjU7IbkhLAgXsTKbn9scp6rRNZBq3dzE=;
 b=aGQUiWOAaSvDAdhcuSdjwrgqds2zOehZ3SUNZ+4SsTkaKHXJCXr7SBZSO6iEaCdrOe
 y2Ensbxzzan/eaPoTQPD4YoTmk4QBbq0L1TxxJ6nZM2SSp05rFZb1NfpWD/XzVfoZk/e
 VVoaKUP2eVf130udVqy5FqlKG+8jeJoMZ66zEruFEWaFQv0VGIAeTwyeFTQuAVXPVqxb
 +eoj1Qu81rdW5TJwnm6rY4eslXpXsapA0qxlUTlm+u6NpQkUwvzyQz6klgCGKvx/6Ip9
 yIiy9GbE2GdKsJLs2dDwG0yL3VFum8FNeiA0enel1xpJtmBqWBzBQ/FeVqUj+Fa+f8Ft
 2/Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762496966; x=1763101766;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VaZVCcu/DH5DjU7IbkhLAgXsTKbn9scp6rRNZBq3dzE=;
 b=sHpmOq8DX4QpuCKKe/Bg5fZHQDlbg9CsVR1fNv63GXWkFc9GhPKLhRl3Yfnr/ROwpl
 hWMdL1QtjDeU+lIogrY8fOQ576DSYI8Ef/pOVILAo5G051cgLlALSuOW5bD72lvN7NKM
 aPwMxeo2Ndk/K2QYQSFp1oGvnZGi7ABntJyjP4P7SEWN4Cc93ho7+J35CCufOhLdaCDc
 hv8GNG7SvyM1uObmxpfIF5U9dcOMdcfnBOh5ge395ZevsHDb5AGso7tncVfgScLRc4Sy
 swbpLlr6ODwwxaBfVZQFcbEh8fH8HXFH8k5gYMMsBKx947hYAalDBFI3mGuxJGSXZep/
 FDqw==
X-Gm-Message-State: AOJu0YyDjxyaSSp3XzM6ZYisBtCzAckauc6xdp+R9wrFjFIrPfH2GZtn
 NKozyJGA+ckekSLA4qKWDq7/hDGworbtxFIpEFGiz3+64F4eP/C3hJPa
X-Gm-Gg: ASbGnctUpv41rOpI1mf9OOjhWgGo0CridiohHsK3qMq6636Gb7b9Hx62mrYCJW1vom/
 /6wuJ/ozEGkFo7+DXbUskFwQwQJcj1fLF78dcNF1YASrK8Lzww75q2cNOx7RVJbZAmuHoMotjyS
 bjRodCQFUlZDFrxQSRjaifByj+MJ4sVd97lDxggM9C3rY4QOz5j9IvYL21OZIEoGfnACXHXBviw
 3B64mBpl3iior5lx6PoEXQkbcN+9FU6WF8A/gWPUlaOrNPXirCW8UxlvVgzfvmwCxu/6UDWNjcv
 2Dw1Ut8+58vGdmOT0Enc5xZK0v52s+SSjdIifgvZc2M8vuY0gm3IwezZI7Z34vLUivfmC5tIQir
 7A9RnwTW4YZ17p3BDLgpnO10y3xPldwx+XJaozST8rkNpVL2YFEVKGs4FtzqMu4opLFoo1q58d5
 DWNFMlJ92nyBkvk0sri1AElAiWoswAcMU=
X-Google-Smtp-Source: AGHT+IGg0UahMMmtvoyKBU3l9GHQkkP6satkAEprAOf0G1QuMz6m3Afi73H4K7G7+6/ma2QNnzUP9g==
X-Received: by 2002:a05:6a00:2316:b0:7ac:9d93:3efa with SMTP id
 d2e1a72fcca58-7b0bb44198bmr3171285b3a.7.1762496966625; 
 Thu, 06 Nov 2025 22:29:26 -0800 (PST)
Received: from sunsj-ThinkStation-K.mioffice.cn ([43.224.245.226])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7b0cc866319sm1677801b3a.54.2025.11.06.22.29.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Nov 2025 22:29:26 -0800 (PST)
From: Yunlei He <heyunlei1988@gmail.com>
To: Chao Yu <chao@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Fri,  7 Nov 2025 14:29:07 +0800
Message-Id: <20251107062907.384287-1-heyunlei1988@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Yunlei He GC move fbe data block will add some non
 uptodate page,
 we'd better release it at the end. Signed-off-by: Yunlei He Signed-off-by:
 Yongpeng Yang --- fs/f2fs/gc.c | 5 +++++ 1 file changed, 5 insertions(+) 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [heyunlei1988(at)gmail.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [heyunlei1988(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.176 listed in wl.mailspike.net]
X-Headers-End: 1vHFyb-0000mm-Au
Subject: [f2fs-dev] [PATCH] f2fs: drop non uptodata page during GC
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Yunlei He <heyunlei@xiaomi.com>

GC move fbe data block will add some non uptodate page, we'd
better release it at the end.

Signed-off-by: Yunlei He <heyunlei@xiaomi.com>
Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
---
 fs/f2fs/gc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 8abf521530ff..09b65e6ea853 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1315,6 +1315,7 @@ static int move_data_block(struct inode *inode, block_t bidx,
 	struct node_info ni;
 	struct folio *folio, *mfolio;
 	block_t newaddr;
+	bool need_invalidate = true;
 	int err = 0;
 	bool lfs_mode = f2fs_lfs_mode(fio.sbi);
 	int type = fio.sbi->am.atgc_enabled && (gc_type == BG_GC) &&
@@ -1450,7 +1451,11 @@ static int move_data_block(struct inode *inode, block_t bidx,
 put_out:
 	f2fs_put_dnode(&dn);
 out:
+	if (folio_test_uptodate(folio))
+		need_invalidate = false;
 	f2fs_folio_put(folio, true);
+	if (need_invalidate)
+		invalidate_mapping_pages(mapping, bidx, bidx);
 	return err;
 }
 
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
