Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FB956363
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 Jun 2019 09:34:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hg2S6-0000ij-CX; Wed, 26 Jun 2019 07:34:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hg2S5-0000ic-CF
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 26 Jun 2019 07:34:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CDk6wS5Yg8j/NYKYuQ0HZVrMRF8uK35OpIM65yXZXhM=; b=BzLlwsN54aIqK+bxwq3aZsrsoW
 d7wpVJiDjpJZxGDHGdeX1oYSdjex4/Oia0t8mpC+YZBQmlnejfv9ezLBp+HiaGHOn7G3k4B8W0h1Y
 C65mEm8VYhE/4nRiFZz0HRn/RKTqY/kdooww/OyOueMYjX0BV49rKk7n61XuhQLeaE04=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CDk6wS5Yg8j/NYKYuQ0HZVrMRF8uK35OpIM65yXZXhM=; b=UlQaqN6P9dXA3uCJ1/qzKV8nZU
 HSnTMkyJ4KlsZ6dKTUaLOet9AP58qqqRQc9355nzu1aN5oDLr9NFUMNXhfYlWQKFDyShaLfYf9KPR
 EdQwYVho9/KtD587+5+5HgJTNvxxrgE65aYL8H84F4AKhcAW8dFo1EhEOR5rZrg2pXr0=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hg2SB-00AXIL-K1
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 26 Jun 2019 07:34:53 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 5C1E63B40CC181C0051E;
 Wed, 26 Jun 2019 15:34:42 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.208) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 26 Jun
 2019 15:34:37 +0800
To: Eric Biggers <ebiggers@kernel.org>
References: <20190620205043.64350-1-ebiggers@kernel.org>
 <20190620205043.64350-17-ebiggers@kernel.org>
 <90495fb1-72eb-ca42-8457-ef8e969eda51@huawei.com>
 <20190625175225.GC81914@gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <68c5a15f-f6a8-75e2-b485-0f1b51471995@huawei.com>
Date: Wed, 26 Jun 2019 15:34:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190625175225.GC81914@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hg2SB-00AXIL-K1
Subject: Re: [f2fs-dev] [PATCH v5 16/16] f2fs: add fs-verity support
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
Cc: "Theodore Y . Ts'o" <tytso@mit.edu>,
 "Darrick J . Wong" <darrick.wong@oracle.com>, linux-api@vger.kernel.org,
 Dave Chinner <david@fromorbit.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-integrity@vger.kernel.org,
 linux-ext4@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, Victor Hsieh <victorhsieh@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Eric,

On 2019/6/26 1:52, Eric Biggers wrote:
> Hi Chao, thanks for the review.
> 
> On Tue, Jun 25, 2019 at 03:55:57PM +0800, Chao Yu wrote:
>> Hi Eric,
>>
>> On 2019/6/21 4:50, Eric Biggers wrote:
>>> +static int f2fs_begin_enable_verity(struct file *filp)
>>> +{
>>> +	struct inode *inode = file_inode(filp);
>>> +	int err;
>>> +
>>
>> I think we'd better add condition here (under inode lock) to disallow enabling
>> verity on atomic/volatile inode, as we may fail to write merkle tree data due to
>> atomic/volatile inode's special writeback method.
>>
> 
> Yes, I'll add the following:
> 
> 	if (f2fs_is_atomic_file(inode) || f2fs_is_volatile_file(inode))
> 		return -EOPNOTSUPP;
> 
>>> +	err = f2fs_convert_inline_inode(inode);
>>> +	if (err)
>>> +		return err;
>>> +
>>> +	err = dquot_initialize(inode);
>>> +	if (err)
>>> +		return err;
>>
>> We can get rid of dquot_initialize() here, since f2fs_file_open() ->
>> dquot_file_open() should has initialized quota entry previously, right?
> 
> We still need it because dquot_file_open() only calls dquot_initialize() if the
> file is being opened for writing.  But here the file descriptor is readonly.
> I'll add a comment explaining this here and in the ext4 equivalent.

Ah, you're right.

f2fs_convert_inline_inode() may grab one more block during conversion, so we
need to call dquot_initialize() before inline conversion?

Thanks,

> 
> - Eric
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
