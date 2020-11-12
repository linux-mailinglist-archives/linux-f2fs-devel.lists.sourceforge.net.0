Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B282B01D8
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Nov 2020 10:15:50 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kd8hg-0007L2-Hy; Thu, 12 Nov 2020 09:15:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <hyeongseok@gmail.com>) id 1kd8he-0007Ko-TJ
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 Nov 2020 09:15:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XgmYy2oo4yKBBbCgZapoTN1Dk2safVBvCvsBcacBH84=; b=JMyPa0X6qyD571tyPzuXEpJDhR
 CBz//DX/J10AULzvDrFI4DoeE6a1GMxxS3gvZrVy9kWYnxvqveHmMv9AFlfdO7U1TNYnlr9Cyb21q
 Tz015t19Ii1bHJ7TmQyGtMOePm6rxKg1lPtU5SW5ZYGaESAPBCQhrlSy5Io28PAzjebk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=XgmYy2oo4yKBBbCgZapoTN1Dk2safVBvCvsBcacBH84=; b=M
 1deU8JWVCBQ2HWqu5yyLliedIkpp9n0rmMBmus/nTFg7zguZGz37it9LnkmTGWDuCNWBRRwQuZrxz
 n1JeYO0CIbJCaHiU2ouylQeomqnt/r3XjczWcbCdtHq2SgMmpbdY53domTbLY4yk9uCmfiPs2ZuLC
 NNFmHNH25IFZmn3w=;
Received: from mail-pg1-f194.google.com ([209.85.215.194])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kd8hX-008uQE-7w
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 Nov 2020 09:15:38 +0000
Received: by mail-pg1-f194.google.com with SMTP id h6so3664852pgk.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 12 Nov 2020 01:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XgmYy2oo4yKBBbCgZapoTN1Dk2safVBvCvsBcacBH84=;
 b=nOHltpbuC1nXtvVXy/kE63t7xaR73y8DD+/umP4rn+YqoshfbjOPLRh2mfDXiQp8n1
 tpINs1tuWXdoao8PKk88VSkWeTSFPIyTPHEnJj4KV0NYZEpuHZICiKsv9on4GwvQ99CN
 bQF3/SO1rL+1MXjjonLXSNr/fU6pdfrWIYjcgImLjWkvyMIXM930cvgUaqAGlIGzUjQI
 yxhdwebbODkd69u1PZ7/OySD1P/c6/QBRqaYzblvIt1FJwTPYdpI6ARQDAYNRdhJVF2Q
 XByhuB5lvih7TWLCVDOSNwEb1VMYSYnj4EiWFukBCan/SaHYEUnCJLPSI6iLmy1uh6+y
 pGww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XgmYy2oo4yKBBbCgZapoTN1Dk2safVBvCvsBcacBH84=;
 b=Ej5J64JM6MF4AD1US5/QBRtlfNtD80TpVsVrzstCak4N+YNh/FE3IKkcp1OpoCl3fz
 TlZYvgIHLpKvgJOX8b4bVCoxztEofdcvl1M2+hpim8dZpf3x4bwAYYR3Bln3s5YHnCco
 WIW08ucbszuy2Y/cUilOk0aS+susQH1of1Jr1lHUHK1eZdOw18UXuje+cK4OonVg+47b
 +xJdS+6dOtf1NFwakCGtbwv4h8lbSUAS9Pv4aK/D5ffpfIcm8LzRuvEhJXNwS5hlwivh
 qEvJVWMvV1dDQfZVRSp0Mho47y3Mcfag0HEApTYg32g4aLdmU98YvSmlkRgRKUvOBpu1
 FzXg==
X-Gm-Message-State: AOAM5320k1jJyLLB2sp+NsevEjNy2SFxk/gc1BfvExYZqsotYSUCml20
 dJ/zIQqCgkai0mycjIpJYOU=
X-Google-Smtp-Source: ABdhPJzhtkhhaTTCEKurgpkKcIW4YvAekQe9Uoe4fC4twzYsrMKS/mBSUexuxFvtjpTrLNhJtLhitQ==
X-Received: by 2002:a17:90a:ea16:: with SMTP id
 w22mr8469271pjy.64.1605172518561; 
 Thu, 12 Nov 2020 01:15:18 -0800 (PST)
Received: from localhost.localdomain ([27.122.242.75])
 by smtp.gmail.com with ESMTPSA id y3sm4852816pgq.40.2020.11.12.01.15.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 12 Nov 2020 01:15:18 -0800 (PST)
From: Hyeongseok Kim <hyeongseok@gmail.com>
To: yuchao0@huawei.com,
	jaegeuk@kernel.org
Date: Thu, 12 Nov 2020 18:14:54 +0900
Message-Id: <20201112091454.15311-1-hyeongseok@gmail.com>
X-Mailer: git-send-email 2.27.0.83.g0313f36
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (hyeongseok[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.194 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.194 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kd8hX-008uQE-7w
Subject: [f2fs-dev] [PATCH v2] f2fs: fix double free of unicode map
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
Cc: linux-fsdevel@vger.kernel.org, Hyeongseok Kim <hyeongseok@gmail.com>,
 hyeongseok.kim@lge.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

In case of retrying fill_super with skip_recovery,
s_encoding for casefold would not be loaded again even though it's
already been freed because it's not NULL.
Set NULL after free to prevent double freeing when unmount.

Fixes: eca4873ee1b6 ("f2fs: Use generic casefolding support")
Signed-off-by: Hyeongseok Kim <hyeongseok@gmail.com>
---
 fs/f2fs/super.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 00eff2f51807..fef22e476c52 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3918,6 +3918,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 
 #ifdef CONFIG_UNICODE
 	utf8_unload(sb->s_encoding);
+	sb->s_encoding = NULL;
 #endif
 free_options:
 #ifdef CONFIG_QUOTA
-- 
2.27.0.83.g0313f36



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
