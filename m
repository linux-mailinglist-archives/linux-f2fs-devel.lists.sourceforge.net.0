Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E70B1547FEF
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Jun 2022 08:57:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o0e0L-0002TH-8Q; Mon, 13 Jun 2022 06:56:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <sumanthk@linux.ibm.com>) id 1o0e0J-0002T7-QO
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 13 Jun 2022 06:56:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sg4r/3HlNtUZCzfEQKxVVhzIMzc01uTkxBUOjFJpuKA=; b=jVF6fGM8lE89F9x1CwR2bomNbO
 6rbhfOQiTQ08WOxoWBmHnARLM4qsBkvVfFthc7GKQ+H7R/NfFHsmtfjvcf4ETc6XrwmJlOLM723Q1
 cOtu911R8dpxjn9KP4osC1qe/KdvpYZaT5GQhKHIqZ+x8R/po8ZtCdF3wZJxwbLCrCHk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sg4r/3HlNtUZCzfEQKxVVhzIMzc01uTkxBUOjFJpuKA=; b=CMtiGuSNyJF5eehOXxCsgacwGH
 O2jxaenWICV/927tK5c/+6iXEh9ZMFRXXvRJDceJ+7/5lHdf/kv3iQA4bflSQgN2l68rTluDubUdL
 jC2aogwzbimCNpjyqk/hTKE4cYyeYhp4AhzANp25MerTeCGcvlT9JbfWCZj9Ug3raESY=;
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o0e0D-00H4QW-LR
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 13 Jun 2022 06:56:52 +0000
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25D5DFNr037410;
 Mon, 13 Jun 2022 06:56:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=sg4r/3HlNtUZCzfEQKxVVhzIMzc01uTkxBUOjFJpuKA=;
 b=NTLr3Rw9NouBrw7ClKulUEjebkO6A5itEqempmqPPPMIe5WxzTU1RSeuSNqgfcQn+Qel
 mpyWvvRoLkX7BBylqpkYunkyAsl/lIGSSHiWYnubBtx0gSiorItaeUnSnErhVKh1TYVb
 G6DM9VtcvymwPUdxADeoOwB370fMvCzk3ag/yA/bfNUIAGHLBm5gy/BIuEuLSd+rfBFo
 ScYM+CzYJZsSDOfTyT1jJMuHuhBoFfgAdXkwemiKCqxo5iqi4dpnLscBe+et+zL7PfDK
 I9Adon6TD+u/6m2HYQfxfvzeSbDXAYku8Dd0+d8W7hGVcYHuGVi7UIhMuQ6Gzx7IjLiC uQ== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gn53qhkpg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jun 2022 06:56:29 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25D6oulj030905;
 Mon, 13 Jun 2022 06:56:28 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma01fra.de.ibm.com with ESMTP id 3gmjp8srqq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jun 2022 06:56:28 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 25D6uOd822544728
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jun 2022 06:56:24 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DB10811C052;
 Mon, 13 Jun 2022 06:56:24 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5FC3B11C050;
 Mon, 13 Jun 2022 06:56:24 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.171.48.106])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon, 13 Jun 2022 06:56:24 +0000 (GMT)
Date: Mon, 13 Jun 2022 08:56:22 +0200
From: Sumanth Korikkar <sumanthk@linux.ibm.com>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <YqbflvrB9oEZ1whX@localhost.localdomain>
References: <20220605193854.2371230-7-willy@infradead.org>
 <20220610155205.3111213-1-sumanthk@linux.ibm.com>
 <YqO08Dsq8ZcAcWDQ@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YqO08Dsq8ZcAcWDQ@casper.infradead.org>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: avIoxhTFiSlJjY2R9CmSKMJMnKj8Jgxi
X-Proofpoint-ORIG-GUID: avIoxhTFiSlJjY2R9CmSKMJMnKj8Jgxi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-13_02,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 adultscore=0 mlxlogscore=774
 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206130029
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Jun 10, 2022 at 10:17:36PM +0100,
 Matthew Wilcox wrote:
 > On Fri, Jun 10, 2022 at 05:52:05PM +0200, Sumanth Korikkar wrote: > > To
 reproduce: > > * clone libhugetlbfs: > > * Execute, PATH=$PAT [...] 
 Content analysis details:   (-0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [148.163.158.5 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1o0e0D-00H4QW-LR
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
Cc: linux-nilfs@vger.kernel.org, gor@linux.ibm.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 gerald.schaefer@linux.ibm.com, linux-ext4@vger.kernel.org,
 agordeev@linux.ibm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jun 10, 2022 at 10:17:36PM +0100, Matthew Wilcox wrote:
> On Fri, Jun 10, 2022 at 05:52:05PM +0200, Sumanth Korikkar wrote:
> > To reproduce:
> > * clone libhugetlbfs:
> > * Execute, PATH=$PATH:"obj64/" LD_LIBRARY_PATH=../obj64/ alloc-instantiate-race shared
> 
> ... it's a lot harder to set up hugetlb than that ...
> 
> anyway, i figured it out without being able to run the reproducer.
> 
> Can you try this?
> 
> diff --git a/mm/filemap.c b/mm/filemap.c
> index a30587f2e598..8ef861297ffb 100644
> --- a/mm/filemap.c
> +++ b/mm/filemap.c
> @@ -2160,7 +2160,11 @@ unsigned filemap_get_folios(struct address_space *mapping, pgoff_t *start,
>  		if (xa_is_value(folio))
>  			continue;
>  		if (!folio_batch_add(fbatch, folio)) {
> -			*start = folio->index + folio_nr_pages(folio);
> +			unsigned long nr = folio_nr_pages(folio);
> +
> +			if (folio_test_hugetlb(folio))
> +				nr = 1;
> +			*start = folio->index + nr;
>  			goto out;
>  		}
>  	}

Yes, With the patch, The above tests works fine. 

--
Thanks,
Sumanth


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
