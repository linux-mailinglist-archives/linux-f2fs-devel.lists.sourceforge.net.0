Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B9F2ADFFA
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Nov 2020 20:44:25 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kcZZ0-0002dy-LF; Tue, 10 Nov 2020 19:44:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kcZYy-0002dp-P2
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 10 Nov 2020 19:44:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Vjw6CSf6mk2FKxmqB64th38j2MiPmmodQQ84Zm7PvpA=; b=Y8LLC6rlP1oNn+g3Iz6XTrJHh8
 Ku1okK96OC+HPe6msbMBvxPI3ySyacx5Rmrt0UE3Aqa7Lr6fqw2K0fgoTux/4Atp5NzuL7099TvJG
 NShhj7mWWUI+GwmfciUrYi7cE7nghZg+Yp7FlabUUST0O99FR2+m758IaTGssIC8T9dQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Vjw6CSf6mk2FKxmqB64th38j2MiPmmodQQ84Zm7PvpA=; b=KqVXxXR6nKr267JeAfGaxCW3R5
 e1uRMY4X2VFcHhkusGn3WAlgLqdaSvogpLEKSJ696THVBeMnh3gXdIK6M1XAxCqZRKX7wcklOA0SH
 77wvJndnB/eYBBcai8p1cSqgwGzQsK8a2YBE4M6cDP2957fTVIlKNxmUx5WespdP0Tvc=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kcZYk-0076DP-Rk
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 10 Nov 2020 19:44:20 +0000
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
 [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 01B1820639;
 Tue, 10 Nov 2020 19:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605037433;
 bh=sMQ7Ir3OPkhZYJuV4Vzpb2qOUY0DKBK15rYzfrGaIEk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=x4i/Zs5pUHFxZ6aXo3zBSFYOCrWlbTbhTYXg06U8G4o34yFowsuqfCPkDD8uj7cES
 KZ1XWZ73fsaFBvVFFxe79GmHJc+gbPyubV4PcxjkOrAXWdz+6eO7Szf1hCbTIHqBbL
 FLwG3W1c+4OTeafCBxRjtksIalZ6ge/OZgcM/QVs=
Date: Tue, 10 Nov 2020 11:43:51 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <X6rtd//vuPbStYdh@sol.localdomain>
References: <20201110012437.26482-1-yuchao0@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201110012437.26482-1-yuchao0@huawei.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kcZYk-0076DP-Rk
Subject: Re: [f2fs-dev] [PATCH v5 1/2] f2fs: avoid unneeded data copy in
 f2fs_ioc_move_range()
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Nov 10, 2020 at 09:24:36AM +0800, Chao Yu wrote:
> Fields in struct f2fs_move_range won't change in f2fs_ioc_move_range(),
> let's avoid copying this structure's data to userspace.
> 
> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> ---

Reviewed-by: Eric Biggers <ebiggers@google.com>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
