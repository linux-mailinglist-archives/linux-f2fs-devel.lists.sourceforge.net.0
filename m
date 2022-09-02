Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A799F5AA576
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  2 Sep 2022 04:08:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oTw6N-0003ae-AR;
	Fri, 02 Sep 2022 02:08:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yonggil.song@samsung.com>) id 1oTw6J-0003aX-OR
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 02 Sep 2022 02:08:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:CC:To:From:Sender:Reply-To:Subject:Mime-Version:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=V64k7xax5ayn4PWfzCTIBNIiNKnQQCH5pxYzaTK3OEI=; b=LfqosT6PaPNNLROHper4AJe3wD
 MBshItOYM8ijUl9d1pqBf61xRSBldkd3gpVQK547cr170LO4RdkxbyijROvheeUKGelAz6mO6RX55
 E5HA0nujmZoj20HLvxz9hfi7VCt22KpBHVx1JUkdj3BRPWdDpCd3UpzA27GrIxRQQaWQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:CC:To:
 From:Sender:Reply-To:Subject:Mime-Version:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=V64k7xax5ayn4PWfzCTIBNIiNKnQQCH5pxYzaTK3OEI=; b=Y
 COWM3pVdeKJRKNiK9EGgLeP/PS1q0UNYAwh956CBj/7DJfGj+PMfMGrhEME+NiRdsesSLmVJLYUUx
 qOehp+HCa4Pdyj7EujaMvrh+R8tRxAz/t4+6JHsi7lGMtIFELcpDwv/cWpvw24PKkC9DCtiPsNI72
 hY223Tz908S0ORgg=;
Received: from mailout1.samsung.com ([203.254.224.24])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oTw6F-00AnnR-Nm for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 02 Sep 2022 02:08:07 +0000
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20220902020750epoutp01d6bac68a2d0346cd95b35f5772e1f177~Q6QUSAcbu2836128361epoutp015
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  2 Sep 2022 02:07:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20220902020750epoutp01d6bac68a2d0346cd95b35f5772e1f177~Q6QUSAcbu2836128361epoutp015
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1662084470;
 bh=V64k7xax5ayn4PWfzCTIBNIiNKnQQCH5pxYzaTK3OEI=;
 h=Subject:Reply-To:From:To:CC:Date:References:From;
 b=R1F703ziT6nabFiHAudF+qP0jfd+YRttq+RpxpZ3jL/Xy6Kjr4t3AtIfFYk7NlHHl
 22/V7LkRaIF7yRlCnOy0gFuQM6yUwS67fm2Fb8VFSZPBpoiteWsA3r/o7lIJtgAFKq
 lT9S0Nueuuc4idtHmFu3Em4Bk/ZSj+uB/5txJcBo=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTP id
 20220902020750epcas2p2f3b3abe15649078f3ab58be82e046319~Q6QT5ssS80236002360epcas2p2m;
 Fri,  2 Sep 2022 02:07:50 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.88]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4MJhBs5ZqKz4x9Pt; Fri,  2 Sep
 2022 02:07:49 +0000 (GMT)
X-AuditID: b6c32a46-2a89ea8000018104-41-6311657546f1
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
 epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 1E.85.33028.57561136; Fri,  2 Sep 2022 11:07:49 +0900 (KST)
Mime-Version: 1.0
From: Yonggil Song <yonggil.song@samsung.com>
To: "jaegeuk@kernel.org" <jaegeuk@kernel.org>, "chao@kernel.org"
 <chao@kernel.org>, "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
X-Priority: 3
X-Content-Kind-Code: NORMAL
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20220902020749epcms2p1772fc0bf54778e95a38819f107e33c2f@epcms2p1>
Date: Fri, 02 Sep 2022 11:07:49 +0900
X-CMS-MailID: 20220902020749epcms2p1772fc0bf54778e95a38819f107e33c2f
X-Sendblock-Type: AUTO_CONFIDENTIAL
X-CPGSPASS: Y
X-CPGSPASS: Y
CMS-TYPE: 102P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrBKsWRmVeSWpSXmKPExsWy7bCmmW5pqmCyQddvIYvTU88yWbw8pGnx
 ZP0sZotLi9wtLu+aw2Yx9fwRJgc2j02rOtk8di/4zOTRt2UVo8fnTXIBLFHZNhmpiSmpRQqp
 ecn5KZl56bZK3sHxzvGmZgaGuoaWFuZKCnmJuam2Si4+AbpumTlAq5UUyhJzSoFCAYnFxUr6
 djZF+aUlqQoZ+cUltkqpBSk5BeYFesWJucWleel6eaklVoYGBkamQIUJ2Rnrvk9gKVjFWnG7
 5xtjA+Nsli5GTg4JAROJU1fusHUxcnEICexglJg9+Q5zFyMHB6+AoMTfHcIgprCAkkTHU0aQ
 ciEg89qBXrBWYQF9ic2Ll7GD2GwCuhJ/NywHs0UEXjFKnFktCmIzC2hLbJx9lgliFa/EjPan
 UGulJbYv38oIYWtI/FjWywxhi0rcXP2WHcZ+f2w+VI2IROu9s1A1ghIPfu6GiktKLDp0Hmp+
 vsTfFdfZIOwaia0NbVBxfYlrHRvB9vIK+Eq8WNQENodFQFXixMqdUPUuEutOX2CDuFleYvvb
 OeBQYBbQlFi/Sx/ElBBQljhyiwXmk4aNv9nR2cwCfBIdh//CxXfMewJ1gZrE5k2bWSFsGYkL
 j9sYJzAqzUIE8ywke2ch7F3AyLyKUSy1oDg3PbXYqMAIHrPJ+bmbGMFJUMttB+OUtx/0DjEy
 cTAeYpTgYFYS4Z16WCBZiDclsbIqtSg/vqg0J7X4EKMp0McTmaVEk/OBaTivJN7QxNLAxMzM
 0NzI1MBcSZzXRZsxWUggPbEkNTs1tSC1CKaPiYNTqoGp28zCZ6uAnd7hJ822k7lZO2cvDJsd
 evxh9+HGaNd5VZzZD655HthRtOCNjb5Rjsi9E+7Lun+bZTk62DU1dVz9X3zz1QrVfpd9vvqe
 tVNn3K2YGtvFfujokpvfOfY6PZ7CsTP7bObNpbZC+2e7XD27xdO/+LbzFI279xdbXu1v8jqh
 knHFvH7a/sWnXE/daX4xbcW7kCdnZ0nMmn5v1yO1vLYPrt4XEnfGe7yLK/QwdPKOiF88JUx+
 goRA5/+iqwvXibIz7Zoze1vt3ezKD4IKWjP0arbfcPQ55BwtvLdi0fGA26umlnupLPp3qKeJ
 hSv4uhDPluw/6g8nBBR+/G/gOH/PyqKoCQYFDuz+8hMylViKMxINtZiLihMBK8ukSAsEAAA=
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220902020749epcms2p1772fc0bf54778e95a38819f107e33c2f
References: <CGME20220902020749epcms2p1772fc0bf54778e95a38819f107e33c2f@epcms2p1>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Fix typo in f2fs.h Detected by Jaeyoon Choi Signed-off-by:
 Yonggil Song <yonggil.song@samsung.com> --- fs/f2fs/f2fs.h | 2 +- 1 file
 changed, 1 insertion(+),
 1 deletion(-) diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
 index eddfd35eadb6..661096be59d1 100644 --- a/fs/f2fs/f2fs.h +++
 b/fs/f2fs/f2fs.h
 @@ -274,7 +274,7 @@ enum { ORPHAN_INO, /* for orphan ino list */ APPEND_I
 [...] Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.24 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.24 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: samsung.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oTw6F-00AnnR-Nm
Subject: [f2fs-dev] [PATCH v1] f2fs: fix typo
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
Reply-To: yonggil.song@samsung.com
Cc: Yonggil Song <yonggil.song@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net


Fix typo in f2fs.h
Detected by Jaeyoon Choi

Signed-off-by: Yonggil Song <yonggil.song@samsung.com>
---
 fs/f2fs/f2fs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index eddfd35eadb6..661096be59d1 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -274,7 +274,7 @@ enum {
 	ORPHAN_INO,		/* for orphan ino list */
 	APPEND_INO,		/* for append ino list */
 	UPDATE_INO,		/* for update ino list */
-	TRANS_DIR_INO,		/* for trasactions dir ino list */
+	TRANS_DIR_INO,		/* for transactions dir ino list */
 	FLUSH_INO,		/* for multiple device flushing */
 	MAX_INO_ENTRY,		/* max. list */
 };
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
