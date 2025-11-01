Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 27716C27EAD
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 01 Nov 2025 13:57:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AeKmeDWz+TekgvPEKdR/I65V1vqlcCMt3KOSU8nq+YU=; b=QoVR/1v1xkrjeTosQaAdeluUyi
	uY9zUrYCmAlnVycaXVfm7t961qy+tLI65Z0Eo9CbaQ59iabMtpwa3GU/JXzd1+tH6QNPxye5GvBN0
	U9mMRG2qbbnW+N9BXbwXJ+Cnj1ec3AQ0dTBs6moGi921t96d0R8tnfXZXpkerakKSr34=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vFBA8-0002Wi-GM;
	Sat, 01 Nov 2025 12:56:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlatistiv@gmail.com>) id 1vFBA6-0002WO-E8
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 01 Nov 2025 12:56:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wGVmb1DJ+yAOnx5AlPbC58cKdV6J05JG0r5lqYgWdxk=; b=devnb8c05Y34Nulg4fr+KNbt9n
 d0BWdYa63XPXCjEuayFN35W014sdoWsWKlFCE4D6BkdQtpamFdEIzn/bLt8/LosA1p46uJkg6yC+M
 dyvRUPhxjuipwlJN0PdkYUsWUHc71Ja8ikqPx3CT0bYGr2AqveQXu/rEVuqCTdH3Rrk4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=wGVmb1DJ+yAOnx5AlPbC58cKdV6J05JG0r5lqYgWdxk=; b=A
 3Vo1tX34rtLr3szQqNnERVBGYDhW8VY+PngW6zLx30JRLdEAh8xIGJAutIvzr3j3jt4S631416VVo
 iFYViIgspYrr6P79Yjke7rFPDM8VyEyE15fdRh1ELgMR9v+BlGAHHCAt5JlaGYpMCEP7A3EsrXbhR
 p6Bk+t7oGZ8ZDG3Q=;
Received: from mail-wm1-f51.google.com ([209.85.128.51])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vFBA6-0008P4-Mx for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 01 Nov 2025 12:56:55 +0000
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-475dd559b0bso40206875e9.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 01 Nov 2025 05:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762001803; x=1762606603; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wGVmb1DJ+yAOnx5AlPbC58cKdV6J05JG0r5lqYgWdxk=;
 b=Skqts4Q9VSosO2h/MUBPfVgSKrQfNrRjiL+kYq7jKUBF1LGrxT7n89YFB7j7lwYtEE
 5usQYstebZzNJvPaIFK+f62fvwd1v7CYCELe3msjchXTzc6uXfu1t/cwjWnjLiDsgRft
 4Co4QvAs4MmFuF8n2vZFqEd78d/TXhlRt3gXPdvUIuNh+UCu7QcMuSpsBMGiDGG/OP/8
 7YaX4EmshAxqZ8kR7w5YBVCB3zXYQns7Irzk0anAPd57vObJ/xiDgM5cjCdKtnX/AIkp
 SnA7Bd9v980kM69ap5IR1626+HKAoDNxu6S3lo8xPXEtXt9Ti1xoWSCpkpvrcknCZoh6
 4hvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762001803; x=1762606603;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wGVmb1DJ+yAOnx5AlPbC58cKdV6J05JG0r5lqYgWdxk=;
 b=gMtsToGmuy6eaR/yMuPmbUdqWseHBAxxLxge74v67ThFGm6LQ9qIn6+mI7ttoBTHue
 IVK3gTqvbGO1WW3PJHNchh8BmdrmIPmN9Kj5mGVMYR4B4IXDlF9qyIUAaKYH2Q7W+H7D
 tttS9gN9lV4+5EQsP3O6HysoKxVCVcruvXuoP0xxbZptirgSccw4sb8wL2zOKDbA96i5
 CpBDUNvDxaM021nLKVIK/Zy5Toc9CtoYoyw1l0H8GW9o+95JoaacpA84GL1lyztl5Zqv
 PRIYgRD4AM8ONStHu1e0tjbk7PT5wdTjVL1nn7xQAQd18kqFuk7FsmlmCF+h38NhHFgI
 +c6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAIuWJY1wZ/WwOZJcmrYQNLSt74EPfC7TbLz23df9GW3PbbvJT026hPx+Qe5fC+PfgHWfSXh5iT/i9WWPZl7p3@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzOdcoJZF92RNHuYRTEw0JIAuZr+CcO1sqi7KGRTq/o/A7AcjS8
 lrnlYQp7pbkdLSIY5Ero4fUqkUpcH7KIdijX1eNe00wmbbANwEE4T/+9
X-Gm-Gg: ASbGncskzk6JXFt0kKF5EA1IfqxONQ/jEDAlaB8/NPUe0xl/tqvDieywqL3vaQS1r6N
 ScnCQVS6EiaCVdOauPlTSKRvIL6X8TmP+Atn/YPUtQIPPgEOsYRkFLMNme5TUnKRt/GNAt9R9nK
 MnLHRlQAQlpIbEmPIXnVPPXL+lv5jmxUu9oM8oQficUncM/fXM5m0F6ethObE/0KOQ6zacRpyFX
 g6FsuJEeouxu9mKiSMf/47Ws0qNculLGhoxg4kjSw1q7Gh43wTM2acNwbF4AQ6B9pa59ffQVc0F
 2BzGdVDN37GrH3za/wuyI2WcTcIBjx7rucM//0/fdox72WgFGCEud83sViuIFpoWZXAwdQ/I9iv
 v6vrmAdl9HfxqBv94MNMSQDXJEGeTVI730NPCD/ubPVdkH3ekY//DkA4rguDExUTCuIHBS3VtrE
 Iim31poE7i9DioZyjun4nlPg==
X-Google-Smtp-Source: AGHT+IF67+MB9gNMQj44RfGkbRUyMVSRr8JGv/Vb3x0BucDfXENO6/yD2+Bv+4xEmQGnVJYrNs47/g==
X-Received: by 2002:a05:600c:444b:b0:477:c71:1fc1 with SMTP id
 5b1f17b1804b1-477308b7d81mr67818705e9.19.1762001802876; 
 Sat, 01 Nov 2025 05:56:42 -0700 (PDT)
Received: from localhost.localdomain ([46.10.223.24])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429c13f2b5asm8827647f8f.40.2025.11.01.05.56.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Nov 2025 05:56:42 -0700 (PDT)
From: "Nikola Z. Ivanov" <zlatistiv@gmail.com>
To: jaegeuk@kernel.org, chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Date: Sat,  1 Nov 2025 14:56:14 +0200
Message-ID: <cover.1761993022.git.zlatistiv@gmail.com>
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
 1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
 [46.10.223.24 listed in dnsbl-2.uceprotect.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [zlatistiv(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.51 listed in wl.mailspike.net]
X-Headers-End: 1vFBA6-0008P4-Mx
Subject: [f2fs-dev] [PATCH v2 0/2] f2fs: Add sanity checks before unlinking
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
- Add sanity check in sanity_check_inode() and remove it from f2fs_iget().
  as suggested by Chao Yu in order to detect on-disk corruption early.
https://lore.kernel.org/linux-f2fs-devel/d4b7c03c-6554-4407-b823-aecfcdf7dc3f@kernel.org/T/#t

Nikola Z. Ivanov (2):
  f2fs: Rename f2fs_unlink exit label
  f2fs: Add sanity checks before unlinking and loading  inodes

 fs/f2fs/inode.c | 10 ++++++++++
 fs/f2fs/namei.c | 27 +++++++++++++++++----------
 2 files changed, 27 insertions(+), 10 deletions(-)

-- 
2.51.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
