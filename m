Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3FF50AB68
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Apr 2022 00:19:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nhf9F-00087I-Do; Thu, 21 Apr 2022 22:19:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bart.vanassche@gmail.com>) id 1nhf9E-00086H-4n
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Apr 2022 22:19:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uqqQusoK+iKCSWPw4icSY2FAimf/bh4J4G1L4A/D/90=; b=Dpwi6Pojx8ZnJno8QrSzH1bN3+
 HCWIEwcHR2ZvwtKuMMxP8dsbnJBHnCezDn3N1eYGgN+dFh1v5FsG+PkIMx4b9vmyfpoZVr+e5Qvsx
 uyOleL/Hqr8glYzHJezlfzsd0N2vj73XDJ0HZJER7QlKZmb+ck3OgjxvAYlznTSAT1r4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uqqQusoK+iKCSWPw4icSY2FAimf/bh4J4G1L4A/D/90=; b=JUijswSrw4SJ+w4/ck7IOiPQcH
 Kj/xkaJ7WDFpWqkQ5VgKg3DGh+5zMStpmOQgfXsWeAFjnf8yiYAPJ3IgRVVeQ1NkvT0D2J/sVbmTP
 0C8HqwJzg7/LDfVDd6U3NKbQlfiwZJR/ydNjbAsd8B/zKMaELEU54tsoCoySpjd1MrU8=;
Received: from mail-pf1-f169.google.com ([209.85.210.169])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nhf9C-005sS4-Iz
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Apr 2022 22:19:35 +0000
Received: by mail-pf1-f169.google.com with SMTP id b15so6251623pfm.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 21 Apr 2022 15:19:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uqqQusoK+iKCSWPw4icSY2FAimf/bh4J4G1L4A/D/90=;
 b=LgaEvmooFS2ryMKC/IZH58CwtcBlCkgNmh0w+HQg7vUoE5E3jSxdopx/LU8PvU+64R
 8FMEDwlUCXdXEK9SEdIYVI/IatkcpAB46nKF91b/Jods6fx30KrIqNsUNAY++TwV+lEG
 S16OdQ+fZ88f6uUkgFNlVgfez/F22vOSjFdm5s/fUjNnkDsNW5exPwxCiUDk8d7OgGsz
 iZCcxC619whzB/K9l6wyool9jvjNrJ5DOJ7DyKsPtMAEz/TNNhBg3GZ5yBVBtZzRNPzE
 M3EyLUlkY9RYYCoaQnF12PQqD5mRdmHqnaqlLDTUuFva1zlWK0lggMUGsN8fw4pyCWvL
 3tKg==
X-Gm-Message-State: AOAM533hSC7C4Q73kRAC5DG3dp5D4/N5+4hf06y2KOHmJzFaZPLPu3cM
 yxeidxPVeB7ldUBawzRuZ6g=
X-Google-Smtp-Source: ABdhPJzcxBaCoJh3UG98UlQqbShJ/AzZTZmLwO8LbbOXUfzFyAmYmQ/lleK0XFst55V15iX0DBaF4g==
X-Received: by 2002:a63:67c4:0:b0:3a3:2134:aed7 with SMTP id
 b187-20020a6367c4000000b003a32134aed7mr1297841pgc.398.1650579568714; 
 Thu, 21 Apr 2022 15:19:28 -0700 (PDT)
Received: from bvanassche-linux.mtv.corp.google.com
 ([2620:15c:211:201:a034:31d8:ca4e:1f35])
 by smtp.gmail.com with ESMTPSA id
 hi21-20020a17090b30d500b001cd4989ff4csm3794876pjb.19.2022.04.21.15.19.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 15:19:27 -0700 (PDT)
From: Bart Van Assche <bvanassche@acm.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Date: Thu, 21 Apr 2022 15:18:31 -0700
Message-Id: <20220421221836.3935616-27-bvanassche@acm.org>
X-Mailer: git-send-email 2.36.0.rc2.479.g8af0fa9b8e-goog
In-Reply-To: <20220421221836.3935616-1-bvanassche@acm.org>
References: <20220421221836.3935616-1-bvanassche@acm.org>
MIME-Version: 1.0
X-Spam-Score: 0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Make it possible to check whether the return value of ioctl()
 is negative. Signed-off-by: Bart Van Assche <bvanassche@acm.org> ---
 tools/f2fs_io/f2fs_io.c
 | 10 +++++++++- 1 file changed, 9 insertions(+), 1 deletion(-) 
 Content analysis details:   (0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.169 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [bart.vanassche[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.169 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
X-Headers-End: 1nhf9C-005sS4-Iz
Subject: [f2fs-dev] [PATCH 26/31] tools/f2fs_io: Fix the type of 'ret'
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
Cc: Bart Van Assche <bvanassche@acm.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Make it possible to check whether the return value of ioctl() is negative.

Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 tools/f2fs_io/f2fs_io.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index e807177a4174..6bb094cc7f25 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -513,7 +513,7 @@ static void do_erase(int argc, char **argv, const struct cmd_desc *cmd)
 
 static void do_write(int argc, char **argv, const struct cmd_desc *cmd)
 {
-	u64 buf_size = 0, inc_num = 0, ret = 0, written = 0;
+	u64 buf_size = 0, inc_num = 0, written = 0;
 	u64 offset;
 	char *buf = NULL;
 	unsigned bs, count, i;
@@ -561,6 +561,8 @@ static void do_write(int argc, char **argv, const struct cmd_desc *cmd)
 	fd = xopen(argv[6], O_CREAT | O_WRONLY | flags, 0755);
 
 	if (atomic_commit || atomic_abort) {
+		int ret;
+
 		if (argc == 8)
 			useconds = atoi(argv[7]) * 1000;
 
@@ -573,6 +575,8 @@ static void do_write(int argc, char **argv, const struct cmd_desc *cmd)
 
 	total_time = get_current_us();
 	for (i = 0; i < count; i++) {
+		uint64_t ret;
+
 		if (!strcmp(argv[4], "inc_num"))
 			*(int *)buf = inc_num++;
 		else if (!strcmp(argv[4], "rand"))
@@ -593,12 +597,16 @@ static void do_write(int argc, char **argv, const struct cmd_desc *cmd)
 		usleep(useconds);
 
 	if (atomic_commit) {
+		int ret;
+
 		ret = ioctl(fd, F2FS_IOC_COMMIT_ATOMIC_WRITE);
 		if (ret < 0) {
 			fputs("committing atomic write failed\n", stderr);
 			exit(1);
 		}
 	} else if (atomic_abort) {
+		int ret;
+
 		ret = ioctl(fd, F2FS_IOC_ABORT_VOLATILE_WRITE);
 		if (ret < 0) {
 			fputs("aborting atomic write failed\n", stderr);


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
