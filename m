Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 965AB637088
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 24 Nov 2022 03:38:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oy28K-0007dj-Cl;
	Thu, 24 Nov 2022 02:38:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1oy28I-0007da-JI
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Nov 2022 02:38:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VKev0jQzTpfRiYlqyhMB/x5/P0962C4hsyFZd8JrjX4=; b=Mdlbb+4Uf/Av9BO6CiVGjPsQv3
 rdVfUU3uXpe0ihoWFdCAlcm3fBCYy5s+ZLrULCLzmQjXDIoc0rykI1ddZ0qX1Q3Y/713nzfy+Wun5
 h2BeH5KJphO5WuHHL1bPYPjMdxj1XKNnYKs74y8p+XRJCDWpca/QXmfz0RVjpyxnkQXY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VKev0jQzTpfRiYlqyhMB/x5/P0962C4hsyFZd8JrjX4=; b=eidROOMLsAob3KA3lf2ZR/Mxdr
 8jaAVA6knZKoohEHDnYr2PdmqJOXnxCjvbg9wpZ5xTE5qliFEz2hIwSz4zzSc94RVHnZAPQF0cbb8
 VDMbin2JW7GRiREuVeFC6HYB9cYdkvHdVhCAY2ftuv/4YN7tNc/L61a3410q7fiRzuLA=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oy28G-0000SR-KG for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Nov 2022 02:38:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4FD71B8265E;
 Thu, 24 Nov 2022 02:38:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 039B4C433C1;
 Thu, 24 Nov 2022 02:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669257505;
 bh=kqWpotENKxr+q1qoYeeXTTyZvtStzZg7ftMSFzg/1cg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=CC505dBpTLU+XRjWvIr5EjVP6+gWE8fXNlarcdQd9/Hd7lUl4qFiOhJPiMUQQOH1t
 PXs6XFdBRS/9b2lSQIfiVD0xzhzX9KTL8QTwp6A6KH/GFEHqlChqX9B3W+tn3hDlga
 hb9EP7P9fSn8xGYJwSNqZ3xn670a7+BHjoP655Dmf30zqG5KoCfP8eR8yaAO7CtFF2
 9PNdixDwV2HPHlu5BLQFOlAH6utV6qInG3IA0rHIxVwOs7CccGHVHyzIZeiwKdmxK0
 kUy2G6JyBki75C725o0/GTZlRrBS9yMfzxjdWJLqqAJSGQrfLQsKIQN5SNtNB9V0Xf
 nfh2f9Sjl1BVg==
Message-ID: <63c416b9-b5cc-7c7d-1dad-ef00d0512d93@kernel.org>
Date: Thu, 24 Nov 2022 10:38:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, Sheng Yong <shengyong@oppo.com>
References: <f508dea8-5dc3-e29e-0d8b-4d64735817ac@kernel.org>
 <20221115160155.1037163-1-shengyong@oppo.com> <Y3WKmvpz61K9pwqO@google.com>
 <cc76bc01-b1c8-e52d-02f0-daaae81306f1@kernel.org>
 <Y36QoFTGTbAAJpdX@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <Y36QoFTGTbAAJpdX@google.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/11/24 5:29,
 Jaegeuk Kim wrote: >>> + if (S_ISDIR(inode->i_mode))
 >>> + goto inherit_comp; >> >> Documentation/filesystems/f2fs.rst >> >> -
 Priority in between FS_COMPR_FL, FS_NOCOMP_FS, extens [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oy28G-0000SR-KG
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: fix to enable compress for newly
 created file if extension matches
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/11/24 5:29, Jaegeuk Kim wrote:
>>> +	if (S_ISDIR(inode->i_mode))
>>> +		goto inherit_comp;
>>
>> Documentation/filesystems/f2fs.rst
>>
>> - Priority in between FS_COMPR_FL, FS_NOCOMP_FS, extensions:
>>
>>    * compress_extension=so; nocompress_extension=zip; chattr +c dir; touch
>>      dir/foo.so; touch dir/bar.zip; touch dir/baz.txt; then foo.so and baz.txt
>>      should be compresse, bar.zip should be non-compressed. chattr +c dir/bar.zip
>>      can enable compress on bar.zip.
>>
>> It looks nocompress_extension has higher priority than flag inheriting?
> 
> I think so.

Hi Sheng, Jaegeuk,

Yup, I guess I misunderstand the code. :)

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
