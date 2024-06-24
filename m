Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AA5915A9C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Jun 2024 01:34:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sLtCF-0007jk-QN;
	Mon, 24 Jun 2024 23:34:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daejun7.park@samsung.com>) id 1sLtCD-0007jS-Il
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Jun 2024 23:34:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:In-Reply-To:CC:To:From:Sender:Reply-To:Subject:Mime-Version:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3ImCeEfh/Ra1qJMJwGnWtMgllCYvieBq5YplBv0iy9U=; b=CfieCwtnWgygpCMA021VQyIsKR
 d5BD9ek7yHeiCXD69d7cVskYnrmZUfxsrZMVqL1hP6hgaFZx7n1EvZlwzAxEmfUzA4M8LFg3A7Hpu
 d98MCyCEY/hNTQzcPGmzzbSXWUI0Vl1/zmv6a99cJHhxHs8TYVRKRJX4pkUHB0iF8Il4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:
 In-Reply-To:CC:To:From:Sender:Reply-To:Subject:Mime-Version:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3ImCeEfh/Ra1qJMJwGnWtMgllCYvieBq5YplBv0iy9U=; b=I3ksh4zW/U8GS9YQvg9FkvveFY
 xDClxUllP8/JVE9kmYzcolAIwUMrx3zbyMMjEY5RNYDwYY0Z2yOurHDLNfME9QT+gyF5AR4ocuVe2
 jn1xYNsOFcvI+jHm3qRunyBf0zAr1Zah+E6hJABpOqTFvJcx+a6hhef9SJRvgQyjyXNA=;
Received: from mailout2.samsung.com ([203.254.224.25])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sLtCD-0000u3-5g for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Jun 2024 23:34:01 +0000
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20240624233348epoutp02cad8ec0730454d36be5173b4bd12afea~cFMzxXlSV1443714437epoutp02f
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 24 Jun 2024 23:33:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20240624233348epoutp02cad8ec0730454d36be5173b4bd12afea~cFMzxXlSV1443714437epoutp02f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1719272028;
 bh=3ImCeEfh/Ra1qJMJwGnWtMgllCYvieBq5YplBv0iy9U=;
 h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
 b=UZdwP4GS5CciNAT3vQAMYtq3FliN5A7SvhxlcqIJHfLAkpRVRKz/RwjOALjQt82/M
 rzeEmZ0SHvhOh7yJNvxjeuBZLf69gTEDbPY2BqtsMmH7iwlKmfvdxcl9tjKXQ8Katt
 4R2ZqUM+5uW9+0RZnk9QwC3LQy8aM8t4GObHySmc=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas2p4.samsung.com (KnoxPortal) with ESMTP id
 20240624233347epcas2p4a904ace9d029c5a306a5d09eb88784dc~cFMzZIiM51759817598epcas2p4K;
 Mon, 24 Jun 2024 23:33:47 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.102]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4W7PRb3Dxsz4x9Q3; Mon, 24 Jun
 2024 23:33:47 +0000 (GMT)
X-AuditID: b6c32a47-ecbfa7000000264e-60-667a025b1845
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
 epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 FD.68.09806.B520A766; Tue, 25 Jun 2024 08:33:47 +0900 (KST)
Mime-Version: 1.0
From: Daejun Park <daejun7.park@samsung.com>
To: Chao Yu <chao@kernel.org>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "corbet@lwn.net" <corbet@lwn.net>, "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, "linux-doc@vger.kernel.org"
 <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <a4ae575c-9eee-47fe-b49d-c71737022d24@kernel.org>
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20240624233246epcms2p234a0027e14c8285e1674cbbe5680842c@epcms2p2>
Date: Tue, 25 Jun 2024 08:32:46 +0900
X-CMS-MailID: 20240624233246epcms2p234a0027e14c8285e1674cbbe5680842c
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-CPGSPASS: Y
X-CPGSPASS: Y
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKJsWRmVeSWpSXmKPExsWy7bCmuW40U1WawdZeYYvTU88yWTw50M5o
 8fKQpsWqB+EWP06aWPTvbmexeLJ+FrPFwrYlLBaXFrlbXN41h82i5Y+TxfmJr5ksVnXMZbSY
 ev4IkwOfx6ZVnWweuxd8ZvJY3DeZ1aNvyypGj8+b5AJYo7JtMlITU1KLFFLzkvNTMvPSbZW8
 g+Od403NDAx1DS0tzJUU8hJzU22VXHwCdN0yc4COVFIoS8wpBQoFJBYXK+nb2RTll5akKmTk
 F5fYKqUWpOQUmBfoFSfmFpfmpevlpZZYGRoYGJkCFSZkZzxZ+46t4D9jxe1NF5gbGA8zdjFy
 ckgImEh0zZ/H1MXIxSEksINRouF9D3sXIwcHr4CgxN8dwiA1wgK2Etsm3wSrFxJQklh/cRY7
 RFxP4tbDNWBxNgEdiekn7rODzBER2MckserZQbChzAIzmCTmne5lg9jGKzGj/SkLhC0tsX35
 VrBuTgE7iZ6LnewQcQ2JH8t6mSFsUYmbq9+yw9jvj82HulpEovXeWagaQYkHP3dDxSUlbs/d
 BFWfL/H/ynIou0Zi24F5ULa+xLWOjWA38Ar4Sqzd1g4WZxFQlXjxA2aOi8SVl41gNcwC8hLb
 385hBgUKs4CmxPpd+iCmhICyxJFbUBV8Eh2H/7LDfNiw8TdW9o55T5ggbDWJdT/XM01gVJ6F
 COlZSHbNQti1gJF5FaNYakFxbnpqsVGBMTxyk/NzNzGC06uW+w7GGW8/6B1iZOJgPMQowcGs
 JMI7vb4sTYg3JbGyKrUoP76oNCe1+BCjKdCXE5mlRJPzgQk+ryTe0MTSwMTMzNDcyNTAXEmc
 917r3BQhgfTEktTs1NSC1CKYPiYOTqkGpnI2kTeqsV82nbukLXv/bsDJjaZHprFfyWiRddY5
 0iEd73X+0cL/167UNGUu2H/4xs4lO58elfrWG7P27zvvBXmH15xSeuXSWt5RbHOmp2Xit8Tz
 Wx+vO/KLYe4k2Ry95+sqtvWYvbvy4pvLQdXly5p6VYIzGiexlZV0xC9RzKsQ3jqxyXXrUn+m
 Yks2bfPLxVve2llqq2pkT55rnljrp3znljZfzYvM4p+2/6/PUdDS/ngn9998m/BXWxnuXDBc
 ecChc9eRrdzMNf33X5+KePn/WumigJ5dG4Q2fdzf9Lz+W86MzUvClQsvr7pgwfMwVDXQtr75
 yV6djxkLav8x655fMzv6SZqj27950Wdtt7QrsRRnJBpqMRcVJwIAs9UdhTgEAAA=
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240617045134epcms2p3f2f82336438f636b3f1ad58fd0c1cd29
References: <a4ae575c-9eee-47fe-b49d-c71737022d24@kernel.org>
 <20240617045134epcms2p3f2f82336438f636b3f1ad58fd0c1cd29@epcms2p3>
 <CGME20240617045134epcms2p3f2f82336438f636b3f1ad58fd0c1cd29@epcms2p2>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Chao, > >It looks complicated to enable single_node_sec
 mode dynamically, what do >you think of making this as a feature which can
 only be eanbled by mkfs? I think it is good idea, I will change this patch
 for mkfs tool. 
 Content analysis details:   (-0.4 points, 6.0 required)
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
 [203.254.224.25 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [203.254.224.25 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [203.254.224.25 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sLtCD-0000u3-5g
Subject: Re: [f2fs-dev] (2) [PATCH v2] f2fs: add support single node mode
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
Cc: Nayeon Kim <nayeoni.kim@samsung.com>, Siwoo Jung <siu.jung@samsung.com>,
 Seokhwan Kim <sukka.kim@samsung.com>, Dongjin Kim <dongjin_.kim@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Chao, 

>
>It looks complicated to enable single_node_sec mode dynamically, what do
>you think of making this as a feature which can only be eanbled by mkfs?

I think it is good idea, I will change this patch for mkfs tool.

Thanks,

Daejun


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
