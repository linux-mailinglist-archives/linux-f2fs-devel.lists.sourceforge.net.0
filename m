Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B74AC896745
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  3 Apr 2024 09:52:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rrvQE-0002nk-D4;
	Wed, 03 Apr 2024 07:52:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sweettea-kernel@dorminy.me>) id 1rrvQ9-0002mV-UI
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 03 Apr 2024 07:52:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DbnwEYctC+JK8P/EWPZTBgKnomIWJC9/OakieGz83Y4=; b=EYAElkzrs0pN/SWdf2uXeyP+Pk
 a1qQcXXMtUW65HXNwpM9Db6YerJ+nnPGo/OrhQUkQ3xyDNFRm98ihXt3P90n8i78zVFBACKLRgA5l
 yovwmhdmBdUor8qZAxU3xVCzv7pK5mP8dqtnsVupz1fP9VQm0OY/irxO3v7mZoSjV95Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DbnwEYctC+JK8P/EWPZTBgKnomIWJC9/OakieGz83Y4=; b=hronlmkdlXPq3/m1lOT75qLPMr
 QxydsmdtgqD7sYpwfSxy8rb2unKhG0U7RpgjOGPOH5epMeq2Sv6hWbBDkVZXcFzW7LbUY/YNNXIIe
 ZN7j29XORL5bW331/rILVfdhCNhlcLAVOyco2Wv/1gyqio/anEFuJM5mhkERyuLlilcg=;
Received: from box.fidei.email ([71.19.144.250])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rrvQ3-0001lb-Vo for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 03 Apr 2024 07:52:28 +0000
Received: from authenticated-user (box.fidei.email [71.19.144.250])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by box.fidei.email (Postfix) with ESMTPSA id CBFF38083F;
 Wed,  3 Apr 2024 03:33:39 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dorminy.me; s=mail;
 t=1712129620; bh=SgpqdEQktNmIE/si/SsUXivp3OLO9RykBmr/owEiMwk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=XAboOI1gOEYEeFHrK1IrQoakMcUXsIMd5sSfqTDBehMhEAI8iLj2M4cvGuZWOnlea
 sptYc4MV8Ozdb9aTADpJGN+8wTnZ7a4nquwTvUU7Fg8MmCD8svm0CoyTyh7cz/SBD+
 ZMFxSNY4lqBJ9+dz+mPFPmrNmB+z57J2Ezal//nHLbJPn2kpBB/DeRdnynt73/ONre
 w1nx6Q9inAxG9UN8ga9ww6DJNwFqfSLAGdGXdXScTmCspAGRxQd722JIdIuqf41v1U
 vpPKduXjNxy+o5h6VMKoOcFf5LJdNmM7bXsHLaUDtdElsmkXjDqye/eAoNu2dZVkZX
 f6UzUKP6VJHVQ==
To: Jonathan Corbet <corbet@lwn.net>,
 Kent Overstreet <kent.overstreet@linux.dev>,
 Brian Foster <bfoster@redhat.com>, Chris Mason <clm@fb.com>,
 Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
 Sweet Tea Dorminy <sweettea-kernel@dorminy.me>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-bcachefs@vger.kernel.org,
 linux-btrfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, kernel-team@meta.com
Date: Wed,  3 Apr 2024 03:22:52 -0400
Message-ID: <b9b795987a485afa0fdb8f0decc09405691d9320.1712126039.git.sweettea-kernel@dorminy.me>
In-Reply-To: <cover.1712126039.git.sweettea-kernel@dorminy.me>
References: <cover.1712126039.git.sweettea-kernel@dorminy.me>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Signed-off-by: Sweet Tea Dorminy <sweettea-kernel@dorminy.me>
 --- fs/bcachefs/fs.c | 18 ++++++++++++------ 1 file changed, 12 insertions(+), 
 6 deletions(-) diff --git a/fs/bcachefs/fs.c b/fs/bcachefs/fs.c index
 f830578a9cd1..d2793bae842d
 100644 --- a/fs/bcachefs/fs.c +++ b/fs/bcachefs/fs.c @@ -913,15 +913,17 @@
 static int bch2_fill_extent(struct bch_fs * [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: dorminy.me]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1rrvQ3-0001lb-Vo
Subject: [f2fs-dev] [PATCH v3 11/13] bcachefs: fiemap: return correct extent
 physical length
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
From: Sweet Tea Dorminy via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Sweet Tea Dorminy <sweettea-kernel@dorminy.me>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Signed-off-by: Sweet Tea Dorminy <sweettea-kernel@dorminy.me>
---
 fs/bcachefs/fs.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/fs/bcachefs/fs.c b/fs/bcachefs/fs.c
index f830578a9cd1..d2793bae842d 100644
--- a/fs/bcachefs/fs.c
+++ b/fs/bcachefs/fs.c
@@ -913,15 +913,17 @@ static int bch2_fill_extent(struct bch_fs *c,
 			flags |= FIEMAP_EXTENT_SHARED;
 
 		bkey_for_each_ptr_decode(k.k, ptrs, p, entry) {
-			int flags2 = 0;
+			int flags2 = FIEMAP_EXTENT_HAS_PHYS_LEN;
+			u64 phys_len = k.k->size << 9;
 			u64 offset = p.ptr.offset;
 
 			if (p.ptr.unwritten)
 				flags2 |= FIEMAP_EXTENT_UNWRITTEN;
 
-			if (p.crc.compression_type)
+			if (p.crc.compression_type) {
 				flags2 |= FIEMAP_EXTENT_ENCODED;
-			else
+				phys_len = p.crc.compressed_size << 9;
+			} else
 				offset += p.crc.offset;
 
 			if ((offset & (block_sectors(c) - 1)) ||
@@ -931,7 +933,7 @@ static int bch2_fill_extent(struct bch_fs *c,
 			ret = fiemap_fill_next_extent(info,
 						bkey_start_offset(k.k) << 9,
 						offset << 9,
-						k.k->size << 9, 0,
+						k.k->size << 9, phys_len,
 						flags|flags2);
 			if (ret)
 				return ret;
@@ -941,14 +943,18 @@ static int bch2_fill_extent(struct bch_fs *c,
 	} else if (bkey_extent_is_inline_data(k.k)) {
 		return fiemap_fill_next_extent(info,
 					       bkey_start_offset(k.k) << 9,
-					       0, k.k->size << 9, 0,
+					       0, k.k->size << 9,
+					       bkey_inline_data_bytes(k.k),
 					       flags|
+					       FIEMAP_EXTENT_HAS_PHYS_LEN|
 					       FIEMAP_EXTENT_DATA_INLINE);
 	} else if (k.k->type == KEY_TYPE_reservation) {
 		return fiemap_fill_next_extent(info,
 					       bkey_start_offset(k.k) << 9,
-					       0, k.k->size << 9, 0,
+					       0, k.k->size << 9,
+					       k.k->size << 9,
 					       flags|
+					       FIEMAP_EXTENT_HAS_PHYS_LEN|
 					       FIEMAP_EXTENT_DELALLOC|
 					       FIEMAP_EXTENT_UNWRITTEN);
 	} else {
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
