Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4385AAC3DB
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  7 Sep 2019 03:23:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i6PRn-00074I-3a; Sat, 07 Sep 2019 01:23:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1i6PRl-00074A-Ob
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 07 Sep 2019 01:23:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uBw4XvrIKBZGlKOP1rj2pO3VsIqQY89xbmKxouNh4Hc=; b=bIG+QCeeq/bIhgPAHmmUVurt8H
 xcYRhyNyw41bjKCCB2/1JOYcyv92uHNSEs81MVwQUx+sG/mc1lIGjdtXm0aL4CSUHm4uKT7GAz7tG
 qoi9r6lCtUFtgSuDULnADxl8SbKrglUVf0efvtS4s8M202jORGkATw8kAMObIiFDCil0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uBw4XvrIKBZGlKOP1rj2pO3VsIqQY89xbmKxouNh4Hc=; b=V05t54COBb67rWaWR6F7dRaOJp
 uSQQp4HKlEnCH8FSnN1yi8rmteJBPHy+S6GyNA9WzCM+qicFfDL9hr/ISFN+p5ysrmtqxhejAQSus
 ehV2ZfMs+niteHZBQtvKnHdj7orENr+Fq/hbY1Di0iVvpFHxwKYlvWeoyOo2NPrkFLTU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i6PRh-00CcB6-I9
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 07 Sep 2019 01:23:25 +0000
Received: from [192.168.0.103] (unknown [58.212.132.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DC1A52082C;
 Sat,  7 Sep 2019 01:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567819395;
 bh=G2qrEEZDP+ylIjE+oHbp2sIifoKcC+Sj0d+XOwYiqKg=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=d6Gi2iA2x7J2Xs5Qvy6fyPxLqpV0zG5uknZNOqx3ssG/vbfn8yYmzRKPKAcZC2F8p
 eFwYwhfpIGHdk2bTKSVnsEiEFwDeFHvBRuaailkso8jduBq2L0OrHQUAx3sTXz4SlE
 8vKf9lI1XrWiG8+ZEouRbqaYyTE0g48NHadZunXk=
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>
References: <20190906105426.109151-1-yuchao0@huawei.com>
 <20190906234808.GC71848@jaegeuk-macbookpro.roam.corp.google.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <080e8dee-4726-8294-622a-cac26e781083@kernel.org>
Date: Sat, 7 Sep 2019 09:23:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190906234808.GC71848@jaegeuk-macbookpro.roam.corp.google.com>
Content-Language: en-US
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
X-Headers-End: 1i6PRh-00CcB6-I9
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to avoid accessing uninitialized
 field of inode page in is_alive()
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

On 2019-9-7 7:48, Jaegeuk Kim wrote:
> On 09/06, Chao Yu wrote:
>> If inode is newly created, inode page may not synchronize with inode cache,
>> so fields like .i_inline or .i_extra_isize could be wrong, in below call
>> path, we may access such wrong fields, result in failing to migrate valid
>> target block.
> 
> If data is valid, how can we get new inode page?

is_alive()
{
...
	node_page = f2fs_get_node_page(sbi, nid);  <--- inode page

	source_blkaddr = datablock_addr(NULL, node_page, ofs_in_node);
...
}

datablock_addr()
{
...
	base = offset_in_addr(&raw_node->i);  <--- the base could be wrong here due to
accessing uninitialized .i_inline of raw_node->i.
...
}

Thanks,

> 
>>
>> - gc_data_segment
>>  - is_alive
>>   - datablock_addr
>>    - offset_in_addr
>>
>> Fixes: 7a2af766af15 ("f2fs: enhance on-disk inode structure scalability")
>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
>> ---
>>  fs/f2fs/dir.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
>> index 765f13354d3f..b1840852967e 100644
>> --- a/fs/f2fs/dir.c
>> +++ b/fs/f2fs/dir.c
>> @@ -479,6 +479,9 @@ struct page *f2fs_init_inode_metadata(struct inode *inode, struct inode *dir,
>>  		if (IS_ERR(page))
>>  			return page;
>>  
>> +		/* synchronize inode page's data from inode cache */
>> +		f2fs_update_inode(inode, page);
>> +
>>  		if (S_ISDIR(inode->i_mode)) {
>>  			/* in order to handle error case */
>>  			get_page(page);
>> -- 
>> 2.18.0.rc1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
