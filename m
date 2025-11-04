Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 120C5C30057
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 04 Nov 2025 09:46:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FoNxpf0qjn4BmIpIY37OnvjQLy5Zal0nerh5nppKTrQ=; b=nJyfpTwk8rcAgo9gWsbrOGUwlI
	RAbSjj0J03ZdMnFczCkUV3lXPPJroDpyI5YElP3Xa6R+0dkgvyCFQePSTv/xUQzu0+1pdRDMKFthC
	PoSOGAX9Dond4qWkJeIyZLsfjVKo2Gyp2DdWUXxlc+cIvpoHemP2J49aolnCP3/iXAwI=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vGCgl-0000RV-33;
	Tue, 04 Nov 2025 08:46:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlatistiv@gmail.com>) id 1vGCgj-0000RF-5m
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Nov 2025 08:46:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RXqY7SpktVETsfwyWDIsUXpt3grfqqVeE+nZmdbKIDw=; b=UMt00zWrw1HaHFCMIxfme801GR
 6AmDrO0M32zSV9j3p8bPu0kBzTfJa2mfZvnCHjhGv8Mh5UOBnUYliJ/bhHMeG8Xeai96QlnQidfhC
 YZJVa+ysRiJlJn4ygxHPdUKJxeq5coI2vTQM+kVvYkNlAdJeZgReFX7tcGHnzngzmI50=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=RXqY7SpktVETsfwyWDIsUXpt3grfqqVeE+nZmdbKIDw=; b=c
 DwAZoidlHDWCq0O8gDnP4+LtJoCZJ4WeIR7SSKB9idJ4FUD9iu1JZau6TulBUq7Erye2B8IEU9IdJ
 e1Gp9/Qv/7PWmuari9Of7IrvRe1MG5Hn0LfTPZnVi9RA2I/8sYH4HFaml5zFTbjX9tnHiwkY9U5Of
 kO9sQmYLQuOtbP1Q=;
Received: from mail-wm1-f54.google.com ([209.85.128.54])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vGCgj-0007Lo-Aw for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Nov 2025 08:46:49 +0000
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-477442b1de0so16225675e9.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 04 Nov 2025 00:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762245998; x=1762850798; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RXqY7SpktVETsfwyWDIsUXpt3grfqqVeE+nZmdbKIDw=;
 b=IflfGQILmOtl3uuDBZaiz5SbyhRH1gXGC8fmnd72N+ZVRdlDzrebKygfIwOoZ7PANI
 Xpo63c85SnunU38B/gRFlk3mt7slCrQps3G3zZOyWKkex9fqVuc3r2FLb1d65FOIDUul
 shSxp5kNOHsNVNAFgF+7A56SZdPnggzIsrI+LIGyyZpW1R7MiHwIcGlXT/nHSB3cTQmv
 ePN5tMgvAvk2FDVVg2781Uj/8ymE+3TuMAlVnOg6CPGhKDqAXlnGhxd++9b38BJuEzVA
 8hlnZIrffiFZy5DQBE2bT68Eo1Xz8/jGbfDWvSTS6L2PdKjq5BtAUP7BN5VZpGCOIjgc
 ZgAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762245998; x=1762850798;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RXqY7SpktVETsfwyWDIsUXpt3grfqqVeE+nZmdbKIDw=;
 b=DllKOGi3X6m8YbwhAqoQPOHZO7v7sYcxjgRZZ34bDxk/FcmgBev/feJJFdMk+t+3+C
 e1Z0fx7zMCotEl3b0WbHP9cFqXlqCTefzyAwXxk5mgtFq00xTKcNuWr6wrBOkmbmJoZy
 vKKsKpdvz1cTg3HsADhxUGC8tn76kJzVfJlbaG60CzIWXNuo3LAlCildHJi93W09vu3x
 4K/4fw87Iqtusrdt0RGloFGMzb6UvFQvaD0ZQZ9kv3IEBvOV+BTlyUuWYltyTJh+dx8K
 2XJw7NiIh2VLqbtgHyPTVXLsNUTntG/xQDKYS6EerjYIDtL11VGYPO/QCBRSvb8KWZgb
 a3dQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzvfKKRNAJL2z9nODh6oJwd9c0B0Guc1Ocz3qqNgG6q0JgUr762PC9HGZUvRVBmI5oe2mh80qdUyIFtnO1WSor@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yy1vcaGsjyWqzg3W1134FC4AMvV13X1gtjMVg1DGexthKCSXxFL
 3ENb3FQE0UZjiIKMd2KvSD8utd6Yz5sbpB7+NVXLl5ZpchX6Qkmyi6w/
X-Gm-Gg: ASbGnctVMqTnWyjCRoENjiFhZhWlNHcEjJmd+FD3+5jqXqQDIuO+bK2DdjroLvl53VG
 iJoIKUE7jZVUBGt3A5DsCnIeYKeKT4ecPCiDMcqAI/VX+PLy08iAISTsqo8x50xhAVYkvym7dQm
 PCqwT6Ohg9+kRbQLUWQAiCXIwbr+y/PJo1S71PDUiQ1E2P6NgFKJ7tRkMARnWY1sKkeDjfCFHGJ
 QHsBk3tycbDLsGQaB2/VuS3Z4JeTz8mnO/jBEirYrgbcactv2vHxVFvkps5nlDD0Mu3pY72mMXs
 y0g1gasm0aOETOuOE5949exaxbfAh5Hnb5XyexnCGd99PNcdXvSihzv7tetyNS9qJY+oHTretal
 f8hYuWBcjh2OaCOS9MPfIOryeVPXTDuRkgs/VhCE3tyuJ0WfAmDfmieh3j8uGmlyr6sh537duJj
 RwFSKPjsrB7S8=
X-Google-Smtp-Source: AGHT+IHHhUl9Ud+xEn5Gnt/Mc5v3hcvcv7RyFxR4dOxpzt0xz7nLGm9rMaCxa0muEll/2oeYbMw0sA==
X-Received: by 2002:a05:600c:5249:b0:471:1717:40f with SMTP id
 5b1f17b1804b1-4773087259amr138572865e9.22.1762245997577; 
 Tue, 04 Nov 2025 00:46:37 -0800 (PST)
Received: from localhost.localdomain ([46.10.223.24])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4773c394e33sm200375535e9.13.2025.11.04.00.46.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Nov 2025 00:46:36 -0800 (PST)
From: "Nikola Z. Ivanov" <zlatistiv@gmail.com>
To: jaegeuk@kernel.org, chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Date: Tue,  4 Nov 2025 10:46:18 +0200
Message-ID: <cover.1762184787.git.zlatistiv@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
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
 1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
 [46.10.223.24 listed in dnsbl-2.uceprotect.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [zlatistiv(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.54 listed in wl.mailspike.net]
X-Headers-End: 1vGCgj-0007Lo-Aw
Subject: [f2fs-dev] [PATCH v3 0/2] f2fs: Add sanity checks before unlinking
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
 linux-kernel-mentees@lists.linuxfoundation.org,
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

Nikola Z. Ivanov (2):
  f2fs: Rename f2fs_unlink exit label
  f2fs: Add sanity checks before unlinking and loading  inodes

 fs/f2fs/inode.c |  6 ++++++
 fs/f2fs/namei.c | 27 +++++++++++++++++----------
 2 files changed, 23 insertions(+), 10 deletions(-)

-- 
2.51.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
