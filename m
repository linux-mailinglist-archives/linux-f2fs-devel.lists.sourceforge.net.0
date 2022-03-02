Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE144C9C2B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Mar 2022 04:31:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nPFiK-0003Mj-SM; Wed, 02 Mar 2022 03:31:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nPFiK-0003Mb-7g
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 02 Mar 2022 03:31:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ylh1Y6K5r/F4GJ4W9vbgCWS3eTfNC9sLFkFTW1lpcAs=; b=Tn71GqERYpw33ugERTgpb5tSJ3
 DZ2Nnp0lYY32hzJa4nge0mEnbl3rBdKZye2G0W9r0NTvIFp5Qyiut1vzJdykN0ZWW5DOceC6uhaYt
 2Kn1gChokAt0v+Zmo2K1BHnD6dvz7mvNPJNvs000BslBGS6GI+FcJYmmcY49AvCD2SuY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ylh1Y6K5r/F4GJ4W9vbgCWS3eTfNC9sLFkFTW1lpcAs=; b=VSX3oeb/6k+QvXvQN2M7E1G4gI
 7z0Y+lFXOu7FqfovQxfCdNAdLNyoVjzz/Igp93rzcZHHUHrGWBqxMQcyqx+x2Z2KVspCoP5cvC8oH
 pwos6+/H4TV7Los4T829qtVnuNGpqdffQ/mCDQ7+2hMNho3ZchyB2oCh/Os+8fQLXjGE=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nPFiH-00014t-U6
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 02 Mar 2022 03:31:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A1921B81EE3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  2 Mar 2022 03:31:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91E38C340EE;
 Wed,  2 Mar 2022 03:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646191894;
 bh=qsM3gmrIYwEhQ11fW9RTy/LatjIek7q8y931df4juyg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=rfgXM3rMn0Pn1tf0Ca2EJuktXWTtudif4ucMBoEZIbsuAIKpZVkp1l26Vl0vk8p0b
 XtL8V6KP8IP+vTqFV7BPMM2nis0T3eTHGNoxVzb9AY7amvtF/pGOK1GqtaAMp6e1Db
 k+hgLauIKtxgmqywmqytBF/By47enC3I4+Px4Y65cI8nxJYoHUeVd4P5P8+lp2/UGt
 la8bNFoBecMgOHq/mFYmvu38nj9UlrQCQipz6SCihy5wmmpfrNVyIprJMPOut1jj1t
 Zo8zG/LqSOZa5lWIsSw/NQqNCMvCKYTGZW9C+SrYuTLXGBjYQCRiLnb3tc4azSPA78
 UeE3A/8dFtZPA==
Message-ID: <3f81ebcb-c14a-ba76-5600-dcb3860d738e@kernel.org>
Date: Wed, 2 Mar 2022 11:31:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20220203174458.3598593-1-jaegeuk@kernel.org>
 <YgL/HK2aGhFUQhtZ@google.com>
 <d8216020-b439-ca77-fbe2-b68dc44fba25@kernel.org>
 <YhkhyWTqwwx1Ck67@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <YhkhyWTqwwx1Ck67@google.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/2/26 2:36, Jaegeuk Kim wrote: > On 02/25, Chao Yu
 wrote: >> On 2022/2/9 7:39, Jaegeuk Kim wrote: >>> With this patch,
 "-g android"
 enables usr/grp/proj quota by default. >>> >>> 1) -O quota : [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nPFiH-00014t-U6
Subject: Re: [f2fs-dev] [PATCH v2] mkfs.f2fs: set project quota by default
 for -g android
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/2/26 2:36, Jaegeuk Kim wrote:
> On 02/25, Chao Yu wrote:
>> On 2022/2/9 7:39, Jaegeuk Kim wrote:
>>> With this patch, "-g android" enables usr/grp/proj quota by default.
>>>
>>> 1) -O quota : enables usr/grp
>>> 2) -O project_quota -O extra_attr : enabled prj
>>> 3) -O quota -O project_quota -O extra_attr : enables usr/grp/proj
>>> 4) -g android : enables usr/grp/proj
>>> 5) -g android -O project_quota -O extra_attr : enables usr/grp/proj
>>>
>>> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
>>
>> Reviewed-by: Chao Yu <chao@kernel.org>
> 
> Is this for v3?

Yup, :)

Thanks,

> 
>>
>> Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
