Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F83663A422
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Nov 2022 10:06:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oza5v-0003sP-Sz;
	Mon, 28 Nov 2022 09:06:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qxy65535@gmail.com>) id 1oza5k-0003qQ-Rk
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Nov 2022 09:06:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=z+Rewj5p/ZFGKxaPkUSZu5AiKFXUjbdI5QMEOTU0onA=; b=O6lHLzV5aqPpm43/aUEyUu1wVw
 9n6om5lZPmc0o3J5DFuRQjIbnZYbYe4o2cCEEg1dNmC8yTfrOp1ERDieC/rMdirBmY/O3UZoMo2iX
 tvIO1/uBPXL677CLR40rQLjV9WxyT6/QSemCJH0sD/0CJPxFTMlvfE7jzpQJPdbw9m8k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=z+Rewj5p/ZFGKxaPkUSZu5AiKFXUjbdI5QMEOTU0onA=; b=L
 WRDzaIgIxKAcknFxqjej2iKJc0Y0bJWrxJphUQgfbovIEU9EAG4D6wGGZNdypcsF6BVA2nx5vnZ2G
 XXVK2o2YN7UM83nto6JCt8FAGqn131+KQV+JOZv6wQFPDqz0pxOlp8q3c8Yz6IwDb8Ss56s5nSSwC
 yKveOAgglqRIb4fk=;
Received: from mail-pf1-f174.google.com ([209.85.210.174])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oza5h-0004Ly-Ei for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Nov 2022 09:06:20 +0000
Received: by mail-pf1-f174.google.com with SMTP id c15so526850pfb.13
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 28 Nov 2022 01:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=z+Rewj5p/ZFGKxaPkUSZu5AiKFXUjbdI5QMEOTU0onA=;
 b=N1GqHq6LcBeYT2l7XL/E6WrtMRb3SC9TfF0Ms+o9jvLzFuUqGl9Vm8bAou8v2kAWsi
 poKhl+7fXJFqqqWVJbPZdfSyo1DHC2n0YX1uvnCcs41pVleSqF9bFUuwRjg+iMcF2dZP
 GtZIUs9iE3sUpienUE20MiT6D8PgcUjnHJe9x+0kxXkPI10ugjCHonoNiNup1GwPZAmL
 Og7VTNP7yhM6ueK9OzJ6Lo/zKsvmfuL4be0w9cqBnuUsBj/JAzOpTJptu0HvQDjulGbD
 i0AebW/Aj1gLuAFrI35sA04jfCmRGBEWZGegZDlTbvEmG6VUu/9aLBfQIOEXz37gJNxU
 Rzfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z+Rewj5p/ZFGKxaPkUSZu5AiKFXUjbdI5QMEOTU0onA=;
 b=78oOSAOiW4Bken3zYKptFcdbzvRVdkJa6qvFkgLI84k0ele5CauPVwaQl3V3TgFzCP
 +N6UU164An9K/v8s+BlRK5XaD9qk2j3XRFwlTM/PJQ9KfUx4neVQvbiUMLtR0PHxxbwB
 SZHwDRvdirSJU0T6jfNdpf4TiOne9Rm5Sned7pjjOQrqLiQqapxINfnIIKxbj7ajWEG1
 WVWlUGUakU69um2JhhM6BTZnljW6oc2N7XdR9mC0AoiqO/J+jITZNKZol/uOkDu+101/
 iWmZ3HwWJs+VcqgSFDtPH2M0uUiIqlahN1rLoKEN9N5ugnXci+3ffIHwUHI+3VH0/BK9
 aA1g==
X-Gm-Message-State: ANoB5pl7VJbUCTsJBAHfhbikV1QR3VqGjabuZVYtVS63BlpiokeIpZ0f
 /IyJL0NImU8fWYJ/aPbGS1DFnpqxxFEJoA==
X-Google-Smtp-Source: AA0mqf62LtEI9k6+6wMNDHKrBLNRhc6uHK7Lm6kOO+RYwr5f9qZ4w4JI2m2o2VZeO6mtsy7bcya9Qw==
X-Received: by 2002:a05:6a00:1d0c:b0:573:7b50:acb8 with SMTP id
 a12-20020a056a001d0c00b005737b50acb8mr34307462pfx.59.1669626371832; 
 Mon, 28 Nov 2022 01:06:11 -0800 (PST)
Received: from mi-HP-ProDesk-680-G4-MT.mioffice.cn ([43.224.245.252])
 by smtp.gmail.com with ESMTPSA id
 s17-20020a170902ea1100b001811a197797sm8269268plg.194.2022.11.28.01.06.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 28 Nov 2022 01:06:11 -0800 (PST)
From: qixiaoyu1 <qxy65535@gmail.com>
X-Google-Original-From: qixiaoyu1 <qixiaoyu1@xiaomi.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 28 Nov 2022 16:58:54 +0800
Message-Id: <20221128085859.5295-1-qixiaoyu1@xiaomi.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch series introduce a runtime hot/cold data
 separation method for f2fs,
 in order to improve the accuracy for data temperature classification, 
 reduce the garbage collection overhead after long- [...] 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.174 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [qxy65535[at]gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [qxy65535[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.174 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1oza5h-0004Ly-Ei
Subject: [f2fs-dev] [PATCH 0/5] Support enhanced hot/cold data separation
 for f2fs
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
Cc: xiongping1 <xiongping1@xiaomi.com>, qixiaoyu1 <qixiaoyu1@xiaomi.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch series introduce a runtime hot/cold data separation
method for f2fs, in order to improve the accuracy for data
temperature classification, reduce the garbage collection overhead
after long-term data updates.

Enhanced hot/cold data separation can record data block update
frequency as "age" of the extent per inode, and take use of the age
info to indicate better temperature type for data block allocation:
 - It record total data blocks allocated since mount;
 - When file extent has been updated, it calculate the count of data
blocks allocated since last update as the age of the extent;
 - Before the data block allocated, it search for the age info and
choose the suitable segment for allocation.

Patch 1 records total data blocks allocated since mount.

Patch 2 implements cache to manager block update frequency per inode.

Patch 3 adds age_extent_cache mount option to enable this feature only
when age_extent_cache mount option is on.

Patch 4 updates block age info during out of place update.

Patch 5 implements data block seperation with block update frequency.

Test and result:
 - Prepare: create about 30000 files
  * 3% for cold files (with cold file extension like .apk, from 3M to 10M)
  * 50% for warm files (with random file extension like .FcDxq, from 1K
to 4M)
  * 47% for hot files (with hot file extension like .db, from 1K to 256K)
 - create(5%)/random update(90%)/delete(5%) the files
  * total write amount is about 70G
  * fsync will be called for .db files, and buffered write will be used
for other files

The storage of test device is large enough(128G) so that it will not
switch to SSR mode during the test.

Benefit: dirty segment count increment reduce about 14%
 - before: Dirty +21110
 - after:  Dirty +18286

qixiaoyu1 (2):
  f2fs: update block age info during out of place update
  f2fs: implement data block seperation with block update frequency

xiongping1 (3):
  f2fs: record total data blocks allocated since mount
  f2fs: implement cache to manager block update frequency per inode
  f2fs: add age_extent_cache mount option

 Documentation/ABI/testing/sysfs-fs-f2fs |  14 +
 Documentation/filesystems/f2fs.rst      |   4 +
 fs/f2fs/Kconfig                         |   7 +
 fs/f2fs/Makefile                        |   1 +
 fs/f2fs/block_age.c                     | 733 ++++++++++++++++++++++++
 fs/f2fs/debug.c                         |  20 +
 fs/f2fs/f2fs.h                          |  83 +++
 fs/f2fs/file.c                          |  10 +
 fs/f2fs/inode.c                         |   8 +
 fs/f2fs/namei.c                         |   4 +
 fs/f2fs/node.c                          |   7 +-
 fs/f2fs/node.h                          |   3 +
 fs/f2fs/segment.c                       |  23 +
 fs/f2fs/shrinker.c                      |   3 +
 fs/f2fs/super.c                         |  51 ++
 fs/f2fs/sysfs.c                         |  28 +
 include/trace/events/f2fs.h             | 239 ++++++++
 17 files changed, 1237 insertions(+), 1 deletion(-)
 create mode 100644 fs/f2fs/block_age.c

-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
