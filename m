Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1D134D92F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Mar 2021 22:43:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lQyjF-0002bg-Vp; Mon, 29 Mar 2021 20:43:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <shreeya.patel@collabora.com>) id 1lQyjD-0002bM-UG
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 29 Mar 2021 20:43:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Bf8bZPFlrxSC34lBI2920hDN93+sFO1N6H2UO8cuQeg=; b=QHMRmLYQwVh2LHgIjxS8IoY9qP
 15fabREE9W7LWB2g/rXkRjkDWG+EMJUQfBdmuBum+8PZBCP3qET2r/plN2n0dBYUE1VxTNMCDCVCZ
 +A0ujKInbceGRYSLmsMQlEPw4EDjwZ0cAKsUDIS6G0fF4Sczud2zdbikiabtNOGHOkko=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Bf8bZPFlrxSC34lBI2920hDN93+sFO1N6H2UO8cuQeg=; b=ivwCpyC2er87vSj8cwjp2w+zRx
 iwrgumiOB/FIX8iCJgqy9u/7Ck+5FTCnLF7wW95f5OpN5kB4XZVBfH2zF4/qqEitVtc3mh/09iGOO
 FBPshRzDxFf4SDO0Af/WH8DLS6tUfYaV52ewnZvRU2DSqgG2f9RkLW5LB7r98rBH6To4=;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lQyj6-0006bL-O0
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 29 Mar 2021 20:43:15 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: shreeya) with ESMTPSA id D5AAC1F454FD
From: Shreeya Patel <shreeya.patel@collabora.com>
To: tytso@mit.edu, adilger.kernel@dilger.ca, jaegeuk@kernel.org,
 chao@kernel.org, krisman@collabora.com, ebiggers@google.com,
 drosen@google.com, ebiggers@kernel.org, yuchao0@huawei.com
Date: Tue, 30 Mar 2021 02:12:37 +0530
Message-Id: <20210329204240.359184-2-shreeya.patel@collabora.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210329204240.359184-1-shreeya.patel@collabora.com>
References: <20210329204240.359184-1-shreeya.patel@collabora.com>
MIME-Version: 1.0
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
X-Headers-End: 1lQyj6-0006bL-O0
Subject: [f2fs-dev] [PATCH v5 1/4] fs: unicode: Use strscpy() instead of
 strncpy()
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
Cc: kernel@collabora.com, kernel test robot <lkp@intel.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, andre.almeida@collabora.com,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Following warning was reported by Kernel Test Robot.

In function 'utf8_parse_version',
inlined from 'utf8_load' at fs/unicode/utf8mod.c:195:7:
>> fs/unicode/utf8mod.c:175:2: warning: 'strncpy' specified bound 12 equals
destination size [-Wstringop-truncation]
175 |  strncpy(version_string, version, sizeof(version_string));
    |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The -Wstringop-truncation warning highlights the unintended
uses of the strncpy function that truncate the terminating NULL
character from the source string.
Unlike strncpy(), strscpy() always null-terminates the destination string,
hence use strscpy() instead of strncpy().

Fixes: 9d53690f0d4e5 (unicode: implement higher level API for string handling)
Acked-by: Gabriel Krisman Bertazi <krisman@collabora.com>
Signed-off-by: Shreeya Patel <shreeya.patel@collabora.com>
Reported-by: kernel test robot <lkp@intel.com>
---
 fs/unicode/utf8-core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/unicode/utf8-core.c b/fs/unicode/utf8-core.c
index dc25823bfed9..f9e6a2718aba 100644
--- a/fs/unicode/utf8-core.c
+++ b/fs/unicode/utf8-core.c
@@ -179,8 +179,10 @@ static int utf8_parse_version(const char *version, unsigned int *maj,
 		{1, "%d.%d.%d"},
 		{0, NULL}
 	};
+	int ret = strscpy(version_string, version, sizeof(version_string));
 
-	strncpy(version_string, version, sizeof(version_string));
+	if (ret < 0)
+		return ret;
 
 	if (match_token(version_string, token, args) != 1)
 		return -EINVAL;
-- 
2.30.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
