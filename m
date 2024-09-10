Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 94EFB973B10
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Sep 2024 17:11:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1so2WH-0003hv-Av;
	Tue, 10 Sep 2024 15:11:05 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <joshi.k@samsung.com>) id 1so2WF-0003hi-PT
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Sep 2024 15:11:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pMYjZwpNA2424mhqR5If5Z9/oTINVKlEa7d3jWpwtNg=; b=I5Yw1D5xkT81Ie0xRSleVU84wY
 j83djq11ZZ7nMpmMUt42GRoiCjyZwBq2+WTIpTMCUipFrkdc9ZupDFLrmOjXhE3Vqgnb52Kidlcw5
 RXe/ooy41EO6u2VYNbraDM0N5wBe3RGQQ1Ihfu6XieqxfXJJ45borSS0mtCXsEP3s3UE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pMYjZwpNA2424mhqR5If5Z9/oTINVKlEa7d3jWpwtNg=; b=BC3XpfN5XiKis1yi3nWVQS0OYh
 b30/7X2Ewzdix9Dgp7Puf6/NFkQ/K505eCDAresj7rtgakjxHgvHPSUMbQLeBJJv021QC1BcCsRG7
 uiODPOT1HrUy9P43sQ8V00EyiQbu4gWx7e5UlpEaGLQM/gzteZgTElpo7WmZjwq5KLXg=;
Received: from mailout1.samsung.com ([203.254.224.24])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1so2WE-0006Ib-EG for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Sep 2024 15:11:03 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20240910151050epoutp019a288baa262f5ce92f27085d600b71f3~z6p8BwXDg0264502645epoutp01C
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 10 Sep 2024 15:10:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20240910151050epoutp019a288baa262f5ce92f27085d600b71f3~z6p8BwXDg0264502645epoutp01C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1725981050;
 bh=pMYjZwpNA2424mhqR5If5Z9/oTINVKlEa7d3jWpwtNg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=h1WnrO/gekVZ7sYzryzsoOY+6Ki1AWO4WmIm9ORHD2T3/XpK1/5gbB+rZ3egvF06D
 Oqn+E2DWQjox0PUupiKpYd8cCvoKfMKiQ8qER0Wg3/V8gFt/5scTzBljY5LekkjqjX
 yBy8L4pisrRUK6fDFlnPIucd2aE2QmJTdcd+l7ec=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTP id
 20240910151050epcas5p179ff3d5c1a23344350ef986991a1f492~z6p7VY4Pn0608306083epcas5p1F;
 Tue, 10 Sep 2024 15:10:50 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.178]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4X36bD6pwfz4x9Ps; Tue, 10 Sep
 2024 15:10:48 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
 epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 4B.86.09640.87160E66; Wed, 11 Sep 2024 00:10:48 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
 20240910151048epcas5p3c610d63022362ec5fcc6fc362ad2fb9f~z6p5sWm3Y0202102021epcas5p3K;
 Tue, 10 Sep 2024 15:10:48 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20240910151048epsmtrp1f4f0e75e2c26af28a4bad11e3192301c~z6p5rfzf-1279412794epsmtrp1C;
 Tue, 10 Sep 2024 15:10:48 +0000 (GMT)
X-AuditID: b6c32a49-aabb8700000025a8-69-66e06178b9ab
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 29.DC.08964.87160E66; Wed, 11 Sep 2024 00:10:48 +0900 (KST)
Received: from localhost.localdomain (unknown [107.99.41.245]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20240910151044epsmtip2969e9e84906072571198d274c61a89e4~z6p19uGJ71712417124epsmtip2t;
 Tue, 10 Sep 2024 15:10:44 +0000 (GMT)
From: Kanchan Joshi <joshi.k@samsung.com>
To: axboe@kernel.dk, kbusch@kernel.org, hch@lst.de, sagi@grimberg.me,
 martin.petersen@oracle.com, James.Bottomley@HansenPartnership.com,
 brauner@kernel.org, viro@zeniv.linux.org.uk, jack@suse.cz,
 jaegeuk@kernel.org, jlayton@kernel.org, chuck.lever@oracle.com,
 bvanassche@acm.org
Date: Tue, 10 Sep 2024 20:31:57 +0530
Message-Id: <20240910150200.6589-3-joshi.k@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240910150200.6589-1-joshi.k@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02TbUxbVRzGc+4t7WVSvCsTDjVseB1LQF7aCeWgsC3ayTXsA8liTPZBuKOX
 Qlra2ttuQCRDkCowB2IGo7yIuPE6N3lnQxJlq4gOQTYZMN4FmYOlUAKGDIYtZbpvv/M/z3P+
 5zkvBC5a4YuJZI2B1WsYNcXfw2u/5R8QlMpMJ0pWCyWocaKAjxZv2QAqXt7A0fbEAoZGf7iB
 ofpGC4bKSrIxNHfdjKOmAgL9Ob4qQBs1DQJk2X7MR0U9wwB1j72Ghqqj0ffdfTz0Vc28AOXf
 7+Sj2t6nGLq2aOWhga1eFzRgLhcc86Tv3ouhByabeHRx0S98+m6/kW5uyOXTLZfP0V1Vqxjd
 NZrJp1fmx3j0hdYGQN+pui2gV5v3081zj7FY4SlVZBLLKFi9L6tJ0CqSNcooKuZk3NtxYTKJ
 NEgagcIpXw2TwkZR8hOxQe8kq+2ZKd8zjNpoL8UyHEeFHInUa40G1jdJyxmiKFanUOtCdcEc
 k8IZNcpgDWt4QyqRHA6zC+NVSev5Vlxn2pu6NNgNMsGSMA+4EpAMhTMPanh5YA8hIrsArNn4
 FXcObABey2oHzsE6gNtN9eCZZfiPqV1VN4CtAw8EjgkRuQpgbtZbeYAg+KQ/HPzS6NDsIysx
 +NOgZWclnCzC4Mr0t3yHwYM8DhcXnuAO5pF+cOq7xp26kAyH6yPnBc5uB2Dp0D877EoiuFB7
 FXNq9sK+0jmeg3G7JrutbGdHkMx3hRUdm3ynWQ7LyocwJ3vAR72tu4uK4d8Fpl1WwenZaZ6T
 P4KdLRdcnHwUZm6OuDjS4PY012+GOHu5w8+fzGGOMiSF8DOTyKl+BU4Wze86veDMpcu7TMNR
 a6uL87DyAVzbvIEVggPm5yKYn4tg/r9bFcAbgDer41KULBemk2rYs//dbII2pRnsvP2AdzvB
 xPRycA/ACNADIIFT+4QFRyYTRUIFk5bO6rVxeqOa5XpAmP2Mv8DFLyVo7Z9HY4iThkZIQmUy
 WWjE6zIp5SVczKlQiEglY2BVLKtj9c98GOEqzsRUlVjCTP7X5vq2p7YrTR5z+005Xvc/MJX6
 HYJ6t8YraRGBFbk5A1nBzeFpqowtny5Z3FV5fGKfe5r/il+gMrptTXxT5Jls5Sy1jDlx69OM
 xJplIr3D09ta0GGZfdlN1iaMSU4fzpoypM7aKifbQ3j4nfXAk8d9sjuSvL5ZSZWE/V5+StNy
 ps5U0uXqc9v9EPUos9H//ItTbLW0YankdGSrUdbGnjt4Qlz6XpFtSz6e+3NK4ObHigrlbwuF
 n4wDeLpvW+6G8j588+yamBiJj33/4Y/31EOs1dZefdAil/uMHT08lTFV91DFjcZ6C/sv1jfV
 Hetzf5Uq7o/+a+2FkEsUj0tipAG4nmP+Be3mHYqEBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA02Ra0hTYQCG/b5zPDsuhqdpedLQNTLsZklRHyEWgXWofnQPup/0aJaba3Pd
 qJSsSdpcGZnOSovK3MLcskzULluilma10lymlsoslS0NU3Oa04L+PfA88P54SUxYhPuSMdJ4
 Ti5lY8UEH39kFgfMP8q2Ri1MtXsi/WcNgbrMvQBlOAYxNPrZBlHjsxKI8vUVEGVfSYKo/b4W
 QwYNidqa+nho8I6OhypGewiUbqoHqNw6F727uRqVlVfjKOdOBw+lNjwmUF7lCEQFXXYc1Tkr
 3VGd9ipvxVTG8n4tU9dswJmM9JcEY6lVMkbdOYJ5cCuBKc3tg0xpYyLB/Oiw4kxakQ4wNbkv
 eEyf0Z8xtvfA9YLt/NBILjbmMCdfELaXv78/1Y7JVJOPdr8pB4mgW5ACPEiaWkzXf2jBUgCf
 FFKlgG64/RZMCB86qX6AN8FedP6IjTcR/QB0R+VTmAJIkqBm028uKV2NN1UA6bsZ61wNRl2F
 dN65YswlvKhwusv2e5xxKpBuKdQTLhZQS+n+j+f/DgTQWe9+jbMHhWhb3j3oYuFY49Dkuk/0
 k+nqrHbcxdhYn/QwG7sAKO1/SvufygVQB6ZxMoUkWqIIkYVIuSPBClaiUEqjgyPiJEYwfuyc
 2Y9Bsc4RbAKQBCZAk5jYW6AJa44SCiLZY8c5edweuTKWU5iAH4mLfQQ+nepIIRXNxnMHOU7G
 yf9ZSHr4JsLruphiLvzJrCVKa1bmvmai6ROZFK4O3XLJTor2nfb6umF3uuXkW1KFV3Z/GU7I
 P1R/zSFPmxnkfxH0atb0nM/JvLkyecTk1zYvTbHMd8/mbwMZM7hpjT7uRaraGreHyVb4fJnB
 4l2SvzyCtULzT/nSRZcvhK72DPogCjLHHfzYuXZ4uv7TrnVemeqN3juPlzhPBW02idU2uG1I
 pyUWlIXXiCWxFaZW/vdvTqkscJto04Z7hcZU1c7rT8/49kWcMDj9p1iqRC9f2T23vp7kyKqS
 qg2li7Y4YU4o6Ta4Y+hsbWdUd5tbS3bTiPiax40dB0Q9hasWFpgzVYGCBlZXphfjiv1syBxM
 rmD/AE2dcMxHAwAA
X-CMS-MailID: 20240910151048epcas5p3c610d63022362ec5fcc6fc362ad2fb9f
X-Msg-Generator: CA
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240910151048epcas5p3c610d63022362ec5fcc6fc362ad2fb9f
References: <20240910150200.6589-1-joshi.k@samsung.com>
 <CGME20240910151048epcas5p3c610d63022362ec5fcc6fc362ad2fb9f@epcas5p3.samsung.com>
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: F_GET/SET_RW_HINT fcntl handlers query/set write life hints.
 Rename the handlers/helpers to be explicit that write life hints are being
 handled. This is in preparation to introduce a new interface that supports
 more than one type of write hint. 
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.24 listed in wl.mailspike.net]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.24 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1so2WE-0006Ib-EG
Subject: [f2fs-dev] [PATCH v5 2/5] fcntl: rename rw_hint_* to
 rw_lifetime_hint_*
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
Cc: vishak.g@samsung.com, linux-scsi@vger.kernel.org, gost.dev@samsung.com,
 linux-nvme@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 javier.gonz@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

F_GET/SET_RW_HINT fcntl handlers query/set write life hints.
Rename the handlers/helpers to be explicit that write life hints are
being handled.

This is in preparation to introduce a new interface that supports more
than one type of write hint.

Signed-off-by: Kanchan Joshi <joshi.k@samsung.com>
---
 fs/fcntl.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/fcntl.c b/fs/fcntl.c
index 300e5d9ad913..9df35e7ff754 100644
--- a/fs/fcntl.c
+++ b/fs/fcntl.c
@@ -269,7 +269,7 @@ static int f_getowner_uids(struct file *filp, unsigned long arg)
 }
 #endif
 
-static bool rw_hint_valid(u64 hint)
+static bool rw_lifetime_hint_valid(u64 hint)
 {
 	BUILD_BUG_ON(WRITE_LIFE_NOT_SET != RWH_WRITE_LIFE_NOT_SET);
 	BUILD_BUG_ON(WRITE_LIFE_NONE != RWH_WRITE_LIFE_NONE);
@@ -291,7 +291,7 @@ static bool rw_hint_valid(u64 hint)
 	}
 }
 
-static long fcntl_get_rw_hint(struct file *file, unsigned int cmd,
+static long fcntl_get_rw_lifetime_hint(struct file *file, unsigned int cmd,
 			      unsigned long arg)
 {
 	struct inode *inode = file_inode(file);
@@ -303,7 +303,7 @@ static long fcntl_get_rw_hint(struct file *file, unsigned int cmd,
 	return 0;
 }
 
-static long fcntl_set_rw_hint(struct file *file, unsigned int cmd,
+static long fcntl_set_rw_lifetime_hint(struct file *file, unsigned int cmd,
 			      unsigned long arg)
 {
 	struct inode *inode = file_inode(file);
@@ -312,7 +312,7 @@ static long fcntl_set_rw_hint(struct file *file, unsigned int cmd,
 
 	if (copy_from_user(&hint, argp, sizeof(hint)))
 		return -EFAULT;
-	if (!rw_hint_valid(hint))
+	if (!rw_lifetime_hint_valid(hint))
 		return -EINVAL;
 
 	WRITE_ONCE(inode->i_write_hint, hint);
@@ -449,10 +449,10 @@ static long do_fcntl(int fd, unsigned int cmd, unsigned long arg,
 		err = memfd_fcntl(filp, cmd, argi);
 		break;
 	case F_GET_RW_HINT:
-		err = fcntl_get_rw_hint(filp, cmd, arg);
+		err = fcntl_get_rw_lifetime_hint(filp, cmd, arg);
 		break;
 	case F_SET_RW_HINT:
-		err = fcntl_set_rw_hint(filp, cmd, arg);
+		err = fcntl_set_rw_lifetime_hint(filp, cmd, arg);
 		break;
 	default:
 		break;
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
