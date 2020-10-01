Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D53E27F6AB
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  1 Oct 2020 02:26:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kNmQ4-00008I-VV; Thu, 01 Oct 2020 00:26:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kNmPv-00006t-JE
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 01 Oct 2020 00:25:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=66gCDVn4kxXXVokylyhk9FEo1CqMJx+3Bb9H6hFy0DU=; b=ZJq5CSvohYFyhiRC6WH/0F5ZQT
 uqvWTfD0TWFVnqbME1ONLdqjGqZ4OTDY5ipiX5aDU555oZKaCYbJrzwx5savnvaS2Rng8Dld+eJ78
 AK5sd9GdbVnTwh99mANziPf+555ciB+xroDvP+8Z2wT30Fw0kbmib4ybM4g1k4+8Ht1M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=66gCDVn4kxXXVokylyhk9FEo1CqMJx+3Bb9H6hFy0DU=; b=hySISSuqVWuj7lENw3ZKvCCyN7
 BFAVw7On2zOCaqS2jcwlzjvHUfGbZeTi/qIdaDJ2Z7tL+UtaE8uoSLecWfwUgsKVCvf1w68nUmbms
 +PUWzZXofklM9GycASgC/VkjTewzDO48W6QzHX2nlZge8I9dTiV0H1ULtdW4okZIBlek=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kNmPj-00FF7c-NH
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 01 Oct 2020 00:25:51 +0000
Received: from sol.attlocal.net
 (172-10-235-113.lightspeed.sntcca.sbcglobal.net [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B09A42137B;
 Thu,  1 Oct 2020 00:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601511931;
 bh=AGubCD10XBlKo8JYnXqWoiKHjQL8sCZMhLNdjEghw3M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=t/om2tj8UavJ78dCqglF8OixStJc8ig0iCPkyQq6b9qWcaF/gzzvhGAIpyCY5v5hd
 TYiEyOIzHTqjBz3re7L2XK11O6P+bvyhhfyiLckgFaqHZ71u1kV/saLp1mD9eD++ix
 zEYTocaQZ+YcRuy9Qq+ZwUuiGwJ0I+p/xhGzqi0c=
From: Eric Biggers <ebiggers@kernel.org>
To: fstests@vger.kernel.org
Date: Wed, 30 Sep 2020 17:25:05 -0700
Message-Id: <20201001002508.328866-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201001002508.328866-1-ebiggers@kernel.org>
References: <20201001002508.328866-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kNmPj-00FF7c-NH
Subject: [f2fs-dev] [PATCH 3/5] fscrypt-crypt-util: add --block-number option
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-fscrypt@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Currently fscrypt-crypt-util assumes that the number of the first block
encrypted/decrypted is 0.  I.e., it replicates either contents
encryption from the start of a file, or encryption of a filename.

However, to easily test compression+encryption on f2fs, we need the
ability to specify a different starting block number.

Add a --block-number option which does this.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 src/fscrypt-crypt-util.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/src/fscrypt-crypt-util.c b/src/fscrypt-crypt-util.c
index 5c065116..26698d7a 100644
--- a/src/fscrypt-crypt-util.c
+++ b/src/fscrypt-crypt-util.c
@@ -59,6 +59,8 @@ static void usage(FILE *fp)
 "WARNING: this program is only meant for testing, not for \"real\" use!\n"
 "\n"
 "Options:\n"
+"  --block-number=BNUM         Starting block number for IV generation.\n"
+"                                Default: 0\n"
 "  --block-size=BLOCK_SIZE     Encrypt each BLOCK_SIZE bytes independently.\n"
 "                                Default: 4096 bytes\n"
 "  --decrypt                   Decrypt instead of encrypt\n"
@@ -1787,6 +1789,7 @@ struct key_and_iv_params {
 	bool file_nonce_specified;
 	bool iv_ino_lblk_64;
 	bool iv_ino_lblk_32;
+	u64 block_number;
 	u64 inode_number;
 	u8 fs_uuid[UUID_SIZE];
 	bool fs_uuid_specified;
@@ -1839,6 +1842,9 @@ static void get_key_and_iv(const struct key_and_iv_params *params,
 
 	memset(iv, 0, sizeof(*iv));
 
+	/* Overridden later for iv_ino_lblk_{64,32} */
+	iv->block_number = cpu_to_le64(params->block_number);
+
 	if (params->iv_ino_lblk_64 || params->iv_ino_lblk_32) {
 		const char *opt = params->iv_ino_lblk_64 ? "--iv-ino-lblk-64" :
 							   "--iv-ino-lblk-32";
@@ -1852,6 +1858,8 @@ static void get_key_and_iv(const struct key_and_iv_params *params,
 			die("%s requires --inode-number", opt);
 		if (params->mode_num == 0)
 			die("%s requires --mode-num", opt);
+		if (params->block_number > UINT32_MAX)
+			die("%s can't use --block-number > UINT32_MAX", opt);
 		if (params->inode_number > UINT32_MAX)
 			die("%s can't use --inode-number > UINT32_MAX", opt);
 	}
@@ -1881,6 +1889,7 @@ static void get_key_and_iv(const struct key_and_iv_params *params,
 			info[infolen++] = params->mode_num;
 			memcpy(&info[infolen], params->fs_uuid, UUID_SIZE);
 			infolen += UUID_SIZE;
+			iv->block_number32 = cpu_to_le32(params->block_number);
 			iv->inode_number = cpu_to_le32(params->inode_number);
 		} else if (params->iv_ino_lblk_32) {
 			info[infolen++] = HKDF_CONTEXT_IV_INO_LBLK_32_KEY;
@@ -1888,7 +1897,9 @@ static void get_key_and_iv(const struct key_and_iv_params *params,
 			memcpy(&info[infolen], params->fs_uuid, UUID_SIZE);
 			infolen += UUID_SIZE;
 			iv->block_number32 =
-				cpu_to_le32(hash_inode_number(params));
+				cpu_to_le32(hash_inode_number(params) +
+					    params->block_number);
+			iv->inode_number = 0;
 		} else if (params->mode_num != 0) {
 			info[infolen++] = HKDF_CONTEXT_DIRECT_KEY;
 			info[infolen++] = params->mode_num;
@@ -1913,6 +1924,7 @@ static void get_key_and_iv(const struct key_and_iv_params *params,
 }
 
 enum {
+	OPT_BLOCK_NUMBER,
 	OPT_BLOCK_SIZE,
 	OPT_DECRYPT,
 	OPT_FILE_NONCE,
@@ -1927,6 +1939,7 @@ enum {
 };
 
 static const struct option longopts[] = {
+	{ "block-number",    required_argument, NULL, OPT_BLOCK_NUMBER },
 	{ "block-size",      required_argument, NULL, OPT_BLOCK_SIZE },
 	{ "decrypt",         no_argument,       NULL, OPT_DECRYPT },
 	{ "file-nonce",      required_argument, NULL, OPT_FILE_NONCE },
@@ -1968,6 +1981,12 @@ int main(int argc, char *argv[])
 
 	while ((c = getopt_long(argc, argv, "", longopts, NULL)) != -1) {
 		switch (c) {
+		case OPT_BLOCK_NUMBER:
+			errno = 0;
+			params.block_number = strtoull(optarg, &tmp, 10);
+			if (*tmp || errno)
+				die("Invalid block number: %s", optarg);
+			break;
 		case OPT_BLOCK_SIZE:
 			errno = 0;
 			block_size = strtoul(optarg, &tmp, 10);
-- 
2.28.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
