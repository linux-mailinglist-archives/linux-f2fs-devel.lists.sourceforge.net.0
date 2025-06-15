Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EFBADA257
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 15 Jun 2025 17:34:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Mime-Version:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NgyBmrdMvZr9xGhoMuQR8od0JWVXvfSb+EswOmJqFqI=; b=h5d3CoK3kfzv9VeUhtZoH0P4yu
	aWsAO+/Gi/cRvgR7iHcA9PozOCRjqtoI1jszDZZy7JINBM4K4b0s3B8BMB//w0t/ZMYBUJ1KmLp5+
	+HCYQW80OD1zdaoOZHpoDllFg9TkTYqNf3X2akRukqWFvH0qMCQsVvu74Egw7oYb6+hM=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uQpNQ-0007mE-C7;
	Sun, 15 Jun 2025 15:34:32 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <34NtOaAcKAB05ANEE779HH9E7.5HF@flex--chullee.bounces.google.com>)
 id 1uQpNO-0007m2-Uh for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 15 Jun 2025 15:34:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 Mime-Version:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UR3YO6IJNXwAiCaTSTqLMXcQDKFP4AYLg6y+cj2JEpE=; b=mjxpdpS3XINjSq5ykk3SjCd8NS
 vq/AQ3hFtLmRKW6Z1KKDm34Zi0zc32l2FtufdfUhcNgjrDLFsgEPinz+4i2vcP48BrF+H2SVevEGV
 OdcaXwfKsGv++8WZluRQvMUUw/bs9jFUumb/Mg0oxUW1F4aIpq9G0BxSrWGUD2P7MggQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=UR3YO6IJNXwAiCaTSTqLMXcQDKFP4AYLg6y+cj2JEpE=; b=V
 PIYnkruOkrXXZJNi0SEh0YR1FIbzWM1J6beGrlit7mnQzTK3xbpo7PpTAh5pcirThcdpsAeboi3HT
 /hG5ssDbDwXTchTfhaIr92eBv4zK8HMNyuxz3qAMnzX3TdcF9/9uSdin9njC18yjKf0IQogH/F7u7
 mD9R0zWYpfgGV99E=;
Received: from mail-ua1-f73.google.com ([209.85.222.73])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uQpNO-00062g-L8 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 15 Jun 2025 15:34:30 +0000
Received: by mail-ua1-f73.google.com with SMTP id
 a1e0cc1a2514c-87ec971f51fso3333615241.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 15 Jun 2025 08:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1750001660; x=1750606460;
 darn=lists.sourceforge.net; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=UR3YO6IJNXwAiCaTSTqLMXcQDKFP4AYLg6y+cj2JEpE=;
 b=dwZYzAOICnXuq5KVr2DoIlVERqSgDWPp+hZltZ9SPwZGlWRBjJrSDVnZXrw1K03u6C
 xL53qsv5vD8Ep1z9xZsjXYkxRPkOYGYPqHR5eLdICb3rbHVjq9myPuEnIW0ZtEVZ4Cbh
 yWfTgl1ih6fRpDeYU+F5K9lELQrDqn2zuiQqAEiG1tUvlu07lTKXbJaBlsRBvOlvjowp
 llZorR8CV0MhX0VNaGj6p0JgPkiFjWytpuoKvURMUuwcDb811nK/2ZxmoiJXJuT5ofO0
 qVdAHsJDNQ6qb1iL2WFmzp89IWKqiMLbHpXE96kl9oeXNVeeLdqF502yBvbfJGsuG6z8
 4LoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750001660; x=1750606460;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UR3YO6IJNXwAiCaTSTqLMXcQDKFP4AYLg6y+cj2JEpE=;
 b=m7I4yQ+4LjtD+IJmvZAxSPofmRqiDOfm8yeQ2iS2427IPV+SAV1ZBCCRniGHaEqdPa
 f97FuaQRwfAaqPBCnZPLNCfDflBRWK5PFOKkPQpQaNZzzvUIFBzyj17DGBP67GcLpvOs
 fJeD9L8Le3beCUMAnWYY7rWu1r3DvE4vCPKO58SUoHt7RlYdE39UO4FnxdaCWLjy3xLD
 n/leY2iYnuhWDx3EYJopfUX+h4qhKh77Kev3o2vzhYU7aXsV2fEwMc3m8aECTaJh3msv
 8LGevwbnoEtF2NZ5UPPhwQpkJXFx0R13ciirWeDT/U5PmQILoFuLAsrXHtfzzrEB8oF4
 /q5Q==
X-Gm-Message-State: AOJu0Yykx+BcVNJ5g9M+XipAzOmsNdeu7OSvyXDztojCHZmHoPsek1bc
 7EKQr+yZOKJy+jaNek53BRZyeB8vVzkGB0/sakf8bA2Khb/NVLI9h8yzwHN6cclCyYl0s7Djq7M
 jpkr31SvedA==
X-Google-Smtp-Source: AGHT+IHFKlPrsyuLU2otzkeifuA41K4s407eoZlZV+tF0WGi4ybcmJCreXaVMG+pV3VRtGXYuLNCx8xK94nQ
X-Received: from pgbfq9.prod.google.com ([2002:a05:6a02:2989:b0:b2f:1e09:528b])
 (user=chullee job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:c781:b0:21c:e870:d77
 with SMTP id adf61e73a8af0-21fbd52a516mr9032870637.15.1749998560182; Sun, 15
 Jun 2025 07:42:40 -0700 (PDT)
Date: Sun, 15 Jun 2025 07:42:33 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250615144235.1836469-1-chullee@google.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
X-Spam-Score: -7.7 (-------)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
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
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.73 listed in wl.mailspike.net]
X-Headers-End: 1uQpNO-00062g-L8
Subject: [f2fs-dev] [PATCH v2 0/2] f2fs: Fix DIO flags and add ioprio hint
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

---
Changes in v2:
 - f2fs: Apply bio flags to direct I/O
   - Changed f2fs_io_flags() to accept a direct inode pointer
 - f2fs: use ioprio hint for hot and pinned files
   - Removed an unnecessary f2fs_mark_inode_dirty_sync() call

Daniel Lee (2):
  f2fs: Apply bio flags to direct I/O
  f2fs: use ioprio hint for hot and pinned files

 fs/f2fs/data.c  | 10 +++++-----
 fs/f2fs/f2fs.h  | 20 ++++++++++++++++++++
 fs/f2fs/file.c  | 14 ++++++++++++++
 fs/f2fs/namei.c | 11 +++++++----
 4 files changed, 46 insertions(+), 9 deletions(-)

-- 
2.50.0.rc1.591.g9c95f17f64-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
