Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 857AA54D826
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 Jun 2022 04:17:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o1f4O-0005u9-Sd; Thu, 16 Jun 2022 02:17:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1o1f4N-0005u3-9S
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 16 Jun 2022 02:17:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=F0gxC+A2QvYef6NP9knKtXMg7a8DdJAqeHd1uRVZDKY=; b=BP1KeaIAYyry5dxJQ7wlxLKLQQ
 r28JU629gtPrXTJN5n/uITMGDAewkeCYyzmWW/IhpdhsuMSFy+5y4+Dbf0N7OIKsCpIb4lI/l1Is8
 jdB40vkACbP78Nvfjsv0pn/m0gIPYilX64FgehipXUGjvyuIKSWfBHD2sVqVnsRbeaNc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=F0gxC+A2QvYef6NP9knKtXMg7a8DdJAqeHd1uRVZDKY=; b=bQDNBK6e0/M3/JnY7WySEHj1C7
 uNYCKbywwe4YH9Pfk5w6wcMg9fNnzcKnoiWbrhMAjumVXOdPTenf4wkoiwxsjjvfSKSBK6XyLLmmJ
 l9O8kHTzoVROxcEo0PfKVdAW3rGk+tFjlGVD60lFkEj2BdS2Mwze/z9sGlh2YB+Uiycg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o1f4H-003Vw9-O2
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 16 Jun 2022 02:17:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4316E60ACC;
 Thu, 16 Jun 2022 02:17:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED362C3411A;
 Thu, 16 Jun 2022 02:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655345819;
 bh=quBfZ0buTZ0HigA1eN5RLjxNyb0k/NHkB21dvoj8dDo=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=WbOfUEdUrmrcmAGn/cLhA9SqbtoMI43/T9oOCZ/GtT9PzsKBQP4R2NbBNK9nDnkAT
 H/yZ2gYniJZvJl4eyugM5Iw9WhzA6VkfECXSvE0o37DCrjpFZ/6wA9nnNf7ucWTqNr
 mjVJ2f3gsCE8KGeb4H03MOhne6u4JC5tE51goRVU+FSd3qAs1ttK62iFo2ya37gsPs
 YlnCldN5/HNuyrG/1up7CSSErNBWh7jbeXXxdufw4C7wpzOxFWgnAa1pURAwGUDuUn
 +/n6nMaQaAnqCbt63qYbSZunXjrZdq82pSqQh3cKglbhuRI/shd7osRCKyKbn5doOz
 H6MqV7fMvrkVA==
Message-ID: <8cca3e79-acbf-aec6-8acd-af664a276c74@kernel.org>
Date: Thu, 16 Jun 2022 10:16:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Yufen Yu <yuyufen@huawei.com>, linux-f2fs-devel@lists.sourceforge.net
References: <20220607034043.636316-1-yuyufen@huawei.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220607034043.636316-1-yuyufen@huawei.com>
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/6/7 11:40, Yufen Yu wrote: > Usage: > dump.f2fs -I
 [inode nid] /dev/sda > > This feature can be useful for some bugs caused
 by system crash. > We not only need dump current valid node page, bu [...]
 Content analysis details:   (-7.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.2 NICE_REPLY_A           Looks like a legit reply (A)
 -1.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1o1f4H-003Vw9-O2
Subject: Re: [f2fs-dev] [PATCH v3] dump.f2fs: add -I nid to dump inode by
 scan full disk
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/6/7 11:40, Yufen Yu wrote:
> Usage:
> 	dump.f2fs -I [inode nid] /dev/sda
> 
> This feature can be useful for some bugs caused by system crash.
> We not only need dump current valid node page, but alse the history
> data in disk, which can give some clues for status change of the inode.
> 
> Signed-off-by: Yufen Yu <yuyufen@huawei.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
