Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E46218334
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  8 Jul 2020 11:12:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2y7qm4n1Vgfka795TqiAuHCOqS4RjnRDfb4Vznkygfg=; b=lkMAynt7haTwLElXHjsca1tFB
	3o7PPQXafheq/xF+qtckC/gxmzXR8jldlkLUdQlJTuT4uSRpkHbEqklCIvGylZ0wCLC2sKHoVF8q+
	65U6NACbLXqxuHvtUDGMqL5yu/MYayzvp4UphiUT0TpWHvfJE7SIoBexqvs3YTHOdAYoc=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jt68J-0004PA-C0; Wed, 08 Jul 2020 09:12:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3Co4FXwYKADsaolpbkdlldib.Zlj@flex--drosen.bounces.google.com>)
 id 1jt68H-0004OP-TZ
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Jul 2020 09:12:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wV4Dlp1PtfRWNCEDy3OUVmwFuHR/znQviVm4udIzuj8=; b=Ex7RBmbIb6x+IoefBXJCg0m+d
 Jf/oEpANTI9YexxrrGVyVs5zRtFGcWzLNc27jtvPKM/ippJD5oL59j/8/YVtx1tpVojZe8lZKn4eK
 By3/wVHbBZdSIKzHbf5ZUtbEmKnSfQ52k99JPJ8wiDxz+1QCLJKtpUFPFi014DdynpzkE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wV4Dlp1PtfRWNCEDy3OUVmwFuHR/znQviVm4udIzuj8=; b=Mkv1TEIrNgvnskmT1kstPESFT7
 0SYgB9/wcCYi3HPS5QITPEaoaWX9RgtgBUpP1U6Zn6fWGikbWX2cdHNB4eJg2yYA+77tJNcZKdLzG
 AVXIQRxEkoJrKz/afoZKrOdPACMWO63/aalwnQ7jmK95BTbhOlN40uQSG9loburHlyAI=;
Received: from mail-yb1-f201.google.com ([209.85.219.201])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jt68G-00E1rr-JR
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Jul 2020 09:12:49 +0000
Received: by mail-yb1-f201.google.com with SMTP id u64so36034671ybf.13
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 08 Jul 2020 02:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=wV4Dlp1PtfRWNCEDy3OUVmwFuHR/znQviVm4udIzuj8=;
 b=TmfFQqldI6NR71g11ccYeLYb4YMRJ9TbhNQpLgbner44eVMPHA3+K4/r3OVoQRVqiU
 oNB0e489EVTL8XxXR17WKGxWV7xu+at9ec0oMAxeMgcQ5T9k9n+ssKWhtmWGqmjnLnUM
 6BeB3sGPZLxW+Crt0D7Jg9uTB3Ou/lbVcbRxBFVNT1U7DJ5xXK91RBF+UxS6r65lKZvH
 mb0YANeHYaPI2HDI/q5KpLu4zwrnZ/Hd496MiPfyQOJR1nAqzsvRk07T0x7CzCU/v40I
 9VR02aGQQCuV7etZAmEfaL4xiNC9HANSW/5B2aq3+iMK4Qs+wEkrnXqi/ckFCoDMjrjA
 I0tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=wV4Dlp1PtfRWNCEDy3OUVmwFuHR/znQviVm4udIzuj8=;
 b=OG19HLUDd3Ppxa6eFSf2RBdRiXK9tNPG6mJIKDzS7xzf+GGIBmS/61Fcqm4hawryEW
 xUmu9CYivhuFAiitGpIkHxhJ9GQb6OyA8F2dOGop6eSmn4v1Me1coUtPeQZu941v/nbV
 yuL4bCTC6T8dDeAdQ6hkC7PLpWVd8C4+RW3ZXYUURo7xkmq0xeM7Y3/r4uODprQeuiHx
 0KBF/Y2LUfH6iPIUw4EVQ976sHrAREsUC+2oLok8J5DotU28Gyne4/nP0phJ3mc2Q7eK
 euWMFLeXC/9Le6ig49N0ltXGzyuh0SmdWl6FNSD8JO1KdRL43cSofhRILVBmdxr2gfx0
 EDGA==
X-Gm-Message-State: AOAM5330Xhd5e6roIhp+lEJCwwSqvlgBwnfetkgkLiVkzcTBUXbYT90W
 l+byY0QYqOX/PeNCrugiKRfaVaiFyO8=
X-Google-Smtp-Source: ABdhPJxT53xSTJPoJDE7zNOjGdUzwbWSLO3iz5TcZnavMsDjJ7aSH9oD27jm9uQKje34VSZMZujf2U3uXyg=
X-Received: by 2002:a25:9a41:: with SMTP id r1mr1597091ybo.516.1594199562803; 
 Wed, 08 Jul 2020 02:12:42 -0700 (PDT)
Date: Wed,  8 Jul 2020 02:12:34 -0700
In-Reply-To: <20200708091237.3922153-1-drosen@google.com>
Message-Id: <20200708091237.3922153-2-drosen@google.com>
Mime-Version: 1.0
References: <20200708091237.3922153-1-drosen@google.com>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
To: "Theodore Ts'o" <tytso@mit.edu>, linux-ext4@vger.kernel.org, 
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, 
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>, 
 linux-fscrypt@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: collabora.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.219.201 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.201 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jt68G-00E1rr-JR
Subject: [f2fs-dev] [PATCH v12 1/4] unicode: Add utf8_casefold_hash
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
Cc: Daniel Rosenberg <drosen@google.com>, Eric Biggers <ebiggers@google.com>,
 kernel-team@android.com, linux-kernel@vger.kernel.org,
 Andreas Dilger <adilger.kernel@dilger.ca>, linux-fsdevel@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This adds a case insensitive hash function to allow taking the hash
without needing to allocate a casefolded copy of the string.

The existing d_hash implementations for casefolding allocate memory
within rcu-walk, by avoiding it we can be more efficient and avoid
worrying about a failed allocation.

Signed-off-by: Daniel Rosenberg <drosen@google.com>
Reviewed-by: Gabriel Krisman Bertazi <krisman@collabora.com>
Reviewed-by: Eric Biggers <ebiggers@google.com>
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
2.27.0.383.g050319c2ae-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
