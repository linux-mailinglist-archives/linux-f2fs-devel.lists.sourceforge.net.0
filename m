Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D3557164FC9
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Feb 2020 21:24:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j4Vtg-0008Ls-Nm; Wed, 19 Feb 2020 20:24:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jhubbard@nvidia.com>) id 1j4Vtf-0008Ll-Va
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Feb 2020 20:24:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Stnn+zSSGNCFbZ988J4GuiCkm17Qbq44jVcYhuJTWJc=; b=W+hSnrDLfj3O5CurKtTkbd5V6s
 kg9iaZkwUe/Hfgz169LTDm+leL78l7EX+WJWYKvznwQr7xdaIBR/zCZY4zSyF3cPt0SMrWzoeuR07
 zKg0trwUgM9Zq0/cflxP9oEtFhrQ/GLp0C46+4/wSQ2qF8kgETJXA1Jhfc+BdNIH9WLA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Stnn+zSSGNCFbZ988J4GuiCkm17Qbq44jVcYhuJTWJc=; b=hTsj7XzQonpH3YhrwpUn6pJ5VR
 J7AX8Z68Gy9F3O7h3TbQMgTnnIM3FycmBhbcFlzfMyb2YccMqpRQpu2zubfkMlIbTVepZqfdfUmzi
 ZvMVdgtSrGlrVRGG+8hGO7TutOlMybqRJKK0CCcwsTFiznBpOA7igJ7yJeEtYEzSXLWo=;
Received: from hqnvemgate24.nvidia.com ([216.228.121.143])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j4Vtb-0083jO-HF
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Feb 2020 20:24:39 +0000
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e4d99340000>; Wed, 19 Feb 2020 12:23:16 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 19 Feb 2020 12:24:27 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 19 Feb 2020 12:24:27 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 19 Feb
 2020 20:24:27 +0000
To: Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>
References: <20200217184613.19668-1-willy@infradead.org>
 <20200217184613.19668-12-willy@infradead.org>
 <e3671faa-dfb3-ceba-3120-a445b2982a95@nvidia.com>
 <20200219144117.GP24185@bombadil.infradead.org>
 <20200219145246.GA29869@infradead.org>
 <20200219150103.GQ24185@bombadil.infradead.org>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <a5f8ba4c-8413-2633-9523-5b5941c0762b@nvidia.com>
Date: Wed, 19 Feb 2020 12:24:26 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200219150103.GQ24185@bombadil.infradead.org>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1582143796; bh=Stnn+zSSGNCFbZ988J4GuiCkm17Qbq44jVcYhuJTWJc=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=PoUTRdSyZJ3hX2dxzQISosJ/wVYoveMKl+7atg1sDrOWdAAaYMtdVxq7QyYHhh7xe
 EvTmBI7/rq4HLGscXS8LPXNBnQ1Jix4flhNHGsxk201kSI8sMpgUmQGRpk7I9BpUhS
 +KjQiwXIyu9koQoSyGAly8ElawI2qpwAoJWQDFM4pVRo/Z9yKmG/dGB+jg0mlia4Y2
 aAY4dZzfwP+DRcHOuBWJl3IdIgHWxdpwgzTmZEfGVW+WOZbqKq5bU129bePvvI5bU1
 dYKswZNLebiNLPAg01grHG4u36LomMBF2QsjP/hPLPNASaXyUhQMXbUJhq2V3Ktwp6
 cwNUY5UNidflg==
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
X-Headers-End: 1j4Vtb-0083jO-HF
Subject: Re: [f2fs-dev] [PATCH v6 07/19] mm: Put readahead pages in cache
 earlier
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2/19/20 7:01 AM, Matthew Wilcox wrote:
> On Wed, Feb 19, 2020 at 06:52:46AM -0800, Christoph Hellwig wrote:
>> On Wed, Feb 19, 2020 at 06:41:17AM -0800, Matthew Wilcox wrote:
>>> #define readahead_for_each(rac, page)                                   \
>>>         while ((page = readahead_page(rac)))
>>>
>>> No more readahead_next() to forget to add to filesystems which don't use
>>> the readahead_for_each() iterator.  Ahem.


Yes, this looks very clean. And less error-prone, which I definitely
appreciate too. :)


>>
>> And then kill readahead_for_each and open code the above to make it
>> even more obvious?
> 
> Makes sense.
> 

Great!


thanks,
-- 
John Hubbard
NVIDIA


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
