Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 53ABE800144
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  1 Dec 2023 02:53:51 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r8siq-0001Tq-OU;
	Fri, 01 Dec 2023 01:53:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <35DppZQYKADEQebfRaTbbTYR.PbZ@flex--drosen.bounces.google.com>)
 id 1r8siq-0001Tk-2Z for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 01 Dec 2023 01:53:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 Mime-Version:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MQVX8KES95HvH2qkfqcCG8qMIeL1L/y7yTEOd92EKkg=; b=DOVqVd4mm2SjBRzXmtnAzQ71n8
 3BMbMiWPSaRftCzI8bci4Egc5Y7cSiMkPn2NnpccSlhLnyGBlcE2iNBCElz4BOPBCZhLa5cifX684
 KZuCnkr9MV2Pt6Vk91uLRJ+oHp9iCVF6qZeWF4kn3oM0epTc/vdJL1FvAei8fxyjGeoA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=MQVX8KES95HvH2qkfqcCG8qMIeL1L/y7yTEOd92EKkg=; b=R
 Bk0ILypwinTOB2C+mDxrS4n0CBMu0IWEMhzjBU8E2ZuZza9gdVAcQFcTRgXCUhV2hfVMhQwbXR4Zq
 Wlb5vs513zC+jmddGa2BwNhZ7UNgMNQ9NfhphGRscLyHVjAigtz7CT7xd/ByDsON0/EADFyynplSN
 BJLwASzghnJ+mAWs=;
Received: from mail-ot1-f74.google.com ([209.85.210.74])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1r8sio-0005kx-1b for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 01 Dec 2023 01:53:40 +0000
Received: by mail-ot1-f74.google.com with SMTP id
 46e09a7af769-6d63f6a5abcso59447a34.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 30 Nov 2023 17:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1701395612; x=1702000412;
 darn=lists.sourceforge.net; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=MQVX8KES95HvH2qkfqcCG8qMIeL1L/y7yTEOd92EKkg=;
 b=jDl57JmJT9LlFIJybyU/SN7ErqC1/Egd6EahKK0QO9KyXOmQ7vF96ZT36k7pu2TfkZ
 fYxPQt7Z8fGrlgoi44Jk7XykWEp97BKOPbnEJxVzy9Hxl/s4TqlYSSEkErXaVmwX85cF
 XTR2cUhn6r3wLEpKfYzVrme/F1HtZMTTQyJvCnacPUWQlgjJK0q1z0RNYx3gQ6FNnti6
 OFxpAkcj7vEXr5whnhB4/Kwhx3CCBJH/Em7BPG40atX6tMd8En/rGEzi+O2TkiEXF3gL
 pZJmJX+ExCbPUOvjP8mkRz7DPm72U//a/aEniJM4Z7H7xxi4gWyA0FN3g9UQ7sDW3fwH
 uyOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701395612; x=1702000412;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MQVX8KES95HvH2qkfqcCG8qMIeL1L/y7yTEOd92EKkg=;
 b=KGhMDyV+gfPYdn7CmUWJ/obVjQW/JT66Izs+2lXDZ1cUiTfi0in33GKH0mmHxrLaZ7
 xa1IC55GfVPm0GHwDZXM7XwgHnPDuuVYtPeLaDBwc+WDALFbLdj7vlR/UyHQ1Y69OXf8
 UgOX+QP24eXTW1Sb68vL3LDV/UmiWjfnfDIs0AjF6dC8+GZZa8FqFBand+WNT8NDZC4z
 CRAOTtIwlAd/WGar3Lxxd8ORgJqCfYNFS5huQDvKeqj58ftaG2jxCf4BdmeK6owHhun3
 /wg+IpxEkoZrv1nehmztj0uF5M/t9M9Sgb4XX3nlE2olESjInKH5ywM3illyIq+oPWIv
 XUDw==
X-Gm-Message-State: AOJu0YzCsYF97CWx9PXxF8nt5C+MJOjDSXwWNYWTFBCkGcFc32e9Qern
 FxAGCqeJIOnwiN6+OekqStC/F4Ba3/y12ZwvBOKT6gVwPlaZfm2Zeyh0/pJfJiTGeY58FyxZ6Od
 4PQ+iSkvG60AxLAUvR9UT3Zcpj6sLKhpSUvWOv7/HwbVl7iQL5g3PLlnNXwBXIo0sVZW/oGN8xi
 ZfrRC04sU=
X-Google-Smtp-Source: AGHT+IEuRe0jpMLFRXHQmPeCR0r5SERF1A5XrdF0q3jqda9x+UKG4hAsKBbpAEOXXf/J2qoMXuJ0d1jIueU=
X-Received: from drosen.mtv.corp.google.com
 ([2620:15c:211:201:b269:fe47:d860:c7bf])
 (user=drosen job=sendgmr) by 2002:a25:74c9:0:b0:db5:3b4b:ad1e with SMTP id
 p192-20020a2574c9000000b00db53b4bad1emr135423ybc.10.1701395172986; Thu, 30
 Nov 2023 17:46:12 -0800 (PST)
Date: Thu, 30 Nov 2023 17:46:09 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
Message-ID: <20231201014609.3240520-1-drosen@google.com>
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -7.7 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Describes the block size option -b. This sets the block size,
 which is restricted to powers of 2. The linux kernel currently requires that
 the block size be equal to the page size to mount. Change-Id:
 I27ec4f909f8d27327b48373f0a4a4e8593626804
 Signed-off-by: Daniel Rosenberg <drosen@google.com> --- man/mkfs.f2fs.8 |
 6 ++++++ 1 file changed, 6 insertions(+) 
 Content analysis details:   (-7.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.74 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
 welcome-list
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.74 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1r8sio-0005kx-1b
Subject: [f2fs-dev] [PATCH] man: Add description for mkfs -b option
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
From: Daniel Rosenberg via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Daniel Rosenberg <drosen@google.com>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, kernel-team@android.com,
 Daniel Rosenberg <drosen@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Describes the block size option -b. This sets the block size, which is
restricted to powers of 2. The linux kernel currently requires that the
block size be equal to the page size to mount.

Change-Id: I27ec4f909f8d27327b48373f0a4a4e8593626804
Signed-off-by: Daniel Rosenberg <drosen@google.com>
---
 man/mkfs.f2fs.8 | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/man/mkfs.f2fs.8 b/man/mkfs.f2fs.8
index 474c401..6670003 100644
--- a/man/mkfs.f2fs.8
+++ b/man/mkfs.f2fs.8
@@ -116,6 +116,12 @@ If the value is equal to 1, each of active log areas are initially
 assigned separately according to the whole volume size.
 The default value is 1.
 .TP
+.BI \-b " block size"
+Specify the block size in bytes. Valid blocksizes are powers of 2.
+Currently, the kernel is only able to mount f2fs filesystems where the
+block size matches the page size.
+The default value is 4096.
+.TP
 .BI \-c " device-list"
 Build f2fs with these additional comma separated devices, so that the user can
 see all the devices as one big volume.
-- 
2.43.0.rc2.451.g8631bc7472-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
