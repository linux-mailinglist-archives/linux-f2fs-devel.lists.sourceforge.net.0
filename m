Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EEFB333BA
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 25 Aug 2025 03:56:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2zu5667rNZIQaMWxTwXYGOH0B0z0kmdB73OgXAIim0c=; b=JmW9/ZOD1O9Q8VWWI8NvhZIlj8
	AL7n03yvezMsgzl+6Iyv2De9klS6hTIggKwOsBrLgox1gB9VlGWZYM+Pi/cV9L4AF1ZVGctvqIOAt
	M6wfecdPucC776mAOrSIRvrRz9I+HfDsW6Q71kX7+4jCt2MEB4d4O2tGJpbevnaGJpKE=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uqMRU-00011M-Nf;
	Mon, 25 Aug 2025 01:56:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong2021@gmail.com>) id 1uqMRT-00011F-5y
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 25 Aug 2025 01:56:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hDcutHyNNk0nvGA4tUKZidh8xa3ZKGijpIHGXTnzMio=; b=hQPyZO3HI0ksz3F62AkW31v4fS
 cvzrDpRcEpWfOaIbj8jwWEzEMNMEOnGZ5tQ2gI057AWNOI7E779+gRcpsUxYU4k6YvLORfk2INUmv
 2Dul4ih2nof37zW+UTOGcr6vR/kz1DvWNy5sagiuXfQmH+ZUUhnfLLv0Eb3469sGm5JQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=hDcutHyNNk0nvGA4tUKZidh8xa3ZKGijpIHGXTnzMio=; b=c
 GWs6gXsAMTVpVFhqvZhBv+O3LrjAV26JhbISV4gSlda2LgiiezSqA0K4c7wP8jTZh0ayxRVoYFePI
 7SSJHzHUZZBLTFW9nPQiVgHEC3aKVOzUtHj+K0bqR/fbUSAQcVH5h26bw4gXHh43LDuQY3a3Se5+c
 qi+d4XFSQbj3+zQs=;
Received: from mail-pf1-f181.google.com ([209.85.210.181])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uqMRS-0002ot-I0 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 25 Aug 2025 01:56:15 +0000
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-76e6cbb991aso3284772b3a.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 24 Aug 2025 18:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756086964; x=1756691764; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hDcutHyNNk0nvGA4tUKZidh8xa3ZKGijpIHGXTnzMio=;
 b=Ii1iat5pwD381BtWTrL9j+eSJUvITzYNfg+4s47Mf7AiWYt9SuxeUGAFdM5NV/YOmp
 yHS/UIociU565JLeZpzWkpY2hsIwBRS/28ytjucb9BwU2Xz7W/LSLCqwK24WjJ0reaJg
 QeRMEJTIverwPacRzg9K5r3UxDjsheIRbCBEBAsOfY7PU2FHuaaGQi4zmjXYB3iLuerj
 xmbUZuiVqCpY3B9/43AVLgkPkfGYeaHlyNnu8//z+0MZDE1FPtOWz26MV4R4EbJCzQGa
 RtK1cB2GeNx/bcyiN1orm/x2tSxsCv2lhqh9T8dEo+Z6pMfFYnAw1dsP+NyDjqnWGTaH
 n9lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756086964; x=1756691764;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hDcutHyNNk0nvGA4tUKZidh8xa3ZKGijpIHGXTnzMio=;
 b=gVQy+eXJPQi2l8T0ljqhvPGYVqcKIj4el1O+S12iuuDfWgUa4suaoJ1Aom4V8CV0cJ
 7/wuHQi3H+F2M9NpcPJAOA7BtOw1z5W2HNxsCy3Ah+WjC0g+fbv4yWF5hn1DuH9xRmjY
 EWaZf88+9+wbHPvVjBCmzBHDg93nfHxA/U7xSBEWyKCvL75Dxe7WQqq4jQm8qg+BRdpW
 /hLRLKGRDM/LJwZenm4kMVZ7WdteqiDv1QSUKqbIsi6Huept6Vh8mQQpXvZ7zw9cM+59
 9gSdeiycwRa40SRfeNCvJgBdRgxdv37boPtL1+Yuk3iIJhWd8A4UIL8IfHwGUfE0fwqe
 8Pqg==
X-Gm-Message-State: AOJu0YxmQpAZI4nLYZfSwsL+v4SJyJIjLJYfeNveuUrDhgNah/H/s5rL
 rZfYcJDUvXK0EREXE93mXMqQ3nQP+57upFAWka0CxOZLeo3V8hD8t38z
X-Gm-Gg: ASbGnctJvkVV1YhZhmBRLhSwoRBjYRnjttXVVQnIt7l4w+Ls1qXWtmeWovLj+vxQ6Q+
 ux8csNrhzrDQazcrMFrrZl1f0krV3btcI2RqDWavOM+RlpF6dyTxLueZBN31C6GjzXg6YYIfyGB
 ftCxddeyLwTO/LEhN11On9lT2KhfXbhts6tILc9poYMzppEAnBnVt97d5E1sLaHtEDmzsXwHrz1
 wv9MKV15TElcs1EFr+2tenLTc3feZnoiRf/RO77cVMwnybYKyzAKdedAn/KhNmjFqn9dQkNuMNf
 XYKPnleo3D06NhTDVBv6i6NFP1Bdh+3q04MfZxvIQL9Yf8N7uihlNqvYMthucVxCyG/V/p2f8j7
 CgkWmQqx6mqZOsxAkuNp+SNQMxjzu0WPENhkting=
X-Google-Smtp-Source: AGHT+IGP8KCCNZ88rqffGadtQb+bhMP/0AQs9XGeRdKl/Qc1FMtvchC0Cqdapol7BP5zOt5v3Q0HaA==
X-Received: by 2002:a05:6a20:4303:b0:23f:f99d:4661 with SMTP id
 adf61e73a8af0-24340d1223emr15838713637.38.1756086962608; 
 Sun, 24 Aug 2025 18:56:02 -0700 (PDT)
Received: from PC.mioffice.cn ([43.224.245.249])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b49cb8b1989sm5147883a12.18.2025.08.24.18.56.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Aug 2025 18:56:02 -0700 (PDT)
From: Sheng Yong <shengyong2021@gmail.com>
X-Google-Original-From: Sheng Yong <shengyong1@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Mon, 25 Aug 2025 09:54:42 +0800
Message-ID: <20250825015455.3826644-1-shengyong1@xiaomi.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, all, Since we have not yet determined how to check the
 test result properly, I split patchset v2 into two parts on Chao's suggestion.
 This is the first part which contains some fixes/cleanups for f2fs-tool [...]
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [209.85.210.181 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [shengyong2021(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [shengyong2021(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.181 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uqMRS-0002ot-I0
Subject: [f2fs-dev] [PATCH v4 00/13] f2fs-tools & inject.f2fs: bugfix and
 new injections
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
Cc: shengyong1@xiaomi.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi, all,

Since we have not yet determined how to check the test result properly,
I split patchset v2 into two parts on Chao's suggestion. This is the
first part which contains some fixes/cleanups for f2fs-tools, and adds
new injections for inject.f2fs.

Changes from v3 are also updated in individual patch.

v4: * update manual page of injecting cp
v3: * split original patchset into two parts
    * update manual
    * refactor inject sit/nat in journal
    * fix memleak
    https://lore.kernel.org/linux-f2fs-devel/08ec4cbe-b140-4dc7-94a4-85d6044f4643@kernel.org
v2: * add some fix and cleanup
    * remove img.tar.gz from testcases
    * add testcases for injection
    * cleanup helpers script and simplify filter.sed and expected.in
    https://lore.kernel.org/linux-f2fs-devel/20250610123743.667183-1-shengyong1@xiaomi.com/
v1: https://lore.kernel.org/linux-f2fs-devel/20241029120956.4186731-1-shengyong@oppo.com/

Sheng Yong (13):
  fsck.f2fs: do not finish/reset zone if dry-run is true
  f2fs-tools: add option N to answer no for all questions
  f2fs-tools: cleanup {nid|segno}_in_journal
  fsck.f2fs: fix invalidate checkpoint
  dump.f2fs: print more info
  f2fs-tools: add and export lookup_sit_in_journal
  inject.f2fs: fix injecting sit/nat in journal
  inject.f2fs: fix injection on zoned device
  inject.f2fs: fix and cleanup parsing numeric options
  inject.f2fs: add members in inject_cp
  inject.f2fs: add member `feature' in inject_sb
  inject.f2fs: add members in inject_node
  inject.f2fs: add member `filename' in inject_dentry

 fsck/dump.c         |  15 +-
 fsck/f2fs.h         |  12 +-
 fsck/fsck.c         |   2 +-
 fsck/fsck.h         |   4 +-
 fsck/inject.c       | 515 ++++++++++++++++++++++++++++++++++++--------
 fsck/inject.h       |   1 +
 fsck/main.c         |  14 +-
 fsck/mount.c        |  61 ++++--
 include/f2fs_fs.h   |   1 +
 lib/libf2fs_zoned.c |   6 +-
 man/dump.f2fs.8     |   3 +
 man/fsck.f2fs.8     |   3 +
 man/inject.f2fs.8   |  46 +++-
 13 files changed, 555 insertions(+), 128 deletions(-)

-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
