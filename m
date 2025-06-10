Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 323B1AD3C81
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Jun 2025 17:17:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T0JTKWHTq/+vrKVDUMMebm3Pd8stdxDfI+20h270Bl8=; b=HTxPWgU8lK+Qu4qd/yKbgOvZLC
	IGEYUt76d59/MVvyzF//5AlQK6yhX4miSqUt+Bn6n41QmGy0F/XTzYZTqH+diRdkA/mNiuibtljOT
	cAw/qCGcTA9JZbChhPTre4OYuQmDA3U2FuA9DaaMJe4v1yLkZI+ERXmLT1j032Qd4AU4=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uP0j4-0005zS-1n;
	Tue, 10 Jun 2025 15:17:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong2021@gmail.com>) id 1uP0j2-0005zI-LJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Jun 2025 15:17:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qhiz3zikIrPHrDXZsvf7ap5bKuyfgTpux6qcahqxxAo=; b=BhkmYJSEHDTqtJwjKzBdRi2wuz
 qOfUOzCfk2Q8RH/RveXvGTkUOCf+LvEV/f1H7VxvJXkVMB5Ncm2kqwYZBPeysyNHd5ZFhwHtMG6V5
 7SAy45/u0uOfghZSkp3eioH6RSWxs2ePJ/ThXiWlAgDtk7psonxGQPF3M0tyrzCXPiFs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qhiz3zikIrPHrDXZsvf7ap5bKuyfgTpux6qcahqxxAo=; b=awAcREH5J8dnMyv+fGQHiveSPw
 CJr5bb1orGKV1J35vStahftmCEUIG618sN4CWUj17DWUs2DtefquzyXjGxB3YR1qH/fBLrwkOWuLN
 Yn8zscUNERNPEBYQwnLBEx259aGmoJEcHpfcgBRnkmAV/J8eHFQ8+voZR7hoqONtmmXM=;
Received: from mail-ot1-f51.google.com ([209.85.210.51])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uP0j2-0003OS-9b for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Jun 2025 15:17:20 +0000
Received: by mail-ot1-f51.google.com with SMTP id
 46e09a7af769-739dcdb012fso543962a34.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 10 Jun 2025 08:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749568629; x=1750173429; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qhiz3zikIrPHrDXZsvf7ap5bKuyfgTpux6qcahqxxAo=;
 b=SBCrtwr2CXPsG3+uTvGCLUBXAvcLXvMUGp/VBfwfx4wG4zQ83duC6bH5iqjtlX3bRL
 npGvFXULqpFx+SGSCCzaqe+IOOIWdMmw6fro60FuAQsE18CeVFQLO2HvItT2FlCVVKLx
 xL9gSi6ELOJ/d2wLEidx9DGFDcIFfC4nQpReQBJKFVAT6T1qHEDhzjmcPLsmmvQ9g8AI
 Dn2LnWaS+pgcOndEjsvAVvDZAhpoD8va80PVd8TYKRP5LJ05OmBH5MuV9oHNPDwCr6Xo
 GL9+zXePE3D/oI8BCv1ipkmFRAss/1G1Gf3xVxHo3/XpkIj28DpiEQrG9l/HXx0KmnTL
 poLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749568629; x=1750173429;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qhiz3zikIrPHrDXZsvf7ap5bKuyfgTpux6qcahqxxAo=;
 b=uKsO72qm3tXgUENedudyY1CuEu+A2Kven/V3ZrUvJpEMm10RLdgNzcyLelHTM96nRu
 Z8nuxWSNfsIdNb3NK1GPqjo7BHaJWNKBZR0ZWPjg/KfgQN6zg09iHVGLDXBaiP39D/2C
 WCCRtcBVA0rlCiI5bt3KaEFqQ6wI9XlM0doVHK48zTWraTjNvEhY1IcUHeVaEp/qFe7D
 uOYrziQu/kEohej5laDfjAGTHbSYAonMY60Q53jH0SwU9Z9HV7S4hOfbL+1flgA414N1
 9A/Hd7qeNLSw+W0rE+EO6TM3UVpF4IUPQNuhTgoCwOdp0EiuDDlcLXW4L0RvPcm8slHN
 /2tw==
X-Gm-Message-State: AOJu0YzLKyFG9cOlP73JKoW6L0cap7YlKly5RPHYODbZ7tLOk5Y9bqQn
 rqJKvDvqLCuqZH1lt2LKjde+F4intHcQGxaVxjIw5px703eOQG/eN8B6o3aXqg==
X-Gm-Gg: ASbGncuo3d9EYdj0Vx+C0MPMgqKZ4sRKsLHaM9wnkY9CiYkEXlhzMLtWOBsnd23f6u6
 WB1/c8+h/Y1XJXukQFcxZT7dvroFW6QWch2bVZKTwDbaKwRUIRUqJP9IWXoo77hVMlwDKXFOmfw
 396itm4tsOL7VLRc/y51W9/H4qCeA46iJgtqrhfXkGHmk/N/9Rs+l1XAgE02x9csUgsh7AzU3fM
 s0CC/+TOdY8L/Emxg0PZveOR3odsK7IfcBLumAh76yLzMra1xq9IL5uKtbbPwLsHeYQq85PO38x
 uf3lmgotU1NQmZWvfGPk1bsmisr1x6LF7YwXOuZwBag+/iD1vbAhvFVTIX909wlJwTbk
X-Google-Smtp-Source: AGHT+IHkNOjKkCHwOuIcmI/WK0blscJCjYCz6Pxm4UgNKh7CnC1RC0xStBltf1VmMe6ORbw28wQfMw==
X-Received: by 2002:a05:6a21:e85:b0:1f5:9330:29fe with SMTP id
 adf61e73a8af0-21ee68a45ffmr21206924637.17.1749559097618; 
 Tue, 10 Jun 2025 05:38:17 -0700 (PDT)
Received: from PC.mioffice.cn ([43.224.245.249])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7482b0847aesm7539815b3a.105.2025.06.10.05.38.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 05:38:17 -0700 (PDT)
From: Sheng Yong <shengyong2021@gmail.com>
X-Google-Original-From: Sheng Yong <shengyong1@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 10 Jun 2025 20:37:18 +0800
Message-ID: <20250610123743.667183-9-shengyong1@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250610123743.667183-1-shengyong1@xiaomi.com>
References: <20250610123743.667183-1-shengyong1@xiaomi.com>
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Sheng Yong Because node and data blocks are updated
 out of place on zoned device, sit_area_bitmap and main_area_bitmap are required
 to record which blocks are allocated, sit should be flushed to reflect changes
 [...] Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [shengyong2021(at)gmail.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [shengyong2021(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.51 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uP0j2-0003OS-9b
Subject: [f2fs-dev] [RFC PATCH v2 08/32] inject.f2fs: fix injection on zoned
 device
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
Cc: shengyong1@xiaomi.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Sheng Yong <shengyong1@xiaomi.com>

Because node and data blocks are updated out of place on zoned device,
sit_area_bitmap and main_area_bitmap are required to record which
blocks are allocated, sit should be flushed to reflect changes in
block address, and checkpoint should be rewritten to update cursegs.

Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
---
 fsck/inject.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/fsck/inject.c b/fsck/inject.c
index b3228621de48..96817a806f8f 100644
--- a/fsck/inject.c
+++ b/fsck/inject.c
@@ -1172,6 +1172,9 @@ int do_inject(struct f2fs_sb_info *sbi)
 	struct inject_option *opt = (struct inject_option *)c.private;
 	int ret = -EINVAL;
 
+	if (c.zoned_model == F2FS_ZONED_HM)
+		fsck_init(sbi);
+
 	if (opt->sb >= 0)
 		ret = inject_sb(sbi, opt);
 	else if (opt->cp >= 0)
@@ -1187,5 +1190,15 @@ int do_inject(struct f2fs_sb_info *sbi)
 	else if (opt->dent)
 		ret = inject_dentry(sbi, opt);
 
+	if (c.zoned_model == F2FS_ZONED_HM) {
+		if (!ret && (opt->node || opt->dent)) {
+			write_curseg_info(sbi);
+			flush_journal_entries(sbi);
+			flush_sit_entries(sbi);
+			write_checkpoint(sbi);
+		}
+		fsck_free(sbi);
+	}
+
 	return ret;
 }
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
