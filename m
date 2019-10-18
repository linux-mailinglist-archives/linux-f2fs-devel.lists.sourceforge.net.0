Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F636DBE40
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 18 Oct 2019 09:23:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7RRfZYMnpWzT0Ng2DYUwe3Nm3jULgywCbyIpRQARzKA=; b=byZkV0C4G6ZFEJNDQ1+ujMwSd
	Kn7lwqKpaXvIYK5UXj2V6EED4KeCp0Dlj7klS8UaXFt//q+S8AESC+t8BEc3Kp/+pBCr+p8aOsR54
	W5T8bcbAZ2L4oMQL9zw/FyAGNy33UAD76FAATJUBRbBzOPmANRYj1EoMrveo35h+zZcOs=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iLMbD-0007q1-IA; Fri, 18 Oct 2019 07:22:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <3G2KpXQwKAHgdqWjcnWjZWhhckkcha.Yki@flex--huangrandall.bounces.google.com>)
 id 1iLMbC-0007pq-Dz
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 18 Oct 2019 07:22:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+hsKPqici8eyIvgx8GToH+3aueA0ocUnG9yKN+h0H1M=; b=B5HO9vpHX32cdM6SPc2JP1nw3
 D/QnBOqsXCRUHZxQQApovDJL+He1HrAWtpLHGuArHiiPCXPzOpZi6LSw9SbrL5AA0UTDWLhtBzhu/
 gAe3VUZ/2opPnzwOqzU6xe6xSc8++5KnuVzH7zjImfhVVh9EWn6s7Asqj2LzwyPHJ7TZ8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+hsKPqici8eyIvgx8GToH+3aueA0ocUnG9yKN+h0H1M=; b=A+YLwvwZVT12zeCBaKmVijPLko
 y9GhKNw/mUnKihcz8Acbi6LZhTZldwCIKBpH12KE00FwW6fEOXSmPfK7AnTQ+J9bU2QFyCKZ/77k6
 bnN3BYZf6DzbPeah3sLXRhqweckaQYb+AMyV/+fdZ3qa7wbDOK4bjTyOdLiB20uC6TX8=;
Received: from mail-il1-f202.google.com ([209.85.166.202])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iLMbA-00DEBR-5H
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 18 Oct 2019 07:22:58 +0000
Received: by mail-il1-f202.google.com with SMTP id y7so1498298ilb.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 18 Oct 2019 00:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=+hsKPqici8eyIvgx8GToH+3aueA0ocUnG9yKN+h0H1M=;
 b=LxUzoaPX3paNCqiXE/0YvBQccH5ed0EWkDanj8GsnmLBBWbmab6RoWYtLwmMjXY4CZ
 ++4BhhGOHwLDs+jbzfvDGq+TlGnqpFOG0Qtl/MNvOHu4QiF/cpW3tMqZWuctGHPBYQuX
 vYXLoWeNOmDmluU36fmo9YhL9jRnS+/CO4Nnu7HHLHAjJVwhIk/l/hgc3k1QUM0jZVmm
 Il0DZi+ZO3VUpxGfUf8hlKNety7xz25oYt8khO8/VTQXWCJnx69RBGXZRUA7EtfRZIZf
 SK1QEtCJe6hgnpVycW/dxEcU1e1pxzdeHgdl45IFr3Z0kQgrg+hIkpSHdcH15+xxqtLg
 kBSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=+hsKPqici8eyIvgx8GToH+3aueA0ocUnG9yKN+h0H1M=;
 b=MJCTq79W62MgLp53ZaKdHOb0M3M514ioAcYQKvyHYDAagmLeXQvxxwRUTpKi+w4QnU
 M9LaX3j1kg4l1jg+TsToYw77ae1z5AcnirwoG1Nwwb3oKoLPbN/3E9nyLOh4yN5SIcLp
 nbNDac4aG7sJ0d4+TBPuYZR9X28JDAKp1x0z76ryKT//aHLGIr0PDUldYuVVqWX6AYPS
 dIvVboyLwi1opU2Rap4PjOvxDeQdkIZyyatIhPB4OrHojbm6DuEf3ga9q62/tQoZ7wMP
 qkEaG/H8wZiboCO48jX1TDoEE0/HqUDIYWe7qR6DFPwjLe8+HS1mLtjMODywYFr+/Woq
 WPVQ==
X-Gm-Message-State: APjAAAVouysrjfplI4S4XjfP2EiAQYDLyy04p6zU+NJD1QIn8KQgtsCs
 NBKoqmj5xPCrAVOuc9UuPp/+M2p3QOFw4VffvLI=
X-Google-Smtp-Source: APXvYqxacPck+QvS1cCpIRpnt4Qx7Ru8kfEkf9dhMJu3nG6odMRdImehsxFznI3l8VEtmkAVkr0stp06+uN4fQr/CYE=
X-Received: by 2002:a63:f743:: with SMTP id f3mr8628044pgk.410.1571381787920; 
 Thu, 17 Oct 2019 23:56:27 -0700 (PDT)
Date: Fri, 18 Oct 2019 14:56:22 +0800
In-Reply-To: <efddfbc3-bd31-b9fb-48de-decb01d01001@huawei.com>
Message-Id: <20191018065622.66404-1-huangrandall@google.com>
Mime-Version: 1.0
References: <efddfbc3-bd31-b9fb-48de-decb01d01001@huawei.com>
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
To: jaegeuk@kernel.org, yuchao0@huawei.com, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.202 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
X-Headers-End: 1iLMbA-00DEBR-5H
Subject: [f2fs-dev] [PATCH v2] f2fs: fix to avoid memory leakage in
 f2fs_listxattr
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
From: Randall Huang via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Randall Huang <huangrandall@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

In f2fs_listxattr, there is no boundary check before
memcpy e_name to buffer.
If the e_name_len is corrupted,
unexpected memory contents may be returned to the buffer.

Signed-off-by: Randall Huang <huangrandall@google.com>
---
v2:
relocate sanity check
---
 fs/f2fs/xattr.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
index 181900af2576..296b3189448a 100644
--- a/fs/f2fs/xattr.c
+++ b/fs/f2fs/xattr.c
@@ -539,8 +539,9 @@ int f2fs_getxattr(struct inode *inode, int index, const char *name,
 ssize_t f2fs_listxattr(struct dentry *dentry, char *buffer, size_t buffer_size)
 {
 	struct inode *inode = d_inode(dentry);
+	nid_t xnid = F2FS_I(inode)->i_xattr_nid;
 	struct f2fs_xattr_entry *entry;
-	void *base_addr;
+	void *base_addr, *last_base_addr;
 	int error = 0;
 	size_t rest = buffer_size;
 
@@ -550,6 +551,8 @@ ssize_t f2fs_listxattr(struct dentry *dentry, char *buffer, size_t buffer_size)
 	if (error)
 		return error;
 
+	last_base_addr = (void *)base_addr + XATTR_SIZE(xnid, inode);
+
 	list_for_each_xattr(entry, base_addr) {
 		const struct xattr_handler *handler =
 			f2fs_xattr_handler(entry->e_name_index);
@@ -557,6 +560,15 @@ ssize_t f2fs_listxattr(struct dentry *dentry, char *buffer, size_t buffer_size)
 		size_t prefix_len;
 		size_t size;
 
+		if ((void *)(entry) + sizeof(__u32) > last_base_addr ||
+			(void *)XATTR_NEXT_ENTRY(entry) > last_base_addr) {
+			f2fs_err(F2FS_I_SB(inode), "inode (%lu) has corrupted xattr",
+						inode->i_ino);
+			set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
+			error = -EFSCORRUPTED;
+			goto cleanup;
+		}
+
 		if (!handler || (handler->list && !handler->list(dentry)))
 			continue;
 
-- 
2.23.0.866.gb869b98d4c-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
