Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2DF36A5B8
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 25 Apr 2021 10:27:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1laa71-0000mi-BK; Sun, 25 Apr 2021 08:27:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <shreeya.patel@collabora.com>) id 1laa6x-0000lX-6F
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 25 Apr 2021 08:27:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3HbWpojlomNjsGxsQgSOb8kYauo5cu+Ol/t+mU060fY=; b=BD2g02mNie/OIOFwWYCm5G3HHl
 XD77jxHKjxxuyheXk+sXgOfmigqEZuRGFbZsIDfaXmJtLEYG7T4qQZ+GMjXcOxNr+EzRn/D0S7q7o
 MnYlsNg/v3lkIxCw5GWG4j8CNebiCB+TLv0t4F2c+Ql4dOWPtrgshzeYU9AYvHoS0pX4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=3HbWpojlomNjsGxsQgSOb8kYauo5cu+Ol/t+mU060fY=; b=N
 jLJgHjEuL3bPMXDl1sGs3cYDkepA63Q5Nc87vlxuMFwBkMARFlHuIDZOxZWzLDJRvODRTh9iRIx1U
 hzU/wZ9dZZ6NX6Mla3sJYIYPQbzgwUYGVdoZBnQaKauWK2Zft84gdmEMgAxiVH3Gus1+T7tzcZXvI
 EMjW28JsHIOhmRbU=;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1laa6j-0007yn-D2
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 25 Apr 2021 08:27:27 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: shreeya) with ESMTPSA id B36B91F41B0E
From: Shreeya Patel <shreeya.patel@collabora.com>
To: tytso@mit.edu, adilger.kernel@dilger.ca, jaegeuk@kernel.org,
 chao@kernel.org, krisman@collabora.com, ebiggers@google.com,
 drosen@google.com, ebiggers@kernel.org, yuchao0@huawei.com
Date: Sat, 24 Apr 2021 02:21:32 +0530
Message-Id: <20210423205136.1015456-1-shreeya.patel@collabora.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Spam-Score: 0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.5 DATE_IN_PAST_24_48     Date: is 24 to 48 hours before Received: date
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
X-Headers-End: 1laa6j-0007yn-D2
Subject: [f2fs-dev] [PATCH v8 0/4] Make UTF-8 encoding loadable
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
necessary to carry this large table in the kernel unless it is required by
the filesystem during boot time.

Goal is to make UTF-8 encoding loadable by converting it into a module
and adding a unicode subsystem layer between the filesystems and the
utf8 module.
This layer will then load the module whenever any filesystem that
needs unicode is mounted or utf8 can also be built into the kernel incase
it is required by the filesystem during boot time.

Currently, only UTF-8 encoding is supported but if any other encodings
are supported in future then the layer file would be responsible for
loading the desired encoding module.

1st patch in the series resolves the warning reported by kernel test
robot by using strscpy instead of strncpy.

Unicode is the subsystem and utf8 is a charachter encoding for the
subsystem, hence 2nd and 3rd patches in the series are renaming functions
and file name to unicode for better understanding the difference between
UTF-8 module and unicode layer.

Last patch in the series adds the layer and utf8 module and also uses
static calls which gives performance benefit when compared to indirect
calls using function pointers.

---
Changes in v8
  - Improve the commit message of patch 1 to decribe about how
    overly-long strings should be handled.
  - Improve the commit messages in patches 2/3/4 to better understand
    the use of built-in option.
  - Improve the help text in Kconfig for avoiding contradictory
    statements.
  - Make spinlock definition static.
  - Use int instead of bool to avoid gcc warning.
  - Add a comment for decribing why we are using
    try_then_request_module() instead of request_module()

Changes in v7
  - Update the help text in Kconfig
  - Handle the unicode_load_static_call function failure by decrementing
    the reference.
  - Correct the code for handling built-in utf8 option as well.
  - Correct the synchronization for accessing utf8mod.
  - Make changes to unicode_unload() for handling the situation where
    utf8mod != NULL and um == NULL.

Changes in v6
  - Add spinlock to protect utf8mod and avoid NULL pointer
    dereference.
  - Change the static call function names for being consistent with
    kernel coding style.
  - Merge the unicode_load_module function with unicode_load as it is
    not really needed to have a separate function.
  - Use try_then_module_get instead of module_get to avoid loading the
    module even when it is already loaded.
  - Improve the commit message.

Changes in v5
  - Remove patch which adds NULL check in ext4/super.c and f2fs/super.c
    before calling unicode_unload().
  - Rename global variables and default static call functions for better
    understanding
  - Make only config UNICODE_UTF8 visible and config UNICODE to be always
    enabled provided UNICODE_UTF8 is enabled.  
  - Improve the documentation for Kconfig
  - Improve the commit message.
 
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

Shreeya Patel (4):
  fs: unicode: Use strscpy() instead of strncpy()
  fs: unicode: Rename function names from utf8 to unicode
  fs: unicode: Rename utf8-core file to unicode-core
  fs: unicode: Add utf8 module and a unicode layer

 fs/ext4/hash.c                             |   2 +-
 fs/ext4/namei.c                            |  12 +-
 fs/ext4/super.c                            |   6 +-
 fs/f2fs/dir.c                              |  12 +-
 fs/f2fs/super.c                            |   6 +-
 fs/libfs.c                                 |   6 +-
 fs/unicode/Kconfig                         |  26 ++-
 fs/unicode/Makefile                        |   5 +-
 fs/unicode/unicode-core.c                  | 175 +++++++++++++++++++++
 fs/unicode/{utf8-core.c => unicode-utf8.c} |  98 +++++++-----
 fs/unicode/utf8-selftest.c                 |   8 +-
 include/linux/unicode.h                    | 100 ++++++++++--
 12 files changed, 374 insertions(+), 82 deletions(-)
 create mode 100644 fs/unicode/unicode-core.c
 rename fs/unicode/{utf8-core.c => unicode-utf8.c} (57%)

-- 
2.30.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
