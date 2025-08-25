Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A9BB333CD
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 25 Aug 2025 04:00:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9bBQxuYsyKs3EQMza9M/icRqGwnAMypR/CVNzR5N6h0=; b=jbR+UnwrIz65WjRjV6NSVVDRCu
	O8UdOlJaDsae6FHOAZYml/BtxfEZlecM+MwiCWBIu0YwOhouLlo2sT49UafFS3e9L/lD96hAu3HtH
	1mSpGC6eGWduxG3cjWc+L28c3cP8tYxEiJK7684nK/eDzV36fkS/+cZHf+3c3qBaA8j8=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uqMV7-0004Ug-9I;
	Mon, 25 Aug 2025 02:00:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uqMV5-0004Td-V0
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 25 Aug 2025 02:00:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=598FEmvBg3EikyaUDeRjN27TAEdhnu/N5/7zRwiq3kA=; b=NotNPJyyMkf3umU8fLqzM3zbaH
 ExHcWCvlkEAEtNZ+/sTpbrvHSrj1LVTd3Vp2U2o4+JD5fhO2SjwHKfYjR91VOEkSecGxhHhG7UvlT
 esQEpvCFPjKrIFdeUOxkc33ngQ6yV6n5gcPIMpWFyVXIqV1zO4DToNZUcAY6iqBLV3KI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=598FEmvBg3EikyaUDeRjN27TAEdhnu/N5/7zRwiq3kA=; b=XsVtYdKfWENDSPv1+xGwEO0DBb
 daSy6RP6Wzn7EfXNP7O7RWoQC2LKvkGA69+vBik//+nqKnOqm5tGHtEONNJEr/HPOjFkiToD+C5lr
 lTL7yQjIuovKnSJXObTavLWgdwau7cFQND4Z2ZPVHTf6yV+MQC9kfgcT8fNXWWZL84BQ=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uqMV6-0003AO-Ca for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 25 Aug 2025 02:00:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E6F6343CBB;
 Mon, 25 Aug 2025 01:59:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C30F9C4CEEB;
 Mon, 25 Aug 2025 01:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756087189;
 bh=K2xls5tsl3uvGfN17VTxAjlWiKi8UM9kbMKxwJEde1g=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=XDkVhNn8PVa/Toqm4iQdiX1h7bhMcJAr7iUxKb7W9ovg8zjGsoqesJQkaRX52PITU
 sW0QFJqKYgnshtm94qUzNDaWIcN75DGLSezjaC/JWoiaPw0vqEPC0DEJwiNaMMBxue
 sqyQk3bUUbKfe1uoNRLSAKXNuWZ16TXQiMUue6YWFX0XtA8ZNi1KQY23Wh/0lEIhSj
 O9pWtQtwPcU7FSHTuKxbUJFxLDeSjFcIbRQCKt6wSpftgCwU7+uRkew4oZ2Iv6RJQC
 LvMaqZWaonCbxQwUCa7Pw/djsrfvYVwdtYNj2RiYizvESPUs7ukJUavPMtVYOP89ao
 8MqoJPj560U6Q==
Message-ID: <d980d51c-1075-41f2-8416-64c097d3eeec@kernel.org>
Date: Mon, 25 Aug 2025 09:59:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux F2FS <linux-f2fs-devel@lists.sourceforge.net>
References: <20250820043432.22509-1-bagasdotme@gmail.com>
Content-Language: en-US
In-Reply-To: <20250820043432.22509-1-bagasdotme@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 8/20/25 12:34, Bagas Sanjaya wrote: > Hi, > > Here are
 documentation formatting cleanup for f2fs. This also includes > docs retitle
 at the end of series ([6/6]) as a bonus. > > This series is based [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uqMV6-0003AO-Ca
Subject: Re: [f2fs-dev] [PATCH 0/6] f2fs: documentation formatting cleanup
 and improvements
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Daeho Jeong <daehojeong@google.com>,
 Yangtao Li <frank.li@vivo.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Yuanye Ma <yuanye.ma20@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 8/20/25 12:34, Bagas Sanjaya wrote:
> Hi,
> 
> Here are documentation formatting cleanup for f2fs. This also includes
> docs retitle at the end of series ([6/6]) as a bonus.
> 
> This series is based on docs-next tree.

This patchset looks good to me, thanks for your work.

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,

> 
> Enjoy!
> 
> Bagas Sanjaya (6):
>   Documentation: f2fs: Separate errors mode subtable
>   Documentation: f2fs: Format compression level subtable
>   Documentation: f2fs: Span write hint table section rows
>   Documentation: f2fs: Wrap snippets in literal code blocks
>   Documentation: f2fs: Indent compression_mode option list
>   Documentation: f2fs: Reword title
> 
>  Documentation/filesystems/f2fs.rst | 88 +++++++++++++++++-------------
>  1 file changed, 50 insertions(+), 38 deletions(-)
> 
> 
> base-commit: 37c52167b007d9d0bb8c5ed53dd6efc4969a1356



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
