Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E750C6D65F1
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Apr 2023 16:55:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pji43-0007we-Pf;
	Tue, 04 Apr 2023 14:55:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <aalbersh@redhat.com>) id 1pji3z-0007wP-Lt
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 14:55:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=z32N0rKUyphSVMSofzw3CVH4IfYQ7TTzuKWmER1MJ68=; b=irxzp3gwepl54ewxZ7jAbwQf4X
 9i8XgoFj1VibV7xbXaBdHjJ5v3QGV5J41O14Ns65O0H6PfO3yRlL190DT7FDZ0jzklSqgRGX2/MA2
 HzTKlwVHirjY8pgBmejKuagjd7vRRBbGPHcOyjjXZTrkMI5+weRhR5oi57Ue1q8OeHqU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=z32N0rKUyphSVMSofzw3CVH4IfYQ7TTzuKWmER1MJ68=; b=BAsKmUTTyMPb+jDqXlBFJNRmyk
 VJsvFSJcB1XUMu8GiqqX1OQw7Z2vuBd+84Asz/PPJtEmvf3DKWHZii5DXD6G1O+UVe+xQhjepBVFT
 pwa+L2uG9SIGTd/ZvvRWdW5IXyzNrHWURFOnhSrANJIY1YYSZQ6cD9fRHV+INQ7UdqpI=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pji3z-00Ez7J-KW for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 14:55:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680620105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z32N0rKUyphSVMSofzw3CVH4IfYQ7TTzuKWmER1MJ68=;
 b=XBXZYO9rGJtzDNg9yUudTlBlLNTES0ZRwBJIlKTHO7VFjdTkCeqkPagxKqik3yI9GXaTU1
 ZbtJeG3bnb2+Vo80gG2PsJSssyIjF6i1WKbNEPCPqVBxFm/ZrGrjk3uak3rb9tjaOd1IIx
 TilBYAf4ADULjN4yMCYECIFIQLZp4S8=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-Ilg4_WCoNkuVSzozhhQSwA-1; Tue, 04 Apr 2023 10:55:03 -0400
X-MC-Unique: Ilg4_WCoNkuVSzozhhQSwA-1
Received: by mail-qv1-f69.google.com with SMTP id
 w2-20020a0cc242000000b00583d8e55181so14727964qvh.23
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 04 Apr 2023 07:55:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680620103;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z32N0rKUyphSVMSofzw3CVH4IfYQ7TTzuKWmER1MJ68=;
 b=spUZmMuXO4CfPxeRnQFkK9CVXsJ28UXBRcXflXE8pIagN87Awj7G8EIqCncPAXi4Xl
 9AjmnwKeMls1VyFyG+WAS99YqqmXSui78QMrx0THe3cguN3tPbqCKM4lUxgUUkN+qjGR
 2tDxJXZGgGqH8Sar1zAb0sqm2NvNSos+Un8flNjXKDn9xI7048VxRj9vdcS+DbglrVI2
 lhvQzjpEdUk4sRIvbTVoOmDrGcRdBiL2vFMvkxD0+qEYUeITE2OjJdnzGzw+6PneXEnd
 hcksMo4TT54rC8q/r8rnkoiqnyq/t075WL6aDRrVz9kffh8gctxELe8dB2StRQyzTVac
 Q4SA==
X-Gm-Message-State: AAQBX9c2B5xvnLdhxOpgQape0rvszC3YPBwre/orgQke3Qyk0X4eaKiL
 64rJik3eFQjgEr6ALlzZdDV3d8oAdYG9n6eHxtEhwkFlXteFFFHlQQ/UtGsl8bwQWaV16R0qqAB
 L4ELkqA4ucZkR/FsrUcb2rvhRvuQLb1IYAjQD
X-Received: by 2002:a05:622a:106:b0:3e4:ed0d:6a87 with SMTP id
 u6-20020a05622a010600b003e4ed0d6a87mr3825569qtw.32.1680620102986; 
 Tue, 04 Apr 2023 07:55:02 -0700 (PDT)
X-Google-Smtp-Source: AKy350Zp0JOhVAHhC6Iyf8k/1+phPOce9sQ42GmA8VSWN8AvlHBpCO2hspsjGFg8IADdMrX46OgtcA==
X-Received: by 2002:a05:622a:106:b0:3e4:ed0d:6a87 with SMTP id
 u6-20020a05622a010600b003e4ed0d6a87mr3825521qtw.32.1680620102599; 
 Tue, 04 Apr 2023 07:55:02 -0700 (PDT)
Received: from aalbersh.remote.csb ([109.183.6.197])
 by smtp.gmail.com with ESMTPSA id
 j4-20020ac86644000000b003e6387431dcsm3296539qtp.7.2023.04.04.07.54.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 07:55:02 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
To: djwong@kernel.org, dchinner@redhat.com, ebiggers@kernel.org,
 hch@infradead.org, linux-xfs@vger.kernel.org, fsverity@lists.linux.dev
Date: Tue,  4 Apr 2023 16:53:02 +0200
Message-Id: <20230404145319.2057051-7-aalbersh@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230404145319.2057051-1-aalbersh@redhat.com>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Allow filesystem to make additional processing on verified
 pages instead of just dropping a reference. This will be used by XFS for
 internal buffer cache manipulation in further patches. The btrfs, ex [...]
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [170.10.133.124 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.133.124 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pji3z-00Ez7J-KW
Subject: [f2fs-dev] [PATCH v2 06/23] fsverity: add drop_page() callout
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
Cc: linux-ext4@vger.kernel.org, agruenba@redhat.com,
 damien.lemoal@opensource.wdc.com, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, rpeterso@redhat.com, xiang@kernel.org,
 jth@kernel.org, linux-erofs@lists.ozlabs.org,
 Andrey Albershteyn <aalbersh@redhat.com>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Allow filesystem to make additional processing on verified pages
instead of just dropping a reference. This will be used by XFS for
internal buffer cache manipulation in further patches. The btrfs,
ext4, and f2fs just drop the reference.

Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
---
 fs/btrfs/verity.c         | 12 ++++++++++++
 fs/ext4/verity.c          |  6 ++++++
 fs/f2fs/verity.c          |  6 ++++++
 fs/verity/read_metadata.c |  4 ++--
 fs/verity/verify.c        |  6 +++---
 include/linux/fsverity.h  | 10 ++++++++++
 6 files changed, 39 insertions(+), 5 deletions(-)

diff --git a/fs/btrfs/verity.c b/fs/btrfs/verity.c
index c5ff16f9e9fa..4c2c09204bb4 100644
--- a/fs/btrfs/verity.c
+++ b/fs/btrfs/verity.c
@@ -804,10 +804,22 @@ static int btrfs_write_merkle_tree_block(struct inode *inode, const void *buf,
 			       pos, buf, size);
 }
 
+/*
+ * fsverity op that releases the reference obtained by ->read_merkle_tree_page()
+ *
+ * @page:  reference to the page which can be released
+ *
+ */
+static void btrfs_drop_page(struct page *page)
+{
+	put_page(page);
+}
+
 const struct fsverity_operations btrfs_verityops = {
 	.begin_enable_verity     = btrfs_begin_enable_verity,
 	.end_enable_verity       = btrfs_end_enable_verity,
 	.get_verity_descriptor   = btrfs_get_verity_descriptor,
 	.read_merkle_tree_page   = btrfs_read_merkle_tree_page,
 	.write_merkle_tree_block = btrfs_write_merkle_tree_block,
+	.drop_page		 = &btrfs_drop_page,
 };
diff --git a/fs/ext4/verity.c b/fs/ext4/verity.c
index e4da1704438e..35a2feb6fd68 100644
--- a/fs/ext4/verity.c
+++ b/fs/ext4/verity.c
@@ -388,10 +388,16 @@ static int ext4_write_merkle_tree_block(struct inode *inode, const void *buf,
 	return pagecache_write(inode, buf, size, pos);
 }
 
+static void ext4_drop_page(struct page *page)
+{
+	put_page(page);
+}
+
 const struct fsverity_operations ext4_verityops = {
 	.begin_enable_verity	= ext4_begin_enable_verity,
 	.end_enable_verity	= ext4_end_enable_verity,
 	.get_verity_descriptor	= ext4_get_verity_descriptor,
 	.read_merkle_tree_page	= ext4_read_merkle_tree_page,
 	.write_merkle_tree_block = ext4_write_merkle_tree_block,
+	.drop_page		= &ext4_drop_page,
 };
diff --git a/fs/f2fs/verity.c b/fs/f2fs/verity.c
index 4fc95f353a7a..019c7a6c6bcf 100644
--- a/fs/f2fs/verity.c
+++ b/fs/f2fs/verity.c
@@ -283,10 +283,16 @@ static int f2fs_write_merkle_tree_block(struct inode *inode, const void *buf,
 	return pagecache_write(inode, buf, size, pos);
 }
 
+static void f2fs_drop_page(struct page *page)
+{
+	put_page(page);
+}
+
 const struct fsverity_operations f2fs_verityops = {
 	.begin_enable_verity	= f2fs_begin_enable_verity,
 	.end_enable_verity	= f2fs_end_enable_verity,
 	.get_verity_descriptor	= f2fs_get_verity_descriptor,
 	.read_merkle_tree_page	= f2fs_read_merkle_tree_page,
 	.write_merkle_tree_block = f2fs_write_merkle_tree_block,
+	.drop_page		= &f2fs_drop_page,
 };
diff --git a/fs/verity/read_metadata.c b/fs/verity/read_metadata.c
index 2aefc5565152..cab1612bf4a3 100644
--- a/fs/verity/read_metadata.c
+++ b/fs/verity/read_metadata.c
@@ -56,12 +56,12 @@ static int fsverity_read_merkle_tree(struct inode *inode,
 		virt = kmap_local_page(page);
 		if (copy_to_user(buf, virt + offs_in_page, bytes_to_copy)) {
 			kunmap_local(virt);
-			put_page(page);
+			inode->i_sb->s_vop->drop_page(page);
 			err = -EFAULT;
 			break;
 		}
 		kunmap_local(virt);
-		put_page(page);
+		inode->i_sb->s_vop->drop_page(page);
 
 		retval += bytes_to_copy;
 		buf += bytes_to_copy;
diff --git a/fs/verity/verify.c b/fs/verity/verify.c
index f50e3b5b52c9..c2fc4c86af34 100644
--- a/fs/verity/verify.c
+++ b/fs/verity/verify.c
@@ -210,7 +210,7 @@ verify_data_block(struct inode *inode, struct fsverity_info *vi,
 		if (is_hash_block_verified(vi, hpage, hblock_idx)) {
 			memcpy_from_page(_want_hash, hpage, hoffset, hsize);
 			want_hash = _want_hash;
-			put_page(hpage);
+			inode->i_sb->s_vop->drop_page(hpage);
 			goto descend;
 		}
 		hblocks[level].page = hpage;
@@ -248,7 +248,7 @@ verify_data_block(struct inode *inode, struct fsverity_info *vi,
 			SetPageChecked(hpage);
 		memcpy_from_page(_want_hash, hpage, hoffset, hsize);
 		want_hash = _want_hash;
-		put_page(hpage);
+		inode->i_sb->s_vop->drop_page(hpage);
 	}
 
 	/* Finally, verify the data block. */
@@ -259,7 +259,7 @@ verify_data_block(struct inode *inode, struct fsverity_info *vi,
 	err = cmp_hashes(vi, want_hash, real_hash, data_pos, -1);
 out:
 	for (; level > 0; level--)
-		put_page(hblocks[level - 1].page);
+		inode->i_sb->s_vop->drop_page(hblocks[level - 1].page);
 
 	return err == 0;
 }
diff --git a/include/linux/fsverity.h b/include/linux/fsverity.h
index 6d7a4b3ea626..3e923a8e0d6f 100644
--- a/include/linux/fsverity.h
+++ b/include/linux/fsverity.h
@@ -120,6 +120,16 @@ struct fsverity_operations {
 	 */
 	int (*write_merkle_tree_block)(struct inode *inode, const void *buf,
 				       u64 pos, unsigned int size);
+
+	/**
+	 * Release the reference to a Merkle tree page
+	 *
+	 * @page: the page to release
+	 *
+	 * This is called when fs-verity is done with a page obtained with
+	 * ->read_merkle_tree_page().
+	 */
+	void (*drop_page)(struct page *page);
 };
 
 #ifdef CONFIG_FS_VERITY
-- 
2.38.4



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
