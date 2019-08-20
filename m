Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BAB2958B5
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Aug 2019 09:43:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hzyni-00042g-IW; Tue, 20 Aug 2019 07:43:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hzynh-00042S-AE
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 20 Aug 2019 07:43:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hlfovMA+sUd+aPFvI+Boqp/bGg5Cvp68FicDWvfzKlI=; b=fQpEMT3YVmgFihVsySHUpCT8TB
 kVVofllv+9gH8B9RKxq7cIC4TBM89nBNkPfCZRMbfAdBq0K+WZVFRWpq2GNzUVoni5LnNvpFOP8qu
 thsBstuGVL45XTHKjWv1J6G2+tT31uShBFxk6hLQkWjzCNVb5y71lJJzUG6NcmcJKslE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hlfovMA+sUd+aPFvI+Boqp/bGg5Cvp68FicDWvfzKlI=; b=K0u+ytHpdKu9DTlTqK1WT7KBkJ
 XiRoaCxiI/txRK+dkx+VbmMfBqkhKeHG/kadBi5cq6VEVpjMYwYzq59HFeBhneeyqoB/pBNNqOnP2
 W7ATUD6Pz5ptFk2vIfvcTpoyF9FRh3kdQb0ZpEVEzE4GecxWq8guxbIf4/ZjuSgPVjTg=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hzynf-00Crpd-46
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 20 Aug 2019 07:43:29 +0000
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id B4DADC8A5D2DB9292ABB;
 Tue, 20 Aug 2019 15:43:19 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.213) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 20 Aug
 2019 15:43:15 +0800
To: Chandan Rajendra <chandan@linux.ibm.com>, Chao Yu <chao@kernel.org>
References: <20190816061804.14840-1-chandan@linux.ibm.com>
 <20190816061804.14840-6-chandan@linux.ibm.com>
 <bb3dc624-1249-2418-f9da-93da8c11e7f5@kernel.org>
 <20104514.oSSJcvNEEM@localhost.localdomain>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <c4a16ead-bb85-b7db-948e-5ebe7bc4431d@huawei.com>
Date: Tue, 20 Aug 2019 15:43:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20104514.oSSJcvNEEM@localhost.localdomain>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hzynf-00Crpd-46
Subject: Re: [f2fs-dev] [PATCH V4 5/8] f2fs: Use read_callbacks for
 decrypting file data
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
Cc: ebiggers@kernel.org, tytso@mit.edu, linux-f2fs-devel@lists.sourceforge.net,
 hch@infradead.org, linux-fscrypt@vger.kernel.org, adilger.kernel@dilger.ca,
 chandanrmail@gmail.com, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/8/19 21:33, Chandan Rajendra wrote:
> On Sunday, August 18, 2019 7:15:42 PM IST Chao Yu wrote:
>> Hi Chandan,
>>
>> On 2019-8-16 14:18, Chandan Rajendra wrote:
>>> F2FS has a copy of "post read processing" code using which encrypted
>>> file data is decrypted. This commit replaces it to make use of the
>>> generic read_callbacks facility.
>>
>> I remember that previously Jaegeuk had mentioned f2fs will support compression
>> later, and it needs to reuse 'post read processing' fwk.
>>
>> There is very initial version of compression feature in below link:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git/log/?h=compression
>>
>> So my concern is how can we uplift the most common parts of this fwk into vfs,
>> and meanwhile keeping the ability and flexibility when introducing private
>> feature/step in specified filesytem(now f2fs)?
>>
>> According to current f2fs compression's requirement, maybe we can expand to
>>
>> - support callback to let filesystem set the function for the flow in
>> decompression/verity/decryption step.
>> - support to use individual/common workqueue according the parameter.
>>
>> Any thoughts?
>>
> 
> Hi,
> 
> F2FS can be made to use fscrypt's queue for decryption and hence can reuse
> "read callbacks" code for decrypting data.
> 
> For decompression, we could have a STEP_MISC where we invoke a FS provided
> callback function for FS specific post read processing? 
> 
> Something like the following can be implemented in read_callbacks(),
> 	  case STEP_MISC:
> 		  if (ctx->enabled_steps & (1 << STEP_MISC)) {
> 			  /*
> 			    ctx->fs_misc() must process bio in a workqueue
> 			    and later invoke read_callbacks() with
> 			    bio->bi_private's value as an argument.
> 			  */
> 			  ctx->fs_misc(ctx->bio);
> 			  return;
> 		  }
> 		  ctx->cur_step++;
> 
> The fs_misc() callback can be passed in by the filesystem when invoking
> read_callbacks_setup_bio().

Hi,

Yes, something like this, can we just use STEP_DECOMPRESS and fs_decompress(),
not sure, I doubt this interface may has potential user which has compression
feature.

One more concern is that to avoid more context switch, maybe we can merge all
background works into one workqueue if there is no conflict when call wants to.

static void bio_post_read_processing(struct bio_post_read_ctx *ctx)
 {
	switch (++ctx->cur_step) {
	case STEP_DECRYPT:
		if (ctx->enabled_steps & (1 << STEP_DECRYPT)) {
...
			if (ctx->separated_wq)
				return;
		}
		ctx->cur_step++;
		/* fall-through */
	case STEP_DECOMPRESS:
...
	default:
		__read_end_io(ctx->bio);

> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
