Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Mt8DGsJ1I2qMuAEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 06 Jun 2026 03:20:02 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE1164C184
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 06 Jun 2026 03:20:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=XBB7z834;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=esJFmrNc;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="M 4HF61b";
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b="k/hBu0B1";
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=gmail.com (policy=none)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RH6cZnhLFwsXNWebd4QBpJ3fZF67LnnFkNRUIeNOkjU=; b=XBB7z834J7vSP7G97WIoWP/+XZ
	K2jaQlpatr/JVQtCLo3w0lCOUZbLfEzNr7LdUDcjvIoUOWgQNv7JBjBlfdftAe86igJB5r9S7F1Bh
	OBoDpl+D1WU4EWW05WAkW4OLLaIVrDrYwfnVBrrdqncanaW9xOKBAvU0RJrs0xiwFoUA=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wVfhd-0001LR-BQ;
	Sat, 06 Jun 2026 01:19:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1wVfhc-0001LK-ED
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 06 Jun 2026 01:19:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QW4Dd9spS3sOLwWqAYJc0QlQ2KljtV0LTkk6fFDnlpY=; b=esJFmrNcQImEadSSNowaOcia0M
 XmQ581m81v0RowzkUBblBw6yc3vByJjgTytxFL2ASEglyOKjHzZKlm+LYoGqb4Zv8OUjd99KvqiOt
 vXyrdoiyjKZ1jJgZl3Gr/LaHtcAfTJVACMTLojgCE6dj1toSvPbxRh7gRt2QCZJoXlAg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=QW4Dd9spS3sOLwWqAYJc0QlQ2KljtV0LTkk6fFDnlpY=; b=M
 4HF61bHI1/VCW3yR/+JuOMvOcWErEi+Yw4LbqLpDa6lt0pohCCM5Ep42GICQVhOuLfCgK+mcoFtTE
 ofX5NwNivdPeGhk/J2T0Ho1V7iPbQv5yMDmzlBPswaOatZxtSBUXBJlCPyWABSMTKqnxyG4m1UQav
 mU6kfgsBphEbD+Ys=;
Received: from mail-dy1-f174.google.com ([74.125.82.174])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wVfhb-00010Z-Eh for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 06 Jun 2026 01:19:56 +0000
Received: by mail-dy1-f174.google.com with SMTP id
 5a478bee46e88-3045c195251so2277285eec.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 05 Jun 2026 18:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780708785; x=1781313585; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QW4Dd9spS3sOLwWqAYJc0QlQ2KljtV0LTkk6fFDnlpY=;
 b=k/hBu0B1r+VmglGNOJciAAb6bw4iaqODzW0MVL794CpCUFjLBiN+eAxxFJMXthTF+e
 YwugYwU92PnEEyWulMOc1DLEPhb6blGhDB6aR9qF0vRDTW8uSMebdjJnXewvTuZuegvt
 Cdoyygpe/0rsAQCzvlk18VBj3zbjPYdoL7Cz+nbYtPpAoLn7eoX1TLtPqwGcHALuFmlk
 3UAYpq2M3OP+bcSMftxOsEfwRKxB5LDMYmGlxL9CDxqdWv6yEvnGYlfhndrT5gPa3QQV
 uKCiZXgXz9TjIyMCtrAOjlhaTDZv/Adp68It5LuM+JNFWtWYT+BtWSmK0LbMOqK0OX3M
 Beqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780708785; x=1781313585;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QW4Dd9spS3sOLwWqAYJc0QlQ2KljtV0LTkk6fFDnlpY=;
 b=lHl09iJr+Rj8KjDITm+vk2Uj+lEzPodDaJuUbfRO0A+NaoZmILhPI7OdTb3qBRIZnJ
 KzE7D2lzNB+aUakSN0lyZwu0lTuWGtnQ2NrCGLs/GxCK3uXPla53zDDeQYqIsPYbSmCS
 +HrYNhuax0a9dDS9JBQVumpLFpQZKTBGeDA27/cGPZ57aykL4bxk5km4qgnyPQ3UDlZi
 7xTGDYLCAh2F7EW3As8vZfkdoqEJaXNwFxOU8AKbTwMzo0qAQsEuCQhBzOaIUlycNv69
 HHCcjVphLXnHptbQ6htwqQP80rpVGHi7P+gWBxIjoygKCxb1idrjFHBN/7j603H/IcCd
 4XQg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8+z38zqvURza5/GB66UsMEgSPkwZgW8SOlCNOyeto/hZHz2DsD9cv4Sy/5vgeVrv4UFmFQxy3W4WchDz5krVQU@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyHfDcbrMzXdhlCmPjosm4kJ9Iy5EqSAChvWnpmZtyq+V0Y5oCk
 h8FvBvSymxXYDEtFwQ/KmpWZK8Wy7FK2/twSsY9RpTryYBv8eP+KYsVKIptuUw==
X-Gm-Gg: Acq92OGAikT2hKYQAKAmpMooeYudbY48o99O9FBMTS9dNts6LGiwYaxT0xQg7qZ851F
 UQn/AsuZMXsDwwWM6CvG0PacqO2CkWDSVfZYVwbSf4u56F9FJG+y7IsV8hhzpNMBgjdrHXQcfSn
 n+IESeztXsR7hs09HeLaOb2lJl3NRykAhioGCYIUX3WTIloGY5052vXu8mGCV36tYetY34Sx0fM
 07bsx3LZutGj9zuXBUEoUCxL233MNPNaLJNkh2SWGQT4FswnJSRSMPI2Veg5et3mpwDJxIvLBUe
 phUXFzFwHNtXo6zlBKnp+GIIURHeCWxLKHDOyZIowgEpZxXnPALZawT9/GRKdwL3ilcEVE2Ax6d
 FErbbnKMdg4QUSGSyje60Bvex+DMc2ZHN7FZmA/15Hw+ixfODirUi3tqTXFt3VBNynxIXymhRoz
 GOZrwSsXFnywtrOxVQs/KL9K3t7RxfwhkGQdGLEi8axvlHH/L3W9cI9n1av2w5GCHmGo7FFTN2u
 dIuMHp/TenZBPGz9KuoFaiaYOiHK67s98duG8C6kesYVi7wy6xMYeZldjvBxA==
X-Received: by 2002:a05:7300:cc0c:b0:2ce:25be:c8e8 with SMTP id
 5a478bee46e88-3077b22a360mr3716634eec.17.1780708785241; 
 Fri, 05 Jun 2026 18:19:45 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2a00:79e0:2e7c:8:36b0:9062:f19d:e1c8])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3074df3b234sm12383256eec.23.2026.06.05.18.19.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 18:19:44 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Fri,  5 Jun 2026 18:19:42 -0700
Message-ID: <20260606011942.1206814-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.54.0.1032.g2f8565e1d1-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Daeho Jeong This commit adds a new 'dev_alias' command
 to f2fs_io tool to support dynamic inclusion, exclusion and status querying
 of device alias ranges. Signed-off-by: Daeho Jeong --- v2: remove a f2fs
 specific flag from getflags. --- tools/f2fs_io/f2fs_io.c | 46
 +++++++++++++++++++++++++++++++++++++++++
 tools/f2fs_io/f2fs_io.h | 7 +++++++ 2 files c [...] 
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
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [daeho43(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [daeho43(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [74.125.82.174 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1wVfhb-00010Z-Eh
Subject: [f2fs-dev] [PATCH v2] f2fs_io: add dev_alias command for dynamic
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
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:kernel-team@android.com,m:daehojeong@google.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[daeho43@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
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
X-Rspamd-Queue-Id: 9BE1164C184

From: Daeho Jeong <daehojeong@google.com>

This commit adds a new 'dev_alias' command to f2fs_io tool to support
dynamic inclusion, exclusion and status querying of device alias ranges.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
v2: remove a f2fs specific flag from getflags.
---
 tools/f2fs_io/f2fs_io.c | 46 +++++++++++++++++++++++++++++++++++++++++
 tools/f2fs_io/f2fs_io.h |  7 +++++++
 2 files changed, 53 insertions(+)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index c977f4d..3fa323b 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -2509,6 +2509,51 @@ static void do_test_lookup_perf(int argc, char **argv, const struct cmd_desc *cm
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
 
@@ -2603,6 +2648,7 @@ const struct cmd_desc cmd_list[] = {
 	CMD(get_advise),
 	CMD(ioprio),
 	CMD(ftruncate),
+	CMD(dev_alias),
 	CMD(test_create_perf),
 	CMD(test_lookup_perf),
 	CMD(freeze),
diff --git a/tools/f2fs_io/f2fs_io.h b/tools/f2fs_io/f2fs_io.h
index b0d4099..57d96b7 100644
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
-- 
2.54.0.1032.g2f8565e1d1-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
