Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WABgECtVGWrTvQgAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 May 2026 10:58:19 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CFE5FF9DB
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 May 2026 10:58:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QsLXe7thJzNPy1vim1Bo0SCzVLxvUg+K77cPFhTpBWU=; b=kyMMgBdDHq708pkUpChceTrkUn
	Szp/uHJeYASDc5bm9vtu8g2//f7sZzkk9pfWMZHlHL383uDRlEyDZ4G3ujdW8DnWOMa9LorXn5FCX
	nO23769KK2PyuXOBmHGER1bT8Kf9FEOqay9zZ1+Y1G9cydecNNRCVAowqcqfsekelY9M=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wSt2j-0007Kp-2c;
	Fri, 29 May 2026 08:58:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng.storage@gmail.com>) id 1wSt2h-0007KY-7X
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 29 May 2026 08:58:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WvboyfDY9vgA0pxyz1U4qNU8sbxfY1NCBV7gnv9/9xk=; b=N+Ga1TZ+RCv4moBcVSuvvk7faw
 auj0+zIL6Wi1UqHfTbsdSEHOftGyk/Whw6KXPg+THxr1jRxv+GWIhVICq07fQ3R9CkGHZcIkz+aP1
 SebASO6IeFhPgVwmrkPtqudwo03r19cWDaVdHW+Avo4WJ0u+ZyrmC+FoWSwYNS8tAtks=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WvboyfDY9vgA0pxyz1U4qNU8sbxfY1NCBV7gnv9/9xk=; b=BVsAygltDgBtlaECXW4VbyRN9V
 Qio9FI0AmEgxzmyPvLGmEpaZNMPJXtngpWg5v2TE1qQqbTNjMlKhgM7S9FuIkr2c5rLu8SLaIfMaR
 /Q5r2s6xbtI/Qw2EjXp25DqMXNeprWKvulwOY8wKnktAHslaF0WFhD/g2iQlcRG8guh0=;
Received: from mail-pf1-f178.google.com ([209.85.210.178])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wSt2f-0001Bk-Ud for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 29 May 2026 08:58:11 +0000
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-82fbdd60b64so11092823b3a.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 29 May 2026 01:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780045080; x=1780649880; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WvboyfDY9vgA0pxyz1U4qNU8sbxfY1NCBV7gnv9/9xk=;
 b=Nrt48A+2qg9TGGbryubSQKv/pkhh+FPL0QYxMoMfy49pOL0yds0kyWawfD6EZPaQZu
 D2DX/9O9iLgVtg4JtO5hGos5HbiNwXN+CzZuhqmaQLCaO3JvkeeVpOQYtqG5y1QI4tzK
 T/pwAN5iqJNiRAIhdxGsCnIg77voxvHMIrHOSj3K884GZkUyHyb+B1rkqG+MzVrPylgc
 Vuk01lfdBuxLrfUQXr3RRr8e7QyVU44Rm8ZivAXPpduuQt6I8JBIqODjFidZfxaNWf+q
 xcOOVW/8Eb8E8tERNWkSTICUOeuRIKZbozA0ZMOQMBG66IXQb3Y2BkD6+lEHpdLo5a87
 49Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780045080; x=1780649880;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=WvboyfDY9vgA0pxyz1U4qNU8sbxfY1NCBV7gnv9/9xk=;
 b=s/TRadhvinR6mQNxwzCS4HoMPY57L1z12jndy6ZE+MOp14fn4lmp4zYvR4zMGcz4/Q
 IwhdwfsTmHra/OsbNeB6DitlkzZiwoNi8iGRunXE6p3ige3N+19ZdRGZbUHwsgB1NmBc
 5hoaclu3ZKN2Bo1MTW+5dlrhYTwZ5H4V5FYtYPp4s7IXOPof/hpuX4ZY18J/FXnMTvZF
 xeOBHuaOv3THXAh0SRfHbRm78rtYg9+pO/YbQjgBKbnJezh2t61vBlJgU8g4gp/yf0ww
 vAjIZpxIRFKmxKPcWL9N7fTNWlolo8jjivjjfa/VuW4B5xPcpGtBzRL/sFNf9Z3x0V1R
 2RwA==
X-Gm-Message-State: AOJu0Yz1UDdekSbJ/YBbDgZXxFHxFNMtnM2m1sKO9GFP4912VYIvIBhq
 W+xYb4axY63zkIJ0AGMGe18GoWrIBzxyoB/iqfPzFauIGksIg8P4V8Cm
X-Gm-Gg: Acq92OEWa9aYyJ96SkIEftiEHRroxpY83d5EFbwGHw2gcW4ppv+6Kt3o1kPnXk7YqW1
 4sbIljS4F+TerpXWcdhv7aYQ5PhOpuiqXJgwz/fG4gjmGzs4J9szjDvbamQUL5bsyqqinW8AJvE
 eFdfh6skFdXdG/4gs7syI02adaJXviVLKNKeUlqTMnqaA1PpjJaght/cV9wjJzR7PX79Lukl1uy
 RTYqDNjtIFOoF2qTF9KFadf63EbE1KzMF39LD3/ZOyriSH7eHH3/uMqDKYfIxfd0vTRjIrzw0NU
 1epJ9o6MPx/FhrCysKo25jRbm0gZeex89Fp+V9CbFUsifozB+4ghBdw8aQ5jXLCngDDYl1FZ3YT
 VeGSBRNSRZwal+vv2jWXhavkfOr+4mARkVVRzyDwjCXJvfuMthgKaqBOwzWwFURHLolDFWyX3MT
 /hp6CH2qxXrep8IqDUv4JjbtIECwFGGTec8rq1bnFTLYYeux+sGwCwG6cAyn/0K7tAE+50SoSbv
 tLSxzubsBpOQ5HcORA=
X-Received: by 2002:a05:6a00:a224:b0:839:dd77:3501 with SMTP id
 d2e1a72fcca58-84212a7aa2dmr2121871b3a.1.1780045079697; 
 Fri, 29 May 2026 01:57:59 -0700 (PDT)
Received: from xiaomi-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84214d0513bsm1216639b3a.61.2026.05.29.01.57.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 01:57:59 -0700 (PDT)
From: Yongpeng Yang <yangyongpeng.storage@gmail.com>
To: Chao Yu <chao@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Fri, 29 May 2026 16:57:44 +0800
Message-ID: <20260529085745.2664678-2-yangyongpeng.storage@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260529085745.2664678-1-yangyongpeng.storage@gmail.com>
References: <20260529085745.2664678-1-yangyongpeng.storage@gmail.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Yongpeng Yang Add build system configuration for inline
 extent feature: - Add --disable-inline-extent configure option (enabled by
 default) - Add iextent.c and iextent.h to fsck build sources - Define
 HAVE_INLINE_E [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.178 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [yangyongpeng.storage(at)gmail.com]
X-Headers-End: 1wSt2f-0001Bk-Ud
Subject: [f2fs-dev] [RFC PATCH v2 2/3] build: add inline extent build support
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 Yongpeng Yang <monty_pavel@sina.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-1.01 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:monty_pavel@sina.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[yangyongpengstorage@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yangyongpengstorage@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[xiaomi.com,sina.com,lists.sourceforge.net];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:email,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Queue-Id: 83CFE5FF9DB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Yongpeng Yang <yangyongpeng@xiaomi.com>

Add build system configuration for inline extent feature:
- Add --disable-inline-extent configure option (enabled by default)
- Add iextent.c and iextent.h to fsck build sources
- Define HAVE_INLINE_EXTENT macro when feature is enabled

Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
---
 configure.ac     | 10 ++++++++++
 fsck/Makefile.am |  4 ++--
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/configure.ac b/configure.ac
index 4d91605..0d140b4 100644
--- a/configure.ac
+++ b/configure.ac
@@ -62,6 +62,16 @@ AC_ARG_WITH([lz4],
 	[],
 	[with_lz4=check])
 
+AC_ARG_ENABLE([inline-extent],
+	[AS_HELP_STRING([--disable-inline-extent],
+	  [Disable inline extent support (enabled by default)])],
+	[],
+	[enable_inline_extent=yes])
+
+AS_IF([test "x$enable_inline_extent" = "xyes"],
+	[AC_DEFINE([HAVE_INLINE_EXTENT], [1],
+		[Define if inline extent support is enabled])])
+
 # Checks for programs.
 AC_PROG_CC
 AM_PROG_AR
diff --git a/fsck/Makefile.am b/fsck/Makefile.am
index f0d7f87..9694538 100644
--- a/fsck/Makefile.am
+++ b/fsck/Makefile.am
@@ -4,12 +4,12 @@ AM_CPPFLAGS = ${libuuid_CFLAGS} -I$(top_srcdir)/include
 AM_CFLAGS = -Wall -D_FILE_OFFSET_BITS=64
 sbin_PROGRAMS = fsck.f2fs
 noinst_HEADERS = common.h dict.h dqblk_v2.h f2fs.h fsck.h node.h quotaio.h \
-		quotaio_tree.h quotaio_v2.h xattr.h compress.h inject.h
+		quotaio_tree.h quotaio_v2.h xattr.h compress.h inject.h iextent.h
 include_HEADERS = $(top_srcdir)/include/quota.h
 fsck_f2fs_SOURCES = main.c fsck.c dump.c mount.c defrag.c resize.c \
 		node.c segment.c dir.c sload.c xattr.c compress.c \
 		dict.c mkquota.c quotaio.c quotaio_tree.c quotaio_v2.c \
-		inject.c
+		inject.c iextent.c
 fsck_f2fs_LDADD = ${libselinux_LIBS} ${libuuid_LIBS} \
 	${liblzo2_LIBS} ${liblz4_LIBS} ${libwinpthread_LIBS} \
 	$(top_builddir)/lib/libf2fs.la
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
