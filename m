Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F2E2A3CEC
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Nov 2020 07:41:15 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kZq08-0006ae-Ad; Tue, 03 Nov 2020 06:41:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daejun7.park@samsung.com>) id 1kZq05-0006aF-B0
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Nov 2020 06:41:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:CC:To:From:Sender:Reply-To:Subject:Mime-Version:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7kVoSdrz3LX9VAMCcKcXmj5eb5nlXWXkYaj3ILgRMkc=; b=ck+8GsD5+mRYT1u82Q72W3aeRD
 vksiDr0AQRSiSOZih8WKOOtzQWSugf+OH/RTaV3qRD9x32+RJzV/NHwCXTNQe0ypS2mlt8kApPJ66
 W7iKfrvD2xl4d6XitCA4HbQkzl9MirxBYaaEOGiU90SxC6oqEhq+BWbnhaj/X0+JJD/U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:CC:To:
 From:Sender:Reply-To:Subject:Mime-Version:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=7kVoSdrz3LX9VAMCcKcXmj5eb5nlXWXkYaj3ILgRMkc=; b=A
 PIKyvsybNx1qcpS4f/Db1ipEFP3zOZJt0eYA2G54f/hwWCpQBP0mgOl8P3YjloGh64lJTxQ39crl0
 KcPfwpWj3EAyjHyyrkqBZqopyZupcgaMMP4EJVR05EtgxkYdtX/FxybmcqAiyLISXOkBVDKz+5wyW
 J4JXTQcmkbDJLX3k=;
Received: from mailout2.samsung.com ([203.254.224.25])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kZpzy-00HCGF-83
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Nov 2020 06:41:01 +0000
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20201103064043epoutp02a0732edb34c0d72c6e38d584c7f6cc9e~D7D4eGwpo1904619046epoutp027
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  3 Nov 2020 06:40:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20201103064043epoutp02a0732edb34c0d72c6e38d584c7f6cc9e~D7D4eGwpo1904619046epoutp027
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1604385643;
 bh=7kVoSdrz3LX9VAMCcKcXmj5eb5nlXWXkYaj3ILgRMkc=;
 h=Subject:Reply-To:From:To:CC:Date:References:From;
 b=LjbaOj9OVSG8KLXVqLiG5to6J5ptrIT/Mj2uzFQJMF1VeggjkB8KnXbCpcxx5TRNn
 YXhRRWx/lMXt1DDyJ/KkLr0bwdGE5hDEy0fr+Ng43LVJR8AXD+ftr3CjWkSRmtTeJ4
 Gd9p1P3NDjFi76eaHxYvZcvDyQtur5nEpXrO8Wyg=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas2p4.samsung.com (KnoxPortal) with ESMTP id
 20201103064042epcas2p4b23909d8d07423d4fbd34795faa4f3b5~D7D3jwbUM1771517715epcas2p4u;
 Tue,  3 Nov 2020 06:40:42 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.40.184]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4CQKt03jzWzMqYly; Tue,  3 Nov
 2020 06:40:40 +0000 (GMT)
X-AuditID: b6c32a46-1d9ff7000000dbf8-b9-5fa0fb672736
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
 epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 9C.64.56312.76BF0AF5; Tue,  3 Nov 2020 15:40:40 +0900 (KST)
Mime-Version: 1.0
From: Daejun Park <daejun7.park@samsung.com>
To: "jaegeuk@kernel.org" <jaegeuk@kernel.org>, "chao@kernel.org"
 <chao@kernel.org>
X-Priority: 3
X-Content-Kind-Code: NORMAL
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20201103064039epcms2p30ecac0e7cefff0d50745f2e2e61ce38e@epcms2p3>
Date: Tue, 03 Nov 2020 15:40:39 +0900
X-CMS-MailID: 20201103064039epcms2p30ecac0e7cefff0d50745f2e2e61ce38e
X-Sendblock-Type: AUTO_CONFIDENTIAL
X-CPGSPASS: Y
X-CPGSPASS: Y
CMS-TYPE: 102P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMJsWRmVeSWpSXmKPExsWy7bCmqW7G7wXxBntvMFmcnnqWyeLlIU2L
 VQ/CLXr7t7JZPFk/i9li88ENzBbbPgtaHD/5jtHi0iJ3i8u75rBZdFz6zGQx4eUSFovbW7gs
 OqevYbFYtHA3iwO/x6ZVnWweuxd8ZvLo27KK0ePzJrkAlqgcm4zUxJTUIoXUvOT8lMy8dFsl
 7+B453hTMwNDXUNLC3MlhbzE3FRbJRefAF23zBygI5UUyhJzSoFCAYnFxUr6djZF+aUlqQoZ
 +cUltkqpBSk5BYaGBXrFibnFpXnpesn5uVaGBgZGpkCVCTkZO5eHFVzmqbj2YgNrA+NSri5G
 Tg4JAROJL3MOsncxcnEICexglDgzYyFjFyMHB6+AoMTfHcIgNcICbhKbH/9lAbGFBJQk1l+c
 xQ4R15O49XANI4jNJqAjMf3EfbC4iECIxOvJLUwgM5kFdrFI7G7eyQSxjFdiRvtTFghbWmL7
 8q2MELaGxI9lvcwQtqjEzdVv2WHs98fmQ9WISLTeOwtVIyjx4OduqLikxLHdH6Dm10tsvfOL
 EWSxhEAPo8ThnbdYIRL6Etc6NoIt5hXwldj89iJYnEVAVWJmy1ImkIclBFwkuhdKgISZBeQl
 tr+dwwwSZhbQlFi/Sx+iQlniyC0WmE8aNv5mR2czC/BJdBz+CxffMe8J1GVqEut+rodaJCNx
 ax7jBEalWYhwnoVk7SyEtQsYmVcxiqUWFOempxYbFRghx+wmRnBq1XLbwTjl7Qe9Q4xMHIyH
 GCU4mJVEeGsi58UL8aYkVlalFuXHF5XmpBYfYjQF+ncis5Rocj4wueeVxBuaGpmZGViaWpia
 GVkoifOGruyLFxJITyxJzU5NLUgtgulj4uCUamDaIXwuUcuG03rdzLAl5+RYZUq6pGLNihf8
 3Oa5a0FqErNkwkKNde9sW47zRd5Z1HTBQ/ny+bZ2Jf6wTY3pwcWzm9iW13Kc/ObjmTJvx2Y3
 jW9RBZNtt9RunLDZ0Sjo/kXOQs5pd5lvMT6ZWl7ufS8sr9y0rndy+7r6N8ufZDP6Cui9+9XN
 9kLvSJf1qiM/59Rstaq7f276ouqlh3027rKtnL2EZUm633KtP8wc+1zZDAKc6hIrmY5oMB5d
 e2B7VNGCTVkZ50MSm+PKVY/uar6jGBr6+YKwntv2e2/83h8v0DjsLf5jUkV6tofD6eqXm/3O
 +O++lblxLUd7Z9m9FsUkDqWK3EphrTdMAotPNCuxFGckGmoxFxUnAgAC32gTNgQAAA==
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201103064039epcms2p30ecac0e7cefff0d50745f2e2e61ce38e
References: <CGME20201103064039epcms2p30ecac0e7cefff0d50745f2e2e61ce38e@epcms2p3>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: samsung.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.25 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kZpzy-00HCGF-83
Subject: [f2fs-dev]  [PATCH] f2fs: change write_hint for hot/warm nodes
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
Reply-To: daejun7.park@samsung.com
Cc: yongmyung lee <ymhungry.lee@samsung.com>,
 Jieon Seol <jieon.seol@samsung.com>, Sang-yoon Oh <sangyoon.oh@samsung.com>,
 Mankyu PARK <manq.park@samsung.com>,
 Sung-Jun Park <sungjun07.park@samsung.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 Keoseong Park <keosung.park@samsung.com>,
 SEUNGUK SHIN <seunguk.shin@samsung.com>,
 Jinyoung CHOI <j-young.choi@samsung.com>,
 Jaemyung Lee <jaemyung.lee@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From 818a76a9aee5bf225565264274d211edb07bae7d Mon Sep 17 00:00:00 2001
From: Daejun Park <daejun7.park@samsung.com>
Date: Tue, 3 Nov 2020 15:30:26 +0900


In the fs-based mode of F2FS, the mapping of hot/warm node to
WRITE_LIFE_NOT_SET should be changed to WRITE_LIFE_SHORT.

As a result of analyzing the write pattern of f2fs using real workload,
hot/warm nodes have high update ratio close to hot data.[*]
However, F2FS passes write hints for hot/warm nodes as WRITE_LIFE_NOT_SET.

Furthermore, WRITE_LIFE_NOT_SET is a default value of write hint when it is
not provided from the file system.
In storage, write_hint is used to distinguish streams (e.g. NVMe).
So, the hot/warm node of F2FS is not distinguished from other write_hints,
which can make the wrong stream seperation.

* Liang, Yu, et al. "An empirical study of F2FS on mobile devices." 2017
IEEE 23rd International Conference on Embedded and Real-Time Computing
Systems and Applications (RTCSA).

Signed-off-by: Daejun Park <daejun7.park@samsung.com>
---
 fs/f2fs/segment.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 1596502f7375..7b42bb10c6c3 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3208,7 +3208,7 @@ enum rw_hint f2fs_io_type_to_rw_hint(struct f2fs_sb_info *sbi,
 				return WRITE_LIFE_EXTREME;
 		} else if (type == NODE) {
 			if (temp == WARM || temp == HOT)
-				return WRITE_LIFE_NOT_SET;
+				return WRITE_LIFE_SHORT;
 			else if (temp == COLD)
 				return WRITE_LIFE_NONE;
 		} else if (type == META) {
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
