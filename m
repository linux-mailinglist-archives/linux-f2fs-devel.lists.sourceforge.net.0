Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C89904CE28C
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  5 Mar 2022 05:00:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nQLb9-000625-0P; Sat, 05 Mar 2022 04:00:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <fengnanchang@gmail.com>) id 1nQLb7-00061z-G2
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 05 Mar 2022 04:00:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RrkswvrgxW4kaNRkuZeV45RDhkCcxif2/MofBtVXFNo=; b=e7b2m/wmfmEjDSLE3sbAaK3uFT
 z9HVAWRB2h9eW8weVxBrI59/ORgCd699vIN5AkF7w91+8SMFMNR7Xr7qANmR1zgowok9NNoJpVIRp
 Sozuy+Mm7+llXfoWkN0N5C66HPg+1KwQnHTkhXKsoxTZGvsakpwAVKypGQ6mthB8M7A4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=RrkswvrgxW4kaNRkuZeV45RDhkCcxif2/MofBtVXFNo=; b=d
 SwqGfN+XRewiTWQmd79SlhwIM0UJCtfyFS7ovSexxTGFZp3HOjkUQGyzQ/9ml0547l9Q/9D+T662L
 v2PkgtoivRx2qcP7iI8ivsXbkPcck9udOsZIFeti6+8Rh4uTrSiW/EsisHGmY5oB2xfQ5e7fx1XU9
 sXM2OQH/0Yptyf+Q=;
Received: from mail-pj1-f43.google.com ([209.85.216.43])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nQLb0-005Icm-PH
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 05 Mar 2022 04:00:48 +0000
Received: by mail-pj1-f43.google.com with SMTP id
 ge19-20020a17090b0e1300b001bcca16e2e7so12134178pjb.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 04 Mar 2022 20:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RrkswvrgxW4kaNRkuZeV45RDhkCcxif2/MofBtVXFNo=;
 b=jw2VaDkZh2V303cUI3ptrp+BkQgDmkciOAFLzAEoBMyJq7HpDJr+tp3XoaVvyXG7m+
 7Wjp7nq3XZTlwvqfys9T51b3B6xU8O0vD0Uu8uKulA35PcDkxB3wZN4Zr3qv6OEBTq3G
 qA95Dx1L/gHiTtqEycHCS8r4sPQUAbf9WluljDRfXhpkIh5XSM9bNXNZZjBFtLfUT5Ag
 1rVElSpHI1rprxxNpY2lr/1Ze81c0cpOaFpEKUVqdUkgsd+P88Wjp9u6a+Aen8e5D8TA
 ALjQNJMvb+a4i6tkVzQqEERteFmO+5k8L1ka2zXBNOyCB2uPGj5jaPqK1IRq8cbITOdN
 aj+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RrkswvrgxW4kaNRkuZeV45RDhkCcxif2/MofBtVXFNo=;
 b=hogzYy/6zlnfYY5tSoeB5xX+v/EPTg/XA1P4pAKhJtYVgob4kuHlqHQE8OYdYNtN43
 FNVMw139N4xRFd87URwO33DK9kR7U2+tiZTGRW3iDLF3YXwgcTDvNkO7aJ7gPvvLDgQc
 pV5GpPnNwsGsLOe5oxjc5dNqrenj+8egxD5A+/JvH1Ce/tEpg4FZwQxgjUYCsnUPTI3x
 3s2d4EpzySM37Bb7kY2ratxA/ipwetedSZXNXpfYO6l9j8oZhH1IuMkTPTgMu5s/EUE9
 M7ou8prdFPNUlZ//1UeE2yxNjZ5iW5tPKkgl3gWaobaAC+lfobUrhCG6kK/Hl4qysv4f
 +E3A==
X-Gm-Message-State: AOAM532sY7U16cBNmV8Fp++ymrhkeaNruTMKX75eBIt9DoDxXbnwfUVG
 SMupA7/+JGcAAYpT89Naq94=
X-Google-Smtp-Source: ABdhPJx2Wohy3+6kamEKwH1Rwy2umf7frPEmoawcffm+aFxhcPddik12VuYarw9ZKvr7I3prKD5PWg==
X-Received: by 2002:a17:903:41c8:b0:151:d046:ad8b with SMTP id
 u8-20020a17090341c800b00151d046ad8bmr859018ple.83.1646452836983; 
 Fri, 04 Mar 2022 20:00:36 -0800 (PST)
Received: from localhost.localdomain ([103.97.201.65])
 by smtp.googlemail.com with ESMTPSA id
 y5-20020a056a00180500b004e1bea9c587sm7874253pfa.67.2022.03.04.20.00.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 20:00:36 -0800 (PST)
From: Fengnan Chang <fengnanchang@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Sat,  5 Mar 2022 12:00:19 +0800
Message-Id: <20220305040019.225150-1-fengnanchang@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  When compressed file has blocks, start atomic write will be
 failed, but still set FI_ATOMIC_FILE flag, if write partial cluster and commit
 atomic write will cause data corruption. Fixes: 4c8ff7095bef [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [fengnanchang[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.43 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.43 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1nQLb0-005Icm-PH
Subject: [f2fs-dev] [RFC PATCH] f2fs: fix compress file start atomic write
 may cause data corruption
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
Cc: changfengnan@vivo.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

When compressed file has blocks, start atomic write will be failed, but
still set FI_ATOMIC_FILE flag, if write partial cluster and commit
atomic write will cause data corruption.
Fixes: 4c8ff7095bef (f2fs: support data compression)
Fixes: 7eab7a696827 (f2fs: compress: remove unneeded read when rewrite whole cluster)

Signed-off-by: Fengnan Chang <fengnanchang@gmail.com>
---
 fs/f2fs/data.c | 4 +---
 fs/f2fs/file.c | 3 ++-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 6b5f389ba998..5cbee4ed0982 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3358,8 +3358,7 @@ static int f2fs_write_begin(struct file *file, struct address_space *mapping,
 		int ret;
 
 		*fsdata = NULL;
-
-		if (len == PAGE_SIZE)
+		if (len == PAGE_SIZE && !(f2fs_is_atomic_file(inode)))
 			goto repeat;
 
 		ret = f2fs_prepare_compress_overwrite(inode, pagep,
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index cfdc41f87f5d..26a648ef9e1f 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2009,7 +2009,8 @@ static int f2fs_ioc_start_atomic_write(struct file *filp)
 
 	inode_lock(inode);
 
-	f2fs_disable_compressed_file(inode);
+	if (!f2fs_disable_compressed_file(inode))
+		return -EINVAL;
 
 	if (f2fs_is_atomic_file(inode)) {
 		if (is_inode_flag_set(inode, FI_ATOMIC_REVOKE_REQUEST))
-- 
2.25.1

git send-email --to jaegeuk@kernel.org --to chao@kernel.org --cc linux-f2fs-devel@lists.sourceforge.net --cc changfengnan@vivo.com --rfc 0001-f2fs-fix-compress-file-start-atomic-write-may-cause-.patch


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
