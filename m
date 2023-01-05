Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8035B65E9D5
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  5 Jan 2023 12:25:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pDOMo-0006j7-1J;
	Thu, 05 Jan 2023 11:25:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ojaswin@linux.ibm.com>) id 1pDOMl-0006iB-S5
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Jan 2023 11:24:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LynWwuoBtbTAuC+gq6MIO5+/sTdrwQNrdj7hw7C9k5c=; b=j/uHkxYQlOcEV/NphBD/xA2S+q
 BCApmNyAJRmu/a0GJnqg02x2CouUYWdGpY20DUBrYFWsY6FUG9BmX8i4+fE+MunAsplj1AUYyOO8y
 2kQC+kWhGoZvT2efNyZ+3AKcIOh0laaoPrDhT1DV5zgcba9k6qGMYmar4D6hK62FIutc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LynWwuoBtbTAuC+gq6MIO5+/sTdrwQNrdj7hw7C9k5c=; b=D4BD9eF3hX3GNqZSFdyJFlOLhT
 hM0COgof0TNfFgvCFh/5c5m8hAlN790U73vTszdbNe3s79XgUrzeDzaBYSWx5/NR0unCP0IlgSdg3
 Z8cNvpfD9hvNndM17s421Tftyasqy10PO0R40ID3qFPIGUuxX0a/LEoEHQyBMVs2avBY=;
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pDOMf-005gaF-D2 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Jan 2023 11:24:59 +0000
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 305BGe9v007451; Thu, 5 Jan 2023 11:24:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=LynWwuoBtbTAuC+gq6MIO5+/sTdrwQNrdj7hw7C9k5c=;
 b=ZaHqwNGmDgFaA2BCR/4TxIdHCatsD318PRNxFYCtffGxLPneSaGeF9l88ctbfwh1MGaT
 XAdBcCDBUEFPG4orWx1qoUB0wWzPhQ3Hs3dEO+wIkc9uyrLoe6AE9t3Sf5TmyHlJNcVv
 H9IqfGGONcpHYmLvgKjaSLcaUFBd51WQzUdSMQs4ucijcbgeqUKgdg18RB4IrsV7GBDC
 QplBGPQjjK+OZ5vCwt3PeSz/b31LpVoBaO0pV9O02qgWxZnaoGdsodES86MEXQB52MpH
 /F9m8s3S4+hJV+ZA2bkd62KQyWJc/BgbiJ3ueyHQQkzYZMCgrXlWuexs3HyDrobf/Rl9 GA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3mwwhng4f0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Jan 2023 11:24:36 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 305BM5qH025452;
 Thu, 5 Jan 2023 11:24:35 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3mwwhng4ep-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Jan 2023 11:24:35 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 305176xm010137;
 Thu, 5 Jan 2023 11:24:33 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
 by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3mtcbfmwqb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Jan 2023 11:24:33 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com
 [10.20.54.106])
 by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 305BOVNF21823928
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Jan 2023 11:24:31 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3107120040;
 Thu,  5 Jan 2023 11:24:31 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 24D3220049;
 Thu,  5 Jan 2023 11:24:29 +0000 (GMT)
Received: from li-bb2b2a4c-3307-11b2-a85c-8fa5c3a69313.ibm.com (unknown
 [9.109.253.169])
 by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Thu,  5 Jan 2023 11:24:28 +0000 (GMT)
Date: Thu, 5 Jan 2023 16:54:21 +0530
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <Y7azZTcMvDZt9Eya@li-bb2b2a4c-3307-11b2-a85c-8fa5c3a69313.ibm.com>
References: <20221223203638.41293-1-ebiggers@kernel.org>
 <Y7UeuYVkyy2/fWF1@li-bb2b2a4c-3307-11b2-a85c-8fa5c3a69313.ibm.com>
 <Y7Up3kpGcJr0FCgq@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y7Up3kpGcJr0FCgq@sol.localdomain>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 890KEnm2Wi9_d5p_zTlxhAtZQDq7bwHI
X-Proofpoint-ORIG-GUID: 3AV4vqvnUNdNa4KL2nVnBiy8hfxXvknE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-05_04,2023-01-04_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 phishscore=0 malwarescore=0 mlxscore=0 spamscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301050089
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Jan 03, 2023 at 11:25:18PM -0800, Eric Biggers wrote:
 > Hi Eric, > Thanks Ojaswin! That's a good point about generic/692. The right
 fix for it is > to make it use $FSV_BLOCK_SIZE instead of 4K in its
 calculations.
 Yes, that should fix the issue, I'll try to send in [...] 
 Content analysis details:   (-0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [148.163.158.5 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1pDOMf-005gaF-D2
Subject: Re: [f2fs-dev] [PATCH v2 00/11] fsverity: support for non-4K pages
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
From: Ojaswin Mujoo via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Ojaswin Mujoo <ojaswin@linux.ibm.com>
Cc: Andrey Albershteyn <aalbersh@redhat.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Jan 03, 2023 at 11:25:18PM -0800, Eric Biggers wrote:
> 

Hi Eric,

> Thanks Ojaswin!  That's a good point about generic/692.  The right fix for it is
> to make it use $FSV_BLOCK_SIZE instead of 4K in its calculations.
Yes, that should fix the issue, I'll try to send in a patch for this
when I find some time.

> 
> I suppose you saw that issue by running the test on ext4 with fs_block_size ==
> page_size == 64K, causing xfstests to use merkle_tree_block_size == 64K by
> default.  Thanks for doing that; that's something I haven't been able to test
> yet.  My focus has been on merkle_tree_block_size < page_size.
Correct, I was testing "everything = 64k" scenario when I
noticed the slowdown.

> merkle_tree_block_size > 4K should just work, though, assuming
> merkle_tree_block_size <= min(fs_block_size, page_size).  (Or
> merkle_tree_block_size == fs_block_size == page_size before this patch series.)

Yes true, I still tested them just in case :) 

Regards,
Ojaswin


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
