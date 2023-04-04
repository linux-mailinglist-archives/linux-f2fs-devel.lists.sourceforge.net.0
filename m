Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D20F06D6615
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Apr 2023 16:56:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pji4n-00081f-Rx;
	Tue, 04 Apr 2023 14:56:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <aalbersh@redhat.com>) id 1pji4m-00081J-PX
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 14:56:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WW1Er4PupDb0BosAfd03U+k3CW0R0JjVRop2pX5rde0=; b=a2Ty/iOHqenDAveN5jI24SnnSj
 zuGNFh1/Qrzzv+p5pztjOYfxla57xK4gUI6xAsqEj64F4LUOoXZmBsmPXLBeW+oSKqQLny61xev/G
 TQX30QjTC7lhySDd7gzgdsJ3Zdsl0ryelnVksjW/fJag+db2dpf0eOEfwDRQXJOm3fDQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WW1Er4PupDb0BosAfd03U+k3CW0R0JjVRop2pX5rde0=; b=A0da1yiY56H1FfpZ+hCWhnFBuK
 voi/XR6sIEFmhqdq9Ok9bp7EArGumftIrAzmfSxg/R5f8ohOkw1hMdQanUE5Tivu0XKAvrQgY1U92
 0Ho2Dm8JLqbxFcBoELh6U3ihf2LacblHevpFaDb+HuvQ7IE3O+uzeVv6z1Ted/jQyRP8=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pji4h-00027n-Mn for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 14:55:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680620149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WW1Er4PupDb0BosAfd03U+k3CW0R0JjVRop2pX5rde0=;
 b=UM7AazlODqRxpwtytgD801xNh0DStSimcbOlVnKnSgz4beo0zC4xeIzlE8KHARZ2AxP8iT
 Rcq6B2AOkKf0OU8LJcz2T8COKdqnzRlxHUYIa7sgXkHTh09yQMhCXiY0GxD0kduGRo8Mwh
 YkMEWLpXOuCDExDck/URr2Fwm/6GPGk=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-cO3yT23dM4etCY92qZiqZw-1; Tue, 04 Apr 2023 10:55:48 -0400
X-MC-Unique: cO3yT23dM4etCY92qZiqZw-1
Received: by mail-qt1-f197.google.com with SMTP id
 l13-20020a05622a174d00b003e4df699997so20089051qtk.20
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 04 Apr 2023 07:55:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680620144;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WW1Er4PupDb0BosAfd03U+k3CW0R0JjVRop2pX5rde0=;
 b=6oxChwFmTVSDs2+jj8Qc5pMq4cpjcNnPJJByQTEKTzl/SZ67rsvUWIhvErdmTqEgFD
 Rp5KWXEN3Brfb/wa53TeNd4W/DJETXGfBr2yHhMVTFKgp5zTkqqyegWdsQjXcladFV4V
 aJOdZHv5oFR0iFz4f+jI2mOHhMjha3Nk7h/y7bplWCYo0O59GsEkG9Ct674jMXaOe+vM
 s/bZjZ4EfuYi3ywYBgRQ1VmdGEWeYrwJ8dLXH77dq47COOUWe7rQhETlUyILyR4jwvbc
 O0PR3Z4TYjNEnTux+hWHLF3jiBydd/dwVg0NWymd892IJz3NRPqxCNQikUlh31z+4dAT
 oMJQ==
X-Gm-Message-State: AAQBX9fdutrsBpZrU2KL4fmsFvaq/w/NngwrbathMVrMenV43v8kvAeE
 XwDSNjUm7qhX3p1mkXoixKPLnCs6LJMo+fNGEK9SPmvXBkeY6HCWxyDGjy6RXvWta2IhD2Ylvoq
 EZNty9qaZC8cikrtO4dgns3ZQtk5109rbYv7O
X-Received: by 2002:ac8:5c84:0:b0:3bf:da69:8f74 with SMTP id
 r4-20020ac85c84000000b003bfda698f74mr3767019qta.39.1680620144599; 
 Tue, 04 Apr 2023 07:55:44 -0700 (PDT)
X-Google-Smtp-Source: AKy350aLDs2V7JY0pZuUB09/Ptq0L7v7I2lb1rRcVAQ1NVCDKigQ1vtszHxXzaOscw9+3+n++r92jw==
X-Received: by 2002:ac8:5c84:0:b0:3bf:da69:8f74 with SMTP id
 r4-20020ac85c84000000b003bfda698f74mr3766987qta.39.1680620144232; 
 Tue, 04 Apr 2023 07:55:44 -0700 (PDT)
Received: from aalbersh.remote.csb ([109.183.6.197])
 by smtp.gmail.com with ESMTPSA id
 j4-20020ac86644000000b003e6387431dcsm3296539qtp.7.2023.04.04.07.55.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 07:55:43 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
To: djwong@kernel.org, dchinner@redhat.com, ebiggers@kernel.org,
 hch@infradead.org, linux-xfs@vger.kernel.org, fsverity@lists.linux.dev
Date: Tue,  4 Apr 2023 16:53:15 +0200
Message-Id: <20230404145319.2057051-20-aalbersh@redhat.com>
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
 Content preview:  The direct path is not supported on verity files. Attempts
 to use direct I/O path on such files should fall back to buffered I/O path.
 Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com> --- fs/xfs/xfs_file.c
 | 14 +++++++++++--- 1 file changed, 11 insertions(+), 3 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
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
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [170.10.133.124 listed in wl.mailspike.net]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pji4h-00027n-Mn
Subject: [f2fs-dev] [PATCH v2 19/23] xfs: disable direct read path for
 fs-verity sealed files
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

The direct path is not supported on verity files. Attempts to use direct
I/O path on such files should fall back to buffered I/O path.

Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
---
 fs/xfs/xfs_file.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
index 947b5c436172..9e072e82f6c1 100644
--- a/fs/xfs/xfs_file.c
+++ b/fs/xfs/xfs_file.c
@@ -244,7 +244,8 @@ xfs_file_dax_read(
 	struct kiocb		*iocb,
 	struct iov_iter		*to)
 {
-	struct xfs_inode	*ip = XFS_I(iocb->ki_filp->f_mapping->host);
+	struct inode		*inode = iocb->ki_filp->f_mapping->host;
+	struct xfs_inode	*ip = XFS_I(inode);
 	ssize_t			ret = 0;
 
 	trace_xfs_file_dax_read(iocb, to);
@@ -297,10 +298,17 @@ xfs_file_read_iter(
 
 	if (IS_DAX(inode))
 		ret = xfs_file_dax_read(iocb, to);
-	else if (iocb->ki_flags & IOCB_DIRECT)
+	else if (iocb->ki_flags & IOCB_DIRECT && !fsverity_active(inode))
 		ret = xfs_file_dio_read(iocb, to);
-	else
+	else {
+		/*
+		 * In case fs-verity is enabled, we also fallback to the
+		 * buffered read from the direct read path. Therefore,
+		 * IOCB_DIRECT is set and need to be cleared
+		 */
+		iocb->ki_flags &= ~IOCB_DIRECT;
 		ret = xfs_file_buffered_read(iocb, to);
+	}
 
 	if (ret > 0)
 		XFS_STATS_ADD(mp, xs_read_bytes, ret);
-- 
2.38.4



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
