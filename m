Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 12221838133
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 23 Jan 2024 03:06:32 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rS6BH-0003dq-1V;
	Tue, 23 Jan 2024 02:06:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <keescook@chromium.org>) id 1rS6BD-0003dj-Q1
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Jan 2024 02:06:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CVxLR6f7iEMo7TAEPfaWn9vwjcL8lBg/KdBkMw33Rxo=; b=VOoECr44230N/uQy+wtMBkLDhI
 qKRECGy66abRpUt68Fw8PGIWK1Uh3ITp8km2c3nH3IrGjLBdjnG44500EmQZ7N+gUg4mkBW4T1tsJ
 5ANTjD9fWKx+auNdWWsmhTwYvrxlBBQLtuPFdF2jn9CHik/EjTMMUuY6jk+9Ekk3YdlU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CVxLR6f7iEMo7TAEPfaWn9vwjcL8lBg/KdBkMw33Rxo=; b=E6pVHukYyhmzAGLmnsBpZrC2h4
 Oso4qH5hXy083zY1fa5osm2p+oXmQcYW9OR8uSUeQV6iex8ejR2gMb+uYAZkRZXxlmTlFXOJI7jfE
 3CGGB1Aahyx0fyGLDeqSQyEmcUZZETISabh2I751xTWwcHiVsW9g+H8l/BEa8uwfekZA=;
Received: from mail-yw1-f173.google.com ([209.85.128.173])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rS6B9-00012K-St for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Jan 2024 02:06:24 +0000
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-60036bfdbfeso847487b3.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 22 Jan 2024 18:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1705975570; x=1706580370;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CVxLR6f7iEMo7TAEPfaWn9vwjcL8lBg/KdBkMw33Rxo=;
 b=K8I8Fc4t8D40YaGPnk3gS37s8Iq4SQS631FoYYC/5FEMCTRmgDcrStkY8HT8tELOll
 TuJ5DQov7iUPq8SmoegtO4UjEs4zjaiiFi0sMSEfB2DTC2mFTJKpka/iRoZwqm8g5HDt
 cdILhSGxd7dnyYWilYS1bhnbgTEc0GzFP3W8w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705975570; x=1706580370;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CVxLR6f7iEMo7TAEPfaWn9vwjcL8lBg/KdBkMw33Rxo=;
 b=t9TeozCUkv+G1N7Ujqhf9rtQoP05AMHoyaGQZMfIPSsi0+kxZlmhnwHg69JZEB93RQ
 wbAbAaWQb3Z+U9VGdLbhSBoY9Ee1XQ5IEMQJ6a9Zoz8lkUOnksFE6RtZSipCgkx6ySnL
 wqMdH58ik4+mB33LsXCyHIiG5fax933JJ/OsEu8x27Ht24Q0gUtF/wDrOtQF4SQjP+eZ
 /ppvo0cI5cMkZVFACXrS6xCPl8vhz8TLhbOZxru9hLQEdP7KUfsSbXZdm6KDt+JHB8Sd
 o+pNoeYsLDemzCt8/rbj4kyhTThoJ8f6icWoDlO1HUlbYvujMymWcrQCxmlWzUwV9oJ0
 gvgA==
X-Gm-Message-State: AOJu0YxWbLTxPdg0tP3DNFLpk4v5/rhvigUPK/BVAUx/JdZmsAWWD9GY
 KpbPVWACEdoK41jLbJaGaxfLFWBKRGwmRkKjnptoiAOgBuWR/ju/bso9Od0gxuC64VEE6bLVXGw
 =
X-Google-Smtp-Source: AGHT+IEn/houl8Yw8FvYMNWC3B8MV8/fbDL4xsjwCWUCzj3v1wRhUvEgEWe5QKZnRXFlO7vX6H4DSA==
X-Received: by 2002:a17:902:f54e:b0:1d7:1e0c:f994 with SMTP id
 h14-20020a170902f54e00b001d71e0cf994mr3335214plf.45.1705969742100; 
 Mon, 22 Jan 2024 16:29:02 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
 by smtp.gmail.com with ESMTPSA id
 mp11-20020a170902fd0b00b001d75ea44323sm1403673plb.21.2024.01.22.16.28.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jan 2024 16:28:52 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: linux-hardening@vger.kernel.org
Date: Mon, 22 Jan 2024 16:27:27 -0800
Message-Id: <20240123002814.1396804-52-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240122235208.work.748-kees@kernel.org>
References: <20240122235208.work.748-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2415; i=keescook@chromium.org; 
 h=from:subject;
 bh=wdQCpDFkq2XNuS6vp7VN0jrvsBX8D7+SnBrIJMJ3N+Q=; 
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlrwgJyxtpoS8kJtZtyqL6hKLCRushNAde9dDbx
 HeAgwOgglaJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZa8ICQAKCRCJcvTf3G3A
 JqIBEAChZM9m9U2HlElYvUdy9F0F0UgsceQedYYNLYx0L54ESBSelfc98YP9tUZ1jkRspBdT1nC
 kijkb49E/qqF4YrjskPndLLLfvxjkzUksvg4xoaV5zyEKUTWNlk+oQ/70241cKc8IGAhpPwQl3j
 IP8LyEb8hrqYd1Gwv05+R/n7XJtH322XuuaSm+VUm++KmFC8YDRf3YRRQE65fPEC2kqrYnLank5
 +wDA7XxfBHYZ5VFHofOMUuKsBwQfmE9o8FtseQm0z4Bo1FQS3oSxQvE673WVKQhVmEwmbOR9ivC
 R5t6LF2QsZrbGDhITRyjy42nBPee5QFqI09uFA+RqI1xhZr+sXi7cXkvN9jzsy4GbJhquMIvoaG
 3y4wcyaqW0M1xPODI0RUOvqlK8vgezTN7sWCM6fcp3eFDI10YvIpiRlsN806ofvtT9OS4OdKak+
 ANIM9E3Ui3D5E/mxLwKbgarX5fgYxrdlwUSwgNaF75JxNETK7fusGPTtlmfq8XYfUeQu9bRajgR
 +XeU5K2axNZCgiE9Kza8K/h1REqqfniSyTWXH5qJS4mqpQk9QgxZgIowNKo/wodiPFN53Bo4WJB
 U5AlyxuOYHJ5rJtrcYirdcrjdv8FILsJ1P8owWZ3SVw0FjZ+qasWTxpHjLsDEI64mmy7fuXj1wv
 UMcFg1tT7pui2bw==
X-Developer-Key: i=keescook@chromium.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
X-Spam-Score: -1.5 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: In an effort to separate intentional arithmetic wrap-around
 from unexpected wrap-around, we need to refactor places that depend on this
 kind of math. One of the most common code patterns of this is: VAR + value
 < VAR Content analysis details:   (-1.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.173 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.173 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rS6B9-00012K-St
Subject: [f2fs-dev] [PATCH 52/82] f2fs: Refactor intentional wrap-around test
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
Cc: Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

In an effort to separate intentional arithmetic wrap-around from
unexpected wrap-around, we need to refactor places that depend on this
kind of math. One of the most common code patterns of this is:

	VAR + value < VAR

Notably, this is considered "undefined behavior" for signed and pointer
types, which the kernel works around by using the -fno-strict-overflow
option in the build[1] (which used to just be -fwrapv). Regardless, we
want to get the kernel source to the position where we can meaningfully
instrument arithmetic wrap-around conditions and catch them when they
are unexpected, regardless of whether they are signed[2], unsigned[3],
or pointer[4] types.

Refactor open-coded wrap-around addition test to use add_would_overflow().
This paves the way to enabling the wrap-around sanitizers in the future.

Link: https://git.kernel.org/linus/68df3755e383e6fecf2354a67b08f92f18536594 [1]
Link: https://github.com/KSPP/linux/issues/26 [2]
Link: https://github.com/KSPP/linux/issues/27 [3]
Link: https://github.com/KSPP/linux/issues/344 [4]
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 fs/f2fs/file.c   | 2 +-
 fs/f2fs/verity.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index b58ab1157b7e..6360efb98f64 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2819,7 +2819,7 @@ static int f2fs_move_file_range(struct file *file_in, loff_t pos_in,
 	}
 
 	ret = -EINVAL;
-	if (pos_in + len > src->i_size || pos_in + len < pos_in)
+	if (pos_in + len > src->i_size || add_would_overflow(pos_in, len))
 		goto out_unlock;
 	if (len == 0)
 		olen = len = src->i_size - pos_in;
diff --git a/fs/f2fs/verity.c b/fs/f2fs/verity.c
index 4fc95f353a7a..b641cb8d75e8 100644
--- a/fs/f2fs/verity.c
+++ b/fs/f2fs/verity.c
@@ -237,7 +237,7 @@ static int f2fs_get_verity_descriptor(struct inode *inode, void *buf,
 	pos = le64_to_cpu(dloc.pos);
 
 	/* Get the descriptor */
-	if (pos + size < pos || pos + size > inode->i_sb->s_maxbytes ||
+	if (add_would_overflow(pos, size) || pos + size > inode->i_sb->s_maxbytes ||
 	    pos < f2fs_verity_metadata_pos(inode) || size > INT_MAX) {
 		f2fs_warn(F2FS_I_SB(inode), "invalid verity xattr");
 		f2fs_handle_error(F2FS_I_SB(inode),
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
