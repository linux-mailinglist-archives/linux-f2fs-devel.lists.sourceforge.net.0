Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C305B216C8E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  7 Jul 2020 14:12:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KEKMsm4EesiH4c5TUtnNdrzzwMHigZnvFirOYEwUbaQ=; b=RERaXOU7+o9/DScNttjVaWfBq
	66qHJn5XU0XoqZDcTPexWe/+m49S3Kdo73NEWzdEFKnLQVh6PTa91ogeLJYz/UdadPEN5XjXZGnzm
	S52k41Q/4clRn+ZPqOiWE68mqDdjyIqFIIV3OWdbN83U/uEfR/wLaiwGni3U5oNyqK35Y=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jsmSc-00059Y-TU; Tue, 07 Jul 2020 12:12:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3SWAEXwYKABo3HEI4D6EE6B4.2EC@flex--drosen.bounces.google.com>)
 id 1jsmSZ-00058v-5t
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 07 Jul 2020 12:12:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jQyiEHFjczWzBCWOEg21Dcl16Iq/vsWySX7c2PwkqrE=; b=Lz9LPvyDhVLGbF5gMbqezHTWh
 JXQP0Uw4pK5qlGk05uUwluJ56XpBvEEm35LLVMnHNkW5159a7zN+Zz42gVy+rsfeujdTi7AQ+vfPi
 kC4IAnC6Th1ZBzjQQJgsLG8lMpxxN5ydnqeDjMBfljCUjz85BP/Ng90XMLVlcZ87t+7ik=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jQyiEHFjczWzBCWOEg21Dcl16Iq/vsWySX7c2PwkqrE=; b=eJ3prpcw0XFkNzwdqGCuzy9Ffd
 9umz6Qs5o5F1IwstO1jt2tcqFQv8UsaRmz1t31/54BhZwQVeG1OjIZc6YMY09KudlqnSQ7YuljOh0
 gaTbi/DmkfhK+uLf0sc5yjVel/q4Ik14aA9XTgKyC2kZjEMJnqWUOGoFMizKwbyctbAc=;
Received: from mail-qk1-f201.google.com ([209.85.222.201])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jsmSY-00AAT0-0O
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 07 Jul 2020 12:12:27 +0000
Received: by mail-qk1-f201.google.com with SMTP id i3so22188682qkf.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 07 Jul 2020 05:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=jQyiEHFjczWzBCWOEg21Dcl16Iq/vsWySX7c2PwkqrE=;
 b=ZmBSb4zIpxtUA454VMGhfcQ9VXbfiwePK53hyXdsZi/OZ0f5+Bz2uVBr3xj2TKppN6
 EoPxCIKQ+VWRASd9lTnzet+w66GUQOa/MSXAHDNfwFI8s/aQCpXH8A+b8jG/JGiOOXM3
 lh9d4eO/HcQmfXGsnqolSUxMv/rGrOYQSDOSg4E4qsxqLw1yrGGdNWMXJXpJoO8GkiYH
 Zs0WFmNyeuofLW0RwyBqsdv874fPDW9mVsODa+zKxUQbp12ERmIsJeCvn2f2aZgSMKca
 xhCdS6J51GvK0Wl8ldcGVc1wheWiJGRDS+8rNyjU6sZ28byoGRa7WMz+m2iYmNgBCUYc
 tQSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=jQyiEHFjczWzBCWOEg21Dcl16Iq/vsWySX7c2PwkqrE=;
 b=jz4tO4YNzo5Ism1amRUgskaRftBfkCd19qwAGuGif59Zf0QIA6RScpnBH6DN8Dezw4
 r4LQy9kzSc6ECsXbc88oka7pjccB8VX3k7ZHt7HGKZErJbT16N/GQKG2X+BTtI4t1NFN
 GyvuJF4PN/UDeDyjxytfchqoSRmR+9NHytqNX+z5CHiCJxVTmLYMAsUCdOOW3pxoSr89
 +dWUEDDHbmCSD5+d0cD4Kw51/5NjCqGbstSoFd4djZCqJsAUZUVfrWENqfDScm6+WcNx
 hCNEfmxReDBTDtgmpwYFOVgBu2clzWFyH2uycjUSKKjs4bF5eWr13N2ZXPqh1sFhPtZa
 Srlw==
X-Gm-Message-State: AOAM532IWZLxWw8Oa7AJE7u/jIoU1CHOu6lEFq0eQ56xBIIew7wLLVoc
 x0u3QSar4jlAb0h1GkHAqAUnCXThXQI=
X-Google-Smtp-Source: ABdhPJyO1nZSZAAVf0GM6Kj7adkJ/AeTSgpaotG5seZLgh6nPg0Hy3BHnx89r9ml0wyh6q0bvtKq9WocNJE=
X-Received: by 2002:a17:902:e9d2:: with SMTP id
 18mr45065394plk.40.1594122313282; 
 Tue, 07 Jul 2020 04:45:13 -0700 (PDT)
Date: Tue,  7 Jul 2020 04:31:20 -0700
In-Reply-To: <20200707113123.3429337-1-drosen@google.com>
Message-Id: <20200707113123.3429337-2-drosen@google.com>
Mime-Version: 1.0
References: <20200707113123.3429337-1-drosen@google.com>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
To: "Theodore Ts'o" <tytso@mit.edu>, linux-ext4@vger.kernel.org, 
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, 
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>, 
 linux-fscrypt@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.222.201 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.201 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
X-Headers-End: 1jsmSY-00AAT0-0O
Subject: [f2fs-dev] [PATCH v10 1/4] unicode: Add utf8_casefold_hash
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
Cc: Daniel Rosenberg <drosen@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 linux-fsdevel@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This adds a case insensitive hash function to allow taking the hash
without needing to allocate a casefolded copy of the string.

The existing d_hash implementations for casefolding allocates memory
within rcu-walk, by avoiding it we can be more efficient and avoid
worrying about a failed allocation.

Signed-off-by: Daniel Rosenberg <drosen@google.com>
---
 fs/unicode/utf8-core.c  | 23 ++++++++++++++++++++++-
 include/linux/unicode.h |  3 +++
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/fs/unicode/utf8-core.c b/fs/unicode/utf8-core.c
index 2a878b739115..dc25823bfed9 100644
--- a/fs/unicode/utf8-core.c
+++ b/fs/unicode/utf8-core.c
@@ -6,6 +6,7 @@
 #include <linux/parser.h>
 #include <linux/errno.h>
 #include <linux/unicode.h>
+#include <linux/stringhash.h>
 
 #include "utf8n.h"
 
@@ -122,9 +123,29 @@ int utf8_casefold(const struct unicode_map *um, const struct qstr *str,
 	}
 	return -EINVAL;
 }
-
 EXPORT_SYMBOL(utf8_casefold);
 
+int utf8_casefold_hash(const struct unicode_map *um, const void *salt,
+		       struct qstr *str)
+{
+	const struct utf8data *data = utf8nfdicf(um->version);
+	struct utf8cursor cur;
+	int c;
+	unsigned long hash = init_name_hash(salt);
+
+	if (utf8ncursor(&cur, data, str->name, str->len) < 0)
+		return -EINVAL;
+
+	while ((c = utf8byte(&cur))) {
+		if (c < 0)
+			return -EINVAL;
+		hash = partial_name_hash((unsigned char)c, hash);
+	}
+	str->hash = end_name_hash(hash);
+	return 0;
+}
+EXPORT_SYMBOL(utf8_casefold_hash);
+
 int utf8_normalize(const struct unicode_map *um, const struct qstr *str,
 		   unsigned char *dest, size_t dlen)
 {
diff --git a/include/linux/unicode.h b/include/linux/unicode.h
index 990aa97d8049..74484d44c755 100644
--- a/include/linux/unicode.h
+++ b/include/linux/unicode.h
@@ -27,6 +27,9 @@ int utf8_normalize(const struct unicode_map *um, const struct qstr *str,
 int utf8_casefold(const struct unicode_map *um, const struct qstr *str,
 		  unsigned char *dest, size_t dlen);
 
+int utf8_casefold_hash(const struct unicode_map *um, const void *salt,
+		       struct qstr *str);
+
 struct unicode_map *utf8_load(const char *version);
 void utf8_unload(struct unicode_map *um);
 
-- 
2.27.0.212.ge8ba1cc988-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
