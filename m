Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C2117B2DCCD
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Aug 2025 14:43:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OMuTdn+bQ5xkCZO643G14NV5zHjI2mPtvAnuB5g0lAg=; b=BSV/2w1mRk9tQ9Zu5UpUFxcOMM
	QsSr8w2c6ensFg8tNUXKfMK+ph4LH1acLqI61ro0afAlHBh29XsVKWN0n6uZK0dC1VWfUfRgmjyNY
	BRNHKpbaSRXvyxWcDuDY9WnyVm8vJ4BAYlb24iz+5XWyktoou/NGPn4c9FvqaeCvWsOA=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uoi9d-0003Wg-5G;
	Wed, 20 Aug 2025 12:43:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong2021@gmail.com>) id 1uoi9b-0003Wa-Vj
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Aug 2025 12:42:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kTPwXJ3qCcFhex9A4sUA0CqgY4/IeTT0ZRQPyq60W9o=; b=gdXagEK6s9Ve9stzckje6HQOFa
 +iXexMHOOVGwNvdDCpt0hSs6zuOpgQNfy+Hg7kRVDfVbY7L17oMzMn7zhUMLb6tcC+x58ftpp31VR
 iC78McXNygl73Y37WnBrYxSP/Nc1bA0TAVJ4yMNudDekiGn9jfYBj9YEJ9EIs3aLanEQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=kTPwXJ3qCcFhex9A4sUA0CqgY4/IeTT0ZRQPyq60W9o=; b=X
 0rSHACfYcPWdKtxVYMtEQZUcJgxk6a0CeJUBxszl/KNDmmpSSUW6kTowdYjJD5tkKsq5Ovler7Szo
 1T7emGbtTrFrXBj4LxmBXgYek3XpwAC6WFUhjyyS+q3ZpWzKNySEFuNxLiuFWPjZINVg9b4/HAuED
 9aO+D7i6RLQAnvFE=;
Received: from mail-pg1-f172.google.com ([209.85.215.172])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uoi9b-0003l8-HA for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Aug 2025 12:42:59 +0000
Received: by mail-pg1-f172.google.com with SMTP id
 41be03b00d2f7-b4717330f9eso4587602a12.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 20 Aug 2025 05:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755693774; x=1756298574; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kTPwXJ3qCcFhex9A4sUA0CqgY4/IeTT0ZRQPyq60W9o=;
 b=JeSdSJP0jtK4TtyYrzbxl/+YujxARfrlSyiUst3HEyVWZsk0lya9mKslyECJ2a70Bu
 la1Kxn8XPsdTsog8UIE6cnEzb+Waf61NzQTSJbiuX6DW5qtCOf+1PXKium3RnTW1Sh/F
 RCnpESKQxFSrBZKYrVWpDMuYMBLB3wJsLdDhjr+d3k1y7aonJTbjA8L1UEf5hwKZx158
 LHztCib0wrUdiZAhIJCd9QcLb8Qemzj2YsBXpE+sGfmKOaYemWguw/R3ENuK4os+5cVk
 Hai/eAQCqM8AO08bS5b+Dr1qxUHgq1FCB878vCjqpu43laeMO8/OrhcFzpmUXX+mYEQO
 qz3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755693774; x=1756298574;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kTPwXJ3qCcFhex9A4sUA0CqgY4/IeTT0ZRQPyq60W9o=;
 b=lmqiO26lOpM3ONgCA4pO3moZ0A6kL6XMhcnP0oL+W2o3jqCmNkaGZ7TssPJrPtpB/F
 lcmoBNrjzXbh5J62IH0BcKrebDkUIGR2yEydkZQF66hAvo/rYcQsZiKyKtMfgQRLl69N
 fOXOaqT1HrFoP/H4zHPJFbCMLohfXlsOnwIQOHXyEUxTm82nsNneh5Wneyh1MHl0J5pY
 p6KBifWUrfijAPSXq15MF/UOcwDbHR4iM2xmsNgNA8yNKrjGi4Udwce2beSrypHsJpL5
 IChgFM+pmbiALtIXcTszB4OA77RLqUbr7VFKNHhHM2Aii00BGoQmrXKR3JXiEsTJtwr9
 hZ+A==
X-Gm-Message-State: AOJu0YwB4fgtJiAuClkoS5aTygJS4wV327uTX4VoZWV/jHQ1mFIQ/Noj
 mvvUSa+wbVAZDEyCGSbUes0atK/58bcX7DUVxBgw2PrOkuw+L8WbJlza
X-Gm-Gg: ASbGnct1qpDTwCsbVd6B8YO4vB4S3QEJH38xAQHyl5m7jrpM1IpGhcU+tZLQvw9y48U
 ojcQvJL+kLTRG9bJhbnqMJuz+29u09aEbgNLm65ETqiZKvsBdchY0gtzzZ4FxZVbCWb7ua0qYrH
 b7iY2M2FfUQHdmp4mslZ4FOlqjL0JgB5nncee4bMdu2BtytEprYBKq/MAkMKJdQo7kJTqd1AyKe
 a+CICztodLZcmAUXabTftdiUVr8f3s9ZJAjHD07ZLR8VFxUsf4DrgKNHS83xvq5yFaGvzDmPgvR
 gWLWoknwY8RI0Bf9DM3a0sAkGRZtVl6Xdg01TTSPoRdVZWNWKi5D4i+eCYP1TPcqEc0KAgnsTKd
 qT3DbVkT9xCFAebok0BQyAvL0Wys5
X-Google-Smtp-Source: AGHT+IEX8vYNA/2K59g/JHW8kB2ILMN0dbUOa8V+dN5PX2ssp+hxv9XEYuCNJHlPyU3Tgg1jpsJ11A==
X-Received: by 2002:a17:902:e750:b0:234:a139:11fb with SMTP id
 d9443c01a7336-245ef22704cmr30641305ad.27.1755693773761; 
 Wed, 20 Aug 2025 05:42:53 -0700 (PDT)
Received: from PC.mioffice.cn ([43.224.245.249])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed51b3dfsm25962545ad.142.2025.08.20.05.42.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 05:42:53 -0700 (PDT)
From: Sheng Yong <shengyong2021@gmail.com>
X-Google-Original-From: Sheng Yong <shengyong1@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Wed, 20 Aug 2025 20:42:25 +0800
Message-ID: <20250820124238.3785621-1-shengyong1@xiaomi.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
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
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [shengyong2021(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [shengyong2021(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.215.172 listed in wl.mailspike.net]
X-Headers-End: 1uoi9b-0003l8-HA
Subject: [f2fs-dev] [PATCH v3 00/13] f2fs-tools & inject.f2fs: bugfix and
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

Changes from last version are also updated in individual patch.

v3: * split original patchset into two parts
    * update manual
    * refactor inject sit/nat in journal
    * fix memleak
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
 man/inject.f2fs.8   |  43 +++-
 13 files changed, 552 insertions(+), 128 deletions(-)

-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
