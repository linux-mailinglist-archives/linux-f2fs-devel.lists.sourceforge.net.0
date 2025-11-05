Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C5AB6C354C3
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 05 Nov 2025 12:10:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vQso6oulfQP9X66bPZ0ix+aS0kUJB/6pxHb+F3z529A=; b=Tcx/TOpZbnvyw3oG4iYzoq/kID
	kGNKmLU2n7iSSeQZZJvVPIDj96mivXnhHWiuDumcXJX5CP8StKq+JGKy+fwWoqaJdLPpqmooJ1Slf
	9WwUh4QOeT+o5opD2G1E7g6lX9jWFiXNddyboepJDyUuxLZ0pBf3lcb2+8bTmW++mnC4=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vGbP0-0004fd-ON;
	Wed, 05 Nov 2025 11:10:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlatistiv@gmail.com>) id 1vGbOz-0004fU-Ee
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Nov 2025 11:10:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fNljkoDjcu+DjVHFlm8hZRjkzJt0yBrV07jD/iI+rkk=; b=G80sHJfs182JdLJ202rQmo0v4z
 hq+K5KoNcKYpbTvLoPOIOlgWTAfy2YKKLbt4XweBFp15TlZ80s2JbXzUYmvCsyzbpGWiU2XEjqMHQ
 fQ8YccBO/ubvj2Y5hVELRk94rgswX2pasCdksr0RARmoLrMc15OisIYbDZabeN6lGvEY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=fNljkoDjcu+DjVHFlm8hZRjkzJt0yBrV07jD/iI+rkk=; b=K
 2I1/UyGodE3yfsUbi2fegezgK7XC5QoB94z6Dxa4syym8fncRUmItkepnTPpzk54omVf4Wln6Icgi
 Gfsp+AfqngISIVrIsPq1afk1pE42rqfap6TdIsVhgu1Ll36sW6DeKyhXM0jjYwascvyz1vZapaJEF
 uv3uYqNyytwYpfAs=;
Received: from mail-wm1-f41.google.com ([209.85.128.41])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vGbOx-0005FU-TX for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Nov 2025 11:10:08 +0000
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4711810948aso46566475e9.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 05 Nov 2025 03:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762340996; x=1762945796; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fNljkoDjcu+DjVHFlm8hZRjkzJt0yBrV07jD/iI+rkk=;
 b=Ph/gg27+1zoZ7OsmOZb7VfHos3yLC+zQ8PilQxTHa3U/TEFfeXylBsnAEf/jCQF37T
 aCknh3pfmWhbFL1vZE6dHzOumvSZkzfN5AGk2nq0Kv6+dd3CZ1cyipqeKtT/vshnDBat
 665K1l2otdjZSgPK7eXwj2C3AfQiifHRNn4GJS+RIFpkLimal1rWaKbfYUz+DSFMUNH+
 mTdetjtZQ3IoCc22lyeda0pMn9pONtHpJJFYfFnnvzmaT/3VxaziJE2H9q1YeqlS9Geo
 8K7JLpVP19yPc3QuMOUEvmMTeMSXKpBRmxVQ0zvV5rwPM4WBP9bMo+oATMQ9uTrCxm8z
 LJJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762340996; x=1762945796;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fNljkoDjcu+DjVHFlm8hZRjkzJt0yBrV07jD/iI+rkk=;
 b=DbtcJHl9tn0rQ9Zfxj3ygMTAZ++eojtoaAlW4oxpR4dmo7GqPdZMFD0tMmE0xWr3xC
 Yex4dInmTrG+HFkVPGGC6Xv7vdgUBj28CD7OoLrpn7UuifGO2flh1pUiRz8hNtoxhNwa
 +TECBHAH2j8bfwvGpSEgXxEoDw0DMhsnDS+kicbvxRUPrHll+6yPyWYZ/gMjworQp2jC
 5HlhHDQaJuOCVf0BOOrPubaTsNSzYAMBSpiV08FCmlOZwAD/l93XJQv8gT9DpOzLS9ND
 0MDf+FNZkc4eAMD2r92Qd9lmPY3u5erU4jsyuJ1X60UvNqsrq6aKVICv9EYAq8Gh8gLs
 7OVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFc7KCkcFCNZ7m8GpR+5Rm/WeH5RS6ltm75F2Mf/M845KgEVpd6XS7u9NGUlV3iuKbwETZ1rMoEig79w3aJCCd@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzcIw+omJeo//kwghQnkXhRaxELj2yK0xUAJ1x9moiGQ910AYwS
 jv0ixBn85e/QfZ+UuRep2NgY7vPpBzz/YHZaDxexMnJlM2aBt7dzxQZo
X-Gm-Gg: ASbGncsyY49E9hTiDpF6RzvxbnW3ls3FopCRrY4KYzG9vsyh3cczxPW/veY8qSEprh/
 wqdmcUwaWLkf0OuwDtLYwAvT8//s2lJBlhBcCXKlOnogEvzJNck7LL0rNKDqPxOs9nZb9v1Fpx8
 58Q20Iyv4MIHZW+S9/1YSJx6jVK/E3bkN1OsvDqesVqXsr2r0KnvrwWKPPXhGCrQz5QRTSWnG7B
 aOrJKjHnYGEk0jRcme6zh/ro/hdyBGntvDbQ3BiK9tB8BGcH/bcQ5v2Dc2vWY9iPjYAaVUVLNh5
 AmAmGqmXfo1rsBSz6kBZLbAM25E3ck5jhf4XIqgcDWgR/0aeMQ872Ki8zehoTu5V5cSOuJr7CXu
 etVL29MON480970d9g3mABVmUP/W7nrw5w7ctf/2WOD6cqHW7HHwZQoPSZPq/ldVydi2bs6U4Sy
 OfSD5wMl4cfAM=
X-Google-Smtp-Source: AGHT+IF2UxLPAaLgLuHgbIyHft9aPDsEhxD/4ZlCe6k4ng4kCQPn8kS2+g0dONw0r1xUVMNFLgkTpw==
X-Received: by 2002:a05:600d:8381:b0:46e:376c:b1f0 with SMTP id
 5b1f17b1804b1-4775ce9bc74mr15632625e9.7.1762340996155; 
 Wed, 05 Nov 2025 03:09:56 -0800 (PST)
Received: from localhost.localdomain ([46.10.223.24])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477558c42adsm39728415e9.4.2025.11.05.03.09.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Nov 2025 03:09:55 -0800 (PST)
From: "Nikola Z. Ivanov" <zlatistiv@gmail.com>
To: jaegeuk@kernel.org, chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Date: Wed,  5 Nov 2025 13:09:41 +0200
Message-ID: <cover.1762339963.git.zlatistiv@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This series is provoked by syzbot warnings caused by
 corrupted
 directory inode with i_nlink == 1 that passes the initial sanity check which
 will only mark the filesystem as corrupted in case i_nlink = [...] 
 Content analysis details:   (0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [zlatistiv(at)gmail.com]
 1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
 [46.10.223.24 listed in dnsbl-2.uceprotect.net]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.41 listed in wl.mailspike.net]
X-Headers-End: 1vGbOx-0005FU-TX
Subject: [f2fs-dev] [PATCH v4 0/2] f2fs: Add sanity checks before unlinking
 and loading inodes
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
Cc: david.hunter.linux@gmail.com, linux-kernel@vger.kernel.org,
 khalid@kernel.org, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org, stable@kernel.org,
 "Nikola Z. Ivanov" <zlatistiv@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This series is provoked by syzbot warnings caused by corrupted directory
inode with i_nlink == 1 that passes the initial sanity check which will
only mark the filesystem as corrupted in case i_nlink == 0.

Tests:
- fio/fsmark parallel create/unlink on VM with f2fs root filesystem.
- syzbot

Changelog:
  Changes from v1:
  - Rename exit label in f2fs_unlink().
  - Add sanity check in sanity_check_inode() and remove it from f2fs_iget()
    as suggested by Chao Yu in order to detect on-disk corruption early.
  https://lore.kernel.org/linux-f2fs-devel/d4b7c03c-6554-4407-b823-aecfcdf7dc3f@kernel.org/T/#t

  Changes from v2:
  - Remove i_nlink == 0 check from sanity_check_inode.
  - Wrap i_nlink == 1 in unlikely() marco.
  https://lore.kernel.org/linux-f2fs-devel/1f519357-a489-41fe-8159-a8e319aedd17@kernel.org/T/#u

  Changes from v3:
  - Replace F2FS_I_SB(inode) with already obtained f2fs_sb_info pointer.
  https://lore.kernel.org/linux-f2fs-devel/4de88613-54a2-4ef3-9b56-7963cd3e42e6@kernel.org/T/#u

Nikola Z. Ivanov (2):
  f2fs: Rename f2fs_unlink exit label
  f2fs: Add sanity checks before unlinking and loading  inodes

 fs/f2fs/inode.c |  6 ++++++
 fs/f2fs/namei.c | 29 ++++++++++++++++++-----------
 2 files changed, 24 insertions(+), 11 deletions(-)

-- 
2.51.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
