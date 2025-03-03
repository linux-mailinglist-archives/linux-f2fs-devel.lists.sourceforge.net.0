Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E81A4C932
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  3 Mar 2025 18:22:02 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tp9UO-0000e8-Gg;
	Mon, 03 Mar 2025 17:22:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sandeen@redhat.com>) id 1tp9UN-0000dx-0b
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Mar 2025 17:21:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=content-type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jhMVOwW3H25SRBRcW6vTZBMLdzysvJyHmkhw4wCPOsk=; b=H7rArY8fjM+H1bJ1x+CU10MMRD
 02wuiytFLFm+lQURH+bkDywwI1iZOxgUWFNZzl19w9CycELEGJtmwOZDbRDI+Gkz4kyYvisH0AuhF
 SYFUyO3eGqc+GPHDJIgYGrzbSRo5cNrYmkn3dKAR7+JhddcV0oV46yvl4jc94sEfeduY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=content-type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jhMVOwW3H25SRBRcW6vTZBMLdzysvJyHmkhw4wCPOsk=; b=dZLJvibtOhIGz1VjdR/fqJML+j
 KfZW+Dyuvh5sxTgLsctt7LezVluFgz1hk65z+c8/tBlPxqrB6VHf669EPNsfOSrVmsrTwZzzkm+6s
 H35kkr/L+YYaZPkkOD+HjjWZ5orRdxsVpRCJ7H5wfcUBkSaWj8qM1lkFkf/pMlFzbx4w=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tp9UH-0008Qk-PR for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Mar 2025 17:21:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741022502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jhMVOwW3H25SRBRcW6vTZBMLdzysvJyHmkhw4wCPOsk=;
 b=eTFiG+6Oj6ReAOpMcPIaxVwAaUCTQ8MNKd8T0q0CyQe9vIt1K3mWHHlmXj8Mt2rfbUboE7
 2SPFnclfQ5I8rb51MVbo1cSdCRp0zw+xmAUB1ZfLhlf6QBRvFOzmgDXXvTbgk73hlHjHFF
 PxtDoxzyRZlvS0ryNPHGdxtV2bl050A=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-269-Hhrk15CNOIaiTay_mpC9hQ-1; Mon, 03 Mar 2025 12:21:41 -0500
X-MC-Unique: Hhrk15CNOIaiTay_mpC9hQ-1
X-Mimecast-MFC-AGG-ID: Hhrk15CNOIaiTay_mpC9hQ_1741022501
Received: by mail-io1-f71.google.com with SMTP id
 ca18e2360f4ac-84cdb5795b0so387083439f.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 03 Mar 2025 09:21:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741022500; x=1741627300;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jhMVOwW3H25SRBRcW6vTZBMLdzysvJyHmkhw4wCPOsk=;
 b=B1Z9wPpSs0XuRIMTTiK8bcpGMcSC4Hh2XBpludi51Qb6pQkEGqZvOhSAT/tAGtNMTu
 RA/k/CxiL4uokJZf7qbIpWorTtvHUtyvwDWqMmr5KNBE1fLNUvw+RCqkFzG/M+Y00qs7
 FewBtEBoGkPAWKiEwwRNN7WDJWn4QiYtkj47vACTR1qqgmkkO/cAwfCgy8e9pRhfr3j2
 tQqCIK11uesvVJmlvt72nqjcOYQK3WYzHuHRLfQ5XMwtCT06Xj5CTVYJEsJk6CmnBNYZ
 nAfw4pL+Gknmb6sC2vqWZxYKJWRYUsrSlbLNAKyvheJEpQNHrMyT6KucQMfKuUELedSv
 7EsQ==
X-Gm-Message-State: AOJu0YzVej9hk8Ai1IoDLhKN8LkZ/oL5ThRkuaDp3aGd7LmM+oF9D30L
 LppsHbYYM5/qIERMuvdulUdFnKh3uJg4Oc6hzY1LORjoSWclRrQVrcmjc7z35fyO2vZ3uAaI28s
 BsZQOW7UGBa3FJ2fvxsdPPZReMt43T5vQrr2wY+3aBiXWqAQioruAqBO+K3HbIz1ZvXZQebRDDN
 HVeK23QZdqJS83H6nv3nPupci+/d+LHh835aMj210IxR2Xe48WUjAhayIwkQ==
X-Gm-Gg: ASbGncs+0/hpEqIRiL5tHEWflI1/VmkrUgKRTzj5/jVCiRk/58d40q0kCDNn/hgffKl
 EVouGh4cDrywK+x96EFxQKkRZcdLcYGW2uCjeTbSREdc1m49pgmVa5Qp1ls6g49tfjICC0K5vMZ
 2p8QSKGkdjXdzvb1kDQvf8UebPYb2+d6CjC5n4OW89x7btcLVqUY7wkl6hn9HQnJycKCqObwgGV
 yGLDMLMA2Qivnk46FoqoDAkKLTxqwPW8hJ+KRNStV0fOBWgkG3bMls0EPmE8r6ulnAUiLS4bhOg
 XoBbpTUMEO0cUw57GzhnX14mfNl0qbo=
X-Received: by 2002:a05:6602:358d:b0:85a:e659:bed2 with SMTP id
 ca18e2360f4ac-85ae659c08emr277150539f.14.1741022500389; 
 Mon, 03 Mar 2025 09:21:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHnXJCJgDqxjIGN+geVWJUGs4v5reFOD8RlrrcsvrfSnNg08p3kpwBBFLeMKh6yzcNMSHUmWw==
X-Received: by 2002:a05:6602:358d:b0:85a:e659:bed2 with SMTP id
 ca18e2360f4ac-85ae659c08emr277147539f.14.1741022500040; 
 Mon, 03 Mar 2025 09:21:40 -0800 (PST)
Received: from fedora-rawhide.sandeen.net ([65.128.97.82])
 by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-85add261b4csm49563939f.9.2025.03.03.09.21.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 09:21:38 -0800 (PST)
From: Eric Sandeen <sandeen@redhat.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon,  3 Mar 2025 11:12:18 -0600
Message-ID: <20250303172127.298602-9-sandeen@redhat.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250303172127.298602-1-sandeen@redhat.com>
References: <20250303172127.298602-1-sandeen@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qSIs6iWks4HQh1-xLoqc8h-5RF3ewU9-qb6SlWQmgaE_1741022501
X-Mimecast-Originator: redhat.com
X-Spam-Score: -1.2 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: With the new mount api we will not have the superblock
 available
 during option parsing. Prepare for this by passing *sbi rather than *sb.
 For now, we are parsing after fill_super has been done, so sbi->sb will exist.
 Under the new mount API this will require more care, but do the simple change
 for now. 
 Content analysis details:   (-1.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.129.124 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.129.124 listed in bl.score.senderscore.com]
 -1.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [170.10.129.124 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.129.124 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tp9UH-0008Qk-PR
Subject: [f2fs-dev] [PATCH 8/9] f2fs: pass sbi rather than sb to quota
 qf_name helpers
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
Cc: jaegeuk@kernel.org, lihongbo22@huawei.com,
 Eric Sandeen <sandeen@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

With the new mount api we will not have the superblock available during
option parsing. Prepare for this by passing *sbi rather than *sb.

For now, we are parsing after fill_super has been done, so sbi->sb will
exist. Under the new mount API this will require more care, but do the
simple change for now.

Signed-off-by: Eric Sandeen <sandeen@redhat.com>
---
 fs/f2fs/super.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index bc1aab749689..9edb200caae7 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -383,10 +383,10 @@ static void init_once(void *foo)
 #ifdef CONFIG_QUOTA
 static const char * const quotatypes[] = INITQFNAMES;
 #define QTYPE2NAME(t) (quotatypes[t])
-static int f2fs_set_qf_name(struct super_block *sb, int qtype,
+static int f2fs_set_qf_name(struct f2fs_sb_info *sbi, int qtype,
 							substring_t *args)
 {
-	struct f2fs_sb_info *sbi = F2FS_SB(sb);
+	struct super_block *sb = sbi->sb;
 	char *qname;
 	int ret = -EINVAL;
 
@@ -424,9 +424,9 @@ static int f2fs_set_qf_name(struct super_block *sb, int qtype,
 	return ret;
 }
 
-static int f2fs_clear_qf_name(struct super_block *sb, int qtype)
+static int f2fs_clear_qf_name(struct f2fs_sb_info *sbi, int qtype)
 {
-	struct f2fs_sb_info *sbi = F2FS_SB(sb);
+	struct super_block *sb = sbi->sb;
 
 	if (sb_any_quota_loaded(sb) && F2FS_OPTION(sbi).s_qf_names[qtype]) {
 		f2fs_err(sbi, "Cannot change journaled quota options when quota turned on");
@@ -931,32 +931,32 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 			set_opt(sbi, PRJQUOTA);
 			break;
 		case Opt_usrjquota:
-			ret = f2fs_set_qf_name(sb, USRQUOTA, &args[0]);
+			ret = f2fs_set_qf_name(sbi, USRQUOTA, &args[0]);
 			if (ret)
 				return ret;
 			break;
 		case Opt_grpjquota:
-			ret = f2fs_set_qf_name(sb, GRPQUOTA, &args[0]);
+			ret = f2fs_set_qf_name(sbi, GRPQUOTA, &args[0]);
 			if (ret)
 				return ret;
 			break;
 		case Opt_prjjquota:
-			ret = f2fs_set_qf_name(sb, PRJQUOTA, &args[0]);
+			ret = f2fs_set_qf_name(sbi, PRJQUOTA, &args[0]);
 			if (ret)
 				return ret;
 			break;
 		case Opt_offusrjquota:
-			ret = f2fs_clear_qf_name(sb, USRQUOTA);
+			ret = f2fs_clear_qf_name(sbi, USRQUOTA);
 			if (ret)
 				return ret;
 			break;
 		case Opt_offgrpjquota:
-			ret = f2fs_clear_qf_name(sb, GRPQUOTA);
+			ret = f2fs_clear_qf_name(sbi, GRPQUOTA);
 			if (ret)
 				return ret;
 			break;
 		case Opt_offprjjquota:
-			ret = f2fs_clear_qf_name(sb, PRJQUOTA);
+			ret = f2fs_clear_qf_name(sbi, PRJQUOTA);
 			if (ret)
 				return ret;
 			break;
-- 
2.48.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
