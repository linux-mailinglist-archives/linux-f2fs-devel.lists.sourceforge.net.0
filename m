Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 652096291E3
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 15 Nov 2022 07:36:06 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oupY9-0003ex-6o;
	Tue, 15 Nov 2022 06:36:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ssawgyw@gmail.com>) id 1oupY7-0003er-K6
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Nov 2022 06:35:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Zpq6wrWfGX8bxB3+xVIKWb00BlqK5w3SjhxTJfK4DaY=; b=C99KrZdH8kxsDfwDw+Bu6ArgRx
 0FgQC5wVUfZp4wduKRBzofzbo10RcDJ7DeOJpdfHIsTB9J85NDMiy14CdDA9KNoKjDA6B5zKngIJj
 vkNyU9UDYS8cjaXDm1OZ2jcj951pqTeR48L5X/JQzWrPIa/uZhpVNdraIe2HAxjjZnz0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Zpq6wrWfGX8bxB3+xVIKWb00BlqK5w3SjhxTJfK4DaY=; b=U
 WLd/nJ0qMpBeO6kNWNOAtvTKrRSHB0Zq8Zje+34IscSvaxVtJpj5Ij0Y/yKZdRZGoDKcDPU+DhxSG
 jj50QzZruSUHtygmwAVInSiUvaIgH2DCBcd+FFzPyNGOiWgfBe0eSDiJHwmlfJTI7VrNpFe1NSd/R
 uoycxU76NpxHq7H0=;
Received: from mail-pl1-f180.google.com ([209.85.214.180])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oupY5-0008HI-PY for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Nov 2022 06:35:59 +0000
Received: by mail-pl1-f180.google.com with SMTP id k7so12285692pll.6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 14 Nov 2022 22:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Zpq6wrWfGX8bxB3+xVIKWb00BlqK5w3SjhxTJfK4DaY=;
 b=UPu6QlQZ6wZFD7QB+Tlnv1r49FrhJjMyTwRDwZZXe3oufdUXkFOBWNwK6FGEIwSDi0
 zxkWMCzpUO1FYlOyQv9LxoKfPfSHpeYV/HPtykLidbfOKIGk+2BucWMwZ+2W4mTqrkwp
 aLPv+OrSIhk2Qis64nWneaQAAhLzEkdG6AfXSz6YUfFEnBDPOY1ONfUBz0rBXZ3+1wtP
 UtXRMso45HgIEXQbFeiHbqJ582RmtmwdPtgylUSh0eyiC/oFNF2W/6nl7Qd4CWZMtY11
 7teXu09vJNeyO3BbXne6hCb0FTpQaS/JnjSYzl7JNKFK9dIAJfgK3yuv9PfY0wZa2WA/
 2FoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Zpq6wrWfGX8bxB3+xVIKWb00BlqK5w3SjhxTJfK4DaY=;
 b=BsrnMLaWn5zJqZ/38LBwvGTUrZLgwEb0qgdELVNwJ6fQ1iiN00lZjTGcF2z5fym3Ax
 YgQrdLAONMScvLmFRtvI7nAXbScw4MAZI13QTjnMqaVppAkK3haoxrRs8x1fmhX9NXfD
 J9oSSzv5sCE4/Jj1Z7z4tggGouWWL3OyJZCMYjHFtueboRINwLCh/t0W5v+ZwVd/fEya
 /3O7I53WzD7GulJPhNfO3chNt5TPoWfNkPDY/aalCXdZn5ATSUmhXDpbemXBpEQjJ65x
 B0nQU8SXV0qDnvX3EBE0mLrwZ8ud+oWYqyyJJWoDoGuNrFoahM22yZdcQ6N8tEDeFNMq
 qVmw==
X-Gm-Message-State: ANoB5pnt7/S6kkYMsS6FrzrXs6y5OBJKsEWb1nhHjbmqD1rMnxgG+6DC
 uM2+Sx5ipECBuI534UmFhQPuhwE+twA=
X-Google-Smtp-Source: AA0mqf5brcwE8/5+e3obUHYZ2iFik6+VPMFFSbA8IoLCjkzqYAbXd/XNaH0HhoD5jAIbh1v4haF/oA==
X-Received: by 2002:a17:902:e483:b0:188:b44b:598 with SMTP id
 i3-20020a170902e48300b00188b44b0598mr2750875ple.54.1668494152227; 
 Mon, 14 Nov 2022 22:35:52 -0800 (PST)
Received: from VirtualBox.. ([129.227.152.6]) by smtp.gmail.com with ESMTPSA id
 e4-20020a170902d38400b001822121c45asm8767874pld.28.2022.11.14.22.35.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Nov 2022 22:35:51 -0800 (PST)
From: Yuwei Guan <ssawgyw@gmail.com>
X-Google-Original-From: Yuwei Guan <Yuwei.Guan@zeekrlife.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 15 Nov 2022 14:35:34 +0800
Message-Id: <20221115063537.59023-1-Yuwei.Guan@zeekrlife.com>
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
 function. The last one changes type for sbi->readdir_ra. V1 -> v2 : - set
 alloc_mode default state in default_options() - let variable readdir_ra holds
 the sbi->readdir_ra state in f2fs_fill_dentries() 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.180 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [ssawgyw[at]gmail.com]
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
 [209.85.214.180 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1oupY5-0008HI-PY
Subject: [f2fs-dev] [PATCH v2 0/3] alloc_mode changed after remount on a
 small volume device
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

The last one changes type for sbi->readdir_ra.

V1 -> v2 :
- set alloc_mode default state in default_options()
- let variable readdir_ra holds the sbi->readdir_ra state in
  f2fs_fill_dentries()

Yuwei Guan (3):
  f2fs: fix to alloc_mode changed after remount on a small volume device
  f2fs: cleanup for 'f2fs_tuning_parameters' function
  f2fs: change type for 'sbi->readdir_ra'

 fs/f2fs/dir.c   |  2 +-
 fs/f2fs/f2fs.h  |  2 +-
 fs/f2fs/super.c | 17 +++++++++--------
 fs/f2fs/sysfs.c |  5 +++++
 4 files changed, 16 insertions(+), 10 deletions(-)

-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
