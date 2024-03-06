Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 07FCA872E88
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  6 Mar 2024 07:01:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rhkLW-0005i8-9e;
	Wed, 06 Mar 2024 06:01:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rhkLV-0005i1-9F
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 06 Mar 2024 06:01:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=W+5gH8tKzzMnWxiJj7Nc8IbOKyVEgX+3khMPZgwccI0=; b=d37CiztxN32Yzenl/n0KcxyW48
 9roA6xXIncRRLabUY4zpgh+us6GjhQp8aiZEr3ZC1gywMTqe1sIQnrjvLFYC6j9nDBDqZLiC5HNvJ
 +94F01e9NaNvZd/pXDaaB20A8WpQmvVIfgOQ6nlRJstc4GA+cLS2IEgdUl9dE9dwNCrA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=W+5gH8tKzzMnWxiJj7Nc8IbOKyVEgX+3khMPZgwccI0=; b=At9QUD3uW9G3JSSbYig0pjkPDR
 rguyT8SckNS7gKN4v8zQhfk7yh2+KvuyENUjdQKFGBzsMu1A39cqaap7b4QTyVxMS/uEUG9bgMXVQ
 gfDzGwymTGRQLTkMycFRiXLxGZ6WwR2n611BDPg7t5SVgcYGwslJt8/ONhQ3UBWDN+24=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rhkLO-0001SO-Vt for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 06 Mar 2024 06:01:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 68CD5CE1E81;
 Wed,  6 Mar 2024 06:01:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7DAAC433C7;
 Wed,  6 Mar 2024 06:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709704888;
 bh=LEXu0zftvUCaHMRtidt+R8eK9jxwX75gz0eH8GU39wc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=UsDIzB2oRSEuT5fbfzip8GjqMGoG9RMDoCZBFz9FPM+5rF9bYJk/r7QxJNeUxm2IQ
 3E2grz647YVgBtzgXs0dpU+br6ynSFd9fhsUoWr2CM5F8W1A7PdiEk+8SoeagfDgE2
 rea2b/ghmCZHTj7cI1k7f7BZvhX99fv2SV0alKHImKuXbVgys2XaPYYGGozzEDuI16
 Nm+/ejuU+f0jAwXUQhZW+neGdwytSMgfKcWKQ1xocIwVe8rhLqZsp6MH8qfsWJe1Nz
 bnafvjRj632Yl8PV/r//FWMI5a2qRCq4uzE3JZKSMocjJ++LjEDbZ3MlrWc64goSP+
 VvBBSGc5b8vDg==
Message-ID: <72a62115-8596-4697-9a1d-87aea34af1c7@kernel.org>
Date: Wed, 6 Mar 2024 14:01:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Xiuhong Wang <xiuhong.wang@unisoc.com>, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
References: <20240306034746.3722986-1-xiuhong.wang@unisoc.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240306034746.3722986-1-xiuhong.wang@unisoc.com>
X-Spam-Score: -3.1 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/3/6 11:47,
 Xiuhong Wang wrote: > The following f2fs_io
 test will get a "0" result instead of -EINVAL, > unisoc # ./f2fs_io compress
 file > unisoc # ./f2fs_io reserve_cblocks file > 0 > it's no [...] 
 Content analysis details:   (-3.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rhkLO-0001SO-Vt
Subject: Re: [f2fs-dev] [PATCH V2 1/2] f2fs: compress: relocate some
 judgments in f2fs_reserve_compress_blocks
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
Cc: ke.wang@unisoc.com, xiuhong.wang.cn@gmail.com, hongyu.jin.cn@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/3/6 11:47, Xiuhong Wang wrote:
> The following f2fs_io test will get a "0" result instead of -EINVAL,
> unisoc # ./f2fs_io compress file
> unisoc # ./f2fs_io reserve_cblocks file
>   0
> it's not reasonable, so the judgement of
> atomic_read(&F2FS_I(inode)->i_compr_blocks) should be placed after
> the judgement of is_inode_flag_set(inode, FI_COMPRESS_RELEASED).
> 
> Fixes: c75488fb4d82 ("f2fs: introduce F2FS_IOC_RESERVE_COMPRESS_BLOCKS")
> Signed-off-by: Xiuhong Wang <xiuhong.wang@unisoc.com>
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
