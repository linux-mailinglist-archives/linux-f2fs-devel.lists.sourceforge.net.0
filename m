Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E15CBAD3D79
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Jun 2025 17:38:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b7C8of/noY5su005Y39UNn8TQ8KVuRny1gxP/1ZO/Fs=; b=Qh/fe8peCSWO6HUD3xVohL65d7
	f8wTteKfnQeXQo7CJxUsoMm/zIob7mDt03Dj0mmV+6fG8OmmycKHi6hkKlwyfZdVzGD89at+gB8ca
	dlf+nd9gn39LxIqm5rRIVFQ+Od36ZFMdZNtwrFRuDeb/eZKCiLzoztdrrs+KDbm+Kajw=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uP131-0004v2-Jm;
	Tue, 10 Jun 2025 15:37:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong2021@gmail.com>) id 1uP12t-0004uk-Ps
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Jun 2025 15:37:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nP3RtDppfdZEZjMINIhZ6V4gm6A6a+9c92Py7aCUbfY=; b=ESqnF98Btspbp3mppGGbI89R4H
 XrGmQhR8NPydONdKLF5EX0OEWd6AEEizOD8F73yRIetpywn9tfoelA2uPVaqmT1EjHGu4gtGE/ALJ
 fYM+5ucE/8TEjJtPJDZVdlfEDgcDD3urpYdgUFpgkc8hVlUg1SuG+xLCQItvScs8smIY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nP3RtDppfdZEZjMINIhZ6V4gm6A6a+9c92Py7aCUbfY=; b=GrXNUFBKQl3Hb68k7CMY3ewhwb
 hA2O/kuir+yr3EgJgGXNXpO06cbpHtW7A42hp5Qx2EUHVgxOttSLtnFmX4qRNIV0cjmdBm8/p4TNS
 qfHm7KoiXOxu1SpRDx3MNP2TYZh15pndVrDlDO8ucb4uTfN0Vu7T2bU/ge+TgMDtSgYY=;
Received: from mail-io1-f46.google.com ([209.85.166.46])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uP12s-00066h-5D for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Jun 2025 15:37:50 +0000
Received: by mail-io1-f46.google.com with SMTP id
 ca18e2360f4ac-861d7a09c88so160502939f.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 10 Jun 2025 08:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749569859; x=1750174659; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nP3RtDppfdZEZjMINIhZ6V4gm6A6a+9c92Py7aCUbfY=;
 b=Qcxxo7/zal0mtjOvr389+KOgI9cWHwEnsgea12BRZXmnopNSFhUrQFcnKZav+SzyW7
 Efj2bBAOQgEomr5o5huaO1ZV3SId+uRfkoMYudlsctUTdWY3Xd6qphLVIKaEcItf3gSQ
 OE9TSbjjGHEVqzE31WLP2ciog7frjYhihRl81fKxI6N42qmjokXTGbDxegGj7WlbKGqD
 TZs5y0JNcIutDnyvDa0KaCEZ5sJyDxyzqbmG6iAxOr7WUGbEr2We6bh9VYwBF/05Mb9W
 VKxGH6ePB+jASe1CWG2KQ6CVzWyH7QXLvFF+6DgF2yunzNTnUMYYVja4n8oMLrhpVxfM
 OE/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749569859; x=1750174659;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nP3RtDppfdZEZjMINIhZ6V4gm6A6a+9c92Py7aCUbfY=;
 b=hY8byV9E0j0S2dHr7ty18OuGnCMhvLOoOj/o42ApmH+8XdzsT0wGHnzdetxS8Q5IiW
 DV8+C9ZtXbjH/oCBrI+fbHSkPSPPuF0DvbeVBLskmgiDcgtlq3D1/470y32nKabDOFM+
 YXBrlwbHku+fvx4AYKI/tZN73EWOpOkAc/pg/02nvmfLX5tr13+XF28juuXCtTCCASkz
 VRB534iEB8PyCYSkchidCq7HVGYj1PRA6xa1uPNjRcAnYa15ePNiPuIsjvYw1igPqrVy
 aMKcK8cfXTgJjcneqQQxMDu2feZ+a34JGbgonddxF/W170cUWUsrK48aKHb89Tf7UVIj
 dVbg==
X-Gm-Message-State: AOJu0YxrTRMho2OTQz1rld3iN0UKImD+2XjZXc7VvgtlyXtHcXjUJMNA
 7tLByMUJ8K5ACrGminJ/WpDhyt18HjIRUPIvETSYl0kQdEgBzGKbZJmtcAyLOQ==
X-Gm-Gg: ASbGncuimWqVGbjk7KG6kW/cFg0bRlwzvuD2OJZ5zOb/pRpIdrLm/mHrP4f1Jrfwrvf
 P6pdu8PcuKTS18nvLWpJqX2GH2xEWErOPJKPo+8pq927Y5oMThg51REk/1Q6To6NEfUXK5ERBuf
 hmYH+GUDG5vo3mRPz/UDu5LGO0+ZA/YPn3EeAvDcgJ5Nd4HQ7QnU+wsTBl3Mz4aG3l6WhDbYU9s
 +dRX34RfnDBMshLVCohqxN5pM4J2hLOtxA0jwcV7116Ig7ZgwbcykLaKTkeF8TkJaGw/h5A9r5I
 snAzjFQJUB3zmuOUHyKmZkQvsWfpJzxtinMEpUWmH5wjctZh9StcLXdw1xzc3g7h60cr
X-Google-Smtp-Source: AGHT+IGF5DVB0a8QQmcBhsmQWZ9/N9JykzDQ7rjiTJr45IlGU4wqDy1eQlEBp1lBSxZdqBP1qbzEGQ==
X-Received: by 2002:a05:6a00:9a3:b0:747:b043:41e8 with SMTP id
 d2e1a72fcca58-74827f12808mr21242154b3a.15.1749559112009; 
 Tue, 10 Jun 2025 05:38:32 -0700 (PDT)
Received: from PC.mioffice.cn ([43.224.245.249])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7482b0847aesm7539815b3a.105.2025.06.10.05.38.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 05:38:31 -0700 (PDT)
From: Sheng Yong <shengyong2021@gmail.com>
X-Google-Original-From: Sheng Yong <shengyong1@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 10 Jun 2025 20:37:25 +0800
Message-ID: <20250610123743.667183-16-shengyong1@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250610123743.667183-1-shengyong1@xiaomi.com>
References: <20250610123743.667183-1-shengyong1@xiaomi.com>
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Sheng Yong Signed-off-by: Sheng Yong ---
 tests/f_sb_bad_magic/README
 | 3 +++ tests/f_sb_bad_magic/expect.in | 5 +++++ tests/f_sb_bad_magic/script
 | 15 +++++++++++++++ 3 files changed, 23 insertions(+) create m [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [shengyong2021(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [shengyong2021(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.46 listed in wl.mailspike.net]
X-Headers-End: 1uP12s-00066h-5D
Subject: [f2fs-dev] [RFC PATCH v2 15/32] tests: add fsck testcase of fixing
 bad super magic
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
Cc: shengyong1@xiaomi.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Sheng Yong <shengyong1@xiaomi.com>

Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
---
 tests/f_sb_bad_magic/README    |  3 +++
 tests/f_sb_bad_magic/expect.in |  5 +++++
 tests/f_sb_bad_magic/script    | 15 +++++++++++++++
 3 files changed, 23 insertions(+)
 create mode 100644 tests/f_sb_bad_magic/README
 create mode 100644 tests/f_sb_bad_magic/expect.in
 create mode 100644 tests/f_sb_bad_magic/script

diff --git a/tests/f_sb_bad_magic/README b/tests/f_sb_bad_magic/README
new file mode 100644
index 000000000000..a8887ebd2dfb
--- /dev/null
+++ b/tests/f_sb_bad_magic/README
@@ -0,0 +1,3 @@
+1. create f2fs image
+2. inject magic in sb 1 with value 0x12345
+3. fsck fixes bad magic by copying sb 2
diff --git a/tests/f_sb_bad_magic/expect.in b/tests/f_sb_bad_magic/expect.in
new file mode 100644
index 000000000000..3dcfa1f7e46e
--- /dev/null
+++ b/tests/f_sb_bad_magic/expect.in
@@ -0,0 +1,5 @@
+Info: Force to fix corruption
+Magic Mismatch, valid(0xf2f52010) - read(0x12345)
+	Can't find a valid F2FS superblock at 0x0
+Looking for secondary superblock assuming 4K Block Size
+Info: Force to fix corruption
diff --git a/tests/f_sb_bad_magic/script b/tests/f_sb_bad_magic/script
new file mode 100644
index 000000000000..0a5d708af2d6
--- /dev/null
+++ b/tests/f_sb_bad_magic/script
@@ -0,0 +1,15 @@
+#!/bin/bash
+
+DESC="superblock[1] with invalid magic number"
+
+. $TOPDIR/tests/helpers
+
+cleanup
+make_f2fs > $LOG
+
+$INJECT --sb 1 --mb magic --val 0x12345 $META >> $LOG
+$FSCK $FSCK_OPTS -f $META > $OUT
+$FSCK $FSCK_OPTS -f $META >> $OUT
+cat $OUT >> $LOG
+
+check_result
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
