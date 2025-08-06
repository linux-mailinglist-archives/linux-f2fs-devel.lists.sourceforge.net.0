Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B9AB1C4C5
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  6 Aug 2025 13:22:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ECkaWK9onMGXo/zdMALNGGZiS+UmAVMDnlJq493Zg90=; b=mFFpWRhX0+At2RxmUg9vE+dgfu
	i6ewu+Z9/hhyLTAJ9f6kxewhlUHqfwA//W2uPc7BHMQErI1nDk3NSc+wyYtzNu80NIWuXlRD7Pj+w
	yvdlubl/I0nk9YdUiIx+69iuLRzCl18Kk3ujE+j4XtbadHFewF8VyVOPqToYui86Dr9E=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ujcDR-0003rZ-Bn;
	Wed, 06 Aug 2025 11:21:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <masonzhang.linuxer@gmail.com>) id 1ujcDQ-0003rS-B4
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 06 Aug 2025 11:21:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=udQy1oQJOraZZeifLInZy3dbifbY55aMQYh60VZ4m7c=; b=KL+iYp49pC8qFXxeCjwVBxsfim
 bPDPB/Cw6/o5+h9OgyfSqUfwpjlz0+wPwCqKyLLae+NRKrBVcY8oEeBlaNoWCnJHojTsDXMm+yvGn
 cCN0O5Zx0+ZyJXdxXoxPGbF0QyNyPlDZM9uUeyn/44PFLaL+WxfxI/X3lxPfKKCZw7Bg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=udQy1oQJOraZZeifLInZy3dbifbY55aMQYh60VZ4m7c=; b=X
 0gMzprWiNSYn4MSTof+m9oXFss+n+8ieURBMqBoYawKRCaXunC8prE7TG9kXfe+gwWJfizAEO9nDT
 VutHYbVxXua6+6xL+4VD/1OypeBuaYDn5fzePWZtZlm/I/QheoPugLMB3g0wE8XKwfdYr1joe2fur
 1YO9bob4FSXXRKx0=;
Received: from mail-pf1-f178.google.com ([209.85.210.178])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ujcDQ-0007nX-0q for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 06 Aug 2025 11:21:52 +0000
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-76bf3dafaa5so800928b3a.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 06 Aug 2025 04:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754479301; x=1755084101; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=udQy1oQJOraZZeifLInZy3dbifbY55aMQYh60VZ4m7c=;
 b=DR9jPvSogHLvuMAJchSoDMiFA2+FuVfcjFpaNIoaGWTQ6k08pw4+Mo7QW3PJAPIsOH
 PQdctPYJlOEDzblg8tdRGXiBcXfGLiDlMvumk29ll2A8mO1J36KmkqjNS40ya5b6a8Bg
 28aZLqZi0X+V6EK+zfoSchXJ2om1EAvgo+g+P8DxFpKuopCaGLE7oQnAy8quellhR+5U
 kyRicnkcJ/CTry7GGKVs6TNQ+qpHz2Y3GTdRSIp7TmPo+avnh+8knh/cpdemWQNxSMk0
 j7tch2he0mgjPNkZc4Vm8xbsGK8s9c66Dx7VnBI2yPFLfmZehr9w/S8apHsKL5jzHtDQ
 a3XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754479301; x=1755084101;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=udQy1oQJOraZZeifLInZy3dbifbY55aMQYh60VZ4m7c=;
 b=plDjRv3Po4z5whAiVusnih7N+gTKoG4UaEVd0rmgMIUxnF3BG/a/fE9PbGdGictPp7
 YZLQ5JETYkMWpRC2CUsd68u+h+GzzltxIczFRulnXi/WMm6d4RFsTnlz0W+5UgVBKmQa
 vrRQTNpjsh3FEUgna4ZSnlLIXK1OPsZbp62dB4lbiaSf/82Lg2kQ9OA3olJuR6FEzPEZ
 /JEd34+wmpcikVnVZ+enO+IGqg6OwP36TXfCRp7KFl7mmxdQyuj3D2k4xFy8VGEqXfvU
 1eGUAQnyOaL7B7oA+C2xcLOnsMNyfm2mJX31N8PX5qZs3MhyAA2qTusvL3iSFJfDQVsi
 X+Aw==
X-Gm-Message-State: AOJu0YwPUTB6YEFChn3Q+X1IsnP1/EhhXAZClnPWanIwkXUv8iJ/1rQL
 EG+rMKPqwk9M4Pxzk7xcl7d48wP8GgYfjITcToSMkMS9Ok4CGAlYy7L4
X-Gm-Gg: ASbGnctVip8J6PsbmVB7Fiy1xSV3hekexpbeJ7UiRSpr/yXn2N3k24vS2JN6ubPySTu
 noCW8BoI27Atd2W3QHBHD8ZsN4b7/2gJpaYIb3b/yjIWt9TYtgDMglfHQqDSF5ttU3bSk2z6gkS
 7IAmkcaEFlCGGi0lZ3lZyzxY7eZHcWgFQk2lQnL+DwRknIgT8ARvvVxGRjbZISnzSV6qmRFAEWU
 BcHQXZQhWFNdi2eJEWuxI9ym4P/7BEGnEuEPv1XFuw55mXjqebKF6LCb7lg6XhjFlc9u/6EHqXE
 e8S+9/be7/LpGE9V3iPvVglzoJ754lJWK5GudpjqdnfiH8clKUL6bSeh8x83xsWHbGej/eHZdC3
 EHC0+E5Gm/STU5H2V1t/sN1Y5oRqt3QQ=
X-Google-Smtp-Source: AGHT+IE6wptvdZC0VAFviQVg0AlXF6OF4wkxkGE0X9aYVMpt/MOrq4TxNhEwP+PNJouNBYedsb/uZg==
X-Received: by 2002:a17:903:4b50:b0:240:1ed3:fc28 with SMTP id
 d9443c01a7336-2429f957616mr35022425ad.12.1754479301212; 
 Wed, 06 Aug 2025 04:21:41 -0700 (PDT)
Received: from localhost ([61.152.208.176])
 by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-241d1f13a31sm155040335ad.64.2025.08.06.04.21.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Aug 2025 04:21:40 -0700 (PDT)
From: "mason.zhang" <masonzhang.linuxer@gmail.com>
To: chao@kernel.org
Date: Wed,  6 Aug 2025 19:21:35 +0800
Message-ID: <20250806112135.3434-1-masonzhang.linuxer@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This fix combines the space check for data_blocks and
 dent_blocks
 when verifying HOT_DATA segment capacity, preventing potential insufficient
 space issues during checkpoint. 'Fixes: bf34c93 ("f2fs: check curseg space
 before foreground GC")' Signed-off-by: mason.zhang --- fs/f2fs/segment.h
 | 2 +- 1 file changed, 1 insertion(+), 1 deletion(-) 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [masonzhang.linuxer(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.178 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1ujcDQ-0007nX-0q
Subject: [f2fs-dev] [PATCH v2] f2fs: fix CURSEG_HOT_DATA left space check
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

'Fixes: bf34c93 ("f2fs: check curseg space before foreground GC")'
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
