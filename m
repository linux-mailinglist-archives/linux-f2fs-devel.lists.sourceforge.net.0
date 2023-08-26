Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0060978938B
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 26 Aug 2023 04:58:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qZjVl-0004qr-KN;
	Sat, 26 Aug 2023 02:58:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <prvs=760245474b=lizhi.xu@windriver.com>)
 id 1qZjVj-0004qk-Vr for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 26 Aug 2023 02:58:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Rhd/bZv5vOoG1xrHWO2yD+cjPhp7tUfExrPHpSA0s/4=; b=BT9krGAhLumqWZXKdhS7HrTDHe
 qhtFLH16c5ZvXEQEl5vdSnjizb+lx25Re8CCXzOgY+hM7cKzesIRBGVn/Dttf+okFkRLW7gEZs0jX
 z3cEc9bUSLs8MSX7d51LLm4tnqJQAy5AA1N3Tie7Tr5oOxqWcktTnpFc+BdrpTB/ozeE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Rhd/bZv5vOoG1xrHWO2yD+cjPhp7tUfExrPHpSA0s/4=; b=kQ6RZ+CG9xZjDB3dEViFRQcIqh
 JjrAj79+Tq2AVIeb8pphSlmsWTYwgroCAFLgQ/K+MXd40qAjySOYWq1h7xOIQMtAd+87YygMmBXXQ
 U068iLNlYxjSH0zTNQ5L09drxnyv0ZvMNky/HcRHIIY6fvvzzMQQzliqTyuwY+wgT6n4=;
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qZjVj-0005to-Fr for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 26 Aug 2023 02:58:52 +0000
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37Q2wfr0013746; Fri, 25 Aug 2023 19:58:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 PPS06212021; bh=Rhd/bZv5vOoG1xrHWO2yD+cjPhp7tUfExrPHpSA0s/4=; b=
 Cdlh1NZBK2WPWMKTEq3sPPc5pq2k3x/3W2wt1IBw1rE+UhS51mYKEkgyg6nR/a6Z
 Tdxrzu6cOpKQJXauXH1Twn2lddwQsY0VReR8Zv30skAMa/q9XIeaDQiW3orpt7jK
 346DrXIqT+/+76dzNu+7EC0p5vtIUbYiwj1wYcSEegrNx5as1ChYm/LpnBGFcasq
 lzICv9sEDFOclnarBIOgezzfHBkuVR6ul7S78Uuo2FkWu23RqzcZehLG/f/SGvHg
 MDGcozBPyjyVzwSxhLA4OJfSNieyOc+s4Pexg+aiETPdh5CMBpayKWWwyJricEFd
 zbMhSc5+chWQuMaGCapYdg==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com
 [147.11.82.254])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sn20e3s47-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 25 Aug 2023 19:58:41 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 25 Aug 2023 19:58:39 -0700
Received: from pek-lpd-ccm6.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Fri, 25 Aug 2023 19:58:38 -0700
To: <chao@kernel.org>
Date: Sat, 26 Aug 2023 10:58:38 +0800
Message-ID: <20230826025838.1131325-1-lizhi.xu@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <517380b7-77e6-3b79-5156-234b51dbb104@kernel.org>
References: <517380b7-77e6-3b79-5156-234b51dbb104@kernel.org>
MIME-Version: 1.0
X-Proofpoint-GUID: ScFUOfPCRpgFf4VONwUJFSCDZq5XNeE-
X-Proofpoint-ORIG-GUID: ScFUOfPCRpgFf4VONwUJFSCDZq5XNeE-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-25_19,2023-08-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 impostorscore=0 spamscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0
 mlxlogscore=543 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2308260026
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, 25 Aug 2023 18:41:38, chao@kernel.org wrote: > Can
 you please check below patch? it has fixed reported issue. > >
 https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=dev
 [...] Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [205.220.166.238 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [205.220.166.238 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1qZjVj-0005to-Fr
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix deadlock in f2f2_add_dentry
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
From: Lizhi Xu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Lizhi Xu <lizhi.xu@windriver.com>
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, 25 Aug 2023 18:41:38, chao@kernel.org wrote:
> Can you please check below patch? it has fixed reported issue.
>
> https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=dev&id=5c13e2388bf3426fd69a89eb46e50469e9624e56
> 
> Feedback from syzbot:
> 
> https://lore.kernel.org/linux-f2fs-devel/0000000000001ba17a0603b5871e@google.com/
This fix uses nest lock to avoid deadlocks, which I personally believe is feasible.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
