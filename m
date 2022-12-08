Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B58646867
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  8 Dec 2022 06:08:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p398y-0006UV-Ts;
	Thu, 08 Dec 2022 05:08:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhuqiandann@gmail.com>) id 1p398x-0006UP-FE
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Dec 2022 05:08:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Gdty8nCzzxU1/GlNFaeUd8yKGkLHYUKDqxUERmNsEr8=; b=WaVQINLo8CZ6rOyOCkZ4ZNSTDD
 zzJJmVH0bFjYwwJ+sLCD2ZDxYIcW4v1Nn8LiaXt1ZL87J961wPNy6G0pPLiqWsecnx8dbASPrRyUT
 MbUPHc75LZnciWjjp1fXh3gyIVVxdd+3tBgZDsPxZ3BYnBauGr3StDZGLFj3b71POxHg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Gdty8nCzzxU1/GlNFaeUd8yKGkLHYUKDqxUERmNsEr8=; b=X
 FYGsmxdVr1xw+IixZvJEWLwIs+n25gukd4SjdAK7D+r1OhkLtcUdqfh4ahd8/2SQu/qkk+/lyS086
 NJ9ArJvbnSBX7JyKIOB2qX48s/tJZPKINujyWyRp+O+o81Q9INO+blmBLeDePzwjH3I0LM99p+n95
 PJyTknvhu356NHsw=;
Received: from mail-pf1-f195.google.com ([209.85.210.195])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1p398v-0005BX-MY for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Dec 2022 05:08:23 +0000
Received: by mail-pf1-f195.google.com with SMTP id d82so388235pfd.11
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 07 Dec 2022 21:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Gdty8nCzzxU1/GlNFaeUd8yKGkLHYUKDqxUERmNsEr8=;
 b=Vvwv2VkYAQSACAqdzGSFhy3nem8BCnsPHs21OgZQITrEYaUTG8oEBA2DViOjBh+BW2
 wZ/tqygqhcuZry305fAntN9EC3u9EOlGOvOhB7HWhaAcPuYGXItjyWWOXdlUGuW/t3e1
 IgiZMThF0EfEliihC1T4XYgRHgiIMNQXungYCrOusU/uwzp2ZZS0k7C8b+EEK4pyOVJR
 bJ2b+WWqDY9STB1g3O22lyKteYGnyPN1v5nufkmsCsSRKCOSMg5S/6YGUkWwAEbr2yUG
 yIOuhUnGMrg4y03ktzfdZ4Ak3bM1L5p1GxlC/zbTae5wEG064gOVKcELLsKRxsH9aKsv
 bJ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Gdty8nCzzxU1/GlNFaeUd8yKGkLHYUKDqxUERmNsEr8=;
 b=KTAXzKMqzNWJE5ZbCCq5ZibWkqL4Ie++jPHoPIoTrcTC/mzwvSCLk7PcYtNS2YWT5z
 wvgoo15iZYfbskKudBMy/lBVbMjUOOLt8znldGpFLH5hccxCu6sWvSRefanOec4OBEyD
 DDFrRRUUYddC6Ni5E//6ICDBE/sPbkAt5Hs+kb108g1k5fF288Yqwa0Js9h5aVad3q3u
 ZhDNNi9+S5YREtHt71SkY95W65BlFCrUNSluvEU9zNlj42WfWUXmiEvwm46RPM7dquL2
 bXDAivDzlGxWtnE/r9gF6NhV7AxuAA9p810+MKi1bcZWx+AcORFkTeUaoA5dnj1aWWMe
 trkw==
X-Gm-Message-State: ANoB5pn4PBuq22+mIm2rOziMHwb7+n0QEU7DtESNjxxahjfkHq7aFXJl
 lfNp/TgSyzys1V1sH7k3U8c=
X-Google-Smtp-Source: AA0mqf5M8DVggQQWkH79sh8XoqSYBx2IHKmduKAbiSGSLQ1P8h0TzOZbwvdLoN9yLs3f4L/RzoaYYg==
X-Received: by 2002:a05:6a00:1388:b0:577:1c59:a96c with SMTP id
 t8-20020a056a00138800b005771c59a96cmr2103581pfg.2.1670476095931; 
 Wed, 07 Dec 2022 21:08:15 -0800 (PST)
Received: from mi-ThinkStation-K.mioffice.cn ([43.224.245.228])
 by smtp.gmail.com with ESMTPSA id
 c194-20020a621ccb000000b0056d3b8f530csm14383760pfc.34.2022.12.07.21.08.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Dec 2022 21:08:15 -0800 (PST)
From: zhoudan8 <zhuqiandann@gmail.com>
X-Google-Original-From: zhoudan8 <zhoudan8@xiaomi.com>
To: jaegeuk@kernel.org
Date: Thu,  8 Dec 2022 13:08:08 +0800
Message-Id: <20221208050808.2448146-1-zhoudan8@xiaomi.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In compress_mode=user, f2fs_release_compress_blocks() does
 not verify whether it has been compressed and sets FI_COMPRESS_RELEASED
 directly.
 which will lead to return -EINVAL after calling compress. T [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [zhuqiandann[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.195 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.195 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1p398v-0005BX-MY
Subject: [f2fs-dev] [PATCH] f2fs: don't set FI_COMPRESS_RELEASED if file is
 not compressed
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
Cc: zhoudan8 <zhoudan8@xiaomi.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

In compress_mode=user, f2fs_release_compress_blocks()
 does not verify whether it has been compressed and
 sets FI_COMPRESS_RELEASED directly. which will lead to
return -EINVAL after calling compress.
To fix it,let's do not set FI_COMPRESS_RELEASED if file
is not compressed.

Signed-off-by: zhoudan8 <zhoudan8@xiaomi.com>
---
 fs/f2fs/file.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 82cda1258227..f32910077df6 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3451,14 +3451,13 @@ static int f2fs_release_compress_blocks(struct file *filp, unsigned long arg)
 	ret = filemap_write_and_wait_range(inode->i_mapping, 0, LLONG_MAX);
 	if (ret)
 		goto out;
-
-	set_inode_flag(inode, FI_COMPRESS_RELEASED);
 	inode->i_ctime = current_time(inode);
 	f2fs_mark_inode_dirty_sync(inode, true);
 
 	if (!atomic_read(&F2FS_I(inode)->i_compr_blocks))
 		goto out;
 
+	set_inode_flag(inode, FI_COMPRESS_RELEASED);
 	f2fs_down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
 	filemap_invalidate_lock(inode->i_mapping);
 
-- 
2.38.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
