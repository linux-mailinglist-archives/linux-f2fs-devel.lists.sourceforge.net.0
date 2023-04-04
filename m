Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABE56D65E7
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Apr 2023 16:55:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pji3r-000219-Ua;
	Tue, 04 Apr 2023 14:55:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <aalbersh@redhat.com>) id 1pji3p-00020I-JB
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 14:55:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=395KBh5jpp5sBhV7lwrvunRnw3iYM/DZo2HMst97yLA=; b=Js+sZGjS1f/tBm0suP9qhcRZNQ
 w6pAci4QKhohDJJTG0qdtsIrMqoRV1I5a6NmGhk7Vp1MhIb10AtgTheXZ+yqigZTMxhFxyM2Hgdaw
 cS0I4Qxuh3Cj/2hcV96oQqqCBbpODZsqu4T7fapXdi1wQuGNfiswVCJZJ8LuirqLcIGI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=395KBh5jpp5sBhV7lwrvunRnw3iYM/DZo2HMst97yLA=; b=cRCDxKEQg4zwszm30Uk0oqvE8T
 b/yGAVPS5PxjsOaCXGA51VyUNteila7BNetID3Ww0zL/vYh/8zLdWd/XFMrTYeHl7Cu8Q/lWfurHw
 NcimTfR45QAJTHAh1p0N9XMl91zZB/Cc1RxY1tjkONQYgq81wVcEwbhwE7Dx4PVPH39M=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pji3n-00Ez68-M7 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 14:55:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680620093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=395KBh5jpp5sBhV7lwrvunRnw3iYM/DZo2HMst97yLA=;
 b=IhlfJpC8rch6n6zfr4CgOspSKpr/H0Ayl7ht/ivdNzS3qeltVvtlKuIdMprJzU+FejbZr5
 OWiXgpPGphd+52Y7nUiT5JAljOrvdVfw6mUY/wqRbijuaDX6zscHxYfro6hej+CH2nnUWs
 /DPdYD9tAUgeaXGs6+WpJXkRcr0aUnE=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-PALMfnE5OECukxVO4cxfzA-1; Tue, 04 Apr 2023 10:54:52 -0400
X-MC-Unique: PALMfnE5OECukxVO4cxfzA-1
Received: by mail-qt1-f199.google.com with SMTP id
 a19-20020a05622a02d300b003e4ecb5f613so16798676qtx.21
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 04 Apr 2023 07:54:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680620092;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=395KBh5jpp5sBhV7lwrvunRnw3iYM/DZo2HMst97yLA=;
 b=l2xpST2gWs73mYyHwNuClQNTf+83RV6fex4a+DW7VdPwe3rpjWwWH+8LFHDDAK0ZIu
 WS5hvFP9+XCWh5iaEWIDFMl2afRrv4WHhG4Y9zP0SDl7Zc5LHaRnlq7yXIhGCYVbMZXQ
 620V2JBwrhFo/pLmE6+KT+kqimgYRFhoAOnwLGZUHXnpYeEXujZBNmxlvFGLfc6Hi0dt
 pFg0K5L4n/L0Y52+vzzpaBlBQaLuZYHK4UzNVMzofTWzXJxWGaYs01iY/m1VOfuM4I1w
 Y1RU1oGpt298GgS6T5jOKqBVVOi4dm3+XyBd0dwNoEtpICyWK6E5xhsCoypWv35hd3qP
 JREQ==
X-Gm-Message-State: AAQBX9dpU7RDxDz9ifdbNJyfmnT26+S2L9LE9OVRgj/d/o0RISlXAunL
 AVWocmWzeJKFEoTCoSVOlQaZxqw0rlQXTFwDh+lXxI5doH7rJCXSB60VVwnrR4Hz4cQHRfSh+Pq
 HGEpqw8DoAdoqwIHoCNQrQdR8UQlWfchsb/y2
X-Received: by 2002:a05:622a:1495:b0:3e3:86d4:5df0 with SMTP id
 t21-20020a05622a149500b003e386d45df0mr3709064qtx.55.1680620092096; 
 Tue, 04 Apr 2023 07:54:52 -0700 (PDT)
X-Google-Smtp-Source: AKy350aPi48zuTVxqlQ2ykuKHu8ozrnZJsbxnbJpjnRK3ke426WVAPqcsUdJYViMl9WXPC5V56cQ2g==
X-Received: by 2002:a05:622a:1495:b0:3e3:86d4:5df0 with SMTP id
 t21-20020a05622a149500b003e386d45df0mr3709024qtx.55.1680620091642; 
 Tue, 04 Apr 2023 07:54:51 -0700 (PDT)
Received: from aalbersh.remote.csb ([109.183.6.197])
 by smtp.gmail.com with ESMTPSA id
 j4-20020ac86644000000b003e6387431dcsm3296539qtp.7.2023.04.04.07.54.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 07:54:51 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
To: djwong@kernel.org, dchinner@redhat.com, ebiggers@kernel.org,
 hch@infradead.org, linux-xfs@vger.kernel.org, fsverity@lists.linux.dev
Date: Tue,  4 Apr 2023 16:52:59 +0200
Message-Id: <20230404145319.2057051-4-aalbersh@redhat.com>
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
 Content preview:  From: Allison Henderson <allison.henderson@oracle.com> We
 need to define the parent pointer attribute format before we start adding
 support for it into all the code that needs to use it. The EA format we will
 use encodes the following information: 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [170.10.129.124 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.129.124 listed in list.dnswl.org]
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
X-Headers-End: 1pji3n-00Ez68-M7
Subject: [f2fs-dev] [PATCH v2 03/23] xfs: define parent pointer xattr format
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
 cluster-devel@redhat.com, Allison Henderson <allison.henderson@oracle.com>,
 rpeterso@redhat.com, xiang@kernel.org, jth@kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Allison Henderson <allison.henderson@oracle.com>

We need to define the parent pointer attribute format before we start
adding support for it into all the code that needs to use it. The EA
format we will use encodes the following information:

        name={parent inode #, parent inode generation, dirent offset}
        value={dirent filename}

The inode/gen gives all the information we need to reliably identify the
parent without requiring child->parent lock ordering, and allows
userspace to do pathname component level reconstruction without the
kernel ever needing to verify the parent itself as part of ioctl calls.

By using the dirent offset in the EA name, we have a method of knowing
the exact parent pointer EA we need to modify/remove in rename/unlink
without an unbound EA name search.

By keeping the dirent name in the value, we have enough information to
be able to validate and reconstruct damaged directory trees. While the
diroffset of a filename alone is not unique enough to identify the
child, the {diroffset,filename,child_inode} tuple is sufficient. That
is, if the diroffset gets reused and points to a different filename, we
can detect that from the contents of EA. If a link of the same name is
created, then we can check whether it points at the same inode as the
parent EA we current have.

Signed-off-by: Dave Chinner <dchinner@redhat.com>
Signed-off-by: Allison Henderson <allison.henderson@oracle.com>
Reviewed-by: Darrick J. Wong <djwong@kernel.org>
---
 fs/xfs/libxfs/xfs_da_format.h | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/fs/xfs/libxfs/xfs_da_format.h b/fs/xfs/libxfs/xfs_da_format.h
index 3dc03968bba6..b02b67f1999e 100644
--- a/fs/xfs/libxfs/xfs_da_format.h
+++ b/fs/xfs/libxfs/xfs_da_format.h
@@ -805,4 +805,29 @@ static inline unsigned int xfs_dir2_dirblock_bytes(struct xfs_sb *sbp)
 xfs_failaddr_t xfs_da3_blkinfo_verify(struct xfs_buf *bp,
 				      struct xfs_da3_blkinfo *hdr3);
 
+/*
+ * Parent pointer attribute format definition
+ *
+ * EA name encodes the parent inode number, generation and the offset of
+ * the dirent that points to the child inode. The EA value contains the
+ * same name as the dirent in the parent directory.
+ */
+struct xfs_parent_name_rec {
+	__be64  p_ino;
+	__be32  p_gen;
+	__be32  p_diroffset;
+};
+
+/*
+ * incore version of the above, also contains name pointers so callers
+ * can pass/obtain all the parent pointer information in a single structure
+ */
+struct xfs_parent_name_irec {
+	xfs_ino_t		p_ino;
+	uint32_t		p_gen;
+	xfs_dir2_dataptr_t	p_diroffset;
+	const char		*p_name;
+	uint8_t			p_namelen;
+};
+
 #endif /* __XFS_DA_FORMAT_H__ */
-- 
2.38.4



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
