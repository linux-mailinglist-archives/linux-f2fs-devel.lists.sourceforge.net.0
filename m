Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BC188E3E9D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 24 Oct 2019 23:57:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iNl6c-00064C-5W; Thu, 24 Oct 2019 21:57:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1iNl6b-000645-1f
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 24 Oct 2019 21:57:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Qu9hStTOx3q0SHZZWl0owzLLeI9jLUcX/G95iJY5xa0=; b=II+B+l342u/bjiBT5ZkkGZQ6Le
 NTRm8jteGNRdPdsVAmVhqcTnQdwAIPDmE10NkqFORr/uG0idofCouo+dt1Wg1V9h3nO5Wz5pmhYb4
 W0CO4Fzva+KWv9+a+mpfqWS8WOPF5LfVrirAjw5fqzOiIXD6MyLORZOgwDM2CkWRyxtg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Qu9hStTOx3q0SHZZWl0owzLLeI9jLUcX/G95iJY5xa0=; b=NDd3bbzUTS2XiWdMB5pTvh3ZWY
 mtVQd2n7q6+SPhAdg5dmvqyxdJ5uu4z7BgZCutx0uOBsvZQ1RtqpsC2NsOUor2YncJmKtr/5MdjRK
 cs2n6EC/x+zy09N+4jfPIeRhg/OpNE6SybjvfpdFTje/NltLBOX8dtnDbOYB5YeqLXro=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iNl6Z-00FjuV-MJ
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 24 Oct 2019 21:57:16 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2D22E21BE5;
 Thu, 24 Oct 2019 21:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1571954228;
 bh=+8luL/bZbW80xKvD+Y5+ihdXdtrAmLOtrJQG9TlkZRw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WeOTzezSHVhFDUS3z1MVMNpVpZbieE7y3cb8AVhIwjOipEey9gdJHO8RTPjScbkIN
 jlnEOEd1d386nG02+5FZio0Jh/ncn3P50e86w9T4B29QcJIRQo0pJOzxuDTtOVwFQB
 h0EBva4YYLMQzuwTPA/bB9fWPVxQklx00kF/mkmg=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Thu, 24 Oct 2019 14:54:37 -0700
Message-Id: <20191024215438.138489-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.24.0.rc0.303.g954a862665-goog
In-Reply-To: <20191024215438.138489-1-ebiggers@kernel.org>
References: <20191024215438.138489-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iNl6Z-00FjuV-MJ
Subject: [f2fs-dev] [PATCH v2 2/3] ext4: add support for IV_INO_LBLK_64
 encryption policies
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
Cc: linux-f2fs-devel@lists.sourceforge.net, "Theodore Y . Ts'o" <tytso@mit.edu>,
 Satya Tangirala <satyat@google.com>, Paul Lawrence <paullawrence@google.com>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

IV_INO_LBLK_64 encryption policies have special requirements from the
filesystem beyond those of the existing encryption policies:

- Inode numbers must never change, even if the filesystem is resized.
- Inode numbers must be <= 32 bits.
- File logical block numbers must be <= 32 bits.

ext4 has 32-bit inode and file logical block numbers.  However,
resize2fs can re-number inodes when shrinking an ext4 filesystem.

However, typically the people who would want to use this format don't
care about filesystem shrinking.  They'd be fine with a solution that
just prevents the filesystem from being shrunk.

Therefore, add a new feature flag EXT4_FEATURE_COMPAT_STABLE_INODES that
will do exactly that.  Then wire up the fscrypt_operations to expose
this flag to fs/crypto/, so that it allows IV_INO_LBLK_64 policies when
this flag is set.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/ext4/ext4.h  |  2 ++
 fs/ext4/super.c | 14 ++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
index 03db3e71676ce..b3a2cc7c0252f 100644
--- a/fs/ext4/ext4.h
+++ b/fs/ext4/ext4.h
@@ -1678,6 +1678,7 @@ static inline bool ext4_verity_in_progress(struct inode *inode)
 #define EXT4_FEATURE_COMPAT_RESIZE_INODE	0x0010
 #define EXT4_FEATURE_COMPAT_DIR_INDEX		0x0020
 #define EXT4_FEATURE_COMPAT_SPARSE_SUPER2	0x0200
+#define EXT4_FEATURE_COMPAT_STABLE_INODES	0x0800
 
 #define EXT4_FEATURE_RO_COMPAT_SPARSE_SUPER	0x0001
 #define EXT4_FEATURE_RO_COMPAT_LARGE_FILE	0x0002
@@ -1779,6 +1780,7 @@ EXT4_FEATURE_COMPAT_FUNCS(xattr,		EXT_ATTR)
 EXT4_FEATURE_COMPAT_FUNCS(resize_inode,		RESIZE_INODE)
 EXT4_FEATURE_COMPAT_FUNCS(dir_index,		DIR_INDEX)
 EXT4_FEATURE_COMPAT_FUNCS(sparse_super2,	SPARSE_SUPER2)
+EXT4_FEATURE_COMPAT_FUNCS(stable_inodes,	STABLE_INODES)
 
 EXT4_FEATURE_RO_COMPAT_FUNCS(sparse_super,	SPARSE_SUPER)
 EXT4_FEATURE_RO_COMPAT_FUNCS(large_file,	LARGE_FILE)
diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index dd654e53ba3d9..b3cbf8622eab6 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -1345,6 +1345,18 @@ static bool ext4_dummy_context(struct inode *inode)
 	return DUMMY_ENCRYPTION_ENABLED(EXT4_SB(inode->i_sb));
 }
 
+static bool ext4_has_stable_inodes(struct super_block *sb)
+{
+	return ext4_has_feature_stable_inodes(sb);
+}
+
+static void ext4_get_ino_and_lblk_bits(struct super_block *sb,
+				       int *ino_bits_ret, int *lblk_bits_ret)
+{
+	*ino_bits_ret = 8 * sizeof(EXT4_SB(sb)->s_es->s_inodes_count);
+	*lblk_bits_ret = 8 * sizeof(ext4_lblk_t);
+}
+
 static const struct fscrypt_operations ext4_cryptops = {
 	.key_prefix		= "ext4:",
 	.get_context		= ext4_get_context,
@@ -1352,6 +1364,8 @@ static const struct fscrypt_operations ext4_cryptops = {
 	.dummy_context		= ext4_dummy_context,
 	.empty_dir		= ext4_empty_dir,
 	.max_namelen		= EXT4_NAME_LEN,
+	.has_stable_inodes	= ext4_has_stable_inodes,
+	.get_ino_and_lblk_bits	= ext4_get_ino_and_lblk_bits,
 };
 #endif
 
-- 
2.24.0.rc0.303.g954a862665-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
