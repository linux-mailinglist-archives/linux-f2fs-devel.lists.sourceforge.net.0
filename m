Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D3DA5A9AFBD
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 24 Apr 2025 15:51:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u7wzU-00044f-Cz;
	Thu, 24 Apr 2025 13:51:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sandeen@redhat.com>) id 1u7wzS-00044W-5C
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Apr 2025 13:51:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=content-type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=udKMH1CU1t2Ev+wjCTCy32K3ZTMMah0I4lS2t0dApE0=; b=m2plCnpwg4kscUDV7tcPbj6TrF
 Ld+dQTbddnxPGwmqi5eGj+QjgeVidEDcrnmffm4roahC+zxLdkKSPEmFRrmBXF0BmMqtek6WfEc2x
 pR3pYOoEVGkk1vYCJBUnhA/9ZKwnE+HNhujrqeh0aF94rXGECN63o+T4H1Zdo4mq/0cI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=content-type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=udKMH1CU1t2Ev+wjCTCy32K3ZTMMah0I4lS2t0dApE0=; b=h4LFjMkNbpCBHPzoilyXLMPzQ2
 CUkihuxfprA9MqRqZjF4eNAxne1wfmM9taypvG19MyayuoFwf8wy1kgEQ+x1EzNtuVVqeCuim0RHN
 yp7362HHvOAZN+rUFRhlUOZ9nm8PgGaP1Ib4PGAEP/2IPAPMnQ/zpSB9dgoQKhbxapSU=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1u7wzC-0000nX-DO for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Apr 2025 13:51:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745502674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=udKMH1CU1t2Ev+wjCTCy32K3ZTMMah0I4lS2t0dApE0=;
 b=i0wJoZiJfSZAn1Sr8xnmDuY0YUULgKE9s3lOAV3zev2cizF3DC6//CEE9hveR5haT76fmv
 AuKYg8mnG+GWZ5de8ne/gioFPLYxo2t9EK67VZ0a0kvxMnY0nwB9yW78hLd8gwo/zSrSIV
 ClikhkCluReo7rrmwoRndyj4yQAppQ8=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-9nd7-Y2PPB6oUWJejzhqQw-1; Thu, 24 Apr 2025 09:51:13 -0400
X-MC-Unique: 9nd7-Y2PPB6oUWJejzhqQw-1
X-Mimecast-MFC-AGG-ID: 9nd7-Y2PPB6oUWJejzhqQw_1745502672
Received: by mail-ot1-f70.google.com with SMTP id
 46e09a7af769-72bc289077fso1130233a34.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 24 Apr 2025 06:51:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745502672; x=1746107472;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=udKMH1CU1t2Ev+wjCTCy32K3ZTMMah0I4lS2t0dApE0=;
 b=hW4RdDSU2m689hajmouYTjh3zn8A55CqUlargpUI6aWDQ6iy4jIeLJHMNxW87+RaZW
 QGiYE4xokWSh/vrUBKUCjQr2RZO2AXzzsvEC7oz+M5TX0oPQXaqCiCI//rnAzp1F++3q
 lL1x0V9MkTYXMcUOQMr+fIcnfhfGV1sEcAk1Ubyw62dJTwy3uy1TKrLgO49Hsz3lB3Sb
 cj57ixnRJfFF5zRXC4hmkBvJipJF8XTlsIH77sbXmxT+aLbHxPZOER55MMMcTVvFMy83
 qH7B6posaRXlMgwgMRUzZSdxbyB7L70qLBnY9YXRNysqdLSSF69VPhF/Vxhf5lDLguyc
 d1yg==
X-Gm-Message-State: AOJu0YzPW1trrQSp9sy3BleGxttsKOrEtPoV+UFdhnRHDACwi+ix+8ju
 GPx0hUB+biytn6DrDgwAgrQ706B5jz91gZiyYO0aZn2Udx7x3NO6BTts27clZwbW8LSqF+V/2/8
 TIms79DRbbALRkxqykz3pvmcfpuUha9nT6AS4LeltIxNvCVrS6MXNhUehJ+qPa5vCFLpy3ET5LM
 cPY2eKRlFWPkFoC983UT45mh82f8I3zDknS8um2EjqopzOKfEgQbf783Knos/J
X-Gm-Gg: ASbGncuqvavygHLN4DeEMrIH+OGxMpEzR+pGz6V+ixnBBQd36Fg5YqOrAt/v6ZzM12X
 u4y0bIFQdiiHIkiNxnnQdxD+AuI1F8GC8VvNjwWypaMlrjfdm39UAGfB+3JzseuHIicT5llxBcB
 0114QCNj1+49pEveR5QWj1AmpKnZS56XgtzJ+CdtAloWtl/XP+gbkMOpymJyqlR2aAla4PtlvJm
 sgaanLfxJAsByJ83LLBoORZ/bG/3nE4kgxrYESTECDM0QT/IsA+IJbqqPjFOwb2oQu6kLnAmubY
 r+2Y4tvd0EO+JuM6PB9yXe97JoXU7An2kUvRKTaQcQTSHZav4JKooRc=
X-Received: by 2002:a05:6830:699a:b0:727:876:c849 with SMTP id
 46e09a7af769-7304dbb0a68mr1810759a34.27.1745502672351; 
 Thu, 24 Apr 2025 06:51:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHytkAZ6rDjaVBYhWIVU1VT8tqkJSUb23Y4x3ScNmZVhWKTjLIRxd6fQ/FI9xJUcBHGkyC2OQ==
X-Received: by 2002:a05:6830:699a:b0:727:876:c849 with SMTP id
 46e09a7af769-7304dbb0a68mr1810747a34.27.1745502672075; 
 Thu, 24 Apr 2025 06:51:12 -0700 (PDT)
Received: from localhost.localdomain (nwtn-09-2828.dsl.iowatelecom.net.
 [67.224.43.12]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7304f37b158sm233595a34.49.2025.04.24.06.51.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Apr 2025 06:51:11 -0700 (PDT)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 23 Apr 2025 12:08:50 -0500
Message-ID: <20250423170926.76007-7-sandeen@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250423170926.76007-1-sandeen@redhat.com>
References: <20250423170926.76007-1-sandeen@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TyRqnCly994ZZNPwsNk5j4_A52i8aIvV2F8nzdzW3s8_1745502672
X-Mimecast-Originator: redhat.com
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Hongbo Li <lihongbo22@huawei.com> The
 handle_mount_opt()
 helper is used to parse mount parameters, and so we can rename this function
 to f2fs_parse_param() and set it as .param_param in fs_context_operations.
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [170.10.129.124 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.129.124 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.129.124 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.129.124 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.8 DATE_IN_PAST_12_24     Date: is 12 to 24 hours before Received: date
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.8 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u7wzC-0000nX-DO
Subject: [f2fs-dev] [PATCH V3 6/7] f2fs: introduce fs_context_operation
 structure
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
From: Eric Sandeen via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Sandeen <sandeen@redhat.com>
Cc: linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, lihongbo22@huawei.com,
 Eric Sandeen <sandeen@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Hongbo Li <lihongbo22@huawei.com>

The handle_mount_opt() helper is used to parse mount parameters,
and so we can rename this function to f2fs_parse_param() and set
it as .param_param in fs_context_operations.

Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
[sandeen: forward port]
Signed-off-by: Eric Sandeen <sandeen@redhat.com>
---
 fs/f2fs/super.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 149134775870..37497fd80bb9 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -707,7 +707,7 @@ static int f2fs_set_zstd_level(struct f2fs_fs_context *ctx, const char *str)
 #endif
 #endif
 
-static int handle_mount_opt(struct fs_context *fc, struct fs_parameter *param)
+static int f2fs_parse_param(struct fs_context *fc, struct fs_parameter *param)
 {
 	struct f2fs_fs_context *ctx = fc->fs_private;
 #ifdef CONFIG_F2FS_FS_COMPRESSION
@@ -1173,7 +1173,7 @@ static int parse_options(struct fs_context *fc, char *options)
 			param.key = key;
 			param.size = v_len;
 
-			ret = handle_mount_opt(fc, &param);
+			ret = f2fs_parse_param(fc, &param);
 			kfree(param.string);
 			if (ret < 0)
 				return ret;
@@ -5277,6 +5277,10 @@ static struct dentry *f2fs_mount(struct file_system_type *fs_type, int flags,
 	return mount_bdev(fs_type, flags, dev_name, data, f2fs_fill_super);
 }
 
+static const struct fs_context_operations f2fs_context_ops = {
+	.parse_param	= f2fs_parse_param,
+};
+
 static void kill_f2fs_super(struct super_block *sb)
 {
 	struct f2fs_sb_info *sbi = F2FS_SB(sb);
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
