Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B183856F0E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Feb 2024 22:05:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1raivN-0005Wi-7g;
	Thu, 15 Feb 2024 21:05:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1raivI-0005WX-4L
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Feb 2024 21:05:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kbAHpNS+oOLTU8LAj4t0HslhUKwQH1LKk3gZ3VuSClk=; b=Giult7Dd+KMoIxiIbyJUIB9e9D
 4Yb8cQ3ZfzvPcwuHAm4XAHYlWWsb5AB3Mgv1D6xTtxAwrBVR0bZN9aUDQ7FW6cVGqRo8H8FyT8A6T
 681QtkpRlDxoubqD3dsl9sfvyKjLVg0EZy/r0csUz3Xf2zvzoUlyyQPnTFuk0SUKpczY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=kbAHpNS+oOLTU8LAj4t0HslhUKwQH1LKk3gZ3VuSClk=; b=i
 Rb4SbvtReguf2uSNoDkJcGoPUtj60EBtVlTYvw51oY7kYbh6LQkR0tNW25JC560cihLd4rJqapTBo
 xZyktxUvIAtvabcBfoU61YCnuDHRxa4aa1dGbX7zgO5HJZlGNiYM1iZ9BPAJlLesE9i4EUdK6XVNJ
 hSzhp7HOwRBcD0qo=;
Received: from mail-pf1-f173.google.com ([209.85.210.173])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1raivD-0004eu-Er for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Feb 2024 21:05:36 +0000
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-6e0cc8d740cso16055b3a.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 15 Feb 2024 13:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708031121; x=1708635921; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kbAHpNS+oOLTU8LAj4t0HslhUKwQH1LKk3gZ3VuSClk=;
 b=YMVvBE9FyAnXuyFJzIpUew0IiZq657RUoca5O1EQGJMl6Dl46LD7l3JcecASWQLRPI
 s2sRjAGdsav9Id/dco9nt74rvVW4qkNxpvRo3mG8MfXIL0E0T/tGvmXqJ45OOcy4f7+F
 1X49Ufw3Ps2TlVBYVg0mE+DuuK45l7MhT959DnsdrvWOwfP4l06sPtI2GQuE1LYQ9GPv
 lQsiFfvbaYF+njTP1C8eh0v+nbx9408Qw7HU4k2kZnd8g5T0aftREoPZg7REuvs7XDAy
 tHTwm6uD8bR9bXdEkgZJaMAewvdpAtpuFuhcfY9pIKvBDxMdeKdwy56+EFwA1S7Ah7pv
 iRyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708031121; x=1708635921;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kbAHpNS+oOLTU8LAj4t0HslhUKwQH1LKk3gZ3VuSClk=;
 b=kCcYSQP+RAIosdegxX39efsvCPABGDxht3hN4XmfvhRjT++o2qVOi3C4Gb52Q2oRcB
 1/WAWeRP0LbUtQ/XWR15unGg/VzJSJO0VXT8tD6CKswc/zDRTBLa+f23USsy4DOA0XB5
 onL8e3ZF/Rf+0R5nXambqX67uqp91GA8O+bhP8U+oxQPUAVqx1ol7A1ZWRNJw0iuqipK
 Jw4seoN7j7QzlOc/JhVSF2VqLAKKeOqPOUAsQiYISeF1OifiaT1uDatu0B1oCOd4DKao
 sIneNZaD5VYDlVFJbLpMAPRgaKL+qdoYaviBdj7tNKh9+xEDXRSqSg7iaNKGyPDVtiSo
 DOww==
X-Forwarded-Encrypted: i=1;
 AJvYcCVL27LUYMZETFxtIjrnGHNQjaW9eozL3TLEnFo1B8NiS3K/FDRN9r3TqbKJFBqTsWBnZztypgL18xaImyDHoK+Wk/dWb3y6NT77O19HmO6jl+Ab8N9tVw==
X-Gm-Message-State: AOJu0YylGSfTzZJHPnE+EojBwf15DCjt++8gqHrOpVXz7CWCFDiUYrb8
 Wf0YZ4suIbefoAHfL373ZEYlNz31yW31LT6w4vSzM2P1gOfD+2kS
X-Google-Smtp-Source: AGHT+IFu1e1GtjkpY/Ca22fHI2I9uZRfm6w3oOxLdm0dTC4dTB5bTHoZPfzj33IZsly09qCGn6w0rg==
X-Received: by 2002:a17:902:8c96:b0:1d9:df95:89dd with SMTP id
 t22-20020a1709028c9600b001d9df9589ddmr2819585plo.47.1708031121123; 
 Thu, 15 Feb 2024 13:05:21 -0800 (PST)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:0:1000:8411:3772:8174:2d71:3b60])
 by smtp.gmail.com with ESMTPSA id
 p9-20020a1709026b8900b001d8d90d4f67sm1677783plk.249.2024.02.15.13.05.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Feb 2024 13:05:20 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Thu, 15 Feb 2024 13:05:17 -0800
Message-ID: <20240215210517.2383647-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Daeho Jeong Added lseek command to support lseek() for
 SEEK_DATA and SEEK_HOLE. Signed-off-by: Daeho Jeong --- v2: add SEEK_SET,
 SEEK_CUR and SEEK_END --- tools/f2fs_io/f2fs_io.c | 47
 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+) 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.173 listed in list.dnswl.org]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.173 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1raivD-0004eu-Er
Subject: [f2fs-dev] [PATCH v2] f2fs_io: add lseek command to execute lseek()
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

Added lseek command to support lseek() for SEEK_DATA and SEEK_HOLE.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
v2: add SEEK_SET, SEEK_CUR and SEEK_END
---
 tools/f2fs_io/f2fs_io.c | 47 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index e7d286a..a5e151d 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -1630,6 +1630,52 @@ static void do_removexattr(int argc, char **argv, const struct cmd_desc *cmd)
 	exit(0);
 }
 
+#define lseek_desc "do lseek for a file"
+#define lseek_help					\
+"f2fs_io lseek [whence] [offset] [file_path]\n\n"	\
+"Do lseek file data in file_path and return the adjusted file offset\n"	\
+"whence can be\n"					\
+"  set  : SEEK_SET, The file offset is set to offset bytes\n"	\
+"  cur  : SEEK_CUR, The file offset is set to its current location plus offset bytes\n"	\
+"  end  : SEEK_END, The file offset is set to the size of the file plus offset bytes\n"	\
+"  data : SEEK_DATA, set the file offset to the next data location from offset\n"	\
+"  hole : SEEK_HOLE, set the file offset to the next hole from offset\n"
+
+static void do_lseek(int argc, char **argv, const struct cmd_desc *cmd)
+{
+	int fd, whence;
+	off_t offset, ret;
+
+	if (argc != 4) {
+		fputs("Excess arguments\n\n", stderr);
+		fputs(cmd->cmd_help, stderr);
+		exit(1);
+	}
+
+	offset = atoi(argv[2]);
+
+	if (!strcmp(argv[1], "set"))
+		whence = SEEK_SET;
+	else if (!strcmp(argv[1], "cur"))
+		whence = SEEK_CUR;
+	else if (!strcmp(argv[1], "end"))
+		whence = SEEK_END;
+	else if (!strcmp(argv[1], "data"))
+		whence = SEEK_DATA;
+	else if (!strcmp(argv[1], "hole"))
+		whence = SEEK_HOLE;
+	else
+		die("Wrong whence type");
+
+	fd = xopen(argv[3], O_RDONLY, 0);
+
+	ret = lseek(fd, offset, whence);
+	if (ret < 0)
+		die_errno("lseek failed");
+	printf("returned offset=%ld\n", ret);
+	exit(0);
+}
+
 #define CMD_HIDDEN 	0x0001
 #define CMD(name) { #name, do_##name, name##_desc, name##_help, 0 }
 #define _CMD(name) { #name, do_##name, NULL, NULL, CMD_HIDDEN }
@@ -1671,6 +1717,7 @@ const struct cmd_desc cmd_list[] = {
 	CMD(listxattr),
 	CMD(setxattr),
 	CMD(removexattr),
+	CMD(lseek),
 	{ NULL, NULL, NULL, NULL, 0 }
 };
 
-- 
2.44.0.rc0.258.g7320e95886-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
