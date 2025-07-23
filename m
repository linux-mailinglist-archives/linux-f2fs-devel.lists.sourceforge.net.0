Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E2FB0F649
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 23 Jul 2025 16:59:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T5Oou2b+ILyFTX3CvcyZJYfmHgsMIrbOrXlKD1/fy+I=; b=XMn7ES1mNfDmsGYUviNoc7EKjA
	z+gXaOH3hPyVU17DA7pWjDA4jcx21LYuO0+A1Xt09jFoccMTLcKgEpwOXkkid0r+F65L2MLCBtvEG
	YXTv6dfMcqYG8IGI10e6Gvp0V2TI9SYORbaJnTXjIvyBmrDVnBl4ePS9rde2Pkx38zes=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ueavn-00062L-Fe;
	Wed, 23 Jul 2025 14:58:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <masonzhang.linuxer@gmail.com>) id 1ueavm-00062D-Ge
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 23 Jul 2025 14:58:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/27YwIdqSPt9Qb6PywKqMjxiHr6G2jrbmK4p6axtTxg=; b=MrsNP28QIQvVSUzMArXVuW0otL
 eZODIwiPT7tTLjUGkwqcOallXjALz9vn8Q9niRB0Z9ekE0rezScgO9JDRGaB026mnKrUigmGT/wrX
 vo1uOPtxgx+wAuQdBkrwoLIjeveFTh8pVtac5TCrrOLGHur8O86oejoKUOB10Cy6XUxU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=/27YwIdqSPt9Qb6PywKqMjxiHr6G2jrbmK4p6axtTxg=; b=m
 1wPn7PDpGOQqwc1WedHJTXqAMlEB1NQInxryRFhE/o/Pu47iIIptbRL+DXg4jG8D0q3t4+MfBSIwl
 I7i+3ER5cYyWpj4Aac1m3Aly9lbScqM+1T4iO1Kub/7gEylN8a9AKnYqqpSVZFasZK2nxkkxwAdv6
 bBhq8GHGlZSpR8BE=;
Received: from mail-pf1-f173.google.com ([209.85.210.173])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ueavm-0002Kg-7D for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 23 Jul 2025 14:58:54 +0000
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-74264d1832eso66730b3a.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 23 Jul 2025 07:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753282723; x=1753887523; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/27YwIdqSPt9Qb6PywKqMjxiHr6G2jrbmK4p6axtTxg=;
 b=UPe+WcvxCu4iKJh6QlL4afpO2fPD5W0MX0C6dBXLzhzErVdBsfcr+3Dy/+C6/3+Jeh
 30iHBS5SVb/Kbdp5dRddV3u1rd370+iVtDMlPRdzL2ANSUUfkFNjc8LI88SdOeumsppU
 iq20IRiFtH+3mRrGFfQH6XkSUAsOVB2R1GSXG8qRzO6BPZxmMCC6c1oYbuJAsmPzNSoZ
 2168elh/SQIZXWOszeLdlxiJRcLOLhHYcqIxSFZvalGZF/D4RbjF/pg8YpysPCStfWIz
 tQ2Vut5mP/JBrxlWyRtlgIC5t5xnJ8HmfdBwh0AVkaoLDIwKnU1lS9SQpTxBLrXdaJU+
 kJ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753282723; x=1753887523;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/27YwIdqSPt9Qb6PywKqMjxiHr6G2jrbmK4p6axtTxg=;
 b=LLcYfjDFI/67oigT9zEacVPggUhy8M+kBB3jaOHKTw685K2aeTtp3xHUIYZkb8Fh5J
 F0CWBWCcpzsNXImcmLkgcl2lBoaE5j9QWAgneUKYGTgh4uqs9yRXcI9TSolvme5HXjtf
 I4huZgqnpw+G1EatAzHAp4UJcVFqSrMGtpmUGyYbz1gPDuPn8DaDRA5a398Wb1AbfCBj
 9wMWHNMZIajkdE5YF3Uuct0kjzd1hSDlilKJpoVlO6Hpuizwh7BigGGuq3HE9vm1ZplU
 5SrKxJf3nkW6QjW8pBCz/+HsfSrp8up3PmpwAYbbnUA80NfetL2cfgZWStVwY+w1xWVe
 eFPQ==
X-Gm-Message-State: AOJu0Yxf9UJJNmY8nWLBXE+H8Mc8NLo9K72DEj1tTkMcampMfdUFco3c
 xr3D9EnT465u9FSyVl1T8wTWmw8IL75SXVx4zdIqkrd0Pf0OJNsrkSQE
X-Gm-Gg: ASbGncsp3P8a7w+Vt/Sf33Y+tDHjBJJq4Eb3ldBcXk7kj5iJEcdQyipwo7Cblk5NHaj
 Qkvm5Fl2wwL9cLqs6Pl3pYgvwNB8PHeJRMy0Ell/C8OW36hwBwlakzI1e55jbM2Ds1qYomnvnHj
 oAgAUIOpjlMJWYdFxpJTFhGmzHgRORirj89xCfnl5JMJMPpeos3qPNdglhSxDfTmgdrxTDl9j89
 hya9DZa/2CIUFOc+/3c/sKgYSeqH3kvZGtk0Uk5EWH1Fqgo30X42NtpwJP10m8EEmnpA6qQc4Zx
 Z5AYQOV/wd9406hymVAy4++0xr5iW8J+/XR7L00kWtbIrv/sjmqZMBODZfbJ3SpXXbD0U6Jplzy
 XM/1wE54f5mCWAPwCcOGlGH90nJBHJ5i40/NsKM8378Ot4ILaVAz8
X-Google-Smtp-Source: AGHT+IEkfb/SYBi3q2XRVyGH3z+jt9CTWm3ql3e+4v/7AAgYckTussYE8f23iAqgOygr3QtsNYqTTw==
X-Received: by 2002:a05:6a00:180d:b0:754:7376:548f with SMTP id
 d2e1a72fcca58-76035bf6feamr5239852b3a.23.1753282723479; 
 Wed, 23 Jul 2025 07:58:43 -0700 (PDT)
Received: from localhost ([61.152.208.177])
 by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-759c89d55c8sm9962989b3a.62.2025.07.23.07.58.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jul 2025 07:58:43 -0700 (PDT)
From: "mason.zhang" <masonzhang.linuxer@gmail.com>
To: chao@kernel.org
Date: Wed, 23 Jul 2025 22:58:37 +0800
Message-ID: <20250723145837.187089-1-masonzhang.linuxer@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: No functional changes. Signed-off-by: mason.zhang ---
 fs/f2fs/gc.c | 7 +------ 1 file changed, 1 insertion(+),
 6 deletions(-) diff --git a/fs/f2fs/gc.c
 b/fs/f2fs/gc.c index 3cb5242f4ddf..2df02e36fd5f 100644 --- a/fs/f2fs/gc.c
 +++ b/fs/f2fs/gc.c @@ -278,12 +278,7 @@ static void select_policy(struct
 f2fs_sb_info *sbi, int gc_t [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [masonzhang.linuxer(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.173 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1ueavm-0002Kg-7D
Subject: [f2fs-dev] [PATCH] f2fs: merge the two conditions to avoid code
 duplication
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

No functional changes.

Signed-off-by: mason.zhang <masonzhang.linuxer@gmail.com>
---
 fs/f2fs/gc.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 3cb5242f4ddf..2df02e36fd5f 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -278,12 +278,7 @@ static void select_policy(struct f2fs_sb_info *sbi, int gc_type,
 {
 	struct dirty_seglist_info *dirty_i = DIRTY_I(sbi);
 
-	if (p->alloc_mode == SSR) {
-		p->gc_mode = GC_GREEDY;
-		p->dirty_bitmap = dirty_i->dirty_segmap[type];
-		p->max_search = dirty_i->nr_dirty[type];
-		p->ofs_unit = 1;
-	} else if (p->alloc_mode == AT_SSR) {
+	if (p->alloc_mode == SSR || p->alloc_mode == AT_SSR) {
 		p->gc_mode = GC_GREEDY;
 		p->dirty_bitmap = dirty_i->dirty_segmap[type];
 		p->max_search = dirty_i->nr_dirty[type];
-- 
2.50.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
