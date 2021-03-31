Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D79C23508C4
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 31 Mar 2021 23:08:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lRi4i-0001SK-Qg; Wed, 31 Mar 2021 21:08:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <shreeya.patel@collabora.com>) id 1lRi4h-0001Rn-DQ
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 31 Mar 2021 21:08:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KXIGDs6zal6LZG6/HDiY8x8kW/s5eJtbrceFtMt1ip8=; b=afahu4MP2oecAzOtHDWbe41mD1
 HUXJUqdlTL+OFkcRKwQIrJyzlMee4J1SQ+fQS8zpF0K+PA/JPy5d/CtP+BFIR170LCzV2JDkPjYca
 4BOlYaSgv2UZj3cptFH3+9lO7Ukm2Bs1uo7Lc9Yce1pXdt+qm03cfjyde18uZjLR18TU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=KXIGDs6zal6LZG6/HDiY8x8kW/s5eJtbrceFtMt1ip8=; b=h
 Gm2B4eKCVXnDbbBnAbL5tykJoJHobsmA9ZwR52ZVFgokbCN+ePYwQTp6AxTu1llqVuGPfIch4n1nx
 c+UU5I0/kBFnzRJxAUVXliQAbU+Wk9evIZq/VaPKZmcdUDYCL60Pqxlskj52pEfUi3bTsZ6sXMOe0
 Ln3yjnL/s1/bhL/4=;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lRi4Y-0003gz-4Z
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 31 Mar 2021 21:08:27 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: shreeya) with ESMTPSA id 626441F461A9
From: Shreeya Patel <shreeya.patel@collabora.com>
To: tytso@mit.edu, adilger.kernel@dilger.ca, jaegeuk@kernel.org,
 chao@kernel.org, krisman@collabora.com, ebiggers@google.com,
 drosen@google.com, ebiggers@kernel.org, yuchao0@huawei.com
Date: Thu,  1 Apr 2021 02:37:47 +0530
Message-Id: <20210331210751.281645-1-shreeya.patel@collabora.com>
X-Mailer: git-send-email 2.30.2
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
X-Headers-End: 1lRi4Y-0003gz-4Z
Subject: [f2fs-dev] [PATCH v6 0/4] Make UTF-8 encoding loadable
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
Currently only UTF-8 encoding is supported but if any other encodings
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
 fs/unicode/Kconfig                         |  17 ++-
 fs/unicode/Makefile                        |   5 +-
 fs/unicode/unicode-core.c                  | 152 +++++++++++++++++++++
 fs/unicode/{utf8-core.c => unicode-utf8.c} |  98 ++++++++-----
 fs/unicode/utf8-selftest.c                 |   8 +-
 include/linux/unicode.h                    | 100 +++++++++++---
 12 files changed, 344 insertions(+), 80 deletions(-)
 create mode 100644 fs/unicode/unicode-core.c
 rename fs/unicode/{utf8-core.c => unicode-utf8.c} (57%)

-- 
2.30.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
