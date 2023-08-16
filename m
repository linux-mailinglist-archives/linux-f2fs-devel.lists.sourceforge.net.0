Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C07A977D81C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 16 Aug 2023 04:07:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qW5wh-00063x-4C;
	Wed, 16 Aug 2023 02:07:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <3_CLcZAYKAN8ESPTFOHPPHMF.DPN@flex--drosen.bounces.google.com>)
 id 1qW5wf-00063o-Pw for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 16 Aug 2023 02:07:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 Mime-Version:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H9VD/R3G+MRr4pzWPFKTK91k5G484Ke6ASD3dpiheZk=; b=bg1UGUwXaPhKEEs6nIuhw4oriw
 Bx8u+ttd59P2T8PFefqmTCQhGNpIY9DOL0vAt8e6xZVStFuXrSAAJflanqiu+uMwbA2x3kq01xfLn
 RgSdAu6NbeOjDHGdJbDc2uCK/h2reYFiIA60iwC6xqfhW4p1zYvX+gVGBOGFOk80yKE4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=H9VD/R3G+MRr4pzWPFKTK91k5G484Ke6ASD3dpiheZk=; b=k
 F2/zFhxDtjeKOFvw9pfZhAReiaZjq1JA/Bu0hpDbvDox/tO3/V+G+Pu8VxwCKAUi8YGK2M4osaD2X
 UNawuLcTVTRKAdDaoQAt1FqCWj9OgLbv6KUdoE92+ZHPcUV0MXN5ZRdETOq7YKRophMutWxzKoNUk
 7lk/tGApcW7sEM20=;
Received: from mail-qt1-f201.google.com ([209.85.160.201])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qW5we-0001LY-45 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 16 Aug 2023 02:07:36 +0000
Received: by mail-qt1-f201.google.com with SMTP id
 d75a77b69052e-40ff200f300so75406061cf.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 15 Aug 2023 19:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1692151650; x=1692756450;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=H9VD/R3G+MRr4pzWPFKTK91k5G484Ke6ASD3dpiheZk=;
 b=zU/qHpb+xg7Q/ug4ev9aLMM54uBSRj+ITScQNZKjwkpMJpKaAjGF3d/9oZuTcQiYh7
 AiuKxKXnDgG8lx9q6SpRet6EcSwsALYktGTJIY65qzkl3JPSJTiojdyrz+jPSsBkmIyb
 F4EqXgwkKkWpE+zm+Sd7HbAv7rfmhAnv2CjsbP+w+FQiO5ypCu7yofs+72ChvDFxyv2X
 oDyRFpMZdpuXzewv81CE/W/WPzypx/dqcvUlHTjg9Y5S1Mc0loiaU7aWfipGAxsO66lj
 arB5fwFBDgRdlWDJ5U+V0rNoB/f+GxXr1LM9rIDrgrywM1Ta8kyNi83n9OO0QVv34f6y
 1jVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692151650; x=1692756450;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=H9VD/R3G+MRr4pzWPFKTK91k5G484Ke6ASD3dpiheZk=;
 b=S70k913llo+YXmCnJNyC43w6HBF1gwOZOTPgwTDZFuxzl86xPbnVFSRuyikirf2uKr
 Yo7uiGQe5PM/T0gshdy761vFL3cPrEpm4JOCXvGqunos9jBk/eSKTnsak9sJf18/SRLi
 0jj3g248XEA2H2veZQsWLdJu0fsgajZcJq/IpZKa3aLUtDKfP19dYiaqqCugzNopbEEI
 /uds1GBhsRBFEFG+JdXT8WulT6wln9hTZZMzSB8yjT0Wp7jABsGr/l39VsvVwpaHqxG/
 6nP/7jYhPYpClL8mxliqln9SUhu0TeSP0AbF5HFGEplvJSYIa8n2L8Qh9x8oFJ2cigGg
 08Og==
X-Gm-Message-State: AOJu0YyvdzND3rPVaD7dFwaUwcuEVdvTMxUdfgXnEh2Hg7YgceQytP58
 UoBWX1cAzSYLXApO188+RbzQrW9EYRB5ACtmzLdrZICvxO/XD9eRxjERe8XL4RgwSHAULGCGkBx
 0Iyr9NHvX0kVfgXUHPhhV37DaG2DZOtcnd4dUmBl8c4EEmzDMwjW53J96A/OG4M/8PPzfdpy0Kw
 wRunKrymA=
X-Google-Smtp-Source: AGHT+IHRLlIGGNwPaRpxAIIhl1cJ1s0NCl5PXS5Bil58d1WAv6OI7FtfbwHuY4ImazllyImjOZPmj1JFiGc=
X-Received: from drosen.mtv.corp.google.com
 ([2620:15c:211:201:19fa:33cd:f272:37ec])
 (user=drosen job=sendgmr) by 2002:a05:6902:a08:b0:d42:5cb6:31ff with SMTP id
 cb8-20020a0569020a0800b00d425cb631ffmr6364ybb.8.1692148476757; Tue, 15 Aug
 2023 18:14:36 -0700 (PDT)
Date: Tue, 15 Aug 2023 18:14:31 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.41.0.694.ge786442a9b-goog
Message-ID: <20230816011432.1966838-1-drosen@google.com>
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -7.7 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: F2fs filesystems currently have two large restrictions around
 block size. The block size must equal the page size, and the block size must
 be 4096. The following patch, along with the associated f2fs-tools patch
 set, relax the latter restriction, allowing you to use 16K block size f2fs
 on a 16K page size system. It does not allow mounting 4K bloc [...] 
 Content analysis details:   (-7.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
 welcome-list
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.201 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.160.201 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1qW5we-0001LY-45
Subject: [f2fs-dev] [PATCH 0/1] Add 16K Support for f2fs
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
 linux-kernel@vger.kernel.org, Daniel Rosenberg <drosen@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

F2fs filesystems currently have two large restrictions around block size.
The block size must equal the page size, and the block size must be 4096.

The following patch, along with the associated f2fs-tools patch set, relax the
latter restriction, allowing you to use 16K block size f2fs on a 16K page size
system. It does not allow mounting 4K block size f2fs on a 16k page system.

Doing that would require a lot more work, requiring a refactor of all block
sized struct similar to the userspace patches, as well as handling the block
reading/writing at sub page boundaries. As far as I know, buffer_heads are
still the main way this is handled in other filesystems. Is there a different
option there? I know there's a general desire to move away from buffer_heads,
but I don't know of any replacements covering that use case. And it would feel
a bit silly to not be able to read older filesystems from a 16k system...

Daniel Rosenberg (1):
  ANDROID: f2fs: Support Block Size == Page Size

 fs/f2fs/data.c          |  2 +-
 fs/f2fs/node.c          |  2 +-
 fs/f2fs/super.c         |  4 +--
 include/linux/f2fs_fs.h | 69 ++++++++++++++++++++++++-----------------
 4 files changed, 45 insertions(+), 32 deletions(-)


base-commit: 0cc81b1ad51287847e494e055e5d3426f95e7921
-- 
2.41.0.694.ge786442a9b-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
