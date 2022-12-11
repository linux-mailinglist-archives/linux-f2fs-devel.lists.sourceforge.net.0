Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1DB64945F
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 11 Dec 2022 14:09:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p4M4l-0005Vi-RI;
	Sun, 11 Dec 2022 13:09:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ssawgyw@gmail.com>) id 1p4M4k-0005Vc-Hj
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 11 Dec 2022 13:09:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Kv8kcpsRmLiddotvQaawoolO0sTJlYruTgtBrstc49M=; b=f2McuS0KYw6Hqzz2hJl+IgOjDB
 YklOr04fyPo9p7lIpXcDAm9r7sNvUOZ4zUnwn4kt4wPTj5CdCafhFDyR+PsC8++gkL0s1MS6BvMrR
 WlUInqaW9NN5K++2ReUkBJwN4uYJhZYz6nuht/7y15EgVUkxWLDIUG6Th92IidGwTHlo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Kv8kcpsRmLiddotvQaawoolO0sTJlYruTgtBrstc49M=; b=F
 noq2nTB5PH68SHWQXIwNsV1aw2FLHsE1hs/HyC4kghhmwb/9zZXPa66EFGSc1x0fzr+yJP9UBGMs8
 kLyYl+LanjYtBs1qXgojLZrLmX3k5kiJ+zjd74qbwafdTPW6wrJREa1xtqjzMPDHtBYPAH86/FLvk
 +N0+cp6sWwSREtgU=;
Received: from mail-pj1-f53.google.com ([209.85.216.53])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1p4M4f-00DqDa-By for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 11 Dec 2022 13:09:02 +0000
Received: by mail-pj1-f53.google.com with SMTP id
 b13-20020a17090a5a0d00b0021906102d05so9505365pjd.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 11 Dec 2022 05:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Kv8kcpsRmLiddotvQaawoolO0sTJlYruTgtBrstc49M=;
 b=QGDmQTi7v4M3a7gz51ftuLvf7RjAIYaG1giqRYlNplDgqd5Ht3ui0pI27p4XSkFXp3
 3pV2jiGAU2pty/bxepurgOg6+ZMj72xVu1X/uDW8Jz66aT4XPKcw9i2X/89+BZA4f9aT
 BW/e6Rz4S8rZtSucGl0zqLXdr1AO2HbdegbXbcTY7DHh6zDbH43KJgNG92rSbyATAhf0
 lz+X6vz/xoXvvCzd3E0uMr6UXTWuazmj1qsodwYnvggQ1ba4IrGAQBD5IhHXUFJN3VCu
 vbg9oRtD8yh9Ngc7ba1EAEUEepfC4UWnz5YxN/OJx8OIs2SmEaXl0Q33mjYQJLvqfguo
 sYvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Kv8kcpsRmLiddotvQaawoolO0sTJlYruTgtBrstc49M=;
 b=6b7meoAr31QnenbauYX2iH6UGcyEqmvZmyRDb21hZQ3pdEDZeaiJ3+TwfMofn9wHAF
 6nNSYaMTJKoPxh3qesuh4OhX2T65MSh25JTApk3x5HdTy9MtCmn6rxA+/s8Tj4fEQsDJ
 /09iqYqA9u+v1AIlS6sVbTYvq7MpVaJL1UAQ2M4xtVO+MbyX+o0rxhwD51x2qZhFhguL
 o95F06sb9Vfbuhn1FxxbtJnKoM/2dD1GLr0VeFpxxIChmsAP5plYHTGRMIk1PwGCWNzy
 WrFY4EpwQZ7KK3fzdd31OrumSu/sTc+LHyYrxmU4K5EShKSJfkCMQvGmxEifc11DkboO
 Ushw==
X-Gm-Message-State: ANoB5pkBa+Y6uZPcYpu6jJboM5Tg0vGJTRm9IK3lcWUEQoRSPF839ePJ
 zsr0xKXDUWOaleME76o6E+k=
X-Google-Smtp-Source: AA0mqf5dEJCsGXsJcaoyYUPof4dNDixAgjIjDfw5onXGgeaF5n9lTtSPKNVvNY0kQNjFbQWHWlScEw==
X-Received: by 2002:a17:902:c18b:b0:189:8e01:c72a with SMTP id
 d11-20020a170902c18b00b001898e01c72amr13026193pld.17.1670764131738; 
 Sun, 11 Dec 2022 05:08:51 -0800 (PST)
Received: from VirtualBox.. ([129.227.152.6]) by smtp.gmail.com with ESMTPSA id
 b13-20020a170902650d00b00186b549cdc2sm4315412plk.157.2022.12.11.05.08.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Dec 2022 05:08:51 -0800 (PST)
From: Yuwei Guan <ssawgyw@gmail.com>
X-Google-Original-From: Yuwei Guan <Yuwei.Guan@zeekrlife.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Sun, 11 Dec 2022 21:08:41 +0800
Message-Id: <20221211130841.113959-1-Yuwei.Guan@zeekrlife.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In non-foreground gc mode, if no victim is selected, the gc
 process will wait for no_gc_sleep_time before waking up again. In this
 subsequent
 time, even though a victim will be selected, the gc proces [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [ssawgyw[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.53 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.53 listed in wl.mailspike.net]
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1p4M4f-00DqDa-By
Subject: [f2fs-dev] [PATCH v2] f2fs: reset wait_ms to default if any of the
 victims have been selected
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

In non-foreground gc mode, if no victim is selected, the gc process
will wait for no_gc_sleep_time before waking up again. In this
subsequent time, even though a victim will be selected, the gc process
still waits for no_gc_sleep_time before waking up. The configuration
of wait_ms is not reasonable.

After any of the victims have been selected, we need to reset wait_ms to
default sleep time from no_gc_sleep_time.

Signed-off-by: Yuwei Guan <Yuwei.Guan@zeekrlife.com>
---
 fs/f2fs/gc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index f0c6506d8975..d7a9d84ba57c 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -141,6 +141,10 @@ static int gc_thread_func(void *data)
 			/* don't bother wait_ms by foreground gc */
 			if (!foreground)
 				wait_ms = gc_th->no_gc_sleep_time;
+		} else {
+			/* reset wait_ms to default sleep time */
+			if (wait_ms == gc_th->no_gc_sleep_time)
+				wait_ms = gc_th->min_sleep_time;
 		}
 
 		if (foreground)
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
