Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F08B56F86AF
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  5 May 2023 18:26:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1puyGc-00038e-0R;
	Fri, 05 May 2023 16:26:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1puyGa-00038X-CW
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 05 May 2023 16:26:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qvNIYj80MkgH0ClKLyFFvuiaFmYT40Pgeq1HL7NAXEI=; b=kam9H8Z+ncL/9wrpgdPMEDITvO
 vKJvIwyiGOv5BN22R0FGgn9jidbK/2jaZNEGwUoH0OPEdAMK1jAnzYcO9IAmPTfszKoYtR37pf3Vo
 gSmpCxdZjiJYIjv6fQevHY1CvQ3KKGU5INHn+8+wsmjMaPXFJVvG16UdQzkD/HLtUbus=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=qvNIYj80MkgH0ClKLyFFvuiaFmYT40Pgeq1HL7NAXEI=; b=l
 MKhAPHjx6l0GWwwvCyP7ncI/c771aVCD3D6uK0zrFgcMDyHsJOgNx7qkhbq5EPJ0pvT3GkrCNBMkT
 LPggjjY3h/bm34IlnJMHNqFyT7bp5Yf8CyiIpPVy/4NZTgBlCGKocRCN2dY8mXqOCyYCjo2osVDq0
 IGBUsIcaEAZ2xbcQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1puyGZ-00FRkE-2Q for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 05 May 2023 16:26:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A910B63F32
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  5 May 2023 16:26:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CEC4C433D2;
 Fri,  5 May 2023 16:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683303997;
 bh=UuP/tdTEVUcabJD8E8OgRPkjrmxom4Egm1uydThyoxQ=;
 h=From:To:Cc:Subject:Date:From;
 b=NQ+7sl8dC3Ns9dQFfl4EyPON70X5KL63m3UJoQfEf9NOH7DLu/HkJlvrYUmHb9JaC
 jqUHd/omzDlWfJYZ+7Lg8aabCZsuiVDwErX/0dEkWqlFY18cJ15BmR70hNiGC4jWFu
 xPsjrzXT3OfzULyKD9znHbzemNMtirGYy4APSw1GqjKE0wXLST+5c2adg3VCBvRY8q
 lG8XNhrGmTgPQH+1FiQL/hJyaC+V64hh1E01ZU+DOMmxZOeZRixuRKDsilPxvgqsx4
 T0Rbe118xZzBF0bq2YQ9I2sJT6qp86tjI/0POMk8re5WdcUGt7MCwuSH152mlQI3Hh
 zD3tt1aakvdJw==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri,  5 May 2023 09:26:33 -0700
Message-ID: <20230505162633.243596-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.40.1.521.gf1e218fcd8-goog
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Let's avoid memory alignment of sb->volume_name.
 Signed-off-by:
 Jaegeuk Kim <jaegeuk@kernel.org> --- fsck/main.c | 4 ++-- fsck/mount.c |
 4 ++-- include/f2fs_fs.h | 4 ++-- lib/libf2fs.c | 37
 ++++++++++++++++++++++++++++---------
 mkfs/f2fs_format.c | [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1puyGZ-00FRkE-2Q
Subject: [f2fs-dev] [PATCH] f2fs-tools: allocate memory to handle label
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Let's avoid memory alignment of sb->volume_name.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fsck/main.c        |  4 ++--
 fsck/mount.c       |  4 ++--
 include/f2fs_fs.h  |  4 ++--
 lib/libf2fs.c      | 37 ++++++++++++++++++++++++++++---------
 mkfs/f2fs_format.c |  2 +-
 5 files changed, 35 insertions(+), 16 deletions(-)

diff --git a/fsck/main.c b/fsck/main.c
index 9b5078708b3f..b01b52cf546e 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -1051,7 +1051,7 @@ static int do_label(struct f2fs_sb_info *sbi)
 	if (!c.vol_label) {
 		char label[MAX_VOLUME_NAME];
 
-		utf16_to_utf8(label, sb->volume_name,
+		utf16_to_utf8(label, (const char *)sb->volume_name,
 			      MAX_VOLUME_NAME, MAX_VOLUME_NAME);
 		MSG(0, "Info: volume label = %s\n", label);
 		return 0;
@@ -1062,7 +1062,7 @@ static int do_label(struct f2fs_sb_info *sbi)
 		return -1;
 	}
 
-	utf8_to_utf16(sb->volume_name, (const char *)c.vol_label,
+	utf8_to_utf16((char *)sb->volume_name, (const char *)c.vol_label,
 		      MAX_VOLUME_NAME, strlen(c.vol_label));
 
 	update_superblock(sb, SB_MASK_ALL);
diff --git a/fsck/mount.c b/fsck/mount.c
index df0314d57caf..9209558bd946 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -365,7 +365,7 @@ void print_node_info(struct f2fs_sb_info *sbi,
 	}
 }
 
-static void DISP_label(uint16_t *name)
+static void DISP_label(const char *name)
 {
 	char buffer[MAX_VOLUME_NAME];
 
@@ -391,7 +391,7 @@ printout:
 	DISP_u32(sb, magic);
 	DISP_u32(sb, major_ver);
 
-	DISP_label(sb->volume_name);
+	DISP_label((const char *)sb->volume_name);
 
 	DISP_u32(sb, minor_ver);
 	DISP_u32(sb, log_sectorsize);
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 694881402b90..832dee298e64 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -1430,8 +1430,8 @@ enum {
 	SSR
 };
 
-extern int utf8_to_utf16(uint16_t *, const char *, size_t, size_t);
-extern int utf16_to_utf8(char *, const uint16_t *, size_t, size_t);
+extern int utf8_to_utf16(char *, const char *, size_t, size_t);
+extern int utf16_to_utf8(char *, const char *, size_t, size_t);
 extern int log_base_2(uint32_t);
 extern unsigned int addrs_per_inode(struct f2fs_inode *);
 extern unsigned int addrs_per_block(struct f2fs_inode *);
diff --git a/lib/libf2fs.c b/lib/libf2fs.c
index 6b879f9d4165..aa7f15b4c526 100644
--- a/lib/libf2fs.c
+++ b/lib/libf2fs.c
@@ -115,31 +115,40 @@ static uint16_t *wchar_to_utf16(uint16_t *output, wchar_t wc, size_t outsize)
 	return output + 2;
 }
 
-int utf8_to_utf16(uint16_t *output, const char *input, size_t outsize,
+int utf8_to_utf16(char *output, const char *input, size_t outsize,
 		size_t insize)
 {
 	const char *inp = input;
-	uint16_t *outp = output;
+	uint16_t *outp;
 	wchar_t wc;
+	uint16_t *volume_name = calloc(sizeof(uint16_t), MAX_VOLUME_NAME);
+
+	if (!volume_name)
+		return -ENOMEM;
+
+	outp = volume_name;
 
 	while ((size_t)(inp - input) < insize && *inp) {
 		inp = utf8_to_wchar(inp, &wc, insize - (inp - input));
 		if (inp == NULL) {
 			DBG(0, "illegal UTF-8 sequence\n");
+			free(volume_name);
 			return -EILSEQ;
 		}
-		outp = wchar_to_utf16(outp, wc, outsize - (outp - output));
+		outp = wchar_to_utf16(outp, wc, outsize - (outp - volume_name));
 		if (outp == NULL) {
 			DBG(0, "name is too long\n");
+			free(volume_name);
 			return -ENAMETOOLONG;
 		}
 	}
 	*outp = cpu_to_le16(0);
+	memcpy(output, volume_name, sizeof(uint16_t) * MAX_VOLUME_NAME);
+	free(volume_name);
 	return 0;
 }
 
-static const uint16_t *utf16_to_wchar(const uint16_t *input, wchar_t *wc,
-		size_t insize)
+static uint16_t *utf16_to_wchar(uint16_t *input, wchar_t *wc, size_t insize)
 {
 	if ((le16_to_cpu(input[0]) & 0xfc00) == 0xd800) {
 		if (insize < 2 || (le16_to_cpu(input[1]) & 0xfc00) != 0xdc00)
@@ -201,26 +210,36 @@ static char *wchar_to_utf8(char *output, wchar_t wc, size_t outsize)
 	return output;
 }
 
-int utf16_to_utf8(char *output, const uint16_t *input, size_t outsize,
+int utf16_to_utf8(char *output, const char *input, size_t outsize,
 		size_t insize)
 {
-	const uint16_t *inp = input;
 	char *outp = output;
 	wchar_t wc;
+	uint16_t *inp;
+	uint16_t *volume_name = calloc(sizeof(uint16_t), MAX_VOLUME_NAME);
+
+	if (!volume_name)
+		return -ENOMEM;
+
+	memcpy(volume_name, input, sizeof(uint16_t) * MAX_VOLUME_NAME);
+	inp = volume_name;
 
-	while ((size_t)(inp - input) < insize && le16_to_cpu(*inp)) {
-		inp = utf16_to_wchar(inp, &wc, insize - (inp - input));
+	while ((size_t)(inp - volume_name) < insize && le16_to_cpu(*inp)) {
+		inp = utf16_to_wchar(inp, &wc, insize - (inp - volume_name));
 		if (inp == NULL) {
 			DBG(0, "illegal UTF-16 sequence\n");
+			free(volume_name);
 			return -EILSEQ;
 		}
 		outp = wchar_to_utf8(outp, wc, outsize - (outp - output));
 		if (outp == NULL) {
 			DBG(0, "name is too long\n");
+			free(volume_name);
 			return -ENAMETOOLONG;
 		}
 	}
 	*outp = '\0';
+	free(volume_name);
 	return 0;
 }
 
diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
index d3bb62222024..3e4905757161 100644
--- a/mkfs/f2fs_format.c
+++ b/mkfs/f2fs_format.c
@@ -512,7 +512,7 @@ static int f2fs_prepare_super_block(void)
 	if (c.feature & cpu_to_le32(F2FS_FEATURE_INODE_CHKSUM))
 		c.chksum_seed = f2fs_cal_crc32(~0, sb->uuid, sizeof(sb->uuid));
 
-	utf8_to_utf16(sb->volume_name, (const char *)c.vol_label,
+	utf8_to_utf16((char *)sb->volume_name, (const char *)c.vol_label,
 				MAX_VOLUME_NAME, strlen(c.vol_label));
 	set_sb(node_ino, 1);
 	set_sb(meta_ino, 2);
-- 
2.40.1.521.gf1e218fcd8-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
