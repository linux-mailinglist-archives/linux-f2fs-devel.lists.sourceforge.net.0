Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 526207B3E24
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 30 Sep 2023 07:01:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qmS6m-0000aw-3I;
	Sat, 30 Sep 2023 05:01:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <wedsonaf@gmail.com>) id 1qmS6j-0000aj-Tn
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 30 Sep 2023 05:01:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BqRIIscirReKomhnn9aWQqgUEl26ak+53Sd7DXm6yNk=; b=b5t7eaaL+iZnufd8XfRS2zjubB
 cUUrlMD/u12wknYbKIEer+AhJOy5HLOSEW4INmvuKF8CLBoQ/LUUnPwu2huDiOiSM+XLkfQ3bVMtC
 i0nrb9bM9PaAZFa3KlqH/rtR8SlO4Ijw4EUfZLUvECrqNl88tj7MryhsU2mrD/XnLbMQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BqRIIscirReKomhnn9aWQqgUEl26ak+53Sd7DXm6yNk=; b=X5NMZ7yOWukYr5ohjs5O+LgN+i
 W4FSd+6S8BEHFI3cAJ2RaN7mXO8omZpZOzlXG1tB6DDitKfN7fgT7sojzc+FabWOaGVOXSLgE5Y+B
 AnxWqoIjDbw5xuGRpeK2pS+Esbe8l28LXQxlw1hdn7/97HHWpCPM20oDF9arNubpSCKQ=;
Received: from mail-pl1-f181.google.com ([209.85.214.181])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qmS6i-0004nS-1N for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 30 Sep 2023 05:01:37 +0000
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-1c5bf7871dcso121190685ad.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 29 Sep 2023 22:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696050090; x=1696654890; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BqRIIscirReKomhnn9aWQqgUEl26ak+53Sd7DXm6yNk=;
 b=PzosFhByHZeKuuMNVyXQBWZAJKHWUDBVK5OTwPyCok76VE7i/IMBR5zJmgdQfHeB1r
 kVW+qlfuQczmdWhGJ+rZrz7wFSVgFOwWg6UhC74vha40V7njWWsV3v7W3GYTEQVdMRS3
 qB8H0wgcITWicPX+RR8DSRBlZMMGfkXrN2d/CPW0J+H+BupHpc2Iaf1ok0ykW+qvcFOL
 Txvq+v8FMRBgQLEroU53dX1TizVDIcZndn/p6sQi92fTM8wkz9X9odF76Ghxd8ZjKIOf
 alg4ntQHjiqfVMahO5yTnbOde6hHHqh99PqKeWTsBkUlmOg7+P8WNGelmLcVgWOssNfe
 NFAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696050090; x=1696654890;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BqRIIscirReKomhnn9aWQqgUEl26ak+53Sd7DXm6yNk=;
 b=pkKLiPo8UQyhFZGjdc2WilkYsJHPPmIEpugm3xIh6IHUIM7Q/zIxBLDoFKvqonTh4O
 SN8byoriRe8k/01zTt3lFc6Il+AmQibZUEHVuc1wQthK1JtXmyU8JhZXHl2JDG5gO5mp
 uYbk0Byu8SR9rBJM5hgK5uL+GB2lEAcmGHrZG+ijZpqQhb+TLeehCVmtf0UeChCSxtb5
 I4f4Gm3n+loodYOgcryq7hiHXxkBadXYGmCAHYW9t2Vgpz0HW/Zj6Eme7ym0nr9AUtfs
 OpJUHVQmKeDrBl5OcYQYljcTsQ2q3kw0TBGSfyxADwJuaWucWQNzpLpIsDL0D8CMHvJ0
 Z3qg==
X-Gm-Message-State: AOJu0YzeWKgBzULPdNmyPvT6Eerup86Thha7GA7KJ7a1JucjrVwZfSsA
 1NWCf0L5fb4i0FWbTjLTAck=
X-Google-Smtp-Source: AGHT+IFmXRu8d6qDpLkIqSWIVe9p5te2KB46ZsYikIRm4E6Z4vdff7fDocDNnF8ojVR4oc3Gyyl2kw==
X-Received: by 2002:a17:902:c94d:b0:1c7:4a8a:32d1 with SMTP id
 i13-20020a170902c94d00b001c74a8a32d1mr2347477pla.28.1696050090497; 
 Fri, 29 Sep 2023 22:01:30 -0700 (PDT)
Received: from wedsonaf-dev.home.lan ([189.124.190.154])
 by smtp.googlemail.com with ESMTPSA id
 y10-20020a17090322ca00b001c322a41188sm392136plg.117.2023.09.29.22.01.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Sep 2023 22:01:30 -0700 (PDT)
From: Wedson Almeida Filho <wedsonaf@gmail.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org
Date: Sat, 30 Sep 2023 02:00:14 -0300
Message-Id: <20230930050033.41174-11-wedsonaf@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230930050033.41174-1-wedsonaf@gmail.com>
References: <20230930050033.41174-1-wedsonaf@gmail.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Wedson Almeida Filho This makes it harder for
 accidental
 or malicious changes to f2fs_xattr_handlers or f2fs_xattr_handler_map at
 runtime. Cc: Jaegeuk Kim Cc: Chao Yu Cc:
 linux-f2fs-devel@lists.sourceforge.net
 Signed-off-by: Wedson Almeida Filho --- fs/f2fs/xattr.c | 4 ++--
 fs/f2fs/xattr.h
 | 2 +- 2 files changed, 3 insertions(+), 3 [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [wedsonaf[at]gmail.com]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.181 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.181 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1qmS6i-0004nS-1N
Subject: [f2fs-dev] [PATCH 10/29] f2fs: move f2fs_xattr_handlers and
 f2fs_xattr_handler_map to .rodata
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, Wedson Almeida Filho <walmeida@microsoft.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Wedson Almeida Filho <walmeida@microsoft.com>

This makes it harder for accidental or malicious changes to
f2fs_xattr_handlers or f2fs_xattr_handler_map at runtime.

Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net
Signed-off-by: Wedson Almeida Filho <walmeida@microsoft.com>
---
 fs/f2fs/xattr.c | 4 ++--
 fs/f2fs/xattr.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
index 476b186b90a6..3895a066f36c 100644
--- a/fs/f2fs/xattr.c
+++ b/fs/f2fs/xattr.c
@@ -189,7 +189,7 @@ const struct xattr_handler f2fs_xattr_security_handler = {
 	.set	= f2fs_xattr_generic_set,
 };
 
-static const struct xattr_handler *f2fs_xattr_handler_map[] = {
+static const struct xattr_handler * const f2fs_xattr_handler_map[] = {
 	[F2FS_XATTR_INDEX_USER] = &f2fs_xattr_user_handler,
 #ifdef CONFIG_F2FS_FS_POSIX_ACL
 	[F2FS_XATTR_INDEX_POSIX_ACL_ACCESS] = &nop_posix_acl_access,
@@ -202,7 +202,7 @@ static const struct xattr_handler *f2fs_xattr_handler_map[] = {
 	[F2FS_XATTR_INDEX_ADVISE] = &f2fs_xattr_advise_handler,
 };
 
-const struct xattr_handler *f2fs_xattr_handlers[] = {
+const struct xattr_handler * const f2fs_xattr_handlers[] = {
 	&f2fs_xattr_user_handler,
 	&f2fs_xattr_trusted_handler,
 #ifdef CONFIG_F2FS_FS_SECURITY
diff --git a/fs/f2fs/xattr.h b/fs/f2fs/xattr.h
index b1811c392e6f..a005ffdcf717 100644
--- a/fs/f2fs/xattr.h
+++ b/fs/f2fs/xattr.h
@@ -125,7 +125,7 @@ extern const struct xattr_handler f2fs_xattr_trusted_handler;
 extern const struct xattr_handler f2fs_xattr_advise_handler;
 extern const struct xattr_handler f2fs_xattr_security_handler;
 
-extern const struct xattr_handler *f2fs_xattr_handlers[];
+extern const struct xattr_handler * const f2fs_xattr_handlers[];
 
 extern int f2fs_setxattr(struct inode *, int, const char *,
 				const void *, size_t, struct page *, int);
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
