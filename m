Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zneULL3zImqtfgEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 05 Jun 2026 18:05:17 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCCD64995A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 05 Jun 2026 18:05:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=aUFLrGme;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=Vcifx60b;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="J XE1osv";
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=olG74gd4;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=gmail.com (policy=none)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yL2kM8kX7HzvZO4T6HhtSeWAnl6X00fMtbubkpTV2Fc=; b=aUFLrGme29Uok99Y61X0Jb7jwx
	LDSn0KE6DuZt13r9GDZHjv2bAMtiZ/3U8Tw/ynIbJeRhtAWf78O05hP03rTbA15SvifICUZ3n749i
	7NC1KkFT8F6cUXi4M3l5dVOAl1p69q/teJv8BLc4X0Df0ztLFqct2tvRPPj05syTgD0g=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wVX2d-0007UQ-RJ;
	Fri, 05 Jun 2026 16:05:03 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1wVX2a-0007Th-0O
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 05 Jun 2026 16:05:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=usYILwUBQbWiiNoZECkULqc3ZaaMcV77JqRP2clLLDk=; b=Vcifx60b8LiGSktLsws7oVAv4X
 40vRBgAUKgv6TnatKEeIiFCjpvNEtJLNQz//uhvdqeRXa68IoNJjBMvk/Yz1W+lixmJFSyJZo8yAj
 0LahdZQSz+A6iDy7YAoo8TI5V5szoXgogTQ3KmeOtYlJfa8CrDl6bKaPRVXh4SVfccE8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=usYILwUBQbWiiNoZECkULqc3ZaaMcV77JqRP2clLLDk=; b=J
 XE1osvQbLLehsCfet5TAa9TZRaW0Jw8mtCxNPbxQ8VlChi8wFmsGDphVv9HB+g8OWIeJUWzluS3kp
 ZuS0DuhgBr4Fg52csJVcqqaE/tZ+iWNQdekQRp7SfTIzFad69rj9FRliRRfwydT7uaiH84GZCFWyZ
 EzIHUKaFMZj8eur8=;
Received: from mail-dl1-f49.google.com ([74.125.82.49])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wVX2X-0000nA-Tk for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 05 Jun 2026 16:04:59 +0000
Received: by mail-dl1-f49.google.com with SMTP id
 a92af1059eb24-137dd5161feso4131052c88.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 05 Jun 2026 09:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780675493; x=1781280293; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=usYILwUBQbWiiNoZECkULqc3ZaaMcV77JqRP2clLLDk=;
 b=olG74gd4GgBQ+KlGuqaNmohhV7IkKYUuFuTDUAmEPX1nvxfo1Qj6QHZ9FEXGwUZIRU
 itphvQO8eZ7C3fy7ZgVpZSSU1CC2sI2u0TgMZClBM4M1At8J2MfI+tK5pBLW1yjZyOLk
 p9Ydt8QqYE9BfyaX0cxfjnsySUrgaQl+18bd3bgRBXTWc0C3y1yoA7gXNOEa/1xAAcXf
 5pz5+3ZSVGN7Lic/bUSAK80Jd52cM2O2wwhZJsT4YJ14DYjadPgV3R5CRygk+10NTte2
 ZzBtlybcS/k1/NHiU/cmmkK/TNsnet1f34Z+mtuqNkhnjERN6w4FURmyw/L2CuzG7oEu
 cQUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780675493; x=1781280293;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=usYILwUBQbWiiNoZECkULqc3ZaaMcV77JqRP2clLLDk=;
 b=ZssgGxEUXHHI7qmTz7Eckl271EHbgLCVdkqxiyNFA/sksz/xzNW4oi2tOV+FiXL5mq
 xV6yvI3+IxhP/v8yY9bLYhX2x97zN9gS0/dLeWakGiYT3TqlBX7d8uYzyVtnwUGzgxJb
 aKggULrqCKYxfuTGIN8CeSPT7Y6pNZ2zJS/fGZE5u6BS0rmtYh2DwSL1/zRwLbmz6VBp
 sFV0P3Mh7arqigMlQmYy7S94qEu7nYkLUhckOFShH+FmM+ARL8MGZ5o1E1UY5yrLwIYz
 XGKS+wKsE2kyCJqBAyiIA5KIzBTrUQhHJBjypKud+t8IGFqrthFAa+KQb2mT51GfCwgT
 6mMQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9i6dJBCUX1j3Sll27q+kGKwjHF7eEWIFna7EJGZZHkhlWnknFgYfkVkTULx1eqKzHHv2ByPnqUjg9BEzHATvxv@lists.sourceforge.net
X-Gm-Message-State: AOJu0YziwkzL3Fg97M+EZh+9k/XSiLPA2U1KJ5wtkBvCUQa86SAdvJSZ
 rV678gPLg3CswDIF4r88GYXQiuTmBo/mLjZcMHtraIlv/iCWNqZzA7+b
X-Gm-Gg: Acq92OGdoYUDHxI1doGjEbOwwX+YCBxJyzQXlRjlhWEyC57B774jKE/cfApCWDCZgVT
 Al7K2NaoHbQgUqJ61Btmk42CdnTuGiYa80qzmCv5XKYbMmNbOKYKrDC2zmjbeao0P2QdDYjYMU8
 wDMwmZAbf85JbNrEmPxYdlI4C2j9ajxzzAtlWzdvGVaSsLzcvM/3KNIb0kzqoSyEPuvKh6MJGXO
 P2f8i7OCdQZHhBapTqW/hZtQSeQ8sTbbkqnOV2VyMEMeiw96pfa7uprIVjZMSduMMAkxtSJZGyv
 PkgvopqZBm1g2UeVgiuC5a3W2T1Iawt8+cqLXhMm4SBkw15FynyWo0bMXa+QWSiKYmAhm5/l/r3
 GBOjR2Mbtu45r7JIfneAAWYteHyPIDrU6EgxRePJ6h4nezVpxDw65mq8DkgzsUPz000rV9F+uA5
 n1fGX/vFjXKnb8UBHcMq/OaahYOw/OoOYM1yvVn+U9ZEttypMU6t22r5ebfYthiyRYtfDIA28XN
 pEyaCwgQ5dZFySFKShmRahFcObXXh2ZU0ewjbNMIGLEuyB5ROWq0w9QtQ0hdw==
X-Received: by 2002:a05:7022:45a6:b0:136:e42d:2c20 with SMTP id
 a92af1059eb24-138066ce63cmr1998288c88.16.1780675492579; 
 Fri, 05 Jun 2026 09:04:52 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2a00:79e0:2e7c:8:16ef:e728:d736:fc92])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-137f5550bcdsm6324267c88.14.2026.06.05.09.04.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 09:04:52 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Fri,  5 Jun 2026 09:04:48 -0700
Message-ID: <20260605160449.888400-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.54.0.1032.g2f8565e1d1-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Daeho Jeong This commit adds a new 'dev_alias' command
 to f2fs_io tool to support dynamic inclusion, exclusion and status querying
 of device alias ranges. This corresponds to the F2FS_IOC_EXCLUDE_DEV_ALIAS,
 F2FS_ [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [daeho43(at)gmail.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [daeho43(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [74.125.82.49 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1wVX2X-0000nA-Tk
Subject: [f2fs-dev] [PATCH] f2fs_io: add dev_alias command for dynamic
 device aliasing management
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.01 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:kernel-team@android.com,m:daehojeong@google.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[daeho43@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daeho43@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_smtp,lists.sourceforge.net:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CDCCD64995A

From: Daeho Jeong <daehojeong@google.com>

This commit adds a new 'dev_alias' command to f2fs_io tool to support
dynamic inclusion, exclusion and status querying of device alias ranges.
This corresponds to the F2FS_IOC_EXCLUDE_DEV_ALIAS,
F2FS_IOC_INCLUDE_DEV_ALIAS and F2FS_IOC_GET_DEV_ALIAS_STATUS ioctls
introduced in the kernel.

It also updates 'getflags' to support displaying the device aliasing
flag.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 tools/f2fs_io/f2fs_io.c | 55 ++++++++++++++++++++++++++++++++++++++++-
 tools/f2fs_io/f2fs_io.h | 10 ++++++++
 2 files changed, 64 insertions(+), 1 deletion(-)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index c977f4d..413a47d 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -251,7 +251,8 @@ static void do_set_verity(int argc, char **argv, const struct cmd_desc *cmd)
 "  casefold\n"							\
 "  compression\n"						\
 "  nocompression\n"						\
-"  immutable\n"
+"  immutable\n"							\
+"  dev_alias\n"
 
 static void do_getflags(int argc, char **argv, const struct cmd_desc *cmd)
 {
@@ -317,6 +318,12 @@ static void do_getflags(int argc, char **argv, const struct cmd_desc *cmd)
 		printf("immutable");
 		exist = 1;
 	}
+	if (flag & FS_DEVICE_ALIAS_FL) {
+		if (exist)
+			printf(",");
+		printf("dev_alias");
+		exist = 1;
+	}
 	if (!exist)
 		printf("none");
 	printf("\n");
@@ -2509,6 +2516,51 @@ static void do_test_lookup_perf(int argc, char **argv, const struct cmd_desc *cm
 	exit(0);
 }
 
+#define dev_alias_desc "device alias control"
+#define dev_alias_help						\
+"f2fs_io dev_alias [include|exclude|status] [file]\n\n"			\
+"include, exclude or status a range of device alias given the file\n"
+
+static void do_dev_alias(int argc, char **argv, const struct cmd_desc *cmd)
+{
+	int fd, ret;
+
+	if (argc != 3) {
+		fputs("Excess arguments\n\n", stderr);
+		fputs(cmd->cmd_help, stderr);
+		exit(1);
+	}
+
+	fd = xopen(argv[2], O_RDWR, 0);
+
+	if (!strcmp(argv[1], "exclude")) {
+		ret = ioctl(fd, F2FS_IOC_EXCLUDE_DEV_ALIAS);
+		if (ret < 0)
+			die_errno("F2FS_IOC_EXCLUDE_DEV_ALIAS failed");
+		printf("%s device alias range of %s\n", argv[1], argv[2]);
+	} else if (!strcmp(argv[1], "include")) {
+		ret = ioctl(fd, F2FS_IOC_INCLUDE_DEV_ALIAS);
+		if (ret < 0)
+			die_errno("F2FS_IOC_INCLUDE_DEV_ALIAS failed");
+		printf("%s device alias range of %s\n", argv[1], argv[2]);
+	} else if (!strcmp(argv[1], "status")) {
+		u32 status = 0;
+
+		ret = ioctl(fd, F2FS_IOC_GET_DEV_ALIAS_STATUS, &status);
+		if (ret < 0)
+			die_errno("F2FS_IOC_GET_DEV_ALIAS_STATUS failed");
+
+		printf("device alias status of %s: %s\n", argv[2],
+			status == F2FS_DEV_ALIAS_STATUS_EXCLUDED ? "excluded" : "included");
+	} else {
+		fputs("Wrong request type\n\n", stderr);
+		fputs(cmd->cmd_help, stderr);
+		exit(1);
+	}
+
+	exit(0);
+}
+
 #define freeze_desc "freeze filesystem"
 #define freeze_help "f2fs_io freeze [directory_path]\n\n"
 
@@ -2603,6 +2655,7 @@ const struct cmd_desc cmd_list[] = {
 	CMD(get_advise),
 	CMD(ioprio),
 	CMD(ftruncate),
+	CMD(dev_alias),
 	CMD(test_create_perf),
 	CMD(test_lookup_perf),
 	CMD(freeze),
diff --git a/tools/f2fs_io/f2fs_io.h b/tools/f2fs_io/f2fs_io.h
index b0d4099..9e7e067 100644
--- a/tools/f2fs_io/f2fs_io.h
+++ b/tools/f2fs_io/f2fs_io.h
@@ -96,6 +96,9 @@ typedef u32	__be32;
 #define F2FS_IOC_START_ATOMIC_REPLACE	_IO(F2FS_IOCTL_MAGIC, 25)
 #define F2FS_IOC_GET_DEV_ALIAS_FILE	_IOR(F2FS_IOCTL_MAGIC, 26, __u32)
 #define F2FS_IOC_IO_PRIO		_IOW(F2FS_IOCTL_MAGIC, 27, __u32)
+#define F2FS_IOC_EXCLUDE_DEV_ALIAS	_IO(F2FS_IOCTL_MAGIC, 28)
+#define F2FS_IOC_INCLUDE_DEV_ALIAS	_IO(F2FS_IOCTL_MAGIC, 29)
+#define F2FS_IOC_GET_DEV_ALIAS_STATUS	_IOR(F2FS_IOCTL_MAGIC, 30, __u32)
 
 #ifndef FSCRYPT_POLICY_V1
 #define FSCRYPT_POLICY_V1		0
@@ -200,6 +203,10 @@ enum {
 	F2FS_IOPRIO_WRITE = 1,  /* high write priority */
 };
 
+/* for F2FS_IOC_GET_DEV_ALIAS_STATUS */
+#define F2FS_DEV_ALIAS_STATUS_INCLUDED	0
+#define F2FS_DEV_ALIAS_STATUS_EXCLUDED	1
+
 #ifndef FS_IMMUTABLE_FL
 #define FS_IMMUTABLE_FL			0x00000010 /* Immutable file */
 #endif
@@ -225,6 +232,9 @@ enum {
 #ifndef FS_CASEFOLD_FL
 #define FS_CASEFOLD_FL			0x40000000 /* Folder is case insensitive */
 #endif
+#ifndef FS_DEVICE_ALIAS_FL
+#define FS_DEVICE_ALIAS_FL		0x80000000 /* Device aliasing file */
+#endif
 
 #ifndef RWF_DONTCACHE
 #define RWF_DONTCACHE			0x00000080 /* Uncached buffered IO.  */
-- 
2.54.0.1032.g2f8565e1d1-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
