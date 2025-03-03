Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E8EA4C928
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  3 Mar 2025 18:21:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tp9UD-0000xO-EM;
	Mon, 03 Mar 2025 17:21:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sandeen@redhat.com>) id 1tp9UB-0000x2-5s
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Mar 2025 17:21:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=content-type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3a71CP4rhUt2ebhd+8+Z2N85PjMH51h0fkBgqrQVK1g=; b=d8Cy1jAvHd6F3Xhp9MQTrbHJYN
 e6U4plm7uETNJWr1ZyeOcdqfRa3V9ieCRfzZxrBlEzRi3dcYqkhaj/HSW9yxVXMNnY4BE6OvNSRIf
 3guMPq9a1/HdkeJ5LKvm7ULQwtSri4H+IwLWYD63spcPypfT2aSQXxR10mfdRTwqMYdE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=content-type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3a71CP4rhUt2ebhd+8+Z2N85PjMH51h0fkBgqrQVK1g=; b=bQSFxgnFJIASreshOSM8nwTS/o
 mxuXuKgTcZitZMlyLZdiEL65wrMGEJUJ991T52M/kFKpMeeLS6kOHbzZJTiQ86F0YtGY00KfslufG
 Bk1LlHsMKvd5XV8nOewbCI/xPYcoDPYH0eymBr9/Al3BOOz2QcJunnh+FCbrNHx8BN78=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tp9UA-0008QM-4X for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Mar 2025 17:21:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741022495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3a71CP4rhUt2ebhd+8+Z2N85PjMH51h0fkBgqrQVK1g=;
 b=Zuchck3X8bdcsZdU4oj2O9H5I/yn2wPqwzLRkXCth8xUvY3gaAQS2R6Hrgx0dgDttXyCkw
 EX4TUjKJtgFx0QmiEu4fU+8Tpm/7e/NG8Ry+dfMqdK2JFlIaqjf3MA+V66E98JqgCGQGQe
 ZgCahUDENgVZquko01for7xga3gFTPY=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-RBQ-GiF-Pky5I1h7bJBiCg-1; Mon, 03 Mar 2025 12:21:34 -0500
X-MC-Unique: RBQ-GiF-Pky5I1h7bJBiCg-1
X-Mimecast-MFC-AGG-ID: RBQ-GiF-Pky5I1h7bJBiCg_1741022493
Received: by mail-io1-f69.google.com with SMTP id
 ca18e2360f4ac-85adea539cbso174412739f.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 03 Mar 2025 09:21:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741022493; x=1741627293;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3a71CP4rhUt2ebhd+8+Z2N85PjMH51h0fkBgqrQVK1g=;
 b=QCApPs5MN5srdfsYXb2whnxQ1kqeZcODNqnaR+yc8Lqu0V9zAr6E9kqbNNcMEAJqw5
 lV4NTNSM63wOwATvjx4q/1NmfXBplLzU2DYJ7qTG8XlF6YI2oV24TTv+1FpNdD291+oc
 hZp/ow5ae+Xwd/5ECdPdfAQpPsgPlSsl5U66tnQ5k1R9AI5Ynp+Y78LPgU2MnRolUBvQ
 jqUfAIVsM89729GNkko3or932XZUDbdnqg85ZxW7TADtSHG06T7ii334q0mMhrHi82/L
 sDZVEUbJ67SgtTmwgHCuT+sGpGWvF9Jl89dGf1Qx8dA2gKcnUlRQCQaX+yjuFX3xlA/s
 66aA==
X-Gm-Message-State: AOJu0YzA9FAzYP4bLYRHcUFeEtK/PABkos5ozzKLc533B184xRvLbBIv
 5A+ZJrCAIRlVlFTLjssXMBAsydYh9OHDr0BBAkdsGeYlomaMhdDhBUjrtZvnzomKHzf7OqTNbYz
 4ic9HhxLfOfmE2CCnCitMRJuhklx8q0d0Hy6xZufGEgqKMg5jxpvhR9URj99NObupT1jYCz0XcX
 eLfJ4bsa4lh5kprnj6zuc9xdn2tnPw7PRDRl6LsN2W/FrLAP0ddrw6GcT4dQ==
X-Gm-Gg: ASbGncuhu7nlb2WJZ6M0Yyn195X79ulcvtIXeYrwfpFDoH70/GnwCJKKK5U/MXF6Som
 +CzS/ojBIMYNWHn1n5Vdh7HuaFnkt4YGeUazhLAOgWt0oslmDLo5g9DhKth7Pk/3yZBOvEF/qzo
 bqo6VKLS8ukCMQXsEDM0oyyqDL3LCQwQ2fcjyI2pSz1DIQaR665FdVb9dugb1bcs1AsL3QUnxDb
 vSr7Yl4LujRnGNbTPc7JVtoKF58MdLWDBbQmFHh/ndeoCNT8fps2+dGL74BRVdySapohAEpBs+n
 ZGhc2yLFUEJi7oX1wXiqbY+fY8ktKw0=
X-Received: by 2002:a05:6602:3a81:b0:85a:ec03:b124 with SMTP id
 ca18e2360f4ac-85aec03b1edmr222852039f.4.1741022493447; 
 Mon, 03 Mar 2025 09:21:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHdB+2mmjIA6xrOj1G/sR+GfMIsrO4HpL6CaKlQ+6huwSCwGDZo9vSk87HI2Ud8mtJpqZBxag==
X-Received: by 2002:a05:6602:3a81:b0:85a:ec03:b124 with SMTP id
 ca18e2360f4ac-85aec03b1edmr222848539f.4.1741022493139; 
 Mon, 03 Mar 2025 09:21:33 -0800 (PST)
Received: from fedora-rawhide.sandeen.net ([65.128.97.82])
 by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-85add261b4csm49563939f.9.2025.03.03.09.21.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 09:21:32 -0800 (PST)
From: Eric Sandeen <sandeen@redhat.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon,  3 Mar 2025 11:12:13 -0600
Message-ID: <20250303172127.298602-4-sandeen@redhat.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250303172127.298602-1-sandeen@redhat.com>
References: <20250303172127.298602-1-sandeen@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GAOHrf0nZAccjaOzXgIsjSlTR4wo6bWgn2gC-vWTMy4_1741022493
X-Mimecast-Originator: redhat.com
X-Spam-Score: -1.2 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Eric Sandeen <sandeen@sandeen.net> The current options
 parsing function both parses options and validates them - factor the
 validation
 out to reduce the size of the function and make transition to the new mount
 API possible, because un [...] 
 Content analysis details:   (-1.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.129.124 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.129.124 listed in sa-trusted.bondedsender.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.129.124 listed in list.dnswl.org]
 -1.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [170.10.129.124 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tp9UA-0008QM-4X
Subject: [f2fs-dev] [PATCH 3/9] f2fs: factor out an f2fs_default_check
 function
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
Cc: jaegeuk@kernel.org, Eric Sandeen <sandeen@sandeen.net>,
 lihongbo22@huawei.com, Eric Sandeen <sandeen@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Sandeen <sandeen@sandeen.net>

The current options parsing function both parses options and validates
them - factor the validation out to reduce the size of the function and
make transition to the new mount API possible, because under the new mount
API, options are parsed one at a time, and cannot all be tested at the end
of the parsing function.

Signed-off-by: Eric Sandeen <sandeen@redhat.com>
---
 fs/f2fs/super.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 29b3aa1ee99c..7cfd5e4e806e 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -687,7 +687,7 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 	int ret;
 
 	if (!options)
-		goto default_check;
+		return 0;
 
 	while ((p = strsep(&options, ",")) != NULL) {
 		int token;
@@ -1318,7 +1318,11 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 			return -EINVAL;
 		}
 	}
-default_check:
+	return 0;
+}
+
+static int f2fs_default_check(struct f2fs_sb_info *sbi)
+{
 #ifdef CONFIG_QUOTA
 	if (f2fs_check_quota_options(sbi))
 		return -EINVAL;
@@ -2364,6 +2368,10 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 	}
 #endif
 
+	err = f2fs_default_check(sbi);
+	if (err)
+		goto restore_opts;
+
 	/* flush outstanding errors before changing fs state */
 	flush_work(&sbi->s_error_work);
 
@@ -4489,6 +4497,10 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 	if (err)
 		goto free_options;
 
+	err = f2fs_default_check(sbi);
+	if (err)
+		goto free_options;
+
 	sb->s_maxbytes = max_file_blocks(NULL) <<
 				le32_to_cpu(raw_super->log_blocksize);
 	sb->s_max_links = F2FS_LINK_MAX;
-- 
2.48.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
