Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DD14D9D8C1E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 25 Nov 2024 19:18:36 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tFdfH-0000Zf-9v;
	Mon, 25 Nov 2024 18:18:27 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <leocstone@gmail.com>) id 1tFdfE-0000ZM-N1
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 25 Nov 2024 18:18:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ldJd5HmPlYA9vRJ3waB7JY0x/C5bJVvNHMbZnqNh4V8=; b=AJxWBpZKw6QakI8cBCWhRbQGUs
 3ZshqpsH7khvVsbx5dc/WZiqLHiVD0sFixFXCw1juGBQ18Ty3X0oylu66pbJQCqGMMc8cFu6+OFf9
 50rFM1kFyHMFpmnqkPjC2vikUISy7D3fbm8o+2x9RRSzYVWlDdU5HHnNiEM/T/s+a37M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ldJd5HmPlYA9vRJ3waB7JY0x/C5bJVvNHMbZnqNh4V8=; b=Bz+pRxo4M4U5kxRnL8zzMuqqCt
 bW8YqZISlEJxS/nVbTAAt4tKSa9kB9JjtheLpMuTKSR+IBjOGWxmoR37G7s3RqxREJXC39VD/nBPJ
 y+cx4UQpAm8HTiboyIkAtpVoLtLTnWATTyubLw802Ly2m8XkT5NNGLxyawj53+K2DL4w=;
Received: from mail-pf1-f170.google.com ([209.85.210.170])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tFdfE-0005cQ-4Y for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 25 Nov 2024 18:18:24 +0000
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-7245a9d0e92so5365433b3a.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 25 Nov 2024 10:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732558693; x=1733163493; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ldJd5HmPlYA9vRJ3waB7JY0x/C5bJVvNHMbZnqNh4V8=;
 b=GRGburpmC51mBm8sfdzGpU188LPnOq+crkCEk6N8cLcZP17TMVreaCCKGAwNccEG7X
 UEAESAzuGFOFiiaFO8zSDP8iKKyEbLSDoQkI3msWoUlC8iqsQPTK/8+G0yC7KAjESaD8
 g4zQGKtWeJCh8oSUNMZyonpTO6e6tQKfA2zN7QYgkhbwbDVtH56ldpgIPOgPJ4XSsDdW
 YbW4L2CMW63LZIszuPYrlIkExwaXTAPmDTdNUU1c7ZK+j99oC4h8gAElK9ifw8mei0pm
 wuPp8QzWlhGubClpSo/zCq+wJBMrSLkNl4ChM3eutZn/bnrsQIizD9bC2QNDr+o9nYZW
 oNiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732558693; x=1733163493;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ldJd5HmPlYA9vRJ3waB7JY0x/C5bJVvNHMbZnqNh4V8=;
 b=e0GmOwrxlnwEvJjijpunAHLdqqPx+kV9KOFrGaFaecLwgMNIxM1EUygy4/aJEdEzV4
 d9DjqThDiJE0xDqrupJl1nfHGSk1C5/k1ilKZ4jWpBALC4YT7k9+zTiSITXGCf3R0+fQ
 s5mcMz2QCMaHkFhXrPRFRPhnVaANn3elAnzyxsWzQccMRwwbnEa8dkbqjITJfI92staA
 e5kB8yd17eV2eKXWeRX08L1qTJJ5ld5TzsoHN5qe35tJ636wYT51T82HOpwzGkn1JDkS
 KkVUQM+s7dD9nwxKVz0vYfdDwJ4zOQnE/a9WF0N52cetpIAr9CPpaEPIwA59wIJECUyg
 0ISw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYKN0n2+1yoD9bUh/adoXy3B6zSJfjsrUPZuJaAkVd6JlGCscusntXOGWieAOfxTzzi6L/kDETBA/emTdJMQqG@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxnSURHOuS5M6KW1pQ/zzNTaIvIS1dR5uGJT8R08z/FNEsii5qF
 kgYHUbeVypeP+OVajbHjXPUgmric6y2D/acDyobSeMWoGwJCcjXP
X-Gm-Gg: ASbGnctE5EuEKdvl/DHMIBCIWvX+h+vqVN83g33CfEtLlQ8EzEfqywHski8LnDko8w/
 QWyaf2ZyNRQ2AUWH/rfr6v0OFrmGTZ3DSdJbOm3VsdJ2gpcw2Nl6iOBLFWsiyL5WAuZwpMnztT9
 FKlziOO2rBv96a7IkX+mzyBWq8DtVvf8oLA2n36I0E7BsFsx8jblOl9vyaBpNmZecBRcrkhfHAw
 dgMqGeWoFL1YdI9J9YIIEEv9y8/aDx3l16HiQji0RK6RzF2T1Nsnup25huDUWj2
X-Google-Smtp-Source: AGHT+IHqEcIQqXHxqa0100tDdVvYAO+DYT1SBu7yLiqvuZikuC4XnVPIO7PeJRv5/19OhYr67h7wjg==
X-Received: by 2002:a05:6a00:17a1:b0:71e:7c25:8217 with SMTP id
 d2e1a72fcca58-724df6a4ac4mr17569909b3a.25.1732558693364; 
 Mon, 25 Nov 2024 10:18:13 -0800 (PST)
Received: from tc.hsd1.or.comcast.net ([2601:1c2:c104:170:2d2:ed5d:17c9:e364])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-724de454aa1sm6753629b3a.4.2024.11.25.10.18.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Nov 2024 10:18:13 -0800 (PST)
From: Leo Stone <leocstone@gmail.com>
To: syzbot+35a21b6aade7af3c7b3a@syzkaller.appspotmail.com
Date: Mon, 25 Nov 2024 10:18:10 -0800
Message-ID: <20241125181810.190792-1-leocstone@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6740a00c.050a0220.363a1b.0144.GAE@google.com>
References: <6740a00c.050a0220.363a1b.0144.GAE@google.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This is the same exact image as in:
 https://syzkaller.appspot.com/bug?extid=b01a36acd7007e273a83
 This is the diff of the reproducers: diff --git a/repro_f2fs_86.c
 b/repro_f2fs_arm.c
 index e9473a9..b96d52f 100644 --- a/repro_f2fs_86.c +++ b/repro_f2fs_arm.c
 @@ -1, 4 +1, 4 @@ -// https://syzkaller.appspot.com/bug?id=ce049cbd95a443ac6ed3
 [...] Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [leocstone[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.210.170 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.210.170 listed in sa-accredit.habeas.com]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.170 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.170 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1tFdfE-0005cQ-4Y
Subject: [f2fs-dev] [syzbot] [f2fs?] WARNING in f2fs_delete_entry
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
Cc: jaegeuk@kernel.org, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This is the same exact image as in:
https://syzkaller.appspot.com/bug?extid=b01a36acd7007e273a83

This is the diff of the reproducers:

diff --git a/repro_f2fs_86.c b/repro_f2fs_arm.c
index e9473a9..b96d52f 100644
--- a/repro_f2fs_86.c
+++ b/repro_f2fs_arm.c
@@ -1,4 +1,4 @@
-// https://syzkaller.appspot.com/bug?id=ce049cbd95a443ac6ed3f6f4bad09498d3692995
+// https://syzkaller.appspot.com/bug?id=64df843cec772943672cee2084811aa72fd41ff8
 // autogenerated by syzkaller (https://github.com/google/syzkaller)
 
 #define _GNU_SOURCE
@@ -24,7 +24,13 @@
 #include <linux/loop.h>
 
 #ifndef __NR_memfd_create
-#define __NR_memfd_create 319
+#define __NR_memfd_create 279
+#endif
+#ifndef __NR_mmap
+#define __NR_mmap 222
+#endif
+#ifndef __NR_unlinkat
+#define __NR_unlinkat 35
 #endif
 
 static unsigned long long procid;

#syz dup: WARNING in f2fs_unlink



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
