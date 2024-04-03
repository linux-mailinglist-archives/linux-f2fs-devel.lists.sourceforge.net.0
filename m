Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2617D89673F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  3 Apr 2024 09:52:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rrvQ1-0005d1-J6;
	Wed, 03 Apr 2024 07:52:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sweettea-kernel@dorminy.me>) id 1rrvQ0-0005cs-5F
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 03 Apr 2024 07:52:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7PYzXzBaXMRaTUM7K3OM9Hp08R0SqoGrNVl4KKxQ7is=; b=VGIIsteMvU3+cEG+XWqYw/n9Eg
 crGmG874tCnHmE+iS3+QqxsREFm49bi6KW1zyS56LoPgh+nZChTFe0SKit5HHCT9l2dLeL9er2xo9
 t83CZg4sdU6Mkuk/VLNge6OQk8ccV9z2ieHyBaOShFDUwkQ6KvbYqJDFWnPhwvCsMdzQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7PYzXzBaXMRaTUM7K3OM9Hp08R0SqoGrNVl4KKxQ7is=; b=QX//F6JAEOKFjxPjdSUCFyXzEL
 2voPY0FWpALIR61buEenvExQTTRojxxHepHmjlUUP2SD4CcSDziGvTv4fVCCWZi0NvEJ6oltxdBxi
 zNES0pFWtqDzHK3uymPWe7JviQ930U1PQD6Zp4dnOLyeCxMbfnPv6MdUdoPQKATVFfdg=;
Received: from box.fidei.email ([71.19.144.250])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rrvPz-0001lD-Fw for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 03 Apr 2024 07:52:24 +0000
Received: from authenticated-user (box.fidei.email [71.19.144.250])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by box.fidei.email (Postfix) with ESMTPSA id 5353F807DB;
 Wed,  3 Apr 2024 03:33:18 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dorminy.me; s=mail;
 t=1712129598; bh=RN4ChmgSR3ZQz489TYOpQl2oinZST+jD9bAbWRVw3kw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=g4korhKJcSnDsrv9N7vH1U2FU2y1IQ+1cCMgS5/5PrxSN4HMDcoGduvy3dBmz1Nc2
 yesnN+yjkh4f2vIszcOepeVVHQ3K67FvmEIxGpiTFYHKpuMe2R6HagoPaJ/l1N7h5B
 kSFM1+CNyOU88P5figMN31ZJaqkeiNoaljXN4YmqKD9V2WaqCHnY88jix5aqPn43Kf
 yGgF7UvGPp8P8KQGEm5qGPB01jtmts3h8MXOdQNZoA8tbZ857MqJXRClm9wfhrTLk2
 A4L0DcuexATY8/UevIM4mTqaPkV3v1Ac2XqU6Gr25kMylrueJwoopHZo/lPNObd6bQ
 02UNpUd0OrtTw==
To: Jonathan Corbet <corbet@lwn.net>,
 Kent Overstreet <kent.overstreet@linux.dev>,
 Brian Foster <bfoster@redhat.com>, Chris Mason <clm@fb.com>,
 Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
 Sweet Tea Dorminy <sweettea-kernel@dorminy.me>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-bcachefs@vger.kernel.org,
 linux-btrfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, kernel-team@meta.com
Date: Wed,  3 Apr 2024 03:22:47 -0400
Message-ID: <bd06389b4c9c33ab1411f2941875f02867b18642.1712126039.git.sweettea-kernel@dorminy.me>
In-Reply-To: <cover.1712126039.git.sweettea-kernel@dorminy.me>
References: <cover.1712126039.git.sweettea-kernel@dorminy.me>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Signed-off-by: Sweet Tea Dorminy <sweettea-kernel@dorminy.me>
 --- fs/nilfs2/inode.c | 12 ++++++++---- 1 file changed, 8 insertions(+),
 4 deletions(-) diff --git a/fs/nilfs2/inode.c b/fs/nilfs2/inode.c index
 4d3c347c982b..e3108f2cead7
 100644 --- a/fs/nilfs2/inode.c +++ b/fs/nilfs2/inode.c @@ -1160,7 +1160,7
 @@ int nilfs_fiemap(struct inode *inode, s [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: dorminy.me]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1rrvPz-0001lD-Fw
Subject: [f2fs-dev] [PATCH v3 06/13] nilfs2: fiemap: return correct extent
 physical length
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
From: Sweet Tea Dorminy via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Sweet Tea Dorminy <sweettea-kernel@dorminy.me>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Signed-off-by: Sweet Tea Dorminy <sweettea-kernel@dorminy.me>
---
 fs/nilfs2/inode.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/fs/nilfs2/inode.c b/fs/nilfs2/inode.c
index 4d3c347c982b..e3108f2cead7 100644
--- a/fs/nilfs2/inode.c
+++ b/fs/nilfs2/inode.c
@@ -1160,7 +1160,7 @@ int nilfs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 {
 	struct the_nilfs *nilfs = inode->i_sb->s_fs_info;
 	__u64 logical = 0, phys = 0, size = 0;
-	__u32 flags = 0;
+	__u32 flags = FIEMAP_EXTENT_HAS_PHYS_LEN;
 	loff_t isize;
 	sector_t blkoff, end_blkoff;
 	sector_t delalloc_blkoff;
@@ -1197,7 +1197,9 @@ int nilfs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 			if (blkoff > end_blkoff)
 				break;
 
-			flags = FIEMAP_EXTENT_MERGED | FIEMAP_EXTENT_DELALLOC;
+			flags = FIEMAP_EXTENT_MERGED |
+				FIEMAP_EXTENT_DELALLOC |
+				FIEMAP_EXTENT_HAS_PHYS_LEN;
 			logical = blkoff << blkbits;
 			phys = 0;
 			size = delalloc_blklen << blkbits;
@@ -1261,14 +1263,16 @@ int nilfs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 						break;
 
 					/* Start another extent */
-					flags = FIEMAP_EXTENT_MERGED;
+					flags = FIEMAP_EXTENT_MERGED |
+						FIEMAP_EXTENT_HAS_PHYS_LEN;
 					logical = blkoff << blkbits;
 					phys = blkphy << blkbits;
 					size = n << blkbits;
 				}
 			} else {
 				/* Start a new extent */
-				flags = FIEMAP_EXTENT_MERGED;
+				flags = FIEMAP_EXTENT_MERGED |
+					FIEMAP_EXTENT_HAS_PHYS_LEN;
 				logical = blkoff << blkbits;
 				phys = blkphy << blkbits;
 				size = n << blkbits;
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
