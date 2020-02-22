Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D743168ADA
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 22 Feb 2020 01:15:48 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j5ISN-0005ZC-7d; Sat, 22 Feb 2020 00:15:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jhubbard@nvidia.com>) id 1j5ISL-0005Yy-M0
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 22 Feb 2020 00:15:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Xu1W/y2f9OTxnj+6T8DBBjck/f2ICJjqDeKYJhM73bw=; b=T1lZSGQ0OPzJrvDMRlmRzOQFsO
 o01JJXgGrjlUxf1VkgUwj3Ja2sgY4G3wuZDeP6GEtQrMJhx6ylD7aifupJrw/nLtyCrB78u9VDTRG
 /jIYH7OXZyv4u25jdakbeJN0Nnp7JuF9T63lXPwHYOXRS8acJH7E141QWS5kiy2ujd08=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Xu1W/y2f9OTxnj+6T8DBBjck/f2ICJjqDeKYJhM73bw=; b=Xt7RKU1Go9c3u2sfEAh/m16mvV
 2vZY7q1/n9Z8C4zNQQkDQZ+jMS/ZFxCyr7HeQMFOIPtiM5kzvNv+XGNGz6M+Kxj0uTlp4aO98J5yO
 mUr5LwGm7QhLovcv8AFU5fr0SuzEcEE84Nvfbn2Peo4Vled8QMqwzDz4C0M80NFhMb9s=;
Received: from hqnvemgate25.nvidia.com ([216.228.121.64])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j5ISH-00D9zM-S3
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 22 Feb 2020 00:15:41 +0000
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e50727e0001>; Fri, 21 Feb 2020 16:14:54 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 21 Feb 2020 16:15:28 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 21 Feb 2020 16:15:28 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 22 Feb
 2020 00:15:28 +0000
To: Matthew Wilcox <willy@infradead.org>
References: <20200219210103.32400-1-willy@infradead.org>
 <20200219210103.32400-2-willy@infradead.org>
 <e065679e-222f-7323-9782-0c4471bb9233@nvidia.com>
 <20200221214853.GF24185@bombadil.infradead.org>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <69fa8779-3433-9d35-a1f4-f115dc86c6d8@nvidia.com>
Date: Fri, 21 Feb 2020 16:15:27 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200221214853.GF24185@bombadil.infradead.org>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1582330494; bh=Xu1W/y2f9OTxnj+6T8DBBjck/f2ICJjqDeKYJhM73bw=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=p2+0C6I2/yxvNQ1pZnv87YfPksTddG+e8cc03+sVRvODjU2CaK7MWQBiokHBWhwgb
 ieVI22Ga85j5LMOJVhYhtaccRh8zhO2H+xRsWBU/P8jaMdk1KeAHP1UgdQZbuh/fxI
 hzO1rCi0fPdivx/Gdy87keJKQLfBTMl82lrGPg+HtMx4bbn1scu0JW30tCh15BSQmD
 mQSimv7RYwfVWTinVZWGntdq5fdSKt8II8eY04QJynTy8RS0zcVz5otr5kwPPCZ2pE
 v1Ek68IoRy4J0my4VYUXkHH4q/cEli9/t/FTx/7/JWNBZEw7tWg2FKjPvsTsMCyd6G
 n45AbsLmye9OQ==
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
X-Headers-End: 1j5ISH-00D9zM-S3
Subject: Re: [f2fs-dev] [PATCH v7 01/24] mm: Move readahead prototypes from
 mm.h
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

On 2/21/20 1:48 PM, Matthew Wilcox wrote:
> On Thu, Feb 20, 2020 at 06:43:31PM -0800, John Hubbard wrote:
>> Yes. But I think these files also need a similar change:
>>
>>     fs/btrfs/disk-io.c
> 
> That gets pagemap.h through ctree.h, so I think it's fine.  It's
> already using mapping_set_gfp_mask(), so it already depends on pagemap.h.
> 
>>     fs/nfs/super.c
> 
> That gets it through linux/nfs_fs.h.
> 
> I was reluctant to not add it to blk-core.c because it doesn't seem
> necessarily intuitive that the block device core would include pagemap.h.
> 
> That said, blkdev.h does include pagemap.h, so maybe I don't need to
> include it here.

OK. Looks good (either through blkdev.h or as-is), so:

    Reviewed-by: John Hubbard <jhubbard@nvidia.com>


> 
>> ...because they also use VM_READAHEAD_PAGES, and do not directly include
>> pagemap.h yet.
> 
>>> +#define VM_READAHEAD_PAGES	(SZ_128K / PAGE_SIZE)
>>> +
>>> +void page_cache_sync_readahead(struct address_space *, struct file_ra_state *,
>>> +		struct file *, pgoff_t index, unsigned long req_count);
>>
>> Yes, "struct address_space *mapping" is weird, but I don't know if it's
>> "misleading", given that it's actually one of the things you have to learn
>> right from the beginning, with linux-mm, right? Or is that about to change?
>>
>> I'm not asking to restore this to "struct address_space *mapping", but I thought
>> it's worth mentioning out loud, especially if you or others are planning on
>> changing those names or something. Just curious.
> 
> No plans (on my part) to change the name, although I have heard people
> grumbling that there's very little need for it to be a separate struct
> from inode, except for the benefit of coda, which is not exactly a
> filesystem with a lot of users ...
> 
> Anyway, no plans to change it.  If there were something _special_ about
> it like a theoretical:
> 
> void mapping_dedup(struct address_space *canonical,
> 		struct address_space *victim);
> 
> then that's useful information and shouldn't be deleted.  But I don't
> think the word 'mapping' there conveys anything useful (other than the
> convention is to call a 'struct address_space' a mapping, which you'll
> see soon enough once you look at any of the .c files).
> 

OK, that's consistent and makes sense.


thanks,
-- 
John Hubbard
NVIDIA


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
