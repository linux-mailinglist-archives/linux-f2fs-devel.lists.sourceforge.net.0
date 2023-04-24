Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E685A6ED1A2
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Apr 2023 17:44:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pqyN2-0001BL-I4;
	Mon, 24 Apr 2023 15:44:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1pqyMz-0001BF-3P
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Apr 2023 15:44:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Liz0MIHTZC+8yjVwhyhKwCvxY6q7FuOGysVJHylIYwg=; b=a3gVpVU9TFurlzqLjwnCpEKGB/
 Uolkczcdg8GagbBRGndBxHlvZ6DIuilTa9KEQ++7pMmAu96zlD8QBILtfOgae+vWYfkrK9lvKUA97
 GGI3DxNuHqkilp7J6p7tAsXWgpzt6q+81J5e0zPYyu9L6xyw8nPJtY24eykUoPT3Iq/o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Liz0MIHTZC+8yjVwhyhKwCvxY6q7FuOGysVJHylIYwg=; b=f
 wNRGNmqEohrmiPgBePouYOmuWWX/VWvwhLH2AJ3N+sMykCUTuadZyNRbnBdljwRa1vJQs0sy+e0zX
 /0GvZoyQj4bgEZudrF/x0Mc7UHuC5helo+f5XGc7vHrJpmf6RfTikomV+6ngEkUc7voNSY4m2FBAa
 KlFwsQfwIXPwiT8Q=;
Received: from mail-pf1-f175.google.com ([209.85.210.175])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pqyMy-00088s-Rx for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Apr 2023 15:44:49 +0000
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-63b87d23729so3767439b3a.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 24 Apr 2023 08:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682351083; x=1684943083;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Liz0MIHTZC+8yjVwhyhKwCvxY6q7FuOGysVJHylIYwg=;
 b=aWPMp8aIutJX+5Ikg85ec08QDoj24Ci7AvM3bqIBRm/4ywfZtwpWDHzmPQ2fhzdA3W
 sdTvU4fwc2dBz3VKyw5njkFfuIbPHsB2wsac5Oww+NH/aFngLqp1I3xcg430d0aVtydn
 1W86IIIDPGlhQ1JHfweJlCYgQ7Rvnp8Y6wYQlfPRxeS8sFI1BcDuhuS2qRWuUQ502LFb
 OMB6muEzLOVPM/NIm7Shd8KPCnnHaadZl4UcnZ6bpHrPfHMnZFKqK7S9bnZ3ECgcmSKA
 I93BSs43QwQFLQlRWTtiAo3C0ZXCmdq8Un8VWQDIdWjTt8syzI7D9MOO+OSymEtkXJ5i
 /TnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682351083; x=1684943083;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Liz0MIHTZC+8yjVwhyhKwCvxY6q7FuOGysVJHylIYwg=;
 b=UVPyCxdANZ2w0HbovO2eUgyHYOS4FQuH8rHuHsd8Lcl/zIdYdsx9Gy8lP708EP7sk7
 jnQcXLTUiJAfoFr7b6/t4zmkN10AGcUAwM0LY+JF42IuRQWUGHApej+0vvK/1fg7rcbi
 auJzAIVjroA8QI9B98f7rxv8QV8hWOR14W1XMPResH/uVAmcp8vvsJ5E3AkI8TnSMnZJ
 +nJSuZRfu2fkP7oMVGohH8a1co/ERXhf8vzZYMh44wvdpKnU7TbhsF8mTU/NFb06MrTS
 xHg2Y/d9XJP98XoMgWaSkG2YM1oAZFuc3l75kWIhnHbv9fvL1Z0HJJysPf5oo4vomRZX
 N/ow==
X-Gm-Message-State: AAQBX9dYRw24ooK5EhG5FBpt9/IfKsYyeutfrGe1f3ePW3riHWIQl2ew
 gmTC0kXRPEwNbaosl23Hr2hTzO3ION8=
X-Google-Smtp-Source: AKy350aO8negNf/P+EkoliNumtvWgLv67wKHQ6+vUguorc9UsdSOjfH9FH9T11ABHspJhRPxIkeJ/A==
X-Received: by 2002:a17:902:e5c6:b0:1a1:d70f:7114 with SMTP id
 u6-20020a170902e5c600b001a1d70f7114mr16930176plf.14.1682351083096; 
 Mon, 24 Apr 2023 08:44:43 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:15c:211:201:26c1:a43d:1ede:71a3])
 by smtp.gmail.com with ESMTPSA id
 jb4-20020a170903258400b001a682a195basm6813106plb.28.2023.04.24.08.44.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 08:44:42 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Mon, 24 Apr 2023 08:44:40 -0700
Message-ID: <20230424154440.23279-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.40.0.634.g4ca3ef3211-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Daeho Jeong When a node block is missing for atomic
 write block replacement, we need to allocate it in advance of the replacement.
 Fixes: 3db1de0e582c ("f2fs: change the current atomic write way")
 Signed-off-by:
 Daeho Jeong --- fs/f2fs/segment.c | 2 +- 1 file changed, 1 insertion(+),
 1 deletion(-) 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.175 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.175 listed in wl.mailspike.net]
X-Headers-End: 1pqyMy-00088s-Rx
Subject: [f2fs-dev] [PATCH] f2fs: allocate node blocks for atomic write
 block replacement
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Daeho Jeong <daehojeong@google.com>

When a node block is missing for atomic write block replacement, we need
to allocate it in advance of the replacement.

Fixes: 3db1de0e582c ("f2fs: change the current atomic write way")
Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/segment.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index c35476b3c075..0e1e29800934 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -217,7 +217,7 @@ static int __replace_atomic_write_block(struct inode *inode, pgoff_t index,
 
 retry:
 	set_new_dnode(&dn, inode, NULL, NULL, 0);
-	err = f2fs_get_dnode_of_data(&dn, index, LOOKUP_NODE_RA);
+	err = f2fs_get_dnode_of_data(&dn, index, ALLOC_NODE);
 	if (err) {
 		if (err == -ENOMEM) {
 			f2fs_io_schedule_timeout(DEFAULT_IO_TIMEOUT);
-- 
2.40.0.634.g4ca3ef3211-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
