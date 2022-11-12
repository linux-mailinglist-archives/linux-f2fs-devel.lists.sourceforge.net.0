Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 371D6626826
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 12 Nov 2022 09:33:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1otlx8-00018n-Kv;
	Sat, 12 Nov 2022 08:33:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ssawgyw@gmail.com>) id 1otlx7-00018U-Ox
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 12 Nov 2022 08:33:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mCXCfNSRRcnm3vfJDiUHQ+ivRlGKBS+DxKu934Py8fQ=; b=b983FNUk7RAdImyKCuzizc2jsP
 9YXV/P3I0y9JgO+hIx15Rz9C39LY4Y38s5dXZiKuL9OFF9Br/IzleZGSnre6JlW8Prb043iIdEhQN
 kOWRWY0yxSSBNQTP02DuANZePJ425/EltzlJXIHq7Lw6nvFwowMATW9nTEKqIjhItisI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=mCXCfNSRRcnm3vfJDiUHQ+ivRlGKBS+DxKu934Py8fQ=; b=X
 ETIF0Xc6VCC0BUpY4Y8nt8lFQTl2xscoIHC6tZxKJeZ9U7XnRmLP1iSA/0JPBYb+rsVGnlrBgmTpI
 mWRD/srVoet+UQsfeh5xcWnMUUt1s7IveE6ipxseMWVyvPXf/y6nx1zQUhy3f8GzVa32242b4fh5w
 l2l0X9ktRy2NrW5s=;
Received: from mail-pj1-f45.google.com ([209.85.216.45])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1otlx5-005EA4-Ms for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 12 Nov 2022 08:33:25 +0000
Received: by mail-pj1-f45.google.com with SMTP id
 d59-20020a17090a6f4100b00213202d77e1so9632762pjk.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 12 Nov 2022 00:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mCXCfNSRRcnm3vfJDiUHQ+ivRlGKBS+DxKu934Py8fQ=;
 b=O9LKssH+x7xTlrzWXwaIArZsn3pK5eyM+cqYVdkK73ww7nHgX9/y6qC5XTTO+AuQFC
 lSmER58Um0akQ55wChPfzLmVlp7RgcXZVagrrvcVsdw2+WVbXXjlhKpKGyk3//FWDBRC
 JBMpm6AF5jT8K5xDcjcw8GQ5BH027xc09sCtFy269a/eRnSyeVH4u0wa4jxTm+ouPjhM
 wjw1g8wrPnlWRF6BkRgBNsb4IGoCjn/s29F8Im5PoghpTMbN0k455V4M5EgjLfjFe7hf
 pre+jR2l5NglgXwKOxriE7YexNWIcLPvGGkGEqlXv1aMzBucbO0xVwHd0O2r7r8/FBGu
 YgQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mCXCfNSRRcnm3vfJDiUHQ+ivRlGKBS+DxKu934Py8fQ=;
 b=2XUXU886UHqBad4Dqdrp8DuvNXx5wMvIKHEVe+XUdSZ9PYayyr808mhSk1kHiGK3yc
 j3TUeUxkldGCWArj93Y/pT0Wit98Sbz/MqLJxnc0LMRnRemgY8hVHSpIzZVBgTP8bLZI
 CU7oQsTkNTQRpYOC+gOIWNI/XQc1LfqYhtwXTSX8pJhHBILUebRbG6JQsQ31M56vvMkg
 u7SUf4VqFm7EAHMGZDG7DkhBelukLXUs86c+MJJlcPCVYe1xOGvXq3yk9vXW+uqwr5hO
 1GEjAftY98fUJTrAnJMRNfDg4BhbBVhJ/DOiMa4+1yRDPGZVM39cMmWgULvy7yx1uSB1
 t1jg==
X-Gm-Message-State: ANoB5pkfE7TT/09CUtipVA3Vb0vGmEvY+qr3dQ9RKnNT5CG9P3gFfobP
 S/lEScQC37TExf4rkH0YzK0f/uBW9Is=
X-Google-Smtp-Source: AA0mqf5RQr1VBKfLU1+udXTucL2rFuaiKeQofFtleyvs1i4lfqNMMIe0f8/zF4xbSPHUsogyE51t7Q==
X-Received: by 2002:a17:902:6bc6:b0:17f:8642:7cb9 with SMTP id
 m6-20020a1709026bc600b0017f86427cb9mr5606649plt.174.1668241997938; 
 Sat, 12 Nov 2022 00:33:17 -0800 (PST)
Received: from VirtualBox.. ([129.227.152.6]) by smtp.gmail.com with ESMTPSA id
 i11-20020a1709026acb00b001870533c443sm3066927plt.236.2022.11.12.00.33.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Nov 2022 00:33:17 -0800 (PST)
From: Yuwei Guan <ssawgyw@gmail.com>
X-Google-Original-From: Yuwei Guan <Yuwei.Guan@zeekrlife.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Sat, 12 Nov 2022 16:32:47 +0800
Message-Id: <20221112083250.295700-1-Yuwei.Guan@zeekrlife.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This series contains a fix patch for alloc_mode changed after
 remount on a small volume device, and do cleanup for 'f2fs_tuning_parameters'
 function. The last one change type for sbi->readdir_ra. Yuwei Guan (3): f2fs:
 fix to alloc_mode changed after remount on a small volume device f2fs: cleanup
 for 'f2fs_tuning_parameters' function f2fs: change type for 'sbi->readdir_ra'
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [ssawgyw[at]gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.45 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.45 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1otlx5-005EA4-Ms
Subject: [f2fs-dev] [PATCH 0/3] alloc_mode changed after remount on a small
 volume device
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

This series contains a fix patch for alloc_mode changed after remount
on a small volume device, and do cleanup for 'f2fs_tuning_parameters'
function.

The last one change type for sbi->readdir_ra.

Yuwei Guan (3):
  f2fs: fix to alloc_mode changed after remount on a small volume device
  f2fs: cleanup for 'f2fs_tuning_parameters' function
  f2fs: change type for 'sbi->readdir_ra'

 fs/f2fs/dir.c   |  7 +++----
 fs/f2fs/f2fs.h  |  2 +-
 fs/f2fs/super.c | 35 ++++++++++++++++++-----------------
 fs/f2fs/sysfs.c |  5 +++++
 4 files changed, 27 insertions(+), 22 deletions(-)

-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
