Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E6AEB722DD
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Jul 2019 01:13:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Mime-Version:Message-Id:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TDn4u878PNiTzrq0GaV5k1qJiqnwjIaz3ugU6ew+g3Y=; b=NlFpMiYLIOAGLCClVz5Wa65eHW
	2lwjAesIY3QzG9E4ajSlSvlJbWF1ZD+3kSweyktEQu9mK2jJsqh7s0pyt+lYi9XehOPPCfI2nScva
	icM6xcoYdu2B+7aO90XcJN4cmI6USJtygoWDrh+ZMv1TOuGilzYDhOHh2ZEYOULWxuJw=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hq3yE-0005Va-Cy; Tue, 23 Jul 2019 23:13:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3DJM3XQYKAAEesptfohpphmf.dpn@flex--drosen.bounces.google.com>)
 id 1hq3yC-0005VJ-RI
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 23 Jul 2019 23:13:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Mime-Version:
 Message-Id:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ypAciFLqcuJHhZlJfd3b9E/UNSP51lkN8ppY3+9yiV0=; b=CNo2oyPUKHDNqZGFi8AzF2ouV7
 d5o+yjE8hsFG6i2wsMue5iXVWFPSL15vO4XP/hWki8fsS7z1nM3BqPEb844bpqxXCLFkIdilJs9BU
 7ZesxXo7RhXG8KdoB3OSdVzHAAZQ2BksFABOSdPOIWpdpWJJPD1va/uFwO/8Wb6TRG6w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Mime-Version:Message-Id:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ypAciFLqcuJHhZlJfd3b9E/UNSP51lkN8ppY3+9yiV0=; b=D
 8dtB81vF+MbT0sJpRB1wDr1Qwc4WATZLXusC+Mjs2K0Lh9cUnnY/ZlI0UUNXDeCzfRNTVRpdKOYQO
 KZoc2EsQKPcc6TMSaCWWI+V+TjIH5ctxlIakWQIvxzk/XSsJv3OueBjaUGeYo5YPgwt6pvaTjsPtg
 QmYCroJvdbNSUV/w=;
Received: from mail-oi1-f202.google.com ([209.85.167.202])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hq3yB-00Cxv4-Fw
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 23 Jul 2019 23:13:20 +0000
Received: by mail-oi1-f202.google.com with SMTP id i16so17295708oie.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 23 Jul 2019 16:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=ypAciFLqcuJHhZlJfd3b9E/UNSP51lkN8ppY3+9yiV0=;
 b=WQ3iNnYoSyu7xtrItLgp020OuxDdO2/iRV2uuk27rT/z0T/Ivgp2t0qpnjUQnutvGO
 Kht4XkxfyI82pAf7iBAmzpAh3bma+GsOP/lWEILbL8XGZCUWOfR+zOJEZO+LCwqW1+0J
 re12tXsPG1ZGIxtefWTTHZ0rmoSeptTv50oNwbBi/yxdBR8eGzy6vE71M02BrWaMSa2m
 Wz74TCUFRRT36yUx5zDCm4LFO0AviBkQ0V64+68mNDKlBkz8NiEXI6tSXKyDDGRXxRym
 +gBXn/6aa1ixajprqf1Gcl0vH57WykEURFDVSYksJJH5tW7lbed6XcGlVblOav8mCxix
 p45A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=ypAciFLqcuJHhZlJfd3b9E/UNSP51lkN8ppY3+9yiV0=;
 b=IrPZXKWfpDsPpQ92rZchY+xJScKasIrhUsT8UlB4LTi5BTWY7O7T6XT0ClZ7g6hz8X
 sG8jabiJBqqbsGEMobhNjSalMX1lG7xSFKVOPQSvEeyQf4bSKRqHPYvlk/L0YDhNatgu
 +V0PX1BWI4FiXDjAa9JEUFlogYsH8my0qZVm7DWswQ7+LBL1yjx1YbQzs3NZPmQluKMt
 kEmotAafUtanoUbCdZEJfWBDQoXjLoC7HSrSnB1QjBdvsCDGnQgeIpLMwVeTxYe+PEf1
 zKlhfZs8XV09yvpyv7TWBcJAOorjwSKKMJ5y68hpbJQAPSbhSlxRaF+Fstd+Fjp8c5fq
 sxAw==
X-Gm-Message-State: APjAAAWHup9L8/RNkjDPYKmf2nRpFPagixczrXWV/qXBlBMgNa7Zy3e4
 gbjHCE63sXQnk2tGD540fnHlmeL+EIc=
X-Google-Smtp-Source: APXvYqwz+0x7RONeJbKjUnRXjeymxUnQSwmgLwpHeeoqm1M6i5wivZrMYqkPk7JDlsvHSKoQHeWXu8isL0I=
X-Received: by 2002:a63:1c22:: with SMTP id c34mr78125523pgc.56.1563923212254; 
 Tue, 23 Jul 2019 16:06:52 -0700 (PDT)
Date: Tue, 23 Jul 2019 16:05:26 -0700
Message-Id: <20190723230529.251659-1-drosen@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.22.0.657.g960e92d24f-goog
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>, 
 Jonathan Corbet <corbet@lwn.net>, linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.202 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
X-Headers-End: 1hq3yB-00Cxv4-Fw
Subject: [f2fs-dev] [PATCH v4 0/3] Casefolding in F2FS
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
Cc: Daniel Rosenberg <drosen@google.com>, linux-doc@vger.kernel.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

These patches are largely based on the casefolding patches for ext4

v4: Added FS_CASEFOLD_FL flag, added documentation that escaped the last
    format-patch, moved setting dentry ops to f2fs_setup_casefold
v3: Addressed feedback, apart from F2FS_CASEFOLD_FL/FS_CASEFOLD_FL
    Added sysfs file "encoding" to see the encoding set on a filesystem
v2: Rebased patches again master, changed f2fs_msg to f2fs_info/f2fs_err

Daniel Rosenberg (3):
  fs: Reserve flag for casefolding
  f2fs: include charset encoding information in the superblock
  f2fs: Support case-insensitive file name lookups

 Documentation/ABI/testing/sysfs-fs-f2fs |   7 ++
 Documentation/filesystems/f2fs.txt      |   3 +
 fs/f2fs/dir.c                           | 126 ++++++++++++++++++++++--
 fs/f2fs/f2fs.h                          |  21 +++-
 fs/f2fs/file.c                          |  16 ++-
 fs/f2fs/hash.c                          |  35 ++++++-
 fs/f2fs/inline.c                        |   4 +-
 fs/f2fs/inode.c                         |   4 +-
 fs/f2fs/namei.c                         |  21 ++++
 fs/f2fs/super.c                         |  96 ++++++++++++++++++
 fs/f2fs/sysfs.c                         |  23 +++++
 include/linux/f2fs_fs.h                 |   9 +-
 include/uapi/linux/fs.h                 |   1 +
 tools/include/uapi/linux/fs.h           |   1 +
 14 files changed, 347 insertions(+), 20 deletions(-)

-- 
2.22.0.657.g960e92d24f-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
