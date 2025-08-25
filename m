Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F9EB333BF
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 25 Aug 2025 03:56:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3onjLHF8XeVWsZn/hh+WwDfjUy9VvFkNL0c1ANct39M=; b=Fm5jZ664HaCRzsKO5RvhxIKukN
	fGk0Roogw+T7BEzRkH0lU9nQPw++vLVf/novl83sxyzquEHuYPfDX8v6n6olfq/poFLK9I2eD1ZLX
	Bk3CXRY3n0N34zegjDTbTWAEnP+BHnjx3EYoIWeByUaLpHNYSgn7zU/0gEGCLyaRTgSA=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uqMRe-0007UJ-55;
	Mon, 25 Aug 2025 01:56:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong2021@gmail.com>) id 1uqMRc-0007U6-M0
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 25 Aug 2025 01:56:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c4+Ogxb8p/Ttt//jYnUTFmxPbRhsG2H2JzkQcUoAVHo=; b=hgTLB8s02JYYMtf3iRzXNVy2TR
 ca/nJJinHTqxpOApj6E0ApxuEVZCDmk8TBIdJHGtnK2aThwpYb18MjwjSfV1OR7YbISOwjn+tDFA1
 WXo0krlp8tGwiOCJrmkJh7MBT0JBFNUspTIAp087Mi1mIH+yLL7vc23eqvmQtTDTG79U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=c4+Ogxb8p/Ttt//jYnUTFmxPbRhsG2H2JzkQcUoAVHo=; b=eAH1qDolwT/4u3uwS7gENnp9ur
 wdffK4O/EMYBKXTEDZCsrq5YpyPXwM3zNLG4TDu5cMlIgSfZ7Kh3daEREEw9KNlQ9tLQiRvqppfyn
 xFWEN6pt854vLf2Gx0A9ZVh6PTuPDDu5yMTKtEQnchOYURiNEnV1L2MsW4XtCKs7ZKdA=;
Received: from mail-pf1-f182.google.com ([209.85.210.182])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uqMRc-0002pe-BI for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 25 Aug 2025 01:56:24 +0000
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-76e2ea933b7so3330386b3a.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 24 Aug 2025 18:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756086979; x=1756691779; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c4+Ogxb8p/Ttt//jYnUTFmxPbRhsG2H2JzkQcUoAVHo=;
 b=Y5mOpIUwfowz8U6EgVtCavQpHwujcRIqbJH9jF1AJYThgrBEmBfuztfuWJzIlcffT/
 tVrh+BFm/DCsb/X5FYfPDrCyXSoqIN3NeOW5loN6ZHBd/zAOVq2hnl/ldpFkr5/rBOCm
 MD0cdLGg70JV4S4Yr/CeRu1lTPzCwYGi0Cip1Uwuo5BUOtafc6YDbz+2ihXKPBqmjV5e
 SWgqAnZsru4TfQht9kk9wPGVbm2V/oMhrtl6hyJBlmoFhjE5J04QNWJuZK/7q4668L9Y
 wpyx8XfeRYuaiRr/CikNLu/a2fq8N44Vt4eKfIpbXJr5uQEdAtoG2fraCNhA5cTSxumk
 EHEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756086979; x=1756691779;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c4+Ogxb8p/Ttt//jYnUTFmxPbRhsG2H2JzkQcUoAVHo=;
 b=onpvI+5tdCmNqidEknKGaKIb9hvJ47XWxTYwviK5A45k0jsbt65ZYPLMfAZgwVdYYj
 iQqNpvSDZ51Owa98u13iVmdNuccRGjNR1bGm7UeN7zGf/tGjFFBzRnSwKi2fXusa+dnq
 JmgGIZsz6Ab/g2Vlo0KC01Gbd1rfVZM7IeoRXyZZmNm2LQp5Feo2LvIzlFH8+CBD6hd0
 Q+XYuUfeQV9mf8LIIQujDYrPHntl8PPPznkjtrnC9XEJX45XXMMnaumy+kfb+HEuYy60
 xSmDskqEMHlSPllWaJtYNQa/zdujqR8YWOKmx8AgVTz6dEZN3R9skn2hem0kH34BDyll
 86+A==
X-Gm-Message-State: AOJu0YwHC+Cna/uc6BRJ0gC0CfdKSSuFq5dLxq3z4TJNKYaRjPG/mdf4
 PuT9hpfvpnfSLLEHa0ZdJ0jGibyUlvo+1gocLg4WqxLdS9Xl63Y2kZnL
X-Gm-Gg: ASbGncuisjWRbKpU9ZiEgladRuk6d3ThNfWLE63rFLNkv0CCfvMaggZbXmII7IrQz7e
 9Ei9414Gxq4dixrOEUFkHcKKa3H8FisaCh7w7KLuvL1h5UKNvRICEr5YNhPgwzx/7Kqrb/cP3MV
 XYhcXjCfnl+2oR7D38Cmg+7nMGOwcCk21CdyZs+qTcrpU7LLdHl2Rc3LZNFC2+yenuPWETbnH7J
 3LVjosQgI8J/FBaOyy68ItLePd46S7dHom78mke6nC/HEMYHisDLQvlD6Ar5pfz1jyG3QACwNXw
 9qsiW+FiWXnSvcE3HsT+TEumN4qY9yg/+XPwUPpQC5v/doe8iBRnjm9wZ0NK1IAKP0q0pO79qeF
 bjKZUJAWdzT7cU3AWqrW99CLSG6PO8689XHg1Yik=
X-Google-Smtp-Source: AGHT+IG8kWTa1NT7qh6jcm8Z/xo/ig65ajUUshW69Ugr5L4m1hMzSkyjcg0bEVKNVvP/zNid2GYXjQ==
X-Received: by 2002:a05:6a20:9146:b0:240:8d5:624d with SMTP id
 adf61e73a8af0-2433028be98mr21455105637.15.1756086978643; 
 Sun, 24 Aug 2025 18:56:18 -0700 (PDT)
Received: from PC.mioffice.cn ([43.224.245.249])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b49cb8b1989sm5147883a12.18.2025.08.24.18.56.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Aug 2025 18:56:18 -0700 (PDT)
From: Sheng Yong <shengyong2021@gmail.com>
X-Google-Original-From: Sheng Yong <shengyong1@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Mon, 25 Aug 2025 09:54:50 +0800
Message-ID: <20250825015455.3826644-9-shengyong1@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250825015455.3826644-1-shengyong1@xiaomi.com>
References: <20250825015455.3826644-1-shengyong1@xiaomi.com>
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
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
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [shengyong2021(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [shengyong2021(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.182 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uqMRc-0002pe-BI
Subject: [f2fs-dev] [PATCH v4 08/13] inject.f2fs: fix injection on zoned
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
Reviewed-by: Chao Yu <chao@kernel.org>
---
 fsck/inject.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/fsck/inject.c b/fsck/inject.c
index aae3db0c6524..674881043a76 100644
--- a/fsck/inject.c
+++ b/fsck/inject.c
@@ -1227,6 +1227,9 @@ int do_inject(struct f2fs_sb_info *sbi)
 	struct inject_option *opt = (struct inject_option *)c.private;
 	int ret = -EINVAL;
 
+	if (c.zoned_model == F2FS_ZONED_HM)
+		fsck_init(sbi);
+
 	if (opt->sb >= 0)
 		ret = inject_sb(sbi, opt);
 	else if (opt->cp >= 0)
@@ -1242,5 +1245,15 @@ int do_inject(struct f2fs_sb_info *sbi)
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
