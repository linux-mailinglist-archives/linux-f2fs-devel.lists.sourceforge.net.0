Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C07015FEB13
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 14 Oct 2022 10:50:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ojGOq-0006wz-GL;
	Fri, 14 Oct 2022 08:50:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hrkanabar@gmail.com>) id 1ojGOI-0006to-Uc;
 Fri, 14 Oct 2022 08:50:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FSLibGjWy/nIs1Cd+IM0NiQuRQgBV8RHoXsPr1HGgA4=; b=QcCWyUVDc3GIGrPAFJWkfzPaiq
 6OZn4FxKCB1VrOLElWKNdodGKR8wwKUjLv7bgjNHu1I8KKCmnft/eaQPSOoB42yDMW0bchKHCddbC
 c3PF4ATt2g1i/jqp7u6LnGa67N7UZoJXtw97K3AoubNiLRuJLZqed1jWy4ws7lSt3jSI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FSLibGjWy/nIs1Cd+IM0NiQuRQgBV8RHoXsPr1HGgA4=; b=SWBPwjXufP/ZRfGDeRe1ptyPwl
 CnRZsXw/L2yeuTS/0IsMShgmx+iG9/enSMinf69ZL1tNuB4sN64ptmjzZvE64MtEEd6EhMSEq4tFC
 bcPasp/bUyeMyBFA/UWOkLVKO6uwrt1Q1WnX0QNeAlkyAU13P4SzqDeoDx9fDzNS9tbg=;
Received: from mail-wr1-f42.google.com ([209.85.221.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ojGOC-0002J6-BP; Fri, 14 Oct 2022 08:50:01 +0000
Received: by mail-wr1-f42.google.com with SMTP id j16so6516528wrh.5;
 Fri, 14 Oct 2022 01:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FSLibGjWy/nIs1Cd+IM0NiQuRQgBV8RHoXsPr1HGgA4=;
 b=jUVoj/7b6E4+o16YX/zkS7mGl1/zWyDsJt9qivb9kCg2BhWvw2bMcttep9H3CV3YBJ
 ZjdSShNRgKcSC+Zk87vJh8JBMp8k2uWWSPXubm+PHqQyF1hqELTu4EtXfa6Lqj6SpsVp
 9g2nh60gWPaU4054v3HwSy7DbEKSebYdF2n63JxmbBM9l0cnT4BXQqNVgGqeFBH6oz7e
 r9um5udVerI7dyDwk7asIA2BKGEpG0dam2OwGNjSZ1t09gZfumg1EtSPwIKRA4vbClpA
 5cTAxCqbYjGbvCCEAaVDLZCLqw8UCb06c7MOK1zgpzkC1fe577/DvfmcLc1yH4yXX9EQ
 +Prw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FSLibGjWy/nIs1Cd+IM0NiQuRQgBV8RHoXsPr1HGgA4=;
 b=HjJdowUVVPgz3tS6J1lYt/fJWhewkwbizSpZus+7o3kR/BwYCHRK5nPIRgDoY/a4Ma
 rAxWcLcezxDxO9AHoD2RW6dkfIOS5a4VygyEdqD0W+EsgAfJTRgFQHaUy4M1Kmo9I3us
 Pt2KQoWfuDns/T7Zt1SrBig++LB/vovjwbRdMk+uCjNFDZs6bXWP+aSWAyD2dZCpuZ4J
 cmIPRTxiBNInMxOG2VpiL5laITm5IyXpWOU1kSHPZA/K58Pr+u7L9OgflxGMaE6E/vlz
 RolYQbwQDADNS+AKhTb8eclpqC81VTOURl4IjmmUOUQyXwzx2t26o4/tWb7494g33tmS
 UTug==
X-Gm-Message-State: ACrzQf1ADqaXcMLWzNov4yvv8g1B2Y4Rn8Olue6hE9UF7BsyQnM1kGn2
 lY02v+9DrE71uPKGEUv7fqM=
X-Google-Smtp-Source: AMsMyM6RtssP0X8/PiYsddX84eZi5SsoPD+IvXeUhq3mBprDDszRzfOLZv3kstlVcvUswotyaxBNOQ==
X-Received: by 2002:a5d:5b1f:0:b0:22e:51b0:2837 with SMTP id
 bx31-20020a5d5b1f000000b0022e51b02837mr2605593wrb.132.1665737390355; 
 Fri, 14 Oct 2022 01:49:50 -0700 (PDT)
Received: from hrutvik.c.googlers.com.com
 (120.142.205.35.bc.googleusercontent.com. [35.205.142.120])
 by smtp.gmail.com with ESMTPSA id
 123-20020a1c1981000000b003c6c4639ac6sm1547372wmz.34.2022.10.14.01.49.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 01:49:50 -0700 (PDT)
From: Hrutvik Kanabar <hrkanabar@gmail.com>
To: Hrutvik Kanabar <hrutvik@google.com>
Date: Fri, 14 Oct 2022 08:48:34 +0000
Message-Id: <20221014084837.1787196-5-hrkanabar@gmail.com>
X-Mailer: git-send-email 2.38.0.413.g74048e4d9e-goog
In-Reply-To: <20221014084837.1787196-1-hrkanabar@gmail.com>
References: <20221014084837.1787196-1-hrkanabar@gmail.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Hrutvik Kanabar When `DISABLE_FS_CSUM_VERIFICATION`
 is enabled, bypass checksum verification. Signed-off-by: Hrutvik Kanabar ---
 fs/exfat/nls.c | 3 ++- fs/exfat/super.c | 3 +++ 2 files changed,
 5 insertions(+), 1 deletion(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [hrkanabar[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.42 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.221.42 listed in list.dnswl.org]
X-Headers-End: 1ojGOC-0002J6-BP
Subject: [f2fs-dev] [PATCH RFC 4/7] fs/exfat: support
 `DISABLE_FS_CSUM_VERIFICATION` config option
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
Cc: "Darrick J . Wong" <djwong@kernel.org>, Chris Mason <clm@fb.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>, kasan-dev@googlegroups.com,
 linux-ext4@vger.kernel.org, Namjae Jeon <linkinjeon@kernel.org>,
 Marco Elver <elver@google.com>, Josef Bacik <josef@toxicpanda.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Anton Altaparmakov <anton@tuxera.com>,
 Theodore Ts'o <tytso@mit.edu>, linux-ntfs-dev@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Aleksandr Nogikh <nogikh@google.com>,
 linux-fsdevel@vger.kernel.org, Sungjong Seo <sj1557.seo@samsung.com>,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Hrutvik Kanabar <hrutvik@google.com>

When `DISABLE_FS_CSUM_VERIFICATION` is enabled, bypass checksum
verification.

Signed-off-by: Hrutvik Kanabar <hrutvik@google.com>
---
 fs/exfat/nls.c   | 3 ++-
 fs/exfat/super.c | 3 +++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/exfat/nls.c b/fs/exfat/nls.c
index 705710f93e2d..f0f92eaf6ccc 100644
--- a/fs/exfat/nls.c
+++ b/fs/exfat/nls.c
@@ -696,7 +696,8 @@ static int exfat_load_upcase_table(struct super_block *sb,
 		brelse(bh);
 	}
 
-	if (index >= 0xFFFF && utbl_checksum == chksum)
+	if (IS_ENABLED(CONFIG_DISABLE_FS_CSUM_VERIFICATION) ||
+	    (index >= 0xFFFF && utbl_checksum == chksum))
 		return 0;
 
 	exfat_err(sb, "failed to load upcase table (idx : 0x%08x, chksum : 0x%08x, utbl_chksum : 0x%08x)",
diff --git a/fs/exfat/super.c b/fs/exfat/super.c
index 35f0305cd493..7418858792b3 100644
--- a/fs/exfat/super.c
+++ b/fs/exfat/super.c
@@ -564,6 +564,9 @@ static int exfat_verify_boot_region(struct super_block *sb)
 	if (!bh)
 		return -EIO;
 
+	if (IS_ENABLED(CONFIG_DISABLE_FS_CSUM_VERIFICATION))
+		return 0;
+
 	for (i = 0; i < sb->s_blocksize; i += sizeof(u32)) {
 		p_chksum = (__le32 *)&bh->b_data[i];
 		if (le32_to_cpu(*p_chksum) != chksum) {
-- 
2.38.0.413.g74048e4d9e-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
