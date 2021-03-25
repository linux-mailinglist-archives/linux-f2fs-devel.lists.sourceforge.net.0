Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E45283485A5
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Mar 2021 01:08:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lPDYL-0004eh-Fq; Thu, 25 Mar 2021 00:08:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <shreeya.patel@collabora.com>) id 1lPDYK-0004ea-L2
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 25 Mar 2021 00:08:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VJPaYBiTfrTHaBRY1LC4konnt9xV9A/R3dw9kvRLg+E=; b=HeL+0Vhc8aPnSvpCVeP24O6tiy
 zEGpm6545Wja3rbIvVYnz8rlKvXcB0i4CiNGTN/urqcHwLKKmtgzC3rkNjC8QVopNm48ZzbhqlBBY
 JAZXiLSVUO/VauJ5W29ZUGuPaqXNPdkSav1HaHeALY6MUcL/hmIRyVaUWE0Wg9qxXOvk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=VJPaYBiTfrTHaBRY1LC4konnt9xV9A/R3dw9kvRLg+E=; b=H
 UE2fAQKVhOb5zXMvq1fi29qkmP7mO/sOaXwWpNImhg8PnIbdfWHFAYimRpTQx9gEnO52dsKg/pIMr
 +XhZPxk3CquQjFeKj4sOFnwfyste/oTpJsjJ9N3HC9rqwZgkqoOZ5WflqrR/ZYdx7LYkWV8AdD/cz
 YQXDlOvR/BG1m7is=;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lPDYE-007Toy-77
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 25 Mar 2021 00:08:44 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: shreeya) with ESMTPSA id B47521F45F25
From: Shreeya Patel <shreeya.patel@collabora.com>
To: tytso@mit.edu, adilger.kernel@dilger.ca, jaegeuk@kernel.org,
 chao@kernel.org, krisman@collabora.com, ebiggers@google.com,
 drosen@google.com, ebiggers@kernel.org, yuchao0@huawei.com
Date: Thu, 25 Mar 2021 05:38:06 +0530
Message-Id: <20210325000811.1379641-1-shreeya.patel@collabora.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: checkpatch.pl]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
X-Headers-End: 1lPDYE-007Toy-77
Subject: [f2fs-dev] [PATCH v4 0/5] Make UTF-8 encoding loadable
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
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 andre.almeida@collabora.com, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

utf8data.h_shipped has a large database table which is an auto-generated
decodification trie for the unicode normalization functions and it is not
necessary to carry this large table in the kernel.
Goal is to make UTF-8 encoding loadable by converting it into a module
and adding a layer between the filesystems and the utf8 module which will
load the module whenever any filesystem that needs unicode is mounted.

1st patch in the series resolves the warning reported by kernel test robot
and 2nd patch fixes the incorrect use of utf8_unload() in ext4 and
f2fs filesystems.

Unicode is the subsystem and utf8 is a charachter encoding for the
subsystem, hence 3rd and 4th patches in the series are renaming functions
and file name to unicode for better understanding the difference between
UTF-8 module and unicode layer.

Last patch in the series adds the layer and utf8 module and also uses
static_call() function introducted for preventing speculative execution
attacks.

---
Changes in v4
  - Return error from the static calls instead of doing nothing and
    succeeding even without loading the module.
  - Remove the complete usage of utf8_ops and use static calls at all
    places.
  - Restore the static calls to default values when module is unloaded.
  - Decrement the reference of module after calling the unload function.
  - Remove spinlock as there will be no race conditions after removing
    utf8_ops.

Changes in v3
  - Add a patch which checks if utf8 is loaded before calling utf8_unload()
    in ext4 and f2fs filesystems
  - Return error if strscpy() returns value < 0
  - Correct the conditions to prevent NULL pointer dereference while
    accessing functions via utf8_ops variable.
  - Add spinlock to avoid race conditions.
  - Use static_call() for preventing speculative execution attacks.

Changes in v2
  - Remove the duplicate file from the last patch.
  - Make the wrapper functions inline.
  - Remove msleep and use try_module_get() and module_put()
    for ensuring that module is loaded correctly and also
    doesn't get unloaded while in use.
  - Resolve the warning reported by kernel test robot.
  - Resolve all the checkpatch.pl warnings.

Shreeya Patel (5):
  fs: unicode: Use strscpy() instead of strncpy()
  fs: Check if utf8 encoding is loaded before calling utf8_unload()
  fs: unicode: Rename function names from utf8 to unicode
  fs: unicode: Rename utf8-core file to unicode-core
  fs: unicode: Add utf8 module and a unicode layer

 fs/ext4/hash.c                             |   2 +-
 fs/ext4/namei.c                            |  12 +-
 fs/ext4/super.c                            |   8 +-
 fs/f2fs/dir.c                              |  12 +-
 fs/f2fs/super.c                            |  11 +-
 fs/libfs.c                                 |   6 +-
 fs/unicode/Kconfig                         |  11 +-
 fs/unicode/Makefile                        |   5 +-
 fs/unicode/unicode-core.c                  |  84 +++++++++++++
 fs/unicode/{utf8-core.c => unicode-utf8.c} |  93 +++++++++-----
 fs/unicode/utf8-selftest.c                 |   8 +-
 include/linux/unicode.h                    | 133 ++++++++++++++++++---
 12 files changed, 307 insertions(+), 78 deletions(-)
 create mode 100644 fs/unicode/unicode-core.c
 rename fs/unicode/{utf8-core.c => unicode-utf8.c} (59%)

-- 
2.30.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
