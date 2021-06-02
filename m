Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA23398079
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Jun 2021 06:44:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=67eJ5gtp8J4icMEOPJk7QHdEjIalIR3h8iJyz2vx0ao=; b=i5SyNQbrFkSU3GQ29u6QJpWQb
	GpdeLYreij330NKg4IJ7jZqtoLKFRamytHZXuX6wVnivx865IBDidY1f7gwpCCK8WcWpKZBwrAjb5
	SRPm08fJGFYK+1+0HDtv5zN1Y08fEMrzT53ZSe11g9gGOVagKD/lAemPa8nyHw9r8VKjE=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1loIkL-0004Kz-3p; Wed, 02 Jun 2021 04:44:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3AQa3YAYKAPQZnkoajckkcha.Yki@flex--drosen.bounces.google.com>)
 id 1loIkK-0004Kt-1s
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 02 Jun 2021 04:44:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/z3sAxNyr4/XNOsFRohgOJPV/ZAL16y4mKhabq6Roac=; b=c1KpnKqilU9+0MMtnpwQUBY0u
 2FXPe/a5CO/sFtuOTdzyJPC68HKhHyfMyWPSUrF3dmeiskAcSTD66c/3OCj+DKmnxB8iQTb8itue+
 DqAnRwmpuNEfMPrVzaFdr3E3SLbFQs0k8FBDmxvaJY2o2aGMEljzOUpHmlWxawDBV4xyY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/z3sAxNyr4/XNOsFRohgOJPV/ZAL16y4mKhabq6Roac=; b=PONz9OjhMowX1ZOk0fBskZaMDv
 JUT+1Srl+EsRYyAbdp/9nnJ8iDOT6vdlVWsba4od0bVhzVrv15debmOcf+lq7x7RsDqrPwrMI+Gu8
 3SDMmkGxM7mOmOn+2Ao+9Yv0GIfLIRgCqJdvpnsA1PCCKkVRiWBlE/NQOvXdtdiY+IXc=;
Received: from mail-ua1-f73.google.com ([209.85.222.73])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1loIkI-006jyM-Ga
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 02 Jun 2021 04:44:50 +0000
Received: by mail-ua1-f73.google.com with SMTP id
 r4-20020ab070c40000b02902064b454facso465227ual.6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 01 Jun 2021 21:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=/z3sAxNyr4/XNOsFRohgOJPV/ZAL16y4mKhabq6Roac=;
 b=bqqkibubUcQfTOm+zRNWEg2yC3SutsWjbXs3cMSJa1NAVTjDGIqebv/pwYt2cN/CEJ
 RO3Bwh1SNpskpQxZ9KqzDSVXhRTOjVy/IT5ZE01NrxVSqhnEBaL5rrP34AOLT1seNC3B
 tZBz4jT8/ULpXWV5lAfk2wzvcbWowpX3/jE+W3Ey6kLhrmxxGTgCF0U4ly9DIDRN8CWE
 +EDRzgu/KgGN/6pBi2RSIdeG2lrxxhzdEvjDd80qe7waAx6bwQ+f0dly+DgKhMH9H32O
 t7rAx1WTZFl7DD7M4KZbUz8Dn/+E6IPgLyPbZbudoQQwgqKCl19FK4E9xrGoRpHZoCGQ
 tGnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=/z3sAxNyr4/XNOsFRohgOJPV/ZAL16y4mKhabq6Roac=;
 b=qg9mNNqYDRgdGJD+5vorwBesAZm/HoI7Pdpoa12gHCY/JltnEaoExJ7aqux7fV2lsy
 OO0V13rT/+EBtvMRt+Xe56TYABRLymMwHwcDMvBOh+lKUH/k/zI0llwjnyvSm1H6+5ZP
 0jUikis/O3ShorpsCGTCAOzkbICev+BCqnAv5/T36t4iGh+DN/uYJpSPFmSP8dPMYDWA
 31feZ7mlVJ2RotDkdhzy3SP4FBy+o5XpfNGLFbg50QynjM1tCZjYgS1+09WWKgdMJC6W
 Sw/PygggctfJUOl1PEONh06p4d16PqQTlGyg4btfj91jn/mwpUURMBCidTuVg43dpoNJ
 fRUg==
X-Gm-Message-State: AOAM532HH8EmypuVT4XJubIF1JTMTjZiohPhVDwMguXi4czn9+d2JIBO
 fy6FpTnaupqiuyCJeXnmZpTBKL9MYDM=
X-Google-Smtp-Source: ABdhPJw1whS3sfZfBJvLGe85ZRsMy1o1HJW6TKg0vRD67RWCraVTN++TRNC9zYh3oMg0RKdm0X+os7U3GRs=
X-Received: from drosen.c.googlers.com ([fda3:e722:ac3:10:24:72f4:c0a8:4e6f])
 (user=drosen job=sendgmr) by 2002:ad4:4e47:: with SMTP id
 eb7mr3473070qvb.40.1622607361346; 
 Tue, 01 Jun 2021 21:16:01 -0700 (PDT)
Date: Wed,  2 Jun 2021 04:15:39 +0000
In-Reply-To: <20210602041539.123097-1-drosen@google.com>
Message-Id: <20210602041539.123097-3-drosen@google.com>
Mime-Version: 1.0
References: <20210602041539.123097-1-drosen@google.com>
X-Mailer: git-send-email 2.32.0.rc0.204.g9fa02ecfa5-goog
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, 
 linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.73 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.222.73 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1loIkI-006jyM-Ga
Subject: [f2fs-dev] [PATCH 2/2] f2fs: Advertise encrypted casefolding in
 sysfs
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
 Gabriel Krisman Bertazi <krisman@collabora.com>, linux-kernel@vger.kernel.org,
 Daniel Rosenberg <drosen@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Older kernels don't support encryption with casefolding. This adds
the sysfs entry encrypted_casefold to show support for those combined
features. Support for this feature was originally added by
commit 7ad08a58bf67 ("f2fs: Handle casefolding with Encryption")

Signed-off-by: Daniel Rosenberg <drosen@google.com>
---
 fs/f2fs/sysfs.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 09e3f258eb52..3c1095a76710 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -161,6 +161,9 @@ static ssize_t features_show(struct f2fs_attr *a,
 	if (f2fs_sb_has_compression(sbi))
 		len += scnprintf(buf + len, PAGE_SIZE - len, "%s%s",
 				len ? ", " : "", "compression");
+	if (f2fs_sb_has_casefold(sbi) && f2fs_sb_has_encrypt(sbi))
+		len += scnprintf(buf + len, PAGE_SIZE - len, "%s%s",
+				len ? ", " : "", "encrypted_casefold");
 	len += scnprintf(buf + len, PAGE_SIZE - len, "%s%s",
 				len ? ", " : "", "pin_file");
 	len += scnprintf(buf + len, PAGE_SIZE - len, "\n");
@@ -579,6 +582,7 @@ enum feat_id {
 	FEAT_CASEFOLD,
 	FEAT_COMPRESSION,
 	FEAT_TEST_DUMMY_ENCRYPTION_V2,
+	FEAT_ENCRYPTED_CASEFOLD,
 };
 
 static ssize_t f2fs_feature_show(struct f2fs_attr *a,
@@ -600,6 +604,7 @@ static ssize_t f2fs_feature_show(struct f2fs_attr *a,
 	case FEAT_CASEFOLD:
 	case FEAT_COMPRESSION:
 	case FEAT_TEST_DUMMY_ENCRYPTION_V2:
+	case FEAT_ENCRYPTED_CASEFOLD:
 		return sprintf(buf, "supported\n");
 	}
 	return 0;
@@ -704,6 +709,9 @@ F2FS_GENERAL_RO_ATTR(avg_vblocks);
 #ifdef CONFIG_FS_ENCRYPTION
 F2FS_FEATURE_RO_ATTR(encryption, FEAT_CRYPTO);
 F2FS_FEATURE_RO_ATTR(test_dummy_encryption_v2, FEAT_TEST_DUMMY_ENCRYPTION_V2);
+#ifdef CONFIG_UNICODE
+F2FS_FEATURE_RO_ATTR(encrypted_casefold, FEAT_ENCRYPTED_CASEFOLD);
+#endif
 #endif
 #ifdef CONFIG_BLK_DEV_ZONED
 F2FS_FEATURE_RO_ATTR(block_zoned, FEAT_BLKZONED);
@@ -815,6 +823,9 @@ static struct attribute *f2fs_feat_attrs[] = {
 #ifdef CONFIG_FS_ENCRYPTION
 	ATTR_LIST(encryption),
 	ATTR_LIST(test_dummy_encryption_v2),
+#ifdef CONFIG_UNICODE
+	ATTR_LIST(encrypted_casefold),
+#endif
 #endif
 #ifdef CONFIG_BLK_DEV_ZONED
 	ATTR_LIST(block_zoned),
-- 
2.32.0.rc0.204.g9fa02ecfa5-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
