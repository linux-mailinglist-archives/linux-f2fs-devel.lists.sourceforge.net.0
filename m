Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2AE57D90C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Jul 2022 05:40:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oEjWJ-0007xc-9i; Fri, 22 Jul 2022 03:40:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <qxy65535@gmail.com>) id 1oEjWG-0007xV-T4
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 22 Jul 2022 03:40:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8yiAGQE/qJl8oC8JosxyZbmVIi6xV2flByC1cOQGIuU=; b=eKMhG4bLMG4/E1lycvOu5RanTt
 C3XpYV7fiJNHcPhNMqQnXyC+arlmAOJVfv46Zc5yuGnKi36V1psdPCzGGvVvs6NED9IULihS/qJqT
 oSnu7nt0T6AKS8E3MSvjEDW1/emDCQDBEC6Z2iFcAoUSWDf6N+IEBsqEgywshbR6sjIk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8yiAGQE/qJl8oC8JosxyZbmVIi6xV2flByC1cOQGIuU=; b=HEjCdIhq7qx4+XPBtZluz45naB
 sTRWc1ENed22iu5mEyNKkQvF61XWTdjx4RZX/LpCMLYTCkO6ffx7FdBaxq19ZTF1jzsrBY1Im96TF
 VLocerVfSM9IMd1PojJjik8rXelJXUKq99/exKf6NtxnBjotbi1bUNLlPg+PIbiwcvx8=;
Received: from mail-pj1-f49.google.com ([209.85.216.49])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1oEjWD-006UHt-9r
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 22 Jul 2022 03:40:05 +0000
Received: by mail-pj1-f49.google.com with SMTP id
 bk6-20020a17090b080600b001f2138a2a7bso5587837pjb.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 21 Jul 2022 20:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8yiAGQE/qJl8oC8JosxyZbmVIi6xV2flByC1cOQGIuU=;
 b=M/1VvF4Ovd3iUN9CD4ktumZWJBlRtuhjKyq7qK0unIRNyFWx3tDBXTXtae335GAtS8
 XwkhcrSYXnCF8yLLoPPT4JgaCfF5fvh6xMXo9lGikywR8Xm1kACabRtoBOYTVONilm4i
 F9BVEI+pO50C8U4ED/tLtWxWDDkt3qGLm2GzzRRXhZ31TiwuY9rg+OPCzgRYz86JhUFO
 w99TXH+xKUvAN8d5WqozvZrvsGIuX1+K0/8Wl8jCo9Y/H/e2VEHJ7afiwVSUGFTAVQOA
 OM/pnamG8KOGBkuIn2G/f7ajo7sMhc6woBc6kIin2EOYjOrWSl/F77ebceHxLGk4ylSZ
 XgWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8yiAGQE/qJl8oC8JosxyZbmVIi6xV2flByC1cOQGIuU=;
 b=6ErFimu0+BaATzDXHop8qpYGoAqeF8r0EcydhmfavEII7DAIsN28GNEvHcRvxBxkHI
 erTIS9KxojRzsMGH0qQ1S5bI22Jlg3L70Finyc4V9UQSOJQ5xAdV/N8CUGxBWOwePvI0
 IQfC/9N1fL3u/PK+Re6DCjKAZFVKFTa/eB0Kvwczt9B7WOXoVPOCtDQvIqJpl0BnW+3N
 V7xqyNlKezLyhEVWEt4WYn+OujvsFtf3gbMkO8YP4UyEb2+RRkBRTC3QVTzhGzj8eu95
 Y1iaTVxhGClcQC+TpnKw7KzNFf5euAGZJHem++4IyNYRqOA46p0Gc85hnIJWimn3wRl4
 d6Mw==
X-Gm-Message-State: AJIora8tHmAQxbkP3kLC1BPhyXaqMacf03+eVREx08U6mMHs8ZaztHWq
 1EL5mqgkv4TDZKhIEtWLTPw=
X-Google-Smtp-Source: AGRyM1sAz4kl6alB174O+R5oWH69AtL/ImQve7dAQ5sAXtF4urr2AU4MlHxt7rSxHSTLq78PnudYlw==
X-Received: by 2002:a17:902:8a94:b0:16d:400a:797 with SMTP id
 p20-20020a1709028a9400b0016d400a0797mr1171146plo.174.1658461195601; 
 Thu, 21 Jul 2022 20:39:55 -0700 (PDT)
Received: from mi-HP-ProDesk-680-G4-MT.mioffice.cn ([43.224.245.252])
 by smtp.gmail.com with ESMTPSA id
 h4-20020a170902f54400b0016be8da658fsm2508311plf.130.2022.07.21.20.39.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 21 Jul 2022 20:39:55 -0700 (PDT)
From: qixiaoyu1 <qxy65535@gmail.com>
X-Google-Original-From: qixiaoyu1 <qixiaoyu1@xiaomi.com>
To: jaegeuk@kernel.org
Date: Fri, 22 Jul 2022 11:39:10 +0800
Message-Id: <20220722033910.25442-1-qixiaoyu1@xiaomi.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <YtoOGu/wyqKBJd1v@google.com>
References: <YtoOGu/wyqKBJd1v@google.com>
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  f2fs_gc returns -EINVAL via f2fs_balance_fs when there is
 enough free secs after write checkpoint, but with gc_merge enabled, it will
 cause the sleep time of gc thread to be set to no_gc_sleep_time ev [...] 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [qxy65535[at]gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [qxy65535[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.49 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.49 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1oEjWD-006UHt-9r
Subject: [f2fs-dev] [PATCH v2] f2fs: don't bother wait_ms by foreground gc
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
Cc: qixiaoyu1@xiaomi.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

f2fs_gc returns -EINVAL via f2fs_balance_fs when there is enough free
secs after write checkpoint, but with gc_merge enabled, it will cause
the sleep time of gc thread to be set to no_gc_sleep_time even if there
are many dirty segments can be selected.

Signed-off-by: qixiaoyu1 <qixiaoyu1@xiaomi.com>
---
 fs/f2fs/gc.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index d5fb426e0747..e2f8a2dae908 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -150,8 +150,11 @@ static int gc_thread_func(void *data)
 		gc_control.nr_free_secs = foreground ? 1 : 0;
 
 		/* if return value is not zero, no victim was selected */
-		if (f2fs_gc(sbi, &gc_control))
-			wait_ms = gc_th->no_gc_sleep_time;
+		if (f2fs_gc(sbi, &gc_control)) {
+			/* don't bother wait_ms by foreground gc */
+			if (!foreground)
+				wait_ms = gc_th->no_gc_sleep_time;
+		}
 
 		if (foreground)
 			wake_up_all(&gc_th->fggc_wq);
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
