Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1112F965262
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 29 Aug 2024 23:53:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sjn4l-0002oE-SB;
	Thu, 29 Aug 2024 21:53:07 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1sjn4i-0002nx-3Q
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 29 Aug 2024 21:53:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zRLMPwvKQt3Fm+472wogPuvTaJti/5yUeUAEHMi0T1Y=; b=lQbl7bOeAtu5uNvCt73KG/aqDP
 ke+16tuL/6rXvvznjhPcsvyXQTuUA5DNFBSH3+QgV58Yeu2LGvxC7O8eMntcVbcq2yNApf6sJnAqq
 0W+z4UBQmbVezpR6GS0zc6cUN65q0P2e7M9PxjKuoZR5QG/iZDqJthDbwD4+OJBtL/Qc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zRLMPwvKQt3Fm+472wogPuvTaJti/5yUeUAEHMi0T1Y=; b=OirV6oj/2T/zHg2ZCwmylGYdei
 4CC5Vzisb8kIS59njeP/TOCEB0kRmUysPKJpycmwoJES7v81g266nO7ejCLoDcwXEDLn7Arb+YRKL
 EJ6z9JVkA3FMoAlnsnORa8Ln63W6vKv2yP2KrWUjU2Cu6Nz7XZFMm84bopGcEMxcyHMg=;
Received: from mail-oo1-f41.google.com ([209.85.161.41])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sjn4h-0007bX-Gr for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 29 Aug 2024 21:53:04 +0000
Received: by mail-oo1-f41.google.com with SMTP id
 006d021491bc7-5da686531d3so744945eaf.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 29 Aug 2024 14:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724968373; x=1725573173; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zRLMPwvKQt3Fm+472wogPuvTaJti/5yUeUAEHMi0T1Y=;
 b=PY75ohCU4UmHQMpxi+ojZQf3LO7Sb3TUzJzRVqoNL+2Zg7Lew4MDJiMWLVbfwltgeo
 zBTdHFnvG6PYCY4spZKJZf0KU7FLbmgdZ9fntnhv3cHG5aDuIMod++E49e8aRczaxWg4
 f7R1QdOOHasuGpnERTzLn0STatohe8jm8NPsl63tpCfeplBHudoaBTwMbI4JSkdSyog5
 Zb06L0Hen2EwQw6x3/mIu8BfQ896W0HVu4IeIcU6cbt2Mulmegz+QmvqgMsVjGOqyaRS
 sxlZukTkd9cjH/DCcKIoLQ2KbDvtrt+hmlbAAhASbxHZGxkuROfIBte7iK8tepS79vUk
 u5VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724968373; x=1725573173;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zRLMPwvKQt3Fm+472wogPuvTaJti/5yUeUAEHMi0T1Y=;
 b=couynIsUUb/1XbKOpeSssQMtXl8ZCdUj+qeC6+Xy7FQYp5lc6LtJO0Ft8NMedyutsi
 8BePoFBnvuvBZcPmBWAuOg6lY8ohMq0CsBM7alunTKH6hdY16WRYfEa3HIvo+0CyfL7L
 jd//dvc/PLuRFeJcZ5JmSLPL/fBiheYih01RQBKGVFt8e7XQuSQ+Bhu0c/j6vyt23eic
 S40rmqYfjtqvssUt15lUyoRrvC9gbFxlNKlk3CXrSSbdJjhzx03cybR/v96vcpiX3mlv
 7Xvz+AiMCf9w2q9Pm2lxxQUVSnmeqaEFncMa6mCNR1IgGBumHYa4X+DbtFGGd+N5JSL1
 C2Dg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXx9/7JRgaT9sF+IhEid98d2pyo6a1LolJ/4dm2Y/i+u6Ts4dqIySesIDqgKhriFhy8o4DKnWTqdj27wkyuxZR@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yz+QUWC6yWTyrEpM0HeoyXWh25fcb+pdHl4ts41WkotAcNa60LI
 UzjSN1p8AJDgqbPszkkIVKvOB7QICRqpKzQyPn1V/uh2ZkFLUQGM62Gbig==
X-Google-Smtp-Source: AGHT+IHReHz5dkOTT0E3ySn9+cM7bJ/Nx1/8UlkAX6jCOafZzdoUXXv/EWl/dSX8evhDJKm++nRTGQ==
X-Received: by 2002:a05:6358:9107:b0:1ac:f2bb:8aa6 with SMTP id
 e5c5f4694b2df-1b603cc8d4amr518379555d.21.1724968372848; 
 Thu, 29 Aug 2024 14:52:52 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2a00:79e0:2e14:7:a1e7:73eb:e77e:3e2b])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7d22e9d512asm1705653a12.78.2024.08.29.14.52.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 14:52:52 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Thu, 29 Aug 2024 14:52:38 -0700
Message-ID: <20240829215242.3641502-3-daeho43@gmail.com>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
In-Reply-To: <20240829215242.3641502-1-daeho43@gmail.com>
References: <20240829215242.3641502-1-daeho43@gmail.com>
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Daeho Jeong For the fine tuning of GC behavior, add
 reserved_segments sysfs node. Signed-off-by: Daeho Jeong ---
 Documentation/ABI/testing/sysfs-fs-f2fs
 | 6 ++++++ fs/f2fs/sysfs.c | 2 ++ 2 files changed, 8 insertions(+) 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.161.41 listed in sa-accredit.habeas.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.161.41 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.161.41 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1sjn4h-0007bX-Gr
Subject: [f2fs-dev] [PATCH 3/7] f2fs: add reserved_segments sysfs node
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

For the fine tuning of GC behavior, add reserved_segments sysfs node.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 6 ++++++
 fs/f2fs/sysfs.c                         | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index cad6c3dc1f9c..4fcd0f824bde 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -763,3 +763,9 @@ Date:		November 2023
 Contact:	"Chao Yu" <chao@kernel.org>
 Description:	It controls to enable/disable IO aware feature for background discard.
 		By default, the value is 1 which indicates IO aware is on.
+
+What:		/sys/fs/f2fs/<disk>/reserved_segments
+Date:		August 2024
+Contact:	"Daeho Jeong" <daehojeong@google.com>
+Description:	In order to fine tune GC behavior, we can control the number of
+		reserved segments.
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index fee7ee45ceaa..2ed773132f40 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -969,6 +969,7 @@ SM_INFO_GENERAL_RW_ATTR(min_fsync_blocks);
 SM_INFO_GENERAL_RW_ATTR(min_seq_blocks);
 SM_INFO_GENERAL_RW_ATTR(min_hot_blocks);
 SM_INFO_GENERAL_RW_ATTR(min_ssr_sections);
+SM_INFO_GENERAL_RW_ATTR(reserved_segments);
 
 /* DCC_INFO ATTR */
 DCC_INFO_RW_ATTR(max_small_discards, max_discards);
@@ -1138,6 +1139,7 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(min_seq_blocks),
 	ATTR_LIST(min_hot_blocks),
 	ATTR_LIST(min_ssr_sections),
+	ATTR_LIST(reserved_segments),
 	ATTR_LIST(max_victim_search),
 	ATTR_LIST(migration_granularity),
 	ATTR_LIST(dir_level),
-- 
2.46.0.469.g59c65b2a67-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
