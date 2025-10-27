Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB61C103E9
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 27 Oct 2025 19:53:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HQJj8gXU7MBxLsNVM27cmYyKPvhQcr3FrQ/ZsqzfqDI=; b=MIZmHeUYIUdxyk/U+tlo6nKN+g
	OGwHCpLs+O4Oo7dy8Q8ZX+zFvZ15T7HpS9RbD2frLcCsw0tmMKEWejGjnlAYjf4bwF2dvahf6UB/+
	bSNrwOC/FSCMNYibScSAZlo8ODzAeVMXSKw7GNIxq9s5rRW1G19gi27cT2U167zJqCG8=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vDSLI-0008Fi-Es;
	Mon, 27 Oct 2025 18:53:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1vDSLH-0008Fb-7j
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Oct 2025 18:53:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bk6bvsNBoenChOVDp2tPi0ck6pdyly1ce3AeV7V51LI=; b=MzdDCgmyKoTSe44A89X3O0YPmQ
 S5gW546ZU+gVoFQjO0JN+0BXr3OGfInmuCVUOKobYTtNUD11OOTWPU2kN+5zXtBZkdyCns93Mfg0z
 b87JvCWtBNOhl8NhACeCXp6F8P0tJ8N8j9W2F7Svc4STb1oGdQMetqmzToQddXnaRPwQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=bk6bvsNBoenChOVDp2tPi0ck6pdyly1ce3AeV7V51LI=; b=Q
 i8C1x4uOTXzZZsmVadRSBzencJQcUwKYngD2QuRWXrgTF3bwA2sGTwQMT4kKqRQ4gdUaRMiG5R04T
 5khpbJzOeuJVT2qX/rS1YGcyAirzS0avjJZ10E9qzXe5XBhW/9sV59ZdeQtPfdr1H+TXj00hgA02r
 ktEZnQpS4ZdmPbqs=;
Received: from mail-pf1-f172.google.com ([209.85.210.172])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vDSLG-0007XT-TJ for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Oct 2025 18:53:19 +0000
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-7a27ab05a2dso4275639b3a.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 27 Oct 2025 11:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761591193; x=1762195993; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bk6bvsNBoenChOVDp2tPi0ck6pdyly1ce3AeV7V51LI=;
 b=SVK10cdZk8d6URdFa4Cz7ecwdZXGBNDp0w/q+pcBnwb5xFANneW2a2cJdf9HcRN9Ze
 yL28uYATkSpbzpQ/I3xqDIBd6ClwlPRS8hiZDqlY3TiYM7MrrbajXuiUrr2xkqBGNRGz
 YI9ZuXjEgQTarFF/x7wzlCfZBTR8FjD9Zj0dO8RY0jEfaVdkoekSVNwQ/EN06gdF7VmC
 OLp7UdUYv6w00uwrfZfyJYaEns0vg34TTn+SvygCX9T8p5z/bM6xWD28N3ezHsAqMJ4Q
 xFJoowTnZReT8dt0S8YpSKu5iwykPv63Pr3GmtPjgkO6eIRnzfPkZdf4+0WV1uytdpye
 CVfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761591193; x=1762195993;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bk6bvsNBoenChOVDp2tPi0ck6pdyly1ce3AeV7V51LI=;
 b=otkntKAZVkwYNWgJNZuOYHNfyAq0THP84boOR7cuBLE/zaD96Wvzfleg2+ZR15mcgX
 r53Rdfp8CVqeGFf0nSBwPRbgAUp/AO6tczHn6BTsUZY6QoMThRlLcUJ7qWCwD91pjw5U
 4j26Ttb269GLW+HeBXewUbMjRSxwmVUbxo7Ccmx9U9buNFaxQ040PeO1/NK1cHdtAixx
 mG+tmdc+jeJVqyOOJvmPLB+dBRjjP5Y0Cy4ua9a3rUcYXEECQ6Qtg3txskDlISXt36TL
 XvJc4uhWEf3lTV3DfFDu6kvZk9NdbERt0e+v+HsapK6RWujNP0+LfHoUovKkpiQUjjf9
 O3ig==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgfU1zVCKqqJjZfvmKVTTNZ+zkvX+Ju89vZSBF8jfPZN1rcpkxIKG6jWVAFdTMq/QoAbtN3+UJljS8Vs8CpYmj@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxjjFPLWj8KZxTXdPSksPI/5FbFLHOkGMeqaRcSKEzPYg4wPHq/
 pxdGyDqAQOlzBx5UFi4dpU+dO32nMkU0/We9gcRCyyKrd5zuDtwRvrA0
X-Gm-Gg: ASbGnctx2ly9u3qeR4Jzmrug3Lb0MrGyQnivq0bFsdJdb8D/1NnphSn0NTt7yvm5oja
 6ZGBAGpavOdarxID0jSipo3g7mwfvMq3ARDvhUFPvnnNqid7JRr2JpE19IsxLfQS+SoMWYg9dxn
 veMjONJu48d4CjLulCMR7docNMxvznHjyoiGQYc7Fpw5OZi6DSww/ccSFTVC4q7S+aI8ElTPmy3
 v3ztoSSMJN9qqT+2jojeCbY50GJjGWW3ZZR0vRxocXcQoo+1ZbmACbQRRX7wDDoQTIrW8WpAnUe
 6K0nDZ8PcQ54ARTMHrd+y/FsuIHvBhSuDCix6+JOnTS5zJZAXHSZ+khwRrOkX+1QoRPBNj0q1UG
 z0xfbKhAIGmWidoubMxYmJ6GNBo30L7m7JG2Uw5Faq8AEZadY6HcIXeFcTZ3APgDFGKGa0RhWXK
 eb7GqeomifpzcBqq7jxYcdkK4V03Y2NilMgHKRMDUq9T3+D9SGq7O4eipI/9cChcGnZ0E=
X-Google-Smtp-Source: AGHT+IHtqBwQ88KSxBNo7XbFYWJmfdhMBzGzf7xaGwOOctLHUUO38sOxlwfjnVVZAa5qjo4IBiY99Q==
X-Received: by 2002:a05:6a00:21ca:b0:77f:2b7d:edf1 with SMTP id
 d2e1a72fcca58-7a441c2fa3cmr1122645b3a.16.1761591193121; 
 Mon, 27 Oct 2025 11:53:13 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2a00:79e0:2e7c:8:88a3:d9a1:52ff:2597])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a414035ecesm9023093b3a.27.2025.10.27.11.53.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 11:53:12 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Mon, 27 Oct 2025 11:53:07 -0700
Message-ID: <20251027185307.3680345-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.51.1.838.g19442a804e-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Daeho Jeong Add a missing "device_alias" feature into
 the feature table to show it properly in print_sb_state(). Fixes: 8cc4e257ec20
 ("mkfs.f2fs: add device aliasing feature") Signed-off-by: Daeho Jeong ---
 include/f2fs_fs.h | 1 + 1 file changed, 1 insertion(+) 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.172 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [daeho43(at)gmail.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [daeho43(at)gmail.com]
X-Headers-End: 1vDSLG-0007XT-TJ
Subject: [f2fs-dev] [PATCH] f2fs-tools: add a missing device_alias in the
 feature table
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

Add a missing "device_alias" feature into the feature table to show it
properly in print_sb_state().

Fixes: 8cc4e257ec20 ("mkfs.f2fs: add device aliasing feature")
Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 include/f2fs_fs.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 6f3f83a..88a854a 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -2022,6 +2022,7 @@ struct feature feature_table[] = {					\
 	{ "casefold",			F2FS_FEATURE_CASEFOLD,		1}, \
 	{ "compression",		F2FS_FEATURE_COMPRESSION,	1}, \
 	{ "ro",				F2FS_FEATURE_RO,		1}, \
+	{ "device_alias",		F2FS_FEATURE_DEVICE_ALIAS,	0}, \
 	{ NULL,				0x0,				0}, \
 };
 
-- 
2.51.1.838.g19442a804e-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
