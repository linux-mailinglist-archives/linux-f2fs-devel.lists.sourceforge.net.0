Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B9C3467C4
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 23 Mar 2021 19:34:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lOlqw-0003zO-5E; Tue, 23 Mar 2021 18:34:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <shreeya.patel@collabora.com>) id 1lOlpq-0003wQ-DW
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 23 Mar 2021 18:32:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SzT9ktdwXZE0eVOLVEEEH8492frG/oDBRrb4LhS4vlk=; b=JT6/jo9Ueq5bsH1yblUyQADQaW
 0Fl9aV26RoqffFV9C4ShmUG7KAv1ZKAwh0mxAVepO6W81x/V2IVcY8LPp4Vg3uUdA5eGRGBI+y/us
 XrFNZ4+hem0Ys3/lfWYtNDafL27yrTaUviNcieX/iK5flqn9Ma0coWw7nnjh4WsQaViE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SzT9ktdwXZE0eVOLVEEEH8492frG/oDBRrb4LhS4vlk=; b=HFjrrCp9s8pRTkjiXwIpE37vbL
 pi62PX+LRXxEy4VcFAux0yhM4vgg4S7mAxOKykx2wqKB6e5t6E6m+cq9eVJS8G6KcyPLVQXL1AWc0
 pFWBaGNfTuwyfjq94tT+cN24LLJG9KRFwC1SKnrGRELSTiNn+uT0+U9vgQr0W6Fbbwao=;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lOlpm-0029WQ-34
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 23 Mar 2021 18:32:58 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2401:4900:5170:240f:f606:c194:2a1c:c147])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: shreeya)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 82FE31F44A66;
 Tue, 23 Mar 2021 18:32:32 +0000 (GMT)
From: Shreeya Patel <shreeya.patel@collabora.com>
To: tytso@mit.edu, adilger.kernel@dilger.ca, jaegeuk@kernel.org,
 chao@kernel.org, krisman@collabora.com, ebiggers@google.com,
 drosen@google.com, ebiggers@kernel.org, yuchao0@huawei.com
Date: Wed, 24 Mar 2021 00:01:57 +0530
Message-Id: <20210323183201.812944-2-shreeya.patel@collabora.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210323183201.812944-1-shreeya.patel@collabora.com>
References: <20210323183201.812944-1-shreeya.patel@collabora.com>
MIME-Version: 1.0
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: intel.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1lOlpm-0029WQ-34
Subject: [f2fs-dev] [PATCH v3 1/5] fs: unicode: Use strscpy() instead of
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
Signed-off-by: Shreeya Patel <shreeya.patel@collabora.com>
Reported-by: kernel test robot <lkp@intel.com>
---

Changes in v3
  - Return error if strscpy() returns value < 0

Changes in v2
  - Resolve warning of -Wstringop-truncation reported by
    kernel test robot.

 fs/unicode/utf8-core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/unicode/utf8-core.c b/fs/unicode/utf8-core.c
index dc25823bf..706f086bb 100644
--- a/fs/unicode/utf8-core.c
+++ b/fs/unicode/utf8-core.c
@@ -180,7 +180,10 @@ static int utf8_parse_version(const char *version, unsigned int *maj,
 		{0, NULL}
 	};
 
-	strncpy(version_string, version, sizeof(version_string));
+	int ret = strscpy(version_string, version, sizeof(version_string));
+
+	if (ret < 0)
+		return ret;
 
 	if (match_token(version_string, token, args) != 1)
 		return -EINVAL;
-- 
2.24.3 (Apple Git-128)



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
