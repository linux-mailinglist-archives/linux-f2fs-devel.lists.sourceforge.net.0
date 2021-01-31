Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C6B309BF8
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 31 Jan 2021 13:26:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4upwX5qWjn2jkPZBVNpPeFIrmUcjIk1VtP3V6cTwcXo=; b=eCbV/TrWlpN44A6imA6PR0Yfl7
	BsMWo6nC6c+hzlVSD6iB4rQ6EQy4bFHoeq6d0Y/+fgzCGSRUd+LU6UqcYqJ4XyKmJEnH3KKeeFmLE
	pKhjfNRYzw1shzjEVWkTMqrrXjZ/84E2MpYjBybP//Gs6FOHAmsr2G3nLxu8W5aTFSHc=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l6BoN-0001mW-Sx; Sun, 31 Jan 2021 12:26:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <fishland@aliyun.com>) id 1l6BoM-0001mP-8v
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 31 Jan 2021 12:26:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aYCA5mvNkaLaDYevFzh7KrbouJ6IxFWv8F+4POS9ScM=; b=GQSBPpTHjDGEEhYIj8LDCw0o6j
 ZW03J27N2oT+bH7MUJBXpnhc80RqwwX55rDQUVjUIJYj5Q7V0ZLgmxuXzxdWtvLZjW5sWk53HUrc6
 VK1H971M7VgU0xkt13GoKIKoykcLPT/e7AwCbv2xOgLEjY6J3mFZ4359kH/O1LHaWwqg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=aYCA5mvNkaLaDYevFzh7KrbouJ6IxFWv8F+4POS9ScM=; b=E
 LvIFr5Unhqp6Dg2SGgHA99IXpKGCXZmb01rFrwUF8HLoCQQDIpZ7qjxnZH7kyvasTh3lEqp98KW4v
 UYUPTNdCwRsGjj7vBwIh9pU8aQunsQRS8n6ixH9GjcKIPUWkRIeZLJJLT8QfLhuDm9nUJmDTFavMz
 Ff9x0sYPSl5V0T5s=;
Received: from out30-28.freemail.mail.aliyun.com ([115.124.30.28])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1l6Bo8-0004YL-Nh
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 31 Jan 2021 12:26:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aliyun.com; s=s1024;
 t=1612095972; h=From:To:Subject:Date:Message-Id:MIME-Version;
 bh=aYCA5mvNkaLaDYevFzh7KrbouJ6IxFWv8F+4POS9ScM=;
 b=ayLBdIorYv8p9A4EaU4OcKuHk2g3GFO5QNIDmJxd0T4Tk/ExOoklAeOlofO5Hmvv+goMrfUSylyt3mPrMtd4Mv5e+1XHvQWmBgltCnCLnaJQPRrEHiXR7psUSSyMAO1slbZXfo2Y0nvLUUhSPcd+Qh9JMaZkTjXJQqR2ViURHr0=
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07644434|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.0119829-0.00071919-0.987298;
 FP=0|0|0|0|0|-1|-1|-1; HT=alimailimapcm10staff010182156082;
 MF=fishland@aliyun.com; NM=1; PH=DS; RN=5; RT=5; SR=0;
 TI=SMTPD_---0UNOc5af_1612095967; 
Received: from localhost.localdomain(mailfrom:fishland@aliyun.com
 fp:SMTPD_---0UNOc5af_1612095967) by smtp.aliyun-inc.com(127.0.0.1);
 Sun, 31 Jan 2021 20:26:12 +0800
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Sun, 31 Jan 2021 20:26:05 +0800
Message-Id: <20210131122605.3296-1-fishland@aliyun.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (fishland[at]aliyun.com)
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: zte.com.cn]
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [115.124.30.28 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [115.124.30.28 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
X-Headers-End: 1l6Bo8-0004YL-Nh
Subject: [f2fs-dev] [PATCH] f2fs: remove unnecessary initialization in
 xattr.c
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
From: Liu Song via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Liu Song <fishland@aliyun.com>
Cc: liu.song11@zte.com.cn, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Liu Song <liu.song11@zte.com.cn>

These variables will be explicitly assigned before use,
so there is no need to initialize.

Signed-off-by: Liu Song <liu.song11@zte.com.cn>
---
 fs/f2fs/xattr.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
index 65afcc3cc68a..c330a290e5af 100644
--- a/fs/f2fs/xattr.c
+++ b/fs/f2fs/xattr.c
@@ -327,7 +327,7 @@ static int lookup_all_xattrs(struct inode *inode, struct page *ipage,
 	void *last_addr = NULL;
 	nid_t xnid = F2FS_I(inode)->i_xattr_nid;
 	unsigned int inline_size = inline_xattr_size(inode);
-	int err = 0;
+	int err;
 
 	if (!xnid && !inline_size)
 		return -ENODATA;
@@ -515,7 +515,7 @@ int f2fs_getxattr(struct inode *inode, int index, const char *name,
 		void *buffer, size_t buffer_size, struct page *ipage)
 {
 	struct f2fs_xattr_entry *entry = NULL;
-	int error = 0;
+	int error;
 	unsigned int size, len;
 	void *base_addr = NULL;
 	int base_size;
@@ -562,7 +562,7 @@ ssize_t f2fs_listxattr(struct dentry *dentry, char *buffer, size_t buffer_size)
 	struct inode *inode = d_inode(dentry);
 	struct f2fs_xattr_entry *entry;
 	void *base_addr, *last_base_addr;
-	int error = 0;
+	int error;
 	size_t rest = buffer_size;
 
 	down_read(&F2FS_I(inode)->i_xattr_sem);
@@ -632,7 +632,7 @@ static int __f2fs_setxattr(struct inode *inode, int index,
 	int found, newsize;
 	size_t len;
 	__u32 new_hsize;
-	int error = 0;
+	int error;
 
 	if (name == NULL)
 		return -EINVAL;
-- 
2.20.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
