Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 180B095F7AD
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Aug 2024 19:14:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sidId-0003A0-5i;
	Mon, 26 Aug 2024 17:14:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <joshi.k@samsung.com>) id 1sidIb-00039u-HN
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Aug 2024 17:14:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QlraUz7mWC5TpMsZSNLhl1IWSfYiPF9JCt4MhSxeqoQ=; b=LkIsEZVEP5h5Ol96wkRi5HJIXV
 k5oZpsZkUUHnI+PXxkxziuyyx0mRSmGP2pz9O49pLAdLapSVGRXZVzgv1fDVEMAL1NhLRkOP160cS
 zW8cP1C8xvNQqCbifNN8fvtu6yJtakEYzE2UN9ITqO+qSThC0Az7NAVIRCE9yQPQ/NXQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QlraUz7mWC5TpMsZSNLhl1IWSfYiPF9JCt4MhSxeqoQ=; b=KcpWkvjLBRqJ4wCMU+fVOcbgry
 +LxDnV6BKINVOG5nBT3ywZURIBHQlNPRQWk4aupHbVWhxIH49iLaaVuIIddAysJqj6++ZcSFz6rYA
 PtwkSM3XgAG5dDR0S6wBLnjit8xKSSRupOEwMAC+dmoBzE3W9KQKB7el6r8+tn6tCcfY=;
Received: from mailout3.samsung.com ([203.254.224.33])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sidIa-0005If-Uf for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Aug 2024 17:14:38 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20240826171425epoutp03044b084a979256e92e476086aaa44966~vVqjDo38n0986009860epoutp03e
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 26 Aug 2024 17:14:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20240826171425epoutp03044b084a979256e92e476086aaa44966~vVqjDo38n0986009860epoutp03e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1724692465;
 bh=QlraUz7mWC5TpMsZSNLhl1IWSfYiPF9JCt4MhSxeqoQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NRsw+253QMVRB0m/LvwfxTc8ZOEb1ce7akJ5B0DUuK76F3H6yC4GTBvpABG7v54Gt
 hB2+RIsvqxj/7QaHKwydtBjUhafZtJvyz2ZoFgRunRun0n6FITtrGlHv/395IfdG8/
 yfIYeAUa9QotfgpKG3ZQlAS/ed9DnMptaUuaqTWk=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTP id
 20240826171424epcas5p19fd9d13160492dad59fc62ede3ae8b40~vVqiicTjz0279002790epcas5p1B;
 Mon, 26 Aug 2024 17:14:24 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.174]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4Wsy2k6F6Dz4x9Pp; Mon, 26 Aug
 2024 17:14:22 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
 epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 2B.A0.09640.EE7BCC66; Tue, 27 Aug 2024 02:14:22 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
 20240826171422epcas5p2fa8f07dfee9395745f1833a17fd89ae0~vVqgJJQK20606606066epcas5p2b;
 Mon, 26 Aug 2024 17:14:22 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20240826171422epsmtrp2c1f602264c43742010b82095caff9901~vVqgIV8sL3048030480epsmtrp2k;
 Mon, 26 Aug 2024 17:14:22 +0000 (GMT)
X-AuditID: b6c32a49-a57ff700000025a8-a3-66ccb7eef81b
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
 2E.51.19367.DE7BCC66; Tue, 27 Aug 2024 02:14:21 +0900 (KST)
Received: from localhost.localdomain (unknown [107.99.41.245]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20240826171417epsmtip2300cf238d11e054982f5ca67e497e4ab~vVqcWaisS0040200402epsmtip2e;
 Mon, 26 Aug 2024 17:14:17 +0000 (GMT)
From: Kanchan Joshi <joshi.k@samsung.com>
To: axboe@kernel.dk, kbusch@kernel.org, hch@lst.de, sagi@grimberg.me,
 martin.petersen@oracle.com, James.Bottomley@HansenPartnership.com,
 brauner@kernel.org, jack@suse.cz, jaegeuk@kernel.org, jlayton@kernel.org,
 chuck.lever@oracle.com, bvanassche@acm.org
Date: Mon, 26 Aug 2024 22:36:04 +0530
Message-Id: <20240826170606.255718-4-joshi.k@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240826170606.255718-1-joshi.k@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrDJsWRmVeSWpSXmKPExsWy7bCmpu677WfSDL7/0rRYfbefzeL14U+M
 FtM+/GS2+H/3OZPFzQM7mSxWrj7KZDF7ejOTxZP1s5gtNvZzWDy+85nd4ueyVewWR/+/ZbOY
 dOgao8XeW9oWlxa5W+zZe5LFYv6yp+wW3dd3sFksP/6PyWLb7/nMFutev2exOD9rDruDmMfl
 K94e5+9tZPGYNukUm8fls6Uem1Z1snlsXlLvsXvBZyaP3Tcb2Dw+Pr3F4tG3ZRWjx5kFR9g9
 Pm+SC+CJyrbJSE1MSS1SSM1Lzk/JzEu3VfIOjneONzUzMNQ1tLQwV1LIS8xNtVVy8QnQdcvM
 AXpXSaEsMacUKBSQWFyspG9nU5RfWpKqkJFfXGKrlFqQklNgUqBXnJhbXJqXrpeXWmJlaGBg
 ZApUmJCdMefBNOaCv1oV7aseMjYwvlHqYuTkkBAwkdhzaQtzFyMXh5DAbkaJ0x3HWSGcT4wS
 jRNfMsE5b1Z8Y4VpeTX7LlTVTkaJqb3tbBDOZ0aJc6eaGLsYOTjYBDQlLkwuBYmLCDQzSWxc
 +wusiFlgN5PEgq7/zCBFwgKWEnseWIJMZRFQlTj/dTY7iM0LFG6fvZwJYpu8xMxL38HinAJW
 Ev8/vIeqEZQ4OfMJC4jNDFTTvHU22BMSAj84JF5suQB1qovEvs7bLBC2sMSr41vYIWwpic/v
 9rJB2NkSDx49gKqpkdixuQ+q116i4c8NVpA7mYGeWb9LH2IXn0Tv7ydMIGEJAV6JjjYhiGpF
 iXuTnkJ1iks8nLEEyvaQuPv3CzSwehkl5h9/wzKBUX4WkhdmIXlhFsK2BYzMqxglUwuKc9NT
 i00LDPNSy+Exm5yfu4kRnOy1PHcw3n3wQe8QIxMH4yFGCQ5mJRFeucsn04R4UxIrq1KL8uOL
 SnNSiw8xmgLDeCKzlGhyPjDf5JXEG5pYGpiYmZmZWBqbGSqJ875unZsiJJCeWJKanZpakFoE
 08fEwSnVwKSau+vF5vCFhwqDZ+xtEFvmXm0p9qyzK0/VUGNvwLugNIVs/b33/vM6hve4scz6
 mrfgDmNk+9RjnveaZ6s7HJaOf/Wq2+OZisu3OUu+KjTLLutawfzqOytXosyEpY++NDwQuFyT
 q3Ot3kdYQ1z88iTJv+cm9M0NvSrhu/+IoHL1rwrmW/m/NX4cnH3S8mmMQ5WRrOyeX2823Dct
 r1ofcPg4x7l15xu5hGYzCl9VmRRZt/0f2zs5U+Vsv5T56edK1hceW97A8HO+S8nWYwILfcOq
 88+H12jUWF/YvzHprceeV4ohP6tbNG/nvHd1UGwJTCnVju7MPlTV/ij5tOyBz1vOBlSvs/xk
 t4JdjctpqhJLcUaioRZzUXEiAMWP8nd/BAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNIsWRmVeSWpSXmKPExsWy7bCSvO7b7WfSDC5uN7VYfbefzeL14U+M
 FtM+/GS2+H/3OZPFzQM7mSxWrj7KZDF7ejOTxZP1s5gtNvZzWDy+85nd4ueyVewWR/+/ZbOY
 dOgao8XeW9oWlxa5W+zZe5LFYv6yp+wW3dd3sFksP/6PyWLb7/nMFutev2exOD9rDruDmMfl
 K94e5+9tZPGYNukUm8fls6Uem1Z1snlsXlLvsXvBZyaP3Tcb2Dw+Pr3F4tG3ZRWjx5kFR9g9
 Pm+SC+CJ4rJJSc3JLEst0rdL4MqY82Aac8FfrYr2VQ8ZGxjfKHUxcnJICJhIvJp9l7WLkYtD
 SGA7o8Tb47uZIBLiEs3XfrBD2MISK/89Z4co+sgoMa+tG6iIg4NNQFPiwuRSkLiIwGQmiaaH
 W1hAHGaBo0wSW2fuYwUpEhawlNjzwBJkEIuAqsT5r7PBhvIChdtnL4daJi8x89J3sDingJXE
 /w/vwWwhoJqVZ5ZD1QtKnJz5hAXEZgaqb946m3kCo8AsJKlZSFILGJlWMYqmFhTnpucmFxjq
 FSfmFpfmpesl5+duYgTHp1bQDsZl6//qHWJk4mA8xCjBwawkwit3+WSaEG9KYmVValF+fFFp
 TmrxIUZpDhYlcV7lnM4UIYH0xJLU7NTUgtQimCwTB6dUA5NwpdW8GdZbF6cERizt02P/Xx5j
 s+M8l3SYaErctgkG4R7rvUqUXU1cn4TJdrYu1l/3ZNGr83cC211mP44qNAqeeIThr7meRFzW
 1PnRUwpqJ1Ws+1/V+O+P4HHLa7Ud/q0TfExbt/K0FB5dZxD8TXiHbWiftb/2J0Zz59D71ysa
 5n93lq8tnZW0VUnndY/U3vDl+532KhvN/8WWFLueuyxp02KZe+K3tslvkn3Md3fZq7m50tHB
 bp7Zf0+/2J8pe/rYtHjnPT8vyHFMEVm84qlxfrXSUoc76ltC10Ve3im5JMkjoiox/dWt6AmH
 a0V1NQQvx2U47XxZlzOL5/WRGVcqXWZ9brD63/qOK2jtCSWW4oxEQy3mouJEAD2lDs0+AwAA
X-CMS-MailID: 20240826171422epcas5p2fa8f07dfee9395745f1833a17fd89ae0
X-Msg-Generator: CA
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240826171422epcas5p2fa8f07dfee9395745f1833a17fd89ae0
References: <20240826170606.255718-1-joshi.k@samsung.com>
 <CGME20240826171422epcas5p2fa8f07dfee9395745f1833a17fd89ae0@epcas5p2.samsung.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This is similar to existing F_{SET/GET}_RW_HINT but more
 generic/extensible.
 F_SET/GET_RW_HINT_EX take a pointer to a struct rw_hint_ex as argument: struct
 rw_hint_ex { __u8 type; __u8 pad[7]; __u64 val; }; 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: samsung.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [203.254.224.33 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [203.254.224.33 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.33 listed in wl.mailspike.net]
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
X-Headers-End: 1sidIa-0005If-Uf
Subject: [f2fs-dev] [PATCH v4 3/5] fcntl: add F_{SET/GET}_RW_HINT_EX
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
 javier.gonz@samsung.com, Nitesh Shetty <nj.shetty@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This is similar to existing F_{SET/GET}_RW_HINT but more
generic/extensible.

F_SET/GET_RW_HINT_EX take a pointer to a struct rw_hint_ex as argument:

struct rw_hint_ex {
        __u8    type;
        __u8    pad[7];
        __u64   val;
};

With F_SET_RW_HINT_EX, the user passes the hint type and its value.
Hint type can be either life hint (TYPE_RW_LIFE_HINT) or placement hint
(TYPE_RW_PLACEMENT_HINT). The interface allows to add more hint types in
future.

Valid values for life hints are same as enforced by existing
fcntl(F_SET_RW_HINT).
Valid values for placement hints are between 0 to 127, both inclusive.

The inode retains either the life hint or the placement hint, whichever
is set later. The set hint type and its value can be queried by
F_GET_RW_HINT_EX.

The i_write_hint field of the inode is a 1-byte field. Use the most
significant bit as the hint type. This bit is set for placement hint.
For life hint, this bit remains zero.

Signed-off-by: Kanchan Joshi <joshi.k@samsung.com>
Signed-off-by: Nitesh Shetty <nj.shetty@samsung.com>
---
 fs/fcntl.c                 | 67 ++++++++++++++++++++++++++++++++++++++
 include/linux/rw_hint.h    | 13 ++++++++
 include/uapi/linux/fcntl.h | 14 ++++++++
 3 files changed, 94 insertions(+)

diff --git a/fs/fcntl.c b/fs/fcntl.c
index 46cf08f67278..d82fd4142104 100644
--- a/fs/fcntl.c
+++ b/fs/fcntl.c
@@ -291,6 +291,14 @@ static bool rw_life_hint_valid(u64 hint)
 	}
 }
 
+static inline bool rw_placement_hint_valid(u64 val)
+{
+	if (val <= MAX_PLACEMENT_HINT_VAL)
+		return true;
+
+	return false;
+}
+
 static long fcntl_get_rw_life_hint(struct file *file, unsigned int cmd,
 			      unsigned long arg)
 {
@@ -327,6 +335,59 @@ static long fcntl_set_rw_life_hint(struct file *file, unsigned int cmd,
 	return 0;
 }
 
+static long fcntl_get_rw_hint_ex(struct file *file, unsigned int cmd,
+			      unsigned long arg)
+{
+	struct rw_hint_ex __user *rw_hint_ex_p = (void __user *)arg;
+	struct rw_hint_ex rwh = {};
+	struct inode *inode = file_inode(file);
+	u8 hint = READ_ONCE(inode->i_write_hint);
+
+	rwh.type = WRITE_HINT_TYPE(hint);
+	rwh.val = WRITE_HINT_VAL(hint);
+
+	if (copy_to_user(rw_hint_ex_p, &rwh, sizeof(rwh)))
+		return -EFAULT;
+
+	return 0;
+}
+
+static long fcntl_set_rw_hint_ex(struct file *file, unsigned int cmd,
+			      unsigned long arg)
+{
+	struct rw_hint_ex __user *rw_hint_ex_p = (void __user *)arg;
+	struct rw_hint_ex rwh;
+	struct inode *inode = file_inode(file);
+	u64 hint;
+	int i;
+
+	if (copy_from_user(&rwh, rw_hint_ex_p, sizeof(rwh)))
+		return -EFAULT;
+	for (i = 0; i < ARRAY_SIZE(rwh.pad); i++)
+		if (rwh.pad[i])
+			return -EINVAL;
+	switch (rwh.type) {
+	case TYPE_RW_LIFE_HINT:
+		if (!rw_life_hint_valid(rwh.val))
+			return -EINVAL;
+		hint = rwh.val;
+		break;
+	case TYPE_RW_PLACEMENT_HINT:
+		if (!rw_placement_hint_valid(rwh.val))
+			return -EINVAL;
+		hint = PLACEMENT_HINT_TYPE | rwh.val;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	WRITE_ONCE(inode->i_write_hint, hint);
+	if (file->f_mapping->host != inode)
+		WRITE_ONCE(file->f_mapping->host->i_write_hint, hint);
+
+	return 0;
+}
+
 /* Is the file descriptor a dup of the file? */
 static long f_dupfd_query(int fd, struct file *filp)
 {
@@ -454,6 +515,12 @@ static long do_fcntl(int fd, unsigned int cmd, unsigned long arg,
 	case F_SET_RW_HINT:
 		err = fcntl_set_rw_life_hint(filp, cmd, arg);
 		break;
+	case F_GET_RW_HINT_EX:
+		err = fcntl_get_rw_hint_ex(filp, cmd, arg);
+		break;
+	case F_SET_RW_HINT_EX:
+		err = fcntl_set_rw_hint_ex(filp, cmd, arg);
+		break;
 	default:
 		break;
 	}
diff --git a/include/linux/rw_hint.h b/include/linux/rw_hint.h
index e17fd9fa65d4..611c51d23d96 100644
--- a/include/linux/rw_hint.h
+++ b/include/linux/rw_hint.h
@@ -16,4 +16,17 @@ enum rw_life_hint {
 	WRITE_LIFE_EXTREME	= RWH_WRITE_LIFE_EXTREME,
 };
 
+#define WRITE_HINT_TYPE_BIT	BIT(7)
+#define WRITE_HINT_VAL_MASK	(WRITE_HINT_TYPE_BIT - 1)
+#define WRITE_HINT_TYPE(h)	(((h) & WRITE_HINT_TYPE_BIT) ? \
+				TYPE_RW_PLACEMENT_HINT : TYPE_RW_LIFE_HINT)
+#define WRITE_HINT_VAL(h)	((h) & WRITE_HINT_VAL_MASK)
+
+#define WRITE_PLACEMENT_HINT(h)	(((h) & WRITE_HINT_TYPE_BIT) ? \
+				 WRITE_HINT_VAL(h) : 0)
+#define WRITE_LIFE_HINT(h)	(((h) & WRITE_HINT_TYPE_BIT) ? \
+				 0 : WRITE_HINT_VAL(h))
+
+#define PLACEMENT_HINT_TYPE	WRITE_HINT_TYPE_BIT
+#define MAX_PLACEMENT_HINT_VAL	WRITE_HINT_VAL_MASK
 #endif /* _LINUX_RW_HINT_H */
diff --git a/include/uapi/linux/fcntl.h b/include/uapi/linux/fcntl.h
index c0bcc185fa48..dfe77fa86776 100644
--- a/include/uapi/linux/fcntl.h
+++ b/include/uapi/linux/fcntl.h
@@ -57,6 +57,8 @@
 #define F_SET_RW_HINT		(F_LINUX_SPECIFIC_BASE + 12)
 #define F_GET_FILE_RW_HINT	(F_LINUX_SPECIFIC_BASE + 13)
 #define F_SET_FILE_RW_HINT	(F_LINUX_SPECIFIC_BASE + 14)
+#define F_GET_RW_HINT_EX	(F_LINUX_SPECIFIC_BASE + 15)
+#define F_SET_RW_HINT_EX	(F_LINUX_SPECIFIC_BASE + 16)
 
 /*
  * Valid hint values for F_{GET,SET}_RW_HINT. 0 is "not set", or can be
@@ -76,6 +78,18 @@
  */
 #define RWF_WRITE_LIFE_NOT_SET	RWH_WRITE_LIFE_NOT_SET
 
+enum rw_hint_type {
+	TYPE_RW_LIFE_HINT,
+	TYPE_RW_PLACEMENT_HINT
+};
+
+/* Exchange information with F_{GET/SET}_RW_HINT fcntl */
+struct rw_hint_ex {
+	__u8	type;
+	__u8	pad[7];
+	__u64	val;
+};
+
 /*
  * Types of directory notifications that may be requested.
  */
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
