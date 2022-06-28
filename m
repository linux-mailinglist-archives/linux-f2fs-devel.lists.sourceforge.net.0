Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B5B55BDE5
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 28 Jun 2022 05:45:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o62AR-0001TB-F9; Tue, 28 Jun 2022 03:45:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <duguoweisz@gmail.com>) id 1o62AQ-0001T5-3N
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 28 Jun 2022 03:45:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qFS37TBrSuv4gm4FPYmVxuLo1hjFrZ0Wm5eeFGteyXw=; b=WUDyrz4SGdZQ6w74FRXPzc2THp
 7fBZmkwfm6RqLyMM0Hcwbt+bHqLmurIZE5GwktG3vAsTSN6zTioSM6vNTl8FSSH1VFaFM7LCu46gy
 pWsXkZr9eHwDjnVhxsjg8UuY0DboaNbMzAckGLA4FCE/t8V+OkDGqxtVTYkmqg1VAXWQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=qFS37TBrSuv4gm4FPYmVxuLo1hjFrZ0Wm5eeFGteyXw=; b=A
 uDC9buAMYJi7hRnTu3wZgDK3m3ITpNDdLymaRZX0l6+tML4UmbA6BaMns/4jd1zbIT5URsn0k11SM
 m1lnfq7Ttr8mVlCuaT2K4z0BDgSaY0jGFAsuLs654WWBl9YDt1o+Ms+wlOIBoDo7445jZG7KDGWqw
 JPP8evtKprT96h9k=;
Received: from mail-pj1-f46.google.com ([209.85.216.46])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1o62AQ-00GOUJ-6t
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 28 Jun 2022 03:45:34 +0000
Received: by mail-pj1-f46.google.com with SMTP id w24so11288039pjg.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 27 Jun 2022 20:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qFS37TBrSuv4gm4FPYmVxuLo1hjFrZ0Wm5eeFGteyXw=;
 b=JC9nSS5Tq4Gicto+oCAVO9AjdLFnqt1m2EMjxTe1JGxXt9oVMisCLdp+EGQ/OoV8NB
 VXvt80Rv800N3gLg3gx48oy9LVspCARgrr3Riq6Duet+rwlCy2VHOvkXqSoiX4RAhYcc
 KWOV+ZaorEDDbu04MRfLr2VPoE+GBySLxn+g9PkSukcgC5EZYJ4B3FesRyMD3ch1ZlmM
 JcmiLolycDnAvm6ZNat2erb9XJ4HZ4pq6mClfm+MF8AcarcCz9IWYPOzMStCCrigwpCc
 voyqqb9CAbD8tajMZAG4ubIX1tJ4Clbly99S88tS0tHTxYk5brSPAg7uGYXakau++w7c
 z8Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qFS37TBrSuv4gm4FPYmVxuLo1hjFrZ0Wm5eeFGteyXw=;
 b=elJqumkEezu3/ANgMPk/rARMfpE887GZjqk9+rcNcMfjO90NShsEuk+N9zvaeE3aXH
 VUCxtgYIPmBYxym99XWrCQtPURaUrYE4RGK26QftSC+Rs37ay6+dqIZ5b69zZlwufAOY
 ip4PJhByYVFCWxiBXIsSCCI63kwErYdprcPp/TCHm77RxXgr4/KoTmYME3+c4Kce316S
 WPkrzaODCJd5GAlZwiyG1s0PT67tGNkGhMmnW6PS3jsOLSKc6l6GzexWeeMfUnO5nFQ9
 +XfMK/HqymZPLXCkKus6YOm8uL1ocwlmwDQiGqd3XOyrr1UeSt6golJScGOGhDruAG00
 fP+A==
X-Gm-Message-State: AJIora+OVgW+a3aoy9A+g4fbquytHg6ES5kB69/WJOK5ZdN3sBf/GYQR
 s8UF/aRvQxeNQ3Sxdt/NF+/phOglvTBCGyC9
X-Google-Smtp-Source: AGRyM1sO8dYuMdlGVja1BTXMaxZHbyElAyhc2WdhqkpoHmjePg9xedPrldC2JDeHOqzgnBAL98FP+g==
X-Received: by 2002:a17:902:f652:b0:156:701b:9a2a with SMTP id
 m18-20020a170902f65200b00156701b9a2amr2831998plg.14.1656387928697; 
 Mon, 27 Jun 2022 20:45:28 -0700 (PDT)
Received: from mi-HP-ProDesk-680-G4-MT.mioffice.cn ([43.224.245.232])
 by smtp.gmail.com with ESMTPSA id
 bl21-20020a056a00281500b005251c6fbd0csm8068208pfb.29.2022.06.27.20.45.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 20:45:28 -0700 (PDT)
From: Guowei Du <duguoweisz@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 28 Jun 2022 11:45:17 +0800
Message-Id: <20220628034517.24861-1-duguoweisz@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: duguowei If device enables swap file, enlarging the
 memory usage for each monitored item. It can be adjusted by ram_thresh sysfs
 node. Signed-off-by: duguowei --- fs/f2fs/node.c | 5 ++++- 1 file changed,
 4 insertions(+), 1 deletion(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.46 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [duguoweisz[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.46 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1o62AQ-00GOUJ-6t
Subject: [f2fs-dev] [PATCH 4/4] f2fs: add swap space for memory using
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
Cc: linux-kernel@vger.kernel.org, duguowei <duguowei@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: duguowei <duguowei@xiaomi.com>

If device enables swap file, enlarging the memory usage for each
monitored item. It can be adjusted by ram_thresh sysfs node.

Signed-off-by: duguowei <duguowei@xiaomi.com>
---
 fs/f2fs/node.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 836c79a20afc..f1cf3d2bc7c2 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -54,9 +54,12 @@ bool f2fs_available_free_memory(struct f2fs_sb_info *sbi, int type)
 		return true;
 
 	si_meminfo(&val);
+	si_swapinfo(&val);
 
 	/* only uses low memory */
 	avail_ram = val.totalram - val.totalhigh;
+	/* if there is swap space, use it too.*/
+	avail_ram += val.totalswap;
 
 	/*
 	 * give 25%, 25%, 50%, 50%, 50% memory for each components respectively
@@ -96,7 +99,7 @@ bool f2fs_available_free_memory(struct f2fs_sb_info *sbi, int type)
 		res = mem_size < (avail_ram * nm_i->ram_thresh / 100);
 	} else if (type == COMPRESS_PAGE) {
 #ifdef CONFIG_F2FS_FS_COMPRESSION
-		unsigned long free_ram = val.freeram;
+		unsigned long free_ram = val.freeram + val.freeswap;
 
 		/*
 		 * free memory is lower than watermark or cached page count
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
