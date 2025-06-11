Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A33BAAD6459
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Jun 2025 02:08:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Mime-Version:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hKhR0ntLLDu3vIKDP3jxzX5iRfeEfsvO010+tDetrvU=; b=cX/zw/i5DKpXJ52Ca8VQAcQejB
	F6zp7F8doyE3kLBev+XAlJe87U6MmJO8dgsEHVNmCV8u8oh+Y8qRuexlU/rOjG3jzWXBtMpHCb7ll
	H7kQrlQpJjcLkyWTLAM/EXVj01RpwDUgQbta0qLIn/ONffQr4KODwc522d4nEvzdeH3Y=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uPVTs-0006Ur-Ik;
	Thu, 12 Jun 2025 00:07:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3dhNKaAcKAA8rw900ttv33v0t.r31@flex--chullee.bounces.google.com>)
 id 1uPVTr-0006Uh-QE for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Jun 2025 00:07:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 Mime-Version:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8F2eTmM0CFaL0WejT35gjVg6cCl6giv4q15D+/NODLY=; b=Zn72KkkTco44y5K4mLn2EX6496
 9OTMcNslGbF1ZOiJJCUdWTITEDlgr99sCAQjk3c0krhq9WJ3fBMNte1w6P/POjPi/yWJAScs4mPpF
 PtmawiBd1WhZYQDFzwaz5IVfSJe1BK/9jJCzknGnweGbzwr4vjqPzvrkZmynnhSgkWfA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=8F2eTmM0CFaL0WejT35gjVg6cCl6giv4q15D+/NODLY=; b=R
 aZ56Wwqr+ij1tDtFo1rXnIfnGKeSPHcU1jta9Z3JGSGiEzQwQs02aFPmyhLAbCmUXU/s77c+109Bz
 CMBYbQH1A+NPinFegWWKDm+td6fuFIodZVsTd0LOhbnBC7vSVcbb7frdyVu+5acjkZ5zpdJUitnMM
 NeYC0eiJQJSPcOFs=;
Received: from mail-il1-f202.google.com ([209.85.166.202])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uPVTq-0005bS-Kw for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Jun 2025 00:07:43 +0000
Received: by mail-il1-f202.google.com with SMTP id
 e9e14a558f8ab-3ddbfe1fc8fso11168145ab.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 11 Jun 2025 17:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1749686852; x=1750291652;
 darn=lists.sourceforge.net; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=8F2eTmM0CFaL0WejT35gjVg6cCl6giv4q15D+/NODLY=;
 b=fIzlFbtfl6UQh/Uetb3sEB7f/zEzGlh3wch1sLFJhTDCWuFk3xBkLZiMleYigkeNx0
 TjO0mHVqAk1YlM8T1Cs/1+8rR8RGrHH8d1Jxj103IrZ+mYoboSt+olwqv/ABEEqXaAMe
 jXK1yBHBeA+LB2kNSEqm95/hz3zxXEd1/Tzji0zrKo5AfckVphcZvl38qUg4ksX/gCX2
 qWhf9VXzg/mvvjdG/WATaHBaiBQZ80mlVwgOFmy/q68pGw3o3RxyN2Bse9G1zgEv+eo8
 ndKzq2BI0PfnwU8co3pXPVlS0eIhzNnyS0ty8w+Vo4t+v0+6R3y3JpWPk1uxIQmag2kI
 1Hfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749686852; x=1750291652;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8F2eTmM0CFaL0WejT35gjVg6cCl6giv4q15D+/NODLY=;
 b=VaMaYEcmJqsZBzCS3iPOQaIyWqIa4wl1ViK9V+4buxL9UKdWn8Xwxl2Z8JKxVCYGGp
 ZxRCsL0MTZt4gcUSKavFsa3YIkHKlET8drNgf+RbER0T6v3pXZlPB+/7g0WEBr112DlY
 wHDGY5m5Ghyhfd1Q/otURKT1qPVKlulKPvjMIGFYtfGpOeqchivCu3cz8YaOet3FWqSn
 Br/jaTkmdIohQgAKo04xasZbJFC5nMh9evVhoBRIZB0hKAecy8LjUOgIlcrOgScFBc8l
 e1RcS4XF5n4Yx0A7jtljNQ/tGeF3YyLNf6cCOJj2ylI2ZXZGyaOQYZeqh8QpmEuD24nb
 DJeg==
X-Gm-Message-State: AOJu0YycxfJ5EPV7WxEnS6sC8LYFesLVb/lADZIp+XHJkRsXeLHbSH9c
 UJ7E05RrIOlm+qWpiCyelZWHCfPOg+u5zI+niK+DfX7ECapNx6D08n+OjKbCJy70tffsOPgyewK
 Zx54g6VBQ1w==
X-Google-Smtp-Source: AGHT+IE2P96bQ8qW6lzT7npZCX2BJTTa35jKcQemEzhPtoqN4Wx+tsO3GF/ofgV3JItkCYvq7q3XVdnRpv7n
X-Received: from pjbpq18.prod.google.com ([2002:a17:90b:3d92:b0:2e0:915d:d594])
 (user=chullee job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90a:d64f:b0:311:f99e:7f51
 with SMTP id 98e67ed59e1d1-313af1ac76bmr7951669a91.18.1749685110646; Wed, 11
 Jun 2025 16:38:30 -0700 (PDT)
Date: Wed, 11 Jun 2025 16:37:04 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611233706.572784-1-chullee@google.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
X-Spam-Score: -7.7 (-------)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The first patch corrects an issue where Direct I/O (DIO)
 writes
 ignore bio flag hints (e.g., F2FS_IOPRIO_WRITE for REQ_PRIO), making them
 inconsistent with buffered I/O. The second patch is to set an I/O priority
 hint for hot files on creation and pinned files by default. 
 Content analysis details:   (-7.7 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -7.5 USER_IN_DEF_DKIM_WL From: address is in the default DKIM welcome-list
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.202 listed in wl.mailspike.net]
X-Headers-End: 1uPVTq-0005bS-Kw
Subject: [f2fs-dev] [PATCH 0/2] f2fs: Fix DIO flags and add ioprio hint
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
From: Daniel Lee via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Daniel Lee <chullee@google.com>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The first patch corrects an issue where Direct I/O (DIO) writes ignore
bio flag hints (e.g., F2FS_IOPRIO_WRITE for REQ_PRIO),
making them inconsistent with buffered I/O.

The second patch is to set an I/O priority hint for hot files on creation
and pinned files by default.

Daniel Lee (2):
  f2fs: Apply bio flags to direct I/O
  f2fs: use ioprio hint for hot and pinned files

 fs/f2fs/data.c  |  8 ++++----
 fs/f2fs/f2fs.h  | 23 +++++++++++++++++++++++
 fs/f2fs/file.c  | 15 +++++++++++++++
 fs/f2fs/namei.c | 11 +++++++----
 4 files changed, 49 insertions(+), 8 deletions(-)

-- 
2.50.0.rc1.591.g9c95f17f64-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
