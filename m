Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 33795546C71
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Jun 2022 20:36:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nzjUC-00040A-Q3; Fri, 10 Jun 2022 18:35:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <gerald.schaefer@linux.ibm.com>) id 1nzjUB-000401-6y
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Jun 2022 18:35:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ff3S4Dmkc/EDKyt1tbsvQyIpd2d1S9VM2W5+qZ2nG3s=; b=NaSmkCrLoLwnGflUJAIrqTC2JU
 3SWV0FLckcBSxJWDlhtP9fbHkkGtLZp+XJncp9XGuUwPPEMrlpoz+CnohSJTCe5Ix7OzgHBaH906O
 ohALk9nJNW7n8wBbFhsqZmfB1XI4nxyAwa3V77WrL/Hh/sKcT6XAJ6iShhC+lNyaFmYo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ff3S4Dmkc/EDKyt1tbsvQyIpd2d1S9VM2W5+qZ2nG3s=; b=Lt7Zf0x0F5VCzkTn6VIHNUtqMD
 8jvICKPkfq2SzCUy2Yd8IMcZv6RtnmpIKAKZZxVufCqch7DcwAnUWOqXK6JWjRcGRlXwc+5M2nE+0
 DXoK0+dFxsWSkuwjW4dGLYdb0+PCv7oIoExswqtpEZawOyKtlKjFXGEDebRKwjziPQ5s=;
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nzjU9-0005bM-Oi
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Jun 2022 18:35:55 +0000
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25AGvIRj017300;
 Fri, 10 Jun 2022 18:35:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=Ff3S4Dmkc/EDKyt1tbsvQyIpd2d1S9VM2W5+qZ2nG3s=;
 b=SCN1AstLfBC3fODuKUXKBY6WrlZrz3fThbU1wCedwFT0CaFQD5jJxGOYZdT/ajeMEL/u
 uANcjk+7qt9eYyJ18VOhHCJV6Df7HaLGzno0nD2f85JtoJBClfxRMcZ+0TT0qn3p8KRZ
 7b/8XKkUc83HWO4UeeTgz9FJ7DcRoIi8yuTEHGrN9AKAbC/jeAwZ2+DaIshwH8XCfvpN
 eOr3ay+BYBuGwNhUvP8p+dn7HgW2witLegMJ1wVQCilvjGKmx1pL3G5i73v9Tb/cXZAK
 yZKr3reZ12SDFAq1E2OfXbjlgGKDTOmPfnQChktV0nDHmoJ5aBjo3otDWzZNFzIGAHpN Fw== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gm9xa9n51-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Jun 2022 18:35:39 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25AIK5Pq014728;
 Fri, 10 Jun 2022 18:35:37 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 3gfxnj0m5f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Jun 2022 18:35:37 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 25AIZXWb22413676
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Jun 2022 18:35:34 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DDA7AAE04D;
 Fri, 10 Jun 2022 18:35:33 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4A105AE045;
 Fri, 10 Jun 2022 18:35:33 +0000 (GMT)
Received: from thinkpad (unknown [9.171.11.220])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 10 Jun 2022 18:35:33 +0000 (GMT)
Date: Fri, 10 Jun 2022 20:35:30 +0200
From: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
To: willy@infradead.org
Message-ID: <20220610203530.7f84bbc0@thinkpad>
In-Reply-To: <20220610155205.3111213-1-sumanthk@linux.ibm.com>
References: <20220605193854.2371230-7-willy@infradead.org>
 <20220610155205.3111213-1-sumanthk@linux.ibm.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 4ZOyDC1ZmZItV06B7HHJoujAuO7lAcg6
X-Proofpoint-ORIG-GUID: 4ZOyDC1ZmZItV06B7HHJoujAuO7lAcg6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-10_07,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 phishscore=0 spamscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=347 clxscore=1011 suspectscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2204290000 definitions=main-2206100070
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri,
 10 Jun 2022 17:52:05 +0200 Sumanth Korikkar <sumanthk@linux.ibm.com>
 wrote: [...] > > * Bisected the crash to this commit. > > To reproduce: >
 * clone libhugetlbfs: > * Execute,
 PATH=$PATH:"obj64/" LD_LIBRARY_PATH=../obj64/
 alloc-instantiate-race shared > > Crashes on both s3 [...] 
 Content analysis details:   (-0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [148.163.158.5 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1nzjU9-0005bM-Oi
Subject: Re: [f2fs-dev] [PATCH 06/10] hugetlbfs: Convert
 remove_inode_hugepages() to use filemap_get_folios()
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
Cc: linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org, gor@linux.ibm.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 Sumanth Korikkar <sumanthk@linux.ibm.com>, linux-ext4@vger.kernel.org,
 agordeev@linux.ibm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, 10 Jun 2022 17:52:05 +0200
Sumanth Korikkar <sumanthk@linux.ibm.com> wrote:

[...]
> 
> * Bisected the crash to this commit.
> 
> To reproduce:
> * clone libhugetlbfs:
> * Execute, PATH=$PATH:"obj64/" LD_LIBRARY_PATH=../obj64/ alloc-instantiate-race shared
>  
> Crashes on both s390 and x86. 

FWIW, not really able to understand the code changes, so I added some
printks to track the state of inode->i_data.nrpages during
remove_inode_hugepages().

Before this commit, we enter with nrpages = 99, and leave with nrpages = 0.
With this commit we enter with nrpages = 99, and leave with nrpages = 84
(i.e. 99 - PAGEVEC_SIZE), resulting in the BUG later in fs/inode.c:612.

The difference seems to be that with this commit, the outer
while(filemap_get_folios) loop is only traversed once, while before
the corresponding while(pagevec_lookup_range) loop was repeated until
nrpages reached 0 (in steps of 15 == PAGEVEC_SIZE for the inner loop).

Both before and after the commit, the pagevec_count / folio_batch_count
for the inner loop starts with 15, but before the pagevec_lookup_range()
also increased &next in steps of 15, while now the filemap_get_folios()
moved &next from 0 to 270 in one step, while still only returning
15 as folio_batch_count for the inner loop. I assume the next index
of 270 is then too big to find any other folios, so it stops after the
first iteration, even though only 15 pages have been processed yet with
remove_huge_page(&folio->page).

I guess it is either wrong to return 15 as folio_batch_count (although
it seems that would be the maximum possible value), or it is wrong to
advance &next by 270 instead of 15.

Hope that makes any sense, and might be of help for debugging, to someone
more familiar with this code.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
