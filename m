Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AE652B1A839
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  4 Aug 2025 18:54:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=x6/937kiiFvM5Zgi8OnVZEear9dq1+jir0ebjdrIBxw=; b=NpXGhuRYZw8KPorSvj1iVJhLw9
	CJ3cu/uCz+1j4LUSyLiYLFUGHIxv8lkBEveUH/scVPwAN+IslqInscNiR1oH/OdkUXywZR77s9at7
	6bPcbavmepgVIlQVIcvk2XPo7cnNezQPHmpZ+BuOrtDD+aZg8GTD7Pcp+i3HktxW9DXc=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uiySH-0004QU-SM;
	Mon, 04 Aug 2025 16:54:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <masonzhang.linuxer@gmail.com>) id 1uiySG-0004QM-Fq
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Aug 2025 16:54:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ICfl/qoL04oE9UApJmf+6JtByCVhnGLy1JybjuiZ0gA=; b=eiBqSn4ZXrq9lVrRSsQqO9cuVX
 oHLSy2KmRs/P25FlcS1j3s+7VqPNdck+OaubAtJofur7dB1yMiklfQYu5hm8hpnIDZ4aBl4O/GCIW
 AiCv4RbixJfK54aepMKQ/ca/FFE/8MjoibUcLfEnZNzrHQ+oW8aPbeQVTbEIQMHz/84A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ICfl/qoL04oE9UApJmf+6JtByCVhnGLy1JybjuiZ0gA=; b=H
 lbnDIbg2me6BSF6cwJ0GuOnoRcBiWNaiBRW+kl73n0iM0QIO3bJy6S82PeptSIAefNc2iEtsthjeS
 N6pzXvGflql4qekdklrSP1vEwvM/WCqEMI9U43Xz5vT+mil3cbsSh05g2fnFz5VX/SdFPfTuSizEA
 /ctEfM/6LxFyt8Gs=;
Received: from mail-pl1-f178.google.com ([209.85.214.178])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uiySG-0002zo-6i for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Aug 2025 16:54:32 +0000
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-2402bbb4bf3so42662905ad.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 04 Aug 2025 09:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754326461; x=1754931261; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ICfl/qoL04oE9UApJmf+6JtByCVhnGLy1JybjuiZ0gA=;
 b=TYmxBchq4Lsutob0sVAf/v9DlM8j9xB9phpID+aUFczCR3gsKRHWs184v2M7oaUp4S
 LSttBH+9nS3nROx5mvztmwCEPH8mg5hfkmjeBoU3ijigBR2SeuxRfFplAjKsATu61cd6
 XY31ZQi4tMuA7yem2WBQLy/0netlBXM0biHXTGrB/ZzszIt4/GvnsJdMvVmbWEIOUeJE
 U+brLNFp2oB7H10u5mwr9dHEx6rHOYKTPN+UE3pFB8tf1aylYCw/D3Z8m9ycrcIuk+m3
 4K3VmfitbijF7LnbyA5cM0fvn1F+5RVfDC9nbJiAdF91NGk6H45XLuiHr9os9LWuRpWO
 U//g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754326461; x=1754931261;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ICfl/qoL04oE9UApJmf+6JtByCVhnGLy1JybjuiZ0gA=;
 b=mX8hDEi2UkSCICXnyJRcidaIf8USut5f3Kgls10G3zggE4toYkz90l3L3PBoYWNWDh
 XgpQNgHMGL5Gnd05tDoMMd3DR0XdwW6f2qtRDFdfdh3NfZwOppsXIYKK7CEh9vHyMjcL
 EjKJw+q1DN09K/OnnkGmQl7QQlWWlUGkIlaEtGBUfMmAX05H+os8V5LupXDXwJAPnmMk
 DB8MzAGNqF7uhiJvFz7LrrDaBa8vjM1RArzcwheY1fdHAASS8dVqG4o2+NNwoVfF0/4c
 +XNzcYfLLR3LPvteEzMIUOEtiBD7URuQpYgefgHLzgrELdy2R7wyoPu2IDNKc8F03/mz
 fq6A==
X-Gm-Message-State: AOJu0YykkUWt+ECyDjV4FD+SpkEQBLrrzp4wOVhnVTDEUhPpsKf6FR6C
 TKOeuLtTbLKrZ5iT67ua1nQrGrgdYOSywYnxBpemaAiUabwzh/gcxasD
X-Gm-Gg: ASbGncssfJt7em3CxK9U6tWVzW/kO1CL/dyGdDdaYf9UH6L3QOxCqS2slQzNgd0vQTP
 G1tHJM3gYLa/W4dQ7k+v4AOL14i+P13TwG8t6FSFHLDOds2zKgTSTawxoeRN57+yYrcC+irwy2G
 COSFf29J/ZPUsmFW7CzDDrzBLoZTjVZEUBciCPRBSu1xpjiWXSnIOpg0Y0rfTzTOPeVLa/579gS
 TJMgRaOb/FBha37a+z9Ij3JxDoMd3AzHdLlKPbgS6OUIdEzzcC3NTls/E6AFa68J/97yf0he8+V
 qBcD+PzasRaWTaAGvXk/N2KxUw149zJq5oC+sN5juqoMZJk5Kpm7DOBMj9wzylC3jmhKWdp0AKY
 mW8YUVK4o7zZTfAnVAEWnZs6je3johg==
X-Google-Smtp-Source: AGHT+IG0ibKqUSHM/8m3tlwLSbk0uFSxqJT9mds9uYVNFnRLIrRFD08YM9xM0Jup3KB0aP88r7ED/Q==
X-Received: by 2002:a17:902:ce8c:b0:240:aa0:1584 with SMTP id
 d9443c01a7336-242470302ebmr155898125ad.38.1754326461470; 
 Mon, 04 Aug 2025 09:54:21 -0700 (PDT)
Received: from localhost ([61.152.197.68]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-241d1ef66dfsm113523415ad.29.2025.08.04.09.54.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Aug 2025 09:54:21 -0700 (PDT)
From: "mason.zhang" <masonzhang.linuxer@gmail.com>
To: chao@kernel.org
Date: Tue,  5 Aug 2025 00:54:11 +0800
Message-ID: <20250804165411.3441-1-masonzhang.linuxer@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This fix combines the space check for data_blocks and
 dent_blocks
 when verifying HOT_DATA segment capacity, preventing potential insufficient
 space issues during checkpoint. Signed-off-by: mason.zhang ---
 fs/f2fs/segment.h
 | 2 +- 1 file changed, 1 insertion(+), 1 deletion(-) 
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
 [209.85.214.178 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uiySG-0002zo-6i
Subject: [f2fs-dev] [PATCH] f2fs: fix CURSEG_HOT_DATA left space check
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

This fix combines the space check for data_blocks and dent_blocks when
verifying HOT_DATA segment capacity, preventing potential insufficient
space issues during checkpoint.

Signed-off-by: mason.zhang <masonzhang.linuxer@gmail.com>
---
 fs/f2fs/segment.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index db619fd2f51a..d8dae0049b6a 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -649,7 +649,7 @@ static inline bool has_curseg_enough_space(struct f2fs_sb_info *sbi,
 				get_ckpt_valid_blocks(sbi, segno, true);
 	}
 
-	if (dent_blocks > left_blocks)
+	if (dent_blocks + data_blocks > left_blocks)
 		return false;
 	return true;
 }
-- 
2.48.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
