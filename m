Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B35716879E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Feb 2020 20:44:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j5EE9-0002mX-Mk; Fri, 21 Feb 2020 19:44:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jhubbard@nvidia.com>) id 1j5EE8-0002mP-5l
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Feb 2020 19:44:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pQKOwwEmNmp5lZ+eX1Ols5QNnW+OORTLQJDMCsPxtEc=; b=LdvvyttcwMvz/gS1vOoMreu8p8
 9O3Rf9FjYfhCGRse2/1Hw9NCUIbZSO2KJXwL7PCSBlf8ZBXi3EOyjPaLeVDPa7wnD6mpF3HfDSSEm
 Bdt1goe8wYTHquMITFbpePKIgD4e1LEJKvaDuC3PLl12pDHWLkqov9pMDnQBT4tVA+EA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pQKOwwEmNmp5lZ+eX1Ols5QNnW+OORTLQJDMCsPxtEc=; b=eEgo0ZiQNDl1/4JFiYHBC5/DRi
 lGYLb2LJ9afWEuoVinF0cnpxrMxIp+A3cMtAivQvkvlIxQkaGgrLCoGiSg8dbkEu8+iVVQlGh7lto
 bLbgSyyASmLIzP3aIRVwMVYx3H853FyAzd7TeF8PQgmV2STtTtKV4tBkKJw/EayQ8i80=;
Received: from hqnvemgate26.nvidia.com ([216.228.121.65])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j5EE5-00D0Xt-V0
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Feb 2020 19:44:44 +0000
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e5033120000>; Fri, 21 Feb 2020 11:44:18 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 21 Feb 2020 11:44:32 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 21 Feb 2020 11:44:32 -0800
Received: from [10.2.166.200] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 21 Feb
 2020 19:44:32 +0000
To: Matthew Wilcox <willy@infradead.org>
References: <20200219210103.32400-1-willy@infradead.org>
 <20200219210103.32400-12-willy@infradead.org>
 <e6ef2075-b849-299e-0f11-c6ee82b0a3c7@nvidia.com>
 <20200221153537.GE24185@bombadil.infradead.org>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <1fd052ce-cd5e-60ce-e494-cbf6427d3ed3@nvidia.com>
Date: Fri, 21 Feb 2020 11:41:28 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200221153537.GE24185@bombadil.infradead.org>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1582314258; bh=pQKOwwEmNmp5lZ+eX1Ols5QNnW+OORTLQJDMCsPxtEc=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=lYdo4NH8M7SXphPat6doJg0oOA1V6kLXukQ7JIEh5FVkfFb0/CxKOhHQdMiRNYy87
 Q6EhPR2Fph1xqpiZaGm+fIV8Ra4pJE8E5H2Ofj6LlTy0+Qb+/+y64EhZcbjIYXrOqI
 IXR7s2kX4Yi3hnWXNuj2sU2+Joh83jXJxvw8pHXSeKQS/7ccswnLmpLkros2lxWTg/
 2U8B/Ar6NYNMOQFqfCj3j5XpjUwSHVdi0BMHCh2YVMnazsUm42RddLEt+ZRAKHCaXa
 IlYO+1WyQ2QxlFvwnZy2R5xtgMwusy7sT9ZlwHQi2bqndUATGT9KLiH14aMZETjP0i
 ow4Jt857PEIiA==
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j5EE5-00D0Xt-V0
Subject: Re: [f2fs-dev] [PATCH v7 11/24] mm: Move end_index check out of
 readahead loop
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
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 linux-mm@kvack.org, ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2/21/20 7:35 AM, Matthew Wilcox wrote:
> On Thu, Feb 20, 2020 at 07:50:39PM -0800, John Hubbard wrote:
>> This tiny patch made me pause, because I wasn't sure at first of the exact
>> intent of the lines above. Once I worked it out, it seemed like it might
>> be helpful (or overkill??) to add a few hints for the reader, especially since
>> there are no hints in the function's (minimal) documentation header. What
>> do you think of this?
>>
>> 	/*
>> 	 * If we can't read *any* pages without going past the inodes's isize
>> 	 * limit, give up entirely:
>> 	 */
>> 	if (index > end_index)
>> 		return;
>>
>> 	/* Cap nr_to_read, in order to avoid overflowing the ULONG type: */
>> 	if (index + nr_to_read < index)
>> 		nr_to_read = ULONG_MAX - index + 1;
>>
>> 	/* Cap nr_to_read, to avoid reading past the inode's isize limit: */
>> 	if (index + nr_to_read >= end_index)
>> 		nr_to_read = end_index - index + 1;
> 
> A little verbose for my taste ... How about this?


Mine too, actually. :)  I think your version below looks good.


thanks,
-- 
John Hubbard
NVIDIA

> 
>          end_index = (isize - 1) >> PAGE_SHIFT;
>          if (index > end_index)
>                  return;
>          /* Avoid wrapping to the beginning of the file */
>          if (index + nr_to_read < index)
>                  nr_to_read = ULONG_MAX - index + 1;
>          /* Don't read past the page containing the last byte of the file */
>          if (index + nr_to_read >= end_index)
>                  nr_to_read = end_index - index + 1;
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
