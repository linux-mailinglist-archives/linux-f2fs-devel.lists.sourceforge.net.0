Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AC58A163586
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Feb 2020 22:53:04 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j4Anc-0006Jx-2P; Tue, 18 Feb 2020 21:53:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jhubbard@nvidia.com>) id 1j4Ana-0006Jq-Qw
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 Feb 2020 21:52:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qfpwxWjoJAxZXMl/fVWRFqa8SVkCAfNTchKU/DsPf1w=; b=KCX31qGr2jXNX/9qmD70hkT1lK
 npOVhZMZ6Mi1FBCge7DJjGp2gvtnHFFGMA4DA26oDspDjTqAyj0PpyKLkh1d4B7cN1y1qcEmYclxP
 Djh+dfvWARb4JppZolg7qY7Hlku11iExXH5Ljr1sqrNGeojKxL/CGs3dOVP6qaW6HASw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qfpwxWjoJAxZXMl/fVWRFqa8SVkCAfNTchKU/DsPf1w=; b=VoMziu8CpkbFzmWEzDsKHGMxKo
 QqQqe9uLsWCyEbxIAA8PYYKqwJ7JRBPaeD/0kYw4TLDrK9Af7HREdmKQHboToqnyZNuX8bhot2g0y
 eT+g+5uZUk/0jVan4dW2VIVSzYiIHtDXQ9upYBFdu5qNUT4lg+vjo5y/X3ga1CUO2+oQ=;
Received: from hqnvemgate26.nvidia.com ([216.228.121.65])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j4AnZ-007NdW-3Y
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 Feb 2020 21:52:58 +0000
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e4c5ca30001>; Tue, 18 Feb 2020 13:52:35 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Tue, 18 Feb 2020 13:52:49 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Tue, 18 Feb 2020 13:52:49 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 18 Feb
 2020 21:52:48 +0000
To: Matthew Wilcox <willy@infradead.org>
References: <20200217184613.19668-1-willy@infradead.org>
 <20200217184613.19668-2-willy@infradead.org>
 <29d2d7ca-7f2b-7eb4-78bc-f2af36c4c426@nvidia.com>
 <20200218212115.GG24185@bombadil.infradead.org>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <df31e4a4-fe1a-5826-c8e1-c66e5197e071@nvidia.com>
Date: Tue, 18 Feb 2020 13:52:48 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200218212115.GG24185@bombadil.infradead.org>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1582062755; bh=qfpwxWjoJAxZXMl/fVWRFqa8SVkCAfNTchKU/DsPf1w=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=L8ru848XvUIfOJO/JXhX+NAXu7iIY1KJSx3RiY9Om4rla5Ao2A9lF+RAEJasJvP5L
 owCBjoiopItYsoex90j53Y8mnM3ktiY1MMNo8HH+kjWAdu7/XAWRA5giE/2/cgeZo1
 UzfV3lbbxYSMkVntSf7SjA5oxNk59bYCkEmDWiuTjVcx3LjHjGBJkIBzlgkhs4ZBhL
 oBrJEGs94r8uGApZIYHqfv60ijxl2jPOY76N6V1bK0kLceuPY9FEScpmq72aOxPBeV
 O9bOSJy3x3CRdtcl3DfnYeEMl70MqfhK4trIMvG7AasW+TbAnle4v8IFOUmWPDmYWd
 rkWaM8EskmDKw==
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: nvidia.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j4AnZ-007NdW-3Y
Subject: Re: [f2fs-dev] [PATCH v6 01/19] mm: Return void from various
 readahead functions
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

On 2/18/20 1:21 PM, Matthew Wilcox wrote:
> On Tue, Feb 18, 2020 at 01:05:29PM -0800, John Hubbard wrote:
>> This is an easy review and obviously correct, so:
>>
>>     Reviewed-by: John Hubbard <jhubbard@nvidia.com>
> 
> Thanks
> 
>> Thoughts for the future of the API:
>>
>> I will add that I could envision another patchset that went in the
>> opposite direction, and attempted to preserve the information about
>> how many pages were successfully read ahead. And that would be nice
>> to have (at least IMHO), even all the way out to the syscall level,
>> especially for the readahead syscall.
> 
> Right, and that was where I went initially.  It turns out to be a
> non-trivial aount of work to do the book-keeping to find out how many
> pages were _attempted_, and since we don't wait for the I/O to complete,
> we don't know how many _succeeded_, and we also don't know how many
> weren't attempted because they were already there, and how many weren't
> attempted because somebody else has raced with us and is going to attempt
> them themselves, and how many weren't attempted because we just ran out
> of memory, and decided to give up.
> 
> Also, we don't know how many pages were successfully read, and then the
> system decided to evict before the program found out how many were read,
> let alone before it did any action based on that.
> 


That is even worse than I initially thought. :)


> So, given all that complexity, and the fact that nobody actually does
> anything with the limited and incorrect information we tried to provide
> today, I think it's fair to say that anybody who wants to start to do
> anything with that information can delve into all the complexity around
> "what number should we return, and what does it really mean".  In the


Yes, and now that you mention it, it's really tough to pick a single number
that answers the right questions that the user space caller might have. whew.


> meantime, let's just ditch the complexity and pretense that this number
> means anything.
> 

Definitely. Thanks for the notes here.


thanks,
-- 
John Hubbard
NVIDIA


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
