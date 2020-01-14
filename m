Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E64D13B573
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Jan 2020 23:48:50 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1irUzQ-00029E-Rr; Tue, 14 Jan 2020 22:48:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1irUzP-000298-Jp
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Jan 2020 22:48:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jUkokmDKQCLeOCenLtwHKlNT7/vdeiX3s487IdmWGtM=; b=CG7XXw0+LCB1aJwYz26IrXNrWf
 CbKdfI+95KZS9n+8tLgtOVFvuWKDY2IpdJaJQDYZv1sHFJ6iEgtRz37rebvkzOkYeoE6iJTPp3u87
 IjHHPKU94u9vIFoFx6HfbyUqGene6AR74h2YhCcijpgkxOhEVj0nyxm2+4L/0BylzS5s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jUkokmDKQCLeOCenLtwHKlNT7/vdeiX3s487IdmWGtM=; b=mwKT2goikaY4w3oW9I29E2BviT
 AuSfAMpg7pmnu3r9Ud+yhlZGEOuCtwFe5dsCmKVp9/9MSyi69ZZ8lrqt86hdY/LqNK9kJ4ql8AlrN
 4QhXkDokKGXXN9Au7i59G2cBESLrY3wAvL5z1GqUX2KcckSa0XEJ5V8Y+k8pk0o1RCiQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1irUzM-003WYd-2y
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Jan 2020 22:48:47 +0000
Received: from localhost (unknown [104.132.0.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6746B24658;
 Tue, 14 Jan 2020 22:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579042118;
 bh=BTo+94oGmlvczeWFI8XW1gn0MmSS6cijy7Lt787VDxc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=1wqhr/zvIyoptz3YKW4ycHTYco8ysZnxCeKZko3DdvqL4vQ67ayBHHvXgHUIax/As
 KiiQfd+YeZc/P2rFIN6hAERYdTuGSap4Iy7OB44xQSXGQYlrwVFFtGWwJD6zLLepJM
 5/URMDqqWf93k1OQb7FdhqTf3I471hlX2x/8Bh6Y=
Date: Tue, 14 Jan 2020 14:48:37 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200114224837.GB19274@jaegeuk-macbookpro.roam.corp.google.com>
References: <20200102190003.GA7597@jaegeuk-macbookpro.roam.corp.google.com>
 <d51f0325-6879-9aa6-f549-133b96e3eef5@huawei.com>
 <94786408-219d-c343-70f2-70a2cc68dd38@huawei.com>
 <20200106181620.GB50058@jaegeuk-macbookpro.roam.corp.google.com>
 <20200110235214.GA25700@jaegeuk-macbookpro.roam.corp.google.com>
 <3776cb0b-4b18-ae0d-16a7-a591bec77a5e@huawei.com>
 <20200111180200.GA36424@jaegeuk-macbookpro.roam.corp.google.com>
 <72418aa5-7d2a-de26-f0b5-9c839f0c3404@huawei.com>
 <20200113161120.GA49290@jaegeuk-macbookpro.roam.corp.google.com>
 <326f0049-936c-7dc4-52c3-aa64e13b2cc6@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <326f0049-936c-7dc4-52c3-aa64e13b2cc6@huawei.com>
User-Agent: Mutt/1.8.2 (2017-04-18)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1irUzM-003WYd-2y
Subject: Re: [f2fs-dev] [RFC PATCH v5] f2fs: support data compression
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 01/14, Chao Yu wrote:
> On 2020/1/14 0:11, Jaegeuk Kim wrote:
> > On 01/13, Chao Yu wrote:
> >> On 2020/1/12 2:02, Jaegeuk Kim wrote:
> >>> On 01/11, Chao Yu wrote:
> >>>> On 2020/1/11 7:52, Jaegeuk Kim wrote:
> >>>>> On 01/06, Jaegeuk Kim wrote:
> >>>>>> On 01/06, Chao Yu wrote:
> >>>>>>> On 2020/1/3 14:50, Chao Yu wrote:
> >>>>>>>> This works to me. Could you run fsstress tests on compressed root directory?
> >>>>>>>> It seems still there are some bugs.
> >>>>>>>
> >>>>>>> Jaegeuk,
> >>>>>>>
> >>>>>>> Did you mean running por_fsstress testcase?
> >>>>>>>
> >>>>>>> Now, at least I didn't hit any problem for normal fsstress case.
> >>>>>>
> >>>>>> Yup. por_fsstress
> >>>>>
> >>>>> Please check https://github.com/jaegeuk/f2fs/commits/g-dev-test.
> >>>>> I've fixed
> >>>>> - truncation offset
> >>>>> - i_compressed_blocks and its lock coverage
> >>>>> - error handling
> >>>>> - etc
> >>>>
> >>>> I changed as below, and por_fsstress stops panic the system.
> >>>>
> >>>> Could you merge all these fixes into original patch?
> >>>
> >>> Yup, let m roll up some early patches first once test results become good.
> >>
> >> I didn't encounter issue any more, how about por_fsstress test result in your
> >> enviornment? If there is, please share the call stack with me.
> > 
> > Sure, will do, once I hit an issue. BTW, I'm hitting another unreacheable nat
> > entry issue during por_stress without compression. :(
> 
> Did you enable any features during por_fsstress test?
> 
> I only hit below warning during por_fsstress test on image w/o compression.
> 
> ------------[ cut here ]------------
> WARNING: CPU: 10 PID: 33483 at fs/fs-writeback.c:1448 __writeback_single_inode+0x28c/0x340
> Call Trace:
>  writeback_single_inode+0xad/0x120
>  sync_inode_metadata+0x3d/0x60
>  f2fs_sync_inode_meta+0x90/0xe0 [f2fs]
>  block_operations+0x17c/0x360 [f2fs]
>  f2fs_write_checkpoint+0x101/0xff0 [f2fs]
>  f2fs_sync_fs+0xa8/0x130 [f2fs]
>  f2fs_do_sync_file+0x19c/0x880 [f2fs]
>  do_fsync+0x38/0x60
>  __x64_sys_fsync+0x10/0x20
>  do_syscall_64+0x5f/0x220
>  entry_SYSCALL_64_after_hwframe+0x44/0xa9

Does gc_mutex patch fix this?

> 
> Thanks,
> 
> > 
> > Thanks,
> > 
> >>
> >> Thanks,
> >>
> >>>
> >>>>
> >>>> >From bb17d7d77fe0b8a3e3632a7026550800ab9609e9 Mon Sep 17 00:00:00 2001
> >>>> From: Chao Yu <yuchao0@huawei.com>
> >>>> Date: Sat, 11 Jan 2020 16:58:20 +0800
> >>>> Subject: [PATCH] f2fs: compress: fix f2fs_put_rpages_mapping()
> >>>>
> >>>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> >>>> ---
> >>>>  fs/f2fs/compress.c | 30 +++++++++++++++---------------
> >>>>  1 file changed, 15 insertions(+), 15 deletions(-)
> >>>>
> >>>> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> >>>> index 502cd0ddc2a7..5c6a31d84ce4 100644
> >>>> --- a/fs/f2fs/compress.c
> >>>> +++ b/fs/f2fs/compress.c
> >>>> @@ -74,18 +74,10 @@ static void f2fs_put_compressed_page(struct page *page)
> >>>>  }
> >>>>
> >>>>  static void f2fs_drop_rpages(struct compress_ctx *cc,
> >>>> -		struct address_space *mapping, int len, bool unlock)
> >>>> +					int len, bool unlock)
> >>>>  {
> >>>>  	unsigned int i;
> >>>>  	for (i = 0; i < len; i++) {
> >>>> -		if (mapping) {
> >>>> -			pgoff_t start = start_idx_of_cluster(cc);
> >>>> -			struct page *page = find_get_page(mapping, start + i);
> >>>> -
> >>>> -			put_page(page);
> >>>> -			put_page(page);
> >>>> -			cc->rpages[i] = NULL;
> >>>> -		}
> >>>>  		if (!cc->rpages[i])
> >>>>  			continue;
> >>>>  		if (unlock)
> >>>> @@ -97,18 +89,25 @@ static void f2fs_drop_rpages(struct compress_ctx *cc,
> >>>>
> >>>>  static void f2fs_put_rpages(struct compress_ctx *cc)
> >>>>  {
> >>>> -	f2fs_drop_rpages(cc, NULL, cc->cluster_size, false);
> >>>> +	f2fs_drop_rpages(cc, cc->cluster_size, false);
> >>>>  }
> >>>>
> >>>>  static void f2fs_unlock_rpages(struct compress_ctx *cc, int len)
> >>>>  {
> >>>> -	f2fs_drop_rpages(cc, NULL, len, true);
> >>>> +	f2fs_drop_rpages(cc, len, true);
> >>>>  }
> >>>>
> >>>>  static void f2fs_put_rpages_mapping(struct compress_ctx *cc,
> >>>> -				struct address_space *mapping, int len)
> >>>> +				struct address_space *mapping,
> >>>> +				pgoff_t start, int len)
> >>>>  {
> >>>> -	f2fs_drop_rpages(cc, mapping, len, false);
> >>>> +	int i;
> >>>> +	for (i = 0; i < len; i++) {
> >>>> +		struct page *page = find_get_page(mapping, start + i);
> >>>> +
> >>>> +		put_page(page);
> >>>> +		put_page(page);
> >>>> +	}
> >>>>  }
> >>>>
> >>>>  static void f2fs_put_rpages_wbc(struct compress_ctx *cc,
> >>>> @@ -680,7 +679,8 @@ static int prepare_compress_overwrite(struct compress_ctx *cc,
> >>>>
> >>>>  		if (!PageUptodate(page)) {
> >>>>  			f2fs_unlock_rpages(cc, i + 1);
> >>>> -			f2fs_put_rpages_mapping(cc, mapping, cc->cluster_size);
> >>>> +			f2fs_put_rpages_mapping(cc, mapping, start_idx,
> >>>> +					cc->cluster_size);
> >>>>  			f2fs_destroy_compress_ctx(cc);
> >>>>  			goto retry;
> >>>>  		}
> >>>> @@ -714,7 +714,7 @@ static int prepare_compress_overwrite(struct compress_ctx *cc,
> >>>>  unlock_pages:
> >>>>  	f2fs_unlock_rpages(cc, i);
> >>>>  release_pages:
> >>>> -	f2fs_put_rpages_mapping(cc, mapping, i);
> >>>> +	f2fs_put_rpages_mapping(cc, mapping, start_idx, i);
> >>>>  	f2fs_destroy_compress_ctx(cc);
> >>>>  	return ret;
> >>>>  }
> >>>> -- 
> >>>> 2.18.0.rc1
> >>>>
> >>>>
> >>>>
> >>>>>
> >>>>> One another fix in f2fs-tools as well.
> >>>>> https://github.com/jaegeuk/f2fs-tools
> >>>>>
> >>>>>>
> >>>>>>>
> >>>>>>> Thanks,
> >>>>> .
> >>>>>
> >>> .
> >>>
> > .
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
