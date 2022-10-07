Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C8A5F79DF
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  7 Oct 2022 16:43:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ogoZB-0000Uj-Cf;
	Fri, 07 Oct 2022 14:43:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ogoZ9-0000Uc-DK
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Oct 2022 14:43:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xC6Lg2k1ncH+UvtazPJuhsQR2uyhWJ9vyo3r1aGHr9Q=; b=apacrh1FRh8SitXksGxngiEZXi
 AaAOeS/WmFHsU+Zn8sq1vTmjLdqTEN4bJtYbYk2oYRQLL23j+RQNnZXwa/U7xloIaMRm0MclRBG8/
 cmTnUKcqGh37tY8e7xDEATeNd5N7iPKg0TMAfcc8w69iYN9JgW8mh56IBW3JDp4azZ0s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xC6Lg2k1ncH+UvtazPJuhsQR2uyhWJ9vyo3r1aGHr9Q=; b=VNLfs7A0dDSfkADOrE+n11oKgO
 S+QCNy+U6BcLmxcQfdg8gT7sfMfq1HrZ34BPkHiPrRljpga6dtTtZoMe+dSk5YdxvE9FAyuJVgVlQ
 /qmW4nwjzSRQpmXVfePsYHPe4Pt+rZorAVib2Q4d1xRotFfwKsgsARsIS/AMRPshSTN8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ogoZ8-00Fqk8-R0 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Oct 2022 14:43:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3834A61D41;
 Fri,  7 Oct 2022 14:42:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92ED5C433C1;
 Fri,  7 Oct 2022 14:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665153777;
 bh=LBsdgEgWGpm3BX3s8qMCaLUB5qE654Y2XMy0ZXH5+cM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=m7TJGIa8lsAeUcDbWY0TlC6+PGoEMwf1fZOKXsuYT21bCZOi3Etx13yGYm4hEczqj
 VpfmYuQpYOJ3cw9ktDuQNTbN0dDM0yXCAqg/CNKv7FaFYRs4QxG5XLCF+8kdOQIOIs
 4x/EPYsMHFOw/osPEOoiatG5/7n6WRUnWhfdZnen4XyRPCQ15zO9KMUSr197ZaNgxe
 xUHBQBDa8yYge54bQaXAe2NjJ9BfMQeg/LaMLtN0iNtvQ0bnbqMriSn2kgeZpkzd39
 ah4u6Ejsy85omxpweY4cpU6altgpKgsQeY4cDKmVn/zUC6a1UvDja97aKlj61ro7EM
 PHyHZrvgxhBqA==
Message-ID: <de559e06-7391-b28e-2d59-50abc68c3034@kernel.org>
Date: Fri, 7 Oct 2022 22:42:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
To: Daeho Jeong <daeho43@gmail.com>
References: <20221004171351.3678194-1-daeho43@gmail.com>
 <b1ca9048-99c5-1ab4-fb77-5fe0bbc6d4de@kernel.org>
 <CACOAw_zXTHzc5mjPchGNXkgnswZLxLEBfRoEztB7VFdV-rtpwQ@mail.gmail.com>
 <4d7f250d-19c0-acd0-dde4-752f95c5fc2a@kernel.org>
 <CACOAw_weAbKWs6qi5x9t2=L41tVUV+CKjG-BGn1gOOtgjdWYug@mail.gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CACOAw_weAbKWs6qi5x9t2=L41tVUV+CKjG-BGn1gOOtgjdWYug@mail.gmail.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/10/7 22:22, Daeho Jeong wrote: >> >> Fine to me. >>
 >> But another question is, now it allows GC to migrate blocks belong >>
 to atomic files, so, during migration, it may update extent cache, [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -2.7 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ogoZ8-00Fqk8-R0
Subject: Re: [f2fs-dev] [PATCH v4 1/2] f2fs: correct i_size change for
 atomic writes
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/10/7 22:22, Daeho Jeong wrote:
>>
>> Fine to me.
>>
>> But another question is, now it allows GC to migrate blocks belong
>> to atomic files, so, during migration, it may update extent cache,
>> once largest extent was updated, it will mark inode dirty, but after
>> this patch, it may lose the extent change? thoughts?
>>
> 
> Oh, I missed that case. Maybe we could prevent updating the i_size of
> atomic files in f2fs_update_inode() while allowing inode dirtying.

Agreed. :)

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
