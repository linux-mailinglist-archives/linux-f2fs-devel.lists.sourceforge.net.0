Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CB440BFFE
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Sep 2021 09:01:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mQOvP-0004na-W8; Wed, 15 Sep 2021 07:01:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from
 <BATV+8aa05ddd91fea3e0ef51+6597+infradead.org+hch@casper.srs.infradead.org>)
 id 1mQOvN-0004nR-0u
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Sep 2021 07:01:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nsp5N75MotLePoJobS9ZhodRN6ezBtzkmBOnAPp7UHg=; b=c2L261UFVKo9VEa8jPCSsm+d2f
 Noy/KQtvJHKfS1Hd2UroCL92E1xdR4CgtNKgDl4j0LQp5p0XFnzfS4g0XozgdCkq/LiM4GL7nKfAG
 VfPNkOBKkUiqna1NH9GilqDY1e0A5FESdxvVO9x4gEAv5Gtr7ltKxNeoxd227YGyPbGM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nsp5N75MotLePoJobS9ZhodRN6ezBtzkmBOnAPp7UHg=; b=g5FxMXguzi8KCAWRKUmHVW1NHU
 eWA8Ky+/MfzductpysWZWaYefSaDJkQG4Ilrd6izNWHis+fXjzQlCAdq98OlxdcfivLDCl9WLI9vl
 ScE/G22alDpjdGMmSUzfp7bToBFIfaEER+jOT/w85FxxOzkQ8RxnVwElrveDqRYtMtOU=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mQOvL-00BFMa-Tk
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Sep 2021 07:01:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=nsp5N75MotLePoJobS9ZhodRN6ezBtzkmBOnAPp7UHg=; b=koHYfJhi0kCowMyVCGjauAU5cB
 3Ya1uhzNq+8fHnDU/raPWU0wmVfgHzoC6THMGYOBkO96qnQGi9yTzT57Ls/mvBXhiqQTiwez8wfI4
 8sd0GsVp4XWh1ty9nUoHP4WBDryS6Z5f5oJm6hFd+iaXN4ZrRJQ0bRc+lF0mHENbDTp2PZOVB46N0
 Fj1HO7Y9OSCdUAjsWmNNSmyd33jmrcWa5CSQNnVvMMCBVv3W0uDjemvCwo4apSHF6kvSTqwLPZIva
 OGxBz/xUj2zd6kZA57Sve/gjjs5eUN59hAUdUv86QiKVhkUy5NbgilN7pklHgP9Lb6gvRmn0sAzuY
 m9pATu7Q==;
Received: from [2001:4bb8:184:72db:8457:d7a:6e21:dd20] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQOuO-00FRV2-G5; Wed, 15 Sep 2021 07:00:46 +0000
From: Christoph Hellwig <hch@lst.de>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Date: Wed, 15 Sep 2021 08:59:56 +0200
Message-Id: <20210915070006.954653-2-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210915070006.954653-1-hch@lst.de>
References: <20210915070006.954653-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Return the encoding table as the return value instead of as
 an argument, and don't bother with the encoding flags as the caller can handle
 that trivially. Signed-off-by: Christoph Hellwig <hch@lst.de> Reviewed-by:
 Gabriel Krisman Bertazi <krisman@collabora.com> Acked-by: Theodore Ts'o
 <tytso@mit.edu> --- fs/ext4/super.c | 21 +++++++ 1 file [...] 
 Content analysis details:   (0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1mQOvL-00BFMa-Tk
Subject: [f2fs-dev] [PATCH 01/11] ext4: simplify ext4_sb_read_encoding
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
Cc: linux-fsdevel@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 linux-ext4@vger.kernel.org, Shreeya Patel <shreeya.patel@collabora.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Return the encoding table as the return value instead of as an argument,
and don't bother with the encoding flags as the caller can handle that
trivially.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Gabriel Krisman Bertazi <krisman@collabora.com>
Acked-by: Theodore Ts'o <tytso@mit.edu>
---
 fs/ext4/super.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index 0775950ee84e3..7401a181878e5 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -2017,24 +2017,17 @@ static const struct ext4_sb_encodings {
 	{EXT4_ENC_UTF8_12_1, "utf8", "12.1.0"},
 };
 
-static int ext4_sb_read_encoding(const struct ext4_super_block *es,
-				 const struct ext4_sb_encodings **encoding,
-				 __u16 *flags)
+static const struct ext4_sb_encodings *
+ext4_sb_read_encoding(const struct ext4_super_block *es)
 {
 	__u16 magic = le16_to_cpu(es->s_encoding);
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(ext4_sb_encoding_map); i++)
 		if (magic == ext4_sb_encoding_map[i].magic)
-			break;
-
-	if (i >= ARRAY_SIZE(ext4_sb_encoding_map))
-		return -EINVAL;
+			return &ext4_sb_encoding_map[i];
 
-	*encoding = &ext4_sb_encoding_map[i];
-	*flags = le16_to_cpu(es->s_encoding_flags);
-
-	return 0;
+	return NULL;
 }
 #endif
 
@@ -4155,10 +4148,10 @@ static int ext4_fill_super(struct super_block *sb, void *data, int silent)
 	if (ext4_has_feature_casefold(sb) && !sb->s_encoding) {
 		const struct ext4_sb_encodings *encoding_info;
 		struct unicode_map *encoding;
-		__u16 encoding_flags;
+		__u16 encoding_flags = le16_to_cpu(es->s_encoding_flags);
 
-		if (ext4_sb_read_encoding(es, &encoding_info,
-					  &encoding_flags)) {
+		encoding_info = ext4_sb_read_encoding(es);
+		if (!encoding_info) {
 			ext4_msg(sb, KERN_ERR,
 				 "Encoding requested by superblock is unknown");
 			goto failed_mount;
-- 
2.30.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
