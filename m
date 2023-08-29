Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1220D78BF7F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Aug 2023 09:46:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qatQw-0005Tj-9r;
	Tue, 29 Aug 2023 07:46:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hao.xu@linux.dev>) id 1qatQu-0005Tc-OT
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Aug 2023 07:46:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WP3nN15JcnIGn7wEIePFcf6LVOuPCzTP32Hu73YPviw=; b=lELz5V2UNXZkNPuo1PMrIwKlW8
 r9XKoWafG17zyTHCYLa7HpqdNB0ZiTVlrYBe9mxFpGtrhHLyHkloDWIbU3J+zYpu00L0PjUGchO/g
 irhhkbb3fHOxMH4ZHDJafTY6OZlxi9Cp9LKi2j8ng8NtTJpfP9aiAnO+e3plqPbW/4f0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WP3nN15JcnIGn7wEIePFcf6LVOuPCzTP32Hu73YPviw=; b=YxhIpuXzp1IXjPGUdAfE3W6NI4
 ii4spTNXg+3/ast9wf3tDJ8ZZBGjd/aDtze4B+7tsYKLUqYsZJMERaT6fjXUr6zAo6ok+qfYE09gF
 DwpkxrorSXcITrgEo59q5dQ3bSqoBhjSwBJXI1fEs3KGpjjFH507/CaXnMVC+uu+xkH0=;
Received: from out-248.mta1.migadu.com ([95.215.58.248])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qatQu-0004Ew-E8 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Aug 2023 07:46:41 +0000
Message-ID: <c728bf3f-d9db-4865-8473-058b26c11c06@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1693295192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WP3nN15JcnIGn7wEIePFcf6LVOuPCzTP32Hu73YPviw=;
 b=ngCnTfY2JVdB7UbTvhBxaE99SXYf68v1UOzv1oD4Q4J5vfDrhRAI+RinhUow/HJ/SENsM3
 ljkpELTTwPgx4fdS1Wsi0U6qZJzH3KEWBSpgNNnZhZo9Ah7qcNPQhnBWxHwyd9Ba5JlzW/
 R7n89/DPeOOyD3xIKShExED+0gXsmv8=
Date: Tue, 29 Aug 2023 15:46:13 +0800
MIME-Version: 1.0
Content-Language: en-US
To: Matthew Wilcox <willy@infradead.org>
References: <20230827132835.1373581-1-hao.xu@linux.dev>
 <20230827132835.1373581-8-hao.xu@linux.dev>
 <ZOvA5DJDZN0FRymp@casper.infradead.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Hao Xu <hao.xu@linux.dev>
In-Reply-To: <ZOvA5DJDZN0FRymp@casper.infradead.org>
X-Migadu-Flow: FLOW_OUT
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 8/28/23 05:32, Matthew Wilcox wrote: > On Sun, Aug 27,
 2023 at 09:28:31PM +0800, Hao Xu wrote: >> From: Hao Xu <howeyxu@tencent.com>
 >> >> Add a boolean parameter for file_accessed() to support now [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1qatQu-0004Ew-E8
Subject: Re: [f2fs-dev] [PATCH 07/11] vfs: add nowait parameter for
 file_accessed()
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
Cc: Wanpeng Li <wanpengli@tencent.com>, "Darrick J . Wong" <djwong@kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Dave Chinner <david@fromorbit.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Stefan Roesch <shr@fb.com>, Clay Harris <bugs@claycon.org>,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
 codalist@coda.cs.cmu.edu, cluster-devel@redhat.com, linux-cachefs@redhat.com,
 linux-ext4@vger.kernel.org, devel@lists.orangefs.org,
 linux-cifs@vger.kernel.org, ecryptfs@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-block@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, io-uring@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 netdev@vger.kernel.org, samba-technical@lists.samba.org,
 linux-unionfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, bpf@vger.kernel.org,
 Pavel Begunkov <asml.silence@gmail.com>, linux-btrfs@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 8/28/23 05:32, Matthew Wilcox wrote:
> On Sun, Aug 27, 2023 at 09:28:31PM +0800, Hao Xu wrote:
>> From: Hao Xu <howeyxu@tencent.com>
>>
>> Add a boolean parameter for file_accessed() to support nowait semantics.
>> Currently it is true only with io_uring as its initial caller.
> 
> So why do we need to do this as part of this series?  Apparently it
> hasn't caused any problems for filemap_read().
> 

We need this parameter to indicate if nowait semantics should be 
enforced in touch_atime(), There are locks and maybe IOs in it.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
