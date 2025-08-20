Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F24BAB2DCDA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Aug 2025 14:43:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zxin2dJBJPrEn9gsjpU7F5uyMutijhEiXTsS5gcfwqw=; b=FGSJ9cV/M43frHL/aZqc2FFDOt
	m11VZ6xOi+MhvmxfXsZponaxGcnEqk78r1gceU3HgWD4g83xn/DHbIDqWEBZM1Ii85h7Kpua1YY3y
	/s1wTf1OTzNF8MBvQF2wIFuoijL7UeBeg13UdHU5tny1cXw5nagI+EicZjaDZqVtNICg=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uoiA9-0006GQ-Q5;
	Wed, 20 Aug 2025 12:43:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong2021@gmail.com>) id 1uoiA8-0006GH-LY
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Aug 2025 12:43:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ahlu949h6CeMvIYrexiQyk6xTjRTAek2bHokxu3gbSE=; b=AWUEFe96Fc2q2dqrRlFgvOPQ95
 4KXhp8v0RwlsPw+H/NPiHIexSm8AMHUH5Wnq0IH3/UNxrvUXHJ3HX+3EgzhRCj9kGaCwGafiAY7wq
 Ct2rP0+6QmF7k9XCbGw/Q9cc/QDiDKbEk+ESpyh+KoJB7V60cVt+gzmqKgJZCGS5Gzs0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ahlu949h6CeMvIYrexiQyk6xTjRTAek2bHokxu3gbSE=; b=PwwXUXkkZ2iVDTH1WyFPdbQGB4
 c2Cd/wctzHj/FYIaf0y843X8qTDYW8yrM57gz1+Z+wxMxEByWZZO31XjgpQuGAl5K4PbrTN56KUFv
 8ol6kGNokqHi2CVOV7aVPsvSx7/nqCr3UwBf0iwt4sy0T4uEjX7paXqzEYWBXfCtn5Yg=;
Received: from mail-pl1-f179.google.com ([209.85.214.179])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uoiA8-0003nj-BC for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Aug 2025 12:43:32 +0000
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-24458242b33so60827815ad.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 20 Aug 2025 05:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755693802; x=1756298602; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ahlu949h6CeMvIYrexiQyk6xTjRTAek2bHokxu3gbSE=;
 b=AkLbR3pjNduDAZAKp7uOP6yoXOdD9kAWZcqjfNTVsuP7vQf7ryZDFr/zWzDoMxii05
 MVAjfHb6XE2CFqTUpZ1U2EXuytDGBs38psjOCoEXpKz1spC+GGWBlb0p8IGZr5qFHsDY
 EI0kBKksn5ytuxBwfQ7fU5KJrZDFFKWjcTUcKkiyoXa1kDvAGFs9soHKn88+VmN6dFbd
 P+j9JYf0LaZ+LuA0Fg8Kn6G36XpXk3e33U5GCdngABVEnxUOC6Jpx85d4dxiOXi/erD5
 Kp+b6LSbwdz2SMTsC4pOFIp8yb35AI63tc2g9wT/9FQAqr3WRgTGJuVOX+dTvr2icnlV
 7s9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755693802; x=1756298602;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ahlu949h6CeMvIYrexiQyk6xTjRTAek2bHokxu3gbSE=;
 b=LukAEZDj3FcFsnQt3P0qkRGAZrbJ4jGnijvLvKAkSpeyLUCEG+ZpIvnHgdv+y038Ke
 vigku/hi+xHdSgqJs9GlPLwhAJyMoSPAIWPhO7RjKQj9tlfrtZKflktJrhshYLYoFfHq
 HyPyZFgEw8Houy7XXBxxYROj7pNnqpuLj9iL0p/P3Q8H8zJ35imunhQwI9eQvOdn4daF
 59SEx/dKMGX9grEhFoVKLN7/u4fS+1RHWEn5R+/ithK1/NWmSDxOZMAyzFALYcToq8eL
 m1an7KzLjHyyZ9RZQdJRLR2dO/8TPX+tCB93aF7ydH8i9mlMGLuljwXhse9Tx26W266q
 T7Qg==
X-Gm-Message-State: AOJu0YwqKda4Nq/NwxCqSfmzs2nJZu2IAkI5GQSIYQwauHEn+FHmk7y3
 uIrx53I7/dl52so6RY69w8xBmtIYkjp3CLOcabWKolHGlRTn/p2rguagkFPCXA==
X-Gm-Gg: ASbGncv1vGjipeydw4fE4KNXp5PyhncH2+oNA7cmqo3z0cA1YxcqZu8o6qA9Ef79mXp
 0fh0XFQN0x9zn8NhnWkRLKCMxRTKzWpnttDrgnDRcUj9yK2hWK2w5NIOLPmXaU6yvio8B2fHDxS
 21A7ARuTiodeZpQsRyApNWTnzQ6WC+/bf5sRIIL6RGF98wc2oo48fP2DD1bxSLN2nzBgxk6ct9D
 UOTIUkU2A/cb39dBUKpdbMqXuqRC9jipbXWLM1Bxv25SvM/bJieqguvVdhjSyyi79kyVs4qMKHv
 D5coO6+84Bp9+deglD6HNgk0lidZc04T0ElVgRZOC5do70Gb273435j1kixt7aQsQIgZbrC4fbY
 UDB5r4YuVz1rDSznumW58/Yx+0GWm
X-Google-Smtp-Source: AGHT+IFuU5h12pCA+P30i6p31Q4rPwECnjC7o3xXKKGxbp7btVP0CSlsiJQ/+ayzTXYlhonVRTNXIQ==
X-Received: by 2002:a17:902:da8e:b0:236:9726:7264 with SMTP id
 d9443c01a7336-245ef11259cmr29688525ad.5.1755693801641; 
 Wed, 20 Aug 2025 05:43:21 -0700 (PDT)
Received: from PC.mioffice.cn ([43.224.245.249])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed51b3dfsm25962545ad.142.2025.08.20.05.43.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 05:43:21 -0700 (PDT)
From: Sheng Yong <shengyong2021@gmail.com>
X-Google-Original-From: Sheng Yong <shengyong1@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Wed, 20 Aug 2025 20:42:36 +0800
Message-ID: <20250820124238.3785621-12-shengyong1@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250820124238.3785621-1-shengyong1@xiaomi.com>
References: <20250820124238.3785621-1-shengyong1@xiaomi.com>
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Sheng Yong This patch adds a new member `feature' in
 inject_sb to inject features. Signed-off-by: Sheng Yong --- fsck/inject.c
 | 5 +++++ man/inject.f2fs.8 | 3 +++ 2 files changed, 8 insertions(+) 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.179 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [shengyong2021(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [shengyong2021(at)gmail.com]
X-Headers-End: 1uoiA8-0003nj-BC
Subject: [f2fs-dev] [PATCH v3 11/13] inject.f2fs: add member `feature' in
 inject_sb
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

This patch adds a new member `feature' in inject_sb to inject features.

Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
---
 fsck/inject.c     | 5 +++++
 man/inject.f2fs.8 | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/fsck/inject.c b/fsck/inject.c
index 272a4a64dc05..cb348b3ba067 100644
--- a/fsck/inject.c
+++ b/fsck/inject.c
@@ -134,6 +134,7 @@ static void inject_sb_usage(void)
 	MSG(0, "  magic: inject magic number\n");
 	MSG(0, "  s_stop_reason: inject s_stop_reason array selected by --idx <index>\n");
 	MSG(0, "  s_errors: inject s_errors array selected by --idx <index>\n");
+	MSG(0, "  feature: inject feature\n");
 	MSG(0, "  devs.path: inject path in devs array selected by --idx <index> specified by --str <string>\n");
 }
 
@@ -428,6 +429,10 @@ static int inject_sb(struct f2fs_sb_info *sbi, struct inject_option *opt)
 		MSG(0, "Info: inject s_errors[%d] of sb %d: %x -> %x\n",
 		    opt->idx, opt->sb, sb->s_errors[opt->idx], (u8)opt->val);
 		sb->s_errors[opt->idx] = (u8)opt->val;
+	} else if (!strcmp(opt->mb, "feature")) {
+		MSG(0, "Info: inject feature of sb %d: 0x%x -> 0x%x\n",
+		    opt->sb, get_sb(feature), (u32)opt->val);
+		set_sb(feature, (u32)opt->val);
 	} else if (!strcmp(opt->mb, "devs.path")) {
 		if (opt->idx >= MAX_DEVICES) {
 			ERR_MSG("invalid index %u of sb->devs[]\n", opt->idx);
diff --git a/man/inject.f2fs.8 b/man/inject.f2fs.8
index 0e7cd5065a15..0dcf3a23cff8 100644
--- a/man/inject.f2fs.8
+++ b/man/inject.f2fs.8
@@ -53,6 +53,9 @@ s_stop_reason array.
 .BI s_errors
 s_errors array.
 .TP
+.BI feature
+features.
+.TP
 .BI devs.path
 path in devs array.
 .RE
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
