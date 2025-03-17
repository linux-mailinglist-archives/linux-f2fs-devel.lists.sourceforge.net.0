Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9F5A65D91
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 17 Mar 2025 20:08:44 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tuFp6-0007py-NB;
	Mon, 17 Mar 2025 19:08:28 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1tuFp4-0007pr-Ox
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Mar 2025 19:08:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1l7OENO6CAVnXbGvPoQ7HrLqsZWkXzyndkdOD1l60Kw=; b=TZhz6OuUTG/OVM/Ao/LFs/weR4
 bTLOV76symfYCUjPT9Zf4up55uS29d2g5jVlr7jNRNGCYzQVq9zRvAXv38GSEn/WURw+dqgorlDWN
 HSnJNlXVlSMedpdB5UUipUXztMjLkVOYuhjkcUUR4r2zalsfcNXX0xaKyGMQVbBvtvN0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=1l7OENO6CAVnXbGvPoQ7HrLqsZWkXzyndkdOD1l60Kw=; b=i
 t5+Bu95x4rgeTE7yJ1QXwf4Ze7iSye8WvDNtNTM6QffHDXRet+bofpTMJ1yE1yDJa3Vf31urJmwmK
 5/VEq6csqpVNmtSmHRKjnob17BDQHnt9JOzmKxcoebSrJbDgyMObK76W92HSp00d+9XyFfB8gjvJ4
 25UAellTdc5FGTpg=;
Received: from mail-pl1-f176.google.com ([209.85.214.176])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tuFp4-0001NN-6A for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Mar 2025 19:08:26 +0000
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-22403cbb47fso87743325ad.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 17 Mar 2025 12:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742238495; x=1742843295; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1l7OENO6CAVnXbGvPoQ7HrLqsZWkXzyndkdOD1l60Kw=;
 b=e2eq7lkHnefADWvwVh1ZHmzrcoeuInlRmf6aazN7tJejEWmgFm5ZJ0/E2k3RnYfR4j
 HEhRoZPD9VRzEXPIWPq7QWX2hgg1herq0QGyT6zSZoL6QKZGf/dRON5euWFnggRI6AtG
 78YFUkTRW7BLxldfNkPOV0Gd8u/jvzalAFEBvQ0ntlG0nPGn6hZo5WK1Gd3/iYQ9tr/l
 gUm+h58Y9VFFsiFCtTnzCrl4z9cZbdzE3ZmyPXuPDnvcHyza2ilQCRySt19MzruWLRJK
 ADnjduLXEkvgwYPfutJ3ZYu5X7M2JiaLIflflfCgGrEDRouUr1UM+Xv8nExQjBgOJa1N
 L76g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742238495; x=1742843295;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1l7OENO6CAVnXbGvPoQ7HrLqsZWkXzyndkdOD1l60Kw=;
 b=MiWiKDhi7P5WmVUuNQcDBms8mYJOi5qay9V0wNkesPtVW/2BVrqe3z+5aO7frYvnQ3
 lfKFD0Z15Hd5tXmruJc7kt6cjTzB57X5FU2AInBvOHyHERADYg99YmBXZOX+PuHgoDwj
 wXfvtnhn7QaAnpltwiikPxvKltywerIiTx+doh9uyiEsBgyUqKn14JxGDEVgEm8R6MzV
 gEPyjTZ8+rRcMs0x3jKgwrZAmtDNRUcmvxBGw1H0+i+TpctsICqtzjygyvy9eqm+MjyN
 k4r+dyJWtv2v54volSU1fip5mzuTMkaoC0JMkRuKAMw1eOqet3ewX6GqNn7fkfR3vCJS
 YkFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrYvtVZ6D0h+FHVYieZo0V/SEzpi84jSYHXVrn4VX5HCZNWdZGk/MPtKEth0i7+5oliqBUC68HfghFqBVTP0oI@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzE8Vzg++l7ND76TU1G8nN1pyx7iXsTAD8LeAVJruxKTPaJIVRP
 Qu75bEkF6ALnWXmUWnbE5y79cE6U+EuqJEHkietzRnTZi0PyBcO79KDc4w==
X-Gm-Gg: ASbGnctTFQspuRjxCitza14bHLWmbr6K057xsRrs3BfPYP4KJBsG8uBcGMLj5ZVWZVE
 nCCJIC+dLWlDc4MbCLZadPjqerGxUAezOI9siKJKsFSnuoOAfSsSb7DKLnrPltxrT6YeScQ5fsp
 Q7VvmnoeVNATBCdivI9fEQaBH8k5lfqX71DAkvV+mQIb9nKfX5dRNEgjISTomkphvV0WR/XfHq4
 g/XlU42ziMOkrpMqPT7AJF5uTSjtW2rVskEfrWKnXnY9sVmXcZk5zJ7FEoraBxqLGBYyQ/Rb0Lm
 IZbaYeCEYieEoeuzzlBe9Hgy7icMxqx1UkLCKSKvg4dPpZv46vSixBco8Aby6AaWKnjsU+MMcTR
 JKcd20wL66Bf9sjf5KTihG7EjxxwpmU3H+lXb
X-Google-Smtp-Source: AGHT+IH3JPWOS0DLUyil1b34ustc0utkRSOtQC29MhKAdtiTZ/plXyMqVBnoKcCCExOEimHEpotgew==
X-Received: by 2002:a05:6a00:92a3:b0:736:4abf:2961 with SMTP id
 d2e1a72fcca58-737223e8ef3mr14365320b3a.17.1742238495369; 
 Mon, 17 Mar 2025 12:08:15 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2a00:79e0:2e14:7:c666:1585:cbfe:4666])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af56ea041e7sm6298349a12.44.2025.03.17.12.08.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 12:08:15 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Mon, 17 Mar 2025 12:08:09 -0700
Message-ID: <20250317190809.678626-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.49.0.rc1.451.g8f38331e32-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Daeho Jeong support a file truncation to zero size for
 device aliasing files. Signed-off-by: Daeho Jeong --- fs/f2fs/file.c | 5
 ++++- 1 file changed, 4 insertions(+), 1 deletion(-) 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.214.176 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.214.176 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.214.176 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.176 listed in list.dnswl.org]
X-Headers-End: 1tuFp4-0001NN-6A
Subject: [f2fs-dev] [PATCH] f2fs: support zero sized file truncate for
 device aliasing files
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

support a file truncation to zero size for device aliasing files.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/file.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index f92a9fba9991..7ae5a5af5ed9 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1036,7 +1036,7 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 
 	if ((attr->ia_valid & ATTR_SIZE)) {
 		if (!f2fs_is_compress_backend_ready(inode) ||
-				IS_DEVICE_ALIASING(inode))
+				(IS_DEVICE_ALIASING(inode) && attr->ia_size))
 			return -EOPNOTSUPP;
 		if (is_inode_flag_set(inode, FI_COMPRESS_RELEASED) &&
 			!IS_ALIGNED(attr->ia_size,
@@ -1117,6 +1117,9 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 		if (err)
 			return err;
 
+		if (IS_DEVICE_ALIASING(inode))
+			f2fs_destroy_extent_tree(inode);
+
 		spin_lock(&fi->i_size_lock);
 		inode_set_mtime_to_ts(inode, inode_set_ctime_current(inode));
 		fi->last_disk_size = i_size_read(inode);
-- 
2.49.0.rc1.451.g8f38331e32-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
