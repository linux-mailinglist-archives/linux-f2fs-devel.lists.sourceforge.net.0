Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4993695F7AC
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Aug 2024 19:14:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sidId-00052A-3b;
	Mon, 26 Aug 2024 17:14:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <joshi.k@samsung.com>) id 1sidIb-00051y-FO
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Aug 2024 17:14:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dvmnXluL763m/k/i9q5rrEgvQ+XYswDEKR5fFJwq0zY=; b=fx/mZS3TaRTXoWI4skzQfCcn6j
 OiRP9U7N1N4wMFoQD+7vHyGj5toMVKMzJZo1JdUc5CrL6oMoSfxvJhekAaAQ6ShQ5cOS/buhkxfd+
 lGpoCIolr7fTC7As6oIGAG2mCRpj8Yz2EgD4+OGK4YBuF2961ygVHVI2ikpvZKfyiF/A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dvmnXluL763m/k/i9q5rrEgvQ+XYswDEKR5fFJwq0zY=; b=CyyZABnJSBe+s9gEE8e+m5e7xl
 ksqtEDVJsDCLRVadtsYsV+V6NiQ7hX0EhcSjqn2H9A5dl6aOOeiV0X5KXRTr875aEY6cI3D9Z2J/f
 PTo+QENZ1n+kbaAJhmvSrdwXCqeDbTKdB5dAVCPc6xRr86cJxuJHf+tvRKaTh7Z8QGr8=;
Received: from mailout1.samsung.com ([203.254.224.24])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sidIW-0005IV-S7 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Aug 2024 17:14:33 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20240826171420epoutp010997112718283edb68ccfad6b390d29b~vVqe27meG0148601486epoutp01v
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 26 Aug 2024 17:14:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20240826171420epoutp010997112718283edb68ccfad6b390d29b~vVqe27meG0148601486epoutp01v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1724692460;
 bh=dvmnXluL763m/k/i9q5rrEgvQ+XYswDEKR5fFJwq0zY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WFfY1jcwoJQ7QQ43GdoomZSnARi7RvDtwJOeywCslMObHyPHu/+S7VeWrF4zzNEKN
 zB6FNbCioR14iuWC+EXawfBAf97MIuUSdlftEMo2Mc0r6UBrkhMcC6npg3RokJbnsB
 f5+Rr5WaasQVzwCfYYfMzq9tJuLp2atyTlSPskp0=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTP id
 20240826171419epcas5p23cc7ff5eeadbd876a1ae23a70d292612~vVqeOcWQv0605906059epcas5p2q;
 Mon, 26 Aug 2024 17:14:19 +0000 (GMT)
Received: from epsmgec5p1-new.samsung.com (unknown [182.195.38.178]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4Wsy2f1scRz4x9Pt; Mon, 26 Aug
 2024 17:14:18 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
 epsmgec5p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
 09.67.19863.AE7BCC66; Tue, 27 Aug 2024 02:14:18 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
 20240826171417epcas5p1c6dbe318c43324116647dae2129b7eb3~vVqcNuU9j0392603926epcas5p1p;
 Mon, 26 Aug 2024 17:14:17 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20240826171417epsmtrp2d498a352e437e2c14cc2c22ecf314eff~vVqcMys6o3048030480epsmtrp2i;
 Mon, 26 Aug 2024 17:14:17 +0000 (GMT)
X-AuditID: b6c32a50-ef5fe70000004d97-80-66ccb7ea69f1
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 5C.3E.08964.9E7BCC66; Tue, 27 Aug 2024 02:14:17 +0900 (KST)
Received: from localhost.localdomain (unknown [107.99.41.245]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20240826171413epsmtip2407f4dc023aef06fcca161d1f824ce43~vVqYlY3Pe0834608346epsmtip2O;
 Mon, 26 Aug 2024 17:14:13 +0000 (GMT)
From: Kanchan Joshi <joshi.k@samsung.com>
To: axboe@kernel.dk, kbusch@kernel.org, hch@lst.de, sagi@grimberg.me,
 martin.petersen@oracle.com, James.Bottomley@HansenPartnership.com,
 brauner@kernel.org, jack@suse.cz, jaegeuk@kernel.org, jlayton@kernel.org,
 chuck.lever@oracle.com, bvanassche@acm.org
Date: Mon, 26 Aug 2024 22:36:03 +0530
Message-Id: <20240826170606.255718-3-joshi.k@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240826170606.255718-1-joshi.k@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01Te0xTVxjfubfcFmPNHS9PukzwRk2AgXSWejCUjUHmTWBJo4uZ4gKFXgqh
 tLWPbSK6GpxxRWBW8IFusNkVLZFnN1AsMBgqhMVN2HiMlwxkg2F5SnAIa2nd/O/3/b7f933n
 951zOLjXnwSPk67QMmqFRE4RG1jftwYGhUzWdaaGzS6zUflgAYGmWucAujCzjKO1wQkM9TXf
 wtCN8jYMXbmYg6GxymIcVRdw0B8D82y0bLawUdvaNIGMLb8BZOsPRg+/2Yvu2NpZqMQ8zka5
 PfUEKru3iqGKKTsLPSi+yn7bl+7qjqMfDFWz6AvGDoLu+klH11g+J+ha06d0Q+k8Rjf06Ql6
 dryfRedbLYDuLP2RTc/XbBFvPJQRmcZIpIw6gFGkKKXpCpmIitufGJMYLgzjh/Aj0G4qQCHJ
 ZERUbLw45N10ucMpFfCRRK5zUGKJRkPtjIpUK3VaJiBNqdGKKEYllasEqlCNJFOjU8hCFYx2
 Dz8s7M1whzApI+3W7R/YqifkJ/3TvYQedHMNwJMDSQGsHjYAA9jA8SLvANjzuJFwBXMArpqL
 2K7gKYALPSXEi5LFbquHK2ED8Jepk27VPID9dT2ODIdDkIHw5/M6J+9D5mCw+uaz9b44acTg
 7MhNwinyJqNhlUno7Moit8NnV+0sJ+aSEdCWOwdc0/zh5YdLbCf2JPfAtRk726V5FbZfHlvX
 4w5NzndXcGd/SK5x4JmKAbarOBaW5i+6j+0NJ+9Z3TwPzj+xufkMODI6wnLhbFhfm+/hwm9B
 /UrvuhncYaby9k7XrE0w758xzElDkgvPnPZyqbfCIeO4u3IzfHTJ5MY0LD9dhLn2kwdgR1Mf
 9gXwL37JQvFLFor/n1YKcAvgMSpNpoxJCVfxQxTMx/9dbYoyswasP/kgcT0or3oe2gIwDmgB
 kINTPtwtXe2pXlyp5GgWo1YmqnVyRtMCwh1LPofzfFOUjj+j0CbyBRFhAqFQKIjYJeRTm7lT
 n30p9SJlEi2TwTAqRv2iDuN48vSYXMYrPDylMMe3W2WvNG6ffGwkRoriizS6OCJhcLluOqUh
 q/BEY83Zi6bRCqqk71DZwWOvLVpOZX9rP9UafbdAKho+jgX/fTDuHDI0rRzdZr5vN+iphHGZ
 PXLh99QDMW8kd3oXHnkeawod35R1LMOn6YMb7w+1Lw1HJe3Ajjwa8c00iBPLmnFT7u5Kv/OX
 KhfwkNS9QkFOi35maIywl5yNtgXHnFw5vk8b3xzrJ1r1r772dWDUh9GtMR1iUf5fvPeWTEkT
 PX0r9Xn04Mx9j63i2oEVv962X0drVlXWA9etydy70yf2b/TP+mrCHvE6siQbdyWkU9zD7zxN
 mNRWZV+7bqZYmjQJPwhXayT/Akz0UW97BAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBIsWRmVeSWpSXmKPExsWy7bCSvO7L7WfSDN7s1rBYfbefzeL14U+M
 FtM+/GS2+H/3OZPFzQM7mSxWrj7KZDF7ejOTxZP1s5gtNvZzWDy+85nd4ueyVewWR/+/ZbOY
 dOgao8XeW9oWlxa5W+zZe5LFYv6yp+wW3dd3sFksP/6PyWLd6/csFudnzWF3EPW4fMXb4/y9
 jSwe0yadYvO4fLbUY9OqTjaPzUvqPXYv+MzksftmA5vHx6e3WDz6tqxi9Diz4Ai7x+dNcgE8
 UVw2Kak5mWWpRfp2CVwZO3cdZC94J1Bx6+0NtgbGK7xdjJwcEgImEl+vbGEFsYUEdjNKbHpa
 DREXl2i+9oMdwhaWWPnvOTtEzUdGiedf+bsYOTjYBDQlLkwu7WLk4hARmMwk0fRwCwuIwyww
 h0lieed2ZpAiYQFHiQ1LzEB6WQRUJX7Nec8CYvMKWErs7f7ECDFfXmLmpe9g8zkFrCT+f3gP
 tctSYuWZ5ewQ9YISJ2c+AetlBqpv3jqbeQKjwCwkqVlIUgsYmVYxSqYWFOem5xYbFhjmpZbr
 FSfmFpfmpesl5+duYgRHppbmDsbtqz7oHWJk4mA8xCjBwawkwit3+WSaEG9KYmVValF+fFFp
 TmrxIUZpDhYlcV7xF70pQgLpiSWp2ampBalFMFkmDk6pBqaI361bzdYefGvotaUs0pcxS1Zz
 X6zrROkJOuGZtVszXeapXojrEYj2upp1teTdynKVzLKYa3o/lrAcedEWaHdJ/HLAJ59nXCmz
 xTYZP3345lLWgsVzXp8Snez4WvDx72/vtjTfEJPT+bdoZ+rjhwwrg/fM85hv90L0cs2NT34K
 pfq8em++RTv+vs8Z7H45UtnC6cPnXi+2dqfP2iekMu0X2/dfzUxq2CvvMCVLeT1HtNXVlze4
 AiSyF4i6/NucvXyB5Ro5Y5EZ0tOVXL0X+rlG2h6eF2djdiDoRmLDvqrKdfucV6bu9FW7fKp6
 +dPqHpGia0t+W374HKJ1w2ndooVXRc/fPpe9/E+seVRvpLsSS3FGoqEWc1FxIgAB0w2bOwMA
 AA==
X-CMS-MailID: 20240826171417epcas5p1c6dbe318c43324116647dae2129b7eb3
X-Msg-Generator: CA
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240826171417epcas5p1c6dbe318c43324116647dae2129b7eb3
References: <20240826170606.255718-1-joshi.k@samsung.com>
 <CGME20240826171417epcas5p1c6dbe318c43324116647dae2129b7eb3@epcas5p1.samsung.com>
X-Spam-Score: -5.2 (-----)
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
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: samsung.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [203.254.224.24 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [203.254.224.24 listed in bl.score.senderscore.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [203.254.224.24 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.24 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sidIW-0005IV-S7
Subject: [f2fs-dev] [PATCH v4 2/5] fcntl: rename rw_hint_* to rw_life_hint_*
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
index 300e5d9ad913..46cf08f67278 100644
--- a/fs/fcntl.c
+++ b/fs/fcntl.c
@@ -269,7 +269,7 @@ static int f_getowner_uids(struct file *filp, unsigned long arg)
 }
 #endif
 
-static bool rw_hint_valid(u64 hint)
+static bool rw_life_hint_valid(u64 hint)
 {
 	BUILD_BUG_ON(WRITE_LIFE_NOT_SET != RWH_WRITE_LIFE_NOT_SET);
 	BUILD_BUG_ON(WRITE_LIFE_NONE != RWH_WRITE_LIFE_NONE);
@@ -291,7 +291,7 @@ static bool rw_hint_valid(u64 hint)
 	}
 }
 
-static long fcntl_get_rw_hint(struct file *file, unsigned int cmd,
+static long fcntl_get_rw_life_hint(struct file *file, unsigned int cmd,
 			      unsigned long arg)
 {
 	struct inode *inode = file_inode(file);
@@ -303,7 +303,7 @@ static long fcntl_get_rw_hint(struct file *file, unsigned int cmd,
 	return 0;
 }
 
-static long fcntl_set_rw_hint(struct file *file, unsigned int cmd,
+static long fcntl_set_rw_life_hint(struct file *file, unsigned int cmd,
 			      unsigned long arg)
 {
 	struct inode *inode = file_inode(file);
@@ -312,7 +312,7 @@ static long fcntl_set_rw_hint(struct file *file, unsigned int cmd,
 
 	if (copy_from_user(&hint, argp, sizeof(hint)))
 		return -EFAULT;
-	if (!rw_hint_valid(hint))
+	if (!rw_life_hint_valid(hint))
 		return -EINVAL;
 
 	WRITE_ONCE(inode->i_write_hint, hint);
@@ -449,10 +449,10 @@ static long do_fcntl(int fd, unsigned int cmd, unsigned long arg,
 		err = memfd_fcntl(filp, cmd, argi);
 		break;
 	case F_GET_RW_HINT:
-		err = fcntl_get_rw_hint(filp, cmd, arg);
+		err = fcntl_get_rw_life_hint(filp, cmd, arg);
 		break;
 	case F_SET_RW_HINT:
-		err = fcntl_set_rw_hint(filp, cmd, arg);
+		err = fcntl_set_rw_life_hint(filp, cmd, arg);
 		break;
 	default:
 		break;
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
